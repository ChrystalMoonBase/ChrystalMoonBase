# M-Glass — Glass & Mineral Fibre

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3. Domes, the **airtight sealing layer** for sintered-regolith rooms,
optics, solar-cell substrate ("moonglass"), and mineral fibre for reinforcement.
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Melts silica-rich regolith into glass. Glass is one of the most useful local materials:
it seals the porous sintered structure, glazes the domes, and can be drawn into fibre
that reinforces both glass shells and composites.

---

## Input → Output

- **Input:** silica-rich regolith melt (or silica co-product from M-Aluminium/M-Silicon).
- **Output:** bulk glass (domes, sealing, optics), **moonglass** substrate for solar
  cells, and **mineral fibre** (drawn from the same melt) for reinforcement.

---

## The science (grounded)

Cast regolith and lunar glass are repeatedly identified as among the **most promising**
local construction materials. A regolith melt extruded/cast forms glass directly. For
optical/solar use, **FeO darkens the glass**; **magnetic separation** of iron lowers FeO
and pushes light transmission toward **80–90 %**. The same melt can be drawn into
continuous **mineral fibre** — on Earth this is "basalt fibre"; at Peary it would be
drawn from **anorthosite**, not basalt (see `../domes/dome-reinforcement-options.md`).

> Note on the dome fibre: the high-temperature, in-melt reinforcement uses **alumina
> fibre** (survives the ~1550 °C glass melt); mineral/anorthosite fibre and S-glass are
> options only for a lower-temperature lamination route. M-Glass supplies the glass and
> the lower-temperature fibre; alumina fibre comes from the alumina (Al₂O₃) line.

---

## Conceptual schematic — glass & fibre from one melt

```
   silica-rich regolith ──melt(~1550°C, solar/laser)──► molten glass
        │                                   │                    │
   magnetic Fe                              ▼                    ▼
   separation ─► lower FeO            cast / float          fibre drawing
        ▼                              (panes, domes,        (continuous
   clearer "moonglass"                 sealing layer)         mineral fibre)
        ▼
   solar-cell substrate
```
*Conceptual; melt handling and forming methods are open parameters.*

---

## Lunar-specific factors

- **Sealing the build line:** sintered regolith is porous; a glass glaze/coating is the
  route to **airtight** rooms — so M-Glass is what turns rough shells into pressure-able
  spaces. This couples it tightly to the build line.
- **Anorthosite melt is hot (~1550 °C)** and contracts ~1.3 % on cooling — crack control
  is the forming challenge (see crack-prevention docs).

---

## Purity / quality (per function)

- Structural/sealing glass: a *mixture* is fine; consistency matters, not a purity %.
- Optical/solar glass: needs **low FeO** (magnetic separation) for transparency, not
  chemical "purity" in the metal sense.

---

## Maturity (honest)

Glass/fibre from regolith is well grounded in the literature and a long-standing concept;
moonglass for solar substrates is active current research. The unknowns are forming
large crack-free panes from anorthosite melt and integrating sealing into the build flow.

---

## Open questions

1. Glaze-in-the-same-pass vs separate sealing step for airtight rooms?
2. Magnetic FeO separation yield from highland (low-Fe) regolith — is it worth it?
3. Mineral-fibre (anorthosite) vs alumina fibre split between the two reinforcement routes?

---

## References (verify and extend)

- Cdn. J. Civ. Eng. — cast regolith and lunar glass among most promising materials.
- Cell / Device 2025 — moonglass; magnetic FeO separation → 80–90 % transmission.
- See `../domes/dome-reinforcement-options.md` for the alumina-vs-mineral-fibre analysis.

*Figures are terrestrial/lab and modelling values; lunar performance unproven.*
