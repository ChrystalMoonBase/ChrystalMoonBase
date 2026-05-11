# Power Budget — Phase 0.2 Pod
## Chrystal Moon Base — Phase 0.2 Systems

**Status:** Updated estimate — significant uncertainties remain  
**Licence:** CC0

---

## Solar Energy System — Definitive Configuration

| Parameter | Value |
|---|---|
| Mast height (deployed) | 55 m |
| Number of arms | 2 (top segment only) |
| Arm length | 10 m each |
| Film per arm | 10 m × 44 m roll-out GaAs thin-film |
| **Total solar area** | **880 m²** |
| Solar constant at Moon | 1,357 W/m² |
| GaAs efficiency | 30% |
| Peary illumination fraction | ~89% |
| System losses (dust, cable, thermal) | ~10% |
| **Continuous electrical output** | **~280 kW** |

**Calculation:** 880 m² × 1,357 W/m² × 0.30 × 0.89 × 0.90 ≈ 287 kW → conservative estimate: **280 kW**

---

## Power Distribution

| Consumer | Estimated Draw | Notes |
|---|---|---|
| Laser system (fibre laser input) | ~150 kW | Primary consumer |
| Laser optical output | ~67.5 kW | 45% wall-plug efficiency |
| Base computer + comms | ~3 kW | Mission AI, comms processing |
| Ka-band transmitter | ~1 kW | Varies with data rate |
| BSM actuators and electronics (5) | ~0.5 kW | One per segment |
| Mast thermal management | ~2 kW | Heaters during shadow periods |
| Robot charging (8 units, staggered) | ~15 kW | Max 4 charging simultaneously |
| **Total estimated draw** | **~171.5 kW** | |
| **Available from solar system** | **~280 kW** | |
| **Reserve / battery charging** | **~108.5 kW** | Large surplus for storage |

---

## The Power Surplus

Unlike the previous 100 m² / 32 kW configuration — which had a power deficit — the 880 m² system produces **~108 kW of surplus power** under normal operations. This surplus is used for:

1. **Battery charging** — building up reserve for shadow periods
2. **Burst sintering capacity** — more laser power when needed
3. **Future expansion** — powering additional modules as the base grows

The power balance problem is **completely resolved** by the new solar configuration.

---

## Shadow Period Management

During the ~11% of the year when the Peary site is in shadow, the solar film produces no power. Survival protocol:

**Shadow period protocol (proposed):**
- Laser system shuts down — no construction
- Robots hibernate at current positions (minimal power draw)
- Base computer reduces to keep-alive mode
- Mast heaters draw from battery reserve

**Battery reserve requirement:**
The ~108 kW surplus during illuminated periods (89% of year) charges a battery bank capable of sustaining mast heaters and minimal base computer through the longest expected shadow period (estimated several days).

**Battery sizing:** With 108 kW surplus × 89% availability, and a maximum shadow period of ~7 days:
- Survival power needed: ~5 kW (heaters + minimal compute)
- Duration: ~7 days = 168 hours
- Energy needed: ~840 kWh
- This is readily achievable with solid-state battery technology at this scale.

---

## Previous Configuration (for reference)

The earlier concept used a 100 m² wrapped curtain producing ~32 kW — which created a power deficit when all consumers were active simultaneously. That configuration has been superseded by the 880 m² roll-out film system described above.

---

## Key Uncertainties

1. Actual GaAs conversion efficiency in the Peary thermal environment (cells cool significantly in shadow and may briefly underperform on wake)
2. Dust accumulation rate on the vertically hanging film
3. Exact illumination geometry at the specific landing site within the Peary rim
4. Robot actual power draw under operational lunar conditions

Ground validation (Phase 0 Demonstrator 2) addresses items 1, 2, and 4.
