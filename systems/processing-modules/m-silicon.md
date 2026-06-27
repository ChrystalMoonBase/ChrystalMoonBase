# M-Silicon — Silicon Extraction & Purification

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3. Two very different products from one element: **structural silicon**
(easy) and **solar/electronic silicon** (extremely demanding). For glass, ferrosilicon,
and — the prize — locally made solar cells.
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Reduces SiO₂ (highland regolith is ~45 % SiO₂) to silicon, then purifies it to whatever
grade the use demands. This is the clearest example of **purity-tier per substance**:
the same element needs wildly different purity depending on the product.

---

## Input → Output

- **Input:** SiO₂ from regolith (via MRE/MSE reduction, or the Si fraction of the alloy).
- **Output:**
  - **Structural / metallurgical silicon** — for ferrosilicon, alloys (≈99 %, easy).
  - **Solar-grade / electronic silicon** — for photovoltaics and electronics
    (**<ppb impurities, ~6N–9N+**, very hard).

---

## The science (grounded)

**Reduction:** MRE/MSE reduces SiO₂ to silicon; selective deposition of silicon
*without* aluminium co-deposition has been demonstrated in low-temperature molten salt
(FLiNaK). Fluorine-based multi-stage routes also separate and purify silicon (with
oxygen as a by-product).

**Purification to PV grade is the hard wall.** Photovoltaic silicon needs impurity
levels **below ppb** — 99 % is uselessly low. The terrestrial route is multi-step:
- vacuum-melt to drive off **phosphorus**,
- acidic-gas treatment to remove **boron and carbon**,
- high-temperature de-oxidation to remove **oxygen**,
- **zone-melting** to sweep out **Fe, Al, Ti, Ca** (impurities concentrate at the ingot
  end, which is cut off).

**The clever shortcut.** Because PV-grade silicon is so demanding, some concepts skip it
entirely: make **"moonglass"** from regolith melt and build **halide-perovskite** cells
on it, where **magnetic separation** lowers FeO to improve glass transmission toward
80–90 % — avoiding the <ppb silicon requirement altogether. A hybrid worth keeping open.

---

## Conceptual schematic — two silicon product lines

```
   SiO₂ (regolith) ──reduce(MRE/MSE/F)──► raw silicon
                                              │
                 ┌────────────────────────────┴───────────────┐
                 ▼                                             ▼
        structural Si (~99%)                        zone-refining train:
        → ferrosilicon, alloys                      vacuum-melt (P) → acid gas (B,C)
                                                     → de-oxidise (O) → zone-melt (Fe/Al/Ti/Ca)
                                                              ▼
                                                     solar/electronic Si (<ppb, 6N–9N)
                                                              ▼
                                  vacuum deposition of cells onto glass substrate
   ── OR shortcut: moonglass + perovskite cells (no <ppb Si needed) ──
```
*Conceptual; the choice between the silicon route and the perovskite shortcut is open.*

---

## Lunar-specific factors

- **Vacuum is a gift:** the lunar surface (~10⁻¹⁰ torr) is an ideal environment for
  **direct vacuum deposition** of thin-film solar cells — no vacuum chamber needed.
- **Concentrated sunlight** can both melt the glass substrate and drive deposition.

---

## Purity (per function)

- Structural/ferrosilicon: **~99 %** or alloy — fine.
- Solar/electronic: **<ppb (6N–9N+)** — the strictest target in the whole base, or
  side-stepped via the perovskite/moonglass route.

---

## Maturity (honest)

Structural silicon: feasible with MRE. PV-grade silicon on the Moon: proposed for
decades, but the multi-step <ppb purification is **the hardest purity task in the
chain** and unproven in situ. The perovskite-on-moonglass hybrid is newer and may be
more realisable near-term. Active funded research exists (e.g. TU Berlin SoMo).

---

## Open questions

1. PV silicon route vs perovskite-on-moonglass shortcut — which does CMB pursue?
2. Can the zone-refining train run on the available power and consumables locally?
3. Where do dopants come from for whichever cell type is chosen?

---

## References (verify and extend)

- Cell / Device 2025 — moonglass + halide-perovskite cells; magnetic FeO separation;
  silicon needs ~ppb impurity for PV.
- US Patent 6,090,361 — solar-silicon purification (vacuum-melt P; acid gas B/C; de-oxidation O; zone-melt Fe/Al/Ti/Ca). https://patents.google.com/patent/US6090361A/en
- NASA NTRS — vacuum evaporation of regolith silicon for thin-film cells (10⁻¹⁰ torr). https://ntrs.nasa.gov/search?q=lunar%20silicon%20thin%20film%20solar%20cell
- Landis, G.A. (NASA GRC) — *Materials refining on the Moon* (fluorine multi-stage refining, O₂ by-product), Acta Astronautica 60 (2007) 906–915. https://doi.org/10.1016/j.actaastro.2006.09.043
- ResearchGate 2025 — low-temperature MSE: selective Si deposition without Al.

*Figures are terrestrial/lab and modelling values; lunar performance unproven.*
