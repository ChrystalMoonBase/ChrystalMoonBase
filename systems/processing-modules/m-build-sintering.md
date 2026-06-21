# M-Build — The Build Line (Sintered Regolith Construction)

**Status:** Concept proposal with sourced technical grounding. Schematics are
*conceptual*, not engineering drawings — flagged as such.
**Licence:** CC0
**Role in the chain:** Stage 1 — comes **first**, before MRE and before any
purification. Turns raw regolith directly into structure (floors, walls, halls,
underground rooms, silos). Lowest purity requirement (none), highest urgency.
**Ground truth:** Peary is highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

The build line fuses **raw local regolith** into solid structure using only heat (and
sometimes pressure) — no reagents, no imports. It builds the very halls and silos that
every later factory and store must sit inside. It is therefore the first thing the
robot fleet does on the surface, and it runs continuously (the rolling build front):
whatever is finished is used immediately.

---

## Input → Output

- **Input:** raw anorthosite regolith + concentrated energy (solar or laser).
- **Output:** load-bearing sintered/melted regolith — floors, walls, vault shells,
  road/landing surfaces, silo bodies, and the lining of excavated underground rooms.
- **By-property:** the product is a *material*, not a purified substance. Its measure
  is strength and density, not a purity %.

---

## The science (grounded)

**Sintering** bonds powder particles by thermal diffusion **without fully melting**,
in three stages: (1) inter-particle necks form, (2) necks grow and pores shrink,
(3) grain growth and densification to minimum porosity. **Melting** (laser/solar melt)
goes further — full liquefaction then re-solidification — and is reported to be about
**10× more energy-efficient than sintering for consolidation** of anorthosite-rich
regolith, at the cost of more thermal stress (cracking risk).

**Temperatures (anorthosite-rich, sourced):** sintering begins ~**1180 °C**, full melt
above ~**1360 °C** for an 80 % anorthosite / 20 % basalt south-pole simulant. Other
methods optimise lower: spark plasma sintering ~1000 °C; microwave ~995–1010 °C for
highland simulant; flash sintering 1050–1290 °C.

**Strength — far more than needed.** Reduced lunar gravity means most structures need
only ~**4 MPa** compressive strength. Sintered regolith vastly exceeds this:
- ~**85 MPa** at ~12 % porosity, ~**219 MPa** at ~1.4 % porosity (furnace).
- Microwave: ~37 MPa up to ~**309 MPa**; ~**142 MPa** for highland anorthosite.
- Spark plasma sintering: up to ~**566 MPa**.
- Laser melting (paving): ~17–20 MPa.

So strength is not the constraint — **porosity/airtightness is** (see below).

---

## The highland caveat (honest)

Microwave sintering couples through nanophase iron and high-permittivity minerals
(olivine, ilmenite). Highland anorthosite is **iron-poor**, so it couples *less* well
with microwaves — studies show lower density with higher anorthosite content. The
practical reading for Peary: **laser and concentrated-solar sintering/melting are the
better fit** than microwave, because they deposit heat directly rather than relying on
the regolith's (weak) microwave absorption.

---

## The engineering — energy delivery

- **Concentrated solar:** raw solar flux at the Moon is ~**1,360 W/m²**; Fresnel
  lenses or parabolic mirrors can intensify it up to ~10,000×, giving ~**1–10 MW/m²** —
  well above the ~100–200 kW/m² at which sintering has been demonstrated (900–1200 °C).
  A solar 3D-printed brick has been made from simulant. Limitation: sunlight varies, so
  steady output benefits from buffering or a controlled (e.g. xenon-lamp) source.
- **Laser (CO₂ / fibre):** steady, controllable, and ~10× more efficient for melting.
  Fits the CMB robot's laser palm. Best for precise floor/wall layers.

### Conceptual schematic — robot laser-sintering a floor layer

```
        CMB8LF robot arm
              │
        ┌─────┴─────┐
        │  laser /  │   <- 808 nm sinter / 976 nm anneal (per S1 design)
        │  optics   │      or concentrated-solar spot
        └─────┬─────┘
              ▼  focused beam (~MW/m² spot)
   ░░░░░░░░░█████░░░░░░░░░   <- melt/sinter pool tracks across the bed
   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   <- newly fused layer (load-bearing)
   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   <- previous fused layers
   ·························   <- raw regolith bed below
        (layer-by-layer, like 3D printing in stone)
```
*Conceptual only — spot size, scan speed and layer thickness are open parameters.*

---

## Lunar-specific factors

- **Vacuum helps:** sintering/melting in low vacuum (~10⁻³ mbar) has been demonstrated;
  no oxidation, no trapped air.
- **1/6 gravity:** favourable — low structural loads (hence the ~4 MPa requirement).
- **Dust & thermal cycling:** abrasive dust and the day/night swing stress equipment;
  notably, some sintered samples *gained* strength after thermal cycling (pore closure).
- **No binder needed:** unlike binder-jetting, thermal fusion needs no imported glue.

---

## The airtightness problem (links to later stages)

Sintered regolith is **porous**. It is strong enough to hold up a structure, but not
inherently airtight. So the build line gives the **rough shell**; making rooms hold
pressure needs a **glass/silica coating** from the M-Glass / silica stream. Sequence:
rough build first → seal once the glass plant runs. Rough construction leads; sealing
follows.

---

## Maturity (honest)

Sintering/melting of regolith simulant is relatively mature in the lab (microwave,
laser, SPS, solar all demonstrated; solar brick made). What is unproven is **large-area,
autonomous, layer-by-layer construction on the surface** by robots — that is exactly
what Gate 1→3 of the growth model must demonstrate.

---

## Open questions

1. Laser vs concentrated-solar as the primary method at Peary (energy budget vs control)?
2. Optimal layer thickness, scan speed and overlap for crack-free large slabs?
3. How thick a sealing glass layer is needed, and applied in the same pass or later?
4. Crack control on melt (the 10×-efficiency route) for anorthosite (~1550 °C melt)?

---

## References (verify and extend)

- ScienceDirect 2025 — *Sintering of Lunar regolith: A review* (three-stage model).
- ScienceDirect 2025 — *Laser Melting vs. Laser Sintering, Schrödinger south-pole
  simulant*: sintering ~1180 °C, melt >1360 °C, melt ~10× more efficient.
- ScienceDirect 2025 (Construction & Building Materials) — microwave sintering of
  highland (HUST-2) anorthosite simulant: ~142 MPa; anorthosite couples less well.
- ScienceDirect 2023 — spark plasma sintering HUST-1: up to 566 MPa at ~1000 °C.
- arXiv 2506.06392 — https://arxiv.org/abs/2506.06392 — solar flux 1,360 W/m², 10,000× concentration → 1–10 MW/m².
- ScienceDirect 2025 review — microwave 309 MPa; lunar structures need only ~4 MPa.
- Indyk & Benaroya 2017 — 85 MPa / 219 MPa by porosity.

*Strength values are simulant lab results; lunar anorthosite performance is unproven.
This is a proposal, not a settled design.*
