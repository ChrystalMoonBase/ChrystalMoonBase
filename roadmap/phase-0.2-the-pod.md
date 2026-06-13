# The Pod — Phase 0.2 Overview
## Chrystal Moon Base — First Lunar Mission Concept

**Status:** Concept proposal — feasibility not yet demonstrated  
**Author:** Berechja Kerkdijk  
**Licence:** CC0  
**Last updated:** 2026

> Every number in this document is an estimate based on publicly available data and physics. This is a concept sketch, not an engineering specification. If you find an error, please open an issue or submit a correction. That is the entire point of publishing this openly.

---

## What the Pod Is

The Pod is the proposed first physical mission of Chrystal Moon Base to the lunar surface. It is a single launch — one Falcon Heavy rocket — carrying everything needed to begin autonomous construction of a sintered regolith floor on the rim of Peary Crater at the lunar north pole.

The Pod does not carry humans. It does not need to return. It is designed to land, deploy, and operate indefinitely — for as long as the sun shines on the Peary rim, which is approximately 89% of the year.

If the Pod concept works, three more pods would follow, each building on what the first established. If it does not work, the failure modes will be documented openly so that the next attempt — by CMB or by anyone else — can avoid them.

---

## Contents

| Item | Quantity | Notes |
|---|---|---|
| CMB-R1 octopod robots | 16 | 2 per garage, fully integrated sensors |
| Telescoping mast | 1 | Toray M55J CFRP, 5 segments, stowed ~9.7 m, deployed ~35 m |
| Magnetic rotation bearing | 1 | AMB/PMB — frictionless azimuth tracking |
| CIGS roll-out solar film | 1 | ~600 m² (2 arms × 9 m × 30 m), vertical, azimuth-tracking |
| Laser power beaming system | 1 | 10–20 kW class diode laser |
| Beam and Sensor Modules (BSM) | 5 | One per segment, at ~7 / 14 / 21 / 28 / 35 m |
| Ka-band communications antenna | 1 | Mounted on mast top (segment 5) |
| Base computer and power electronics | 1 | In central base plate |
| Garages | 8 | 2.0 m × 2.0 m × 1.5 m each, 2 robots per garage |

---

## Mission Sequence — Proposed

### 1. Transit and Approach
The Pod launches on a Falcon Heavy on a Trans-Lunar Injection trajectory. Transit time approximately 3–5 days depending on trajectory optimisation. No crew. Full autonomous operation from separation.

### 2. Lunar Orbit Insertion and Descent
The lander system performs autonomous powered descent to the Peary Crater rim. Terrain Relative Navigation (TRN) targets a pre-selected flat zone within the high-illumination area, matching the onboard terrain map built from LRO/LOLA altimetry (and, where resolution requires it, from a dedicated pre-mission orbital survey). Landing accuracy is estimated at 5–10 metres CEP based on current TRN technology — this uncertainty is a known risk factor. See `foundation/location/landing-zone-criteria.md` for full analysis.

### 3. Bloom Deployment
On confirmed surface contact, the Pod's 8 structural leaves unfold downward and outward — the "bloom." Each leaf becomes a ramp to the surface. Vectran cloth tensioned between leaves creates a dust-sealed working enclosure around the pod base. Robots remain inside and unpowered during this phase.

### 4. Mast Deployment
The telescoping mast extends from the pod base upward. Full deployment to ~35 metres takes an estimated 2–4 hours. The CIGS solar film unfurls as the mast rises. On first contact with sunlight, the film begins generating power.

### 5. First Power
As soon as the solar film generates sufficient voltage to activate the power bus, the base computer initialises. Robot charging begins. This is the first moment the Pod is operational on the Moon.

### 6. Leaf Sintering — First Task
Before any other construction begins, the robots' first task is to sinter the bloom leaves permanently to the lunar regolith. This anchors the Pod structure, levels the working platform if needed, and creates the first sintered surface on the Moon. Estimated time: 48–72 hours for full leaf sintering.

The Pod is a permanent installation. It is never designed to be moved, retracted, or returned to Earth. Once the leaves are sintered to the regolith, the Pod becomes part of the lunar surface — a fixed foundation from which all subsequent construction radiates outward. In later phases, the Pod structure will be enclosed and integrated into the growing base, with the mast remaining as the highest point of the installation.

### 7. Continuous Construction
With the Pod anchored and operational, robots begin sintering the floor outward in concentric rings. Construction is continuous for as long as the system operates. There is no defined end point — the floor grows ring by ring, indefinitely.

---

## Power Budget — Estimated

| Parameter | Value | Notes |
|---|---|---|
| Solar film area | ~600 m² | 2 arms × 9 m × 30 m, vertical, azimuth-tracking |
| Solar cell type | CIGS thin-film (flexible, rollable) | |
| Solar constant at Moon | ~1,370 W/m² | |
| Sun elevation at Peary | 1.5°–6.5° | Varies over lunar year |
| Incidence on vertical panel | ~1,365–1,370 W/m² | cos(elevation) ≈ 1 |
| CIGS efficiency (conservative) | 15.7% | |
| CIGS efficiency (realistic growth) | 21.5% | |
| Annual availability | ~89% | Based on SELENE illumination data |
| System losses (dust, cable, thermal) | ~10% | Estimate |
| **Continuous output (conservative)** | **~104 kW** | 600 × 1370 × 0.157 × 0.89 × 0.90 |
| **Continuous output (optimistic)** | **~143 kW** | 600 × 1370 × 0.215 × 0.89 × 0.90 |
| Laser optical output | ~10–15 kW | 10–20 kW class diode laser |
| Base computer and comms | ~3 kW | Estimate |
| Robot charging (16 units, staggered) | ~15 kW | Max 4–6 charging simultaneously |

The power budget is the most important single uncertainty in the Pod concept. It depends on CIGS film performance in the actual Peary illumination geometry, dust accumulation rates on the vertically hanging film, and thermal effects on cell efficiency at lunar temperatures. Ground validation (Phase 0 Demonstrator 2) must address these uncertainties before the Pod concept can progress to hardware. See `systems/pod/power-budget.md` for the full breakdown.

---

## Operational Radius

The laser power beaming system can reach robots within an estimated **2+ km radius** from the mast base in vacuum (no atmospheric losses). This defines the maximum extent of the sintered floor that the first Pod can build. Beyond this radius, a second mast — delivered on a future mission — would be required to extend operations.

The 5 Beam and Sensor Modules at ~7 / 14 / 21 / 28 / 35 m on the mast provide multiple aiming points. The AI selects the optimal BSM for each robot based on current position and terrain. At ~35 metres height on the near-flat Peary rim terrain, line-of-sight to any point within the operational radius is expected to be unobstructed for a well-chosen landing site.

---

## What the Pod Does Not Do

The Pod does not:
- Carry humans or life support
- Process lunar resources (that begins in Phase 1)
- Build domes or enclosed structures
- Require any resupply from Earth
- Need to return to Earth

The Pod's single purpose is to prove that a robot system can land autonomously, deploy a mast, receive laser power, and sinter lunar regolith into a usable surface — and to do so continuously, openly, with all data transmitted to Earth in real time.

---

## Document Index

| Document | Description |
|---|---|
| `systems/pod/overview.md` | Full pod system overview |
| `systems/pod/pod-bloom-deployment.md` | Leaf deployment sequence and dust containment |
| `systems/pod/mast-overview.md` | Mast architecture and deployment |
| `systems/pod/mast-solar-curtain.md` | CIGS film design and power generation |
| `systems/pod/mast-anchor-rooted-hybrid.md` | Anchor system — Rooted Hybrid (selected) |
| `systems/pod/laser-system.md` | Fibre/diode laser and BSM architecture |
| `systems/pod/power-budget.md` | Full power budget analysis |

---

## Key References

- Bussey et al. (2005) Nature 434:842 — Clementine illumination mapping of Peary rim
- Noda et al. (2008) Geophysical Research Letters — SELENE topographic illumination data
- Mazarico et al. (2011) Icarus — LRO/LOLA illumination modelling
- Fateri et al. (2019) Scientific Reports — Laser sintering of lunar regolith simulant
- PowerLight Technologies (2022) — Laser power beaming ground demonstration
- SpaceX Falcon Heavy — User's Guide, payload specifications

---

## Beyond Pod 1 — Four Peaks, Four Masts

Pod 1 is the proof of concept. If it works, the waiting period before Pod 2 will not be long.

The Peary crater rim has four candidate illumination peaks — locations where high annual illumination (~89% at the best peak) has been measured. The long-term vision is one Pod and one mast on each of these four peaks, creating a network of four independent power and construction nodes across the Peary rim.

**What four masts provide:**
- ~4× the solar energy collection capacity of a single Pod
- Combined laser operational radius covering a large planned base floor area and beyond
- Full redundancy — if one mast fails, three others continue operating
- Robots can move between mast coverage zones without ever losing laser power
- Construction rate scales with every additional Pod

**Pod 2 is also a resupply mission:**
Each subsequent Pod brings fresh heads, spare components, and potentially new robot chassis. The concern about head wear over a 5–10 year operational period becomes less critical when Pod 2 arrives within a few years of Pod 1's success.

**The sequence:**
- Pod 1 → prove the concept, build the first sintered path and floor area
- Pod 2 → second peak, fresh supplies, doubled construction capacity
- Pod 3 → third peak, network begins to form
- Pod 4 → fourth peak, full Peary rim network operational

At this point the construction capacity is sufficient to begin the main base floor in earnest, and the base transitions from Phase 0.2 to Phase 1.
