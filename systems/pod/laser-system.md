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

## BSM Distribution

Five BSMs at approximately 7 / 14 / 21 / 28 / 35 m serve 16 robots across a 2+ km operational radius. The mast AI selects the optimal BSM for each robot based on position and line-of-sight geometry. Robots with steerable GaAs receiver panels actively optimise angle of incidence as they move.

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
