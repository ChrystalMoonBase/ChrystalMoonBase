# Mast Solar Curtain
## Chrystal Moon Base — Phase 0.2 Power Generation

**Status:** Concept proposal  
**Licence:** CC0

---

## Concept

The solar curtain is a flexible photovoltaic array wrapped around the mast, oriented vertically, and driven in azimuth to continuously face the sun. At the Peary rim latitude, this orientation is uniquely effective.

---

## Why Vertical?

At 88.6°N, the sun moves around the horizon at an elevation of 1.5°–6.5°. A horizontal panel at this latitude receives:

**Horizontal panel:** 1,361 W/m² × sin(elevation) ≈ 35–155 W/m²

A vertical panel facing the sun receives:

**Vertical panel:** 1,361 W/m² × cos(elevation) ≈ 1,352–1,361 W/m²

The vertical panel receives 8–40 times more power than a horizontal panel at the same location. This is the fundamental power advantage of the Peary pole location — and it only works with a vertical, azimuth-tracking panel.

---

## Design

**Cells:** Gallium arsenide (GaAs) thin-film photovoltaic cells, 30% efficiency. GaAs is more expensive than silicon but performs better in the temperature range and radiation environment of the lunar surface, and can be manufactured as thin, flexible sheets suitable for wrapping around the mast.

**Substrate:** Vectran woven fabric — the same material used in the bloom cloth. Light, strong, dimensionally stable, and compatible with space environments.

**Area:** Approximately 100 m² — a strip approximately 1 metre wide wrapped in a helix around the 100-metre mast, or a flat curtain on one side.

**Tracking:** A single-axis azimuth drive at the mast base rotates the entire mast at approximately 0.5°/hour — matching the rate at which the sun moves around the Peary horizon over the lunar month. This keeps the curtain continuously facing the sun with a single slow-speed motor and no complex pointing control.

---

## Power Output Estimate

| Parameter | Value |
|---|---|
| Curtain area | ~100 m² |
| Solar flux at vertical panel | ~1,357 W/m² (average) |
| GaAs efficiency | 30% |
| Gross output | ~40.7 kW |
| System losses (dust, cable, thermal) | ~10% |
| Net electrical output | ~36 kW |
| Annual availability | ~89% |
| **Working power estimate** | **~32–36 kW** |

These figures are estimates. Actual output depends on dust accumulation rate, cell temperature (GaAs efficiency decreases with temperature), and the precise illumination geometry at the specific landing site.

---

## Dust Management

Lunar dust accumulating on the solar cells reduces output over time. Three mitigation strategies are considered:

1. **Electrostatic dust removal** — applying alternating voltage to transparent electrodes above the cells mobilises dust particles off the surface. Demonstrated in laboratory conditions; not yet flight-proven at this scale.
2. **Robot cleaning** — a CMB-R1 robot with a soft brush attachment periodically cleans the curtain surface. Simple and reliable, but requires robot time.
3. **Curtain inclination** — the mast azimuth drive can tilt the curtain slightly off-vertical during non-critical periods, allowing gravity to assist dust removal. Minimal gravity (1/6 g) limits this effect but does not eliminate it.

The most practical approach is probably periodic robot cleaning combined with electrostatic mitigation. The cleaning frequency required depends on actual dust flux at the Peary site, which is not currently measured.
