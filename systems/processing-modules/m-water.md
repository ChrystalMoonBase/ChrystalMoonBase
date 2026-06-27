# M-Water — Water Extraction & Purification

**Status:** Concept proposal, sourced. Tentative — **depends on Peary cold-trap ice
being confirmed.**
**Licence:** CC0
**Role:** Stage 3 (polar stream). Life support, process water, and the feedstock for
propellant and for hydrogen as a reductant.
**Ground truth:** Peary highland / anorthosite; polar cold traps unconfirmed.

---

## What it does

Extracts water from polar cold-trap ice (or hydrated regolith), cleans it, and feeds it
to life support, to M-Fuel (electrolysis), and to processes that use H₂/H₂O (e.g. the
silicon slag-gas step). On the Moon, water is the highest-leverage volatile.

---

## Input → Output

- **Input:** icy regolith from a permanently shadowed region (PSR), if present.
- **Output:** clean water (≥99 %), plus **co-extracted volatiles** (ammonia, H₂S, CO₂…)
  routed to the C/N/S streams.

---

## The science (grounded)

**Soil/Water Extraction (SWE):** icy regolith is heated so water sublimes/evaporates and
is captured on a cold surface; the dried regolith returns to the build line/shielding.
SWE produces **non-volatile dried regolith plus a small amount of volatiles** (ammonia,
hydrogen sulfide, CO₂) — which are not waste but **C/N/S feedstock**. Purification is
simple **distillation/filtration** to well above 99 %.

> Honest dependency: this whole factory is contingent on **confirmed accessible ice at
> Peary**, which is not yet established. If ice is scarce, water becomes an imported or
> tightly-recycled resource and several downstream factories (fuel, some purification)
> are constrained.

---

## Conceptual schematic — SWE

```
   icy regolith ──heat──► H₂O vapour (+ volatiles) ──► cold trap / condense
        │                                                   │
        ▼ dried regolith → build line / shielding           ▼
                                              clean water (distil) ≥99%
                                              volatiles → C/N/S streams
```
*Conceptual; thermal-mining method and yields are open parameters.*

---

## Lunar-specific factors

- **The cold is free** for condensing/storing, but keeping ice cold during handling and
  preventing loss to vacuum are real engineering loads.
- **PSR operations are hard:** no sunlight in the trap means power must be beamed/cabled
  in or the ice hauled to a lit processing site.

---

## Earth-dependence

**None for the process** (heat + cold, both local). The dependence is **geological**:
the resource itself must exist at Peary. No imported consumables.

---

## Maturity (honest)

Water extraction is a top global ISRU priority with active hardware development and
planned lunar demos. The science is sound; the unknowns are **the resource (does Peary
have accessible ice?)** and PSR thermal-mining engineering.

---

## Open questions

1. Is there accessible ice at Peary, and in what form/grade?
2. Extract in-place in the PSR, or haul icy regolith to a lit site?
3. How much co-volatile C/N/S can realistically be captured alongside the water?

---

## References (verify and extend)

- arXiv 2502.13679 — https://arxiv.org/abs/2502.13679 — SWE/DWE byproduct analysis: dried regolith + volatiles (NH₃, H₂S, CO₂).
- NASA ISRU overview (NTRS 2022) — water as the first/easiest resource; demos planned.
- LCROSS-class results — water + volatiles in a polar cold trap (south pole; Peary north
  unconfirmed).

*Contingent on unconfirmed resource. This is a proposal, not a settled design.*
