# CMB8LF v1 — Chrystal Moon Base 8 Legged Freaks
## Scale 1:3.5 · Vacuum-Rated · Brushless · CAN Bus · Full Revision v6

**Status:** Active development — build one leg at a time
**Author:** Berechja Kerkdijk
**Licence:** Hardware: CERN-OHL-S-2.0 · Software: GPL-3.0 · Docs: CC0

> **The prototype is the door.** Without a working robot, no door opens.
> Build it one leg per month. Two years if needed. But build it.

---

## What This Robot Does

- Walks on 8 legs using wave gait (7 always grounded — maximum stability)
- Sinters real glass powder / regolith simulant using dual lasers (808nm + 976nm)
- Grips objects in 3 modes: box grip · pincer · foot pad
- Operates in vacuum (MoS₂ dry film · ceramic bearings · no lubricants)
- Swaps its own legs with help from a second robot
- Communicates via laser (FSO) externally · CAN bus internally
- Runs 3-layer AI: Pi5 strategic · Pico W coordination · RP2350 reflexes

---

## Specifications

| Parameter | Value |
|---|---|
| Scale | 1:3.5 |
| Legs | 8 (octopod) |
| Gripper legs | 2 (leg 1 + leg 2, front) |
| Joints | 26 (24 leg + 2 head) |
| Motors | 26× BLDC brushless |
| Motor controllers | 26× mjbots moteus r4.11 |
| System voltage | 22.2V (6S Li-Ion) |
| Battery nodes | 25 (distributed — one per segment) |
| Body battery | 4S 5000mAh LiPo |
| CAN bus speed | 1 Mbit/s |
| Gait | Wave gait (1 leg at a time) |
| Material structure | PEEK-CF |
| Bearing type | Si₃N₄ ceramic (vacuum-proof) |
| Lubrication | MoS₂ dry film only |
| Printer required | PEEK-capable (Voron 2.4 + Rapido UHF or Intamsys FUNMAT HT) |
| Total cost estimate | ~€7.300 excl. printer |
| Build time | 10–14 months (one leg/month) |

---

## Build Order (one leg per month)

```
Month 1     Tools + printer + compute hardware
Month 2     Leg 3 (first standard leg — learn the system)
Month 3     Leg 1 (first gripper leg — laser palm)
Month 4     Leg 4
Month 5     Leg 2 (second gripper leg)
Month 6     Leg 5
Month 7     Leg 6
Month 8     Leg 7
Month 9     Leg 8
Month 10    Head module + all sensors
Month 11    Body + 9 coupling interfaces
Month 12+   Calibration · wave gait tuning · laser test · demo
```

---

## File Structure

```
CMB8LF_v1/
├── README.md               ← You are here
├── BOM_v6.md               ← Complete bill of materials
├── PRINT_SETTINGS.md       ← PEEK-CF print settings
├── VACUUM_PREP.md          ← Vacuum chamber preparation guide
├── SUPPLIER_MAILS_v6.md    ← Supplier contact templates
│
├── software/
│   ├── README.md
│   ├── main_v6.py          ← Pico W #1 — CAN master (start here)
│   ├── safety_pico.py      ← Pico W #2 — safety + web
│   ├── config_v6.py        ← All parameters and node IDs
│   ├── wave_gait_v6.py     ← Wave gait controller
│   ├── sinter_seq_v6.py    ← Laser sinter sequencer
│   ├── can_bus.py          ← CAN bus communication layer
│   ├── moteus_ctrl.py      ← moteus r4.11 controller interface
│   ├── rp2350_segment.py   ← Per-segment mini AI (runs on RP2350)
│   ├── laser_palm_v6.py    ← Laser palm driver (runs on palm RP2350)
│   ├── pi5_main.py         ← Pi5 — strategic AI + navigation
│   └── web_v6.py           ← Web dashboard (runs on Pico W #2)
│
├── cad/
│   ├── CMB8LF_v1_vacuum_config.scad      ← Central dimensions (include first)
│   ├── CMB8LF_v1_leg_standard.scad       ← Standard leg (×6)
│   ├── CMB8LF_v1_leg_gripper.scad        ← Gripper leg (×2)
│   ├── CMB8LF_v1_palm_laser.scad         ← Laser palm assembly
│   ├── CMB8LF_v1_coupling_interface.scad ← Bistable magnetic coupling
│   ├── CMB8LF_v1_head_module.scad        ← Head with pan+tilt
│   ├── CMB8LF_v1_body_chassis.scad       ← Spider body
│   └── CMB8LF_v1_klipper_config.cfg      ← Printer config (Voron 2.4)
│
├── docs/
│   ├── CMB8LF_v1_BOM_vacuum.md
│   └── CMB8LF_v1_shopping_list.md
│
└── diagrams/
    ├── CMB8LF_v1_Wiring_Diagram.svg
    ├── CMB8LF_v1_Graphical_Overview.svg
    └── CMB8LF_v1_Lighting_Overview.svg
```

---

## I2C / CAN Bus Address Map

| Bus | Device | Address / Node ID | Notes |
|---|---|---|---|
| Pi5 I2C1 | BNO055 IMU | 0x28 | Head |
| Pi5 I2C1 | VL53L1X left | 0x29 | Head |
| Pi5 I2C1 | VL53L1X right | 0x2A | Head |
| Pi5 SPI | FLIR Lepton 3.5 | SPI0 | Head |
| Pi5 UART | RPLIDAR A1M8 | UART | Head |
| Pi5 CSI | Pi Camera 3 NoIR | CSI | Head |
| Pi5 USB | USB-CAN (Canable) | — | CAN master |
| CAN | Leg 1 coxa moteus | Node 11 | Gripper leg L |
| CAN | Leg 1 femur moteus | Node 12 | Gripper leg L |
| CAN | Leg 1 tibia moteus | Node 13 | Gripper leg L |
| CAN | Leg 2 coxa moteus | Node 21 | Gripper leg R |
| CAN | Legs 3-8 | Node 3X-8X | Standard legs |
| CAN | Head pan moteus | Node 91 | Head |
| CAN | Head tilt moteus | Node 92 | Head |
| Pico W #2 I2C | INA226 ×4 | 0x44-0x47 | Power monitoring |
| Pico W #2 I2C | TMP117 body | 0x48 | Body temp |
| Pico W #2 GPIO | Hall sensors ×9 | GPIO 0-8 | Coupling status |

---

## Safety Rules — Always

1. **OD4+ laser goggles** rated for 808nm AND 976nm — always when lasers could activate
2. **E-stop button** within reach at all times during operation
3. **Never power lasers** unless gripper closed (hardware interlock enforces this)
4. **Never walk and sinter** simultaneously — these are separate modes
5. **MoS₂ only** — never oil, grease, or wet lubricant anywhere on the robot

---

## License

- Hardware designs: CERN-OHL-S-2.0
- Software: GPL-3.0
- Documentation: CC0

*CMB8LF v1 · CC0 2026 · Chrystal Moon Base · No rights reserved*
*Multi-AI: Claude · ChatGPT · Meta · DeepSeek · Gemini · Human decisions: Berechja Kerkdijk*
