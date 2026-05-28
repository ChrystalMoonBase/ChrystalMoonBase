# ============================================================
# CMB8LF v1 — palm_spectroscopy.py
# Tactiele Spectroscopie in de Laser Palm
# Layer 2: SWIR MEMS-FPI (Hamamatsu C15713 of trinamiX)
# Layer 3: Micro-LIBS (Hamamatsu C12880MA)
#
# Platform: Palm RP2350 (MicroPython)
# CAN output: alleen gecomprimeerde mineraalarray
# NOOIT ruwe spectraaldata over CAN bus
#
# CC0 · Chrystal Moon Base · 2026
# ============================================================
# LIBS TECHNISCHE NOOT:
#   Micro-LIBS vereist hoge piekvermogens (>100 kW, ns pulsen)
#   De bestaande 808nm 2W CW diode laser is niet direct geschikt
#   Aanpassing: korte pulsdrivers (IXYS IXDD614 of gelijkwaardig)
#   kunnen microseconde pulsen genereren van ~50-500 mA burst
#   Alternatief: dedicated LIBS laser module (apart component)
#   In vacuüm is plasmadrempel lager → meer kans op succes
#   Status: experimenteel — validatie vereist in fase 2
# ============================================================

import time
from machine import Pin, SPI, I2C, ADC

# ── HARDWARE PINS (Palm RP2350) ───────────────────────────────
SPI_SCK   = 10   # SPI klok
SPI_MOSI  = 11   # SPI data naar sensor
SPI_MISO  = 12   # SPI data van sensor
SPI_CS_SWIR  = 13  # Chip select SWIR (C15713)
SPI_CS_LIBS  = 14  # Chip select LIBS (C12880MA)
I2C_SDA   = 4    # I2C data
I2C_SCL   = 5    # I2C klok
LIBS_TRIGGER = 6 # GPIO trigger voor LIBS meting
LIBS_PULSE   = 7 # Puls driver trigger (laser Q-switch)

spi = SPI(1, baudrate=5_000_000,
          sck=Pin(SPI_SCK),
          mosi=Pin(SPI_MOSI),
          miso=Pin(SPI_MISO))
i2c = I2C(0, sda=Pin(I2C_SDA), scl=Pin(I2C_SCL), freq=400_000)

libs_trigger = Pin(LIBS_TRIGGER, Pin.OUT, value=0)
libs_pulse   = Pin(LIBS_PULSE,   Pin.OUT, value=0)
swir_cs      = Pin(SPI_CS_SWIR,  Pin.OUT, value=1)
libs_cs      = Pin(SPI_CS_LIBS,  Pin.OUT, value=1)

# Referentie emissiegolflengten voor LIBS (nm)
LIBS_EMISSION_LINES = {
    "Si":  [212.4, 251.6, 288.2],  # Silicium
    "Al":  [308.2, 309.3, 394.4],  # Aluminium
    "Ca":  [393.4, 396.8, 422.7],  # Calcium
    "Fe":  [374.5, 438.4, 526.9],  # IJzer
    "Mg":  [279.6, 280.3, 285.2],  # Magnesium
    "Ti":  [334.2, 336.1, 337.3],  # Titanium
}

# SWIR absorptiebanden voor materiaalidentificatie (nm)
SWIR_ABSORPTION_BANDS = {
    "H2O_ice":     [1490, 1520, 1820],   # Water-ijs absorptie
    "OH_hydroxyl": [1380, 1410],          # OH-groepen in mineralen
    "feldspar":    [1550, 1750],          # Feldspaat textuur
    "pyroxene":    [1650, 1900],          # Pyroxeen
}

# ── SWIR MEMS-FPI SPECTROMETER ────────────────────────────────
class SWIRSpectrometer:
    """
    Hamamatsu C15713 MEMS Fabry-Perot Interferometer
    Bereik: 1150-2150nm (instelbaar via FPI spanning)
    Interface: SPI + I2C controle

    Gebruik: pre-sinter check
    - Detecteert H2O ijs aanwezigheid
    - Identificeert feldspar textuur
    - Bepaalt vochtgehalte regoliet
    Massa: ~20 gram
    """

    C15713_ADDR = 0x18  # I2C voor controle registers

    def __init__(self):
        self._calibrated = False
        self._scan_range = (1500, 1850)  # nm — relevant bereik

    def begin_scan(self, start_nm: int = 1500,
                   end_nm: int = 1850) -> bool:
        """Start spectrale scan over opgegeven golflengtebereik."""
        try:
            # Stel FPI spanning in via I2C
            ctrl_byte = int((start_nm - 1150) / 1000 * 255)
            i2c.writeto_mem(self.C15713_ADDR, 0x01,
                            bytes([ctrl_byte]))
            time.sleep_ms(50)  # Stabilisatie FPI
            return True
        except OSError:
            print("[SWIR] Sensor niet bereikbaar")
            return False

    def read_spectrum(self) -> list:
        """
        Lees spectrum uit als lijst van intensiteitswaarden.
        Elke waarde correspondeert met één FPI stap (~5nm/stap).
        Return: lijst van 70 floats (1500-1850nm @ 5nm stap)
        """
        spectrum = []
        try:
            swir_cs.value(0)
            n_steps = 70
            for step in range(n_steps):
                # Stel golflengte in
                lam = self.SWIR_ABSORPTION_BANDS  # only used as ref
                ctrl = int(step * 255 / n_steps)
                i2c.writeto_mem(self.C15713_ADDR, 0x01, bytes([ctrl]))
                time.sleep_ms(5)
                # Lees ADC waarde
                raw = spi.read(2)
                val = (raw[0] << 8 | raw[1]) / 65535.0
                spectrum.append(val)
            swir_cs.value(1)
        except Exception as e:
            print(f"[SWIR] Leesfout: {e}")
            spectrum = [0.5] * 70  # fallback
        return spectrum

    def analyse(self) -> dict:
        """
        Volledige SWIR analyse pipeline.
        Return: gecomprimeerde materiaalinfo voor CAN bus.
        Ruwe spectrum blijft lokaal op RP2350.
        """
        if not self.begin_scan():
            return {}

        spectrum = self.read_spectrum()

        # Detecteer H2O ijs via absorptiediepte
        # IJsabsorptie bij ~1490nm en ~1820nm
        low_idx  = 0    # ~1500nm
        ice_idx1 = -2   # ~1820nm
        baseline = spectrum[35]  # ~1675nm (geen absorptie verwacht)

        ice_depth = baseline - spectrum[ice_idx1]
        ice_detected = ice_depth > 0.08  # drempel na kalibratie

        # Feldspar check via absorptie ~1550nm
        feldspar_idx = 10  # ~1550nm
        feldspar_depth = baseline - spectrum[feldspar_idx]
        feldspar_detected = feldspar_depth > 0.05

        # OH check ~1410nm
        oh_idx = 2  # ~1510nm (benadering)
        oh_present = baseline - spectrum[oh_idx] > 0.06

        result = {
            "ice_detected":       ice_detected,
            "ice_depth":          round(ice_depth, 3),
            "feldspar_detected":  feldspar_detected,
            "oh_present":         oh_present,
            "safe_to_sinter":     not ice_detected,  # ijs vereist ander protocol
            "sensor":             "SWIR-C15713",
        }
        print(f"[SWIR] Ijs: {'JA ⚠' if ice_detected else 'nee'} | "
              f"Feldspaat: {'ja' if feldspar_detected else 'nee'} | "
              f"Veilig sinteren: {'ja' if result['safe_to_sinter'] else 'NEE'}")
        return result


# ── MICRO-LIBS SPECTROMETER ───────────────────────────────────
class MicroLIBS:
    """
    Hamamatsu C12880MA micro-spectrometer voor LIBS
    Bereik: 340-850nm · Massa: 5 gram · Interface: SPI

    LIBS principe:
    1. Korte laserpuls (µs) op monster → plasma
    2. C12880MA leest atomaire emissielijnen
    3. RP2350 berekent oxidesamenstelling
    4. Stuurt alleen resultaat via CAN (niet ruwe spectrum)

    TECHNISCHE NOOT:
    De bestaande 808nm CW diodeLaser vereist een pulsdriver
    voor LIBS. Korte stroompieken (10-500µs, hoge stroomdichtheid)
    genereren voldoende energie voor plasma bij 1mm afstand.
    In vacuüm is de plasmadrempel lager → hogere kans op succes.
    Validatie vereist in experimentele fase.

    Massa: 5 gram
    """

    # C12880MA pixel-golflengte tabel (vereenvoudigd)
    # 288 pixels van 340nm tot 850nm
    N_PIXELS = 288
    WL_START  = 340.0  # nm
    WL_END    = 850.0  # nm
    WL_STEP   = (WL_END - WL_START) / N_PIXELS  # ~1.77 nm/pixel

    # Referentie emissiepieken per element (nm) + pixel index
    EMISSION_PIXELS = {
        "Si":  [int((288.2 - WL_START) / WL_STEP),
                int((251.6 - WL_START) / WL_STEP)],
        "Al":  [int((308.2 - WL_START) / WL_STEP),
                int((309.3 - WL_START) / WL_STEP)],
        "Ca":  [int((393.4 - WL_START) / WL_STEP),
                int((396.8 - WL_START) / WL_STEP)],
        "Fe":  [int((374.5 - WL_START) / WL_STEP),
                int((438.4 - WL_START) / WL_STEP)],
        "Mg":  [int((279.6 - WL_START) / WL_STEP)],
        "Ti":  [int((337.3 - WL_START) / WL_STEP)],
    }

    # Oxide-element conversie (stoichiometrisch)
    OXIDE_FACTORS = {
        "SiO2":  ("Si",  2.139),
        "Al2O3": ("Al",  1.890),
        "CaO":   ("Ca",  1.399),
        "FeO":   ("Fe",  1.286),
        "MgO":   ("Mg",  1.658),
        "TiO2":  ("Ti",  1.668),
    }

    def __init__(self, palm_id: int = 1):
        self.palm_id    = palm_id
        self._n_shots   = 3     # aantal LIBS pulsen voor gemiddelde
        self._delay_ms  = 2     # ms tussen pulsen (koeling)

    def _trigger_laser_pulse(self):
        """
        Activeer korte laserpuls voor LIBS plasma.
        Pulsdriver stuurt hoog-stroom µs puls naar L1 diode.
        TECHNISCHE NOOT: dit is experimenteel — zie module docstring.
        """
        libs_pulse.value(1)
        time.sleep_us(50)    # 50µs puls
        libs_pulse.value(0)
        time.sleep_us(500)   # Wacht op plasma emissie

    def _read_spectrum(self) -> list:
        """
        Lees C12880MA spectrum uit via SPI.
        Return: lijst van 288 floats (ADC intensiteiten).
        """
        libs_trigger.value(1)   # Start integratie
        time.sleep_us(100)      # Integratietijd 100µs
        libs_trigger.value(0)

        # Klok 288 pixels uit via SPI
        libs_cs.value(0)
        raw = spi.read(self.N_PIXELS * 2)  # 2 bytes per pixel
        libs_cs.value(1)

        spectrum = []
        for i in range(self.N_PIXELS):
            val = (raw[i*2] << 8 | raw[i*2+1]) / 65535.0
            spectrum.append(val)
        return spectrum

    def _extract_element_intensities(self, spectrum: list) -> dict:
        """
        Extraheer emissie-intensiteit per element uit spectrum.
        Gebruikt piekselectie op bekende emissiegolflengten.
        """
        intensities = {}
        for element, pixels in self.EMISSION_PIXELS.items():
            # Neem maximum van bekende emissiepieken
            vals = []
            for px in pixels:
                if 0 <= px < len(spectrum):
                    # Lokaal maximum rondom piekpixel
                    window = spectrum[max(0, px-2):min(len(spectrum), px+3)]
                    vals.append(max(window) if window else 0.0)
            intensities[element] = max(vals) if vals else 0.0
        return intensities

    def _calibrate_to_oxides(self, intensities: dict) -> dict:
        """
        Converteer elementintensiteiten naar oxide gewichtspercentages.
        Vereenvoudigd model — nauwkeurige kalibratie met
        referentiestandaarden vereist na eerste build.
        """
        # Totale intensiteit als normalisatiefactor
        total = sum(intensities.values()) or 1.0

        # Elementfracties (genormaliseerd)
        fractions = {el: val / total for el, val in intensities.items()}

        # Converteer naar oxides
        oxides = {}
        for oxide, (element, factor) in self.OXIDE_FACTORS.items():
            fraction = fractions.get(element, 0.0)
            oxides[oxide] = round(fraction * factor * 100, 1)

        # Normaliseer naar 100%
        total_oxide = sum(oxides.values()) or 1.0
        oxides = {k: round(v / total_oxide * 100, 1)
                  for k, v in oxides.items()}
        return oxides

    def measure(self) -> dict:
        """
        Volledige LIBS meting pipeline.
        Meerdere schoten → gemiddeld spectrum → oxidesamenstelling.

        Return: gecomprimeerde oxide-array voor CAN bus.
        Ruwe spectra blijven lokaal.
        """
        print(f"[LIBS] Start meting ({self._n_shots} schoten)...")
        all_spectra = []

        for shot in range(self._n_shots):
            self._trigger_laser_pulse()
            spectrum = self._read_spectrum()
            all_spectra.append(spectrum)
            time.sleep_ms(self._delay_ms)

        # Gemiddeld spectrum
        avg = [sum(s[i] for s in all_spectra) / len(all_spectra)
               for i in range(self.N_PIXELS)]

        # Extractie en berekening
        intensities = self._extract_element_intensities(avg)
        oxides      = self._calibrate_to_oxides(intensities)

        # Peary highland check
        is_anorthosite = (oxides.get("SiO2",  0) > 40 and
                          oxides.get("Al2O3", 0) > 15)
        has_iron       = oxides.get("FeO",    0) > 5

        result = {
            "oxides_pct":      oxides,
            "is_anorthosite":  is_anorthosite,
            "has_iron_oxide":  has_iron,
            "sensor":          "LIBS-C12880MA",
            "shots":           self._n_shots,
        }

        print(f"[LIBS] SiO2:{oxides.get('SiO2',0):.0f}% "
              f"Al2O3:{oxides.get('Al2O3',0):.0f}% "
              f"CaO:{oxides.get('CaO',0):.0f}% "
              f"FeO:{oxides.get('FeO',0):.0f}%")
        return result

    def adapt_sinter_protocol(self, oxides: dict) -> dict:
        """
        Pas sinterprotocol real-time aan op basis van LIBS resultaat.
        Hogere Al2O3 = hoger smeltpunt = langere L1 puls nodig.
        Meer FeO = meer NIR absorptie = kortere L1 puls kan volstaan.
        """
        al2o3 = oxides.get("Al2O3", 24)   # Peary default
        feo   = oxides.get("FeO",   5)

        # Basis puls 300ms (Peary highland default)
        l1_pulse_ms = 300

        # Hogere Al2O3 = hoger smeltpunt
        if al2o3 > 30:
            l1_pulse_ms += 80   # Extra tijd nodig
        elif al2o3 < 15:
            l1_pulse_ms -= 50   # Lager smeltpunt

        # Meer FeO = meer NIR absorptie = minder puls nodig
        if feo > 10:
            l1_pulse_ms -= 60
        elif feo < 3:
            l1_pulse_ms += 40

        l1_pulse_ms = max(100, min(600, l1_pulse_ms))  # Limieten

        # Anneal ramp aanpassen
        # Hogere Al2O3 = meer thermische stress = langzamere afkoeling
        anneal_ramp = 0.012  # default duty/s
        if al2o3 > 30:
            anneal_ramp = 0.008   # langzamer
        elif feo > 10:
            anneal_ramp = 0.015   # sneller mag

        protocol = {
            "l1_pulse_ms":   l1_pulse_ms,
            "anneal_ramp":   anneal_ramp,
            "adapted_for":   oxides,
        }
        print(f"[LIBS] Protocol aangepast: L1={l1_pulse_ms}ms "
              f"ramp={anneal_ramp:.3f}")
        return protocol


# ── GEÏNTEGREERDE PALM SENSOR SUITE ──────────────────────────
class PalmSensorSuite:
    """
    Beheert alle sensoren in één palm:
    - SWIR spectrometer (pre-sinter check)
    - Micro-LIBS (oxide compositie)
    - MLX90614 (thermisch, al aanwezig)

    Dataflow:
    1. SWIR → ijs en vocht check → go/no-go sinter
    2. LIBS → oxidesamenstelling → protocol aanpassing
    3. Resultaten → CAN bus naar Pi5 (gecomprimeerd)
    """

    def __init__(self, palm_id: int, can_uart):
        self.palm_id = palm_id
        self.uart    = can_uart
        self.swir    = SWIRSpectrometer()
        self.libs    = MicroLIBS(palm_id)

    def pre_sinter_check(self) -> dict:
        """
        Voer volledige pre-sinter analyse uit.
        Return: samengevat go/no-go met protocol parameters.
        """
        print(f"\n[PALM-{self.palm_id}] Pre-sinter spectroscopische check")
        print(f"[PALM-{self.palm_id}] SWIR scan...")
        swir_result = self.swir.analyse()

        if not swir_result.get("safe_to_sinter", True):
            print(f"[PALM-{self.palm_id}] ⚠ SWIR: ijs aanwezig — sinter aangepast")

        print(f"[PALM-{self.palm_id}] LIBS meting...")
        libs_result = self.libs.measure()

        # Pas protocol aan op LIBS data
        protocol = self.libs.adapt_sinter_protocol(
            libs_result.get("oxides_pct", {}))

        # Samenvatting voor CAN bus
        summary = {
            "palm":        self.palm_id,
            "ice":         swir_result.get("ice_detected", False),
            "safe":        swir_result.get("safe_to_sinter", True),
            "oxides":      libs_result.get("oxides_pct", {}),
            "l1_pulse_ms": protocol["l1_pulse_ms"],
            "anneal_ramp": protocol["anneal_ramp"],
        }

        # Stuur gecomprimeerde data naar Pi5 via UART → CAN
        import json
        self.uart.write(f"SPEC:{json.dumps(summary)}\n")
        print(f"[PALM-{self.palm_id}] Spectro naar Pi5 gestuurd")
        return summary
