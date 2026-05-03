# CMB-R1 Gait Recalculation After Leg Loss
## Chrystal Moon Base — Robot Fault Tolerance

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

When a CMB-R1 robot loses a leg — whether through mechanical failure, damage, or deliberate discard — the onboard AI must immediately compute a stable new walking pattern for the remaining legs. The robot must resume useful operation within a short time, without human intervention.

---

## The Problem

A hexapod walking on 6 legs has significant stability redundancy. Standard hexapod gaits keep at least 3 legs on the ground at any time, ensuring a stable support triangle. Losing one leg reduces the available support triangles and changes the robot's dynamic balance.

Losing two legs — particularly if they are adjacent — can make stable locomotion significantly harder. The algorithm must handle the general case: any combination of remaining legs.

---

## Proposed Approach

**Step 1 — Leg inventory:** On discard command execution, the AI immediately identifies which legs remain functional and their current positions.

**Step 2 — Support polygon calculation:** For every possible gait pattern (which legs are in swing phase vs. stance phase at each moment), compute the support polygon and verify that the center of mass projection falls within it with adequate margin.

**Step 3 — Speed optimisation:** Among all stable gait patterns, select the one that allows the highest forward speed while maintaining stability margin above a defined threshold.

**Step 4 — Smooth transition:** Rather than immediately switching to the new gait, interpolate the transition over 2–5 seconds to avoid sudden balance disturbance.

**Step 5 — Validation:** After the first 10 steps in the new gait, confirm that IMU data shows stable body orientation. If not, revert to a more conservative gait.

**Target recalculation time:** Less than 60 seconds from leg discard to resumed useful locomotion.

---

## Known Limitations

- Below 4 functional legs, stable omnidirectional locomotion is likely not achievable on rough terrain. A 3-legged robot would be limited to stationary operations.
- The algorithm's performance on actual Peary rim terrain (vs. flat simulation) is unknown and requires physical testing.
- Adjacent leg loss (e.g., legs 1 and 2 on the same side) is the hardest case. The algorithm must specifically handle this without producing an unsafe gait.

---

## Contribution Needed

A working implementation of this algorithm, tested in simulation with a realistic hexapod model on terrain representative of the Peary rim, would be a significant contribution to this project. The algorithm does not need to be novel — adapting published hexapod fault-tolerance research to the CMB-R1 configuration is entirely appropriate.
