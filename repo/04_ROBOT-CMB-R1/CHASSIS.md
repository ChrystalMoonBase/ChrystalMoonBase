# CMB-R1 Chassis
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

The chassis is the structural and computational core of the CMB-R1. All six legs attach to it. The tool head mounts on its front interface. The power receiver, onboard computer, and communications systems are housed within it. Its design follows the same layered construction principle as the legs: electronics inside, protective gel surrounding, sintered basalt composite exterior.

---

## Shape and Dimensions (Estimated)

The chassis is an elongated hexagonal body, approximately:
- Length: 1.2–1.4 m
- Width: 0.7–0.9 m  
- Height (body only): 0.25–0.35 m

The elongated shape positions the front leg pair well forward of the center of mass when the front limbs are in arm mode, improving stability during manipulation tasks.

Six leg attachment points are located symmetrically: one pair at the front, one pair midships, one pair at the rear. The front pair are the dual-function arm/leg limbs described in FRONT-LIMBS-ARM-MODE.md.

The tool head interface is centered on the front face of the chassis, between and slightly above the front leg attachment points.

---

## Internal Structure

**Structural frame:** Carbon-fibre reinforced polymer (CFRP) internal skeleton. The frame carries structural loads and provides mounting points for all internal components.

**Electronics bay:** The central upper section houses the main compute unit, power conditioning electronics, and communication systems. These are thermally coupled to the chassis wall for passive heat dissipation and protected by the multi-layer exterior construction.

**Power receiver:** The laser power receiver — an array of GaAs photovoltaic cells optimised for the laser wavelength — is mounted on the upper chassis surface or on a steerable platform. It must maintain line-of-sight to the transmitting BSM. A two-axis gimballed receiver platform allows the cells to track the laser beam as the robot moves and the relevant BSM changes.

**Battery:** Solid-state battery cells are distributed through the chassis structure — some in the chassis body, some in the leg segments. Total onboard energy storage provides estimated 2–4 hours of reduced-power autonomous operation during laser power interruptions.

---

## Thermal Management

The lunar surface temperature at the Peary rim varies from approximately −50°C to +10°C — a relatively benign range compared to equatorial sites. However, the electronics and batteries require operation above a minimum temperature (typically −20°C to −40°C depending on component).

**Thermal management approach:**
- Multi-layer insulation (MLI) blankets on exterior surfaces reduce heat loss during cold periods
- Embedded heaters in electronics bay and leg segment bases maintain minimum temperatures during shadow periods
- Passive thermal coupling between electronics and chassis wall dissipates excess heat during high-power operations
- The basalt composite exterior acts as a thermal buffer — slow to heat and slow to cool, moderating temperature changes

The heater power budget during shadow periods is one of the inputs to the overall power budget in POWER-BUDGET.md.

---

## Mass Estimate

**Chassis body (without legs or head):** 80–120 kg estimated  
**Full robot with legs, no head:** 250–350 kg estimated  
**Full robot with heaviest head (sintering):** 280–400 kg estimated

These are rough estimates. A detailed mass budget requires component-level design that does not yet exist.

---

## Open Questions

1. What chassis material provides the optimal combination of structural performance, thermal properties, and radiation resistance within mass budget?
2. What is the optimal placement of the laser power receiver — fixed on chassis upper surface, or on a steerable platform?
3. How are the leg attachment points reinforced to carry the impact loads of robot footfalls transmitted up through the leg structure?
4. What is the actual mass of all chassis components at flight-quality design?
