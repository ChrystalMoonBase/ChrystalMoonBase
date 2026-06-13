# CMB-R1 Head — Thermal Buddy
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Role

The thermal buddy robot follows directly behind the sintering robot, monitoring and controlling the cooling rate of freshly sintered material. It is the second most critical robot in the construction sequence — without thermal control, sintering quality collapses.

---

## Why Controlled Cooling Matters

When laser sintering heats regolith to melting point (~1200°C for basalt composition), a thin layer of glass-ceramic material forms. As this material cools, it contracts. If it cools too quickly — as it would in vacuum, where there is no atmosphere to conduct heat away gradually — the contraction creates thermal stress that exceeds the material's tensile strength, causing cracks.

On Earth, glassworkers call this problem annealing — and they solve it by controlling the cooling rate in a carefully temperature-managed oven. On the Moon, there is no oven. The thermal buddy robot IS the annealing system.

---

## Design Concept

**Infrared lamps:** The head carries a bank of infrared heating lamps directed at the freshly sintered surface behind the sintering robot. These lamps apply heat to slow the cooling rate, keeping the sintered material above the critical cracking temperature until thermal stress has dissipated.

**Thermal camera:** A high-resolution thermal camera continuously monitors the surface temperature of the sintered material. The thermal buddy AI uses this data to adjust lamp power in real time — more heat when cooling is too fast, less when temperature is adequate.

**Temperature targets (estimated):**
- Freshly sintered regolith: ~1200°C at sintering point
- Target cooling rate: < 50°C/minute (this figure needs experimental validation in Demonstrator 1)
- Minimum temperature before lamps can be reduced: ~600°C (below which thermal stress risk is greatly reduced — requires experimental validation)
- Final surface temperature: ambient lunar surface temperature

**Spacing:** The thermal buddy maintains a precise distance behind the sintering robot — close enough that the freshly sintered material hasn't cooled past the critical point before the lamps arrive, far enough that the lamps don't interfere with the sintering process ahead.

The optimal spacing depends on the sintering robot's forward speed and the cooling rate of the specific regolith composition. It must be determined experimentally in Demonstrator 1.

---

## Open Questions

1. What infrared lamp type, power level, and beam pattern provides the required heat distribution on a variable-width sintered strip?
2. What is the critical cooling rate threshold below which thermal cracking does not occur in sintered Peary-composition regolith?
3. What is the optimal spacing between sintering robot and thermal buddy, and how does this vary with robot speed?
4. How does the vacuum environment affect the thermal radiation exchange between the lamps and the sintered surface? (No convection — all heat transfer is radiative)
