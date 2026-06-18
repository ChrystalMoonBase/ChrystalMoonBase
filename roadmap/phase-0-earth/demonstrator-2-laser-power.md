# Demonstrator 2 — Laser Power Beaming
## Chrystal Moon Base — Phase 0 Earth Programme

**Status:** Not yet begun  
**Licence:** CC0

---

## Objective

Demonstrate reliable delivery of laser power from a fixed transmitter to a moving receiver robot at the efficiency and range required for Phase 0.2 operations.

---

## Background

Laser power beaming — transmitting energy as a laser beam rather than through cables — is the core energy distribution method of the CMB system. It allows robots to operate anywhere within the mast's line of sight without cables, trenches, or external batteries.

Laser power beaming has been demonstrated on Earth. PowerLight Technologies (formerly LaserMotive) demonstrated 400 W delivery over several hundred metres in 2022. NASA's Space Solar Power Project has tested relevant technologies. The physics is well understood. The CMB application is at the higher end of demonstrated power levels and requires operation on a moving target — which is more challenging than fixed-target demonstrations.

---

## Test Protocol (Proposed)

**Transmitter:** Commercial high-power ytterbium fibre laser, 5–15 kW output. Mounted on a fixed tower at 10–20 metres height (scaled model of mast BSM geometry).

**Receiver:** A scaled CMB8LF-L1 chassis or a dedicated test platform carrying the laser power receiver — photovoltaic cells optimised for the laser wavelength, power conditioning electronics, and a load bank.

**Tracking system:** Fast steering mirror with quadrant photodiode feedback — the same pointing architecture proposed for the flight system BSMs.

**Test series:**

1. **Fixed-target efficiency** — measure end-to-end efficiency (electrical input to electrical output) at 10 m, 50 m, 100 m, 500 m range. Target: ≥ 40% end-to-end efficiency.

2. **Moving-target tracking** — receiver platform moves at robot walking speed (0.1–0.5 m/s) while transmitter tracks it. Measure tracking accuracy and power delivery continuity. Target: < 5% power loss due to pointing error at robot walking speed.

3. **Dust contamination** — apply lunar simulant dust to transmitter and receiver optics at controlled concentrations. Measure power loss as a function of dust loading. Target: characterise required cleaning frequency for the flight system.

4. **Thermal environment** — operate the receiver electronics at −50°C to +100°C to characterise temperature effects on photovoltaic conversion efficiency.

---

## Success Criteria

- End-to-end efficiency ≥ 40% at 100 m range
- Tracking maintains beam on target during robot-speed movement with < 5% power loss
- Dust contamination model established for flight system cleaning schedule design
