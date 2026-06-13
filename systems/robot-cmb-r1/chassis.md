# CMB-R1 Chassis
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal — not yet prototyped  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

> This document describes the founder's vision for the CMB-R1 chassis in detail. Engineering decisions — materials, exact dimensions, specific mechanisms — remain open for expert input. The vision sets the direction. Engineers determine the execution.

---

## Design Philosophy

The chassis is the structural and computational core of the CMB-R1. Every design decision follows three principles:

1. **Materials from the Moon** — no material may be used in the chassis that cannot eventually be sourced from lunar resources. This means no carbon-fibre reinforced polymer (CFRP), no exotic Earth-only composites. Titanium, aluminium, basalt composite, and glass are the candidate materials. The specific selection is an engineering decision.

2. **No ferromagnetic materials on exterior surfaces** — lunar dust is electrostatically charged and behaves like fine magnetic particles in the presence of ferromagnetic materials. Iron and steel are therefore excluded from all exterior-facing components. Titanium and aluminium are non-magnetic and preferred.

3. **Everything protected when not in use** — every interface, every connector, every sensor is shielded from the lunar environment when not actively engaged. Nothing is left exposed unnecessarily.

---

## Shape and Dimensions (Estimated)

The chassis is a compact, enclosed body — smooth exterior, no protruding elements except the tool head and leg attachment interfaces. All sensitive systems are internal. The shape is approximately elliptical when viewed from above, widest at the midpoint, tapering toward front and rear.

Estimated dimensions:
- Length: 1.2–1.5 m
- Width: 0.8–1.0 m
- Height (body only, excluding head): 0.3–0.4 m

These are starting estimates. Final dimensions depend on the mass budget, leg geometry, and internal component layout — all of which require engineering analysis that does not yet exist.

---

## The Nine Universal Coupling Points

The chassis has **nine identical universal coupling interfaces**:

- **Eight leg coupling points** — distributed symmetrically around the chassis perimeter, four per side
- **One tool head coupling point** — centrally mounted on the upper surface of the chassis

All nine interfaces are identical in mechanical design, electrical connection, and optical connection. Any leg can attach to any leg coupling point. The tool head attaches to the central upper point.

This universality is fundamental to the design philosophy:
- Any leg can function as an arm — the AI decides which legs to reassign based on current task and terrain
- A damaged leg is decoupled and discarded — the AI immediately recalculates the optimal configuration for the remaining legs
- A leg stuck in terrain can be deliberately decoupled to free the robot — no mechanical lockup propagates to the rest of the chassis
- Future leg or head types can be introduced without redesigning the chassis

The AI continuously monitors which coupling points are occupied, what type of component is attached, and what configuration is optimal for the current task. When a reconfiguration occurs — planned or due to failure — the AI updates its model within seconds and resumes operation.

**Eight legs plus one head is considered the optimal baseline.** More coupling points would add mass and complexity without proportional benefit. Fewer would reduce redundancy. This number is a founder's recommendation, not a fixed constraint — engineers may reach a different conclusion.

---

## Tool Head Position — Central Upper Mount

The tool head is mounted centrally on the upper surface of the chassis, not at the front.

This was a deliberate decision: a front-mounted head means the robot's own body, legs, and chassis edges can obstruct the head's field of view or working range depending on orientation. A centrally upper-mounted head has unobstructed 360-degree access — the robot's own structure never gets in the way.

This is particularly important for:
- **Watcher head** — needs unobstructed 360° sensor coverage
- **Sintering head** — laser must reach any point around the robot without the chassis blocking it
- **Thermal buddy head** — thermal camera needs full view of the work area behind the sintering robot

The tool head coupling point uses the same electromagnetic locking mechanism as all other coupling points (see below).

---

## Coupling Interface — Electromagnetic Lock with Basalt Protective Cover

Every coupling point — for legs and for the tool head — uses the same interface mechanism:

**Electromagnetic locking:**
The coupling is held by an electromagnet that requires current to release. When current is present and the release command is given, the magnet releases and the component can be decoupled. When current is absent or no release command is given, the component is locked in place. This is a fail-safe design: power loss means the leg or head stays attached, not that it falls off.

**Basalt protective cover:**
Every unused or active coupling point is protected by a small basalt composite cover plate. When a leg or head is attached, the cover plate moves aside to expose the interface. When the leg or head is removed, the cover plate returns to protect the exposed interface from dust, temperature extremes, and micrometeorite impact.

The cover plate movement is frictionless where possible — the same electromagnetic principle used in the maglev transport system, applied at small scale. The cover requires power only to move, not to stay in position (held by mechanical detent when closed, held by the attached component when open).

This means that at no point is any electrical or optical connector exposed to the lunar environment for longer than the brief moment of coupling or decoupling.

---

## Laser Power Receivers — Distributed Across Entire Body

Rather than a single central laser power receiver that must track the mast BSM, the CMB-R1 uses **distributed receivers across the entire upper chassis surface and potentially the upper leg segments**.

Many small GaAs photovoltaic cells — optimised for the laser wavelength — are distributed across all upper-facing surfaces. Each receiver has a small independent pointing adjustment, driven by voice coil actuators, allowing the AI to optimise the angle of each cell individually for maximum power capture.

**Why distributed receivers:**
- The robot never needs to orient itself toward the mast — it can work in any direction
- If one receiver is dusty, damaged, or shadowed, others continue operating
- The AI selects the optimal active subset at any moment and fine-tunes each cell angle
- Receivers on the upper leg segments extend the total collection area and provide coverage when the chassis is tilted on uneven terrain

The communication laser uses the same receiver network — the same cells that receive power also receive data signals, with the AI distinguishing power and communication wavelengths. This reduces the total number of components required.

All receiver adjustments are small — a few degrees at most. The cells do not track the mast continuously like a solar panel. They are pre-positioned by the AI at the start of each work period and adjusted only when efficiency drops below a threshold.

---

## All-Laser Communication

The CMB-R1 communicates exclusively by laser — no radio systems are used.

**Robot to mast:** Laser link to the nearest BSM on the mast. Power delivery and data communication share the same optical path — different wavelengths, separated by the onboard optics.

**Robot to robot:** Direct laser links between chassis receiver surfaces. Robots working in proximity can communicate directly without routing through the mast.

**Why laser only:**
- The Moon has no atmosphere to scatter or absorb laser signals — zero propagation loss
- No radio frequency interference between robots working in close proximity
- Extremely high data bandwidth at negligible power compared to the sintering laser
- No heavy radio antenna hardware required
- Consistent with the laser-based architecture of the entire system

The mast communicates to Earth via Ka-band radio — laser-to-Earth links are not yet mature enough for operational use at this distance.

---

## Internal Structure

**Structural frame:** Non-ferromagnetic metal alloy — titanium or aluminium, or a combination. The specific alloy is an engineering decision based on mass budget, thermal properties, and manufacturability from lunar resources. No iron-containing alloys on exterior-facing or dust-exposed surfaces.

**Electronics bay:** Central upper section houses the main compute unit, power conditioning electronics, and communication optics. Thermally coupled to the chassis wall for passive heat management.

**Battery:** Solid-state battery cells distributed through the chassis structure. Total onboard energy storage provides an estimated 2–4 hours of reduced-power autonomous operation during laser power interruptions — sufficient to survive shadow periods and communication outages.

**Exterior:** Sintered regolith composite panels — the same material the robot builds with. Non-magnetic, thermally stable, radiation-resistant, and manufacturable from lunar resources in later phases.

---

## Thermal Management

Peary rim surface temperatures range from approximately −50°C to +10°C — mild compared to equatorial sites but still requiring active thermal management for electronics.

- Multi-layer insulation on all exterior surfaces reduces heat loss during cold periods
- Embedded heaters maintain minimum operating temperatures during shadow periods
- Passive thermal coupling between electronics and chassis wall manages heat during high-power operations
- The basalt composite exterior acts as a thermal buffer

---

## Mass Estimate

| Configuration | Estimated mass |
|---|---|
| Chassis body only (no legs, no head) | 80–130 kg |
| Full robot with 8 legs, no head | 260–380 kg |
| Full robot with 8 legs and heaviest head | 290–430 kg |

All figures are rough estimates. A real mass budget requires component-level engineering design that does not yet exist. These numbers are starting points for feasibility assessment only.

---

## What Engineers Decide

The following are explicitly left open for engineering expertise:

- Specific alloy composition for structural frame
- Exact number and placement of laser receiver cells
- Detailed coupling interface mechanism design
- Cover plate actuation method (electromagnetic, spring-loaded, or other)
- Exact chassis dimensions and mass budget
- Number of coupling points if 9 proves non-optimal
- Thermal control system specifics

The founder's position: whatever works, works. The constraints are the principles — non-ferromagnetic exteriors, lunar-sourceable materials, universal coupling interfaces, distributed laser receivers, protected connections. How those principles are implemented is engineering.

---

## Open Questions

1. What non-ferromagnetic alloy provides the optimal combination of structural performance, mass, thermal stability, and eventual lunar manufacturability?
2. How many distributed receiver cells are needed for reliable power reception across all expected robot orientations and distances from the mast?
3. What is the minimum cover plate actuation time for the coupling interfaces — and does this create operational delays during head swapping?
4. Can the same optical surface serve both power reception and data communication simultaneously, or does this require optical separation?
5. What is the actual mass of a flight-quality chassis at these specifications?

---

## Power Architecture — Distributed Solid-State Energy Storage

The CMB-R1 uses a fully distributed solid-state battery system. There is no single central battery. Instead, energy storage is distributed across every structural segment of the robot — chassis and all eight legs.

**Why solid-state:**
- No liquid electrolyte — no freezing risk at −150°C, no boiling risk at +130°C
- No leakage or outgassing in vacuum
- Operates across the full lunar surface temperature range without thermal management of the cells themselves
- Mechanically robust — solid-state cells tolerate vibration and impact better than liquid electrolyte cells
- Can be encapsulated completely inside structural components

**Distribution — 25 units total:**

| Location | Units | Primary function |
|---|---|---|
| Foot segment × 8 | 8 | Local sensor power, foot pad force sensing |
| Lower leg segment × 8 | 8 | Knee actuator power, local electronics |
| Upper leg segment × 8 | 8 | Hip actuator power, primary leg energy storage |
| Chassis central | 1 | Main computer, AI, communication optics, head interface |
| **Total** | **25** | Fully distributed across entire robot |

**Why distributed:**

Weight is spread evenly across the entire robot rather than concentrated in one location. This lowers the centre of mass, improves stability on uneven terrain, and means no single point concentrates significant mass.

Redundancy is built in automatically — if a leg segment is damaged and discarded, only the energy stored in that segment is lost. The remaining 24 units continue operating without interruption. The AI adjusts power routing instantly.

Each solid-state unit is sized to contribute a proportional share of the total energy budget. The chassis unit is the largest — it powers the most critical systems. The foot units are the smallest — they power only local sensors.

---

## Hibernation System

During shadow periods — when the Peary rim site loses solar illumination — the laser power system shuts down and the robots enter hibernation. The distributed solid-state energy system sustains the robot through these periods on minimal power draw.

**Hibernation sequence:**
1. Laser power drops below operational threshold
2. AI detects power loss and initiates hibernation protocol
3. All non-essential systems shut down immediately — sintering, locomotion, active sensors
4. Robot halts at current position and locks all leg joints in place
5. Low-power heating activates across all 25 solid-state units and critical electronics — just enough to prevent temperature dropping below minimum operating threshold
6. AI enters minimal monitoring mode — checking power levels and temperature only
7. Communication laser remains active at minimal power for contact with mast

**On power restoration:**
1. Solar curtain generates first power as illumination returns
2. Mast detects power and sends wake signal via communication laser
3. AI exits hibernation — systems initialise sequentially
4. Temperature check across all segments before locomotion resumes
5. Robot resumes task from exact position where it halted

The hibernation heating draw is a small fraction of operational power — the distributed solid-state units across 25 locations provide enough reserve for the longest expected shadow periods at Peary, estimated at a few days based on published illumination data.

---

## Full Layer Architecture — "Everything Inside the Bone"

Every structural segment of the CMB-R1 — all eight leg segments (foot, lower leg, upper leg) and the chassis body — follows identical layered construction from inside out:

**Layer 1 — The Bone (structural core):**
Non-ferromagnetic structural alloy — titanium, aluminium, or combination. Hollow tube or shell. Houses all electronics, solid-state battery cell, actuator controller, heater, and sensors for that segment. Everything electronic lives inside the structural material, protected from the outside by the structure itself.

**Layer 2 — The Gel (protective surround):**
Thermally conductive, mechanically damping gel completely surrounding the bone. Absorbs shock and vibration. Conducts heat from electronics to the outer shell for passive radiation. Must remain stable across the full lunar temperature range in vacuum — specific formulation is an open engineering question.

**Layer 3 — The Armour (basalt composite exterior):**
Sintered regolith composite outer shell. Non-magnetic. Thermally stable. Radiation resistant. Manufacturable from lunar resources in later phases. This is the surface that contacts the lunar environment — dust, temperature extremes, micrometeorite flux, radiation.

**The principle:** nothing electronic or sensitive is ever exposed to the lunar environment. The bone protects the electronics. The gel protects the bone. The basalt protects the gel. Three layers between the electronics and the Moon.

**Frictionless where possible:**
All moving interfaces — leg joints, cover plates, coupling mechanisms — use electromagnetic principles to eliminate or minimise mechanical friction. No lubricants that could fail in vacuum or temperature extremes. No mechanical wear surfaces exposed to lunar dust. Where friction cannot be avoided, dry film coatings rated for vacuum and the full temperature range are used.

---
