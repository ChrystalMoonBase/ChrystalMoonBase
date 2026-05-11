# The Pod — Phase 0.2 Overview
## Chrystal Moon Base — First Lunar Mission Concept

**Status:** Concept proposal — feasibility not yet demonstrated 
**Author:** Berechja Kerkdijk 
**Licence:** CC0 
**Last updated:** 2026

> Every number in this document is an estimate based on publicly available data and physics. This is a concept sketch, not an engineering specification. If you find an error, please open an issue or submit a correction. That is the entire point of publishing this openly.

---

## What the Pod Is

The Pod is the proposed first physical mission of Chrystal Moon Base to the lunar surface. It is a single launch — one Falcon Heavy rocket — carrying everything needed to begin autonomous construction of a sintered basalt floor on the rim of Peary Crater at the lunar north pole.

The Pod does not carry humans. It does not need to return. It is designed to land, deploy, and operate indefinitely — for as long as the sun shines on the Peary rim, which is approximately 89% of the year.

If the Pod concept works, three more pods would follow, each building on what the first established. If it does not work, the failure modes will be documented openly so that the next attempt — by CMB or by anyone else — can avoid them.

---

## Contents

The Pod carries:

| Item | Quantity | Notes |
|---|---|---|
| CMB-R1 robots | 8 | Identical chassis, 4 pre-configured head types |
| 100-metre telescoping mast | 1 | Carbon-fibre reinforced PEEK, 5 segments |
| GaAs solar curtain | 1 | ~880 m², vertical, azimuth-tracking |
| Fibre laser system | 1 | ~67.5 kW optical output from ~150 kW electrical |
| Beam and Sensor Modules (BSM) | 5 | Mounted at 11m intervals on mast (one per segment) |
| Tool heads (full set, all types) | 8 sets | Stored in pod chambers during launch |
| Ka-band communications antenna | 1 | Mounted on mast |
| Base computer and power electronics | 1 | Buried in pod base container |

---

## Mission Sequence — Proposed

### 1. Transit and Approach
The Pod launches on a Falcon Heavy on a Trans-Lunar Injection trajectory. Transit time approximately 3–5 days depending on trajectory optimisation. No crew. Full autonomous operation from separation.

### 2. Lunar Orbit Insertion and Descent
The lander system performs autonomous powered descent to the Peary Crater rim. Terrain Relative Navigation (TRN) targets a pre-selected flat zone within the high-illumination area. Landing accuracy is estimated at 5–10 metres CEP based on current TRN technology — this uncertainty is a known risk factor. See LANDING-ZONE-CRITERIA. md for full analysis.

### 3. Bloom Deployment
On confirmed surface contact, the Pod's 8 structural leaves unfold downward and outward — the "bloom." Each leaf becomes a ramp to the surface. Vectran cloth tensioned between leaves creates a dust-sealed working enclosure around the pod base. Robots remain inside and unpowered during this phase.

### 4. Mast Deployment
The telescoping mast extends from the pod base upward. Full deployment to 100 metres takes an estimated 2–4 hours. As the mast rises, two solar arms deploy at the top and the GaAs film rolls down to its full 44m length. On first contact with sunlight, the curtain begins generating power.

### 5. First Power
As soon as the solar curtain generates sufficient voltage to activate the power bus, the base computer initialises. Robot charging begins. This is the first moment the Pod is operational on the Moon.

### 6. Leaf Sintering — First Task
Before any other construction begins, the robots' first task is to sinter the bloom leaves permanently to the lunar regolith. This anchors the Pod structure, levels the working platform if needed (v2.5 configuration), and creates the first sintered surface on the Moon. Estimated time: 48–72 hours for full leaf sintering.

The Pod is a permanent installation. It is never designed to be moved, retracted, or returned to Earth. Once the leaves are sintered to the regolith, the Pod becomes part of the lunar surface — a fixed foundation from which all subsequent construction radiates outward. In later phases, the Pod structure will be enclosed and integrated into the growing base, with the mast remaining as the highest point of the entire installation.

### 7. Continuous Construction
With the Pod anchored and operational, robots begin sintering the basalt floor outward in concentric rings. Construction is continuous for as long as the system operates. There is no defined end point — the floor grows ring by ring, indefinitely.

---

## Power Budget — Estimated

| Parameter | Value | Notes |
|---|---|---|
| Solar curtain area | ~880 m² | Vertical, azimuth-tracking |
| Solar constant at Moon | 1,361 W/m² | |
| Sun elevation at Peary | 1.5°–6.5° | Varies over lunar year |
| Incidence on vertical panel | ~1,352–1,361 W/m² | cos(elevation) ≈ 1 |
| Cell efficiency (GaAs) | ~30% | Conservative commercial figure |
| Gross electrical output | ~320 kW gross peak | |
| System losses (dust, cable, thermal) | ~10% | Estimate |
| Annual availability | ~89% | Based on SELENE illumination data |
| **Working power estimate** | **~~280 kW** | Central estimate: 280 kW |
| Laser optical output | ~67.5 kW | 45% wall-plug efficiency |
| Base computer and comms | ~2 kW | Estimate |
| Robot charging (8 units) | ~10–15 kW | Estimate |

The power budget is the most important single uncertainty in the Pod concept. It depends on solar curtain performance in the actual Peary illumination geometry, dust accumulation rates on the curtain, and thermal effects on GaAs cell efficiency at lunar temperatures. Ground validation (Phase 0 Demonstrator 2) must address these uncertainties before the Pod concept can progress to hardware.

---

## Operational Radius

The laser power beaming system can reach robots within an estimated **2+ km radius** from the mast base. This defines the maximum extent of the sintered floor that the first Pod can build. Beyond this radius, a second mast — delivered on a future mission — would be required to extend operations.

The 5 Beam and Sensor Modules at 20-metre intervals on the mast provide multiple aiming points. The AI selects the optimal BSM for each robot based on current position and terrain. At 100 metres height on the near-flat Peary rim terrain, line-of-sight to any point within the operational radius is expected to be unobstructed for a well-chosen landing site.

---

## What the Pod Does Not Do

The Pod does not:
- Carry humans or life support
- Process lunar resources (that begins in Phase 1.2)
- Build domes or enclosed structures
- Require any resupply from Earth
- Need to return to Earth

The Pod's single purpose is to prove that a robot system can land autonomously, deploy a mast, receive laser power, and sinter lunar regolith into a usable surface — and to do so continuously, openly, with all data transmitted to Earth in real time.

---

## Document Index

| Document | Description |
|---|---|
| POD-STRUCTURE. md | Physical description of the pod container |
| POD-BLOOM-DEPLOYMENT. md | Leaf deployment sequence and dust containment |
| POD-LANDING-SEQUENCE. md | Descent, TRN, and touchdown |
| MAST-OVERVIEW. md | Mast architecture and deployment |
| MAST-SOLAR-CURTAIN. md | GaAs curtain design and power generation |
| MAST-ANCHOR-*. md | Four anchor variant concepts |
| LASER-SYSTEM. md | Fibre laser and BSM architecture |
| LASER-POWER-BEAMING. md | Power delivery to robots |
| POWER-BUDGET. md | Full power budget analysis |

---

## Key References

- Bussey et al. (2005) Nature 434:842 — Clementine illumination mapping of Peary rim
- Noda et al. (2008) Geophysical Research Letters — SELENE topographic illumination data
- Fateri et al. (2019) Scientific Reports — Laser sintering of lunar regolith simulant
- PowerLight Technologies (2022) — Laser power beaming ground demonstration
- SpaceX Falcon Heavy — User's Guide, payload specifications

---

## Beyond Pod 1 — Four Peaks, Four Masts

Pod 1 is the proof of concept. If it works, the waiting period before Pod 2 will not be long.

The Peary crater rim has four distinct illumination peaks — locations where near-continuous sunlight has been measured. The long-term vision is one Pod and one mast on each of these four peaks, creating a network of four independent power and construction nodes across the Peary rim.

**What four masts provide:**
- 4× the solar energy collection capacity of a single Pod
- Combined laser operational radius covering the entire planned 20-hectare base floor and beyond
- Full redundancy — if one mast fails, three others continue operating
- Robots can move between mast coverage zones without ever losing laser power
- The construction rate scales with every additional Pod

**Pod 2 is also a resupply mission:**
Each subsequent Pod brings fresh heads, spare components, and potentially new robot chassis. The concern about head wear over a 5–10 year operational period becomes less critical when Pod 2 arrives within a few years of Pod 1's success.

**The sequence:**
- Pod 1 → prove the concept, build the first sintered path and floor area
- Pod 2 → second peak, fresh supplies, doubled construction capacity
- Pod 3 → third peak, network begins to form
- Pod 4 → fourth peak, full Peary rim network operational

At this point the construction capacity is sufficient to begin the 20-hectare floor in earnest, and the base transitions from Phase 0.2 to Phase 1.
