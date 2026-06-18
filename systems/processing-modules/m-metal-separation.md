# M-Metal-Separation — Unscrambling the MRE Alloy

**Status:** Concept proposal, sourced, maximum depth. Tentative — this is a genuinely
hard, partly unsolved problem; flagged honestly throughout.
**Licence:** CC0
**Role:** Stage 3. Takes the **mixed metal alloy** from M-MRE and separates it into
single metals (Al, Fe, Si, Ca, Mg). Without this, MRE gives only "metal soup."
**Design rule:** *No shortcuts; minimise Earth dependence.* Physical separations
(distillation, solidification, electro-) preferred — all driven by local heat/vacuum/
electricity.

---

## The honest problem

The MRE cathode product is **not** single metals. It comes out as complex, multiphase
alloys — broadly an **Al/Fe(+Si)** alloy, an **Fe/Si(±Ti/Al)** alloy, and a
**Ca/Si/Al(±Mg)** alloy. Worse, **mechanical methods (sieving) cannot isolate** the
metals, and the **reactor materials themselves contaminate** the product with Cr, Mn,
Ni, Mo. So a dedicated separation factory is unavoidable — and it is one of the least
mature parts of the whole chain.

```
   M-MRE alloy ("soup")
        │  Al · Fe · Si · Ca · Mg  (+ reactor Cr/Mn/Ni/Mo)
        ▼
   [SF-A vacuum distillation] → volatile metals off (Mg, Ca)
        ▼
   [SF-B fractional solidification] → split by freezing point
        ▼
   [SF-C molten-salt electrorefining] → single high-purity metals
```

---

## SF-A — Vacuum Distillation (split by volatility)

- **Separates:** the **volatile** metals (magnesium, then calcium) from the
  non-volatile ones (Al, Fe, Si, Ti).
- **Process:** heat the alloy under vacuum; metals boil off in order of volatility
  (Mg boils ~1091 °C, Ca ~1484 °C, well below Al ~2470 °C, Fe ~2862 °C, Si ~3265 °C).
  Vapours are condensed separately at staged cold surfaces.
- **Earth-dependence:** **NONE.** Vacuum is free on the surface; heat is solar/electric;
  the lunar night/PSR provides cold condensing surfaces. A near-ideal lunar process.

```
   alloy ──(vacuum, rising T)──► Mg vapour → condense ──► Mg
                              └─► Ca vapour → condense ──► Ca
        ▼ residue: Al / Fe / Si / Ti (+ Cr/Mn/Ni/Mo)
```
*Conceptual; staged condenser temperatures are open parameters.*

---

## SF-B — Fractional Solidification (split by freezing point)

- **Separates:** the non-volatile residue partially, by directional/fractional freezing
  (different metals and intermetallics freeze at different temperatures, concentrating
  some phases).
- **Process:** controlled slow solidification; earlier-freezing phases (e.g. iron-rich)
  separate from later-freezing ones; repeated for sharper splits.
- **Earth-dependence:** **NONE.** Heat + controlled cooling only.
- **Honest limit:** alloys with close freezing behaviour and intermetallic compounds
  (e.g. Fe–Si, Al–Si) do **not** cleanly separate this way — hence SF-C.

```
   residue melt ▓▓▓▓░░░░  ◄ solidification front
   Fe-rich first │ Al/Si-rich tail   (partial split only)
```

---

## SF-C — Molten-Salt Electrorefining (single metals)

- **Separates:** the remaining intermixed metals into **single high-purity metals**, and
  crucially removes the **reactor-contaminant metals** (Cr, Mn, Ni, Mo) that no physical
  step takes out.
- **Process:** the impure metal is the anode in a molten-salt cell; the wanted metal
  dissolves and re-deposits pure at the cathode, leaving nobler/baser contaminants
  behind. (Aluminium gets its own dedicated cell — see `m-aluminium-refining.md`.)
- **Earth-dependence:** **MEDIUM — the real weak point.** Electrorefining needs a
  **molten-salt electrolyte**. If that salt uses chlorides/fluorides, it is
  Earth-dependent (Cl/F scarce at Peary). Open question: can a viable electrolyte be
  built from local materials, or is a small, recycled salt inventory imported and kept
  in a near-closed loop?

```
   impure metal (anode) ──► [molten salt] ──► pure metal (cathode)
                                  │
                        contaminants (Cr/Mn/Ni/Mo) stay in anode sludge
```
*Conceptual; electrolyte chemistry is the central open question.*

---

## Earth-dependence summary

| Sub-factory | Method | Earth-dependent? |
|---|---|---|
| SF-A vacuum distillation | volatility (Mg, Ca) | **No** |
| SF-B fractional solidification | freezing point | **No** |
| SF-C molten-salt electrorefining | electrochemical | **Medium** (electrolyte salt) |

**Net:** the volatile metals (Mg, Ca) and a first split come out with **zero** Earth
dependence. The final single-metal purity (and removing reactor contaminants) leans on
an electrolyte that may need a small, recycled imported salt inventory — the one honest
dependence, and a priority to design around.

---

## Maturity (honest)

This is among the **least mature** parts of the chain. MRE alloy characterisation
exists, vacuum distillation and electrorefining are mature *terrestrially*, but
separating *lunar MRE alloy specifically* — with its reactor contamination — has not
been demonstrated end to end. Treat as an open research front, not a solved factory.

---

## Open questions

1. Can a molten-salt electrolyte for SF-C be built (mostly) from local materials?
2. How much does reactor contamination (Cr/Mn/Ni/Mo) actually load the alloy, and does
   it force SF-C even for structural metal?
3. Is it better to tune **M-MRE** to yield cleaner alloy fractions up front, reducing the
   separation burden here?
4. Which metals are even worth separating to purity vs used as the alloy (ferrosilicon)?

---

## References (verify and extend)

- arXiv 2408.05823 — MRE alloy categories (Al/Fe, Fe/Si, Ca/Si/Al); review of refining.
- Sibille et al. (KSC) — reactor-material contamination (Cr/Mn/Ni/Mo) of MRE product;
  mechanical separation unsuitable.
- Standard physical metallurgy — metal boiling points / vacuum distillation; molten-salt
  electrorefining (terrestrial, mature).

*Lunar-specific performance unproven. This is a proposal, not a settled design, and one
of the more uncertain modules.*
