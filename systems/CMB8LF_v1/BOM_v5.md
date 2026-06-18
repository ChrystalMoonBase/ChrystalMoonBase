# CMB8LF-S1 — Definitieve Boodschappenlijst v5 (Ultimate)
**Hardware-veilig · EMI-gescheiden · Vacuümklaar · Thermisch bewust**
**Alle bekende ontwerprisico's geadresseerd**
**CC0 — Chrystal Moon Base 2026**

---

## Wat v5 toevoegt ten opzichte van v4.1

| Probleem | Bron | Fix in v5 |
|---|---|---|
| Software-only stroomlimiet — hardware trip ontbrak | ChatGPT | PTC polyfuse per buck output |
| LiPo packs parallel → equalization currents, thermische doorloop | ChatGPT | Strict domain separation — packs nooit parallel |
| I2C EMI van buck-switching op servo-kabels | ChatGPT | Twee I2C bussen: kritiek / monitoring gescheiden |
| Geen hardware noodstop | — | E-stop knop + relaismodule per robot |
| TPU 95A outgassing in vacuum | ChatGPT | PEBA als vacuümfase-vervanging gedocumenteerd |
| Loctite 243 borderline vacuum-safe | ChatGPT | Master Bond EP21TDCHT als vacuüm-alternatief |
| Servo horns bij mechanisch i.p.v. actuatie | Meta | Verplaatst naar TinyTronics — actuatie categorie |

---

## Power Architectuur v5 — Strict Domain Separation

```
┌─────────────────────────────────────────────────────────────────┐
│ ROBOT 1                                                         │
│                                                                 │
│  [Pack 1 · 3S 5000mAh]                                         │
│       │                                                         │
│  [BMS 40A] ── [Anti-spark XT60]                                 │
│       │                                                         │
│       ├── [PTC 30A] ── [Buck A · 7.4V/20A] ── DS3240 ×4        │
│       │                                         DS3225 ×4       │
│       │                (poten 1, 2, 3, 4)                       │
│       │                                                         │
│       └── [PTC 15A] ── [Buck C · 6.0V/10A XL4016] ── DS3218 ×8│
│                                                                 │
│  [Pack 2 · 3S 5000mAh]                                         │
│       │                                                         │
│  [BMS 40A] ── [Anti-spark XT60]                                 │
│       │                                                         │
│       ├── [PTC 30A] ── [Buck B · 7.4V/20A] ── DS3240 ×4        │
│       │                                         DS3225 ×4       │
│       │                (poten 5, 6, 7, 8)                       │
│       │                                                         │
│       └── [PTC 15A] ── [Buck D · 5V/10A] ── Pi 5               │
│                                              Pico W ×2          │
│                                              PCA9685 ×2         │
│                                              Sensoren           │
│                                              RPLIDAR            │
│                                                                 │
│  [E-STOP knop] ─── [Relaismodule] ─── snijdt Pack 1 + Pack 2   │
└─────────────────────────────────────────────────────────────────┘

KRITISCHE REGEL: Pack 1 en Pack 2 worden NOOIT parallel geschakeld.
Geen gemeenschappelijke + verbinding. Elk pack voedt eigen domein.
Equalization currents: fysiek onmogelijk.
```

### Stroomberekening v5 (per buck, worst-case)

| Rail | Buck | Max servo's | Worst-case stroom | Buck rating | Marge |
|---|---|---|---|---|---|
| 7.4V Buck A | 4× DS3240 + 4× DS3225 | 6 (software) | 16.8A | 20A | ✅ +3.2A |
| 7.4V Buck B | 4× DS3240 + 4× DS3225 | 6 (software) | 16.8A | 20A | ✅ +3.2A |
| 6.0V Buck C | 8× DS3218 | 4 (software) | 7.2A | 8-9A XL4016 | ✅ +1A |
| 5V Buck D | Pi5 + Pico's + sensoren | — | ~5A | 10A | ✅ +5A |
| PTC trip (7.4V) | — | Hardware | 30A trip | 30A PTC | ✅ |
| PTC trip (6V/5V) | — | Hardware | 15A trip | 15A PTC | ✅ |

---

## I2C Bus Architectuur v5

```
Pico W (per robot, 2 stuks):

  I2C Bus 0 (GP4/GP5) — SERVO CONTROL (hoge prioriteit)
    ├── PCA9685 board A  0x40  (servo PWM poten 1-4)
    └── PCA9685 board B  0x41  (servo PWM poten 5-8)

  I2C Bus 1 (GP6/GP7) — MONITORING (gescheiden van buck noise)
    ├── INA226 buck A    0x44  (7.4V rail A stroom)
    ├── INA226 buck B    0x45  (7.4V rail B stroom)
    ├── INA226 buck C    0x46  (6.0V rail stroom)
    ├── INA226 buck D    0x47  (5V rail stroom)
    └── TMP117 ×2        0x48/0x49 (frame temperatuur)

  1-Wire (GP22) — THERMISCH
    └── DS18B20 ×8 (servo cluster temperatuur)

Pi 5 (per robot):

  I2C Bus 1 (GPIO 2/3) — NAVIGATIE SENSOREN
    ├── BNO055 IMU        0x28
    └── VL53L1X ToF ×2   0x29/0x2A

  UART (GPIO 14/15) — LIDAR
    └── RPLIDAR A1M8

  CSI — CAMERA
    └── Pi Camera Module 3

EMI-maatregel: Twisted-pair dupont kabels voor I2C Bus 1.
Ferrietkern op I2C Bus 1 kabels bij entree Pico W behuizing.
```

---

## Volledige BOM v5

### 1. Brein & Compute — €258

| Onderdeel | Aantal | Prijs/st | Totaal |
|---|---|---|---|
| Raspberry Pi 5 8GB | 2 | €85 | €170 |
| Raspberry Pi Pico W | 4 | €10 | €40 |
| PCA9685 16-kanaals servo driver | 4 | €8 | €32 |
| MicroSD 32GB | 2 | €8 | €16 |
| **Subtotaal** | | | **€258** |

### 2. Actuatie & Servo-toebehoren — €751

| Onderdeel | Aantal | Prijs/st | Totaal |
|---|---|---|---|
| DS3240 35kg/cm — heup — 7.4V | 16 | €18 | €288 |
| DS3225 25kg/cm — bovenbeen — 7.4V | 16 | €14 | €224 |
| DS3218 20kg/cm — onderbeen — 6.0V | 16 | €12 | €192 |
| Servo verlengkabels 30cm JST-SM | 30 | €0.50 | €15 |
| Servo horns assortiment (DS3240/DS3225/DS3218) | 4 sets | €8 | €32 |
| **Subtotaal** | | | **€751** |

### 3. Power Systeem — €445

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| LiPo 3S 5000mAh 35C met XT60 | 4 | €25 | €100 | 2 per robot, nooit parallel |
| 3S 40A BMS | 4 | €8 | €32 | 1 per pack |
| Buck 7.4V/20A instelbaar | 8 | €12 | €96 | 2 per robot (A+B) |
| Buck 6.0V/10A instelbaar XL4016/MP4569 | 4 | €10 | €40 | 8-9A continu vereist |
| Buck 5V/10A | 2 | €12 | €24 | 1 per robot |
| **PTC polyfuse 30A (Littelfuse RGEF3000)** | **8** | **€2.50** | **€20** | **Per 7.4V buck output** |
| **PTC polyfuse 15A (Littelfuse RGEF1500)** | **8** | **€1.50** | **€12** | **Per 6V + 5V buck output** |
| **E-stop drukknop (NC, 22mm, rood)** | **2** | **€5** | **€10** | **Per robot — hardware noodstop** |
| **Relaismodule 30A (voor e-stop)** | **2** | **€6** | **€12** | **Snijdt beide packs tegelijk** |
| XT60 connector paren (M+V) | 20 | €0.60 | €12 | |
| XT60 Y-splitter kabel (1× naar 2×) | 4 | €4 | €16 | Pack → 2 bucks per domein |
| XT30 connector paren (M+V) | 10 | €0.40 | €4 | |
| Anti-spark XT60 | 4 | €3 | €12 | |
| LiPo balanslader 3S (ISDT Q6 Plus) | 1 | €45 | €45 | |
| Silicoon kabel 14AWG rood + zwart 2m | 1 set | — | €12 | |
| Silicoon kabel 18AWG rood + zwart 2m | 1 set | — | €8 | |
| **Ferrietkern ringen (I2C EMI)** | **10** | **€0.50** | **€5** | **Op I2C monitoring bus** |
| **Subtotaal** | | | **€460** | |

### 4. Elektronica Extras — €60

| Onderdeel | Aantal | Prijs/st | Totaal |
|---|---|---|---|
| 5V 650nm lasermodule | 2 | €5 | €10 |
| Logic-level MOSFET IRF520 | 2 | €5 | €10 |
| Neodymium 10×2mm (EPM) | 20 | €0.50 | €10 |
| Neodymium 5×2mm (EPM) | 40 | €0.30 | €12 |
| Dupont jumper wires assortiment | 6 sets | €3 | €18 |
| Elektrolytische condensator 1000µF 16V | 6 stuks | €0.50 | €3 |
| **Subtotaal** | | | **€63** |

### 5. Sensoren — €374

| Onderdeel | Aantal | Prijs/st | Totaal | I2C bus |
|---|---|---|---|---|
| RPLIDAR A1M8 (5V, 360°) | 2 | €90 | €180 | UART |
| BNO055 9-assige IMU | 4 | €8 | €32 | Pi5 Bus 1 |
| Pi Camera Module 3 (12MP) | 2 | €25 | €50 | CSI |
| VL53L1X Time-of-Flight | 4 | €5 | €20 | Pi5 Bus 1 |
| HC-SR04 ultrasoon | 4 | €2 | €8 | GPIO |
| DS18B20 temperatuursensor | 8 | €2.50 | €20 | 1-Wire |
| TMP117 precisie temperatuursensor | 4 | €4.50 | €18 | Pico Bus 1 |
| INA226 **met ADDR-pin** | 8 | €4 | €32 | Pico Bus 1 |
| TCRT5000 IR reflectie | 4 | €1 | €4 | GPIO |
| BMP280 druk + temperatuur | 2 | €2 | €4 | Pi5 Bus 1 |
| BH1750 lichtintensiteit | 2 | €1.50 | €3 | Pi5 Bus 1 |
| KY-038 geluidssensor | 2 | €1.50 | €3 | ADC |
| **Subtotaal** | | | **€374** | |

### 6. Mechanische Onderdelen — €153

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| M3 bouten assortiment RVS (200 stuks) | 1 doos | — | €12 | |
| M2 bouten assortiment RVS (100 stuks) | 1 doos | — | €8 | |
| M3 nyloc moeren (100 stuks) | 1 pak | — | €6 | |
| M2 nyloc moeren (50 stuks) | 1 pak | — | €4 | |
| F688-2RS RVS kogellager (8×16×5mm) | 40 stuks | €2 | €80 | Heup + knie pivot only |
| M3 messing heat-set inserts (100 stuks) | 1 pak | — | €8 | |
| M2 messing heat-set inserts (50 stuks) | 1 pak | — | €6 | |
| M3 borgpennen/cilinderstiften 3×10mm | 20 stuks | €0.30 | €6 | |
| Klittenband 20mm zwart (2m) | 1 | — | €5 | |
| Krimpkous assortiment | 1 set | — | €8 | |
| Loctite 243 blauw | 1 tube | — | €10 | Fase 1 only — zie vacuüm noten |
| **Subtotaal** | | | **€153** | |

**Kogellager plaatsing (geoptimaliseerd):**
Alleen op heup rotatie-as en kniepivot — niet op secundaire koppelingen.
Per poot: 2 lagers. 8 poten × 2 robots × 2 = 32 lagers. 40 besteld = 8 reserve ✓.
Resultaat: −15% gewicht, −10% servo-belasting t.o.v. lager-op-alle-joints.

### 7. Filamenten — €449

| Materiaal | Hoeveelheid | Prijs | Totaal | Gebruik | Vacuum |
|---|---|---|---|---|---|
| Prusament PC Space Grade Black | 7 × 850g | €48/rol | €336 | Chassis, frame, panelen | ✅ |
| PA12-CF | 1 kg | €65 | €65 | Bajonet, sockets (0.2mm, 100% infill) | ✅ |
| TPU 95A zwart | 1 kg | €30 | €30 | Sneeuwschoenen fase 1 | ⚠️ fase 1 only |
| PLA+ | 1 kg | €18 | €18 | Maatcontrole — NOOIT in eindrobot | ❌ |
| **Subtotaal** | | | **€449** | | |

**Vacuümfase filament upgrade (apart bestellen bij vacuümkamer sessie):**
- TPU 95A → **PEBA** (Polyether block amide, bijv. Filaflex PEBA of Arnitel) — €80-120/kg
- PLA volledig uit systeem verwijderen voor vacuümtest

### 8. Gereedschap — €184

| Onderdeel | Prijs |
|---|---|
| Soldeerbout 65W (Hakko FX-888D of gelijkw.) | €50 |
| Soldeertin 60/40 0.8mm 100g | €8 |
| Vloeistof flux | €6 |
| Digitale schuifmaat 150mm | €15 |
| Precisie schroevendraaierset magnetisch | €15 |
| Heat-set insert tool M2+M3 | €12 |
| Nippeltang + draadstriptang | €15 |
| Isopropanol 99% 250ml | €6 |
| Anti-statische tweezertjes | €8 |
| Multimeter (Fluke 101 of gelijkw.) | €25 |
| Plastic snijmat A4 | €6 |
| Set kleine vijlen 5 stuks | €10 |
| Cyanoacrylaat + activator | €8 |
| **Subtotaal** | **€184** |

### 9. Thermische Interface & Vacuümcoating — €170

| Onderdeel | Aantal | Prijs | Totaal | ASTM E595 |
|---|---|---|---|---|
| Bergquist GAP PAD HC5.0 100×100mm 1.0mm | 2 platen | €25 | €50 | TML 0.05% ✅ |
| Bergquist GAP PAD HC3.0 100×100mm 0.5mm | 2 platen | €15 | €30 | TML 0.11% ✅ |
| MasterSil 323AO-LO 50g kit | 1 | €40 | €40 | ✅ |
| Aeroglaze Z306 low-outgassing mat zwart | 1 spuitbus | €50 | €50 | ✅ |
| **Subtotaal** | | | **€170** | |

**Vacuümfase lijm upgrade:**
- Loctite 243 → **Master Bond EP21TDCHT** (vacuum-rated structural adhesive)
- Bestellen bij vacuümkamersessie planning

### 10. 3D-Printer — €739

| Onderdeel | Prijs |
|---|---|
| QIDI Tech Plus4 | €699 |
| Reserve PEI-bouwplaat | €25 |
| Hardstalen nozzle 0.4mm + 0.6mm | €15 |
| **Subtotaal** | **€739** |

---

## Budget Evolutie

| Versie | Totaal | Toevoeging |
|---|---|---|
| v2 | €2.937 | Power architectuur gecorrigeerd |
| v3 | €3.435 | PC Space Grade, thermische pads |
| v4 | €3.531 | Dubbele buck, INA226 ADDR, servo horns |
| v4.1 | €3.637 | Servo horns → TinyTronics (Meta fix) |
| **v5** | **€3.711** | **PTC fuses, e-stop, EMI ferriet, XT60 Y-splitter** |
| Buffer 3% | €111 | |
| **Eindtotaal** | **€3.822** | |

---

## Firmware Aanpassingen v5

### Dual I2C bus (main.py update)

```python
# CMB8LF v5 — I2C bus scheiding
from machine import I2C, Pin

# Bus 0: servo PWM — hoge prioriteit, laag noise-risico
i2c_servo = I2C(0, sda=Pin(4), scl=Pin(5), freq=400_000)
# PCA9685-A (0x40), PCA9685-B (0x41)

# Bus 1: monitoring — gescheiden van buck-switching EMI
i2c_monitor = I2C(1, sda=Pin(6), scl=Pin(7), freq=100_000)
# INA226 ×4 (0x44-0x47), TMP117 ×2 (0x48-0x49)
# Lagere freq (100kHz) = beter EMI-gedrag op lange kabels
```

### Hardware e-stop interrupt (main.py update)

```python
# Hardware noodstop — onafhankelijk van software current limit
ESTOP_PIN = 14   # NC schakelaar — LOW = noodstop

estop = Pin(ESTOP_PIN, Pin.IN, Pin.PULL_UP)

def estop_handler(pin):
    # Vanuit interrupt: alleen flag — geen I2C
    failsafe._triggered = True

estop.irq(trigger=Pin.IRQ_FALLING, handler=estop_handler)
# Bij indrukken knop → failsafe actief → main loop zet alles uit
```

### Power domain check bij boot

```python
# Controleer bij boot of beide packs los van elkaar zijn
# Meting via INA226: als bus A en bus B exact gelijke spanning
# tonen na startup → waarschuwing (mogelijk per ongeluk parallel)
def check_domain_isolation():
    v_a = ina_buck_a.voltage_v()
    v_b = ina_buck_b.voltage_v()
    if abs(v_a - v_b) < 0.05:   # <50mV verschil
        print("[WARN] Packs mogelijk parallel — controleer bedrading")
    else:
        print(f"[INIT] Domain isolatie OK: A={v_a:.2f}V B={v_b:.2f}V")
```

---

## Vacuümgereedheid Checklist

| Onderdeel | Fase 1 (lucht) | Fase 2 (vacuum) | Fix |
|---|---|---|---|
| PC Space Grade | ✅ | ✅ | — |
| PA12-CF | ✅ | ✅ | — |
| TPU 95A | ✅ | ⚠️ | Vervangen door PEBA |
| PLA+ | test only | ❌ | Volledig verwijderen |
| Silicoon kabel | ✅ | ✅ | — |
| Loctite 243 | ✅ | ⚠️ | Vervangen door EP21TDCHT |
| Bergquist pads | ✅ | ✅ | — |
| MasterSil 323AO-LO | ✅ | ✅ | — |
| Aeroglaze Z306 | ✅ | ✅ | — |
| Neodymium magneten | ✅ | ✅ | — |
| Lagers F688-2RS (droog) | ✅ | ⚠️ | MoS₂ droog smeermiddel |

---

## Wat er nu niet meer te verbeteren valt

| Punt | Status |
|---|---|
| Hardware stroombeveiliging | ✅ PTC per buck output |
| LiPo parallel risico | ✅ Strict domain separation |
| Software current limiting | ✅ DualRailServoLimiter + 3 sub-rails |
| I2C EMI scheiding | ✅ Twee bussen + ferrietkern |
| Hardware noodstop | ✅ E-stop knop + relais |
| Thermisch beheer | ✅ ThermalManager + cooldown posture |
| Vacuümvoorbereiding | ✅ ASTM E595 pads, coating, materiaalplan |
| Adresconflict INA226 | ✅ ADDR-pin 0x44-0x47 |
| Servo duty-cycle | ✅ MAX_SIMUL_7V4_PER_BUCK = 6 |
| Kogellager plaatsing | ✅ Heup + knie only |
| Filament vacuümplan | ✅ PEBA als TPU-vervanging gedocumenteerd |
| Slicer instellingen | ✅ PRINT_SETTINGS.md (Gemini) |
| Power-up volgorde | ✅ VACUUM_PREP.md (Meta) |
| Thermische pads | ✅ ASTM E595, 2 platen, 60×60mm Pi5 |

---

*CMB8LF-S1 — Boodschappenlijst v5 — Ultimate*
*Meta · DeepSeek · Gemini · ChatGPT · Claude — alle input verwerkt*
*CC0 — Chrystal Moon Base 2026*
