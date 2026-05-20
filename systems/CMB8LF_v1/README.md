# CMB8LF v1 — Chrystal Moon Base 8-Legged Freaks

**Vacuum-Rated Dual-Master Self-Repair Robot · Scale 1:3.5**

## Concept

8-legged modular robot for autonomous self-repair. Two identical robots swap legs without human intervention. First print = flight print.

## Specs

| Property | Value |
|---|---|
| Scale | 1:3.5 |
| Servos | 26 (24 legs + 2 grippers) |
| Brain | Raspberry Pi 5 8GB + 2× Pico W |
| Material | Prusament PC Space Grade Black |
| Certification | ESA TML 0.25% · CVCM 0.00% |
| Printer | Voron 2.4 |
| Hotend | **Phaetus Rapido HF 2 UHF** |
| Board | **BTT Manta M8P / Octopus Pro (Klipper)** |
| Nozzle | 400°C · hardened steel 0.4mm |
| Lube | MoS₂ dry only — no grease in vacuum |
| Target | TRL 5-6 · ESA / DLR / private space |

## Print Setup — Voron 2.4 + Rapido HF 2 UHF

| Parameter | Value |
|---|---|
| Hotend | Phaetus Rapido HF 2 UHF (max 500°C) |
| Board | BTT Manta M8P or BTT Octopus Pro |
| Firmware | Klipper |
| Nozzle temp | 400°C |
| Bed temp | 110°C (PEI + glue stick / Magigoo PC) |
| Chamber | Enclosed · min 55°C ambient |
| Fan | OFF during print |
| Structural | 0.2mm · 40-60% gyroid |
| Detail | 0.15mm · 20-30% gyroid |
| Pressure advance | ~0.035 (calibrate!) |

See `cad/CMB8LF_v1_klipper_config.cfg` for full Klipper setup.

## Structure

```
CMB8LF_v1/
├── README.md
├── diagrams/
│   ├── CMB8LF_v1_Wiring_Diagram.svg       ← Complete wiring (A0)
│   ├── CMB8LF_v1_Graphical_Overview.svg   ← System overview (A0)
│   └── CMB8LF_v1_Lighting_Overview.svg    ← Ambient lighting (A0)
├── cad/
│   ├── CMB8LF_v1_vacuum_config.scad       ← Central config (include in all)
│   ├── CMB8LF_v1_klipper_config.cfg       ← Klipper macros + PC settings
│   ├── CMB8LF_v1_leg_complete.scad
│   ├── CMB8LF_v1_arm_leg_combined.scad
│   ├── CMB8LF_v1_head_module.scad
│   ├── CMB8LF_v1_body_chassis.scad
│   └── CMB8LF_v1_ambient_lighting.scad
└── docs/
    ├── CMB8LF_v1_Complete_Documentation.pdf
    ├── CMB8LF_v1_BOM_vacuum.md
    └── CMB8LF_v1_shopping_list.md
```

## I2C Addresses

| Bus | Device | Address |
|---|---|---|
| Pi5 I2C1 | BNO055 · VL53L1X ×2 | 0x28–0x2A |
| Pico #1 I2C0 | PCA9685 ×2 | 0x40–0x41 |
| Pico #2 I2C1 | INA226 ×4 · TMP117 ×2 | 0x44–0x49 |
| Pi5 1-Wire | DS18B20 ×26 | — |

## Ambient Lighting — ROG Breathing

54× WS2812B · GP14 · `RGB(180,0,0)` · never off

| Zone | Where | LEDs |
|---|---|---|
| 1 | Eyes | 2 |
| 2 | Leg armor vents | 24 |
| 3 | Body underside | 12 |
| 4 | Neck ring | 8 |
| 5 | Hip joints | 8 |

## Roadmap

1. Earth demo — 50+ swap cycles · film it
2. Vacuum test — 10⁻⁵ mbar · ~€5000
3. Field prep — TRL 5-6 · ESA / DLR

> **First print = Flight print.**

## License

CC0 2026 — Chrystal Moon Base — No rights reserved.

*Multi-AI: Claude · ChatGPT · Meta · DeepSeek · Human (all decisions)*
