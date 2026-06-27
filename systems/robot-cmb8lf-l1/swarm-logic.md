# CMB8LF-L1 Swarm Logic
## Chrystal Moon Base — Robot Coordination Concept

**Status:** Concept proposal — no software implementation exists 
**Author:** Berechja Kerkdijk 
**Licence:** CC0

---

## Core Philosophy — No Fixed Roles

The CMB8LF-L1 swarm operates on one fundamental principle: **no robot has a permanent role.**

Every chassis is identical, and every robot carries the full capability set permanently built in — all sensors, the sintering laser, infrared annealing lamps, communication, and power reception. A robot does not change *hardware* to change role; it changes *what it is told to do*. The AI — onboard and mast-based — continuously evaluates the current situation and assigns the optimal task to each of the 16 robots.

This is not a team of specialists. It is a team of generalists that can specialise instantly on demand — by task assignment, not by swapping parts.

> **Note on an earlier concept (superseded).** An older version of this design used 8 robots that changed role by swapping one of four physical "heads" (sintering / thermal-buddy / bulldozer / watcher) stored in the Pod. That model is **superseded**. The current design is **16 identical robots with everything integrated**; role is set by software task assignment. The only parts a robot still swaps are the two *heavy tools* (bulldozer blade and digger), via the EPM arm interface — see `tools/README.md`. Where older documents still describe "head swapping," read it as the integrated model below.

---

## The Fleet

**16 identical chassis per Pod.** All launched together, 2 per garage across 8 garages (see `../pod/overview.md`, "Why 16 robots"). Every robot carries the complete integrated capability set — no robot is missing any sense or function.

**Roles are assigned, not installed.** Because sensing, sintering, and annealing are always present on every robot, "being a Watcher" or "being a sintering robot" is simply what task the swarm AI has currently given that robot — it can change in software, instantly, with no trip to the Pod and no part swap.

**Default starting pattern** (pre-programmed on Earth, illustrative, not fixed):
- some robots tasked with sintering the floor
- some tasked with terrain preparation (with the bulldozer blade fitted)
- some tasked with quality-control / observation (the Watcher task)
- annealing/cooling control runs on every sintering robot via its own infrared lamps, with broader-area thermal management assigned as needed

This is a starting point, not a fixed assignment. It can be changed at any time by the AI or by Earth.

---

## Dynamic Configuration

Any of the following task changes can happen at any time — in software, without hardware swaps:

**AI-initiated (autonomous):**
- A robot's sintering laser degrades → AI reassigns its sintering work to healthy robots and tasks it with sensing, hauling, or terrain work it can still do
- Construction quality below threshold → AI assigns more robots to the Watcher (quality-monitoring) task
- All terrain within current radius prepared → AI shifts robots from terrain-prep to sintering to accelerate floor construction
- Emergency situation → AI reassigns any or all robots as needed

**Earth-initiated (via uplink):**
- Mission controllers observe Watcher data and decide more scanning is needed → command sent → more robots assigned to observation
- Scientists request specific terrain investigation → a robot redirected to that area
- Construction strategy changes → full re-tasking commanded from Earth
- Any task change Earth considers beneficial

**The only physical swap left is the heavy tool.** A robot that needs to grade or excavate walks to the tool rack and fits the bulldozer blade or digger via the EPM interface (`tools/README.md`); when done, it returns the tool and resumes integrated work. Sensing and sintering are never swapped — they are always on board. The AI maintains a complete inventory of which heavy tools are where, in use, in reserve, or damaged.

---

## The Watcher — EHBO, Researcher, and Surgeon

The Watcher is the most versatile robot in the fleet. It operates simultaneously in three roles:

### Role 1 — Researcher (terrain and environment)
- Ground-penetrating radar scans subsurface structure and regolith depth
- LiDAR maps terrain in millimetre accuracy ahead of the construction team
- Thermal camera monitors surface temperature patterns
- Dust particle counter measures local dust environment
- Radiation dosimeter records surface radiation at the specific Peary location
- Microseismometer detects surface vibrations and potential microseismic activity
- All data transmitted to Earth in real time — scientists see the Peary subsurface for the first time

The Watcher tells the bulldozer how deep the regolith is and where solid substrate begins. The bulldozer does not guess — it works from Watcher data.

### Role 2 — EHBO (continuous health monitoring)
- Thermal imaging of all other robots — detects overheating components before failure
- Joint inspection cameras — visual check of all leg joints and coupling interfaces
- Vibration analysis — abnormal vibration patterns indicate developing mechanical problems
- Power monitoring — tracks energy consumption of each robot against expected values
- Communication quality monitoring — detects degrading laser links before they fail

The Watcher catches problems early. A leg running 15°C hotter than expected is flagged and investigated before it fails completely.

### Role 3 — Surgeon (active intervention)
When a robot needs physical assistance, the Watcher acts:
- 2 legs convert to arms
- Watcher approaches the patient robot
- Decouples a damaged or stuck leg
- Retrieves and installs a replacement leg, heavy tool, or spare integrated module from Pod / garage storage
- Clears debris or regolith from a stuck component
- Assists another robot in a task requiring two sets of arms

Two Watchers in the fleet means one can perform surgery while the other continues research and health monitoring. Or both can assist simultaneously in a complex recovery operation. Or both can focus entirely on terrain research during rapid construction phases. The configuration is always whatever the situation requires.

---

## Operational Pattern — Flexible, Not Fixed

The default construction pattern uses two teams working simultaneously, but this is a starting configuration not a rigid rule.

**Standard construction sequence within any team:**
1. Watcher scans terrain ahead — determines regolith depth, identifies obstacles
2. Bulldozer prepares surface based on Watcher data — grades to solid substrate
3. Sintering robot fuses prepared surface — ring by ring
4. Thermal buddy controls cooling — prevents thermal cracking

**But the AI may at any moment:**
- Merge both teams into one large team for a specific task
- Split into more than two teams for parallel work in different areas
- Assign all robots to a single role temporarily (all sintering for maximum speed, all watching for maximum data collection)
- Redirect individual robots independently of their team

There are no fixed teams. There are only tasks and the robots best suited to perform them at this moment.

---

## Hibernation — Everything Stops

During shadow periods, when solar power is unavailable, **all robots enter full hibernation simultaneously.**

Hibernation is not a reduced-power operating mode. It is a survival state.

**What stops completely:**
- All locomotion
- All construction activity
- All active sensing
- All laser communication (or reduced to absolute minimum keep-alive signal)
- All AI processing except basic monitoring

**What continues at absolute minimum:**
- Solid-state battery thermal management — just enough heat to prevent temperatures dropping below minimum operating threshold for critical components
- Basic power level monitoring — waiting for the signal that solar power has returned
- Mast keep-alive — the mast maintains minimal function to detect returning sunlight

**The solid-state distributed battery system exists for one purpose during hibernation:** survival until the next sunrise. Not for working. Not for communicating. Not for deciding. Purely for keeping the electronics alive through the cold.

When solar power returns, the mast detects it first and sends a wake signal. Robots initialise sequentially, run self-diagnostics, and resume work from exactly where they stopped.

---

## AI Architecture — Three Levels

### Level 1 — Individual Robot AI (onboard each robot)
Real-time control of locomotion, tool head operation, and local fault response. Operates independently if mast communication is lost. Can sustain useful autonomous operation for several hours without coordination.

### Level 2 — Swarm Coordinator (mast-based computer)
- Monitors all 16 robots simultaneously
- Assigns tasks and manages configuration changes
- Aggregates Watcher data for quality assessment
- Manages the heavy-tool rack and spare-parts inventory (blades, diggers, spare legs/modules)
- Decides ring advancement and construction progression
- Initiates hibernation and wake sequences

### Level 3 — Earth Oversight (via uplink, 1.3–2.6 second delay)
- Reviews all transmitted data during each communication window
- Issues configuration change commands
- Adjusts construction parameters
- Makes strategic decisions
- Cannot react in real time — all time-critical decisions are made by Level 1 and Level 2

---

## Emergency Response — Pre-Programmed Scenarios

The communication delay to Earth (minimum 2.6 seconds round trip) means that emergency response must be autonomous. The AI cannot wait for Earth approval in a time-critical situation.

All foreseeable emergency scenarios are pre-programmed before launch:
- Robot leg failure → discard and reconfigure
- Head failure → return to Pod and replace
- Robot stuck → Watcher dispatched, physical assistance attempted
- Laser power interruption → hibernation initiated
- Mast communication loss → individual robots continue last assigned task autonomously
- Multiple simultaneous failures → pre-defined degraded-mode operation

If a situation occurs that no pre-programmed response covers, the AI halts the affected robot safely, alerts Earth via the mast, and waits for instruction. The 2.6-second delay is then accepted as the cost of an unforeseen situation.

The goal of Phase 0 Demonstrators 3, 4, and 5 is to discover as many unforeseen situations as possible on Earth — so that as few as possible remain unforeseen on the Moon.

---

## Open Questions

1. What software architecture achieves the required fault-tolerance and real-time coordination on space-qualified embedded hardware?
2. What is the optimal spare inventory — how many spare legs, integrated modules, and heavy tools (blades, diggers) per Pod, based on expected failure rates and task demands?
3. How does the swarm coordinator prioritise competing task demands when resources are limited?
4. What is the minimum number of functional robots that still allows meaningful construction progress?
5. How are configuration change commands validated before execution — to prevent accidental or erroneous reconfigurations from Earth?

---

## The Road First — Operational Sequence from Pod

Before any construction of the main floor begins, the swarm executes a specific preparatory sequence:

**Step 1 — Path creation:**
Bulldozer robots create a prepared path from the Pod to the intended centre of the 20-hectare floor. This path is graded, levelled, and cleared of loose regolith and obstacles.

**Step 2 — Path sintering:**
Sintering robots follow the bulldozers, fusing the prepared path into hard sintered regolith. This becomes the permanent access road — the first sintered surface beyond the Pod bloom leaves.

**Step 3 — Protected locomotion:**
From this point, all robots travel to and from the construction site on the hard sintered road. Never on loose regolith. This protects leg joints, coupling points, and sensors from dust ingress and abrasive wear — dramatically extending robot operational life.

**Step 4 — Floor expansion:**
From the road, construction expands outward. The Watcher scans terrain, the bulldozer prepares sections, the sintering robots fuse them. Ring by ring, the 20-hectare floor grows — always with robots moving on hard sintered surface, never on loose dust.

**Why this order matters:**
Robots that walk on loose regolith accumulate dust in every joint, every coupling point, every sensor aperture. The road-first approach means the most dust-sensitive period — early operations before any sintered surface exists — is minimised to only what is absolutely necessary for the bulldozers doing their initial work.

The bulldozer bears the dust burden so the rest of the fleet does not have to.
