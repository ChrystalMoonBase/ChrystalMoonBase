# Mineral Fibre Production (M-MINERAL-FIBRE)
## Chrystal Moon Base — Processing Module Concept
### (formerly "M-Basalt" — renamed; see note)

**Status:** Concept proposal — properties uncharacterised
**Licence:** CC0
**Ground truth:** `PEARY-MATERIALS-REFERENCE.md`

---

## Why the rename

This module was called "M-Basalt" and described drawing **basalt fibre**. True
basalt fibre is drawn from *basalt* melt — an iron/magnesium-rich rock of the
lunar **mare** plains. Peary is **highland** terrain, where the regolith is
**anorthosite** (calcium/aluminium-rich, feldspar-dominated). You cannot draw
"basalt fibre" from a feedstock that contains no basalt. The module is therefore
renamed to **mineral fibre** and re-based on the local anorthosite melt.

---

## Overview

**Input:** Local **anorthosite regolith** melt (not basalt).

**Output:** Drawn mineral fibre, fibre-composite panels, and shaped components
requiring more controlled conditions than direct field sintering.

**Process:** The sintered-regolith floor and bulk structure are made by the
robots sintering regolith directly (see the sintering documents). This module is
the *fixed facility* for drawing continuous **anorthosite mineral fibre** and
forming fibre-composite parts — a candidate matrix for outer-shell composites and
chassis armour.

**Honest caveat on properties:** anorthite (the dominant highland mineral) melts
hotter than basalt — roughly **~1,550 °C** versus ~1,200 °C — with different
viscosity and a narrower drawing window. Fibre drawn from anorthosite melt will
**not** have the same, well-characterised properties as terrestrial basalt fibre.
Its mechanical properties are **not yet characterised** and must be measured, not
assumed. Do not quote basalt-fibre datasheet values for this material.

**Not needed for the first floor.** Initial floor construction is robot sintering,
not this module. M-Mineral-Fibre becomes relevant only when precision structural
fibre components are required.

**Key challenge:** Drawing continuous mineral fibre requires precise temperature
control of a viscous melt. The higher anorthosite melt temperature and unknown
draw behaviour make this harder than the basalt-referenced literature suggests.

---

## Open Questions

1. What fibre properties (tensile strength, modulus, thermal limits) does
   anorthosite mineral fibre actually achieve? (Requires testing.)
2. What melt temperature, viscosity control, and draw rate are workable for
   anorthosite at Peary conditions?
3. What is the module mass and volume, and does it fit the delivery constraints?
4. What are the failure modes and how are they managed autonomously?
5. How does this module connect to the underground utility network?

*Engineers with relevant materials-science or fibre-drawing experience are
invited to review and improve this document via GitHub Issues.*
