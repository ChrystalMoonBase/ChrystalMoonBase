# M-Cement — Geopolymer Binder (Low-Energy Construction)

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 1 (build line). A **low-energy alternative/complement to sintering**:
a castable binder for silos, walls, landing pads and 3D-printed structure — without
high-temperature melting.
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Makes **geopolymer** — an amorphous aluminosilicate inorganic binder — by alkali-
activating regolith. It can replace ordinary Portland cement, cures at ambient/low
temperature, and is castable and 3D-printable. Where sintering needs lots of heat, the
geopolymer route trades heat for a chemical activator.

---

## Input → Output

- **Input:** aluminosilicate regolith (the precursor) + an **alkali activator**
  (e.g. NaOH / sodium silicate).
- **Output:** cured geopolymer "lunarcrete" — castable/printable structural material.

---

## The science (grounded)

Geopolymer forms by **depolymerisation then repolymerisation of silico-aluminate in an
alkaline environment**, curing at ambient to mildly elevated temperature. Crucially for
Peary, **highland anorthosite (high plagioclase feldspar) is a *better* geopolymer
precursor than mare** material.

Strengths (simulant): typically **~18–30 MPa**, and high-strength cement-free mixes
reach **~99–107 MPa at 28 days** — with highland (LHS-1) showing *superior* compactness,
denser gels and fewer microcracks than mare. All far above the ~4 MPa most lunar
structures need.

> Honest limit — the activator. Geopolymer needs an **alkali activator (NaOH / sodium
> silicate)**. Sodium is only a minor component of regolith, so the activator likely
> needs **import** (or recovery from the limited local Na), much like the chlorine/salt
> scarcity. This is the central open question for the route. Also: vacuum and sub-zero
> curing *reduce* strength, while heating to ~600 °C *increases* it — so curing
> conditions matter.

---

## Conceptual schematic — geopolymer casting

```
   regolith (aluminosilicate) ─┐
                               ├─► mix ─► cast / 3D-print ─► cure (ambient–600°C)
   alkali activator (NaOH) ────┘                                   │
   [import / local Na — open]                                      ▼
                                                      geopolymer structure
                                                      (silos, walls, pads)
```
*Conceptual; activator sourcing and cure schedule are open parameters.*

---

## Lunar-specific factors

- **Low energy** vs sintering — attractive when power is tight (early Pods).
- **Moonquakes** disturb fresh geopolymer (slump/cure) — a structural-design factor.
- **Curing environment** (vacuum, temperature swing) strongly affects final strength.

---

## Where it fits vs sintering

- **Sintering/melting:** no imported consumable, but high energy.
- **Geopolymer:** low energy, but needs an imported/scarce activator.

So the two build-line routes are **complementary**: sinter where power is available and
no consumables are wanted; geopolymer-cast where low energy matters and some activator
import is acceptable. Both vastly exceed the strength requirement.

---

## Open questions

1. Can the alkali activator be sourced/recycled locally, or must it be imported — and
   in what minimum quantity?
2. Optimal cure schedule under Peary's vacuum and thermal swing?
3. Geopolymer vs sintering split across the build front (which structures use which)?

---

## References (verify and extend)

- MDPI Materials 2022 — geopolymer review: amorphous aluminosilicate binder, alkali
  activation, ambient cure.
- MDPI Polymers 2024 — lunar regolith geopolymer ~18–30 MPa; highland more suitable
  than mare; needs alkali activator (NaOH / sodium silicate).
- ScienceDirect 2024 — cement-free LHSC up to ~107 MPa (LHS-1 highland), denser gels.
- ResearchGate 2017 — geopolymer under heat/vacuum: +strength at 600 °C, −strength in
  vacuum/sub-zero.

*Figures are simulant/lab values; lunar performance unproven.*
