# Power Budget — Phase 0.2 Pod
## Chrystal Moon Base — Phase 0.2 Systems

**Status:** Revised estimate — significant uncertainties remain  
**Licence:** CC0

> All figures are estimates based on published data and physics calculations. None have been validated experimentally. The power budget is the single most important uncertainty in the Pod concept.

---

## Solar Energy System — Definitive Configuration

| Parameter | Value |
|---|---|
| Mast height (deployed) | ~35 m (5 segments · 6th segment: open engineering question) |
| Mast material | Toray M55J CFRP with cyanate ester resin |
| Mast base | Magnetically levitated rotation bearing (AMB/PMB) |
| Number of arms | 2 (segment 1 — lowest, above garages) |
| Arm length | ~9 m each |
| Film per arm | ~9 m × 30 m roll-out CIGS thin-film |
| **Total solar area** | **~600 m²** |
| Solar cell type | CIGS (Copper Indium Gallium Selenide) — flexible, rollable |
| Solar constant at Moon | ~1,370 W/m² |
| CIGS efficiency (conservative) | 15.7% |
| CIGS efficiency (realistic growth) | 21.5% |
| Peary illumination fraction | ~89% |
| System losses (dust, cable, thermal) | ~10% |
| **Continuous output (conservative)** | **~104 kW** |
| **Continuous output (optimistic)** | **~143 kW** |

**Calculation (conservative):**
600 m² × 1,370 W/m² × 0.157 × 0.89 × 0.90 ≈ **104 kW**

**Calculation (optimistic):**
600 m² × 1,370 W/m² × 0.215 × 0.89 × 0.90 ≈ **143 kW**

---

## Why CIGS, Not GaAs

GaAs (Gallium Arsenide) offers higher efficiency (~30%) but is crystalline and brittle — it cannot be rolled. The roll-out deployment architecture requires a flexible thin-film cell. CIGS on a flexible titanium or polyimide substrate is the appropriate choice:

- Flexible and rollable ✓
- Demonstrated in space applications ✓
- Specific power ~1,900 W/kg ✓
- Efficiency improving (15.7% → 21.5% realistic growth path) ✓

---

## Power Distribution (Conservative Estimate: 104 kW)

| Consumer | Estimated Draw | Notes |
|---|---|---|
| Laser power beaming system | ~20 kW input | 10–20 kW class diode laser |
| Laser optical output | ~10–15 kW | To BSMs and robots |
| Base computer + avionics | ~2 kW | Mission AI, communications |
| Ka-band transmitter | ~1 kW | Varies with data rate |
| BSM actuators × 5 | ~0.5 kW | One per mast segment |
| Mast rotation drive | ~0.2 kW | ~0.5°/hour — very slow |
| Magnetic bearing (AMB) | ~0.5 kW | Active stabilisation |
| Mast thermal management | ~1 kW | Heaters during shadow |
| Robot charging (16 units, staggered) | ~15 kW | Max 4–6 charging simultaneously |
| **Total estimated draw** | **~40 kW** | |
| **Available (conservative)** | **~104 kW** | |
| **Reserve / battery charging** | **~64 kW** | Substantial surplus |

The power balance is **strongly positive** even at conservative CIGS efficiency. The surplus charges the battery reserve for shadow periods.

---

## Shadow Period Management

During the ~11% of the year when the Peary site is in reduced illumination, the solar film produces little or no power. Survival protocol:

**Shadow period protocol (proposed):**
- Laser power beaming shuts down — no construction
- Robots hibernate at current positions (minimal power draw)
- Base computer reduces to keep-alive mode
- Mast heaters and magnetic bearing draw from battery reserve

**Battery reserve sizing:**
- Survival power needed: ~5 kW (heaters + minimal compute + AMB)
- Longest expected shadow: ~7 days = 168 hours
- Energy needed: ~840 kWh
- Available from ~64 kW surplus × 89% illumination: ample charging capacity

**Storage type:** Hybrid — electrochemical (Li-ion primary, upgradeable to locally-sourced Na-ion) + thermal (regolith block heat storage for passive thermal management).

> Note: this protocol applies to the **Phase 0.2 pod** (robots hibernate when power beaming stops). The base-wide energy-continuity strategy for a populated base — where living systems can never be switched off — is described separately in `systems/life-support/energy-and-thermal.md`.

---

## Mass Budget (Electrical System)

| Component | Estimated Mass |
|---|---|
| CIGS solar film (600 m²) | ~110 kg (at ~1,900 W/kg specific power) |
| Mast arms and deployment mechanism | ~100 kg |
| Magnetic bearing (AMB/PMB) | ~100 kg |
| Laser power beaming system | ~50 kg |
| BSMs × 5 | ~50 kg |
| Battery storage | ~200 kg |
| Power electronics, cabling, avionics | ~150 kg |
| **Total electrical system** | **~760 kg** |

---

## Key Uncertainties

1. CIGS efficiency under actual Peary thermal cycling (cells cool significantly in shadow)
2. Dust accumulation rate on vertically hanging film — cleaning frequency unknown
3. Exact illumination geometry at specific landing zone — requires high-resolution orbital survey
4. Magnetic bearing performance over multi-year operation in lunar thermal environment
5. Robot actual power draw under operational lunar conditions
6. Battery degradation rate over years of deep thermal cycling

Ground validation (Phase 0 Demonstrator 2) addresses items 1, 2, and 5 directly.

---

## Previous Configuration (for reference)

Earlier concept iterations used GaAs film (not rollable) and a 55-metre mast, producing estimated ~280 kW. Those figures assumed incorrect material properties (GaAs cannot be rolled) and did not account for the structural height consumed by the pod's base systems. The current configuration is more conservative and more realistic.
