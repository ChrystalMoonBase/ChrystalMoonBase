# Chrystal Moon Base — Technical Overview

**Status: Pre-TRL system concept. No integrated system exists. Individual components are partially demonstrated in isolation. All figures are estimates requiring experimental validation.**

---

## Proposed Site

**Peary Crater rim, 88.63°N — lunar north pole.**

SELENE/Kaguya illumination data (Noda et al. 2008) suggests near-continuous sunlight at the best peaks on the Peary rim for approximately 89% of the year. This has not been confirmed at the spatial resolution needed for landing zone selection — published data has 10–50 metre resolution; a usable flat zone may be 20–30 metres wide. A dedicated high-resolution orbital survey would be required before any mission planning.

A vertical azimuth-tracking panel at this latitude would theoretically receive ~1,357 W/m² continuously — significantly more than a horizontal panel at the same location. This calculation is based on published illumination geometry and requires validation against actual site conditions.

Permanently shadowed regions nearby contain confirmed water ice at some locations (LCROSS 2009, M3/Chandrayaan-1). Concentration and accessibility at Peary-adjacent cold traps specifically have not been measured at the resolution needed for ISRU planning.

Earth visibility from the near-side rim appears continuous based on published orbital geometry — communications blackout periods are not expected, though this has not been confirmed for any specific landing zone candidate.

---

## Proposed System Architecture

**1. Energy Subsystem**
- 55-metre telescoping mast (5 segments, stowed at 11 m — Falcon Heavy fairing compatible)
- Two roll-out GaAs solar film arms (10 m × 44 m each = **880 m² total**), hanging vertically from the top segment
- Arms are parallel to the sun at all times — no inter-arm shadowing
- Azimuth-tracking drive rotates mast at ~0.5°/hour — maintains continuous sun-facing
- Estimated net electrical output: **~280 kW** after assumed ~10% system losses
- This estimate is the most important uncertainty in the concept — the actual power budget has not been validated
- Ytterbium fibre laser at assumed ~45% wall-plug efficiency → estimated **~67.5 kW optical output**
- Five Beam and Sensor Modules (BSMs) at 11 m mast intervals (11 m, 22 m, 33 m, 44 m, 55 m) distribute power to robots via steered laser beam
- AI selects optimal BSM per robot based on position; robot receiver panels tilt to optimise angle
- Estimated operational robot radius: **2+ km** from mast base in vacuum (no atmospheric losses)

**2. Robotic Execution Layer — CMB-R1 (concept only)**
- 8 octopod robots on 4 double-sided chassis (~250–350 kg each, rough estimate)
- Double-sided chassis: each unit provides two simultaneous working ends — 8 effective builders from 4 physical units
- Four interchangeable tool heads: sintering, thermal buddy, bulldozer, watcher
- Front two limbs intended as dual-function: legs in transit, arms for head swapping and cargo handling
- Leg-loss fault tolerance proposed: damaged leg discarded, AI recalculates gait for remaining legs
- Two 4-robot teams working simultaneously in opposing directions on concentric sintering rings
- Three-level AI proposed: onboard (locomotion), mast-based (swarm coordination), Earth-uplinked (strategic oversight)
- No prototype exists. No swarm coordination software exists.

**3. Construction Process**
- Laser sintering proposed to fuse regolith grains into glass-ceramic basalt solid
- Controlled cooling via thermal buddy robot — intended to prevent thermal cracking
- Estimated energy requirement: 5,000–15,000 kWh/m³ (derived from Fateri et al. 2019 at small scale; uncertainty is very high)
- First platform timeline (8 m diameter, 25 cm depth): estimated 2–11 months at ~25 kW sintering power. Central estimate ~5 months — this range reflects genuine uncertainty in sintering energy at scale
- All sintering data comes from terrestrial laboratory experiments using simulants. Peary rim regolith is highland anorthosite composition — behaviour may differ significantly

**4. Habitat Formation (long-term concept)**
- Five-layer dome proposed: sintered basalt shell / self-sealing gel / gold-coated titanium-reinforced glass / water layer / inner glass
- Self-sealing gel: no validated material meeting the temperature, vacuum, and activation requirements has been identified
- No wall penetrations intended — all utilities and access through floor via underground network
- Target: ~90–100 domes, 500 permanent residents. This is a directional goal, not a plan.

---

## Key Assumptions — Unvalidated

| Assumption | Basis | What Is Needed |
|---|---|---|
| ~89% annual illumination at landing zone | SELENE data, 10–50 m resolution | High-resolution orbital survey of specific zone |
| Sintering viable at scale in vacuum | Small-scale lab demos only | Phase 0 Demonstrator 1 at construction scale |
| ~280 kW net power achievable | Physics calculation, estimated losses | Phase 0 Demonstrator 2, dust accumulation model |
| Swarm coordination at construction scale | Algorithm concept only, no software | Phase 0 Demonstrators 3–5 |
| Self-sealing gel viable in lunar conditions | Concept based on terrestrial research | Dedicated materials science programme |
| Regolith composition matches simulants | Assumed based on orbital data | Direct sample or in-situ measurement |
| 2+ km laser range achievable | Vacuum physics; no atmospheric loss | Phase 0 Demonstrator 2 at extended range |

---

## Primary Unknowns

- Long-term optical degradation of laser optics and solar cells from lunar dust accumulation
- Energy efficiency of sintering at required depth (10–25 cm) in highland regolith specifically
- Whether autonomous swarm coordination can be made reliable enough for years of unattended operation
- Mechanical properties of large-area sintered structures under repeated thermal cycling
- Water ice concentration and physical form in Peary-adjacent cold traps
- Whether the power budget closes — this has not been demonstrated and is the highest-priority uncertainty

---

## Phase 0 — Five Earth Demonstrators

| # | Subsystem | Success Criteria |
|---|---|---|
| D1 | Laser sintering at scale | Crack-free 1 m² patch, depth ≥10 cm, compressive strength ≥50 MPa |
| D2 | Laser power beaming | ≥40% end-to-end efficiency at 100 m, tracking at robot walking speed |
| D3 | CMB-R1 locomotion | Stable gait on simulant, leg-loss recovery <60 s, head swap success ≥90% |
| D4 | 4-robot swarm coordination | Autonomous ring completion, fault recovery without human intervention |
| D5 | Full integration, 72-hour run | Measurable sintered area produced, no human intervention required |

Estimated Phase 0 cost: €1.5–3 million across 3–5 years. Each demonstrator is independently publishable regardless of overall programme outcome.

---

## Key References

- Noda et al. (2008) GRL — SELENE polar illumination data
- Fateri et al. (2019) Scientific Reports — laser sintering of lunar simulant
- Schwandt et al. (2012) Planetary and Space Science — molten oxide electrolysis
- Carrier, Olhoeft & Mendell (1991) Lunar Sourcebook — regolith properties
- PowerLight Technologies (2022) — laser power beaming ground demonstration
- Li et al. (2018) PNAS — polar water ice confirmation
- Speyerer & Robinson (2005) Nature — Peaks of Eternal Light illumination mapping

---

**Full documentation:** [github.com/ChrystalMoonBase/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)  
**Contact:** info@chrystalmoonbase.com  
**ESA OSIP:** Qualified — Open for Discussion · 2026
