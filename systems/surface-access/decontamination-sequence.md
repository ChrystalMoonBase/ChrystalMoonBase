# Decontamination Sequence
## Chrystal Moon Base — Surface Access Protocol

**Status:** Concept proposal  
**Licence:** CC0

---

## Why This Matters

Lunar dust is not like dust on Earth. It is sharp, electrostatically charged, and chemically reactive. It adheres to everything. It damages lungs, seals, optics, and electronics. It does not wash off easily.

The Apollo astronauts brought lunar dust into their capsules on their suits after EVAs. Within hours, the dust had abraded suit seals, clogged air filters, irritated their eyes and throats, and produced a persistent smell they described as spent gunpowder. They were on the Moon for days. Permanent residents will live there for months or years.

Preventing lunar dust from entering the dome network is not a comfort measure — it is a survival requirement. The decontamination sequence is the barrier between the lunar environment and the cleanest human habitat ever built.

---

## Design Principle

**Nothing and nobody enters the base network without passing through every stage of decontamination. No exceptions.**

This applies to:
- People arriving from Earth on any mission
- Robots returning from surface operations
- Cargo arriving on any delivery mission
- Samples brought in from surface collection

The sequence is designed so that each stage removes a specific type or scale of contamination, and each stage is verified before the next begins. Verification failures send the person or item back to the beginning of the relevant stage, not forward to the next.

---

## People — Full Arrival Sequence

### Stage 0 — Landing and Surface Transit (Pre-Decontamination)
The arrival pad is a dedicated landing facility separated from the base. From the pad, an underground tunnel leads to the decontamination facility entrance. This tunnel is the first controlled environment — enclosed, ventilated, maintained at negative pressure relative to the base so any air movement is always away from the base.

Personnel transit from their landed vehicle to the decontamination entrance. This transit should be as short as possible to minimise dust accumulation on suits.

---

### Stage 1 — Gross Dust Removal
The first chamber is the roughest stage — designed to remove the bulk of loose surface dust before anything else.

**Process:**
- Person enters wearing full surface suit
- Mechanical brushing system — rotating brushes and air jets systematically clean the exterior of the suit from helmet to boots
- Vacuum extraction removes dislodged particles
- Duration: estimated 5–10 minutes

**Verification:** Visual inspection by camera system and particle counter. Stage repeats if particle count above threshold.

**Privacy:** Stage 1 is individual. One person at a time. No other personnel in the chamber. This applies to all stages.

---

### Stage 2 — Electrostatic Neutralisation
Lunar dust is electrostatically charged and clings to surfaces even after mechanical removal. Stage 2 addresses the charge.

**Process:**
- Ionised air jets neutralise the electrostatic charge on the suit exterior
- A second vacuum extraction removes particles that have released from the suit surface following charge neutralisation
- Duration: estimated 3–5 minutes

**Verification:** Electrostatic field sensor confirms charge neutralisation. Particle counter confirms reduction.

---

### Stage 3 — Air Shower
Full-body high-velocity clean air shower removes particles that survived Stages 1 and 2.

**Process:**
- High-velocity filtered air jets from all directions, including from below
- Duration: estimated 2–3 minutes

**Verification:** Particle counter at chamber exit confirms threshold met.

---

### Stage 4 — Suit Removal
The person removes their surface suit in a controlled environment for the first time.

**Process:**
- The chamber is maintained at positive pressure relative to Stage 3, so air flows from the clean side toward the dirty side — preventing any remaining suit contamination from entering the base
- Suit is sealed and returned to the suit maintenance system via a dedicated channel — not through the main network
- Undersuit inspection for dust penetration
- Duration: variable

**The suit never enters the main dome network.** Suits are stored, maintained, and returned to service through a dedicated parallel system that connects to the surface without passing through the inhabited areas.

---

### Stage 5 — Final Verification and Medical
The final stage before entering the base network.

**Process:**
- Air shower in clean undersuit
- Full-body particle scan
- Basic medical check — blood pressure, temperature, oxygen saturation — standard for any arrival from the surface environment
- If required: additional decontamination cycles
- Duration: 10–15 minutes

**On completion:** The person is admitted to the base network. From this point, they are in a controlled environment maintained to higher cleanliness standards than any facility on Earth.

---

## Robots — Return Sequence

Robots returning from surface operations follow a separate but analogous sequence. They do not use the human decontamination chambers.

**Robot decontamination:**
1. Robot enters robot-dedicated cleaning chamber
2. Mechanical brushing and air jets clean all external surfaces including leg joints and head attachment points
3. Electrostatic neutralisation
4. Secondary air cleaning
5. Verification: particle count on all surfaces
6. Robot admitted to underground network or returned to pod charging/storage

Robot decontamination is automated. The robot's Watcher-head sensors assist by identifying areas with high particle counts for targeted cleaning. If a robot fails decontamination verification after multiple cycles, it is held in the cleaning chamber and a maintenance robot is dispatched to assist.

---

## Cargo — Arrival Sequence

Cargo containers arriving on delivery missions are handled by robots throughout. No human needs to enter the dusty surface environment to receive cargo.

**Process:**
1. Container lands on arrival pad
2. Robots meet the container and perform gross dust removal on exterior surfaces
3. Container is moved underground via the arrival tunnel
4. In the cargo decontamination area, the container exterior is cleaned to base standard
5. Container is opened in the cargo handling area — interior surfaces are presumed clean (sealed during transit)
6. Contents are distributed through the base network

---

## Maintaining Base Cleanliness

Once the decontamination sequence is established and the base is operational, internal cleanliness standards are maintained by:

- **Continuous AI monitoring** — particle counters in all domes and tunnels tracking cleanliness in real time
- **Robot cleaning patrols** — dedicated cleaning robots make scheduled passes through all accessible areas
- **Airlock discipline** — any internal airlock between sections is treated as a contamination control point
- **Waste containment** — all waste, including dust accumulated in cleaning processes, is contained, logged, and routed to reprocessing

**Target:** The dome interiors are maintained at cleanroom-equivalent standards. The specific cleanliness class (ISO 14644 standard) that is achievable and practical in a lunar habitat is an open engineering question.

---

## Open Questions

1. **Electrostatic neutralisation efficacy** — current terrestrial ionisation systems are designed for Earth atmospheric conditions. What modifications are needed for a lunar-adjacent environment?
2. **Suit return system** — the concept of a parallel suit maintenance system separate from the main network requires detailed design. How are suits returned to the surface access point from wherever they are stored?
3. **Cargo container standards** — what exterior cleanliness standard should be required for containers before they land? Can this be specified in delivery contracts?
4. **Minimum cleanroom class** — what ISO cleanliness class is required for safe long-duration habitation, and is it achievable in the described system?
5. **Throughput** — the individual-sequential process described here is thorough but slow. For large crew transfers, how long does the full sequence take per person, and what is the maximum throughput of the facility?

---

## Sources & verification

The lunar-dust hazard claims that motivate this entire protocol are strongly supported by ESA, NASA, and peer-reviewed research. (The decontamination *stages* themselves are this project's concept design.)

- **Sharp, abrasive, "like glass" — never weathered.** Lunar regolith is pulverised by billions of years of micrometeorite impacts with no wind or water to smooth it, leaving jagged grains "fine like powder, but sharp like glass" that slice lung tissue. ESA, *The toxic side of the Moon* — https://www.esa.int/Science_Exploration/Human_and_Robotic_Exploration/The_toxic_side_of_the_Moon
- **Damages seals and equipment.** The dust "ate away layers of spacesuit boots and destroyed the vacuum seals of Apollo sample containers" — directly confirming the seal/optics/filter damage cited here. ESA (above).
- **"Lunar hay fever" + gunpowder smell.** All 12 moonwalkers reacted; Apollo 17's Harrison Schmitt is the best-documented case (sneezing, congestion, sore throat, watering eyes). Inside the cabin the dust smelled like spent gunpowder. ESA (above); SpaceDaily, *spent gunpowder* report (2026) — https://spacedaily.com/t-the-apollo-astronauts-who-carried-lunar-dust...
- **Chemically reactive surfaces.** In vacuum the grains carry "unsatisfied" broken chemical bonds, making them highly reactive with lung surfactant and cells. NASA Human Research Roadmap, *Risk of Adverse Health Effects from Lunar Dust Exposure* — https://humanresearchroadmap.nasa.gov/evidence/reports/lunar%20dust.pdf
- **Deep-lung penetration + toxicity.** Particles ~50× smaller than a human hair can remain in the lungs for months; lab tests show replica dust can kill up to ~90% of exposed lung/brain cells, and space-weathering increases toxicity. ESA (above); Live Science summary of the 2018 study — https://www.livescience.com/62590-moon-dust-bad-lungs-brain.html ; ocular toxicity (Apollo 14 sample) — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3484112/
- **Now a standing engineering requirement.** For Artemis and commercial surface missions, dust handling (cabin filtration, suit design, airlock procedures, medical monitoring) is a standing design line-item — exactly the rationale for a mandatory, multi-stage decontamination barrier.

> Note: the specific stage durations, particle-count thresholds, and verification methods in this document are **concept estimates**, not validated procedures. The hazard they address, however, is well established.
