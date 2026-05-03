# CMB-R1 Construction Robot — Overview
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal — not yet prototyped  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

> This document describes a concept robot system. No physical prototype exists. All specifications are estimates and starting points for engineering. Corrections and improvements are actively sought.

---

## Design Philosophy

The CMB-R1 is designed around one principle: **no single failure should stop the mission.**

Every component that can fail has a fallback. Every robot that breaks can be compensated for by its teammates. Every leg that is damaged can be discarded. Every tool head can be swapped by another robot. The AI continuously recalculates around whatever is still working.

This is not over-engineering — it is the minimum acceptable standard for a system that must operate autonomously for years, 384,000 km from the nearest repair facility, in one of the most hostile environments in the solar system.

---

## Core Concept: One Chassis, Many Roles

All 8 CMB-R1 robots share an **identical chassis**. There is no specialised hardware at the body level. The same legs, the same power receiver, the same compute unit, the same arm-limbs appear on every robot.

Specialisation is achieved entirely through **interchangeable tool heads** — modular attachments that connect to the robot's front interface and define its role. Four head types are carried to the Moon. Any robot can carry any head. Any idle robot can pick up a spare head from the Pod storage chambers and contribute to the current task.

This approach provides:
- **Manufacturing simplicity** — one chassis design, one parts inventory
- **Operational flexibility** — roles reassigned in real time by the AI
- **Redundancy** — no single robot is irreplaceable
- **Scalability** — future missions can add new head types without redesigning the chassis

---

## Physical Description

The CMB-R1 is a hexapod — six legs in the standard walking configuration. The front two legs are dual-function limbs capable of operating as arms when the robot lowers its body and transfers weight to the remaining four legs.

**Estimated dimensions (concept):**
- Body length: ~1.2 m
- Body width: ~0.8 m
- Standing height (variable): ~0.4–1.0 m
- Mass (without head): ~250–350 kg estimate
- Payload capacity: TBD by engineering

The robot's ride height is variable. The body can be raised for maximum ground clearance over rough terrain, or lowered to a stable resting position when the front limbs need to function as arms. This variable height is achieved through the leg joint geometry — like a spider adjusting its stance.

---

## The Four Tool Heads

### 1. Sintering Head
Carries the laser nozzle and focusing optics that concentrate the received laser power onto the regolith surface. This is the primary construction tool — it melts and fuses lunar soil into solid basalt.

### 2. Thermal Buddy Head
Carries infrared lamps and a high-resolution thermal camera. This robot follows directly behind the sintering robot, monitoring the freshly sintered material, controlling the cooling rate, and preventing thermal shock cracking. Sintering quality depends as much on controlled cooling as on the initial melt.

### 3. Bulldozer Head
Carries curved regolith blades for clearing, levelling, and compacting the surface ahead of the sintering robots. Raw regolith must be prepared — loose material moved, surface graded — before sintering can produce a structurally sound result.

### 4. Watcher Head
Carries a comprehensive sensor suite for quality control, terrain mapping, structural inspection, and system monitoring. See HEAD-WATCHER.md for full specification.

---

## Operational Teams

The 8 robots operate in two teams of 4, working simultaneously on opposite halves of the sintering ring. Each team contains one of each head type. The two teams rotate in opposite directions — like the two hands of a clock moving away from each other — completing each ring simultaneously before advancing outward.

This pattern means:
- The full ring circumference is always being worked in both directions
- No robot is ever blocked by another
- If one team loses a robot, the other team can redistribute to compensate

---

## The Front Limbs — Dual Function

The front two limbs of every CMB-R1 can operate as either legs or arms. When arm mode is needed:

1. The robot approaches the target (Pod storage chamber, another robot, a piece of equipment)
2. The body lowers onto the remaining four legs, which spread for maximum stability
3. The front two limbs lift clear of the ground and their end-effectors engage
4. The robot can now grip, lift, carry, and place objects while walking on four legs

This capability serves several critical functions:
- **Head swapping** — robots change their own tool heads autonomously from Pod storage
- **Module carrying** — multiple robots can cooperate to carry processing modules from the landing site to their operational position
- **Maintenance** — robots can handle small equipment, move obstacles, and assist other robots

A robot carrying a module with its front limbs while walking on four legs is within the designed capability. Multiple robots carrying a single large module simultaneously — coordinated by the swarm AI — is also a design goal, though it has not been demonstrated and carries significant coordination complexity.

---

## Fault Tolerance

### Leg Loss
If any leg is damaged beyond recovery, the AI executes the following sequence:

1. Damage assessment — sensors confirm leg is non-functional
2. Discard command — the damaged leg is released at the body joint and left on the surface
3. Gait recalculation — AI computes a stable gait for the remaining legs (minimum 4 legs required for continued operation)
4. Work resumption — robot continues its assigned task on the recalculated gait

A robot operating on 5, 4, or even 3 legs may move more slowly and carry less load, but it does not stop. The mission continues.

### Head Failure
If a tool head fails, the robot returns to the Pod, deposits the failed head, and retrieves a spare from storage. If no spare of that type is available, the AI reassigns roles across the remaining functional robots.

### Power Interruption
If laser power beaming is interrupted — due to mast pointing failure, dust on optics, or other causes — each robot has onboard solid-state battery capacity for several hours of autonomous operation. The robot continues reduced-power operations (locomotion, sensing) while awaiting power restoration.

---

## Document Index

| Document | Description |
|---|---|
| CHASSIS.md | Body structure, materials, and dimensions |
| LEG-ARCHITECTURE.md | Three-segment leg design overview |
| LEG-SEGMENT-FOOT.md | Foot design and surface contact |
| LEG-SEGMENT-LOWER.md | Lower leg segment internals |
| LEG-SEGMENT-UPPER.md | Upper leg segment internals |
| FRONT-LIMBS-ARM-MODE.md | Dual-function limb design and operation |
| FAULT-TOLERANCE-LEG-LOSS.md | Leg discard and gait recalculation |
| HEAD-SINTERING.md | Sintering head specification |
| HEAD-THERMAL-BUDDY.md | Thermal monitoring head specification |
| HEAD-BULLDOZER.md | Regolith clearing head specification |
| HEAD-WATCHER.md | Sensor and quality control head specification |
| HEAD-ATTACHMENT-MECHANISM.md | Modular connection interface |
| HEAD-STORAGE-IN-POD.md | Storage arrangement in Pod chambers |
| SWARM-LOGIC.md | Multi-robot coordination concept |
| AI-ONBOARD.md | Onboard AI architecture |
| POWER-RECEPTION-LASER.md | Laser power reception system |
| THERMAL-MANAGEMENT.md | Robot thermal control |
| DUST-PROTECTION.md | Dust mitigation design |
| CARGO-CARRYING-PROTOCOL.md | Module transport by robot teams |
