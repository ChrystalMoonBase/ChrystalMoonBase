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

The Pod does not carry humans. It does not need to return. It is intended to land, deploy, and operate indefinitely — for as long as the sun shines on the Peary rim, which is approximately 89% of the year.

---

## Contents

| Item | Quantity | Notes |
|---|---|---|
| CMB8LF-L1 octopod robots | 16 | 2 per garage, fully integrated sensors |
| Telescoping mast | 1 | Toray M55J CFRP, 5 segments, stowed ~9.7 m, deployed ~35 m |
| Magnetic rotation bearing | 1 | AMB/PMB — frictionless azimuth tracking |
| CIGS roll-out solar film | 1 | ~600 m² (2 arms × 9 m × 30 m), vertical, azimuth-tracking |
| Laser power beaming system | 1 | 10–20 kW class diode laser |
| Beam and Sensor Modules (BSM) | 5 | One per segment, at ~7 / 14 / 21 / 28 / 35 m |
| Ka-band communications antenna | 1 | Mounted on mast top (segment 5) |
| Base computer and power electronics | 1 | In central base plate |
| Garages | 8 | 2.0 m × 2.0 m × 1.5 m each, 2 robots per garage |

> **Why 16 robots?** The figure is derived from the Pod's own geometry, not chosen
> abstractly: the Pod carries **8 garages**, each sized to hold **2 robots**, giving 16.
> The number of garages, in turn, is bounded by what is plausibly achievable in mass and
> volume for a single lunar delivery. So 16 is an honest first estimate set by "how many
> robots fit and can be landed," **not** by a calculation of how many the build needs. The
> definitive fleet size — and whether early construction is faster with more, smaller
> robots or fewer, larger ones — is an **engineering decision for a later phase**, to be
> settled once real on-Moon sintering and digging rates are known.

---

## Physical Description

| Parameter | Value |
|---|---|
| Pod outer shape | Cylindrical (octagonal inner frame) |
| Pod diameter | ~4.6 m |
| Pod height (stowed, fairing) | ~11 m |
| Base plate | 1.0 m thick Al-Li 2099 isogrid, ⌀4.6 m |
| Base plate systems | Thrusters, fuel tanks, levelling actuators, avionics |
| Fuel | MMH/NTO hypergolic — spontaneous ignition, no ignition system needed |
| Levelling | 8 electromechanical linear actuators, ±0.5 mm precision |
| Bloom petals | 8 × honeycomb sandwich panels, Vectran cloth between petals |
| Garages | 8 × 2.0 m × 2.0 m × 1.5 m — 2 robots each |
| **Total launch mass (excl. robots)** | **~4,200 kg** |
| Falcon Heavy TLI capacity | ~15,000 kg |
| **Mass margin** | **~10,800 kg** |

---

## Power Budget

| Parameter | Conservative | Optimistic |
|---|---|---|
| Solar film area | 600 m² | 600 m² |
| Cell type | CIGS thin-film | CIGS thin-film |
| Cell efficiency | 15.7% | 21.5% |
| Solar constant | 1,370 W/m² | 1,370 W/m² |
| Annual availability | ~89% | ~89% |
| System losses | ~10% | ~10% |
| **Continuous power** | **~104 kW** | **~143 kW** |
| Laser optical output | ~10–15 kW | ~10–15 kW |
| Power surplus / battery charging | ~64 kW | ~103 kW |

---

## Operational Radius

The laser power beaming system is estimated to reach robots within **2+ km** from the mast base. In lunar vacuum there are no atmospheric losses — range is limited by BSM pointing geometry and robot receiver panel area. The AI selects the optimal BSM for each robot based on its current position. Robot receiver panels tilt automatically to optimise angle of incidence.

---

## Mass Budget Summary

| Component | Mass (kg) |
|---|---|
| Central base plate (Al-Li isogrid, incl. motors, tanks, actuators) | 1,200 |
| 8 bloom petals (honeycomb sandwich, incl. hinges and Vectran cloth) | 1,200 |
| 8 garages (structural, empty) | 400 |
| Magnetic rotation bearing (AMB/PMB) | 100 |
| Telescoping mast (5 segments, Toray M55J CFRP) | 200 |
| Arms, pulleys and film deployment mechanism | 100 |
| CIGS solar film (~600 m²) | 110 |
| Landing fuel and fluids | 600 |
| Avionics, cabling, communications, margin | 290 |
| **TOTAL (excl. robots)** | **~4,200 kg** |

*Robots and their systems are additional mass within the ~10,800 kg margin.*

---

## Document Index

| Document | Description |
|---|---|
| pod-bloom-deployment.md | Bloom petal deployment and dust containment |
| mast-overview.md | Mast architecture, segments, magnetic bearing |
| mast-solar-curtain.md | CIGS roll-out film — arms, deployment, power |
| mast-bsm-beam-sensor-module.md | BSM design and laser power delivery |
| mast-anchor-rooted-hybrid.md | Mast anchor — Rooted Hybrid (preferred; only anchor variant currently written) |
| laser-system.md | Laser power beaming architecture |
| power-budget.md | Full power budget analysis |
