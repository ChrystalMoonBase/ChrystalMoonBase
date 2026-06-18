# M-MRE — Molten Regolith Electrolysis (The Keystone Factory)

**Status:** Concept proposal with sourced technical grounding. Tentative where the
science is still maturing — flagged as such.
**Licence:** CC0
**Role in the chain:** The keystone. From regolith + energy it produces oxygen,
molten metal alloys, and ceramic slag at once. Everything in Stage 3 (purification)
depends on its raw output. See `../../roadmap/processing-chain-peary.md`.
**Ground truth:** Peary is highland / anorthosite (see `PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Molten Regolith Electrolysis (MRE), also called Molten Oxide Electrolysis, performs
**direct electrolysis on raw molten regolith — no additives, no consumable reagents.**
Granular regolith is fed in and heated until molten; the molten silicate is itself
conductive enough to sustain electrolysis. A voltage across two electrodes drives a
current: **oxygen gas evolves at the anode, and molten metals collect at the cathode.**

This is why it is the keystone: it is the only process that efficiently makes **both
metals and oxygen** from just energy and regolith, and its metal output can be used to
build more reactors — a bootstrap.

---

## Input → Output

- **Input:** raw highland anorthosite regolith + electrical energy (from the solar
  power system). No reagents from Earth.
- **Output (raw):**
  - **Oxygen** — at the anode (life support + propellant oxidiser).
  - **Molten metal alloys** — at the cathode: iron, silicon, aluminium, magnesium
    (and titanium where present — minimal at Peary). These come out as *mixed* alloys,
    not pure metals.
  - **Ceramic slag** — the spent/unreduced oxide residue, directly useful as a
    construction material.

> All three outputs are **raw**. Turning them into usable products (breathing-grade
> O₂, single high-purity metals) is the job of the Stage-3 purification factories.

---

## The science (grounded)

**Half-reactions.** Oxide anions are discharged at the anode to form O₂ gas; metal
cations are reduced to molten metal at the cathode. The reduction happens in a
sequence: **sodium and iron oxides reduce first**, then silicon, then the more
stable oxides (aluminium, calcium, magnesium) at higher applied potential.

**The iron "parasite."** When iron is present in the melt, two anode reactions
compete: the wanted oxidation of oxide to O₂, and the unwanted oxidation of Fe²⁺ to
Fe³⁺, which lowers oxygen current efficiency. Once iron is depleted from the melt,
current efficiencies **near 100 %** have been observed. One reported batch ran at
~94 % average current efficiency, extracting ~35 % of the soil's oxygen; molten-salt
variants reach **96–99 % oxygen extraction** of the feedstock.

**Highland advantage.** Molten-salt electrolysis of highland/anorthosite simulant
showed *higher* current efficiency than mare simulant, and anorthosite reduced
faster. MRE reactor optimisation is also reported to be **robust to regolith type** —
it works across compositions. For a highland site this is favourable.

**Alloy categories (what the cathode actually yields).** Characterisation of the
reduced product gives broadly three alloy families: an **Al/Fe** alloy (often with
Si); an **Fe/Si** alloy (sometimes with Ti and/or Al); and a **Ca/Si/Al** alloy
(sometimes with Mg). They occur as complex, multiphase particles.

---

## The engineering

**Temperature.** Regolith softens around ~1300 °C and is fully molten with low
viscosity by **~1600 °C**, the standard operating temperature. Material limits
currently **prevent operation much above 1600 °C**, which caps how much oxygen one
batch can release.

**Self-heating ("Joule-heated") reactor.** The electrolytic current can itself
generate enough Joule heat to keep the bath molten. The elegant trick: design the
thermal gradient so the reactor walls are protected by a **layer of solid "frozen"
regolith** — the melt is contained in a shell of its own material, side-stepping the
"no container survives this" problem.

**The anode is the hard part.** It must be inert: melting point well above 1600 °C,
resistant to aggressive oxide-melt attack and to oxidation by the very oxygen it
produces, with high electrical conductivity. **Iridium** is the leading candidate
(also platinum, rhodium, iridium-plated graphite). Newer work uses **yttria-stabilised
zirconia (YSZ) hollow anodes** with a Pt current collector, which let O₂ be collected
*without contacting the melt* — addressing bubble and re-oxidation problems — with a
usable life on the order of one to two weeks before replacement.

---

## Lunar-specific factors

- **1/6 gravity changes the bubbles.** Reduced buoyancy makes oxygen bubbles grow
  larger and detach more slowly from the anode, which can inhibit the reaction and
  shorten electrode life. A proposed mitigation is a **sonicator** that vibrates the
  anode to shake bubbles off early. This is low-TRL (not normally needed on Earth).
- **Vacuum + dust** complicate regolith feeding and product withdrawal; continuous
  systems to withdraw molten metal and spent slag have been designed and tested.
- **Energy-led.** MRE is power-hungry; under a single early Pod's limited power it is
  not the first thing to run (the build line is). It comes online once power grows.

---

## Maturity (honest)

MRE is roughly **TRL 4/5**: long-duration lab batches (e.g. 8–12 h) with iridium and
YSZ anodes, continuous withdrawal demonstrated, and reactor multiphysics modelling
done. A lunar-surface technology demonstration of an electrolysis cell has been
targeted (via NASA CLPS) around the late 2020s. **Open weakness:** no containment or
anode material has yet been shown to sustain continuous operation for the *weeks to
months* a real plant needs — electrode life and reactor durability are the gating
problems, not the chemistry.

---

## Product / purity notes

MRE delivers **raw** streams; purity is set later, per substance (see the processing
chain). Crucially, the raw alloys are a complex mix and **mechanical separation
(sieving) does not isolate single metals**, and reactor materials can contaminate the
product (Cr, Mn, Ni, Mo). So the metal output feeds dedicated refining factories
(electrorefining, zone refining), designed separately from MRE itself.

---

## Open questions

1. Electrode/containment life — can any anode survive weeks–months continuously?
2. Bubble detachment in 1/6 g — does the sonicator (or hollow-anode) approach hold up
   at scale?
3. How is the mixed cathode alloy best routed to the downstream metal-refining
   factories?
4. What is the real power draw at Peary, and at which Pod/power level does MRE start?

---

## References (verify and extend)

- Sibille et al. / Kennedy Space Center — MRE scale-up, iridium anodes, 1600 °C,
  iron parasitic effect, ~94 % current efficiency (AIAA 2009).
- Schreiner / Sirk et al., MIT — MRE parametric sizing; highland regolith oxygen
  estimates; robustness to regolith type (Acta Astronautica 2016; MIT thesis 2015).
- Lomax et al. — Metalysis-FFC, SnO₂ anode, 96 % oxygen extraction, mixed alloy
  (proof of concept).
- NASA NTRS 2025 — YSZ hollow-anode MRE, 12 h operation, O₂ via solid electrolyte.
- arXiv 2408.05823 — review: alloy categories (Al/Fe, Fe/Si, Ca/Si/Al).
- ScienceDirect 2025 — molten-salt electrolysis of anorthosite: 97–99 % O₂, higher
  efficiency on highland feedstock.
- Joule-heated / self-heating reactor concepts — NASA NTRS 20120003037.

*Technical values here are from terrestrial lab work and modelling on simulants;
lunar performance is unproven. This is a proposal, not a settled design.*
