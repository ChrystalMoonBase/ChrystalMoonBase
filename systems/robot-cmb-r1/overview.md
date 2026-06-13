# CMB-R1 Construction Robot — Overview
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal — not yet prototyped  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

> This document describes a concept robot system. No physical prototype exists. All specifications are estimates and starting points for engineering. Corrections and improvements are actively sought.

---

## Design Philosophy

The CMB-R1 is designed around one principle: **no single failure should stop the mission.**

Every component that can fail has a fallback. Every robot that breaks can be compensated for by its teammates. Every leg that is damaged can be discarded. The AI continuously recalculates around whatever is still working.

A modern car contains hundreds of sensors, cameras, computers, and actuators — all invisible, all integrated, all working simultaneously. The CMB-R1 follows the same principle: **everything that can be integrated, should be integrated.** The robot does not swap heads to see, to measure, or to think. It always sees. It always measures. It always thinks.

---

## Core Concept: One Chassis, All Capabilities

All CMB-R1 robots share an **identical chassis** with all sensing, communication, and power reception capabilities permanently integrated. The robot is a complete autonomous platform at all times — not a carrier for interchangeable modules.

**Permanently integrated (always present on every robot):**
- Full sensor suite — thermal camera, LiDAR, ground-penetrating radar, stereo cameras, dust counter, radiation dosimeter, microseismometer
- Sintering laser — integrated optical system for fusing regolith
- Laser power reception — distributed GaAs panels on chassis and upper leg segments
- Laser communication — all robot-to-robot and robot-to-mast communication
- Onboard AI — locomotion, fault detection, task execution, hibernation management
- Infrared lamps — for controlled cooling of freshly sintered material

---

## Tool Interface — Open Engineering Question

Two construction functions may require a physical interface that cannot be fully integrated into the chassis without significant trade-offs:

**1. Heavy sintering tool**
A high-power focused sintering nozzle for deep structural work may exceed what can be elegantly integrated into the chassis front face. Whether this is best implemented as a fixed integrated component, a folding mechanism, or a swappable attachment is an open engineering question.

**2. Bulldozer blade**
A blade for clearing, grading, and compacting regolith before sintering is inherently a large physical component. Whether this is best implemented as a folding integrated blade, a swappable attachment, or a separate dedicated robot variant is an open engineering question.

The founder has no strong preference on implementation. The functional requirements are clear — the engineering solution is not. Both options, and combinations of both, remain open:

| Option | Description | Trade-off |
|---|---|---|
| Fully integrated, folding | Blade and nozzle fold into chassis when not in use | Complexity, mass, lunar dust in mechanisms |
| Swappable attachment (2 types only) | Sintering nozzle or bulldozer blade attach at front interface | Simpler chassis, requires storage and swap mechanism |
| Dedicated robot variant | One chassis variant per primary function | Loses flexibility, increases parts inventory |
| Other | Engineering may identify a better solution | Unknown until prototyped |

This is explicitly left open for engineers to resolve based on prototyping and testing.

---

## Physical Description

The CMB-R1 is an **octopod** — eight legs. The front two legs are dual-function limbs capable of operating as arms when the robot lowers its body and transfers weight to the remaining six legs.

| Parameter | Estimate |
|---|---|
| Body length | ~1.2 m |
| Body width | ~0.8 m |
| Standing height (variable) | ~0.4–1.0 m |
| Mass (without attachments) | ~250–350 kg (estimate) |
| Legs | 8 (octopod) |
| Front limbs | Dual-function: legs or arms |

---

## Laser Power Reception

Each robot receives power wirelessly via laser from the mast BSMs. Distributed GaAs receiver panels on the chassis and upper leg segments convert the laser beam to electricity. The AI selects the optimal BSM (at ~7 m, 14 m, 21 m, 28 m, or 35 m) for each robot based on its current position. Receiver panels tilt automatically to optimise angle of incidence. Operational range: **2+ km** from mast base in vacuum.

---

## Operational Roles

Because sensing and basic sintering are always integrated, every robot can simultaneously:
- Map terrain ahead
- Monitor the health of nearby robots
- Control cooling of freshly sintered material (via integrated infrared lamps)
- Sinter regolith
- Communicate with the mast and other robots

Role specialisation is achieved through **task assignment by the swarm AI**, not through hardware configuration. A robot assigned to quality control focuses its sensors on that task. A robot assigned to sintering focuses its laser on construction. The hardware is identical — the behaviour differs.

---

## Document Index

| Document | Description |
|---|---|
| chassis.md | Body structure, materials, and dimensions |
| leg-architecture.md | Three-segment leg design overview |
| front-limbs-arm-mode.md | Dual-function limb design |
| swarm-logic.md | Multi-robot coordination concept |
| ai-onboard.md | Onboard AI architecture |
| ai-gait-recalculation.md | Gait recalculation after leg loss |
| laser-communication.md | Laser-only communication system |
| cargo-carrying-protocol.md | Module transport by robot teams |
| head-sintering.md | Sintering tool interface (open engineering question) |
| head-bulldozer.md | Bulldozer interface (open engineering question) |
