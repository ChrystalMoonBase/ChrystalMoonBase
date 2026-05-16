# Kinematic Reference: Robugtix T8

**Chrystal Moon Base · Phase 0.2**
**Licence:** CC0

---

## Why the T8

The Robugtix T8 is an 8-legged robot platform with 3 degrees of freedom per leg, sold commercially as a development and demonstration platform. Its architecture — 8 legs, 3-DOF each, centralised body, servo actuation at each joint — is exactly what the CMB-R1 requires.

It was selected as the kinematic reference because:

1. **It exists.** It has been physically built, tested, and sold. The 8-leg, 3-DOF architecture is not theoretical.
2. **The leg arrangement is verified.** The T8 demonstrates that 8 legs with 3 joints each can produce stable locomotion, terrain adaptation, and tool-carrying postures.
3. **It is documented.** The T8's servo specifications, joint ranges, and gait parameters provide a starting point for CMB-R1 scaling analysis.

---

## What the CMB-R1 keeps from the T8

- 8-leg architecture
- 3-DOF per leg (coxa, femur, tibia)
- Central chassis with legs attached at the body perimeter
- Leg pairs: 4 per side, fanning from front to rear

---

## What the CMB-R1 changes

| T8 feature | CMB-R1 equivalent | Reason |
|---|---|---|
| ABS/nylon 3D-printed body | Ti-6Al-4V + basalt fibre + MgAl₂O₄ armour | Thermal and impact protection, −180°C to +130°C |
| Standard hobby servos | Sealed harmonic drives with triple-ring dust seals | Lunar dust is sharp and electrostatically charged |
| Pointed feet | Snowshoe flat plates (400 × 150 mm) | Prevents sinkage in loose regolith at 1/6 g |
| 2 front legs = legs | 2 front legs = arm-legs (EPM tool mount) | Tool carrying without dedicated manipulator arms |
| Battery pack in body | Solid-state LiPON cells per leg segment | Local power — leg operates independently if body power fails |
| WiFi / Bluetooth control | Autonomous AI with TMR, no uplink required | Light-speed delay from Earth makes teleoperation impossible |
| ~1 kg total | ~300 kg total | Scale for 35-metre mast and 16-robot fleet |

---

## What this reference does not cover

The T8 is a kinematic reference only. It does not inform:
- Sintering laser system
- GaAs PV power receiver
- Thermal management
- AI architecture
- Armour material selection
- Tool EPM interface

These are addressed in the main CMB-R1 specification.

---

## Sources

- Robugtix T8 product documentation: [robugtix.com](https://www.robugtix.com)
- Original New Atlas coverage (2013): [newatlas.com/robugtix-t8-robot-tarantula/28168](https://newatlas.com/robugtix-t8-robot-tarantula/28168/)

---

**Parent:** [../README.md](../README.md)
**Repository:** [github.com/ChrystalMoonBase/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)
