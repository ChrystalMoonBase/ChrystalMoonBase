# Repository strengthening pass — 2026-06-21

Summary of all changes made in this session. Nothing here changes the project's
substance — it removes inconsistencies and adds verifiable sources.

## Phase 1 — Naming consistency
- Renamed `systems/robot-cmb-r1/` → `systems/robot-cmb8lf-l1/` (22 files).
- Removed duplicate `robot-cmb-r1-overview.md` (merged best line into overview.md).
- Updated 6 path references across README, roadmap, ai-and-monitoring, pod, sintering.
- Verified: 0 "robot-cmb-r1" / "CMB-R1" left in real files (only status report mentions it, correctly).

## Phase 2 — Number / fact consistency
- Crater diameter harmonised to **79 km** everywhere (sources vary 73–79 km; noted honestly).
- Latitude harmonised to **88.63°N** (was mixed 88.6 / 88.63).
- Founder location: "Sittard / Hegelsom" → **"Hegelsom, Limburg"**.
- Solar area math fixed: text said 2×9×30=540 but claimed 600 m². Corrected arm/film
  dimensions to ~10 m → 2×10×30 = **600 m²**, consistent with the 104/143 kW budget
  (fixed in both mast-solar-curtain.md and power-budget.md).
- Basalt → anorthosite: working-material references in the robot files changed to
  "molten regolith (anorthosite)" while KEEPING honest basalt-referenced temperature
  notes (~1,200 °C basalt-ref / ~1,550 °C anorthosite). Correct terrestrial basalt
  references (Hawaiian experiments, simulant analogues) deliberately left intact.

## Phase 3 — Sources added (files that had none)
- life-support/food-production.md — NASA hydroponics area (20–25 m² O₂, 50 m² food).
- life-support/medical.md — Earth–Moon delay corrected (~1.3 s one-way / ~2.6 s round-trip) + sourced.
- surface-access/decontamination-sequence.md — ESA/NASA lunar-dust toxicity sources.
- life-support/radiation-protection.md — references made clickable + secondary-particle
  nuance added (thin regolith barely helps vs GCR; 5 m needs Monte-Carlo confirmation).
- underground-network/emergency-shelters.md — sourced cross-reference (no duplication).
- domes/dome-printing-method.md — ESA 3D-printing / solar-sintering demonstrators.
- sintering/laser-sintering-physics.md — ESA confirms anorthite ~1,550 °C; simulant facts.

## Phase 3b — Plain-text references made clickable (in progress)
- foundation/location/illumination-data.md — 4 illumination papers as DOIs (Noda 89% confirmed).
- foundation/location/peary-crater-selection.md — illumination + ice (LCROSS, Li 2018 PNAS) DOIs.
- systems/processing-modules/m-mre-electrolysis.md — Schreiner DOI, MIT thesis, Blue Alchemist, NTRS.

## Phase 3b — Plain-text references made clickable (COMPLETED)
- All arXiv numbers across the repo auto-linked to arxiv.org/abs.
- All NASA NTRS numbers auto-linked to ntrs.nasa.gov/citations.
- foundation/location: illumination-data, peary-crater-selection, landing-and-precision-targeting,
  south-pole-alternative — Noda/Bussey/Mazarico/Smith/Speyerer&Robinson/Colaprete/Li 2018 as DOIs.
- processing-modules: m-mre-electrolysis (Schreiner DOI, MIT thesis, Blue Alchemist), m-silicon
  (US Patent, Landis DOI), m-oxygen (cross-ref).
- sintering: overview, demonstrator-1, energy-budget, laser-sintering-physics — Fateri & Meurisse DOIs.
- pod: mast-solar-curtain (Powalla CIGS DOI), laser-system, power-budget.
- domes: dome-printing-method (ESA), dome-reinforcement-options (3M Nextel).
- ~46 of 165 .md files now carry clickable, verified sources.

## Corrections made while sourcing (verification caught real errors)
- Fateri et al. (2019) journal fixed everywhere: was wrongly cited as "Scientific Reports",
  is actually *Journal of Aerospace Engineering* 32(6) — corrected in 4 files.
- "Fafaul et al." (GaAs receiver) could not be verified — likely a hallucinated citation from
  an earlier AI. Replaced with two verified sources (Algora et al. IEEE; NASA NTRS).
- Earth–Moon delay wording fixed (~1.3 s one-way / ~2.6 s round-trip, not "1.3–2.6 one-way").
- Radiation: added the honest secondary-particle nuance (thin regolith barely helps vs GCR).

## Status: COMPLETE — ready to push.

---

# Critical review pass (same day, later)

A second critical read-through to find things that needed better thinking. Findings and fixes:

## Removed unfounded figures
- **Phase 0 cost (€1.5–3M programme + €150–300k Demonstrator 1)** removed from all public
  texts (SUPPORT.md, roadmap/phase-0-earth/overview.md, media/technical-one-pager.md,
  media/pitch-one-pager.md). Replaced with honest "not yet fixed — a credible
  per-demonstrator breakdown still has to be worked out." (The detailed, sourced S1
  prototype BOMs in systems/CMB8LF_v1/ are real and were left fully intact.)

## Replaced false precision with honest framing
- **Build time of the first base:** added a "How long will it take? — an honest non-answer"
  section to roadmap/build-order-first-base.md. No fixed years claimed; the base
  calibrates its own schedule from real performance, starting with the first leaf sinter.
- **Leaf-sintering time (was "48–72 hours"):** rewritten in phase-0.2-the-pod.md as the
  project's first real-world pace measurement; no fixed duration claimed.
- **Robot battery autonomy (was "2–4 hours"):** softened to "a few hours, concept estimate
  pending Phase 0 validation" in chassis.md.

## Added missing justification
- **Why 16 robots:** added a note to systems/pod/overview.md — derived from 8 garages × 2
  robots, bounded by per-launch mass/volume; final fleet size is an engineering decision
  for a later phase. (Previously the number stood with no reasoning.)

## Status: critical pass COMPLETE.

---

# Deep verification pass (Opus 4.8, same day)

A third, deeper read-through specifically hunting for hidden contradictions, physics
errors, and unit problems. The repo proved remarkably consistent; only two real items found:

## Fixed
- **Solar constant inconsistency.** The repo used three different values (1,370 / 1,360 /
  1,357 W/m²) for the same physical constant. Harmonised to **~1,361 W/m² with the honest
  annual range (~1,321–1,413)** across all design files, with the note that on-site
  measurement gives the final figure. Power-budget results updated to ~103–104 / ~141–143 kW
  (rounded 104–143 kW band unchanged). Source citations that quote a specific value were
  left as-is.
- **"Built for all of humanity" → "For all of humanity"** (README, two BOM files,
  peary-deployment) — removed the past-tense suggestion that something is already built.

## Verified consistent (no change needed)
- Mast 35 m, 16 robots, 8 garages, power 104–143 kW, BSM heights 7/14/21/28/35 m, 600 m²
  solar — all consistent across the repo.
- Physical constants correct: lunar gravity 1.62 m/s², lunar night ~14.5 days, escape
  velocity ~2.373 km/s.
- Power outliers (280/200/130/108/103 kW) all legitimate: 280 = explicitly-flagged old
  value, 200 = flux per m², 130 = Horizon laser target, 108/103 = surplus within budget.
- Resident counts (500 city / 10 crew or pod / 40 per maglev ring) all in-context distinct.
- Battery & sintering kWh figures internally consistent and honestly flagged as uncertain.
- Nuclear power honestly addressed and rejected (no contradiction with solar-only design).
- All internal .md cross-references resolve; no broken links.

## Status: deep verification COMPLETE.
