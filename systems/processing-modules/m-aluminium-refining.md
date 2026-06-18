# M-Aluminium-Refining — Ultra-Pure Aluminium (Electrorefining)

**Status:** Concept proposal, sourced, maximum depth. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3. Takes structural aluminium (from M-Aluminium / metal separation) to
**electrical/electronic grade (~99.99 %)** where conductivity or fine fabrication needs
it. Structural uses do **not** need this step.
**Design rule:** *No shortcuts; minimise Earth dependence.*

---

## When this factory is needed (and when it is not)

Most of the base's aluminium is **structural** — frames, fittings, reinforcement — and
~99.9 % from the primary route is already ample. This refining factory is only for the
**minority** that must be ultra-pure: electrical conductors, electronics, fine optics
mounts. Treating it separately keeps the heavy, Earth-leaning step off the critical path.

---

## SF — Three-Layer Electrorefining (Hoopes-type cell)

- **Produces:** aluminium at ~**99.99 %**.
- **Process:** a cell with **three stably stratified liquid layers** by density:
  - **bottom (anode):** the impure aluminium, made denser by alloying (traditionally
    with copper);
  - **middle:** a molten-salt electrolyte (traditionally fluoride-based, e.g. cryolite
    family) of intermediate density;
  - **top (cathode):** pure aluminium, the lightest layer, drawn off.
  Current drives aluminium from the bottom alloy, through the salt, to deposit pure on
  top; impurities stay in the bottom layer.

```
   ┌─────────────────────────┐
   │  top:  PURE Al (99.99%) │ ◄── tapped off
   ├─────────────────────────┤
   │  middle: molten salt    │ ◄── electrolyte (density-stratified)
   ├─────────────────────────┤
   │  bottom: impure Al alloy│ ◄── anode (impurities concentrate here)
   └─────────────────────────┘
```
*Conceptual; the three-layer density balance is the central engineering trick.*

---

## Earth-dependence (honest)

This is **the most Earth-dependent purification step in the base**, for two reasons:
1. the electrolyte is traditionally **fluoride-based** (fluorine is scarce at Peary);
2. the dense anode layer traditionally uses **copper** (also not a Peary resource).

So the honest position:
- **Structural aluminium avoids this entirely** (no refining needed) — fully local.
- **Ultra-pure aluminium** needs either a **small, recycled imported salt/alloy
  inventory** kept in a near-closed loop, or research into a **locally-sourced
  electrolyte and density-modifier**. This is an open problem, flagged — not pretended
  solved.
- Because the *need* for ultra-pure Al is limited, the Earth-dependence is **small in
  volume** even if real in kind.

| Item | Local? |
|---|---|
| Aluminium feed | **Yes** (anorthosite) |
| Energy | **Yes** (solar/electric) |
| Fluoride electrolyte | **No** — scarce; recycle / research substitute |
| Density-modifier (Cu) | **No** — research local alternative |

---

## Maturity (honest)

Three-layer electrorefining is **fully mature terrestrially** (≥99.99 %). The lunar
unknowns are entirely about **consumables**: building or recycling the electrolyte and
density-modifier without continuous Earth supply.

---

## Open questions

1. Can a density-stratified electrolyte be built (mostly) from local materials?
2. Is there a local substitute for the copper density-modifier?
3. How much ultra-pure Al does the base actually need — i.e. how small can this stay?
4. Could vacuum distillation or zone refining reach "good enough" Al purity instead,
   avoiding the salt entirely?

---

## References (verify and extend)

- Hoopes three-layer electrolytic refining (terrestrial, ≥99.99 %) — standard
  extractive-metallurgy references.
- ScienceDirect 2025 — LISAP-MSE primary aluminium route (upstream of this factory).
- See `m-metal-separation.md` for the shared electrolyte-sourcing problem.

*Lunar consumable closure is unproven. This is a proposal, not a settled design.*
