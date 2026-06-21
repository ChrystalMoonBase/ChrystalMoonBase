# Dome Reinforcement — Fibre Options

**Status:** Options and data for review — **not a decision.** Final material
selection is structural/materials engineering work requiring test data that does
not yet exist.
**Licence:** CC0

---

## What this is about

A pressurised dome wall is loaded in **tension** (membrane/hoop stress) by the
interior atmosphere pushing outward. Brittle glass alone is weak in tension, so the
wall is reinforced with continuous fibre that carries the tension — exactly how
terrestrial composite pressure vessels (COPVs) are built (filament wound so the
fibre is loaded along its length).

The original design specified **titanium** fibre. Titanium is **not locally
available at highland Peary** (no ilmenite). This document lays out the realistic
replacement fibres with sourced data, so engineers can choose.

> Honeycomb is **not** relevant here: honeycomb resists bending in flat panels, not
> tension in a pressure shell. Domes need fibre. Honeycomb belongs in flat,
> non-pressure panels (solar backplanes, decks, Pod bloom petals).

---

## How much load, and how much fibre

For a dome (spherical shell): membrane stress σ = P·R / 2t. Net pressure ≈ 100 kPa
(1 bar out; a ~1 m water layer adds only ~1.6 kPa in 1/6 g — negligible, and it
*reduces* tension slightly). The thickness-independent line tension is **N = P·R/2**:

| Dome | Radius | Line tension N = P·R/2 |
|---|---|---|
| Small sleep dome (Ø10 m) | 5 m | ~250 kN/m |
| Large farm dome (Ø40 m) | 20 m | ~1,000 kN/m |

Fibre needed (alumina, ~2,930 MPa, safety factor 3 → ~980 MPa allowable):
**~0.26 mm** fibre-equivalent for the small dome, **~1.0 mm** for the large dome
(≈2.5 mm of composite at ~40% fibre fraction). **The 1 bar load is structurally the
easy part** — wall thickness is set by radiation shielding and micrometeorite
protection, not by holding the atmosphere in.

---

## The candidate fibres (sourced data)

| Fibre | Tensile strength | Modulus | Density (g/cm³) | Max continuous temp | Local at Peary? |
|---|---|---|---|---|---|
| Titanium wire (Ti-6Al-4V) — *baseline being replaced* | ~0.9–1.1 GPa | ~114 GPa | 4.4 | (melts 1668 °C) | ✗ no ilmenite |
| **Alumina — Nextel 610** | 2.93 GPa | 373 GPa | 3.88 | ~1204 °C | ✓ Al₂O₃ abundant |
| **Alumina — Nextel 720** | 2.1 GPa | 260 GPa | 3.40 | ~1371 °C (85% strength retained at 1200 °C) | ✓ |
| Anorthosite mineral fibre [†] | 2.8–3.1 GPa (some sources to 4.8) | 85–87 GPa | ~2.65 | strength drops >250 °C; −65% by 450–600 °C | ✓ from local anorthosite |
| S-2 glass fibre | 4.83 GPa | 97 GPa | 2.49 | softens ~500–750 °C | ✓ from local silica |

[†] "Mineral fibre" is silicate rock melted and drawn into thread. On Earth it is made from basalt, so the commercial product is called "basalt fibre" — but the SAME fibre can be drawn from **anorthosite**, the rock that is actually at Peary. The values shown are the terrestrial basalt-fibre figures used as the closest available reference; lunar anorthosite fibre is uncharacterised and must be tested. **Nothing in this project requires basalt to be sourced.**

*Sources: 3M Nextel ceramic-fibre datasheet (https://www.3m.com/3M/en_US/p/d/b40069891/); peer-reviewed mineral-fibre (terrestrial "basalt fibre") and S-glass
data; titanium is the standard Ti-6Al-4V reference value. All are terrestrial
datasheet/lab values — lunar-made fibre is uncharacterised.*

---

## The constraint that decides most of it

The current build method lays fibre **into molten glass** (~1,550 °C for
anorthosite). The fibre must survive that:

- **Only alumina (Al₂O₃) survives the melt** (melts ~2,072 °C; usable to
  ~1,200–1,370 °C). It is also **2–3× stronger than the titanium wire it replaces,
  and lighter** — an upgrade, not a compromise. Sourced locally from abundant Al₂O₃.
- **Anorthosite mineral fibre and glass fibre cannot be laid into the melt** — they soften/lose
  strength far below glass working temperature. (Mineral fibre of this type is itself *drawn* at
  1,450–1,500 °C, so it cannot survive being re-melted.)

So there are two paths, and this is the real engineering decision:

- **Path A — keep "fibre in the melt":** use **alumina fibre**. Clean, local,
  stronger than titanium.
- **Path B — switch to lower-temperature lamination** (fibre bonded between cooler
  glass layers below their softening point): this opens up **anorthosite
  mineral fibre or S-glass** (cheaper, even higher tensile strength), but you lose
  the single-material in-melt bond.

---

## Mass note (why importing titanium is not an advantage)

Reinforcement mass per m² ≈ P·R·ρ / σ_allow. For one large dome (Ø40 m, ~2,513 m²):
imported **titanium ≈ 45 t**, **alumina ≈ 20 t**, **anorthosite mineral fibre ≈ 14 t**. Titanium is
~2–3× heavier *per unit of reinforcement* (lower specific strength) **and** must be
launched from Earth, while alumina and mineral fibre are made from local regolith (zero launch
mass). Titanium's one genuine edge is toughness (it bends before breaking; ceramic
fibre is brittle) — but oxide-fibre composites are designed to fail gracefully via
fibre pull-out, and that edge does not outweigh 45 t of launch mass per dome.

---

## Open questions (for engineers)

1. Path A or Path B — in-melt alumina, or lower-temperature lamination?
2. What are the *lunar-made* fibre properties (alumina or mineral fibre)? Requires
   testing; terrestrial datasheet values are a starting point only.
3. Brittleness / damage tolerance of a ceramic-fibre pressure shell — fail-safe
   design and leak-before-break behaviour.
4. Minimum fibre radius of curvature during printing without fracture.

*This document presents options and data. The engineers decide.*
