# CMB-R1 Leg Architecture
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

Each CMB-R1 robot has 6 legs, each composed of 3 segments: the upper leg, the lower leg, and the foot. Every segment follows the same internal construction principle — solid-state electronics and power storage inside a structural core, surrounded by protective gel, enclosed in a sintered basalt composite outer shell.

This architecture was chosen for three reasons:

1. **Modularity** — any segment can be replaced independently if a future mission delivers spare parts
2. **Fault isolation** — damage to one segment does not propagate to others; the structural integrity of each segment is self-contained
3. **Discardability** — if a leg is damaged beyond repair, the entire leg is released at the body joint and left on the surface. The robot continues on its remaining legs.

---

## Segment Internal Construction

All three segments share the same layered construction from inside out:

### Core — "The Bone"
A hollow structural tube of carbon-fibre reinforced PEEK (polyether ether ketone). PEEK was selected because:
- It retains mechanical properties from −200°C to +250°C — covering the full lunar surface temperature range
- It is radiation-resistant, maintaining structural integrity over years of exposure
- It is non-conductive, electrically isolating the embedded electronics from the structure

Inside the hollow core, solid-state components are packed: local motor controllers, segment-level battery cells, embedded heaters, and sensor nodes. These are not accessible for maintenance — they are sealed in for the lifetime of the segment.

### Middle Layer — "The Gel"
Surrounding the core is a layer of thermally conductive, mechanically damping gel. The specific formulation is an open engineering question — candidates include silicone-based gels with ceramic particle fillers for thermal conductivity, similar to compounds used in satellite electronics encapsulation.

The gel serves two purposes:
- **Shock and vibration absorption** — lunar surface operations involve impact, vibration from drilling, and the shock loads of robot footfalls on hard sintered surfaces
- **Thermal bridging** — conducts heat from the electronics core to the outer shell for passive radiation to the environment, or retains heat during cold periods

The gel must remain effective across the full temperature range and must not outgas significantly in vacuum. This is a material engineering challenge that ground testing must resolve.

### Outer Shell — "The Armour"
The outermost layer is a shell of sintered basalt composite — the same material the robots are building with. This is intentional: the robots are armoured with the Moon's own material.

Basalt fibre composite has:
- Excellent thermal resistance
- Good radiation resistance
- High compressive strength
- Low thermal conductivity — it acts as an insulating layer, reducing heat loss from the segment interior during cold periods and protecting electronics from surface heat during hot periods

The outer shell is manufactured on Earth from processed lunar basalt simulant (or eventually from actual lunar basalt in later phases). It is bonded to the gel layer and forms the robot's primary interface with the lunar environment.

---

## The Three Segments

### Upper Leg
- Attaches to the robot body at the hip joint
- Contains the primary drive motor for the hip joint
- Longest segment — approximately 35–45 cm estimated
- Houses the largest battery cell of the three segments
- The hip joint allows full 360-degree rotation in the horizontal plane and approximately 90 degrees of vertical articulation

### Lower Leg
- Connects upper leg to foot via the knee joint
- Contains the knee drive motor
- Intermediate length — approximately 25–35 cm estimated
- Knee joint provides primary extension/flexion for locomotion and body height adjustment

### Foot
- The terminal segment — contacts the lunar surface
- Contains the ankle joint motor and the foot pad itself
- The foot pad is a broad, slightly curved surface to distribute load on soft regolith and provide grip on sintered surfaces
- The ankle joint provides pitch and roll adjustment — the foot stays flat on the surface regardless of leg angle
- A force-torque sensor in the foot pad provides ground contact feedback to the AI — critical for stable locomotion on variable terrain

---

## Variable Ride Height

The three-segment leg geometry allows the robot body to move between a low configuration (body close to the ground, front limbs free for arm work) and a high configuration (maximum ground clearance for rough terrain navigation).

This is achieved by coordinated changes in knee and hip joint angles across all active legs simultaneously — the same way a spider flattens itself or raises up on its legs.

The transition between configurations is smooth and continuous. The AI selects the appropriate height for the current task:
- **High** — locomotion over rough terrain, obstacle clearance
- **Medium** — standard sintering work, steady-state operations
- **Low** — front limbs in arm mode, stable base for manipulation tasks

---

## Leg Discard Mechanism

At the hip joint, a pyrotechnic release mechanism allows the entire leg to be separated from the body on command. This is a one-way operation — the leg cannot be reattached in the field.

When the AI determines a leg is non-functional (based on sensor data, loss of motor response, or structural sensor readings indicating failure), it:

1. Attempts recovery — power cycle, motor reset, joint recalibration
2. If recovery fails — isolates the leg electrically and mechanically
3. Issues discard command — pyrotechnic release fires, leg separates cleanly
4. Recalculates gait — new stable walking pattern computed for remaining legs within seconds
5. Resumes operations — robot continues its task

The discarded leg remains on the lunar surface. It is not a hazard — it has no pressurised components, no toxic materials, and no energy storage that could release suddenly after discard.

**Minimum operational leg count:** 4 legs (estimated). Below 4 legs, stable locomotion becomes difficult to guarantee on uneven terrain, and the robot would likely be assigned stationary tasks only.

---

## Open Engineering Questions

1. **Gel formulation** — What specific compound maintains the required properties across −200°C to +130°C in vacuum over 5+ years?
2. **Basalt composite bond** — How is the outer shell bonded to the gel layer without delamination under thermal cycling?
3. **Pyrotechnic release reliability** — Can the discard mechanism be relied upon after years of exposure without test firing?
4. **Foot pad design** — Optimal geometry for mixed sintered and loose regolith surfaces is not yet determined
5. **Minimum leg count** — 4 legs is an estimate. Actual minimum for stable operation on Peary rim terrain requires locomotion simulation with realistic terrain models

These are engineering questions, not showstoppers. They have known solution approaches. They require testing.
