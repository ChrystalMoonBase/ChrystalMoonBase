# Processing Chain at Peary — Raw to Purified (Qualitative)

**Status:** Proposal and open questions — tentative. A qualitative map of which
factories are useful at *highland Peary*, in what order, and how raw output becomes
purified product. No quantities; those come later.
**Licence:** CC0

---

## The ordering principle: construction first

Most ISRU literature starts with oxygen and metals (valuable for propellant and
export). The first base needs something else first: **a roof over its head.** Floors,
walls, halls, underground rooms and storage silos are the *first* thing built — there
is nowhere to put factories, storage or people until shielded, usable spaces exist.

So the first "factory" is not a separation or purification plant at all. It is the
**build line**, turning raw regolith directly into structure — and it has the lowest
purity requirement of anything (none) and the highest urgency.

Two things follow from the build line being self-directed: it produces the very halls
and silos that every later factory must stand inside, and it runs continuously while
finished areas are already put to use (the rolling build front).

---

## Stage 1 — The build line (raw regolith → structure)

- **Sintered regolith** — floors, walls, corridors, vaulted underground rooms,
  directly from local anorthosite using laser/solar energy. The raw material *is* the
  product; no separation, no purification.
- **Ceramic slag and geopolymer** — binder and castable construction material from
  the calcium-rich regolith (a low-energy alternative to high-temperature sintering).
- **Excavated + sintered cavities** — the underground rooms themselves: dig, sinter
  the walls, seal.

> Honest dependency: sintered regolith is porous. Making rooms truly airtight needs a
> coating or glass layer from the silica stream — so the rough build comes first, and
> the airtight finish follows once the glass/silica plant runs. Rough construction
> leads; sealing follows.

---

## Stage 2 — The keystone: Molten Regolith / Molten Salt Electrolysis (MRE/MSE)

One process is the heart of everything downstream. From regolith + energy it yields
oxygen, metal alloys and ceramic slag at once — and, importantly, MRE is the only
process that efficiently makes both metals and oxygen from just energy and regolith,
and its outputs can be used to build more MRE reactors (the bootstrap).

At a highland site this is, if anything, favourable: molten salt electrolysis extracts
**97–99 % of the oxygen**, with *higher* current efficiency on anorthosite than on
mare feedstock, and anorthosite reduces faster. The raw metal comes out as **mixed
alloys** — broadly an Al/Fe(+Si) alloy, an Fe/Si(±Ti/Al) alloy, and a Ca/Si/Al(±Mg)
alloy.

> Honest limit: the raw alloys are a complex, multiphase mix, and mechanical methods
> (sieving) are *not* suitable to isolate single metals; the reactor materials
> themselves can contaminate the product (Cr, Mn, Ni, Mo). So MRE gives *raw*
> streams — purification is a separate stage.

---

## Stage 3 — Purification factories (raw → purity-tier per substance)

Each raw stream gets its own purification factory. The target is **not one fixed
"≥99 %" for everything** — that is the wrong measure for some products. Purity is set
per substance by function:

| Stream | Purification | Purity target (by function) |
|---|---|---|
| Oxygen | cryogenic distillation / adsorption | 99.5 %+ (breathing, propellant) — easy |
| Water | distillation / filtration | well above 99 % — standard |
| Hydrogen | electrolysis + drying | 99.9 %+ — easy |
| Aluminium | electrorefining (Hoopes-type) | up to 99.99 % — energy-heavy but routine |
| Silicon (solar/electronic) | zone refining / Siemens-type | **6N–9N+ — here 99 % is far too low** |
| Silicon (structural alloy) | — | ~99 % or alloy is fine |
| Iron / ferrosilicon | — | alloy is the *product*; "99 % pure iron" is counter-productive |
| Calcium, magnesium | selective MSE | niche; purity to use |
| Glass, alumina ceramic | melt/forming | performance spec, not a % |
| Buffer gas, cement, slag, sintered regolith | — | a mixture *is* the product; "purity" is the wrong metric — consistency and performance are |

The key reframing: **purity-tier per substance.** High purity where function demands
it (electronic-grade silicon, drinking water, breathing oxygen); alloy/mixture specs
where a mixture is the product (structural metal, cement, slag). And every stream's
purification is designed *separately* from the separation that produced it.

> Honest limit: taking the MRE alloys to single 99 % metals is hard and not yet a
> demonstrated lunar process, precisely because of that reactor contamination. This is
> an open development area, not a solved step.

---

## What Peary does NOT give well (honest)

- **Titanium** — no ilmenite; imported.
- **High-grade iron** — low FeO; by-product only.
- **Helium-3** — a mare/ilmenite resource: ~3 ppb in highlands vs ~6 ppb in maria,
  and helium is preferentially retained in ilmenite (Ti-rich mare). Not worth a plant
  at Peary.
- **Bulk carbon and nitrogen** — dilute; a local source is likely needed for
  agriculture, so expect to supplement from cold-trap ice or import.
- **Chlorine / salt** — scarce.

---

## Input streams that feed the chain

- **Anorthosite regolith (bulk):** O, Al, Si, Ca, Mg, low Fe; glass, ceramic, slag.
- **Polar cold-trap ice (if confirmed):** water, and possibly CO₂/CH₄/NH₃ → C, N, H.
- **Solar-wind volatiles in regolith (dilute):** H, He-4, Ar (buffer gas), trace C/N.
- **Sunlight (~89 %):** the energy that drives all of the above.

---

## Open questions

1. Can the MRE alloys be refined to single high-purity metals on the Moon, despite
   reactor contamination — and at what energy cost?
2. What sealing method makes sintered-regolith rooms airtight, and when in the build
   front does it come online?
3. Is local cold-trap ice confirmed at Peary, and does it carry C/N-bearing volatiles?
4. Which factories run first under a single Pod's limited power, and which wait for
   more power?

---

## References (to verify and extend)

- Lomax et al.; ScienceDirect 2025 — molten salt electrolysis of highland/anorthosite
  simulants: 97–99 % oxygen extraction, higher current efficiency for anorthosite.
- arXiv 2408.05823 — review: MRE alloy categories (Al/Fe, Fe/Si, Ca/Si/Al).
- ScienceDirect 2025 (LISAP-MSE) — aluminium, oxygen, water and silica from highland
  anorthite.
- ResearchGate 2023 — MRE produces metals + oxygen + ceramic slag; self-replicating
  reactor potential.
- He-3 distribution studies (USGS 1999; Fa & Jin 2007; arXiv 1410.6865) — ~3 ppb
  highland vs ~6 ppb mare; ilmenite retention.

*All claims here should be checked against primary sources before use. This is a
proposal, not a settled design.*
