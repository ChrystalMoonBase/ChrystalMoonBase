# Laser System
## Chrystal Moon Base — Phase 0.2 Power Architecture

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

The laser system converts electrical power from the solar curtain into a laser beam distributed to working robots via the BSMs. It is the link between power generation and power consumption — the grid of the Pod.

---

## Laser Type

**Ytterbium fibre laser**, wavelength approximately 1070 nm (near-infrared).

Ytterbium fibre lasers are selected because:
- Wall-plug efficiency of ~45% is among the highest of any high-power laser type
- Multi-kilowatt commercial systems are available and flight-heritage-adjacent (similar technology used in satellite optical communications)
- The 1070 nm wavelength is well-matched to the GaAs photovoltaic cells used on robot receivers
- Fibre delivery to BSMs via optical fibre is straightforward at this wavelength

---

## Power Budget

| Parameter | Value |
|---|---|
| Input electrical power | ~150 kW |
| Wall-plug efficiency | ~45% |
| Laser optical output | ~67.5 kW |
| Distribution to 5 BSMs | Fibre splitter, ~2.7 kW per BSM |
| Delivery efficiency (pointing, dust) | ~80% estimated |
| Power at robot receiver | ~2.2 kW per robot served |
| Robot electrical conversion efficiency | ~30% (GaAs at laser wavelength) |
| Electrical power at robot | ~0.66 kW per robot |

These estimates have significant uncertainty, particularly in delivery efficiency (which depends on pointing accuracy and dust accumulation) and receiver conversion efficiency (which depends on cell temperature and wavelength match). The figures are starting points for engineering analysis, not specifications.

At 0.66 kW per robot, 8 robots simultaneously receive approximately 5.3 kW total. This is within the available laser output of 67.5 kW, suggesting headroom for either more robots, higher per-robot power, or losses higher than estimated. The actual operating point requires detailed modelling.

---

## Location

The laser system is housed in the Pod base container — the buried, thermally insulated central unit below the mast base. This protects the laser from the extreme surface thermal environment and from dust. Optical fibre carries the beam up through the mast interior to each BSM.

---

## Open Questions

1. What is the actual wall-plug efficiency of a flight-qualified ytterbium fibre laser at the relevant power level and temperature range?
2. What fibre type and routing are required for the 55-metre mast interior, including the thermal cycling loads during deployment?
3. What is the actual GaAs conversion efficiency at 1070 nm and at robot operating temperatures?
4. How is the laser power split between 5 BSMs — fixed split or dynamic allocation based on current robot positions?
