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

---

## Contents

| Item | Quantity | Notes |
|---|---|---|
| CMB-R1 robots | 8 | Identical chassis, 4 double-sided — 8 effective builders |
| 55-metre telescoping mast | 1 | Carbon-fibre reinforced PEEK, 5 segments, stowed at 11 m |
| GaAs roll-out solar film | 1 | 880 m² (2 arms × 10 m × 44 m), vertical, azimuth-tracking |
| Fibre laser system | 1 | ~67.5 kW optical output from ~150 kW electrical |
| Beam and Sensor Modules (BSM) | 5 | One per segment, at 11 m, 22 m, 33 m, 44 m, 55 m |
| Tool heads (full set, all types) | 8 sets | Stored in pod chambers during launch |
| Ka-band communications antenna | 1 | Mounted on mast top |
| Base computer and power electronics | 1 | Buried in pod base container |

---

## Power Budget

| Parameter | Value |
|---|---|
| Solar film area | 880 m² |
| Solar constant at Moon | 1,357 W/m² |
| GaAs efficiency | 30% |
| Annual availability | ~89% |
| System losses | ~10% |
| **Continuous power** | **~280 kW** |
| Laser optical output | ~67.5 kW |
| Power surplus (battery charging) | ~108 kW |

---

## Operational Radius

The laser power beaming system reaches robots within an estimated **2+ km radius** from the mast base. In lunar vacuum there are no atmospheric losses — range is limited only by BSM pointing geometry and receiver panel area. The AI selects the optimal BSM (at 11 m, 22 m, 33 m, 44 m, or 55 m) for each robot based on its current position.

---

## Document Index

| Document | Description |
|---|---|
| pod-bloom-deployment.md | Leaf deployment sequence and dust containment |
| mast-overview.md | Mast architecture and deployment |
| mast-solar-curtain.md | GaAs roll-out film power generation (880 m²) |
| mast-anchor-spike.md | Anchor variant 1 |
| mast-anchor-pure-bloom.md | Anchor variant 2 |
| mast-anchor-adaptive-bloom.md | Anchor variant 3 |
| mast-anchor-rooted-hybrid.md | Anchor variant 4 (preferred) |
| laser-system.md | Fibre laser and BSM architecture |
| power-budget.md | Full power budget analysis |
