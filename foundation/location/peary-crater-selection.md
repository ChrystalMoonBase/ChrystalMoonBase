# Peary Crater — Site Selection Rationale
## Chrystal Moon Base — Location Analysis

**Status:** Concept document based on published mission data  
**Licence:** CC0

---

## Summary

The northern rim of Peary Crater (88.63°N, ~33°E) is the proposed landing site for Phase 0.2. This document explains why, what the published data shows, and what uncertainties remain.

This is not a definitive site selection. It is a reasoned starting point based on publicly available data. Actual site selection for any flight mission would require significantly more detailed analysis using data not yet available.

---

## Selection Criteria

A viable site for the Chrystal Moon Base Pod must satisfy five conditions simultaneously:

1. **High solar illumination** — sufficient continuous power for laser sintering operations
2. **Accessible cold trap ice** — water resource nearby for future phases
3. **Thermal stability** — temperature swings small enough for electronics and structures
4. **Earth visibility** — continuous line-of-sight for communications
5. **Flat terrain** — safe landing zone and stable construction surface

Peary Crater rim satisfies all five better than any other currently identified location at the lunar north pole.

---

## Solar Illumination

Published illumination data from SELENE (Kaguya) and LRO confirm that specific peaks on the Peary rim receive sunlight for approximately 89% of the lunar year — among the highest values measured anywhere on the Moon.

The physical reason is the polar geometry: at 88.63°N, the sun moves around the horizon rather than rising and setting. A vertical solar panel tracking the sun in azimuth receives near-full solar flux continuously. This is fundamentally different from equatorial sites where day and night alternate on a 29.5-day cycle.

**Key references:**
- Bussey et al. (2005) "Permanent shadow in simple craters near the lunar poles." *Geophysical Research Letters* 32, L23201 — Clementine illumination mapping. https://doi.org/10.1029/2005GL023926
- Noda et al. (2008) "Illumination conditions at the lunar polar regions by KAGUYA (SELENE) laser altimeter." *Geophysical Research Letters* 35, L24203 — reports 89% for the best northern peaks. https://doi.org/10.1029/2008GL035692
- Mazarico et al. (2011) "Illumination conditions of the lunar polar regions using LOLA topography." *Icarus* 211, 1066–1081. https://doi.org/10.1016/j.icarus.2010.10.030

(Full illumination-source summary: `foundation/location/illumination-data.md`.)

**Uncertainty:** Published illumination data has spatial resolution of tens to hundreds of metres. The actual illumination at a specific 10-metre landing zone within the Peary rim has not been measured directly. Fine-scale topographic shadowing from small surface features could affect local illumination. This uncertainty must be resolved by a dedicated orbital survey before any flight mission.

---

## Accessible Ice

Peary crater itself — the interior floor — is among the permanently shadowed regions (PSRs) of the Moon, maintaining temperatures of 30–40 K. Water ice has been confirmed in lunar PSRs by LCROSS (Colaprete et al. 2010, *Science* 330, 463–468, https://doi.org/10.1126/science.1186986) and by M3 on Chandrayaan-1 (Li et al. 2018, *PNAS* 115, 8907–8912, https://doi.org/10.1073/pnas.1802345115 — direct evidence of surface-exposed water ice, including the northern polar region).

The proximity of an illuminated rim to a cold trap floor is a rare and valuable combination. Power is available on the rim; ice is accessible nearby.

**Uncertainty:** The ice content of Peary crater specifically has not been directly measured. Ice abundance, depth, and accessibility at Peary must be inferred from analogous measurements at other polar locations. A dedicated ISRU mission or orbital radar survey would be required to characterise the resource before Phase 1.2 planning can begin.

---

## Thermal Environment

The rim of Peary crater experiences temperature swings of approximately −10°C to +10°C over the illumination cycle — compared to swings of up to 125°C at the lunar equator. This dramatically reduces thermal cycling stress on structures, electronics, and robot components.

The stable thermal environment is a consequence of the same polar geometry that provides continuous illumination: the sun angle changes slowly and never reaches extreme zenith angles.

---

## Earth Visibility

From the near-side rim of Peary crater, Earth is continuously visible. This is a communications advantage that cannot be overstated for an autonomous system that relies on Earth-based monitoring and parameter updates.

The far-side rim of Peary (if any) would not have this advantage. Site selection within the Peary rim must verify Earth visibility for specific candidate landing zones.

---

## Terrain

LRO LOLA (Lunar Orbiter Laser Altimeter) data provides topographic coverage of the Peary rim at approximately 10–20 metre resolution. This data is publicly available and has been used to identify candidate flat zones.

The Peary rim is generally described as highlands terrain — rough compared to mare plains but with identifiable flat zones. The South Pole-Aitken basin terrain at the south pole presents greater topographic challenges; the Peary rim is relatively more accessible.

**Uncertainty:** Landing precision of current TRN systems is approximately 5–10 metres CEP. The identified flat zones must be large enough to guarantee landing within the acceptable area given this uncertainty. This analysis requires detailed terrain modelling with LRO LOLA data at maximum resolution.

---

## What We Do Not Know

- The precise illumination fraction at any specific 10-metre zone on the Peary rim
- The ice content, depth, and form of water in Peary crater PSRs
- The subsurface structure and bearing capacity of the regolith at candidate landing zones
- The dust environment and electrostatic conditions at the specific site
- The micrometeorite flux at this specific location

These unknowns do not make Peary the wrong choice — they make it the most-studied starting assumption. A Phase 0 orbital survey mission dedicated to high-resolution site characterisation would resolve most of them.
