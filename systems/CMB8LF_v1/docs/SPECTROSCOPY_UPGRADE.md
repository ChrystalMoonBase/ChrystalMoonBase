# CMB8LF-S1 — Spectroscopische Sensor Suite
## Gelaagde Materiaalanalyse voor ISRU Optimalisatie
**CC0 · Chrystal Moon Base · 2026**

---

## Concept

Drie complementaire spectroscopische sensoren op twee niveaus:

```
MACRO (hoofd)     HSI hyperspectrale camera → scenescan → SLAM kaart
                  "Waar is interessant materiaal?"

TACTIEL (palm)    SWIR spectrometer → pre-sinter check
                  "Is het veilig en goed om hier te sinteren?"

ATOMAIR (palm)    Micro-LIBS → oxidesamenstelling
                  "Wat zit er exact in dit materiaal?"
                  → past sinterprotocol real-time aan
```

---

## Sensor 1 — Macro: Hyperspectrale Camera (HSI)

| Parameter | Waarde |
|---|---|
| Hardware | Ximea xiSpec / Imec mosaic snapshot sensor |
| Spectral range | ~470-900nm (zichtbaar + nabij-IR) |
| Interface | USB3 rechtstreeks op Pi5 |
| Massa | <30 gram |
| Positie | Hoofd — naast RPLIDAR A1M8 |
| Processing | Pi5 lokaal — spectrale unmixing |

**Output naar SLAM:**
- Mineralogische kaart per cameraframe
- Ijs-detectie zones (hoge ISRU prioriteit)
- Ilmeniet zones (zuurstofextractie potentieel)
- Anorthosiet zones (beste sinterlocaties)

---

## Sensor 2 — Tactiel: SWIR MEMS-FPI Spectrometer

| Parameter | Waarde |
|---|---|
| Hardware | Hamamatsu C15713 (MEMS Fabry-Perot + InGaAs) of trinamiX NIR/SWIR |
| Spectral range | 1150-2150nm (instelbaar) — gebruik 1500-1850nm |
| Interface | SPI + I2C controle naar Palm RP2350 |
| Massa | ~20 gram |
| Positie | Laser palm — naast laserboringen |

**Detectie:**
- H2O moleculair waterijs (absorptie 1490nm + 1820nm)
- OH-groepen (1380nm + 1410nm)
- Feldspar textuur (1550nm + 1750nm)
- Pyroxeen (1650nm + 1900nm)

**Pre-sinter beslissing:**
- IJsaanwezig? → Aangepast protocol (geen directe hitte op ijs)
- Vochtig? → Langere pre-heat fase
- Feldspaat aanwezig? → Standaard Peary protocol

---

## Sensor 3 — Atomair: Micro-LIBS Spectrometer

| Parameter | Waarde |
|---|---|
| Hardware | Hamamatsu C12880MA micro-spectrometer |
| Spectral range | 340-850nm · 288 pixels |
| Massa | 5 gram |
| Interface | SPI + GPIO trigger naar Palm RP2350 |
| Positie | Laser palm |

**Gedetecteerde elementen → oxides:**

| Element | Emissiegolflengten | Oxide |
|---|---|---|
| Si | 251.6, 288.2nm | SiO2 |
| Al | 308.2, 309.3nm | Al2O3 |
| Ca | 393.4, 396.8nm | CaO |
| Fe | 374.5, 438.4nm | FeO |
| Mg | 279.6, 285.2nm | MgO |
| Ti | 334.2, 337.3nm | TiO2 |

**Real-time protocol aanpassing:**
```
Meer Al2O3 → hogere smeltpunt → langere L1 puls
Meer FeO   → meer NIR absorptie → kortere L1 puls
Resultaat  → sinterprotocol automatisch geoptimaliseerd
```

---

## LIBS Laser Technische Noot

⚠ De bestaande 808nm 2W CW diode laser is NIET direct geschikt voor LIBS.
LIBS vereist hoge piekvermogens (>100 kW) in nanoseconde pulsen.

**Aanpak voor prototype:**
De laser palm driver PCB wordt uitgebreid met een pulsdriver
(IXYS IXDD614 of gelijkwaardig) die korte microsecondepieken genereert.
In vacuum is de plasmadrempel lager → hogere kans op succes.

**Status:** Experimenteel concept — validatie vereist in fase 2.
**Alternatief:** Dedicated LIBS laser module (apart budget, apart component).

---

## CAN Bus Architectuur

Ruwe spectraaldata gaat NOOIT over de CAN bus.

```
Palm RP2350 interne verwerking:
  SWIR spectrum (70 punten) → ijs/vocht beslissing → 3 booleans
  LIBS spectrum (288 punten) → oxideberekening → 6 floats

CAN bericht (max 40 bytes):
  {"SiO2":45.2,"Al2O3":34.1,"CaO":12.3,"FeO":4.8,"ice":false,"l1_ms":280}
```

---

## Massa en Kosten Impact

| Sensor | Massa | Geschatte prijs | Positie |
|---|---|---|---|
| Ximea xiSpec HSI | <30g | €3.000-8.000 | Hoofd |
| Hamamatsu C15713 SWIR | ~20g | €2.000-5.000 | Palm |
| Hamamatsu C12880MA LIBS | ~5g | €200-400 | Palm |
| Bedrading en montage | ~10g | €50 | Verdeeld |
| **Totaal extra** | **~65g** | **€5.250-13.450** | |

**Totale massa impact: ~65g — verwaarloosbaar voor systeemprestaties.**

---

*SPECTROSCOPY_UPGRADE.md · CMB8LF-S1 · CC0 2026*
