# Cargo Carrying Protocol
## Chrystal Moon Base — Multi-Robot Logistics

**Status:** Concept proposal — not yet demonstrated  
**Licence:** CC0

---

## Overview

Processing modules, spare equipment, and construction materials must be transported from the arrival landing pad to their operational positions entirely by CMB-R1 robots — underground, without any separate transport vehicle. This document describes the proposed protocol for multi-robot cooperative cargo transport.

---

## Single Robot Carrying

A single CMB-R1 robot can carry objects up to its estimated payload capacity using its front limbs in arm mode. The robot walks on four legs while carrying the object with its front two limbs.

Estimated single-robot payload: the robot's own mass minus the leg structure mass. A rough estimate is 50–150 kg for comfortable carrying (precise figure depends on leg joint actuator torque ratings not yet determined).

For objects below this mass, a single robot handles transport. The Watcher robot monitors during transit.

---

## Multi-Robot Cooperative Carrying

For objects exceeding single-robot capacity — particularly processing modules, which may mass several hundred kilograms — multiple robots cooperate.

**Protocol:**

1. **Assessment:** Swarm coordinator receives module mass and dimensions from manifest data. Determines minimum robot count required.

2. **Team assembly:** Robots designated for transport stop their current construction task, return heads to pod storage (if needed — carrying heads during transport is evaluated case by case), and gather at the module.

3. **Position assignment:** Each robot is assigned a specific grip position on the module. Positions are selected to distribute the load evenly and to allow all robots to walk in the same direction simultaneously.

4. **Grip engagement:** All robots simultaneously extend front limbs and engage grip on assigned positions. Watcher confirms all grips are secure before transport begins.

5. **Synchronized movement:** Swarm coordinator issues identical locomotion commands to all carrying robots, adjusted for their relative positions. All robots move at the same speed and heading. If any robot stumbles or loses grip, all robots halt immediately.

6. **Watcher monitoring:** Throughout transport, the Watcher monitors module tilt, grip status, and robot health. Any anomaly triggers an immediate halt.

7. **Placement:** At the target location, robots lower the module to the ground in a coordinated sequence. Position accuracy is estimated at ±20 cm — sufficient for module connection to utility conduits.

---

## Key Uncertainties

1. The locomotion coordination algorithm for multi-robot carrying is not implemented. It is significantly more complex than individual robot locomotion because errors in one robot's movement are transmitted mechanically to all other robots through the cargo.

2. The grip force required to securely carry a heavy module on uneven terrain, without damaging the module's exterior, is not characterised.

3. The minimum number of robots required for any given module mass depends on actuator specifications not yet defined.

Ground testing of multi-robot cooperative transport (Demonstrator 4/5) is essential before this protocol can be considered validated.
