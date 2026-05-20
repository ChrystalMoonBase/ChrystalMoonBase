# CMB8LF v1 — BILL OF MATERIALS (Vacuum-Rated)
**Prusament PC Space Grade · Dual-Master Self-Repair · 2026**

---

## STRUCTURELE PRINT MATERIALEN

| Qty | Component | Spec | Leverancier |
|-----|-----------|------|-------------|
| 2 kg | Prusament PC Space Grade Black | ESA TML 0.25% · CVCM 0.00% | Prusa Research |
| — | Hardened steel nozzle 0.4mm | 400°C rating | E3D / Slice Engineering |

## SERVO SYSTEEM (per robot · 26 servos totaal)

| Qty | Model | Joint | Voltage | Kanaal |
|-----|-------|-------|---------|--------|
| 8× | DS3240 35kg·cm | HIP | 7.4V | PCA-A/B Ch0,3,6,9 |
| 8× | DS3225 25kg·cm | UPPER/FEMUR | 7.4V | PCA-A/B Ch1,4,7,10 |
| 8× | DS3218 20kg·cm | LOWER/TIBIA | 6.0V | PCA-A/B Ch2,5,8,11 |
| 2× | DS3225 of MG996R | GRIPPER | 7.4V | PCA-A Ch12,13 |

## ELEKTRONICA (per robot)

| Qty | Component | Adres / Pin | Doel |
|-----|-----------|------------|------|
| 1× | Raspberry Pi 5 8GB | — | Hoofd-SBC |
| 2× | Raspberry Pi Pico W | USB-CDC | Servo ctrl + monitoring |
| 2× | PCA9685 16-ch | 0x40 / 0x41 | PWM generatie |
| 4× | INA226 stroomsensor | 0x44–0x47 | Rail monitoring |
| 2× | TMP117 tempsensor | 0x48 / 0x49 | Frame + battery temp |
| **26×** | **DS18B20 tempsensor** | **1-Wire per servo** | **Thermische cutoff 70°C** |
| 1× | BNO055 IMU | 0x28 | 9-DOF navigatie |
| 2× | VL53L1X ToF | 0x29 / 0x2A | Afstandsmeting |
| 1× | RPLIDAR A1M8 | UART0 | 360° lidar |
| 1× | Pi Camera Module 3 | CSI-2 CAM0 | 12MP HDR |

## POWER SYSTEEM (per robot)

| Qty | Component | Spec | Doel |
|-----|-----------|------|------|
| 2× | LiPo 3S 5000mAh | 11.1V nom. | Energie |
| 2× | BMS 40A 3S | Over-current + balance | Batterijbeveiliging |
| 4× | Buck 7.4V/20A | XL4016 | HIP + UPPER servos |
| 2× | Buck 6.0V/10A | XL4016 | LOWER servos |
| 1× | Buck 5.0V/10A | — | Logic + sensors |
| 2× | Anti-spark XT60 | — | Batterij connectors |
| 4× | PTC fuse 30A | — | 7.4V buck outputs |
| 3× | PTC fuse 15A | — | 6V + 5V outputs |
| 2× | ATC fuse 50A | — | Batterij hoofdkabel |
| 1× | 30A relay NC | — | E-Stop circuit |
| 1× | NC mushroom button | Rood | E-Stop knop |

## MECHANISCH

| Qty | Component | Spec | Doel |
|-----|-----------|------|------|
| 48× | F688-2RS lager | 8×16×5mm | Alle gewrichten |
| 14× | Lager borgplaat | PC Space Grade | Axiale retentie |
| 2× | QR connector body | 3-polig · ≥15A/pin | Been-wissel mannelijk |
| 2× | QR connector socket | Chamfer 1.0mm | Been-wissel vrouwelijk |
| 26× | JST-SM 3-pin paar | — | Servo connectors |
| — | M3 heat-set inserts × 6mm | — | ~120 stuks totaal |
| — | M3 bolts diverse | — | Assemblage |

## VACUUM-RATED MATERIALEN

| Component | Product | Doel |
|-----------|---------|------|
| Structureel lijm | Master Bond EP21TDCHT | Vacuum-gecertificeerd |
| Smering lagers | MoS₂ droog (Molykote 321R) | Vacuum-safe · geen vet |
| Thermisch interface | Bergquist GAP PAD 1.0mm | Servo → armor warmtegeleiding |
| Thermisch pasta | MasterSil 323AO-LO | Low-outgassing pasta |
| Radiatieve coating | Aeroglaze Z306 matte zwart | ε=0.95 · koeling armor |
| Flexibel (clips/kaken) | PEBA Shore 85 | ASTM E595 · vac-safe |

## VERLICHTING

| Qty | Component | GPIO | Doel |
|-----|-----------|------|------|
| 1× | WS2812B ring 24 LEDs | Pico #1 GP14 | Body accent |
| 2× | WS2812B RGB oog | Chain GP14 | Hoofd ogen |
| 1× | 10W Spotlight | GP21 MOSFET | Hoofd voorkant |
| 2× | 3W White LED | GP20 MOSFET | Hoofd zij |
| 4× | Laser rood 650nm 5mW 6mm | GP17/GP19 | Arm targeting |
| 4× | Laser groen 520nm 5mW 6mm | GP18/GP20 | Arm status |

## BENODIGDHEDEN VOOR VACUUM KWALIFICATIE

| Component | Doel |
|-----------|------|
| QCM outgassing sensor | Batch-validatie prints |
| Oven 85°C (48h) | Bake-out voor vacuum |
| Torque meter (≥20N) | QR pull-force test |
| MoS₂ spray (Molykote 321R) | Lager smering |
| Aeroglaze Z306 spuitbus | Armor coating |
| Master Bond EP21TDCHT kit | Structurele lijm |

---

## FASE ROADMAP

| Fase | Actie | Target |
|------|-------|--------|
| **1 · Earth Demo** | Build Master 1 + 2 · 50+ swap cycli in lucht · film | Nu |
| **2 · Vacuum Test** | Video → funding → vacuumkamer 10⁻⁵ mbar | Na Phase 1 |
| **3 · Field Prep** | TRL 5-6 · pitch ESA / DLR / private space | Na Phase 2 |

> **First print = Flight print.** Geen re-engineering voor vacuum nodig.
> PC Space Grade is vanaf dag 1 gecertificeerd voor CubeSat gebruik.

---

## I2C ADRES OVERZICHT

| Bus | Device | Adres | Pico |
|-----|--------|-------|------|
| Pi5 I2C1 | BNO055 IMU | 0x28 | — |
| Pi5 I2C1 | VL53L1X #1 | 0x29 | — |
| Pi5 I2C1 | VL53L1X #2 | 0x2A | — |
| Pico #1 I2C0 | PCA9685-A | 0x40 | #1 |
| Pico #1 I2C0 | PCA9685-B | 0x41 | #1 |
| Pico #2 I2C1 | INA226 7.4V-A | 0x44 | #2 |
| Pico #2 I2C1 | INA226 7.4V-B | 0x45 | #2 |
| Pico #2 I2C1 | INA226 6.0V | 0x46 | #2 |
| Pico #2 I2C1 | INA226 5.0V | 0x47 | #2 |
| Pico #2 I2C1 | TMP117 frame | 0x48 | #2 |
| Pico #2 I2C1 | TMP117 battery | 0x49 | #2 |
| Pi5 1-Wire | DS18B20 × 26 | — | — |

---
*CMB8LF v1 · Chrystal Moon Base 8-Legged Freaks · CC0 2026*
