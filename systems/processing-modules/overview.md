# Processing Modules — Overview & Index

**Status:** Index to the factory landscape. All modules are concept proposals with
sourced grounding; tentative throughout. **Ground truth: Peary is highland / anorthosite**
(`../../PEARY-MATERIALS-REFERENCE.md`).
**Licence:** CC0

> Visual map: **`processing-chain-diagram.svg`** (renders in GitHub).
> Chain & ordering logic: **`../../roadmap/processing-chain-peary.md`**.
> Growth/gates: **`../../roadmap/growth-model-gated.md`**.

---

## The chain in one line

Energy → **build line** (raw → structure) → **MRE keystone** (raw O₂ + metals + slag) →
**purification** (per substance) → **near-closed recycling** → store → humans last.

Design rule across all modules: *no shortcuts; minimise Earth dependence.* Each module
states what is local and what (if anything) must be imported.

---

## Stage 1 — Build line (comes first)

| Module | Makes | Earth-dependence |
|---|---|---|
| [`m-build-sintering`](m-build-sintering.md) | floors, walls, halls, silos (sintered/melted regolith) | none |
| [`m-cement`](m-cement.md) | geopolymer binder (low-energy, castable) | alkali activator (NaOH) |

## Stage 2 — Keystone

| Module | Makes | Earth-dependence |
|---|---|---|
| [`m-mre-electrolysis`](m-mre-electrolysis.md) | oxygen + mixed metal alloys + ceramic slag | none |

## Stage 3 — Purification & products

| Module | Makes | Earth-dependence |
|---|---|---|
| [`m-oxygen`](m-oxygen.md) | breathing O₂ + LOₓ | none |
| [`m-aluminium`](m-aluminium.md) | aluminium (structural) + O₂/water/silica | low (HCl loop) |
| [`m-aluminium-refining`](m-aluminium-refining.md) | ultra-pure Al (99.99%) | medium (fluoride/Cu) |
| [`m-silicon`](m-silicon.md) | structural & (route to) solar silicon | low |
| [`m-silicon-purification`](m-silicon-purification.md) | solar/electronic Si (<ppb), 4 sub-factories | low (avoid halide boosters) |
| [`m-metal-separation`](m-metal-separation.md) | single metals from MRE alloy | medium (electrolyte) |
| [`m-glass`](m-glass.md) | glass, sealing layer, moonglass, mineral fibre | none |
| [`m-ceramics`](m-ceramics.md) | alumina (Al₂O₃) ceramic + dome fibre | very low |
| [`m-iron`](m-iron.md) | ferrosilicon (co-product) | none |

## Polar stream (contingent on confirmed ice)

| Module | Makes | Earth-dependence |
|---|---|---|
| [`m-water`](m-water.md) | water + C/N/S volatiles | geological (needs ice) |
| [`m-fuel`](m-fuel.md) | H₂/O₂ propellant | via water |
| [`m-nitrogen`](m-nitrogen.md) | buffer gas (N₂/Ar) — **weak link** | medium–high (likely import) |

## Cross-cutting

| Module | Role |
|---|---|
| [`m-waste-and-recycling`](m-waste-and-recycling.md) | the near-closed loop — where every residue goes |
| [`m-print`](m-print.md) | additive manufacturing from local metals/ceramic/glass |
| [`m-mineral-fibre`](m-basalt.md) | mineral fibre (formerly "M-Basalt"; drawn from anorthosite) |

## Not viable at Peary (honest)

| Module | Why |
|---|---|
| [`m-titanium`](m-titanium.md) | no ilmenite — **imported**, not local |
| [`m-helium3`](m-helium3.md) | ⛔ mare/ilmenite resource — **parked**, not at highland Peary |

---

## Reading order (suggested)

1. `m-mre-electrolysis` (the keystone — start here)
2. `m-build-sintering` (what comes first on the surface)
3. The three heavy purification factories: `m-silicon-purification`,
   `m-metal-separation`, `m-aluminium-refining`
4. `m-waste-and-recycling` (how it all closes the loop)
5. The rest by stream as needed.

*All modules: concept proposals, sourced where possible, lunar performance unproven.*
