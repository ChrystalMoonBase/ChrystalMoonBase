# Freshwater Aquaculture Dome
## Chrystal Moon Base — Food Production and Ecosystem

**Status:** Concept proposal — significant uncertainties remain
**Author:** Berechja Kerkdijk
**Licence:** CC0

> Every figure in this document is an estimate, drawn from terrestrial aquaculture data and extrapolated to the lunar environment. None has been validated under lunar conditions, because no such conditions have yet been tested. The purpose of publishing this openly is so that people who can do the calculations — aquaculture engineers, geochemists, process engineers, radiation physicists — find it, and either improve it or show why it cannot work. Both outcomes are valuable.

---

## Overview

The freshwater aquaculture domes complement the saltwater domes as a local source of animal protein. Freshwater and saltwater ecosystems are kept completely, biologically isolated from one another — cross-contamination could destroy both. They occupy separate, independent domes with no shared water systems.

The guiding principle throughout is the same one that governs the rest of the base: **every interruption, in any form, must stay local. The rest keeps working.** No single failure — disease, leak, pump loss, power interruption — may be allowed to propagate beyond the unit in which it occurs.

---

## Why Freshwater as Well as Saltwater

Different nutritional profiles. Different species. Different ecosystem dynamics. And, critically, **redundancy**. If a disease outbreak affects one aquaculture system, the other continues operating. For a permanent base dependent on local food production, redundancy in every food system is not optional.

Freshwater species that are well studied in closed aquaculture include:

- **Tilapia** — extremely hardy, fast-growing, tolerant of variable water quality, well studied in recirculating and aquaponics systems. The strongest candidate for a first system.
- **Catfish** — bottom feeders, efficient converters of organic waste to protein.
- **Carp** — efficient, tolerant, high yield.
- **Trout** — higher-quality flesh, but demanding: requires cool, clean, oxygen-rich water and has a low tolerance for fluctuation. In a closed recirculating system that must survive occasional disturbance, trout is the species most likely to fail first. It is listed here only as a possible **later-phase** option once a system has proven stable — not as an equal first choice alongside tilapia.

---

## How Many Domes, and How They Are Arranged

The proposed configuration is **five independent aquaculture/recreation domes**:

- 2 freshwater fish domes
- 2 saltwater fish domes
- 1 recreational lake dome (see `dome-recreational-lake.md`)

Each dome is a single water body inside a single sealed pressure vessel. **One basin equals one dome.** The basin is never decoupled from the dome around it. This is the strongest available form of isolation: separate water, separate air, separate systems, separate energy buffer. A disease, leak, or pressure loss in one dome cannot reach the others, because they share nothing physical.

The recreational lake dome is, and must remain, entirely isolated from the food-producing fish domes. Contamination works in both directions: humans swimming in a body of water introduce skin bacteria and organics that cannot be allowed into a food system, and a fish disease or algal toxin cannot be allowed into water that people swim in.

**The cost of this choice is accepted deliberately:** full isolation means full duplication. Every dome carries its own pumps, heating, filtration, energy buffer, and spares. No system aids a neighbouring dome. This is more hardware, more energy overhead, and more maintenance than a shared design — but it buys containment, and on the Moon containment is worth more than efficiency.

---

## Basin Geometry — An Open Question

The shape and depth of the basin within each dome is **not yet decided**, and is offered here as an open engineering question with its known constraints attached, rather than as a forced choice.

Known constraints:

- **Low gravity makes active circulation mandatory.** At ~1/6 g, water pressure rises far more slowly with depth (a 3 m basin feels, in pressure terms, like well under half a metre on Earth), but natural mixing is correspondingly weak. Water does not self-mix the way it does on Earth — wind is absent, and convection driven by temperature and density is much weaker. A still, deep body of water risks **stratification**: an oxygen-rich top layer and an oxygen-starved, organically fouling bottom layer. Circulation is therefore not an optimisation; it is a survival requirement.
- **Depth variation is desirable** for the natural spawning behaviour of mouthbrooders such as tilapia (see "Reproduction and Rearing" below) — shallow margins sloping to a deeper centre.
- **Dome diameter (order 20–40 m, per `dome-layer-architecture.md`) bounds the maximum water surface area.**

The trade-off between *shallow-and-wide* (better passive gas exchange at the surface, less stratification, but more floor area consumed) and *deep-and-narrow* (space-saving, but wholly dependent on continuous circulation) requires input from an aquaculture engineer with recirculating-system (RAS) experience.

---

## Sizing — A Worked Estimate, With Its Assumptions Exposed

To make the concept tangible, a rough sizing is offered. Every step rests on an assumption that the reader can challenge.

1. **Protein assumption.** Fish is one protein source among several (saltwater domes, algae, farm domes). If fish supplies ~30 g of meat per person per day as a supplement (not a staple), then for 500 people that is ~15 kg meat/day. *This single number scales everything below. Treating fish as a staple (~100 g/day) roughly triples the result.*
2. **Meat to live fish.** At roughly 40% edible fillet for tilapia, 15 kg meat/day implies harvesting ~37.5 kg live fish/day.
3. **Daily harvest to standing biomass.** Because fish grow over ~6 months and are harvested continuously as they mature, the *standing* live biomass in the system is a multiple of the daily harvest — on the order of 6,000–7,000 kg.
4. **Biomass to water volume.** Terrestrial intensive RAS run stocking densities from conservative to very high. Published work spans roughly 2.3 kg/m3 to 10 kg/m3, with energy use rising steeply at the higher end and purification efficiency falling. On Earth, with gravity assisting mixing. In ~1/6 g, with weaker mixing, the prudent assumption is to sit **low** — say 5 kg/m3 (conservative) to 10 kg/m3 (optimistic-intensive).

**Result:** roughly **650 m3 (intensive) to 1,300 m3 (conservative)** of water, with large uncertainty bands, for fish supplying ~30 g/person/day. Spread across multiple domes and at ~1.5 m working depth, this is on the order of 850–1,700 m2 of water surface — fish only, excluding aquaponic plants, walkways, and equipment.

**Honest caveats:** these are terrestrial figures extrapolated to the Moon; there is no measurement of fish stocking density in 1/6 g. Growth losses, mortality, and staggered harvest maturity could raise the real requirement by a further 20–50%. No figure more precise than this range deserves to stand in a serious document.

---

## Reproduction and Rearing

A practical aquaculture system must reproduce its stock, not only grow it. For mouthbrooding species such as Nile tilapia, the documented behaviour is specific — and only partly matches the common intuition that "eggs hatch in the shallows and the young then move to deeper water."

- Males build a nest in shallow water (Nile tilapia: typically ~40 cm depth).
- The female collects the fertilised eggs into her **mouth** and incubates them there; after hatching she shelters the yolk-sac fry in her mouth for a further few days.
- She moves through both deep and shallow water while brooding, and **releases the free-swimming fry in shallow water near the margin.**

So the shallow zone matters — but because it is where nests are built and fry are released, not because eggs ripen there freely. This behaviour is **species-specific**: tilapia divide into mouthbrooders and substrate-spawners, and catfish and carp reproduce differently again. The design implication: a mouthbrooder system needs a **shallow spawning and nursery zone**, separated from the deeper grow-out volume. Commercial practice separates these life stages entirely, rearing fry in shallow tanks (30–50 cm).

**Open lunar question:** whether a tilapia will perform normal nest-building and mouthbrooding in 1/6 g is unknown. Nest-building relies on digging and settling against gravity; mouthbrooding requires controlled retention of eggs. Neither has been tested in low gravity. There is some data on fish in microgravity (medaka aboard the ISS), but the Moon sits between micro- and Earth gravity, and almost nothing is known there.

---

## Aquaponics Integration

The freshwater domes suit **aquaponics** — fish farming combined with plant growing in the same water. Fish waste (ammonia) is converted by nitrifying bacteria to nitrates, which feed plants grown in rafts or channels; the plants clean the water, which returns to the fish. This closes the biological loop and produces both protein and vegetables from the same water in less space than separate systems.

Suitable plants: lettuce, herbs, spinach, watercress, and other leafy greens — among the most valuable foods for dietary variety and psychological wellbeing in an isolated environment.

---

## Algae Pillars

As in the saltwater domes, freshwater algae in illuminated glass pillars:

- **Chlorella** — universal, adaptable to freshwater
- **Scenedesmus** — hardy freshwater species, good nutritional profile
- **Haematococcus** — produces astaxanthin (a strong antioxidant) as well as protein

The pillars also contribute to CO2 removal and O2 production for the dome atmosphere.

---

## Mineral Supply for a Living System

Lunar water, as extracted from polar ice and regolith, is effectively "dead" — it lacks the dissolved minerals, buffers, and trace elements a living freshwater ecosystem needs (calcium and carbonates for pH buffering, magnesium, trace elements), and these are continuously consumed by fish and plants.

Supply is therefore proposed from **two sources**:

1. **From Earth** — the starter biology and the biologically essential minerals the Moon cannot provide. These are the building blocks of *life itself*, not of construction, and are treated as the project's most precious imported mass.
2. **From local processing** — the processing modules (`systems/processing-modules/`) release mineral-bearing by-products during regolith processing.

**Open question:** whether those by-products are available in biologically usable form, solubility, and ratio — and free of toxic constituents such as reactive fine dust or heavy metals — is unknown. It requires geochemical analysis of actual Peary regolith and input from a geochemist. The current 13-module processing plan contains no dedicated module for biological minerals; this gap is deliberate and acknowledged.

---

## Automation of Purification — Where the Limit Lies

How much of the mineral and by-product purification can be automated is an open question, and the honest answer is "partly."

- **Automatable:** processes with predictable chemistry and fixed parameters — sublimation, electrolysis, controlled heating.
- **The hard part — two documented problems:**
  - **Regolith heterogeneity.** Composition and grain size vary with location and depth, which destabilises any process that expects a fixed input. Research explicitly notes that oxygen extraction, sintering, and metal recovery must be stabilised *despite* this heterogeneity.
  - **Physical operation under lunar dust.** Lunar fines are abrasive and electrostatically clinging. ESA's own Space Resources Challenge encountered sieve clogging and dust problems even in controlled conditions.

Current research points not toward maximal autonomy but toward **"conservative adaptability"**: systems that detect when assumptions no longer hold and fall back on cleaning cycles, reduced-duty operation, or safe shutdown before faults propagate. Whether each purification step can run fully autonomously, requires robotic intervention, or needs human presence remains an open question for process engineers with ISRU experience. Where full automation proves infeasible, the affected substance shifts to Earth-supply, or to a later phase when maintenance capacity exists.

---

## Circulation, Power, and Failure Containment

- **Circulation** is provided by **multiple smaller pumps in parallel**, never a single large one, consistent with the base-wide redundancy principle. For the redundancy to be real, the pumps must be genuinely independent — independent power feed *and* independent control. Pumps sharing one power group or one controller reintroduce a single point of failure.
- **Power.** Each living dome must survive a Peary illumination gap. Unlike the construction robots — which hibernate without power to save battery mass — the living systems **cannot** be switched off: circulation and aeration must continue or the stock dies within hours. The living domes are therefore treated as a protected energy category, drawing from the collective, redundantly-routed pod network (see `energy-and-thermal.md`).
- **Failure containment** is the design goal: any interruption stays local and the rest keeps working. This is a *design requirement, not a proven property*. Demonstrating that no hidden shared dependency (a common controller, a shared coolant loop) undermines it requires a systematic failure-mode analysis (FMEA) per subsystem.

---

## A Water-Filled Dome Is a Different Failure Case

A micrometeorite strike or crack in a largely water-filled dome behaves differently from one in a gas-filled habitat dome. At a breach below the waterline, water is forced through the hole into vacuum, where it simultaneously boils and freezes — a process that can enlarge the breach and that the self-sealing gel layer (`dome-layer-architecture.md`, Layer 2), designed for a gas leak, may not be able to close.

The struck dome is hermetically sealed off to protect the others, but its **contents — including the Earth-supplied biology — are likely lost** in this scenario. This is the primary reason for multiple independent aquaculture domes.

**Open question for materials and safety experts:** can the self-sealing layer be adapted for a sub-waterline breach, or is a different protection mechanism needed below the waterline? Note also that the reinforcing fibre and the self-sealing layer are *complementary, not interchangeable*: the fibres act as crack-stoppers and keep the structure intact, but they do not seal the hole — sealing the actual penetration is the self-sealing layer's task. At hypervelocity impact (several km/s), material vaporises at the impact point; no reinforcement thickness prevents local penetration. The design goal is not invulnerability but keeping damage local and structurally contained long enough for the sealing layer to act.

---

## The Closed Loop

Fish -> waste -> bacteria -> nitrates -> plants and algae -> food for fish and humans -> fish

- **Water:** recirculated, minimal loss; evaporation captured by the dome atmosphere system.
- **Inputs:** energy; makeup water; makeup minerals (initially from Earth; locally sourced only insofar as the open question above can be answered).
- **Outputs:** fish protein, plant food, algae food supplement, O2 to the dome atmosphere.

---

## Connection to Farm Domes

The freshwater aquaculture domes connect to the farm domes via the underground network (transfer of nutrient-rich water and organic waste only — never a shared open water body, to preserve isolation). Nutrient-rich water can supplement the hydroponic solution; organic waste from the farm domes can feed back as supplemental fish feed. The two systems enhance each other.

---

## Open Questions

1. Basin geometry in 1/6 g — shallow-wide versus deep-narrow, and the resulting circulation load.
2. Will mouthbrooders perform normal nest-building and brooding in 1/6 g?
3. Can local regolith by-products supply biologically usable minerals, or must these come from Earth indefinitely?
4. Which purification steps can be fully automated, and which require robotic or human intervention?
5. Can the self-sealing layer close a sub-waterline breach, or is a separate mechanism required?
6. What standing biomass, harvest schedule, and stocking density are actually achievable — validated against a ground-based RAS analogue?

---

## References (for verification and contribution)

- Nile tilapia growth in hyper-intensive RAS — *Latin American Journal of Aquatic Research* (stocking density / biomass data).
- Environmental and energy requirements for Nile tilapia in RAS, Kenya — *ScienceDirect* (energy vs. stocking density).
- RAS systems: stocking density, loading and design — CEA Union (species suitability, 90-99% water recirculation).
- Tilapia broodstock and hatchery management — SEAFDEC AEM No. 38; FAO AC182E (spawning depth, mouthbrooding, fry rearing).
- ESA Second Space Resources Challenge — esa.int (sieve clogging, dust mitigation in regolith processing).
- Review of lunar regolith excavation prototypes — ResearchGate (abrasiveness, dust, static).
- Space AI / adaptive autonomy in ISRU — arXiv 2512.22399 ("conservative adaptability").

*Engineers and scientists with relevant expertise are invited to review and improve this document via GitHub Issues.*
