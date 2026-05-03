# CMB-R1 Front Limbs — Dual Function (Leg and Arm)
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

The two front limbs of every CMB-R1 robot are designed to function as either legs or arms. This dual capability enables robots to handle tool heads, assist other robots, and carry cargo — without requiring dedicated manipulator arms as separate hardware.

---

## Switching Between Modes

**Leg mode (default):** The front limbs function identically to the four other legs. The robot walks on all six legs. The front limbs' end-effectors (feet) contact the ground normally.

**Arm mode:** The robot lowers its body onto the four rear and midship legs, spreading them for maximum stability. The front limbs lift clear of the ground. The foot end-effectors reconfigure to grip mode — a mechanism allows the foot pad to partially close around an object, providing a grasping surface.

The transition between modes is a coordinated sequence:
1. Robot identifies arm-mode task and approaches target
2. Body lowers to low-ride configuration
3. Weight transfers to four remaining legs
4. Front limbs lift and end-effectors switch to grip configuration
5. Task performed (head retrieval, object placement, cargo handling)
6. Front limbs return to leg position, body raises, normal locomotion resumes

---

## End-Effector Design

The end-effector must function as both a foot (contact with lunar regolith, shock absorption, force sensing) and a hand (gripping objects of varying shapes, secure retention).

**Proposed design:** A broad base plate (foot function) with three articulated grip fingers around its perimeter. In foot mode, the fingers fold flat and the base plate provides the ground contact surface. In grip mode, the fingers extend and curve inward to grasp the target object.

The grip fingers are not precision manipulators — they do not need to handle small, delicate objects. Their function is to securely hold tool heads, carry module components, and stabilise cargo during transport. Precision is provided by the robot positioning its whole body relative to the target, not by fine finger control.

---

## Tool Head Retrieval

The most important arm-mode application is autonomous tool head retrieval from Pod storage:

1. Robot walks to Pod storage chamber containing target head
2. Arm mode activates
3. Robot positions front limbs on either side of head attachment bracket
4. Front limbs grip the bracket
5. Robot lifts head slightly and carries it to attachment position on its own front interface
6. Head attachment mechanism engages (see HEAD-ATTACHMENT-MECHANISM.md)
7. Arm mode deactivates, robot resumes normal locomotion

This sequence must succeed reliably in the actual lunar environment — in dust, in temperature extremes, after long periods of storage. Demonstrator 3 tests a simplified version of this sequence.

---

## Multi-Robot Cargo Transport

Multiple robots can cooperate to carry a single heavy object using their front limbs simultaneously:

- Each robot positions itself at an assigned contact point on the cargo
- Front limbs grip assigned contact points
- Swarm coordinator issues synchronized locomotion commands
- All robots move at the same speed and direction, maintaining grip throughout

This is mechanically complex and has not been demonstrated. It is a design goal, not a proven capability. See SWARM-LOGIC.md and CARGO-CARRYING-PROTOCOL.md.
