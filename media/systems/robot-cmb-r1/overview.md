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

---

## Core Concept: One Chassis, Many Roles

All 8 CMB-R1 robots share an **identical chassis**. Specialisation is achieved entirely through **interchangeable tool heads** — modular attachments that connect to the robot's front interface and define its role. Four head types are carried to the Moon. Any robot can carry any head.

---

## Physical Description

The CMB-R1 is an **octopod** — eight legs. The front two legs are dual-function limbs capable of operating as arms when the robot lowers its body and transfers weight to the remaining six legs.

Each robot unit houses **two complete working ends on a single chassis** — a double-sided design that provides 8 simultaneous builders from 4 physical units.

| Parameter | Estimate |
|---|---|
| Body length | ~1.2 m |
| Body width | ~0.8 m |
| Standing height (variable) | ~0.4–1.0 m |
| Mass (without head) | ~250–350 kg |
| Legs | 8 (octopod) |
| Effective builders per chassis | 2 (double-sided) |

---

## The Four Tool Heads

| Head | Role |
|---|---|
| Sintering | Primary construction — fuses regolith into basalt |
| Thermal Buddy | Controls cooling rate after sintering — prevents cracking |
| Bulldozer | Prepares and grades surface before sintering |
| Watcher | Quality control, terrain mapping, robot health monitoring |

---

## Laser Power Reception

Each robot receives power wirelessly via laser from the mast BSMs. Distributed GaAs receiver panels on the chassis and upper leg segments convert the laser beam to electricity. The AI selects the optimal BSM (at 11 m, 22 m, 33 m, 44 m, or 55 m) for each robot. Receiver panels tilt automatically to optimise angle. Operational range: **2+ km** from mast base.

---

## Document Index

| Document | Description |
|---|---|
| chassis.md | Body structure, materials, and dimensions |
| leg-architecture.md | Three-segment leg design overview |
| front-limbs-arm-mode.md | Dual-function limb design |
| head-sintering.md | Sintering head specification |
| head-thermal-buddy.md | Thermal monitoring head specification |
| head-bulldozer.md | Regolith clearing head specification |
| head-watcher.md | Sensor and quality control head specification |
| head-attachment-mechanism.md | Modular connection interface |
| head-storage-in-pod.md | Storage arrangement in Pod chambers |
| swarm-logic.md | Multi-robot coordination concept |
| ai-onboard.md | Onboard AI architecture |
| ai-gait-recalculation.md | Gait recalculation after leg loss |
| laser-communication.md | Laser-only communication system |
| cargo-carrying-protocol.md | Module transport by robot teams |
