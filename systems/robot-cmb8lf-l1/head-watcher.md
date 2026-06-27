# CMB8LF-L1 — The Watcher Task (Quality Control and Monitoring)
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

> **Terminology updated (was "Watcher head").** An earlier version of this document
> described the Watcher as one of four physical **heads** a robot would swap on. That is
> **superseded**: in the current design the full Watcher sensor suite (LiDAR, GPR, thermal,
> dust, radiation, microseismometer, etc.) is **integrated into every robot permanently**.
> "Watcher" is therefore a **task the swarm AI assigns**, not a head a robot picks up. Any
> robot can be the Watcher; the only thing that changes is what it is told to focus on. The
> sensor descriptions below remain valid — they are simply integrated, not detachable. See
> `swarm-logic.md` and `overview.md`.

---

## Role

"Watcher" is the observation **task**: a robot assigned to it focuses its (always-integrated)
sensor suite on comprehensive observation — of the construction work being done, of the
terrain being prepared, of the other robots, and of the broader environment. Because every
robot carries the full suite, the swarm AI can have one, two, or several robots in the
Watcher role at once, and can change that at any moment. Everything observed is processed
locally by the robot's onboard AI, relevant data is transmitted to the mast, and from there
to Earth for review by human teams.

A robot in the Watcher task does not build while observing — it watches, measures, and
reports, so the builders can work better and so scientists and engineers on Earth can see
things nobody anticipated. When the build needs more hands, that same robot can drop the
Watcher task and resume sintering or terrain work, because nothing was swapped to make it a
Watcher in the first place.

---

## Why a Dedicated Watcher

Autonomous construction in a completely novel environment will produce surprises. Regolith that behaves differently than simulants. Thermal gradients that cause unexpected cracking patterns. Surface features that affect stability. Robot behaviours that work differently in actual lunar conditions than in simulation.

If the only robots on the surface are builders, these observations are incidental — noticed only if they affect the immediate task. A dedicated observer ensures that nothing is missed, that all data is captured systematically, and that the human teams on Earth have the information they need to adapt the mission in real time.

The Watcher is also the quality control system for the construction work. A sintered floor that looks complete from above may have subsurface voids, uneven density, or thermal crack networks that would compromise future dome foundations. The Watcher finds these problems before they matter.

---

## Sensor Suite (Proposed)

The Watcher head carries a comprehensive sensor package. The specific instruments are proposals — the exact selection requires engineering trades on mass, power, and data volume.

### Visual and Spatial Mapping
- **Stereo camera pair** — high-resolution RGB imaging for visual documentation and photogrammetric surface mapping
- **LiDAR unit** — millimetre-accuracy 3D terrain scanning for construction quality verification and obstacle mapping
- **Structured light projector** — short-range surface topology measurement for crack detection and surface flatness verification

### Thermal Monitoring
- **Wide-field thermal camera** — monitors the full sintering work area, tracking heat distribution patterns and cooling gradients
- **Point infrared pyrometer** — precise temperature measurement of specific surface points, calibrated for regolith (anorthosite) emissivity

### Structural Assessment
- **Ground-penetrating radar (GPR)** — subsurface imaging to detect voids, density variations, and crack networks below the visible sintered surface. Frequency range TBD by engineering — lunar regolith GPR has been demonstrated by LPR on the Chang'e 4 and 5 missions.
- **Acoustic tap sensor** — contact sensor that taps the sintered surface and analyses the acoustic response for density and void detection — similar in principle to tapping a wall to find a stud

### Environmental Monitoring
- **Dust particle counter** — measures particle concentration and size distribution in the local environment, tracking dust mobilisation by robot activity
- **Electrostatic field sensor** — monitors surface charge buildup, which affects dust adhesion to robot surfaces and optical components
- **Radiation dosimeter** — continuous measurement of the radiation environment at surface level, contributing to long-term data on actual Peary rim radiation conditions
- **Microseismometer** — detects surface vibrations from robot operations, and potentially from natural microseismic activity

### Robot Health Monitoring
- **Multi-robot thermal imager** — scans the other robots in the team for thermal anomalies indicating overheating components or failing seals
- **Optical joint inspection** — close-range cameras for visual inspection of robot leg joints, head attachment interfaces, and outer shell integrity

---

## Data Architecture

The Watcher generates significantly more data than any other robot. Raw sensor data cannot all be transmitted to Earth in real time — the Ka-band antenna bandwidth does not support it.

The proposed data architecture:

**Onboard processing (real time):**
- All incoming sensor streams are processed by the Watcher's onboard AI
- Anomaly detection runs continuously — anything outside expected parameters triggers a priority flag
- Routine data is compressed and queued for scheduled transmission windows
- Flagged anomalies are transmitted immediately at higher priority

**Transmission to mast:**
- Watcher communicates with the mast BSM via a short-range optical link or radio
- The mast aggregates data from all robots and manages the Earth uplink queue

**Transmission to Earth:**
- Compressed routine data transmitted during scheduled windows
- Priority flags transmitted immediately
- Full raw data archives stored onboard for later bulk download during high-bandwidth windows

**Earth-side review:**
- Human teams on Earth review Watcher data during each transmission window
- Findings are analysed and, where needed, mission parameters are adjusted
- All Watcher data is published openly — anyone can review it

---

## What the Watcher Might Find

This is speculative by definition — if we knew exactly what would be found, we would not need the Watcher. But the categories of discovery are predictable:

**Construction quality issues:**
- Subsurface voids in the sintered layer that would cause structural failure under later loading
- Thermal crack networks from too-rapid cooling
- Density gradients indicating incomplete sintering at depth
- Surface delamination at the boundary between sintered and loose regolith

**Environmental surprises:**
- Regolith properties at the specific Peary landing site that differ from simulant predictions
- Dust behaviour patterns under robot locomotion that differ from vacuum chamber tests
- Electrostatic charge accumulation affecting robot systems in unexpected ways
- Thermal gradients in the near-surface environment that affect sintering parameters

**Robot health indicators:**
- Early signs of joint wear or dust ingress before they become failures
- Thermal anomalies in power systems under actual operational load
- Gait patterns that indicate developing leg problems before sensor data confirms them

**Scientific observations:**
- The Watcher is not a scientific instrument in the primary sense — it is a construction monitor. But any data gathered at 88.63°N on the lunar surface is scientifically valuable. Radiation measurements, dust particle distributions, surface thermal behaviour, and near-surface geology data will all be shared with the scientific community openly.

---

## Naming

The Watcher does not yet have a formal designation beyond its function. The founder refers to it as "the Watcher" — a robot that watches everything thoroughly, measures and gives data about many things, and ensures that nothing important goes unseen.

Suggestions for a more formal designation are welcome via GitHub Issues.

---

## Open Questions

1. **GPR frequency selection** — what frequency optimally penetrates sintered regolith at the expected densities?
2. **Data volume management** — what compression ratio is achievable for the sensor suite within Ka-band bandwidth constraints?
3. **Acoustic sensor contact force** — how much force does the tap sensor apply, and does this risk damaging freshly sintered surfaces?
4. **Multi-robot thermal imaging range** — at what distance can the thermal imager detect meaningful anomalies on other robots?
5. **Power budget** — the Watcher sensor suite is power-intensive. What is the realistic draw from the laser power beaming budget?
