# CMB-R1 Swarm Logic
## Chrystal Moon Base — Robot Coordination Concept

**Status:** Concept proposal — no simulation or prototype exists  
**Licence:** CC0

---

## Overview

Eight robots. One shared task. No human operator in the loop.

The swarm logic is the software and communication system that coordinates the 8 CMB-R1 robots into a coherent construction team. It distributes tasks, resolves conflicts, adapts to failures, and optimises the construction pattern continuously — all autonomously, with human oversight limited to the review of transmitted data and the ability to send new parameters via the uplink.

This document describes the concept. The actual swarm logic software does not exist yet. Writing it is one of the most significant engineering challenges of the entire Phase 0.2 concept. Contributions from roboticists, AI engineers, and control systems specialists are specifically invited.

---

## The Two-Team Structure

The 8 robots are divided into two teams of 4, designated Alpha and Beta. Each team contains one robot of each head type: sintering, thermal buddy, bulldozer, and watcher.

The two teams work simultaneously on opposite halves of the current sintering ring, rotating in opposite directions — Alpha clockwise, Beta counter-clockwise. They meet at the same completion points at the same time and advance to the next ring together.

This structure provides:
- **Parallel progress** — the full ring is worked simultaneously, halving the time per ring compared to a single team
- **Mutual visibility** — each team's Watcher can observe the other team's work area, providing redundant quality control
- **Conflict avoidance** — by working in opposite directions from defined starting points, the teams never occupy the same space

---

## Role Sequence Within Each Team

Within each 4-robot team, the operational sequence at any point on the ring is:

1. **Bulldozer** — leads, clearing and grading the regolith surface ahead
2. **Sintering robot** — follows, fusing the prepared surface with laser power
3. **Thermal buddy** — follows the sintering robot, monitoring and controlling the cooling rate of the fresh sinter
4. **Watcher** — follows the full team, inspecting completed work, monitoring all robots, and scanning the environment ahead

This sequence is the standard operating pattern. The AI maintains appropriate spacing between robots based on current sintering speed, cooling rate, and terrain conditions.

---

## Role Reassignment

If any robot fails or becomes unavailable, the AI reassigns roles among the remaining functional robots. The priority order for reassignment is:

1. **Sintering** — construction cannot proceed without it. Highest priority to maintain.
2. **Thermal buddy** — without cooling control, sintering quality degrades. Second priority.
3. **Bulldozer** — can be partially compensated by sintering directly onto less-prepared regolith at reduced quality and speed.
4. **Watcher** — quality control and monitoring are important but not immediately mission-critical.

A robot with a different head type can retrieve the appropriate head from Pod storage and reconfigure itself. The time penalty for head retrieval and reconfiguration must be weighed against the cost of operating without that function. The AI makes this trade-off based on current task parameters.

---

## Construction Pattern — Concentric Rings

The sintering pattern is concentric rings expanding outward from the Pod. Within each ring, robots move at a consistent angular velocity, maintaining their relative positions in the sequence.

**Ring width:** Determined by the effective sintering width of the sintering head in one pass. Multiple overlapping passes per ring may be required for full-depth sintering — the AI optimises the number of passes based on energy input measurements and Watcher-reported surface quality.

**Ring progression:** When a ring is completed to the Watcher's quality standard, both teams advance outward to the next ring simultaneously. If quality is below standard at any point, the affected section is re-sintered before progression.

**Ring pattern analogy:** The completed floor is like the rings of a tree — one uninterrupted record of every hour the system has operated. Each ring is a timestamp of construction progress.

---

## AI Architecture Concept

The swarm AI operates at three levels:

### Level 1 — Individual Robot AI (Onboard)
Each robot runs its own local AI handling:
- Locomotion and balance
- Immediate obstacle avoidance
- Tool head operation
- Sensor data processing
- Local fault response (leg discard, head failure)

The individual AI can operate the robot independently for several hours if communication with the swarm coordinator is lost. This prevents a communication failure from stopping all robots simultaneously.

### Level 2 — Swarm Coordinator (Mast-Based)
The mast base computer runs the swarm coordination layer:
- Task assignment and scheduling for all 8 robots
- Position tracking of all robots in real time
- Quality control data aggregation from Watcher robots
- Construction progress monitoring
- Ring advancement decisions
- Role reassignment on robot failure
- Power delivery scheduling (which BSM serves which robot)

The swarm coordinator has a complete model of the construction state at all times. It is the single source of truth for what has been built, what is being built, and what needs to be built next.

### Level 3 — Mission AI (Earth-Uplinked)
Human teams on Earth review Level 2 data during each transmission window. They can:
- Adjust construction parameters (ring width, sintering speed, quality thresholds)
- Assign new areas for construction
- Override specific robot assignments
- Pause or halt construction
- Upload updated AI models to Level 1 or Level 2

The Earth-side team cannot issue real-time commands — the communication delay (1.3–2.6 seconds one-way) makes real-time control impractical. They issue parameter updates and strategic decisions; the swarm executes them autonomously.

---

## Cooperative Module Transport

The swarm logic also manages the transport of processing modules from the landing site to their operational positions. This is a qualitatively different task from ring sintering — it requires multiple robots to coordinate physical handling of a single heavy object.

The proposed approach:
- The swarm coordinator designates a transport team (minimum 2, maximum 6 robots depending on module mass)
- Each robot in the team is assigned a specific contact point on the module
- Coordinated locomotion commands keep all robots moving at the same speed and in the same direction
- The Watcher robot monitors the module and the team, detecting tilt, contact loss, or robot difficulties
- If any robot in the team loses footing or fails, the coordinator immediately adjusts the other robots' commands to compensate

This cooperative transport has not been prototyped or simulated. It is one of the most mechanically complex tasks in the swarm's repertoire. Ground testing of multi-robot cooperative transport is a Phase 0 priority.

---

## Communication Architecture

**Robot to mast:** Each robot communicates with the mast BSMs via a short-range radio link. The link must be robust to the dust environment and to the line-of-sight obstructions created by the robots themselves and by surface terrain.

**Mast to Earth:** Ka-band dish antenna on the mast top. Data rate TBD by link budget calculation. Transmission windows are determined by Earth visibility from the Peary rim — from the near-side rim, Earth is always visible (a significant advantage of the Peary north pole location over far-side sites).

**Latency:** 1.3–2.6 seconds one-way Earth-Moon communication delay. All swarm decisions must be made autonomously. Earth cannot react faster than this delay allows.

**Bandwidth:** The full sensor data from 8 robots, especially the Watcher's comprehensive sensor suite, exceeds available uplink bandwidth. Onboard compression and priority queuing are essential. Full data archives are stored onboard for bulk download during high-bandwidth windows.

---

## Open Questions

1. **Swarm coordination software** — no implementation exists. What framework, language, and architecture are most appropriate for a fault-tolerant, real-time multi-robot coordinator on embedded hardware?
2. **Communication reliability** — what radio protocol and frequency provide the required reliability in the lunar dust environment and in the electromagnetic conditions on the Peary rim?
3. **Multi-robot transport** — what coordination algorithm achieves stable cooperative transport of a rigid body by 2–6 robots on irregular terrain?
4. **Quality threshold definition** — what specific measurements from the Watcher define "acceptable quality" for a sintered ring, and what triggers a re-sinter command?
5. **Level 1 / Level 2 handoff** — if the mast computer fails, how long can Level 1 (individual robot AI) maintain useful autonomous operations, and what degraded-mode construction is achievable?

Software engineers and roboticists are invited to engage with these questions via GitHub Issues and pull requests.
