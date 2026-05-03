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

This limitation should be explicitly acknowledged in any Phase 0 results.
