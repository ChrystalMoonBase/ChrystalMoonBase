# CMB8LF v1 — Scale Demonstrator Build

**Series:** CMB8LF (Chrystal Moon Base 8 Legged Freaks)  
**Model:** v1 — 1:3.5 scale · 2 robots · 8 legs · 3 DOF per leg  
**Status:** 🟡 Pre-build — parts on order  
**Licence:** CERN-OHL-S-2.0 (hardware) · CC0 (documentation)

---

## What is CMB8LF?

CMB8LF is the official series name for all Chrystal Moon Base legged robot chassis — from the first scale demonstrators to the eventual full-size lunar construction robots. Every chassis in this series shares the same core philosophy: eight legs, modular everything, robots that can repair each other.

**v1** is the first physical build. 1:3.5 scale. Two identical robots. The goal is to demonstrate locomotion, tool switching, and eventually autonomous peer repair on real hardware.

---

## CMB8LF v1 — Progress

### Phase 0 — Design & Procurement
- [x] Robot concept finalised (8 legs, 3 DOF, modular Lego-style assembly)
- [x] Servo architecture decided (DS3240 / DS3225 / DS3218, three voltage rails)
- [x] Power architecture validated (3S LiPo → 7.4V / 6V / 5V step-downs)
- [x] Complete bill of materials v2 finalised (€3,000 incl. printer, within budget)
- [x] Supplier RFQs sent (Kiwi Electronics, TinyTronics, RobotShop, Conrad)
- [ ] Quotes received and compared
- [ ] Components ordered
- [ ] QIDI Tech Plus4 printer ordered and delivered

### Phase 1 — Fabrication
- [ ] Test prints: poot socket (bajonet), chassis segment, sneeuwschoenvoet
- [ ] First full poot assembly (one leg, three servos, wired)
- [ ] Power system bench test (all three rails, INA226 current monitoring)
- [ ] Chassis v1 printed and assembled (both halves, dovetail connectors)
- [ ] All 8 legs assembled and installed per robot
- [ ] Electronics tray installed (Pi 5, Pico W ×2, PCA9685 ×2)
- [ ] Full wiring harness complete (labelled, heat-shrunk)

### Phase 2 — Software & Calibration
- [ ] Pi 5 + Pico W communication verified (I2C, UART)
- [ ] All 24 servos per robot responding to neutral command
- [ ] Gait controller: tripod walk
- [ ] Gait controller: wave walk
- [ ] BNO055 IMU integration (terrain adaptation, degraded gait on leg failure)
- [ ] RPLIDAR A1M8 integration (obstacle detection)
- [ ] Web dashboard live (camera feed, sensor values, emergency stop)

### Phase 3 — Demonstration
- [ ] Robot 1 walking autonomously on flat surface
- [ ] Robot 2 walking autonomously on flat surface
- [ ] EPM tool switching demo (bulldozer blade ↔ laser module)
- [ ] Peer repair demo: Robot 2 replaces a leg on Robot 1

---

## Bill of Materials — CMB8LF v1

*Complete list for 2 robots. All voltages explicit. Three power rails per robot.*

### Power Architecture

```
3S LiPo 11.1V × 2 packs per robot
    │
    ├── BMS 40A → Buck 7.4V/20A → DS3240 hip (×8) + DS3225 upper leg (×8)
    ├── BMS 40A → Buck 6.0V/10A → DS3218 lower leg (×8)
    └────────── → Buck 5V/10A  → Pi 5, Pico W ×2, PCA9685, sensors, RPLIDAR

Note: PCA9685 provides PWM signal only (3.3V logic). Never servo power via V+ rail.
```

| Servo | Rail | Nominal | Max |
|---|---|---|---|
| DS3240 — hip | 7.4V | 7.4V | 8.4V |
| DS3225 — upper leg | 7.4V | 7.4V | 8.4V |
| DS3218 — lower leg | 6.0V | 6.0V | 7.2V |

### Brain & Compute — €258

| Part | Qty | Unit | Total |
|---|---|---|---|
| Raspberry Pi 5 8GB | 2 | €85 | €170 |
| Raspberry Pi Pico W | 4 | €10 | €40 |
| PCA9685 16-channel servo driver | 4 | €8 | €32 |
| MicroSD 32GB | 2 | €8 | €16 |

### Actuation — Servos — €719

| Part | Qty | Unit | Total |
|---|---|---|---|
| DS3240 35 kg/cm — hip — 7.4V rail | 16 | €18 | €288 |
| DS3225 25 kg/cm — upper leg — 7.4V rail | 16 | €14 | €224 |
| DS3218 20 kg/cm — lower leg — 6.0V rail | 16 | €12 | €192 |
| Servo extension cables 20cm | 30 | €0.50 | €15 |

### Power System — €329

| Part | Qty | Unit | Total |
|---|---|---|---|
| LiPo 3S 5000mAh 35C XT60 | 4 | €25 | €100 |
| 3S 40A BMS | 4 | €8 | €32 |
| Step-down buck 7.4V/20A adjustable | 4 | €12 | €48 |
| Step-down buck 6.0V/10A adjustable | 4 | €8 | €32 |
| Step-down buck 5V/10A | 2 | €12 | €24 |
| XT60 connector pairs | 20 | €0.60 | €12 |
| XT30 connector pairs | 10 | €0.40 | €4 |
| Anti-spark XT60 | 4 | €3 | €12 |
| LiPo balance charger 3S (ISDT Q6 Plus) | 1 | €45 | €45 |
| Silicone wire 14AWG red + black (2m) | 1 set | — | €12 |
| Silicone wire 18AWG red + black (2m) | 1 set | — | €8 |

### Sensors — €318

| Part | Qty | Unit | Total |
|---|---|---|---|
| RPLIDAR A1M8 (5V, 360°) | 2 | €90 | €180 |
| BNO055 9-axis IMU (I2C) | 4 | €8 | €32 |
| Pi Camera Module 3 (12MP autofocus) | 2 | €25 | €50 |
| VL53L1X Time-of-Flight | 4 | €5 | €20 |
| HC-SR04 ultrasonic | 4 | €2 | €8 |
| DS18B20 temperature sensor | 4 | €3 | €12 |
| INA226 current monitor (I2C) | 4 | €4 | €16 |

### Mechanical — €156

| Part | Qty | Unit | Total |
|---|---|---|---|
| M3 bolt assortment (200 pcs) | 1 box | — | €12 |
| M2 bolt assortment (100 pcs) | 1 box | — | €8 |
| M3 nyloc nuts (100 pcs) | 1 pack | — | €6 |
| M2 nyloc nuts (50 pcs) | 1 pack | — | €4 |
| Stainless bearing F688-2RS (8×16×5mm) | 20 | €2 | €40 |
| M3 brass heat-set inserts (100 pcs) | 1 pack | — | €8 |
| M2 brass heat-set inserts (50 pcs) | 1 pack | — | €6 |
| Neodymium disc magnets 10×2mm (EPM) | 20 | €0.50 | €10 |
| Neodymium disc magnets 5×2mm (EPM) | 40 | €0.30 | €12 |
| Servo horn assortment (DS3240/DS3225/DS3218) | 2 sets | €8 | €16 |
| M3 dowel pins 3×10mm | 20 | €0.30 | €6 |
| Hook-and-loop tape 20mm black (2m) | 1 | — | €5 |
| Heat shrink assortment | 1 set | — | €8 |
| Dupont jumper wire assortment | 3 sets | €5 | €15 |

### Filaments — €248

| Material | Qty | Unit | Total | Use |
|---|---|---|---|---|
| PETG-CF (carbon fibre) | 3 kg | €45 | €135 | Frame, chassis, panels |
| PA12-CF (nylon carbon) | 1 kg | €65 | €65 | Joints, bayonet sockets |
| TPU 95A | 1 kg | €30 | €30 | Snowshoe feet, damping |
| PLA+ (test prints) | 1 kg | €18 | €18 | Fit testing |

### Tools & Consumables — €170

| Part | Qty | Price |
|---|---|---|
| Soldering station 65W (Hakko FX-888D or equiv.) | 1 | €50 |
| Solder 60/40 0.8mm (100g) | 1 | €8 |
| Liquid flux | 1 | €6 |
| Digital calliper 150mm | 1 | €15 |
| Precision screwdriver set (magnetic) | 1 | €15 |
| Heat-set insert tip for soldering iron (M2+M3) | 1 | €12 |
| Wire cutters + wire strippers | 1 set | €15 |
| Loctite 243 (thread lock, blue) | 1 | €10 |
| Isopropanol 99% (250ml) | 1 | €6 |
| Anti-static tweezers | 1 set | €8 |
| Multimeter (Fluke 101 or equiv.) | 1 | €25 |

### 3D Printer (ordered separately) — €739

| Part | Price |
|---|---|
| QIDI Tech Plus4 (305×305×280mm, 65°C chamber, 370°C hotend) | €699 |
| Spare PEI build plate | €25 |
| Hardened steel nozzle 0.4mm + 0.6mm | €15 |

### Budget Summary

| Category | Amount |
|---|---|
| Brain & compute | €258 |
| Servos | €719 |
| Power system | €329 |
| Sensors | €318 |
| Mechanical | €156 |
| Filaments | €248 |
| Tools | €170 |
| **Robot subtotal** | **€2,198** |
| 3D printer | €739 |
| **Total** | **€2,937** |
| Buffer (3%) | €63 |
| **Grand total** | **€3,000** |

---

## Supplier Outreach

RFQs sent on [DATE]. Awaiting responses.

| Supplier | Items | Status |
|---|---|---|
| Kiwi Electronics (Den Haag) | Brain & compute, sensors | 🟡 Awaiting quote |
| TinyTronics (Eindhoven) | Power system, RPLIDAR, DS3225, DS3218 | 🟡 Awaiting quote |
| RobotShop | DS3240 ×16 (hip servos) | 🟡 Awaiting quote |
| Conrad | Mechanical, tools | 🟡 Awaiting quote |

---

## Software

Software is maintained in a separate private repository.  
Architecture: Raspberry Pi 5 (ROS2 / high-level planning) + Raspberry Pi Pico W ×2 (real-time servo control via PCA9685).

---

## Links

- [Chrystal Moon Base](https://chrystalmoonbase.com)
- [CMB-R1 Full-Scale Robot System](../systems/robot-cmb-r1/README.md)
- [Contact](mailto:info@chrystalmoonbase.com)

---

*CERN-OHL-S-2.0 (hardware) · CC0 (documentation) · Chrystal Moon Base 2026*
