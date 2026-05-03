# Atmosphere Management
## Chrystal Moon Base — Life Support

**Status:** Concept proposal  
**Licence:** CC0

---

## Target Composition

The baseline habitat atmosphere is Earth-equivalent:
- **Nitrogen:** ~79% (or argon as a substitute if nitrogen production proves insufficient)
- **Oxygen:** ~21%
- **CO₂:** < 0.5% (CO₂ build-up is the primary acute atmosphere management challenge)
- **Pressure:** ~101 kPa (Earth sea-level equivalent)

Lower pressure habitats (30–70 kPa, enriched oxygen) reduce structural dome loading but create decompression risk when transitioning to EVA suits and have other physiological effects. The decision between Earth-equivalent and reduced-pressure atmosphere is a significant engineering and medical trade that has not been made for CMB.

---

## Oxygen Supply

Oxygen is produced by the M-Oxygen module (molten oxide electrolysis of regolith) and by water electrolysis in the M-Water module. Both pathways produce oxygen from local materials.

The oxygen production rate must match or exceed the consumption rate of all residents plus losses from leakage and CO₂ removal. Design target: produce 1.5× the consumption rate under normal conditions, providing buffer against production interruptions.

---

## CO₂ Removal

CO₂ is the atmosphere management challenge that kills people fastest if it fails. The ISS uses a combination of:
- **LiOH canisters** (one-time use, requires resupply) — emergency backup
- **CDRA (CO₂ Removal Assembly)** — zeolite-based adsorption, regenerable without consumables

For a permanent base, CDRA-equivalent technology is required — regenerable without consumables. The CO₂ removed can be recycled: fed to the farm domes for plant growth (plants consume CO₂ and produce O₂, closing the loop).

---

## Pressurisation and Leakage

Every dome has some leakage rate. The total base leakage determines the make-up gas supply needed. Design target: keep per-dome leakage below 0.1% per day of total dome volume. At this rate, the atmospheric mass lost over a year is manageable by local production.

The underground network is also pressurised — at a lower pressure than the domes, reducing the pressure differential across the floor hatches.

---

## Emergency Protocol

Dome pressure drop is the most time-critical emergency. The AI detects pressure drops within seconds. Automated response:
1. Alert all residents of affected dome
2. Floor hatches open to allow emergency evacuation
3. AI identifies breach location from pressure gradient data
4. Adjacent dome sections maintain pressure
5. Human decision: evacuate or attempt repair

The design goal is that no single dome pressure failure can cascade into a base-wide atmosphere emergency. The underground network and adjacent domes maintain independent pressure.
