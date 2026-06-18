# Demonstrator 3 — Robot Locomotion in Simulated Lunar Conditions
## Chrystal Moon Base — Phase 0 Earth Programme

**Status:** Not yet begun  
**Licence:** CC0

---

## Objective

Demonstrate that a CMB8LF-L1 prototype chassis can walk reliably on simulated lunar regolith terrain under representative thermal and dust conditions, including fault-tolerance scenarios (leg loss, head swap).

---

## Test Protocol (Proposed)

**Test robot:** A CMB8LF-L1 prototype chassis — not necessarily flight-quality, but representative of the leg architecture, variable ride height, and front-limb dual-function capability.

**Test surface:** A regolith simulant bed of at least 5 × 5 metres, filled with MMS-1 or equivalent to a depth of 30 cm. Surface prepared with representative rock obstacles and slope variations.

**Thermal environment:** Ideally tested in a thermal chamber at −50°C to simulate cold operational conditions. If a chamber of sufficient size is not available, key subsystems (leg joint lubricants, electronics, actuators) are individually cold-tested.

**Test series:**

1. **Basic locomotion** — walk across the simulant bed in all six-legged configurations. Measure speed, stability, and terrain adaptation.

2. **Variable ride height** — transition between high and low configurations on flat and sloped terrain. Measure stability during transition.

3. **Front limb arm mode** — lower to arm configuration, use front limbs to pick up and place a weighted object (simulating head attachment/detachment). Measure success rate over 20 repetitions.

4. **Leg loss simulation** — disable one leg electronically, trigger gait recalculation, and measure time to stable resumed locomotion. Repeat for 2-leg loss scenarios.

5. **Head swap** — robot approaches a simulated Pod storage chamber, detaches its current head, retrieves and attaches a different head. Measure time and success rate.

6. **Dust exposure** — operate robot in environment with active dust suspension for 24 hours. Inspect joint seals, optical sensors, and electronics for dust ingress.

---

## Success Criteria

- Stable locomotion on simulant terrain in all tested configurations
- Front limb arm mode achieves object pick-and-place with ≥ 90% success rate
- Gait recalculation after single-leg loss completes in < 60 seconds
- Robot functional after 24-hour dust exposure
