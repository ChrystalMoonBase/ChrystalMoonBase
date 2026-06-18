# CMB8LF-L1 — Bulldozer Blade Tool Concept

**Chrystal Moon Base · Phase 0.2**
**Status:** Concept proposal — no prototype exists. This is an open question, not a specification.
**Licence:** CC0

---

## Context

The CMB8LF-L1 sintering laser is integrated directly into the arm-legs — no EPM swap required. The bulldozer blade is one of only two EPM-swapped tools (the other being the digger). When the blade is not attached, the arm-legs operate with their W-Re alloy tips for direct molten-regolith forming. When the blade is attached, the robot shifts to heavy regolith grading.

---

## 1. What this document is

This document describes one possible approach to a bulldozer blade for the CMB8LF-L1 octopod robot. It is not an engineering specification. Everything here is an estimate based on publicly available information. We publish it openly so that qualified engineers can tell us what is wrong, what is missing, and what could be improved.

---

## 2. Why a separate blade?

The CMB8LF-L1 is a universal chassis, not a specialised bulldozer. Adding a permanent blade to every robot would compromise its primary role as a mobile sensor, communication node, and sintering platform. Instead, the blade is a detachable tool, stored in the garage and picked up when needed.

This approach follows three design principles:

- The robot stays simple and versatile.
- Tools are stored where they are used.
- A solid tool with no moving parts cannot jam.

---

## 3. Physical description

The blade is a single sheet of metal, mirror-polished on both sides to reduce dust adhesion. It has no moving parts, no hinges, and no actuators.

| Parameter | Estimate | Why we chose it |
|---|---|---|
| Width | 1.2 m | Matches the robot's front profile, so it can push regolith evenly |
| Height | 0.4 m | Enough to move material without being too heavy |
| Thickness | 8 mm | Thin enough to be light, thick enough to resist bending |
| Estimated mass | ~12 kg | Calculated from the density of Al-Mg-Sc alloy |
| Material | Aluminium-magnesium-scandium (Al-Mg-Sc) | See material justification below |

---

## 4. Material choice

Al-Mg-Sc alloy was selected for several reasons:

- **Non-magnetic.** Lunar dust is often electrostatically charged and can be magnetic; aluminium alloys do not attract it.
- **High strength-to-weight ratio.** Scandium additions improve strength without adding much density, saving mass for launch.
- **No coatings required.** Paints or platings could outgas in vacuum or degrade under UV radiation. A polished metal surface is stable over time.
- **Good wear resistance.** While not as hard as steel, it is suitable for moving dry, granular material, especially in low gravity where contact forces are reduced.

We do not know how this material will perform long-term under lunar dust abrasion. Testing with simulant is needed.

---

## 5. Stability during blade use

A key concern for any wheeled or legged robot doing bulldozer work is reaction forces: the blade pushes the regolith, and the regolith pushes back. Here is how the CMB8LF-L1 addresses this structurally.

### Wide-foot snowshoe design

The CMB8LF-L1 feet use a broad, flat contact plate — analogous to a snowshoe — rather than a narrow spike or point. On loose lunar regolith, a pointed foot sinks. A wide foot distributes the robot's weight over a larger area, reducing ground pressure and preventing sinkage. In 1/6 g, the robot already weighs roughly six times less than on Earth, so ground pressure is inherently low; the wide-foot design ensures this advantage is not lost to point loading.

### Six-leg positioning for maximum ground reaction

While the two front arm-legs carry the blade, the remaining six legs are free to position for maximum stability. Each leg has at least three joints, giving it full freedom to:

- Splay outward to widen the support polygon and resist tipping.
- Lower the robot's centre of mass close to the ground.
- Pre-load each foot against the surface to generate maximum friction before the blade engages.

The combination of a wide support base, low centre of mass, and pre-loaded wide feet means the robot can resist the horizontal reaction force of the blade without slipping or tipping — even in regolith that is not fully compacted.

### Note: the blade vs. the digger tool

The companion [digger tool](./digger-tool.md) uses counter-rotating drums that cancel most horizontal reaction force internally. The blade does not have this advantage — it is a passive surface, not a balanced mechanism. The leg-positioning strategy described above is therefore especially important for blade operations.

---

## 6. Attachment to the robot

The blade attaches to the robot's front two arm-legs via the same electropermanent magnet (EPM) interface used for all CMB8LF-L1 tools.

- Two EPM-compatible plates are built into the back of the blade.
- The robot walks up to the blade, docks its arm-legs onto the plates, and activates the magnets.
- Activation requires a short pulse of electricity (<5 W, <1 second). Once attached, no power is needed to hold the blade.
- A second robot is not required for pickup or drop-off because the blade is held stationary in a storage bracket within the garage.

---

## 7. Storage in the garage

Each garage (internal dimensions 2.0 m × 2.0 m × 1.5 m) already holds two robots. Additional wall-mounted brackets hold two blades vertically.

The bracket is a simple mechanical frame. The robot slides the blade in and deactivates the magnets to release it. This arrangement requires no additional motors, latches, or power inside the garage.

---

## 8. Open questions

These are the things we do not know yet. Help is welcome.

| Question | Why it matters |
|---|---|
| Is 8 mm thickness enough? | Could be too thin for compacted regolith or too thick, wasting mass. |
| Does the polished surface really reduce dust adhesion? | Lunar dust is extremely fine and sticky; real-world testing is required. |
| How long will the blade last before it needs replacing? | Al-Mg-Sc wear resistance in abrasive lunar dust is not well documented. |
| Is 12 kg a realistic mass? | The exact weight depends on manufacturing details. |
| Can the robot push effectively in 1/6 g? | Addressed in part by the wide-foot and leg-positioning design (Section 5), but force balance needs simulation against real regolith properties. |
| Could a tungsten alloy cutting edge be beneficial? | W-Ni-Cu or W-Re alloys are non-magnetic and extremely wear-resistant. Could a thin insert be brazed to the Al-Mg-Sc blade? Is the mass penalty acceptable? |
| Could the blade be used to lightly shape semi-molten basalt? | If the cutting edge were a tungsten alloy (melting point >3400°C vs. basalt ~1200°C), could the blade smooth a freshly sintered surface before it fully cools? Would hot material stick? A question for materials scientists. |
| What is the optimal foot width for the snowshoe design? | Wider is better for stability but adds mass and complexity. An engineering study is needed to find the optimal balance for the range of expected regolith conditions on the Peary rim. |

---

**Repository:** [github.com/ChrystalMoonBase/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)
**Contact:** info@chrystalmoonbase.com
