# CMB-R1 Onboard AI
## Chrystal Moon Base — Robot Intelligence Concept

**Status:** Concept proposal — no software implementation exists  
**Licence:** CC0

---

## Overview

Each CMB-R1 robot runs its own onboard AI — Level 1 in the three-level AI architecture described in SWARM-LOGIC.md. This AI handles all tasks that require real-time response: locomotion, balance, immediate obstacle avoidance, tool head operation, and local fault response.

The onboard AI is designed to operate the robot usefully even if communication with the swarm coordinator (Level 2) is completely lost. A robot that stops when its radio link fails is a single point of failure. A robot that continues useful autonomous operation for hours without coordination is a resilient system.

---

## Functional Domains

**Locomotion control:**
All leg joint angles are computed in real time by the locomotion AI. Input: desired body position and velocity from task planner. Output: joint angle commands to all 6 leg actuators at ~100 Hz. The locomotion AI handles terrain adaptation automatically — the task planner does not need to think about individual foot placements.

**Balance:**
An inertial measurement unit (IMU) provides body orientation and acceleration data. The balance AI adjusts leg forces in real time to maintain stability. On sloped terrain, it adjusts the body lean angle to keep the center of mass over the support polygon.

**Gait management:**
Standard hexapod gaits (alternating tripod, wave gait, etc.) are pre-programmed. The AI selects the appropriate gait for the current speed and terrain. After a leg loss event, the AI computes a new stable gait for the reduced leg count (see AI-GAIT-RECALCULATION.md).

**Head operation:**
The sintering, thermal buddy, bulldozer, and watcher heads each have their own operational AI module, activated when the corresponding head is attached. These modules handle the real-time control of the head's specific tools — laser scanning, thermal feedback, blade depth control, sensor operation.

**Fault detection:**
All sensors are continuously monitored for values outside expected ranges. Detected faults are classified by severity: warning (log and report), degraded (continue with reduced capability), critical (halt and alert swarm coordinator).

---

## Hardware (Proposed)

A space-qualified processor with:
- Sufficient compute for real-time locomotion control (100 Hz loop rate)
- Radiation tolerance for the Peary rim environment
- Low power consumption (target < 50W for compute only)
- Redundancy: dual processors with cross-checking

Candidate processor families include radiation-hardened ARM cores used in current spacecraft computers, though the specific selection requires a power-performance trade study.

---

## Software Development

The onboard AI software does not exist. Writing it is one of the most significant engineering challenges of this project. The software must be:
- Formally verified for safety-critical functions (fault detection, leg discard)
- Tested in hardware-in-the-loop simulation before any physical robot testing
- Updateable in flight (the Earth-side team can upload new AI models via the mast data link)

Software developers with experience in robotic control systems, embedded AI, and space software standards are specifically invited to contribute.
