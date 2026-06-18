# Laser Sintering Physics
## Chrystal Moon Base — Sintering Reference

**Status:** Reference document based on published research  
**Licence:** CC0

---

## Basic Physics

When a laser beam is directed at granular regolith, the following sequence occurs:

1. **Absorption:** The laser energy is absorbed by the surface layer of regolith grains. Absorption depends on the laser wavelength and the optical properties of the regolith minerals.

2. **Heating:** The absorbed energy heats the grains. The rate of temperature rise depends on the energy density (W/m²) and the thermal properties of the regolith (specific heat, thermal conductivity).

3. **Grain bonding:** When the surface of individual grains reaches their softening temperature (~1050–1150°C for lunar basalt compositions), they begin to deform and flow at contact points with neighbouring grains. These contact points weld together.

4. **Densification:** As temperature increases further, more grain surface area flows and the porosity of the sintered mass decreases. At full melting temperature (~1200–1400°C for lunar compositions), the material liquefies completely and can flow.

5. **Cooling and solidification:** As the laser moves on or power decreases, the temperature drops. The bonded grains solidify. The final microstructure — and therefore the mechanical properties — depends critically on the cooling rate.

---

## Key Physical Parameters

**Energy density (J/m²):** The total energy delivered per unit area. Too low: insufficient bonding. Too high: full melting and potential cracking, bubble formation, or flow away from the sintering zone.

**Power density (W/m²):** Energy density per unit time. Determines the peak temperature reached. Must be calibrated for the specific regolith composition and desired sintering depth.

**Sintering depth:** The laser heats primarily the surface. Thermal conduction carries heat downward into the regolith. The sintering depth is determined by how far the temperature remains above the bonding threshold before the laser moves on. Estimated range for CMB: 5–25 cm, highly uncertain.

**Vacuum advantage:** In vacuum, there is no gas convection. All heat transfer is through conduction into the regolith and radiation from the surface. This means:
- Heat stays concentrated at the surface longer — potentially allowing deeper sintering at the same energy input
- No oxidation of the melt — the chemistry remains as expected from the regolith composition
- Cooling is slower (no convection cooling) — this helps reduce thermal stress IF managed correctly

---

## Regolith Composition Effect

The Peary rim is highland terrain, likely dominated by anorthosite (feldspar-rich) rather than the mare basalt (pyroxene-rich) of equatorial sites. Anorthosite has a different melting temperature, viscosity, and thermal expansion coefficient than mare basalt.

**This matters:** All published sintering experiments have used simulants based primarily on mare basalt composition (JSC-1A, MMS-1) or simplified highland analogues. Sintering behaviour of actual Peary rim highland regolith may differ from these experiments. This is a specific uncertainty that cannot be resolved without either samples from the Peary rim (not currently available) or a detailed compositional model combined with materials science modelling.

### Melt Temperature — Basalt versus Highland Anorthosite (both stated, deliberately)

Most numbers in this project's robot and forming documents are quoted for **mare basalt (~1,200 °C melt)**, because that is what the published experiments and simulants use. The actual Peary feedstock is **highland anorthosite, which melts hotter** — anorthite (the calcium end-member plagioclase that dominates highland regolith) melts at roughly **~1,550 °C**. We state *both* figures on purpose, so the gap is visible rather than hidden.

| Property | Mare basalt (reference) | Highland anorthosite (Peary) |
|---|---|---|
| Softening / sintering onset | ~1,050–1,150 °C | higher (TBD, likely ~1,300 °C+) |
| Full melt | ~1,200 °C | ~1,550 °C (anorthite) |
| Dominant minerals | pyroxene-rich (mafic) | plagioclase/feldspar-rich (felsic) |
| Simulants used in literature | JSC-1A, MMS-1 | few; mostly simplified analogues |

**Consequences we are accounting for (not yet resolved):**

1. **Laser power / energy budget.** Reaching ~1,550 °C instead of ~1,200 °C requires more energy per unit volume. Sintering-time and platform-build estimates derived from basalt numbers are therefore **optimistic** for true Peary feedstock; the real values are likely longer/higher until validated. The energy-budget timelines (`energy-budget-per-m2.md`) should be read as basalt-referenced lower bounds.
2. **Forming-tip material.** The W-Re forming tip with HfC coating was chosen against molten basalt at ~1,200 °C. Against ~1,550 °C anorthosite melt the margin shrinks — tungsten-rhenium (melt >3,000 °C) and HfC (3,958 °C) still have ample headroom on melting point, but adhesion, wear, and thermal fatigue all worsen at the higher working temperature. This needs re-checking, not assuming.
3. **Cooling window / crack prevention.** Anorthosite's thermal-expansion and viscosity differ from basalt, so the cooling-rate management in `crack-prevention.md` (currently basalt-referenced ~7–10 × 10⁻⁶/°C) must be recomputed for the real composition. The Thermal Buddy slow-cool strategy still applies in principle; the exact numbers do not transfer directly.

**Bottom line:** wherever this repo states ~1,200 °C, read it as *basalt-referenced* — a starting point from the available experiments. The Peary target melts hotter (~1,550 °C), which costs more laser energy and tightens forming-tip and cooling margins. Resolving the exact numbers requires real Peary compositional data, which does not yet exist. This limitation must be explicitly acknowledged in any Phase 0 results.


---

## Open Questions — Laser Power Adequacy for Anorthosite

These are stated as open facts, not resolved positions. The reader can weigh them.

1. **Is the current laser power sufficient for anorthosite at a workable scan speed?** The Pod's diode laser delivers ~10–15 kW optical output. This was sized against basalt-referenced (~1,200 °C) sintering. Highland anorthosite melts hotter (~1,550 °C). Two outcomes are possible and only Phase 0 testing can decide between them:
   - **More likely:** the same laser still works, but the scan speed drops and the build takes longer (energy = power × time — you pay in time, not watts). Sintering-time estimates would then be longer than the basalt-referenced figures.
   - **Possible:** the current power cannot reach the required peak temperature at the depth desired within a single pass, in which case a power upgrade, multi-pass sintering, or pre-heating would be needed.

2. **If a power upgrade is required, it affects every robot, not one.** Each CMB8LF-L1 carries the same sintering laser. A change to the minimum laser specification propagates to the whole fleet, the per-robot power draw, the mast power budget, and the charging schedule. This is a fleet-wide coupling, documented here so the dependency is visible.

3. **Pre-heating as an alternative to raw power.** Raising the feedstock temperature before the main sintering pass (e.g. a broad low-power pass, or using residual heat from an adjacent pass) reduces the peak power needed to reach full melt. This is a known technique and may avoid a hardware upgrade entirely. Unvalidated for this application.

4. **Forming temperature follows the same logic.** The W-Re/HfC forming tip and the Thermal Buddy cooling strategy were both specified against ~1,200 °C basalt. At ~1,550 °C the melting-point margins still hold, but wear, adhesion, and cooling-rate numbers must be re-derived from real composition data.

**Resolution path:** Phase 0 Demonstrator 1 (sintering) must test with the best available highland-anorthosite simulant, measure the actual power and time required to reach structural sintering, and report whether the current laser specification is adequate or must be revised. Until then, all laser-power and sintering-time figures in this repository are basalt-referenced starting points.
