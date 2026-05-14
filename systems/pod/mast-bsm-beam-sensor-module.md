# Beam and Sensor Module (BSM)
## Chrystal Moon Base — Phase 0.2 Power Distribution

**Status:** Concept proposal  
**Licence:** CC0

---

## Role

Five Beam and Sensor Modules are mounted on the mast at approximately 7-metre intervals (at ~7 m, ~14 m, ~21 m, ~28 m, and ~35 m height). Each BSM redirects laser power from the mast's internal fibre optic cable to a working robot anywhere within line of sight, and simultaneously acts as a tracking and sensing node.

---

## Why Five Modules?

A single module at the top of the mast would have the best overall line of sight, but would struggle to reach robots working close to the mast base due to the steep downward angle required. Five modules at different heights ensure that:

- Robots close to the mast can be served by lower modules at a shallow angle
- Robots far from the mast can be served by higher modules
- If one BSM fails, others can cover most of the operational area
- The AI always selects the BSM with the best geometric angle for each robot's current position

---

## BSM Design (Proposed)

Each BSM is a sealed dome structure mounted to the mast segment at its height. The dome contains:

**Steering mirror:** A fast-steering mirror on a two-axis gimbal, driven by voice coil actuators. The mirror redirects the laser beam from the internal fibre to the target robot. Actuator bandwidth: target >100 Hz for tracking moving robots.

**Quadrant photodiode:** The robot carries a small cooperative beacon. The BSM's quadrant photodiode detects the beacon signal and feeds error correction to the steering mirror, maintaining the beam on the robot's receiver panel.

**Sapphire window:** The laser beam exits through a sapphire optical window. Sapphire is chemically resistant to the lunar environment, thermally stable, and transparent at the laser wavelength. It also provides a sealed barrier against dust ingress.

**Thermal management:** The BSM operates over the full lunar surface temperature range. Internal heaters maintain operating temperature during shadow periods. Passive radiation fins (or none — vacuum prevents convective cooling) manage heat during sunny periods.

---

## Pointing Accuracy

The target pointing accuracy is approximately 15 microradians — corresponding to a beam spot of ~1.5 cm diameter at 1 km range. This requires:

- Cooperative beacon on each robot (simplifies pointing; the BSM finds the beacon, not a passive surface)
- Feedback bandwidth sufficient to track robot motion at walking speeds
- Mast vibration compensation — thermal gradients can cause the mast to sway, displacing the BSM from its nominal pointing position

Mast vibration compensation is a specific engineering challenge. The compensation approach (inertial measurement at the BSM, feed-forward correction to the steering mirror) is proposed but not yet validated.

---

## BSM Heights

| BSM | Mast Segment | Approximate Height |
|---|---|---|
| BSM 1 | Segment 1 (base) | ~7 m |
| BSM 2 | Segment 2 | ~14 m |
| BSM 3 | Segment 3 | ~21 m |
| BSM 4 | Segment 4 | ~28 m |
| BSM 5 | Segment 5 (top) | ~35 m |

BSM 5 at the top also carries the Ka-band communications antenna. No arms or solar film attach to the top segment — it is reserved exclusively for communications and power beaming.

The exact heights depend on the final segment lengths determined by structural engineering. These figures assume 5 equal segments of ~7 m deployed length with ~45 cm overlap per interface.

---

## Operational Range

Estimated operational radius: **2+ km from mast base.**

Beyond this range, laser power losses (beam divergence, pointing errors) reduce received power below the robot's minimum operating threshold. A second mast, delivered on a future mission, would be required to extend the operational area beyond this radius.
