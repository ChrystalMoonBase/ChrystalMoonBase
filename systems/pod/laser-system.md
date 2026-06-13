# Laser System
## Chrystal Moon Base — Phase 0.2 Power Architecture

**Status:** Concept proposal — all figures are estimates requiring engineering validation  
**Licence:** CC0

---

## Overview

The laser system converts a portion of the electrical power from the CIGS solar film into a laser beam distributed to working robots via the Beam and Sensor Modules (BSMs). It is the link between power generation and power consumption — the wireless grid of the Pod.

---

## Laser Type

**High-power diode laser**, wavelength approximately 800–980 nm (near-infrared).

Diode lasers are selected for this concept because:
- Wall-plug efficiency of 50–65% — higher than ytterbium fibre lasers at lower power levels
- Compact, no moving parts, long operational life
- The 800–980 nm wavelength range is well-matched to GaAs photovoltaic receiver cells on robots
- Direct electrical-to-optical conversion without intermediate fibre amplification

> **Note:** The receiver cells on the robots are GaAs — not CIGS. The CIGS change applies only to the mast solar film, which must be rolled. Robot receiver panels do not need to be flexible and GaAs offers superior efficiency at the laser wavelength.

---

## Power Budget

| Parameter | Value | Notes |
|---|---|---|
| Total system power (conservative) | ~104 kW | 600 m² CIGS at 15.7% efficiency |
| Total system power (optimistic) | ~143 kW | 600 m² CIGS at 21.5% efficiency |
| Laser system allocation | ~20 kW electrical input | ~19% of conservative total |
| Wall-plug efficiency (diode) | ~55% estimated | Literature range 50–65% |
| **Laser optical output** | **~10–11 kW** | Starting point for engineering |
| Distribution to 5 BSMs | Optical fibre splitter | ~2 kW per BSM nominal |
| Delivery efficiency (pointing, dust) | ~80% estimated | Highly uncertain |
| Power at robot receiver | ~0.4–1.6 kW per robot | Depends on distance and BSM |
| GaAs receiver efficiency at wavelength | ~30–40% | Literature range |
| **Electrical power at robot** | **~0.12–0.64 kW per robot** | Wide uncertainty range |

These estimates carry significant uncertainty. The actual operating point requires detailed optical modelling, thermal analysis, and ground testing. These figures are starting points, not specifications.

---

## Why Not a Larger Laser?

The total available power budget is ~104–143 kW. Most of this is needed for:
- Robot charging (16 robots staggered): ~15 kW
- Base computer, comms, BSM actuators: ~5 kW
- Mast rotation and magnetic bearing: ~1 kW
- Battery reserve charging: ~60+ kW surplus

Allocating ~20 kW to the laser is a deliberate conservative choice. The laser does not need to be large — robots spend most of their time sintering (which uses their locally stored charge), not receiving real-time laser power. The laser tops up robot batteries continuously while they work.

If engineering analysis shows the power budget allows a larger laser allocation, the optical output can scale proportionally.

---

## Location

The laser system is housed in the Pod base — the central, thermally insulated unit below the mast base. Optical fibre carries the beam up through the ~35-metre mast interior to each BSM. The interior of the mast provides natural thermal protection for the fibre.

---

## BSM Distribution and Line-of-Sight Strategy

Five BSMs at approximately 7 / 14 / 21 / 28 / 35 m serve 16 robots across a 2+ km operational radius. The mast AI selects the optimal BSM for each robot based on position and line-of-sight geometry. Robots with steerable GaAs receiver panels actively optimise angle of incidence as they move.

Power beaming is line-of-sight: a BSM can only power a robot it can "see." On the eroded, uneven Peary rim — ridges, slopes, debris — a clear line to every point inside a 2 km circle is **not** guaranteed. The strategy addresses this in three layers, of which the first two are design features and the third is a deliberate honest limit.

**Layer 1 — Height diversity across five BSMs.** The five BSMs sit at different heights (7–35 m). A point hidden from a low BSM by a ridge may be in clear view of a higher one, because raising the source over an obstacle is exactly what extends the visible horizon. Multiple aiming points at multiple heights give sightlines that a single emitter could never have, and the AI picks the BSM with the best geometry for each robot in real time. This is the primary mitigation.

**Layer 2 — Robot-to-robot power relay (optical relay / "prism" concept).** Where terrain still blocks a direct sightline, a robot that *does* have line-of-sight to a BSM can act as a relay for a robot that does not. Two physical implementations are possible:
- *Optical pass-through (the "prism"/mirror variant):* the relay robot carries a steerable reflective/optical element that redirects the incoming beam toward the shadowed robot. Purely optical, no conversion — elegant, but it demands an actively-steered reflector and each redirection costs some energy and adds pointing error.
- *Receive-and-reissue (energy-hub variant):* the relay robot captures the beam on its own receiver, converts it to electricity, and passes power to its neighbour via a short direct beam or a physical link. Less elegant, but far more tolerant of pointing error and the more robust of the two.

CMB already plans robot-to-robot **laser communication** (`systems/robot-cmb-r1/laser-communication.md`); the step from a steered data-laser to a power relay is conceptually small, because the pointing and line-of-sight infrastructure is shared. Relay is intended as a *gap-filler for points just behind a ridge*, not as a backbone — every relay hop costs energy and adds a failure point (lose the relay robot and the shadowed robot loses power), so the construction sequence should not depend on long relay chains.

**Layer 3 — Honest limit: occlusion shrinks the real build area.** Even with height diversity and relay, some points are simply behind too much terrain to reach economically. The true reachable construction area from a single mast is therefore **smaller and more irregular than a smooth 2 km circle** — it is a line-of-sight footprint shaped by the actual local topography. Quantifying it (a viewshed analysis from the BSM heights over real LRO/LOLA terrain of the chosen peak) is a specific Phase 0 task. This is also part of the justification for the four-mast network: each mast's line-of-sight footprint covers terrain the others cannot.

---

## Open Questions

1. What diode laser configuration achieves the required power at flight-qualified reliability and mass?
2. What fibre type and routing are required for the ~35-metre mast interior, including thermal cycling loads?
3. What is the actual GaAs conversion efficiency at the chosen wavelength and at robot operating temperatures?
4. How is laser power split between 5 BSMs — fixed split or dynamic allocation?
5. What is the actual dust accumulation rate on BSM optics, and how does this degrade delivery efficiency over months of operation?
6. At what robot-to-mast distance does the power delivery become insufficient for meaningful battery charging?

---

## Reference

- NASA VSAT study (2024) — surface-to-surface laser power beaming, 300 W at 10 km
- PowerLight Technologies (2022) — ground demonstration of laser power beaming
- Fafaul et al. — GaAs receiver efficiency at laser wavelengths
