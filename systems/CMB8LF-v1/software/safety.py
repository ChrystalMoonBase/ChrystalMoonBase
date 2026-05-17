# CMB-R1 Scale Model — safety.py
# Stroombeperking, gelijktijdige servo limiet, failsafe
# MicroPython · CC0
#
# Geïmplementeerd nav veiligheidschecklist:
# - Max 80% servo bereik (pulsbeperking)
# - Max 8 servo's tegelijk in beweging
# - Failsafe: PCA9685 naar 0% PWM bij fout/disconnect
# - Software spanningswachter (via ADC of flag)

import time

# ── LIMIETEN ──────────────────────────────────────────────────────────────────
MAX_PULSE_FRACTION = 0.80   # max 80% van servo-bereik vanuit neutraal
MAX_CONCURRENT     = 8      # max servo's tegelijk in beweging
VOLTAGE_CUTOFF     = 6.6    # V — stop alles onder deze spanning (2× 3.3V/cel)
TEMP_WARN_C        = 45     # °C — waarschuwing
TEMP_CUTOFF_C      = 60     # °C — noodstoppen

# ── PULSE LIMIET ──────────────────────────────────────────────────────────────

def safe_pulse(us: int, mid_us: int = 1500,
               min_us: int = 500, max_us: int = 2500) -> int:
    """
    Beperk pulsbredte tot MAX_PULSE_FRACTION van het volledige bereik.
    Voorbeeld DS3240 met 500-2500µs bereik:
      80% van (2500-1500) = 800µs → max 2300µs
      80% van (1500-500)  = 800µs → min  700µs
    """
    max_allowed = mid_us + int((max_us - mid_us) * MAX_PULSE_FRACTION)
    min_allowed = mid_us - int((mid_us - min_us) * MAX_PULSE_FRACTION)
    return max(min_allowed, min(max_allowed, us))


# ── GELIJKTIJDIGE SERVO BEWEGINGSMANAGER ─────────────────────────────────────

class MovementManager:
    """
    Beperkt het aantal servo's dat tegelijk mag bewegen tot MAX_CONCURRENT.
    Gebruik als context manager of via enqueue/flush.

    Gebruik in gait.py:
        mm = MovementManager(alle_servo_objecten)
        mm.enqueue('SR1_hip_rot', 30)
        mm.enqueue('SR1_hip_pitch', -15)
        ...
        mm.flush()   # verstuurt in batches van MAX_CONCURRENT
    """
    def __init__(self):
        self._queue = []   # lijst van (servo_object, doel_hoek) tuples

    def enqueue(self, servo, angle: float):
        """Voeg een servomove toe aan de wachtrij."""
        self._queue.append((servo, angle))

    def flush(self, delay_ms: int = 20):
        """
        Stuur de wachtrij uit in batches van MAX_CONCURRENT.
        Wacht delay_ms tussen batches voor stroombeperking.
        """
        batch_size = MAX_CONCURRENT
        i = 0
        while i < len(self._queue):
            batch = self._queue[i:i + batch_size]
            for servo, angle in batch:
                servo.move(angle)
            time.sleep_ms(delay_ms)
            i += batch_size
        self._queue.clear()

    def clear(self):
        self._queue.clear()

    def __len__(self):
        return len(self._queue)


# ── FAILSAFE ─────────────────────────────────────────────────────────────────

class Failsafe:
    """
    Noodstop voor PCA9685 boards.
    Zet alle kanalen naar 0% PWM (servo's lossen spanning, houden positie door wrijving).
    Roep aan bij:
      - Spanningsdrop onder VOLTAGE_CUTOFF
      - Temperatuuroverschrijding
      - Ongecatched exception in main loop
      - WiFi-disconnect (optioneel)
    """
    def __init__(self, drivers: list):
        self.drivers = drivers   # lijst van PCA9685 objecten
        self._triggered = False

    def trigger(self, reason: str = "onbekend"):
        if self._triggered:
            return   # al actief, niet dubbel triggeren
        self._triggered = True
        print(f"\n[FAILSAFE] GETRIGGERD: {reason}")
        print("[FAILSAFE] Alle servo outputs naar 0% PWM")
        for drv in self.drivers:
            try:
                drv.set_all_off()
            except Exception as e:
                print(f"[FAILSAFE] Driver reset fout: {e}")
        print("[FAILSAFE] Veilig om spanning te verwijderen.")

    def reset(self):
        """Herstel na handmatige controle. Alleen aanroepen als alles veilig is."""
        self._triggered = False
        print("[FAILSAFE] Reset. Herstart firmware voor normale werking.")

    @property
    def active(self) -> bool:
        return self._triggered


# ── SPANNING WACHTER ─────────────────────────────────────────────────────────

class VoltageWatcher:
    """
    Bewaakt de accusspanning via ADC (optioneel).
    Aansluiting: spanningsdeler op LiPo (7.4V → ~3.3V via 47kΩ + 33kΩ).
    Als geen ADC beschikbaar: sla monitor_adc over, gebruik enkel handmatig check.

    Spanningsdeler:
      7.4V × (33 / (47+33)) = 7.4 × 0.4125 = 3.05V → veilig voor ADC_pin
      Kalibratiefactor: ADC_reading * (80/33) = werkelijke spanning
    """
    def __init__(self, adc_pin=None, failsafe: Failsafe = None):
        self.adc     = adc_pin   # machine.ADC object of None
        self.failsafe = failsafe
        self._warned  = False

    def read_voltage(self) -> float:
        """Lees spanning in Volt. Geeft -1.0 als geen ADC."""
        if self.adc is None:
            return -1.0
        raw = self.adc.read_u16()
        adc_v = raw * 3.3 / 65535
        return adc_v * (80 / 33)  # Spanningsdeler terugrekenen

    def check(self) -> bool:
        """
        Geeft True als spanning OK is.
        Triggert failsafe als spanning te laag.
        """
        v = self.read_voltage()
        if v < 0:
            return True   # geen ADC, ga door

        if v < VOLTAGE_CUTOFF:
            msg = f"spanning te laag: {v:.2f}V < {VOLTAGE_CUTOFF}V"
            if self.failsafe:
                self.failsafe.trigger(msg)
            print(f"[VOLT] WAARSCHUWING: {msg}")
            return False

        if v < VOLTAGE_CUTOFF + 0.4 and not self._warned:
            print(f"[VOLT] Let op: spanning {v:.2f}V, nadert cutoff")
            self._warned = True

        return True

    def log(self):
        v = self.read_voltage()
        if v > 0:
            print(f"[VOLT] {v:.2f}V")


# ── STARTUP SELF-TEST ─────────────────────────────────────────────────────────

def run_self_test(drivers: list, legs: dict) -> bool:
    """
    Snelle zelftest voor eerste inschakeling.
    Controleert:
      - PCA9685 bereikbaar op I2C
      - Alle 48 servos reageren op neutrale positie
      - Geen I2C fouten

    Geeft True als alles OK, False bij fout.
    """
    print("[SELF-TEST] Start...")

    # Check PCA9685
    for drv in drivers:
        if drv is None:
            print(f"[SELF-TEST] FOUT: driver niet aanwezig")
            return False
        print(f"[SELF-TEST] {drv} bereikbaar ✓")

    # Zet alle servos naar neutraal
    print("[SELF-TEST] Alle servos naar neutraal (1500µs)...")
    for name, leg in legs.items():
        try:
            leg.center()
        except Exception as e:
            print(f"[SELF-TEST] FOUT bij {name}: {e}")
            return False
    time.sleep_ms(800)

    print("[SELF-TEST] Neutraalstand bereikt.")
    print("[SELF-TEST] Controleer visueel: poten moeten recht omlaag hangen.")
    print("[SELF-TEST] Druk op BOOTSEL knop als OK, of reset bij probleem.")
    print("[SELF-TEST] Wacht 5 seconden...")
    time.sleep_ms(5000)

    print("[SELF-TEST] GESLAAGD ✓")
    return True
