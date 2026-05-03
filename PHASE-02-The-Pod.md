# Phase 0.2 — The First Lunar Pod
## Chrystal Moon Base · Mission Architecture
**Status:** Concept — pending Phase 0 validation  
**Prerequisite:** All four Phase 0 demonstrators completed successfully  
**Leads to:** Phase 1.1 — The Foundation  
**License:** CC BY 4.0  

---

> *One Falcon Heavy. One pod. One 100-metre mast. Eight robots. And the beginning of a sintered basalt floor that grows for as long as the sun shines.*

---

## Overview

Phase 0.2 is the first lunar mission in the Chrystal Moon Base roadmap. It delivers a single MAST-POD to the surface of the Moon — one pod, one mast, eight construction robots — and begins the autonomous construction of a permanent sintered basalt foundation.

Everything in Phase 0.2 is designed, built, and tested on Earth before launch. If it works, three more pods follow, each to a different peak on the Peary Crater rim. If it does not work, we learn exactly why — and that is worth something too.

**Phase 0.2 does not begin until Phase 0 demonstrators have succeeded.** The numbers in this document are estimates. The Phase 0 results will either confirm them or replace them.

---

## Landing Site

**Target:** A high-illumination peak on the northern rim of Peary Crater, 88.6°N lunar latitude.

LRO and SELENE orbital data confirm that certain ridges on the Peary Crater rim receive sunlight for 80–95% of the lunar year. This near-continuous illumination is the reason for the location. The solar curtain on the mast requires continuous sunlight to power the robot fleet. Without it, the mission cannot function.

The specific peak is selected after Phase 0 completion, based on updated LRO LOLA topographic analysis and the validated sintering results that determine the required landing zone geometry.

---

## The MAST-POD System

The MAST-POD is the complete payload delivered by the Falcon Heavy. It consists of:

- **The pod body** — structural shell, propulsion system, landing sensors, anchoring mechanism
- **The mast** — 100-metre telescoping carbon-fibre/PEEK assembly with solar curtain
- **Eight CMB-R1 robots** — stowed inside the pod during transit and landing
- **Laser power system** — fibre-coupled diode laser array on the mast
- **Communication system** — S-band transceiver for Earth link

### Launch Vehicle

**Falcon Heavy** in Trans-Lunar Injection (TLI) configuration. Published TLI capability: approximately 16,800–21,000 kg depending on recovery profile. All pod variants fit within this envelope with margin.

### Mass Budget

| Element | Mass estimate | Notes |
|---|---|---|
| Dry mass (pod + mast + robots) | ~4,500 kg | Unvalidated — engineering review required |
| Propellant (MMH/NTO, Isp ~320s) | ~6,400 kg | Calculated from delta-v budget |
| Total wet mass | ~10,900 kg | Well within Falcon Heavy TLI envelope |

*The dry mass figure is the least certain number in this document. It must be validated against actual hardware designs before mission planning.*

### Delta-V Budget

| Phase | Delta-v |
|---|---|
| Trans-Lunar Injection (upper stage) | ~3,100 m/s |
| Lunar Orbit Insertion (100 km LLO) | ~900 m/s |
| Powered descent from LLO | ~1,870 m/s |
| **Total mission delta-v** | **~2,770 m/s** |

---

## The Four Pod Variants

The most critical engineering decision in Phase 0.2 is how the pod anchors a 100-metre mast permanently to the lunar surface. Four concepts have been developed. None has been selected. That selection belongs to engineers with direct knowledge of the actual Peary Crater rim terrain.

| Variant | Wet Mass | Footprint | Full Anchor Time | Primary Risk |
|---|---|---|---|---|
| v1 The Spike | 11,700–11,800 kg | 8–12 m | Weeks | Uneven penetration |
| v2.0 Pure Bloom | 10,700–10,900 kg | 26.5 m | ~5 months | Site flatness requirement |
| v2.1 Adaptive Bloom | 10,900–11,200 kg | 26.5 m | ~5 months | Hinge reliability |
| v2.5 Rooted Hybrid ★ | 11,100–11,400 kg | 18–20 m | 6–8 weeks | Plug depth variability |

★ Identified as strongest practical baseline by the engineering analysis that informed this concept. Final selection requires qualified engineering review.

Full variant specifications: [chrystalmoonbase.com](https://chrystalmoonbase.com)

---

## The Mast

The mast is a 10-segment telescoping assembly of carbon-fibre-reinforced PEEK tubes, each approximately 10 metres long. A single brushless motor and Dyneema tape system deploys all ten segments sequentially, with passive collet locks at each joint.

**Total deployed height:** 100 metres  
**Solar curtain:** 100 m² of flexible GaAs photovoltaic cells, tracking the sun in azimuth  
**Peak DC output:** approximately 32–36 kW at Peary latitude  
**Laser output to robots:** approximately 13.5 kW optical

The mast cannot be repaired by the robots. It must work first time.

---

## The Robot Fleet

Eight CMB-R1 construction robots are carried inside the pod. After the mast is operational and the laser power link is confirmed, the robots deploy and begin building.

The fleet operates in two teams of four, each working its own half of the growing floor. Within each team:

- **One melter** — carries the sintering laser head, fuses regolith into basalt
- **One stabiliser** — follows the melter, controls the cooling rate
- **One bulldozer** — levels and prepares the ground ahead
- **One inspector** — certifies every pass before it is accepted

Full robot specification: [docs/02_robots/CHASSIS.md](docs/02_robots/CHASSIS.md)

---

## Mission Timeline (Illustrative)

| Phase | Duration | Notes |
|---|---|---|
| Transit to LLO | ~4 days | Falcon Heavy TLI |
| Orbital survey | 3–7 days | Site selection and DEM construction |
| Powered descent | ~15 minutes | Autonomous TRN-guided |
| Mast deployment | Hours | Automated sequence |
| Robot deployment | Hours | Walk-out after power link confirmed |
| Sintering begins | Immediately | Ring 1 starts on day 1 |
| Full anchor complete | 6 weeks – 5 months | Depends on variant selected |
| Ongoing operations | Years | Floor grows indefinitely |

*All durations are estimates. The actual timeline depends on Phase 0 results, variant selection, and site conditions.*

---

## What Comes Next

If Phase 0.2 succeeds, three more pods follow — each to a different Peary rim peak, each adding another team, another mast, another sintering front.

If Phase 0.2 fails, the failure data is published in full on this repository. Every failure teaches us something that makes the next attempt more likely to succeed.

---

## Open Questions

1. Which of the four pod variants is optimal for the actual Peary rim terrain? (Requires geotechnical expertise)
2. What is the actual regolith bearing capacity at the candidate sites? (Requires orbital data analysis)
3. Can a 26.5m flat zone be confirmed from LRO LOLA data at candidate peaks? (Requires topographic analysis)
4. What is the validated sintering energy at operational depth in vacuum? (Requires Phase 0 Demonstrator 1)
5. What landing accuracy is achievable with current TRN technology at this site? (Requires mission design expertise)

---

## How to Contribute

- Open a GitHub Issue with analysis, corrections, or questions
- Submit a Pull Request with updated numbers and sources
- Contact: info@chrystalmoonbase.com

All contributions credited in CREDITS.md.

---

*Chrystal Moon Base · chrystalmoonbase.com · github.com/ChrystalMoonBase*  
*The Moon belongs to all of us.*
