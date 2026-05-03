# CMB-R1 Head — Sintering
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Role

The sintering head is the primary construction tool of the CMB system. One sintering-head robot leads each 4-robot construction team, converting loose lunar regolith into solid basalt by focused laser energy.

---

## Design Concept

The sintering head receives laser power from the chassis power receiver and re-focuses it through a final optical assembly onto the regolith surface below and ahead of the robot.

**Optical chain:**
1. Laser power arrives at chassis receiver as a broad beam (~15 cm diameter at robot distance)
2. Chassis photovoltaic cells convert beam to electricity (~30% efficiency)
3. A secondary laser inside the sintering head converts electricity back to a focused beam (~45% efficiency)
4. The focused beam exits through a sapphire window at the head front face
5. A final focusing lens or mirror concentrates the beam to the sintering spot — estimated 2–5 cm diameter on the regolith surface

**Note on the double-conversion:** The two-step electricity-to-laser conversion is inefficient. A direct optical fibre from the BSM to the robot sintering nozzle (skipping the photovoltaic conversion step) would be more efficient, but requires a trailing fibre cable that creates operational complexity, tangle risk, and a single-point-of-failure tether. The electrical receiver approach is more operationally robust despite the efficiency penalty.

**Scanning:** The sintering spot must scan across the surface in a controlled pattern to sinter an even layer. The sintering head contains a fast-steering mirror that rasters the beam across the work area while the robot moves forward at a controlled pace.

**Power:** The sintering head is the highest-power consumer in the system. Estimated draw: 1–3 kW of focused laser power delivered to the regolith surface.

---

## Operational Parameters (Estimates)

| Parameter | Estimate | Notes |
|---|---|---|
| Sintering spot diameter | 2–5 cm | Depends on focusing optics |
| Scan speed | 1–10 cm/s | Calibrated for energy density |
| Sintering depth | 5–25 cm | Key uncertainty — see Demonstrator 1 |
| Robot forward speed | 0.05–0.2 m/s | Matched to scan area |
| Passes per ring section | 1–5 | Depends on depth requirement |

---

## Open Questions

1. What focusing optic design achieves the required spot size with minimum mass and optical complexity?
2. How is the sintering depth verified in real time? (The Watcher provides post-hoc quality control, but real-time depth monitoring would allow adaptive power adjustment)
3. What is the minimum sintering depth that provides adequate structural bearing capacity for dome foundations?
4. How does varying regolith composition across the work area affect the required energy density, and can the system adapt in real time?
