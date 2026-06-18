# Failure Modes and Graceful Degradation
## Chrystal Moon Base — CMB8LF-L1 Robot Fleet

**Status:** Concept proposal — failure strategy, not yet validated
**Licence:** CC0
**Last updated:** 2026

> A construction fleet operating for years on the Moon with no human hands on site will suffer failures. The design assumption is **not** that robots do not fail — it is that the fleet *degrades gracefully* instead of failing catastrophically. No single robot failure should stop construction, and most failures should be recoverable by the fleet itself. This document consolidates the failure scenarios and the layered response to each, building on the existing Watcher (`head-watcher.md`), head-swap (`head-attachment-mechanism.md`, `head-storage-in-pod.md`), and swarm-logic (`swarm-logic.md`) systems.

---

## The Three Recovery Layers

Every failure is handled by one or more of three layers, tried in order of preference:

1. **Self-recovery** — the robot detects its own fault and adapts (e.g. recomputes its gait after losing a leg, switches to a working head, retreats to a garage on its own power).
2. **Fleet repair** — a **Watcher** robot performs in-field assistance (decoupling a stuck leg, clearing debris, thermal diagnosis) or the robot returns to the Pod for a **head-swap**. The fleet has interchangeable heads and at least two Watchers precisely so this is possible without humans.
3. **Reassignment and quarantine** — if neither restores full function, the swarm AI reassigns the degraded robot to whatever task it can still perform, and redistributes its old work across healthy robots. A fully dead unit is parked clear of the work area as a parts donor.

The guiding principle: **a robot that cannot do its primary job is rarely useless — it is reassigned to a job it can still do.**

---

## Failure-Mode Matrix

The thresholds and recovery times below are concept-level and require Phase 0 validation. They are stated so the strategy is visible, not because the numbers are proven.

| Failure | Detection | First response | Fallback | Worst-case outcome |
|---|---|---|---|---|
| **Sintering laser fails** | Self-test + Watcher beam-quality check | Return to Pod, swap to a spare sintering head | If no spare head: reassign robot to non-laser work (dig, haul, sense) while another robot takes over its sintering | Construction rate drops slightly; robot still useful as bulldozer/hauler/Watcher-support |
| **Power receiver fails** (cannot take beamed power) | Charge-rate monitoring | Move to a better BSM line-of-sight; try relay from a neighbour | If still unpowered: drive on residual battery to nearest garage and dock for direct charge | Robot parked at garage until a receiver head/part swap; not lost |
| **One or more legs fail** | Onboard gait sensors; Watcher thermal/strain scan | AI recomputes gait for remaining legs (see `ai-gait-recalculation.md`) | Down to ~5 legs: continues on reduced gait. Below that: stationary tasks only (operate head in place) until Watcher assists | Immobile-but-working node, or towed to garage |
| **Stuck / mired in regolith** | Position vs commanded motion mismatch | Self free-ing routine (gait change, push-off) | Watcher approaches, clears regolith, decouples a jammed leg | Towed clear by Watcher; if unreachable, parked-in-place donor |
| **Head won't decouple / jammed interface** | Swap attempt fails | Watcher manipulates the coupling; dust-cover/EPM cycle | Robot keeps current head and is tasked to match it | Locked to one role until garage maintenance |
| **Sensor / Watcher-vision fault** | Cross-check against fleet data | Reassign sensing to another robot; degraded robot does brute tasks | Two Watchers mean one can cover the other's role | Reduced situational awareness, flagged to mission control |
| **Comms / laser-link loss** | Link-quality monitoring (pre-failure flagged early) | Switch BSM or relay via neighbouring robot's laser link | Autonomous safe-hold: stop, hold position, beacon, await contact | Temporary isolation, not damage |
| **Thermal overrun** (component overheating) | Watcher thermal imaging flags *before* failure | Reduce duty, move to shade, Thermal-Buddy assist | Power down the affected subsystem; continue on the rest | Early catch usually prevents hard failure |
| **Battery degradation / cell failure** | Capacity trend monitoring | Shorter work cycles, charge more often | Reassign to tasks near a garage / BSM | Reduced endurance, still productive |
| **Total robot failure** (no self-recovery, unreachable) | No response to fleet | Watcher attempts retrieval/tow | Parked clear of work zone | Becomes a **parts/material donor** — another robot can sinter replacement tiles or harvest components |

---

## Specific Notes

**Head-swap is the primary repair, by design.** Because heads (sintering, bulldozer, Watcher, digger, etc.) are interchangeable via the attachment mechanism, the single most common fix for a head-level failure is to return to the Pod and swap. Spare heads are stored in the Pod (`head-storage-in-pod.md`). This is cheaper and faster than recovering a whole robot.

**The Watcher is the fleet's surgeon — and there are two.** A single Watcher is a single point of failure for repairs, so the fleet carries at least two. One can operate on a patient robot while the other continues monitoring, or both can combine on a complex recovery. A Watcher can itself fail; in that case the fleet prioritises swapping a working head onto another robot to restore a second Watcher capability.

**The power-relay function is a "nice-to-have," not a dependency.** The robot-to-robot power relay described in `systems/pod/laser-system.md` (Layer 2) helps reach occluded robots — but if a robot's laser fails, it simply loses the *ability to act as a relay*, which is not a critical loss. No construction task is allowed to depend on a relay chain, exactly so that a laser failure degrades capability gracefully rather than breaking a power backbone.

**Robots are expendable; people are not.** During an SEP event or other hazard, robots are recalled where time allows, but the loss of a robot to a storm, a fall, or a mire is an accepted operational cost. The fleet is sized with this attrition in mind. Resupply via later Pods is **possible but not assumed** — the cadence is unknown and outside the project's control — so the fleet must survive on its own heads, spares, and in-field repair for the full operational life. Any resupply that arrives is a bonus, not part of the baseline.

---

## Open Questions

1. What is the realistic per-robot failure rate over a 5–10 year operational life, by subsystem, and does the planned fleet size (16 per Pod) absorb it?
2. How many spare heads of each type should each Pod carry, given expected failure rates?
3. What is the minimum healthy-fleet size below which construction effectively halts, triggering a resupply priority?
4. Can a robot reliably sinter replacement armour tiles or harvest components from a dead donor unit in field conditions? (Currently TRL 2 — aspirational; see `feasibility-analysis.md`.)
5. What autonomous decision logic governs when to repair in-field versus tow to garage versus abandon as a donor — and how is that decision logged for mission control?
6. How does the fleet behave if **both** Watchers are lost simultaneously, before a resupply?

*Engineers with fault-tolerant robotics, swarm-autonomy, or reliability-engineering experience are invited to review and improve this document via GitHub Issues.*
