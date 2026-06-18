# CMB8LF-S1 — Bill of Materials v6
## Chrystal Moon Base · 8 Legged Freaks · Volledige Revisie
**Brushless · 24V Gedistribueerd · CAN Bus · Vacuum-Proof**
**CC0 · Berechja Kerkdijk · 2026**

---

## Wat v6 verandert ten opzichte van v5

| Verandering | Reden |
|---|---|
| Alle hobby servos → brushless BLDC + moteus | Precisie · koppelregeling · 24V native |
| PCA9685 → CAN bus (USB-CAN adapter) | Één bus voor alle 26 motoren |
| Centrale batterij → 25 gedistribueerde nodes | Fault tolerant · gewicht verdeling |
| PC Space Grade → PEEK-CF | Hogere temperatuur · vacuum betere outgassing |
| Laser 650nm symbolisch → 808nm/976nm echt | Echt glaspoeder smelten |
| Tripod gait → Wave gait | Maximale stabiliteit |
| Standaard lagers → Si₃N₄ keramisch | Vacuum-proof · smeervrij |

---

## KOSTENSTRUCTUUR PER MODULE

```
MODULE               KOSTEN      PRIORITEIT
─────────────────────────────────────────────
1 standaard been     ~€365       Eerst bouwen
1 grijper been       ~€520       Tweede been
Hoofd                ~€310       Derde
Body + compute       ~€480       Laatste
Printer (éénmalig)   ~€700-4500  Zie sectie 10
─────────────────────────────────────────────
TOTAAL ROBOT         ~€3.800     excl. printer
Per maand (1 been)   ~€365-520
```

---

## 1. COMPUTE & AI — €285

| Onderdeel | Aantal | Prijs/st | Totaal | Functie |
|---|---|---|---|---|
| Raspberry Pi 5 8GB | 1 | €90 | €90 | Hoofd AI · navigatie |
| Raspberry Pi Pico W | 2 | €10 | €20 | CAN master · safety |
| RP2350 module | 26 | €4 | €104 | Mini AI per segment + hoofd |
| MicroSD 64GB | 1 | €10 | €10 | Pi5 opslag |
| USB-CAN adapter (Canable) | 1 | €25 | €25 | Pi5 → CAN bus |
| USB hub 4-poort (Pi5) | 1 | €15 | €15 | USB devices Pi5 |
| Kleine breadboard PCB's | 10 | €2 | €20 | Verbindingen compute bay |
| **Subtotaal** | | | **€284** | |

---

## 2. MOTOREN & CONTROLLERS — €2.180

### 2A. moteus r4.11 CAN Controllers

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| mjbots moteus r4.11 | 26 | €85 | €2.210 | 24 been + 2 hoofd |

> **BOUWTIP**: Bestel moteus controllers gefaseerd — 3 per been × 8 benen.
> Eerste bestelling: 3 stuks voor been 1. Zo spreidt je de kosten.

### 2B. BLDC Motoren

| Onderdeel | Aantal | Prijs/st | Totaal | Positie |
|---|---|---|---|---|
| iPower GM5208-150T | 8 | €28 | €224 | Heup (coxa) — hoogste koppel |
| iPower GM4108H-120T | 10 | €22 | €220 | Knie (femur) + hoofd pan |
| iPower GM3506-2 | 8 | €18 | €144 | Enkel (tibia) + hoofd tilt |
| **Subtotaal motoren** | | | **€588** | |

### 2C. Encoder (ingebouwd in moteus — geen extra nodig)
*De moteus r4.11 heeft AS5047P encoder interface ingebouwd.*
*Encoders zijn inbegrepen in de moteus prijs.*

### 2D. Grijper Vinger Servos (klein — brushless te groot)

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| MG90S mini servo | 8 | €4 | €32 | 4 vingers × 2 grijper benen |
| Servo driver PCA9685 | 2 | €6 | €12 | 1 per grijper been |
| **Subtotaal grijpers** | | | **€44** | |

---

## 3. BATTERIJEN & POWER — €480

### 3A. Segment Batterijen (25 nodes)

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| 16340 Li-Ion 700mAh (losse cel) | 150 | €2.50 | €375 | 6 per segment × 25 |
| 6S mini BMS 5A | 24 | €6 | €144 | 1 per been-segment |
| Nikkelstrip 0.15mm × 8mm | 5m | €8 | €40 | Celverbindingen |
| **Subtotaal segment power** | | | **€559** | |

### 3B. Body Batterij

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| LiPo 4S 5000mAh XT60 | 1 | €45 | €45 | Body electronics |
| 4S 30A BMS | 1 | €10 | €10 | Body batterij |
| Buck 5V/10A | 2 | €10 | €20 | Pi5 + Pico W power |
| Buck 3.3V/3A | 6 | €5 | €30 | RP2350 per segment |
| E-stop knop NC 22mm rood | 1 | €5 | €5 | Hardware noodstop |
| Relaismodule 30A | 1 | €8 | €8 | E-stop schakeling |
| XT60 connectoren | 20 | €0.80 | €16 | Power verbindingen |
| Anti-spark XT60 | 2 | €4 | €8 | Veilig aansluiten |
| Lader 4S balanceer (ISDT Q6) | 1 | €45 | €45 | Body lader |
| Lader 6S balanceer | 1 | €55 | €55 | Segment lader |
| **Subtotaal body power** | | | **€242** | |

---

## 4. CAN BUS & BEDRADING — €95

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| Twisted pair CAN kabel 26AWG | 20m | €3/m | €60 | H+L door alle botten |
| 120Ω CAN terminatieweerstand | 20 | €0.30 | €6 | 2 per CAN lijn |
| JST-GH 4-pin (CAN + power door koppeling) | 30 | €1 | €30 | Per koppelingsinterface |
| Kabelgoten PEEK-CF snap | geprint | — | — | Ontwerp in CAD |
| **Subtotaal CAN** | | | **€96** | |

---

## 5. KOPPELINGSSYSTEEM — €320

### Bistabiele Magneetkoppeling × 9 (8 benen + hoofd)

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| NdFeB N52 magneetring ⌀40mm | 9 | €12 | €108 | Permanente vergrendeling |
| Release spoel (custom wikkeling) | 9 | €8 | €72 | 50ms puls ontgrendeling |
| Si₃N₄ keramisch kogellager ⌀30mm | 18 | €15 | €270 | 2 per koppeling |
| Vergoud pogo pin set 5-pins | 9 | €8 | €72 | Power + CAN contact |
| Hall sensor A3144 | 9 | €1 | €9 | Vergrendeld/los detectie |
| PEEK-CF geleidingsneus (geprint) | 9 | — | — | CAD ontwerp |
| MoS₂ dry film spray 400ml | 2 | €25 | €50 | ALLE bewegende vlakken |
| **Subtotaal koppeling** | | | **€581** | |

---

## 6. SENSOREN — €375

| Onderdeel | Aantal | Prijs/st | Totaal | Bus | Positie |
|---|---|---|---|---|---|
| RPLIDAR A1M8 | 1 | €90 | €90 | UART → Pi5 | Hoofd |
| Pi Camera 3 NoIR | 1 | €28 | €28 | CSI → Pi5 | Hoofd |
| FLIR Lepton 3.5 | 1 | €180 | €180 | SPI → Pi5 | Hoofd |
| BNO055 IMU | 1 | €8 | €8 | I2C → Pi5 | Hoofd |
| VL53L1X ToF | 2 | €5 | €10 | I2C → Pi5 | Hoofd links+rechts |
| MLX90614ESF | 2 | €8 | €16 | I2C → RP2350 | Palm ×2 |
| TMP117 precisie temp | 26 | €4 | €104 | I2C → RP2350 | Per segment |
| INA226 stroom monitor | 10 | €4 | €40 | I2C → Pico W | Power rails |
| **Subtotaal sensoren** | | | **€476** | | |

---

## 7. LASER PALM SYSTEEM — €180 (×2 palmen)

| Onderdeel | Aantal | Prijs/st | Totaal | Noot |
|---|---|---|---|---|
| Laserdiode 808nm 2W TO-56 | 2 | €35 | €70 | L1 sinter (1 per palm) |
| Laserdiode 976nm 1W TO-56 | 2 | €25 | €50 | L2 anneal (1 per palm) |
| Asferische collimeer lens 4.51mm EFL | 2 | €18 | €36 | L1 focus |
| Defocus barrel optiek | 2 | €12 | €24 | L2 brede spot |
| Messing lensbarrel M5 | 4 | €6 | €24 | Houder per lens |
| CC laser driver switching 2A | 2 | €15 | €30 | L1 driver |
| CC laser driver PWM 1A | 2 | €12 | €24 | L2 driver |
| AL6061 palmkern 65×50×40mm | 2 | €25 | €50 | CNC of printservice |
| OD4+ laserbril 808+976nm | 1 | €45 | €45 | VERPLICHT · gedeeld |
| **Subtotaal laser** | | | **€353** | |

---

## 8. MECHANISCH — €175

| Onderdeel | Prijs | Noot |
|---|---|---|
| M3 RVS bouten assortiment 300 stuks | €14 | Alle assemblages |
| M2 RVS bouten assortiment 150 stuks | €9 | Kleine componenten |
| M3 messing heat-set 100 stuks | €8 | PEEK-CF verbindingen |
| M2 messing heat-set 60 stuks | €6 | Kleine prints |
| M3 nyloc moeren 100 stuks | €6 | Vibratie-vast |
| Si₃N₄ keramische lagers F688 ×40 | €80 | Heup + knie gewrichten |
| Titaan M3 bouten 50 stuks | €25 | Exterieur (non-magnetisch) |
| Krimptube assortiment | €8 | Alle verbindingen |
| Isopropanol 99% 500ml | €10 | Reiniging voor assemblage |
| Thermische pasta vacuüm-grade | €12 | Motor → structuur |
| **Subtotaal** | **€178** | |

---

## 9. THERMISCH & VACUUM COATING — €145

| Onderdeel | Prijs | ASTM E595 | Noot |
|---|---|---|---|
| Bergquist GAP PAD HC5.0 200×200mm | €60 | TML 0.05% ✅ | Motor → kern |
| Silica aerogel blanket 300×300×6mm | €40 | ✅ | Thermische isolatie |
| Aeroglaze Z306 mat zwart spuitbus | €50 | ✅ | Buitencoating |
| MasterSil 323AO-LO 50g | €40 | ✅ | Vacuum adhesief |
| **Subtotaal** | **€190** | | |

---

## 10. VERLICHTING — €65

| Onderdeel | Aantal | Prijs | Totaal |
|---|---|---|---|
| WS2812B LED strip 60LED/m | 2m | €12 | €24 |
| 850nm IR LED 1W | 6 | €4 | €24 |
| 10W LED spotlight module | 1 | €8 | €8 |
| IR LED driver MOSFET | 3 | €3 | €9 |
| **Subtotaal** | | | **€65** | |

---

## 11. GEREEDSCHAP (éénmalig) — €185

| Onderdeel | Prijs |
|---|---|
| Soldeerbout 65W temperatuurgeregeld | €50 |
| Fijn soldeertin 60/40 0.6mm | €10 |
| Digitale schuifmaat 0.01mm | €20 |
| Heat-set tool M2+M3 | €12 |
| Multimeter Fluke of gelijkwaardig | €30 |
| Oscilloscoop USB 50MHz | €35 |
| Precisie schroevendraaier set | €15 |
| Anti-statische mat + armband | €13 |
| **Subtotaal** | **€185** | |

---

## 12. FILAMENT — €485

| Materiaal | Hoeveelheid | Prijs | Gebruik | Vacuum |
|---|---|---|---|---|
| PEEK-CF (Kimya of 3DXTech) | 8 × 500g | €55/rol | Alles structureel | ✅ TML <0.1% |
| PA12-CF | 2 × 500g | €45/rol | Koppelings-neus · glijdende vlakken | ✅ |
| PEEK naturel (testprint) | 1 × 500g | €55 | Maatcontrole vóór CF print | ✅ |
| **Subtotaal** | | **€595** | | |

---

## 13. 3D PRINTER

### PRIMARY (selected) — CreatBot PEEK-300 (~€14.999)
**CreatBot PEEK-300** — dedicated high-temperature PEEK printer
- Prints PEEK-CF directly (high stable chamber temperature, high-temp hotend, reliable thermal control)
- **Built-in annealing — no separate oven needed.** The heated chamber holds the part at temperature during and immediately after printing, performing in-situ annealing. PEEK must be cooled slowly and held at the right temperature to reach correct crystallinity (hence strength and dimensional stability) — normally a separate post-print oven step. Building it in removes that whole step: less equipment, less handling, no distortion risk from moving the part to an oven. (Note: the most demanding crystallinity requirements may still use a longer dedicated anneal cycle; for the prototype and most Nexus Ignis parts the built-in annealing is sufficient.)
- Purpose-built for PEEK — not a marginal/budget machine pushed to its limits
- **Dual-purpose rationale:** also the Nexus Ignis B.V. production printer. One investment serves two functions — revenue as the Nexus Ignis PEEK/polymer printing service, *and* printing the CMB8LF prototype robot. No separate oven also means a simpler, cheaper production workflow (better margins) and prototype parts that come out usable without post-processing.

**Why not a cheaper printer:** budget machines can technically attempt PEEK-CF, but it is not wise — PEEK-CF demands high stable chamber temperatures, a true high-temp hotend, and reliable thermal control. A failed PEEK print on a borderline machine costs more in time and material than the reliability of a machine built for it.

---

**DIY ALTERNATIVES (for open-source contributors without a CreatBot):**

### Alt 1 — Intamsys FUNMAT HT Enhanced (€3.500-4.500)
- Real PEEK printer; chamber to 90°C; nozzle 450°C; ready out of the box (separate annealing oven may be needed)

### Alt 2 — Voron 2.4 self-build + Phaetus Rapido HF 2 UHF (€1.800-2.500)
- Self-build; chamber heater mod 80-100°C; can print PEEK after calibration; large community support (separate annealing oven may be needed)

### Alt 3 — Budget non-PEEK (€699, e.g. QIDI Q1 Pro / Bambu P1S)
- Cannot print PEEK-CF; only PA12-CF / PC-CF; use a print service for PEEK parts. Non-PEEK prototype start only.

---

## BUDGET TOTAALOVERZICHT

| Module | Kosten |
|---|---|
| Compute & AI | €285 |
| Motoren + controllers | €2.842 |
| Batterijen + power | €801 |
| CAN bus + bedrading | €96 |
| Koppelingssysteem | €581 |
| Sensoren | €476 |
| Laser palm systeem | €353 |
| Mechanisch | €178 |
| Thermisch + coating | €190 |
| Verlichting | €65 |
| Gereedschap (éénmalig) | €185 |
| Filament | €595 |
| **ROBOT TOTAAL** | **~€6.647** |
| Buffer 10% | €665 |
| **EINDTOTAAL excl. printer** | **~€7.312** |

---

## BOUW-PER-BEEN STRATEGIE

```
MAAND 1       Gereedschap + printer
              Compute (Pi5 + Pico W + RP2350)
              CAN adapter + test setup
              Kosten: ~€500-1.000

MAAND 2       Eerste standaard been
              3× moteus + motoren + batterij
              PEEK-CF filament (of printservice)
              Test: CAN node actief
              Kosten: ~€365

MAAND 3       Eerste grijper been
              Laser palm systeem
              OD4+ laserbril (verplicht)
              Kosten: ~€520

MAAND 4-8     Overige 6 benen
              ~€365 per standaard been

MAAND 9       Hoofd + sensoren
              FLIR Lepton + LIDAR + camera's
              Kosten: ~€470

MAAND 10      Body + koppelingen
              Bistabiele magneten + pogo pins
              Kosten: ~€600

MAAND 11-12   Kalibratie + software
              Wave gait tuning
              Laser sinter test
              Eerste demo
```

---

## VACUÜM GEREEDHEID CHECKLIST

| Component | Aarde demo | Vacuüm test | Fix |
|---|---|---|---|
| PEEK-CF | ✅ | ✅ TML <0.1% | — |
| PA12-CF | ✅ | ✅ | — |
| Si₃N₄ lagers | ✅ | ✅ | — |
| MoS₂ coating | ✅ | ✅ | — |
| Moteus r4.11 | ✅ | ⚠️ | Aeroglaze coating op PCB |
| 16340 Li-Ion | ✅ | ⚠️ | Seal in PEEK behuizing |
| Silicoon kabel | ✅ | ✅ | — |
| NdFeB magneten | ✅ | ✅ | — |
| Bergquist pads | ✅ | ✅ | — |
| Aeroglaze Z306 | ✅ | ✅ | — |
| MasterSil 323AO-LO | ✅ | ✅ | — |
| MG90S servo (vingers) | ✅ | ⚠️ | Vervangen door mini brushless voor vluchtversie |

---

*CMB8LF-S1 · BOM v6 · Volledige Revisie*
*Multi-AI: Claude · ChatGPT · Gemini · DeepSeek · Meta*
*Human decisions: Berechja Kerkdijk*
*CC0 2026 — Chrystal Moon Base — No rights reserved*
*No flags. No patents. Built for all humanity. 🌙*
