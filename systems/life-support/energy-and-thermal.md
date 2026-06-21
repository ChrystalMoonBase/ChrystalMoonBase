# Energy and Thermal Management
## Chrystal Moon Base — Life Support / Base Infrastructure

**Status:** Concept proposal — significant uncertainties remain
**Author:** Berechja Kerkdijk
**Licence:** CC0

> This document records design reasoning, not settled engineering. Every claim about shielding, heating, or power continuity is offered for review. Where the physics sets a hard limit, that limit is stated plainly; where a solution is hoped for but unproven, it is flagged as an open question. Contributions from radiation physicists, thermal engineers, and power-systems engineers are specifically invited.

---

## Why This Document Exists

Several systems across the base — the habitat domes, the aquaculture domes, the farm domes — share the same two underlying problems: how to stay powered through a lunar darkness period, and how to stay warm without wasting that power. Rather than repeat the reasoning in each file, the shared principles are gathered here.

---

## The Peary Energy Picture

The base is sited on the rim peaks of Peary Crater (~88.63°N). These near-polar "peaks of near-eternal light" avoid the standard ~14.5-day lunar night of lower latitudes: illumination data suggests on the order of **80–90% of the year** at the best-measured peaks (the power budget uses ~89%).

This must be stated honestly: near-eternal is **not** eternal. No single peak has 100% illumination. The remaining darkness is not two weeks but scattered hours-to-days, worst around lunar winter when the sun sits lowest and even a crater-rim ridge can shadow a panel.

The intended mitigation is geographic, and it matches the planned architecture: **multiple pods on multiple peaks** see the low-circling sun from different angles. When one peak is shadowed, another is likely lit. Linked by a shared electrical grid, the group covers each other's dark moments. This turns the multi-pod layout from merely an expansion plan into an energy-continuity strategy.

A residual buffer is still required. Even with multiple pods, a deep-winter moment may briefly leave coverage thin. For ordinary laboratories this is an inconvenience; for the living systems (fish, plants, algae) where a pump may never stop, even a few hours without power is fatal. A limited emergency buffer therefore remains necessary — not as a primary source, but as a life-insurance for the living systems.

*Correction to an earlier informal claim: the base is not expected to run a full month on stored power. The power budget sizes the buffer for the longest expected gap (~7 days) at a reduced survival draw, not a month at full load. "A month without sunlight" is not a supported figure.*

---

## Two Different Energy Worlds

The robots and the base are not the same energy problem.

- **The construction robots** carry deliberately minimal batteries to save mass. They operate only while a pod actively beams power to them; without that feed, they hibernate in place. During a darkness period the robots simply stop — this is acceptable, because construction can wait.
- **The base** (domes and living systems) is permanently connected to all pods and solar arrays collectively, and has a far more robust supply. Crucially, the living domes **cannot** hibernate: their circulation and life support must run continuously. They are therefore a protected energy category, prioritised over all deferrable loads.

This distinction matters: a darkness protocol that hibernates the robots and reduces deferrable base loads is correct, but it must never touch the energy floor reserved for living systems.

---

## On Nuclear Power (and Why It Is Not in This Design)

A fission surface reactor would solve the darkness problem outright — it produces power regardless of sunlight, and its waste heat could warm the domes for free. The major space agencies are pursuing exactly this for lunar bases.

It is **not** part of this design, and the honest reason is not the one often assumed. Nuclear power in space is **not** prohibited — the 1967 Outer Space Treaty bans nuclear *weapons*, not nuclear *power*, and radioisotope and fission systems have a long spaceflight history. The real reason an open-source, individually-led project cannot use one is practical: an individual cannot obtain fissile material, cannot obtain a launch licence for radioactive payload, and has no regulator willing to cooperate.

The consequence is a **double gap**: losing the reactor means losing both its electricity *and* its free waste heat. This is precisely why the passive thermal strategy below is not optional but load-bearing — the regolith and water buffers must do the heat-retention work a reactor would otherwise have done.

---

## Thermal Strategy — Minimise Loss First, Then Heat

The order of priority is: reduce heat loss passively, then supply the remainder with solar electricity.

- **Passive retention.** The sintered regolith of the dome structure provides thermal mass that damps temperature swings. The water layer between the dome glass layers (`dome-layer-architecture.md`, Layer 4) is a second thermal buffer — and, being hydrogen-rich, also contributes to radiation moderation. These buffers help hold the interior near the target ~18–20 °C with less active input. They reduce, but do not eliminate, the heating demand: a dome on the lunar surface loses heat by radiation to the extreme cold and the vacuum, so active heating is still required to make up the loss.
- **Active heating via circulating water, not the structure.** Heat is added to the water that already circulates for biological reasons (against thermal/oxygen stratification) and distributed through the dome. This deliberately keeps heating *separate from the load-bearing structure.*

### Why heating is not run through the structural reinforcing fibre

An earlier idea was to pass current through the reinforcing fibre embedded in the glass (originally specified as titanium), using it as a heating element. This is **rejected** on safety grounds:

1. Many candidate fibres lose tensile strength when heated — heating the reinforcement weakens it exactly where the dome is under outward pressure load.
2. Thermal expansion mismatch between the heated fibre and surrounding glass creates interface stress — a crack-initiation mechanism in a pressure vessel holding vacuum at bay.
3. Coupling a structural function to a heating function makes a heater fault a structural risk. These functions must stay decoupled.

Heating is therefore done with **separate, non-structural elements** (or transparent conductive coatings of the kind used in heated aircraft windows), never the reinforcement. The reinforcing fibre remains purely structural. (Note: the reinforcement material itself is an open question — see dome-layer-architecture.md — but the principle of decoupling heating from structure holds regardless of the fibre chosen.)

---

## Redundancy and Failure Containment — The Core Principle

The governing rule across the whole base: **any interruption, in any form, stays local; the rest keeps working.** Concretely:

- Multiple parallel pumps, heaters, and supply paths rather than single large units.
- Genuine independence: shared power groups or shared controllers reintroduce the single point of failure that parallel hardware was meant to remove.
- The shared inter-pod electrical grid is itself redundantly routed, so a fault in one segment cannot darken every dome at once. (A shared *electrical* grid does not breach the domes' water/air isolation — a cable carries no pathogen — so power may be shared even though water and air never are.)

This is a **design goal, not a proven property.** Real fault-isolation is notoriously hard, because faults find the hidden shared dependency no one anticipated. Demonstrating that the principle holds requires a systematic failure-mode-and-effects analysis (FMEA) per subsystem. That analysis is itself an open work item.

---

## Open Questions

1. What battery/thermal buffer size is actually required to carry the living systems through the worst-case Peary darkness gap?
2. How much heating power does each dome lose by radiation, and what does that imply for the energy floor?
3. Can the inter-pod grid be made genuinely free of single points of failure?
4. What transparent or non-structural heating approach is both efficient and safe at dome scale?
5. Does a full FMEA confirm that no hidden shared dependency undermines the "interruptions stay local" principle?

---

## References (for verification and contribution)

- NASA / DOE Fission Surface Power — nasa.gov, energy.gov (lunar night ~14.5 days; reactor rationale and status).
- Outer Space Treaty 1967 — bans nuclear weapons, not nuclear power.
- SELENE-derived Peary illumination data (~80–90% at best peaks) — referenced in `foundation/location/`.

*See also: `systems/pod/power-budget.md`, `systems/domes/dome-layer-architecture.md`, `systems/life-support/radiation-protection.md`.*
