# Changelog
## Chrystal Moon Base — Project History

This file documents the evolution of the Chrystal Moon Base concept over time. Every significant change, correction, or addition is recorded here. This log is public because the project is public — including the mistakes, the revisions, and the things we got wrong the first time.

A project that shows its work is more credible than one that only shows its conclusions.

---

## May 2026

### Week 1 — Foundation

**Repository created.**
Initial README and LICENSE published. GPL-3.0 selected as the starting licence — later corrected to CERN-OHL-S-2.0 for hardware (see below).

**Website launched** at chrystalmoonbase. com. Single HTML file, 26 language translations, full concept description including all phases, Codex, and support section.

**ESA OSIP submission** — concept submitted to the European Space Agency Open Space Innovation Platform for review.

---

### Week 2 — Repository Structure and Documentation

**102 documents written** across 17 folders covering:
- Site selection (Peary Crater rim, 88.6°N)
- Phase 0 Earth demonstrators (5 tests)
- Phase 0.2 Pod concept (mast, robots, sintering)
- CMB-R1 robot system
- 13 processing modules
- Dome architecture (5-layer system)
- Underground network and maglev
- Life support systems
- AI and monitoring
- Governance framework
- Phases 1–4 and civilisation blueprint

**Three one-pagers written:**
- Vision one-pager — for general audience
- Technical one-pager — for engineers and scientists
- Pitch one-pager — for institutional partners

**Licence structure corrected:**
- Removed GPL-3.0 (software licence — wrong for a hardware project)
- Hardware designs: CERN-OHL-S-2.0
- Software: Proprietary (flight AI, swarm control, sintering algorithms)
- Documents: CC0 (public domain)
- LEGAL-STRUCTURE. md published with full transparency on Stichting Chrystal Base (not yet incorporated)

**Organisation name clarified:**
- "Stichting Chrystal Moon Base" → "Stichting Chrystal Base"
- Reason: the Stichting is the parent organisation for all future projects — Moon, Mars, and beyond. "Moon Base" is too narrow for the founding entity.

---

### Week 2 — Technical Corrections and Tone

**Power budget correction:**
- Original text stated the mast would generate "megawatts"
- Corrected to ~32 kW — the accurate figure for 100 m² GaAs curtain at Peary
- Megawatt-scale is a Phase 1+ ambition, not a Phase 0.2 reality

**Language audit — certainty → humility:**
- Systematic review of all documents and website
- Replaced "will be", "is", "proves" with "proposes", "might", "if it works"
- Every number flagged as an estimate requiring validation
- "Blueprint" → "concept proposal" throughout
- Added explicit "not yet incorporated", "no hardware exists", "all figures are estimates" statements

**Robot architecture correction — hexapod → octopod:**
- Original CMB-R1 described as hexapod (6 legs)
- Corrected to octopod (8 legs)
- Reason: 2 legs function as arms during manipulation tasks. With 6 legs, losing 2 to arm mode leaves only 4 for locomotion — marginal stability. With 8 legs, 6 remain for locomotion — robust stability.
- All affected documents updated

**Nuclear reference removed:**
- Early documents referenced a Kilopower/KRUSTY nuclear backup unit
- Removed from all display text — inconsistent with the solar-only, no-nuclear principle
- The project explicitly avoids nuclear hardware due to regulatory complexity and the open international nature of the project

---

### Week 2 — Robot System Detail (from founder interviews)

Major expansion of CMB-R1 documentation based on detailed concept interviews with the founder. Key additions:

**Universal coupling points:**
- 9 identical interfaces on every chassis (8 legs + 1 head)
- Any leg can attach to any point
- Any robot can take any role — no fixed assignments
- AI reconfigures the fleet dynamically based on current needs

**32 heads total:**
- 8 of each type (sintering, thermal buddy, bulldozer, watcher) brought to the Moon
- Any robot can use any head
- Pod storage chambers serve as permanent strategic depot

**Distributed solid-state power:**
- 25 solid-state battery units per robot
- 3 per leg (foot, lower, upper) × 8 legs = 24, plus 1 in chassis
- Weight distributed evenly, redundancy built in
- Solid-state only — no liquid electrolyte, vacuum-safe, temperature-stable

**All-laser communication:**
- No radio between robots or between robots and mast
- Laser only — zero atmospheric loss on the Moon, no interference, high bandwidth
- Same receiver cells used for both power and data (different wavelengths)
- Mast communicates to Earth via Ka-band radio

**Road-first construction protocol:**
- Bulldozer robots sinter a hard basalt path from Pod to construction site before main floor work begins
- All robots then travel on hard sintered surface — never on loose regolith
- Dramatically reduces dust ingress and extends robot operational life
- Bulldozer bears the dust burden so the rest of the fleet does not have to

**Hibernation — everything stops:**
- During shadow periods, all systems enter full hibernation
- Solid-state batteries provide survival heating only — not for work or communication
- Nothing operates that is not required for survival
- Wake sequence runs full self-diagnostic before any movement

---

### Week 2 — Infrastructure and Community

**Emergency shelter system added:**
- Multiple independent sealed shelter units near maglev terminal
- Hermetically sealed once stocked — never opened except in genuine emergency
- Consumables rotated via sealed supply conduits without breaking main seal
- Identical training shelter adjacent to each real shelter for drills
- Minimum 60-day survival capacity, target 90 days
- Full medical, communication, entertainment, sleeping facilities inside
- AI monitors all systems continuously via internal sensors

**Underground network expanded:**
- People walk within the 20-hectare base — no maglev needed for internal movement
- Maglev serves only long-distance routes: base to launch pad, base to arrival pad, future inter-base connections
- All passages lined with luminescent algae pillars — living light, atmosphere processing, psychological wellbeing
- Passages designed as pleasant social spaces, not utility corridors

**505-metre floor basis:**
- Target: 20 hectares = 200,000 m²
- Calculation: r = √(200,000/π) = 252 m → diameter 504–505 m
- One continuous unbroken sintered surface — no seams, no joints, no weak points

**Governance additions:**
- Zero tolerance policy fully documented — serious violations result in permanent removal, no exceptions
- No money on the base — everything covered by lease, no transactions possible
- No religion in shared spaces — established before departure, accepted as condition of travel
- Democratic council — all tenants equal, no veto power for any party including founder
- Organisation name: Stichting Chrystal Base (not yet incorporated)

**Social infrastructure documented:**
- Restaurants and bars as essential social infrastructure, not luxuries
- Mandatory physical exercise — medical requirement, not optional
- AI teachers for children
- Legal status of Moon-born residents: nationality of parents, no new legal category
- No money — everything included in lease, no hierarchy of wealth

**Export and revenue concept added:**
- Ultra-pure materials, specialty crystals, He-3, pharmaceutical products
- Livestream revenue from day 1 of Pod 1 operations
- BV handles commercial operations → profits flow to Stichting
- Stichting reinvests everything in mission expansion

---

## Known Unknowns — As of May 2026

The following uncertainties are explicitly acknowledged. None have been resolved. All require experimental validation:

1. Sintering energy requirement at depth (10–25 cm) for highland anorthosite regolith — most important single uncertainty
2. Power budget closure — estimated ~32 kW generation vs ~37–44 kW estimated draw
3. Autonomous swarm coordination at construction scale — no software exists
4. Self-sealing gel material for dome Layer 2 — no validated formulation
5. TRN landing accuracy at Peary rim candidate zones
6. Long-term laser optic degradation from lunar dust
7. Specific actuator type for robot joints (flexure bearing, piezo, shape memory alloy, or other)
8. Water ice concentration and accessibility at Peary-adjacent cold traps
9. Tunnel span limits for sintered basalt construction
10. Radiation dose achievable inside domes with proposed shielding thickness

---

## What Has Not Changed

The following core principles have not changed since day one and will not change:

- No flags
- No patents
- No false promises
- Open hardware (CERN-OHL-S-2.0)
- Open documents (CC0)
- Full financial transparency
- No lunar territory claims
- Every correction published openly
