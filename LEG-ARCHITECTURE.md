# CMB-R1 Leg Architecture
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal — not yet prototyped 
**Author:** Berechja Kerkdijk 
**Licence:** CC0

> This document describes the founder's vision for the CMB-R1 leg system. Engineering decisions — specific materials, actuator types, exact dimensions — are explicitly left open for expert input. The vision sets the direction. Engineers determine the execution.

---

## Overview

Each CMB-R1 robot has 8 legs. Every leg consists of 3 segments: upper leg, lower leg, and foot. All segments follow identical internal construction principles. All joints aim to be frictionless where technically possible.

The leg system follows the same core philosophy as the entire robot: **everything critical is inside, everything exposed is protected, everything that can fail has a fallback.**

---

## The Three Segments

### Upper Leg
- Attaches to the robot chassis at the hip coupling point
- Longest segment — approximately 35–50 cm estimated
- Contains: hip joint actuator, primary solid-state battery cell for this leg, local motor controller, embedded heaters, temperature and structural sensors
- Hip joint allows full 360-degree rotation in the horizontal plane and approximately 120 degrees of vertical articulation

### Lower Leg
- Connects upper leg to foot via the knee joint
- Intermediate length — approximately 25–40 cm estimated
- Contains: knee joint actuator, solid-state battery cell, local controller, sensors
- Knee joint provides primary extension and flexion for locomotion and body height adjustment

### Foot
- Terminal segment — contacts the lunar surface
- Contains: ankle joint actuator, solid-state battery cell, local controller, force-torque sensor array, surface detection sensors
- Ankle joint provides pitch and roll adjustment — foot stays level on the surface regardless of leg angle
- Foot pad design is left to engineering — the founder notes that a snowshoe-like design may suit loose regolith, but once the sintered basalt floor exists, robots walk on hard surface almost exclusively, making this less critical

---

## Joint Design — Frictionless Where Possible

Every joint in the leg system — hip, knee, ankle — aims to be frictionless. Two promising approaches are noted for engineering evaluation:

**Flexure bearings (compliant mechanisms):**
Metal that bends rather than rotates. No hinge pin, no bearing, no lubrication required. The material itself acts as both spring and joint. This technology is already used in spacecraft where vacuum operation and extreme temperatures make conventional bearings problematic. Titanium is an excellent candidate material for flexure joints — strong, flexible enough for the required range of motion, non-magnetic, and eventually sourceable from lunar ilmenite.

**Electromagnetic actuation:**
Consistent with the frictionless philosophy used throughout the chassis coupling system. Where conventional joints cannot be avoided, the goal is to minimise contact surfaces and eliminate all lubricants that could fail in vacuum or extreme temperatures.

**The engineering question for experts:**
Which actuation principle — flexure bearing, piezo motor, shape memory alloy, conventional motor with vacuum-rated dry film coating, or another approach entirely — provides the optimal combination of reliability, power consumption, temperature range, and lunar material compatibility? This is one of the most important open engineering questions in the CMB-R1 design.

---

## Actuation — One Motor Per Segment

Each segment contains its own independent actuator. There are no cables, tendons, or push-rods running from a central location through multiple segments. Every segment is self-contained.

**Why one motor per segment:**

**Reliability:** A cable or rod running from the chassis to the foot passes through three segments and two joints. One failure anywhere along that path disables the entire leg. An independent motor per segment means a failure in the lower leg does not affect the upper leg or foot.

**Power efficiency:** Not all 24 leg joints (8 legs × 3 segments) operate simultaneously. During locomotion, a fraction of joints move at any time. During sintering work, most joints are stationary. Individual motors draw power only when their specific joint is active — no energy is wasted driving a central system for joints that are not moving.

**Fault isolation:** A failed motor in one segment is detected by the segment's own sensors. The AI isolates it, compensates with other joints where possible, or triggers the leg discard protocol if the segment is non-functional.

**Consistency with distributed philosophy:** Just as each segment has its own solid-state battery cell, each segment has its own actuator. Each segment is a complete, independent functional unit.

---

## Internal Construction — Layer Architecture

All three segments follow identical layered construction from inside out:

**Layer 1 — The Bone:**
Structural core of non-ferromagnetic alloy — titanium, aluminium, or a combination determined by engineering. Hollow tube or shell housing all electronics, battery cell, actuator, controller, heaters, and sensors. No ferromagnetic materials — lunar dust is electrostatically charged and ferromagnetic surfaces attract and retain dust aggressively.

**Layer 2 — The Gel:**
Thermally conductive, mechanically damping gel surrounding the bone completely. Absorbs shock and vibration from surface operations. Conducts heat from electronics to the outer shell for passive radiation management. Must maintain properties across the full operational temperature range (−150°C to +130°C) in vacuum — specific formulation is an open engineering question.

**Layer 3 — The Armour:**
Sintered basalt composite outer shell. Non-magnetic. Thermally stable. Radiation resistant. The same material the robot builds with — the robot is armoured by the Moon itself. Manufacturable from lunar resources in later phases, reducing Earth dependency over time.

---

## Thermal Management

At Peary rim, surface temperatures are estimated between −50°C and +10°C during normal illuminated operations — significantly more stable than equatorial sites. During shadow periods, temperatures may drop to −100°C to −150°C.

**Heating approach:**
Small, precisely placed heating elements positioned directly against each critical component — battery cell, motor controller, and primary sensor nodes. Not a central heater that warms the entire segment — that wastes energy heating empty space and structural material that does not need to be warm.

During hibernation, these micro-heaters operate at absolute minimum power — just enough to keep critical components above their minimum operating temperature. The distributed solid-state batteries across all segments provide the energy for this survival heating.

**Why Peary helps:**
The narrow temperature range at Peary means the heaters have a much smaller gap to bridge compared to equatorial sites. Smaller gap = less power required = smaller heaters = less mass. This is one of the thermal advantages of the polar location beyond just continuous sunlight.

---

## Sensors — Everything Has Its Own Eyes

Every component, every joint, every segment has dedicated sensors. The philosophy mirrors modern automotive design — hundreds of small sensors distributed throughout, each monitoring its specific domain, each contributing to the AI's complete picture of the robot's state.

**Per segment (minimum):**
- Temperature sensor — electronics and structural
- Structural strain gauge — detects deformation or damage
- Actuator position encoder — precise joint angle
- Actuator load sensor — detects unusual resistance or blockage
- Battery cell health monitor — voltage, temperature, state of charge

**Per foot (additional):**
- Force-torque sensor array — measures contact force and direction
- Surface contact sensor — detects whether foot is on hard sintered basalt or loose regolith
- Slip detection — detects if the foot is sliding on the surface

All sensor data is processed locally by the segment's own controller. Summary data is passed up to the chassis AI. The chassis AI decides what is significant enough to share with the swarm coordinator or transmit to Earth.

---

## The Road First — Protecting the Legs

A fundamental operational principle of the CMB-R1 fleet directly affects leg longevity:

**Robots never walk on loose regolith if they can avoid it.**

The bulldozer robots create a prepared path from the Pod to the construction site first. The sintering robots then fuse that path into hard basalt. All subsequent robot movement happens on this hard sintered surface — not on loose, electrostatically charged, abrasive lunar dust.

This single operational decision dramatically extends leg life:
- Hard basalt surface = minimal abrasion on foot pads
- No loose dust = dramatically reduced dust ingress into joints and coupling points
- Stable surface = less dynamic load variation = less stress on joints and actuators
- Predictable terrain = AI locomotion planning is simpler and more reliable

The only robot that regularly operates on unprepared regolith is the bulldozer. Its leg design may therefore warrant specific attention from engineers — though the identical chassis principle means any design improvement benefits all robots.

---

## Leg Discard Protocol

If any leg is damaged beyond recovery, the AI executes a controlled discard:

1. Damage confirmed by segment sensors — motor failure, structural damage, or thermal anomaly
2. Recovery attempted — power cycle, joint recalibration, reduced-load operation
3. If recovery fails — leg electrically and mechanically isolated
4. Pyrotechnic or electromagnetic release fires — leg separates cleanly at chassis coupling point
5. Gait recalculation — new stable walking pattern computed for remaining 7 legs within seconds
6. Operations resume — robot continues its assigned task

A robot on 7, 6, or even 5 legs moves more slowly and carries less load but does not stop. The mission continues.

**Minimum operational leg count:** estimated 5 legs for continued useful operation on the sintered basalt surface. Below this, the robot is assigned stationary tasks only — operating its head while remaining in one location — until a Watcher robot can assist or a head swap changes its role.

---

## Open Engineering Questions

1. Which actuation principle — flexure bearing, piezo motor, shape memory alloy, or other — best meets the requirements of vacuum operation, temperature range, power efficiency, and eventual lunar material compatibility?
2. What specific titanium or aluminium alloy provides the optimal combination of flexure bearing performance, mass, and thermal stability?
3. What gel formulation maintains required properties across −150°C to +130°C in vacuum over 5+ years?
4. What is the minimum heating power required to maintain critical components above operating temperature during the longest expected Peary shadow period?
5. What foot pad geometry provides the best performance across both loose regolith (early operations) and hard sintered basalt (ongoing operations)?
6. What is the actual mass of a complete leg assembly at flight-quality design?
