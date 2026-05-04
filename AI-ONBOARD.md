# CMB-R1 Onboard AI
## Chrystal Moon Base — Robot Intelligence Concept

**Status:** Concept proposal — no software implementation exists  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

---

## Overview

Each CMB-R1 robot runs its own onboard AI — Level 1 in the three-level AI architecture described in SWARM-LOGIC.md. This AI handles everything that requires real-time response: locomotion, balance, tool head operation, local fault response, and hibernation management.

The onboard AI is designed around one requirement: **the robot must remain useful even when completely isolated.** If the mast communication link is lost, if the swarm coordinator fails, if Earth cannot be reached — the individual robot continues operating on its last known task assignment until contact is restored or a pre-programmed emergency response triggers.

---

## Functional Domains

### Locomotion and Balance
All leg joint angles are computed in real time. The locomotion AI handles terrain adaptation automatically — the task planner does not think about individual foot placements. Variable ride height, arm mode transitions, and cooperative cargo carrying are all managed at this level.

After any leg configuration change — planned reassignment or emergency discard — the gait AI recalculates a stable walking pattern for the current leg count within seconds. See AI-GAIT-RECALCULATION.md.

### Head Operation
Each head type has its own operational AI module, activated when that head is attached. The sintering module controls laser scanning patterns and power levels. The thermal buddy module manages infrared lamp power based on thermal camera feedback. The bulldozer module controls blade depth and compaction. The watcher module manages the full sensor suite and data prioritisation.

### Fault Detection and Response
All sensors are monitored continuously against expected value ranges. Faults are classified and responded to autonomously:

**Warning** — log, report to swarm coordinator, continue operation
**Degraded** — continue with reduced capability, alert swarm coordinator
**Critical** — halt affected system, alert swarm coordinator, await instruction or execute pre-programmed response
**Emergency** — execute pre-programmed emergency response immediately, alert simultaneously

The AI never waits for Earth confirmation before executing an emergency response. Earth is informed, not consulted.

### Laser Receiver Management
The AI continuously monitors power input from all distributed receiver cells across the chassis and upper leg surfaces. It selects the optimal active subset, adjusts individual cell angles for maximum capture, and switches between BSM sources on the mast as the robot moves. This happens automatically with no task planner involvement.

### Communication Management
All laser communication — to the mast BSMs and directly to other robots — is managed at the onboard AI level. Data from all onboard sensors is compressed, prioritised, and queued for transmission. The AI distinguishes between routine data (scheduled transmission) and priority alerts (immediate transmission regardless of queue).

---

## Hibernation Management

Hibernation is one of the most critical onboard AI functions. When solar power is unavailable, the onboard AI is responsible for keeping the robot alive until power returns.

**Hibernation initiation — triggered by:**
- Mast wake signal announcing shadow period
- Local power level dropping below operational threshold
- Swarm coordinator hibernation command

**Hibernation sequence:**
1. Current task suspended — robot halts at current position
2. All leg joints locked in current position — mechanical detent engages
3. Tool head locked — electromagnetic coupling confirmed
4. All active systems shut down sequentially — sintering, locomotion, active sensors
5. Communication reduced to minimum keep-alive or shut down completely
6. Solid-state battery thermal management activates — minimum heater power only
7. AI enters monitoring loop — checks power level and temperature at minimum frequency
8. Robot waits

**During hibernation:**
The solid-state batteries distributed across all 25 locations (chassis + 3 segments × 8 legs) provide only survival power. Nothing else. This is not a reduced-power working mode. The robot does not think, does not move, does not communicate beyond a minimal keep-alive signal if power permits. It survives.

**Wake sequence — triggered by:**
- Mast wake signal (primary)
- Local power level rising above wake threshold (backup)

**Wake sequence:**
1. Basic system initialisation
2. Temperature check across all 25 solid-state units and critical electronics
3. If temperatures within operating range — proceed
4. If temperatures below minimum — wait for warming before proceeding
5. Communication restored — contact mast, receive current status
6. Self-diagnostic — all systems checked before any movement
7. Receive task assignment from swarm coordinator
8. Resume operations

The robot never moves before completing the full wake sequence. A cold joint actuated before reaching operating temperature risks mechanical damage.

---

## Pre-Programmed Emergency Scenarios

The communication round-trip delay to Earth is a minimum of 2.6 seconds. In most emergencies, 2.6 seconds is too long to wait. All foreseeable emergency scenarios are therefore pre-programmed before launch.

**Examples of pre-programmed responses:**

| Situation | Automated Response |
|---|---|
| Leg sensor failure | Assess leg function, attempt recovery, discard if non-functional |
| Head power failure | Return to Pod, retrieve replacement |
| Laser power loss | Initiate hibernation if batteries below threshold |
| Robot stuck — locomotion failure | Alert Watcher, halt, await assistance |
| Thermal overheating | Shut down affected system, alert swarm coordinator |
| Mast communication loss | Continue current task autonomously for defined period, then safe halt |
| Multiple simultaneous failures | Execute degraded-mode protocol for remaining functional systems |

If a situation occurs that matches no pre-programmed scenario, the robot executes a safe halt — stops all activity, maintains position, alerts the mast at maximum available power, and waits. Earth is then informed and provides instruction.

The goal of Phase 0 ground testing is to discover as many unforeseen situations as possible before launch. Every scenario discovered in Demonstrators 3, 4, and 5 becomes a pre-programmed response before the flight system is finalised.

---

## Hardware

A space-qualified processor with:
- Sufficient compute for real-time locomotion control at minimum 100 Hz loop rate
- Radiation tolerance for the Peary rim environment over multi-year operation
- Low power consumption — target below 50W for compute only, much less during hibernation
- Dual processors with cross-checking for safety-critical functions

Specific processor selection requires a power-performance-radiation trade study that does not yet exist.

---

## Software Development

The onboard AI software does not exist. Writing it is one of the most significant engineering challenges of this project. Requirements include:

- Formal verification for all safety-critical functions
- Hardware-in-the-loop simulation testing before any physical robot testing
- Updateable in flight — new AI models uploaded via mast data link
- Deterministic behaviour — the same situation must always produce the same response

Software engineers with experience in robotic control systems, embedded AI, space software standards, and formal verification are specifically invited to contribute via GitHub.
