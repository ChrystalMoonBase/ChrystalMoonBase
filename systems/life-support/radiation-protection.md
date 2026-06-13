# Radiation Protection
## Chrystal Moon Base — Life Support

**Status:** Concept proposal based on published radiation environment data  
**Licence:** CC0

---

## The Radiation Environment at Peary

The Moon has no global magnetic field and no atmosphere. The surface is exposed to:

**Galactic Cosmic Rays (GCR):** High-energy particles from outside the solar system. Continuous flux, difficult to shield against because high-energy particles produce secondary radiation when they interact with shielding material. The dose rate on the lunar surface is approximately 380 mSv/year — about 200× the average dose for a person on Earth.

**Solar Energetic Particles (SEP):** Bursts of high-energy particles from solar flares and coronal mass ejections. Sporadic but potentially very high dose rate during events — a major SEP event can deliver a dangerous dose in hours.

**For reference:** The annual occupational dose limit for radiation workers in most countries is 20 mSv/year. The dose on the unshielded lunar surface is approximately 19× this limit.

---

## Shielding Strategy

**Primary shielding — the dome structure:**
The five-layer dome provides passive shielding. The critical shielding material is the sintered regolith outer shell — lunar regolith is an effective radiation shield due to its hydrogen content (even small amounts of hydrogen dramatically improve shielding per unit mass). The required thickness to reduce GCR dose to acceptable levels is debated — estimates range from 2 metres to 5 metres of regolith equivalent, depending on the acceptable annual dose target.

The water layer (Layer 4) provides additional shielding — water is the best shielding material per unit mass for the neutron component of cosmic ray secondaries.

**Secondary shielding — underground:**
The underground network provides additional shielding from the regolith overburden. Residents spending significant time underground during major SEP events dramatically reduce their exposure.

**Storm shelter:**
A dedicated radiation shelter at sufficient underground depth is planned for SEP events. During a major solar storm, all residents move to the storm shelter. The shelter must be identified and signed before the first human arrives.

---

## Dose Target

The annual dose limit for CMB residents has not been formally set. It is a medical and ethical decision that requires input from radiation biologists, physicians, and the residents themselves.

For planning purposes, the target is to keep annual dose below the current NASA career dose limits (which are based on age and sex). This is challenging to achieve with passive shielding alone at full lunar surface depth — the underground design partially addresses this.

---

## Phased Shielding Depth — Generation 1 versus Permanent Habitation

Shielding depth is not one number. It depends on *who* lives there and *for how long*. CMB treats this explicitly as a phased requirement rather than a single claim, because the honest physics changes completely between a one-year adult rotation and a multigenerational city.

**Generation 1 — working adults, time-limited, informed consent.**
Approximately **5 metres of regolith** (~750–1000 g/cm² depending on compaction) places occupants well beyond the Pfotzer maximum, where secondary-particle build-up has already passed its peak and is declining. This reduces the GCR dose to a fraction of the surface value — on the order of a few tens of mSv/year depending on solar-cycle phase. For adult crew under occupational-style career limits, with a one-year maximum stay and informed consent, this is a defensible and buildable target. It is the design basis for the first rotating-station phase: no children, no pregnant residents, time-limited exposure.

**Permanent habitation — families, children, generations.**
This is a different problem. Earth's background dose is ~2–3 mSv/year. Five metres brings residents close to but not all the way down to that level, and for people who live their *entire lives* underground — including children and pregnancies — the biological risk is cumulative over decades. For that population the target is not "within astronaut limits" but "comparable to Earth." That means **10 metres or more** of regolith, or the use of **lava tubes**, where tens of metres of natural basalt roof over the void do the shielding work without anyone having to excavate it.

**Why this phasing is a strength, not a weakness.**
Gen-1 at 5 m is verifiable and constructible with the robot fleet now. The deeper/lava-tube route is the natural growth path to the permanent city — it does not contradict the early design, it extends it. Stating the two regimes separately is exactly what a radiation biologist would expect to see; a single "permanently safe for everyone" claim is the red flag. The depth requirement is set by GCR; micrometeorites and SEP events are both fully covered once GCR depth is met, since both are far less penetrating. Going deep for radiation gives micrometeorite and thermal protection for free — one solution to three problems.

| Population | Stay | Target dose | Regolith depth | Notes |
|---|---|---|---|---|
| Gen-1 adults | ≤1 year | NASA career-limit class | ~5 m | Informed consent; no children/pregnancy |
| Permanent residents | Indefinite | ~Earth background (2–3 mSv/yr) | ~10 m+ or lava tube | Generations, children — the long-term goal |

---

## Open Questions

1. What is the achievable annual dose for residents with the designed five-layer dome at the required regolith thickness?
2. What thickness of sintered regolith outer shell (Layer 1) is required to meet the dose target?
3. What is the dose rate in the underground network at 3-metre depth?
4. What SEP event magnitude defines the threshold for storm shelter evacuation?
5. What are the long-term health effects of the residual dose after shielding, and what monitoring and mitigation are required?

---

## Complementary and Emerging Approaches (under review)

The passive mass shielding above does the primary work. The following are reviewed honestly: some are usable complements now, some are open research, and none replaces sufficient mass.

**The transparency-versus-shielding tension.** A core design wish is that residents live *under open, transparent domes* — not only underground — for psychological health. This collides with physics. Shielding against the galactic cosmic-ray background needs thick mass; transparency needs thinness and light transmission. These are opposing requirements. Transparent shielding does exist (lead glass is used for reactor viewing windows), but it works against reactor-type gamma/neutron radiation using heavy metals — and heavy metals are *poor* against high-energy cosmic rays, producing a secondary-particle shower. A patent on transparent shielding states the trap directly: high-energy radiation requires either much heavier mass (reducing transparency) or higher heavy-metal concentration (also reducing transparency). Reviews confirm there is, as yet, no universal transparent shield. The honest conclusion: transparent layers can fully handle solar/UV/thermal load and a partly-transparent water layer moderates some cosmic secondaries, but full cosmic-background protection requires opaque mass. The resolution is layered living: open transparent domes for waking life at an accepted, non-zero dose, and heavily-shielded or underground zones for sleeping.

**Layering — materials, not thickness.** Splitting one thick shield into several thin layers of the *same* material gives no benefit (what matters is total mass per area), and thin layers with gaps between them can be *worse* by letting secondary radiation reach occupied space. What *does* help is **multi-material** layering in the right order: a heavier outer layer (sintered regolith / anorthosite) to slow the primaries, a light hydrogen-rich inner layer to absorb the secondary neutrons created in the first. Research recommends exactly this two-layer combination. The existing dome stack (regolith outer, water middle) already approximates the right ordering.

**Hydrogen-rich inner lining.** Lining the interior of the regolith shell with a hydrogen-rich material gives complementary protection (hydrogen is highly effective against neutrons) *and* separates the interior from the slightly hazardous raw regolith. Simulation work finds lithium hydride and polyethylene among the best performers in combination with regolith. To bring interior radiation near zero with regolith alone takes a ~6 m wall; ~12 m for total elimination — useful target numbers for the heavily-shielded sleeping zone.

**ISRU constraint — the hydrogen source must be local.** A core CMB rule is *no imported plastic* (see the project's ISRU-first principle): hauling tens of tonnes of polyethylene or lithium hydride to the Moon is exactly the launch-mass problem the whole design avoids. Polyethylene and lithium hydride appear above only as *literature reference points* for comparison — they are **not** the chosen materials. The chosen hydrogen-rich layer is **water/ice mined from the Peary permanently shadowed regions (PSRs)**: water is hydrogen-rich, is among the best GCR shields per unit mass, produces few secondaries, and is *already present* at the chosen site. Using PSR ice as the inner shielding layer is not a compromise on the no-plastic rule — it is that rule carried to its logical, and physically superior, conclusion. The shielding water is held in its own dedicated circuit, separate from drinking, dome, and washing water (see `water-cycle.md`), so it is permanently committed mass, not consumable inventory.

**Buildings within domes.** Structures inside a dome add a second mass layer above occupants and lower the average dose for those inside — useful especially against solar events. But two thin layers (dome + building) still do not meet the cosmic-background requirement, and mid-thickness layers can generate secondaries. The constructive reading: shielding that *increases inward* (dome -> building -> shielded sleeping core) concentrates protection where people lie still longest, while the open dome serves waking life.

**Radiotrophic fungi (open research).** Melanised fungi (e.g. *Cladosporium sphaerospermum*) survive and even grow in high radiation, apparently converting some radiation to chemical energy via melanin ("radiosynthesis"). Tested aboard the ISS, a ~1.7 mm fungal lawn reduced radiation by ~2% — small, but a melanin/regolith composite is projected to need only ~9 cm for a meaningful reduction that would otherwise need ~21 cm of pure fungus. Its appeal for CMB is specific: it is ISRU-compatible, self-regenerating, grows from a tiny starter culture, and fits the base's closed-loop biology. It is a **complement, not a replacement** — melanin offers only partial shielding versus mass. Open questions: habitat-scale performance, growth control in 1/6 g, and keeping a living layer safely separated from occupants.

**Boron nitride nanotubes — inorganic, non-plastic (emerging, TRL 3–4).** BNNT is a ceramic-class material (boron + nitrogen, *not* a carbon polymer), so it does not violate the no-imported-plastic rule the way polyethylene would. It is structurally strong *and* a capable shield: boron captures neutrons (directly addressing the secondary-neutron problem), while the light B/N lattice handles charged particles better than high-Z metals. Recent work (2025–2026) has pushed BNNT loading and demonstrated films that outperform aluminium at equal areal mass, especially against thermal neutrons. For CMB its relevance is narrow but real: thin, load-bearing *critical sections* where mass and transparency both matter — window frames, a small emergency shelter shell — rather than bulk shielding, which stays regolith + water. In-situ BNNT production on the Moon is currently science fiction (it needs pure precursors and extreme synthesis conditions); a small imported quantity of high-performance material is, however, philosophically far more defensible than tonnes of bulk plastic. Listed as a watch-item and a candidate for critical-section import, not a base assumption.

**Active (magnetic/plasma) shielding (open research).** Deflecting charged particles with a magnetic or plasma field is the one route that bypasses mass — and is precisely why it remains unproven: the magnetic variants are heavy, power-hungry, and need cooling. Of electromagnetic concepts studied, only a cold-plasma field-expansion approach was recommended for further study. Listed here as a long-term research direction, not something this design relies on.

---

## Updated Open Questions (additional)

6. What multi-material layer ordering (regolith / water / hydrogen-rich liner) minimises *total* dose including secondaries, by Monte-Carlo transport modelling?
7. Which hydrogen-rich inner-lining material (lithium hydride, polyethylene, water) is best for the lunar interior environment?
8. Can radiotrophic-fungus / regolith composites contribute meaningfully at habitat scale, and grow safely in 1/6 g?
9. What annual dose do residents accept for living under open domes, versus time spent in shielded/underground zones — a medical and ethical decision, not purely technical?

---

## References (for verification and contribution)

- Matthia et al., *Space Weather* (2024) — regolith shielding thicknesses for SEP and GCR.
- Multi-material / two-layer shielding against secondary neutrons — *ScienceDirect* (FLUKA study).
- Hydrogen-rich materials with regolith (OLTARIS / MULASSIS studies) — ~6 m regolith near-zero, ~12 m total; lithium hydride best performer.
- Radiotrophic fungi aboard the ISS — bioRxiv (Cladosporium sphaerospermum, ~2% at 1.7 mm; ~9 cm melanin/regolith composite projection).
- CREW HaT magnetic shielding concept — arXiv 2209.13624.
- Transparent radiation shielding limits — USPTO 3,937,970; Frontiers in Materials (2025).
