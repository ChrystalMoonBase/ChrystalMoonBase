# Structural Basalt Production (M-BASALT)
## Chrystal Moon Base — Processing Module Concept

**Status:** Concept proposal — no hardware exists  
**Licence:** CC0

---

## Overview

**Input:** Bulk regolith — sintered in situ by CMB-R1 robots

**Output:** Sintered basalt panels, rods, and structural shapes

**Process:** Laser sintering by CMB-R1 robots is the primary production method (covered in 05_SINTERING/). M-Basalt as a dedicated processing module refers to a fixed facility for producing basalt fibre, basalt composite panels, and shaped basalt components that require more controlled conditions than direct field sintering.

**Note:** Basalt fibre has excellent mechanical properties and can be woven into composite materials. It is a potential matrix for the outer dome shell composite and for robot chassis armour. The M-Basalt module is not needed for the initial sintered floor construction — that is done by the robots directly. It becomes relevant in Phase 1.2 when precision structural components are needed.

**Key challenge:** Drawing basalt fibre requires precise temperature control of a viscous melt. Maintaining the required temperature stability in a lunar environment without the temperature-buffering effect of Earth's atmosphere is an engineering challenge.

---

## Open Questions

1. What is the optimal processing rate for this module given the available power budget?
2. What is the module mass and volume, and does it fit within the planned delivery vehicle constraints?
3. What feedstock pre-processing is required before input to this module?
4. What are the failure modes and how are they detected and managed autonomously?
5. How does this module connect to the underground utility network for power, feedstock, and product output?

*Engineers with relevant process chemistry or ISRU experience are invited to review and improve this document via GitHub Issues.*

---

## Feedstock note (highland site) — flagged for review

**Important:** True basalt fibre is drawn from *basalt* melt — a mafic, iron/magnesium-rich rock found in the lunar **mare** plains. The Peary rim is **highland** terrain, where the regolith is **anorthosite** (calcium/aluminium-rich, feldspar-dominated). Anorthosite melt has different viscosity and a higher melting point (~1,550 °C for anorthite vs ~1,200 °C for basalt), so "basalt fibre" specifically is not directly producible from local Peary feedstock.

Two honest options, to be decided:
1. **Anorthosite/regolith mineral fibre** — draw mineral fibre from the locally available highland melt, accepting different (and not-yet-characterised) fibre properties. This keeps the no-import, ISRU-first principle.
2. **Import mare-basalt feedstock or basalt fibre** — only if a specific structural need cannot be met by local anorthosite fibre. This breaks the ISRU principle and should be avoided.

This document currently describes the *terrestrial* basalt-fibre process as a reference. Adapting it to highland anorthosite feedstock is an open engineering question (see project questions list).
