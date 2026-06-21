# HORIZON — Hybrid Radiation Shielding (a very early, open question)

**Chrystal Moon Base — speculative / far-future / theoretical only**

> **Status: HORIZON — THEORETICAL ONLY. This is not a design, not a plan, and not a
> claim. It is an early thought-exploration, written to ask questions and to be
> corrected.** Of all the CMB Horizon material, this is the *least* mature: the underlying
> science is still an open research problem even for the agencies studying it, and nothing
> here has been worked out to the level of an engineering proposal. Please read it as
> "wondering out loud," not as a proposal.
>
> This note explores whether a **hybrid** radiation shield — an active superconducting
> magnet paired with a passive layered dome — *might*, one day, in principle, have any
> role at a CMB habitat. The magnet would bend charged particles; the dome would catch the
> neutrons the magnet cannot. It is fully separated from the hard CMB pillars. CMB is an
> independent, open-source project developed by a founder with a vision who is learning as
> he goes, so this is written humbly and tentatively. Wherever the sources are more
> cautious than an earlier, more optimistic version of this idea, the sources win — and
> even the sources describe an unsolved problem.

---

## Why phrase this as a question?

A lot of popular writing about "magnetic shields for moon bases" is far too confident —
talking about deflecting *99%* of cosmic radiation, fields that are *exactly zero*
inside, and systems that are *"not science fiction."* When the real peer-reviewed
studies are read carefully, the picture is more modest, more interesting, and more
honest. So rather than present a finished blueprint, this chapter asks: **given what the
literature actually shows, could a version of this work at Peary — and where would it
break?**

If you are an ESA/NASA/academic reader: corrections are genuinely welcome. The questions
below are real, not rhetorical.

---

## 1. What the literature actually establishes (so the question is grounded)

**Active magnetic shielding is a real, funded research line — not science fiction, but
also not solved.**

- The **EU FP7 SR2S project** (*Space Radiation Superconducting Shield*, 2013–2015,
  with CERN) studied a toroidal superconducting magnet to protect a human habitat from
  galactic cosmic rays (GCR). It used **MgB₂** conductor and **passive cooling** (a
  V-groove sunshield). (CERN; CORDIS 313224; ScienceDirect S221455241600002X.)
- The honest framing from that work: *optimised passive shielding alone cannot bring the
  GCR dose below current limits, therefore active shielding is under study* — i.e. it is
  an **open problem**, not a finished answer. (Science.gov; SR2S.)

**The dose-reduction numbers are modest — this is the key correction.**

- An ESA-linked study: at **4–5 T·m** of bending power, combined passive + active
  shielding gives about a **40% reduction** of the GCR dose relative to empty space —
  bringing it ~30% below the (then) recommended 50 rem/yr limit. (ESA nebula
  C4200023087.)
- SR2S final reporting: a realistic configuration could give **about a factor 2**
  reduction *"with suitable technical developments."* The older literature's suggestion
  of *"nearly an order of magnitude"* came from **simplified** simulations. (CORDIS
  313224.)
- NASA trade-space modelling: above ~**15 T·m** bending power and ~40 g/cm² passive mass,
  extra shielding has *limited* additional impact — and higher field strength matters
  more than thicker field regions. (Science.gov, solenoid trade study.)

> **So the realistic headline is "factor 2–3 dose reduction," not "99%."** That is still
> valuable — it could be the difference between exceeding and meeting a dose limit — but
> it is not an impenetrable wall.

**An honest historical note: this has been hard for a long time.** NASA itself frames the
concept as one that *"has been studied for over 40 years and has remained an intractable
engineering problem"* (NIAC, Radiation Protection & Architecture page). An earlier
NIAC-funded concept (Hoffman, 2004–2006) ultimately *"did not pan out"* — the team
couldn't produce a convincing design despite their calculations. This is not a reason to
dismiss the idea, but it *is* a reason to stay very humble about it.

**A note on scale and mass.** Real designs are small and still heavy. NASA's MAARSS study
modelled 12 double-helix coils of ~2 m diameter at 2 T (~4 T·m total) around a ~10 m
habitat. The most recent concept (CREW HaT, 2022) uses newer ReBCO tape and 8 coils, and
counts it a major achievement to get each coil down to ~3 tonnes — from earlier designs of
up to ~300 tonnes *per coil*. So even the modern, optimised versions are spacecraft-/
small-module-scale, not dome-scale. (phys.org CREW HaT.)

**A crucial subtlety the optimistic version misses entirely: secondary neutrons.**

- SR2S found that **continuous toroidal magnets — the classic textbook design — are
  actually *unsuited*** for active shielding, because the material the particles cross
  generates **too many secondary neutrons**. Their answer was a set of **autonomous,
  self-supporting toroids in a non-axial "pumpkin" configuration** that keeps the
  particle-crossed material minimal. (CORDIS 313224.)
- A magnetic field only deflects **charged** particles. **Neutral secondaries (neutrons)
  ignore the field** — so a magnetic shield *always* needs a passive partner (water,
  polyethylene, regolith) to catch neutrons. (Frontiers fonc.2016.00097.)

---

## 2. The honest open questions for CMB

These are the questions I genuinely don't know the answer to, and would value input on.

**Q1 — Scale.** Every funded study models a magnet ~**10–13 m** across (SR2S: a 10 m
long, 12.8 m diameter toroid for a *spacecraft*). A 505 m base would need a vastly larger
magnetised volume — does the bending power per metre even scale to something buildable,
or does the required current/structure become self-defeating? *I suspect the honest
answer is: you shield a small habitat module, not a 505 m dome.* Is that right?

**Q2 — Material vs. temperature.** Two different superconductors get mixed up in popular
write-ups:
- **MgB₂** (the actual SR2S choice) works up to ~**25 K**, and ideally near **10 K**.
- **YBCO** works up to ~**77 K**.
Peary's permanently shadowed floor is ~**30–80 K** (LRO Diviner). That is cold enough for
**YBCO**, but likely **too warm for MgB₂** without active cooling. So: is the "the Moon
cools it for free" claim only valid for **YBCO**, and only on the *coldest* PSR floors?
And the peaks (where the Sun is — and where the masts must be) are *warm*, not cold — so
the cold magnet and the solar peaks are not in the same place. How is that reconciled?

**Q3 — Field leakage and crew safety.** The textbook claim "the field inside a torus is
exactly zero" holds only for an *ideal, closed, infinitely symmetric* torus. Real,
segmented coils leak. With **1.5–2 T** at the outer windings, what is the *actual*
residual field in the habitat, and is it within safe limits for long-term human
exposure? *This needs a real field map, not an idealisation.*

**Q4 — Neutrons.** If a magnetic shield necessarily produces secondary neutrons in its
own structure, how much passive neutron shielding (water/regolith) does CMB still need —
and does that passive mass undo the mass saving the magnet was supposed to provide?

**Q5 — Energy & charging.** Charging an HTS magnet with a **flux pump** from a modest
supply is real and demonstrated. But the specific figures floating around ("52 kW for
exactly 10 days to 1.5 T for a 505 m ring") are **unverified** — they need a real
inductance/stored-energy calculation for *this* geometry before they mean anything. Can
the 4 × ~100 kW mast budget realistically both run the base *and* maintain the shield?

---

## 2b. The hybrid idea — magnet + layered dome as *partners* (concept sketch)

The most useful thing the magnetic-shield question forces is this realisation: **a magnet
alone can never be the answer, because it does nothing against neutrons.** So if CMB ever
explored active shielding, it would only ever make sense as one half of a *hybrid*: the
magnet bends the charged particles, and a passive layered dome catches what the magnet
cannot. The two are not competitors; they cover each other's blind spots. This section
sketches that hybrid — explicitly as a concept, with honest numbers, not a design.

**The division of labour (this part is physically sound):**
- **Magnet** → deflects charged GCR and SPE particles (protons, heavy ions). Useless
  against neutrals.
- **Passive dome** → catches the **secondary neutrons** (produced when cosmic rays hit
  the lunar surface and the shield material itself), plus the residual charged dose the
  magnet's factor-2–3 reduction leaves behind, plus micrometeorites and thermal control.

### A possible dome layer stack (concept, all from in-situ materials)

Reading outward-to-inward, this is the kind of layering the literature supports — though
**every thickness below is a placeholder pending Monte-Carlo modelling for real Peary
regolith**, not a calculated value:

| Layer | Rough thickness | Job | Honest caveat |
|---|---|---|---|
| Gold/metal vapour coat | microns | reflects UV/IR, thermal stability of water layer | cosmetic to the radiation problem |
| Outer slag-glass armour | ~15 cm | micrometeorite / mechanical | — |
| Self-sealing buffer | ~10 cm | a breach-plugging layer (see caveat) | the "vacuum-curing smart-gel" is **speculative chemistry**, not a known ISRU material — flagged as a wish, not a part |
| Intermediate slag-glass | ~15 cm | absorbs secondary gamma from neutron capture | — |
| **Water / ice layer** | **~30–50 cm** | **the real neutron shield** — H nuclei ≈ neutron mass → efficient moderation | factor is **not** a clean "×10"; see below |
| Structural glass-ceramic core | ~25–30 cm | holds 1 bar pressure; anorthite/regolith glass + fibre | sintered-regolith strength still unvalidated |

### Honest numbers (this is where the earlier draft overclaimed)

- **Water is genuinely the best passive neutron material** available in-situ: because a
  hydrogen nucleus has almost exactly the mass of a neutron, each collision transfers
  maximal energy, thermalising neutrons efficiently. That part is solid physics.
  (MDPI *Applied Sciences* 2021; arXiv 2509.04367.)
- **But "reduces neutron dose by a factor of 10" is too clean.** Real Monte-Carlo studies
  (FLUKA, RayXpert) show the benefit depends strongly on thickness, geometry, and the
  GCR spectrum, and — crucially — that **piling on mass has diminishing and even negative
  returns**: a recent regolith-dome study finds dose *decreasing* only up to ~45 g/cm²,
  and that **between 45 and ~105 g/cm² the secondary particles produced can add more dose
  than the shield removes.** (ScienceDirect S0032063325000832; ScienceDirect
  S2214552422000141.) So a thick passive dome is not a free win — past a point it works
  against you, which is *another* argument for pairing thinner passive layers with the
  magnet rather than going all-passive.
- **Layer order matters:** heavier material (regolith/slag glass) on the *outside*,
  hydrogen-rich material (water) on the *inside* — so heavy nuclei are stopped first and
  the resulting neutrons are then moderated by the water before reaching the cabin. The
  reverse order is worse. (Matthiä & Berger, *Space Weather* 2024.)

### What this hybrid does NOT solve (stated plainly)

- The **high-energy GCR tail** still mostly gets through *both* shields. A 1 GeV proton is
  bendable; a 10 GeV proton has a ~33 m gyroradius in 1.5 T and a multi-metre dome barely
  dents it. Neither half is a wall. This is exactly why the real studies land at
  "factor 2–3," not "safe."
- The **20 GJ-class stored magnetic energy** and **quench-protection** problem (how to
  safely dump that energy if superconductivity is suddenly lost, next to a crewed module)
  remains the single scariest unsolved engineering item. The earlier draft listed this
  honestly; it deserves repeating.
- The **self-sealing "smart-gel"** is, frankly, hand-waving until a real vacuum-curing,
  radiation-tolerant, ISRU-makeable material is identified. Listed as an aspiration.

> **So the hybrid is the *right shape* of an answer — magnet for charged particles, water/
> regolith for neutrons, layer order correct — but the honest dose outcome is still
> "maybe brings a small habitat module toward a tolerable dose, with large uncertainty,"
> not the earlier draft's confident "15–21 mSv, safe for permanent habitation." The
> architecture is sound; the specific numbers were not.**

---

## 3. A few things that *might* be worth keeping an eye on (not conclusions)

None of the following is a result or a promise. They are only reasons this *might* be
worth revisiting some day — each still depends on all the open questions above being
answered favourably, which is far from given:

- **Free cryogenics — possibly, and only for YBCO.** Peary's PSR floors at ~30–80 K (LRO
  Diviner) *might* reduce or remove the need for imported active cooling *if* YBCO is used
  *and if* the magnet can sit on a cold floor. This would be a lunar circumstance that
  spacecraft (warm, in sunlight) do not have — but it remains untested for this use.
- **Persistent mode exists as a lab technique.** A superconducting switch closing a
  zero-resistance loop lets current circulate with no further power draw. Real on Earth;
  unproven at this scale, on the Moon, over years.
- **A passive partner is already in the CMB design.** CMB already plans regolith/
  water-bearing structures, which happen to be the kind of neutron absorbers any magnetic
  shield would need. So *if* a magnetic shield were ever pursued, it would not start from
  zero on the passive side.
- **It would fit gated-growth.** One would never build a large shield first — one would
  test the physics on a bench, then a tiny module, and measure before scaling. Most likely
  outcome of that path: it stops early, and that is a perfectly good result too.

---

## 4. Safety comes first — and is itself unproven

Before any of this could matter, one principle stands above the physics: **everything is
an assumption until measured, and no human stay-time should ever depend on an unproven
shield.** Even *without* a magnetic field, CMB already assumes **restricted human
stay-time** because lunar radiation is real and hard. A magnetic shield would not change
that on day one; at most, *if* it were ever built and *if* measurements repeatedly
confirmed a real, safe dose reduction, it *might* allow that restricted time to be
re-examined — later, carefully, with data.

The order would therefore always be: robots build and charge it (no human at risk) →
sensors measure the *actual* dose reduction **and** the secondary neutrons over time →
only repeated, confirmed safe measurements could justify revisiting human stay-time. The
machines carry the risk; an untested human never does. Until then, this whole note stays
firmly in the "assumption" column.

## 5. Honest balance

**What the sources support (cautiously):**
- Active superconducting magnetic shielding is a real, CERN/ESA/NASA-studied *research
  line* — explicitly an **open problem**, not a solved one.
- A realistic dose reduction, *combined* with passive shielding, looks like roughly
  **factor 2–3** — **not** 99%, and **not** an impenetrable wall.
- A magnetic shield **always** needs a passive neutron partner.
- Free lunar cryogenics *might* help — for YBCO, on cold floors — but this is untested.

**What had to be corrected from the optimistic version:**
- "99% deflection" → **factor 2–3 dose reduction** (sourced).
- "field exactly zero inside" → **small but non-zero**; would need a real field map.
- material confusion → **YBCO (≈77 K) fits Peary; MgB₂ (≈10–25 K) likely does not** w/o
  active cooling.
- "continuous toroid" → SR2S found continuous toroids **unsuited** (secondary neutrons);
  a segmented **"pumpkin"** layout is preferred.
- "52 kW / 10 days / 505 m" → **unverified**; would need a real stored-energy calculation.

**The honest bottom line:** *This is theoretical, early, and unproven. The hybrid is the
**right shape** of an answer — a magnet for charged particles, water/regolith for the
neutrons it cannot touch, with the heavy-outside/hydrogen-inside layer order the
literature supports. But the **numbers** in the original enthusiastic draft (165 mSv
start, factor-10 water, "15–21 mSv, safe for permanent habitation") do not survive
checking: the real surface dose is closer to ~380 mSv/yr, thick passive mass has
diminishing and even negative returns past ~45 g/cm², and the high-energy GCR tail gets
through both halves. The most likely honest outcome is that a hybrid shield, if ever
pursued, brings a **small** habitat module toward a **more tolerable** dose with **large
uncertainty** — not a solved path to permanent habitation. The architecture is sound; the
specific numbers were not. Corrections, better numbers, and "this won't work because…"
are all warmly welcome.*

---

## 6. Sources (with links)

**Active magnetic shielding — the core research line**
- CERN — *A superconducting shield for astronauts* (SR2S, MgB₂, racetrack coil test):
  https://home.cern/news/news/engineering/superconducting-shield-astronauts
- CERN Document Server — *A superconducting shield to protect astronauts*:
  https://cds.cern.ch/record/2038160
- CORDIS (EU) — SR2S final report (factor ~2; continuous toroid found *unsuited* due to
  secondary neutrons; segmented "pumpkin" configuration):
  https://cordis.europa.eu/project/id/313224/reporting
- SR2S Monte Carlo study (Geant4/GRAS) — ScienceDirect:
  https://www.sciencedirect.com/science/article/abs/pii/S221455241600002X
  (PubMed mirror: https://pubmed.ncbi.nlm.nih.gov/26948010/ )

**Dose-reduction numbers (the modest, honest figures)**
- ESA ESTEC final report, Battiston et al. — *Superconductive Magnet for Radiation
  Shielding of Human Spacecraft* (≈40% GCR dose reduction at 4–5 T·m):
  https://nebula.esa.int/sites/default/files/neb_study/1057/C4200023087ExS.pdf
- Frontiers in Oncology (2016) — *Evaluation of Superconducting Magnet Shield
  Configurations for Long Duration Manned Space Missions*:
  https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2016.00097/full
- NCBI/PMC mirror of the same evaluation (YBCO + MgB₂ compared across ESA/NIAC/SR2S):
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4896949/

**NASA work — and an honest note that it stayed hard**
- NASA NIAC — *Radiation Protection and Architecture Utilizing HTS Magnets* (Westover,
  MAARSS): https://www.nasa.gov/general/radiation-protection-and-architecture-utilizing-high-temperature-superconducting-magnets-2/
- MAARSS Phase I final report (PDF, real coil parameters: 12 double-helix coils, 2 m
  dia., 2 T, ~4 T·m): https://www.nasa.gov/wp-content/uploads/2023/12/niac-2011-phi-westover-maarss-tagged.pdf
- Hoffman et al. (2005) NIAC final report — *Use of Superconducting Magnet Technology for
  Astronaut Radiation Protection* (PDF): https://www.niac.usra.edu/files/studies/final_report/988Hoffman.pdf
- *A magnetic bubble could protect astronauts* (CREW HaT, 2022; ReBCO; ~3 t/coil vs.
  earlier ~300 t/coil; confirms active+passive must be combined):
  https://phys.org/news/2022-05-magnetic-astronauts-dangerous-space.html
- Review (MDPI, 2023) — *A Review of Magnetic Shielding Technology for Space Radiation*:
  https://www.mdpi.com/2673-592X/3/1/5

**Lunar environment (the "free cryogenics" basis — for YBCO, on cold floors)**
- NASA LRO/Diviner — permanently shadowed regions, cold traps (~30–80 K):
  https://www.nasa.gov/mission_pages/LRO/news/lro-diviner-psr.html
- Speyerer & Robinson (2013), *Persistently illuminated regions at the lunar poles*,
  Icarus (~89% illumination on Peary's rim) — via the journal/ADS.

**Passive / neutron shielding (the necessary partner — the dome half of the hybrid)**
- NASA NTRS — water shielding (30–50 cm layer reduces neutron dose; hydrogen moderation):
  https://ntrs.nasa.gov/citations/19950017628
- MDPI *Applied Sciences* (2021) — *Utilisation of Moon Regolith for Radiation Protection…*
  (hydrogen-rich materials rank highest; secondary-neutron caveat):
  https://www.mdpi.com/2076-3417/11/9/3853
- ScienceDirect (2025) — *Regolith-based lunar habitat… organ dose* (dose decreases only
  to ~45 g/cm²; 45–105 g/cm² secondaries can add more than they remove):
  https://www.sciencedirect.com/science/article/pii/S0032063325000832
- ScienceDirect (2022) — *Thick shielding against GCR: Monte-Carlo, role of secondary
  neutrons* (FLUKA): https://www.sciencedirect.com/science/article/abs/pii/S2214552422000141
- Matthiä & Berger, *Space Weather* (2024) — layer order (heavy outside, hydrogen inside):
  https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2024SW004095
- arXiv 2509.04367 — hydrogen ≈ neutron mass → efficient moderation (physics basis):
  https://arxiv.org/abs/2509.04367

---

> **A sobering note worth quoting, honestly:** the idea of shielding astronauts with
> magnetic fields *"has been studied for over 40 years and has remained an intractable
> engineering problem"* (NASA NIAC framing). Even the optimistic modern projects say
> active shielding *must* be combined with passive shielding to help at all. That is the
> single most important reason this chapter is written as a question and not a plan.

---

*End of HORIZON chapter. Speculative, and deliberately written as an open question.
Physics and sources as honest as possible; near-term feasibility not claimed.
Corrections welcome.*
