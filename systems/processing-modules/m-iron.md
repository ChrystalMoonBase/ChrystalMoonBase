# M-Iron — Iron & Ferrosilicon

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3. A **co-product**, not a primary target — highland Peary is iron-poor
(~5 wt% FeO). The realistic product is **ferrosilicon alloy**, useful as-is.
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Captures the iron- and silicon-bearing alloy fraction from M-MRE / metal separation. At
a highland site this is modest in quantity and naturally comes out as an **Fe/Si alloy
(ferrosilicon)** rather than pure iron — and that alloy is itself a useful product.

---

## Input → Output

- **Input:** the Fe/Si(±Ti/Al) alloy fraction from M-MRE / M-Metal-Separation.
- **Output:** **ferrosilicon** (alloy is the product), and — only if needed — purer iron
  via further refining.

---

## The science (grounded)

MRE on regolith yields, among its alloys, an **Fe/Si** family. Reported highland MRE
concepts give ferrosilicon plus oxygen as co-products. Because highland FeO is low,
**iron is never abundant here** — which is *fine*, because:
- **Ferrosilicon is the product:** for many uses (magnetic cores, certain tools,
  feedstock for further alloys) the alloy is wanted, and chasing "99 % pure iron" would
  be counter-productive (it would mean *removing* the silicon you deliberately have).
- Pure iron, if ever needed, comes from further electrorefining (see metal separation).

> Honest framing: this is a **by-product line**, not a steel mill. Structural metal at
> Peary is **aluminium**; iron plays a supporting role. Trying to make Peary an
> iron-producer fights the geology.

---

## Conceptual schematic

```
   M-MRE alloy ──► Fe/Si fraction ──► ferrosilicon (USE AS-IS)
                                          │
                                          └─(only if pure Fe needed)─► electrorefine
```
*Conceptual; how much (if any) pure iron is needed is an open question.*

---

## Lunar-specific factors

- **Magnetic separation** can also pull native/nanophase iron and iron-bearing grains
  from raw regolith — a simple, reagent-free pre-concentration (also used to clean FeO
  out of glass; see M-Glass).
- Low quantity means iron is **rationed to where it matters**, not used freely.

---

## Earth-dependence

**None** for ferrosilicon (it rides on MRE). Pure-iron refining would share the
electrorefining electrolyte dependence (see `m-metal-separation.md`).

---

## Maturity (honest)

Ferrosilicon as an MRE co-product is grounded; the honest point is **availability, not
process** — there simply is not much iron at Peary, so plan around aluminium.

---

## Open questions

1. Does the base ever need *pure* iron, or is ferrosilicon always sufficient?
2. Is magnetic pre-concentration of iron from raw regolith worth the step at low FeO?
3. Where is iron genuinely irreplaceable by aluminium (e.g. magnetics)?

---

## References (verify and extend)

- arXiv 2408.05823 — MRE alloy families incl. Fe/Si.
- Highland MRE concepts — ferrosilicon + oxygen co-products from anorthosite.
- `PEARY-MATERIALS-REFERENCE.md` — ~5 wt% FeO at highland Peary.

*Lunar performance unproven. This is a proposal, not a settled design.*
