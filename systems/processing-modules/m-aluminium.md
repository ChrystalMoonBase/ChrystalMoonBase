# M-Aluminium — Aluminium Extraction & Refining

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 2/3. The **primary local structural metal** at Peary (highland
anorthosite is ~27 % Al₂O₃). Reinforcement, frames, fittings, dome fibre feedstock
(as alumina).
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Reduces aluminium oxide (alumina) from anorthite to aluminium metal, with oxygen as a
co-product. Aluminium replaces the (locally unavailable) titanium across the design as
the workhorse metal.

---

## Input → Output

- **Input:** anorthite-rich regolith (or the Al-bearing fraction of the MRE alloy).
- **Output:** aluminium metal (structural, up to ~99.99 % after refining), plus
  **oxygen, water and silica** as co-products of the end-to-end route.

---

## The science (grounded)

A demonstrated end-to-end concept, **LISAP-MSE** (Lunar In-Situ Aluminium Production
through Molten Salt Electrolysis), reduces alumina to aluminium and oxygen in a molten
salt bath, producing **aluminium metal, oxygen, water and silica from anorthite
abundant in lunar highlands**. A steady supply of hydrogen chloride lets the process
recycle several consumables internally.

Two stages:
1. **Win the metal** — from anorthite (LISAP-MSE) or as the Al/Fe(+Si) fraction of the
   MRE cathode alloy.
2. **Refine it** — the raw metal is alloyed/contaminated. Terrestrial **electrorefining
   (three-layer Hoopes cell)** reaches ~**99.99 %**. It is energy-heavy but the purity
   target is not the problem.

> Honest limit: the MRE alloys are mixed (Al with Fe, Si, Ca), and reactor materials
> can contaminate them. So aluminium for structure comes either from the dedicated
> anorthite route (cleaner) or from refining the mixed alloy — refining is a real,
> separate factory.

---

## Conceptual schematic — anorthite → aluminium

```
  anorthite regolith
        │ (HCl-assisted dissolution / molten-salt bath)
        ▼
  molten-salt electrolysis (LISAP-MSE)
        ├──► O₂        ├──► H₂O        ├──► silica (SiO₂ → M-Glass/M-Silicon)
        ▼
  raw aluminium ──► electrorefining (Hoopes 3-layer) ──► Al 99.9–99.99%
```
*Conceptual; consumable recycling loop (HCl) and energy budget are open.*

---

## Lunar-specific factors

- **Consumable recycling is key:** the chloride route needs HCl; closing that loop
  locally (vs importing) is a central design question.
- **Energy-heavy:** electrorefining is a late-stage, higher-power factory — comes once
  several Pods' power is in place.

---

## Purity (per function)

- Structural Al: **99.9 %** is ample.
- Electrical/electronic conductor: push to **99.99 %** via electrorefining.
- Alumina (Al₂O₃) for ceramic/fibre: a different product line (see M-Glass/ceramics).

---

## Maturity (honest)

Aluminium-from-anorthite is studied with an end-to-end concept (LISAP-MSE); terrestrial
electrorefining is fully mature. Lunar-specific unknowns: closing the HCl loop, and
handling the mixed-alloy feed. TRL moderate.

---

## Open questions

1. Dedicated anorthite route vs refining MRE alloy — which is the primary path?
2. Can the HCl / molten-salt consumables be recycled locally to near-closure?
3. How much aluminium output must be alumina (Al₂O₃) for ceramics/fibre vs metal?

---

## References (verify and extend)

- ScienceDirect 2025 — LISAP-MSE: aluminium, O₂, water and silica from highland
  anorthite via molten-salt electrolysis.
- arXiv 2408.05823 — https://arxiv.org/abs/2408.05823 — MRE alloy categories (Al/Fe ± Si).
- Hoopes three-layer electrorefining (terrestrial, ~99.99 %).

*Figures are terrestrial/lab and modelling values; lunar performance unproven.*
