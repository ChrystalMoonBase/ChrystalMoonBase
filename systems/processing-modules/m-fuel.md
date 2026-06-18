# M-Fuel — Propellant (Hydrogen & Oxygen)

**Status:** Concept proposal, sourced. Tentative — depends on water (M-Water).
**Licence:** CC0
**Role:** Stage 3. Makes H₂/O₂ propellant for landing/launch and surface hoppers, and
hydrogen as a process reductant.
**Ground truth:** Peary highland; propellant rides on confirmed water + power.

---

## What it does

Splits water into hydrogen and oxygen by electrolysis, then liquefies and stores them
(LH₂ / LOₓ). Oxygen also comes "for free" from M-MRE; hydrogen's main source is water.

---

## Input → Output

- **Input:** clean water (M-Water) + electrical energy.
- **Output:** **H₂ and O₂**, liquefied for storage; H₂ also feeds reduction processes.

---

## The science (grounded)

**Direct Water Electrolysis (DWE):** water → H₂ + O₂, with **essentially no
byproducts** — one of the cleanest steps in the chain. The gases are dried, compressed
and cryogenically liquefied. This is mature electrochemistry; the lunar challenge is
**cryogenic storage**, not the splitting.

> Why it matters beyond rockets: locally-made propellant is what lets the base **land
> and launch without Earth fuel** — a major independence lever — and hydrogen is a
> reusable reductant for several factories.

---

## Conceptual schematic — DWE + storage

```
   water ──► electrolyser ──► H₂ ──► dry/compress ──► liquefy ──► LH₂ tank
                          └─► O₂ ──► dry/compress ──► liquefy ──► LOₓ tank
                                         (O₂ also from M-MRE)
```
*Conceptual; cell stack, pressures and tank design are open parameters.*

---

## Lunar-specific factors

- **Cryo-storage is the hard part:** LH₂ especially is hard to keep through the lunar
  day; boil-off management dominates the engineering.
- **PSR cold + night** help storage; active cooling likely still needed for LH₂.

---

## Earth-dependence

**None for the process** (electrolysis needs only water + power). The dependence is
**through water** — i.e. on confirmed ice. No imported consumables.

---

## Maturity (honest)

DWE is mature; lunar propellant production is a flagship ISRU goal. Gating items:
**water supply** and **cryogenic storage/boil-off**, not the chemistry.

---

## Open questions

1. Split between life-support O₂, process H₂, and stored propellant?
2. LH₂ boil-off strategy across the lunar day?
3. Propellant scale — hoppers only, or ascent vehicles too?

---

## References (verify and extend)

- arXiv 2502.13679 — DWE: water → H₂ + O₂, essentially no byproducts.
- NASA ISRU overview (NTRS 2022) — ISRU propellant for surface mobility / ascent.

*Contingent on water supply. This is a proposal, not a settled design.*
