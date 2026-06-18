# Build Order — The First Base

**Status:** Concept proposal (the working sequence for the first base)
**Licence:** CC0
**Guiding principle:** *Slow but sure — op naar de volwassenheid.*

---

## The one rule that sets everything

**No human arrives until the base is fully finished.** The first base is built
entirely by autonomous robots. People come only when air, water, radiation
shelter, food, power, and the habitable spaces are all complete and proven. This
removes a whole class of risk (no humans living inside a half-built site) and it
resolves several design tensions on its own (see below).

---

## Where things land

The Pod and all cargo **land directly on the bare lunar surface**, exactly as every
lunar landing to date has done (Apollo, and the recent robotic landers). No prepared
pad, no landing platform, no titanium structure is required to land.

A **dust-free landing platform is a later upgrade**, not a precondition — it is
described separately (`dust-free-landing-platform.md`) and is parked for a later
phase. The first base does not need it.

---

## The sequence (high level)

1. **Land on bare regolith** at the Peary rim (north pole).
2. **Deploy the Pod** — mast, solar curtain, laser power, first robots.
3. **Sinter a floor** — robots fuse local anorthosite regolith into a load-bearing
   surface (this is the first physical structure; not a processing module).
4. **Dig and sinter underground** — corridors, rooms, storage, shelters, the
   utility network. **This is where people will actually live** (radiation makes
   underground the primary habitat — see `systems/life-support/radiation-protection.md`).
5. **Stand up the core processing** — oxygen, water (if local ice is confirmed),
   glass, aluminium (priority order in `systems/processing-modules/overview.md`).
6. **Build the domes — years later**, once the underground base exists. The glass
   domes are day-use spaces for work, farming, and recreation, **not** the primary
   living space (see the transparency-vs-shielding note in
   `systems/domes/dome-layer-architecture.md`).
7. **Verify everything** — only then do the first humans arrive.

---

## Why "underground first, domes later" is the right order

- **Radiation:** permanent living must be under mass (metres of regolith). The
  underground network provides that; transparent domes cannot.
- **It removes the dome material bottleneck from the critical path.** The dome
  reinforcement-fibre question (`dome-reinforcement-options.md`) does not block the
  first base, because domes come years after the corridors and rooms are dug and
  sintered. By the time domes are built, there may be years of test data — or even
  a separate production source — to draw on.
- **Psychology is handled by the "no humans until finished" rule.** Because nobody
  lives here during construction, there is no period of people living underground
  with no daylight; the first residents arrive to a completed base that already has
  its domes.

---

## What must be 100% complete before the first human

- Breathable atmosphere and its control loop
- Water supply and recycling
- Radiation shelter (underground) meeting a chosen dose target
- Food production running
- Power with margin through the dark periods
- Verified life-support redundancy

*(Which of these may keep growing after arrival vs. must be fully proven first is
itself a design decision — listed here as an open question, not yet fixed.)*

---

## Open questions

1. What is the minimum "complete and proven" standard before the first crew?
2. How many build-years does the underground-first sequence realistically take?
3. Which subsystems are allowed to scale up after humans arrive, and which must be
   final beforehand?

*Engineers and mission planners are invited to review and improve this document.*
