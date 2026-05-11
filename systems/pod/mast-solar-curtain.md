# Mast Solar Film System
## Chrystal Moon Base — Phase 0.2 Power Generation

**Status:** Concept proposal  
**Licence:** CC0

---

## Concept — Definitive Configuration

Two arms extend horizontally from the top segment of the 55-metre mast. From each arm, a 44-metre roll-out GaAs solar film hangs vertically — reaching from arm to near-ground level. The entire mast rotates slowly in azimuth to keep both arms perpendicular to the sun at all times.

**Total solar area: 880 m²** (2 arms × 10 m wide × 44 m long)

---

## Why Vertical?

At 88.6°N, the sun moves around the horizon at an elevation of 1.5°–6.5°. A horizontal panel receives:

**Horizontal panel:** 1,357 W/m² × sin(elevation) ≈ 35–155 W/m²

A vertical panel facing the sun receives:

**Vertical panel:** 1,357 W/m² × cos(elevation) ≈ 1,352–1,357 W/m²

The vertical panel receives **8–40× more power** than a horizontal panel at the same location. This is the fundamental solar advantage of the Peary pole location — and it only works with a vertical, azimuth-tracking panel.

---

## Why Two Arms, Not Four or More

The sun at Peary is always on the horizon — it never rises above 6.5°. It circles the horizon over a ~29.5-day lunar day. This means:

- **Two arms parallel to the sun direction** — neither casts shadow on the other ✓
- **Cross-shaped (4 arms)** — two arms always shadow the other two ✗
- **Single arm** — half the area for the same mast height ✗

Two arms, aligned perpendicular to the sun and rotated to track it, is the only configuration that avoids inter-arm shadowing while maximising panel area.

---

## Configuration

| Parameter | Value |
|---|---|
| Mast deployed height | 55 m |
| Number of arms | 2 |
| Arm length | 10 m each |
| Film width (= arm length) | 10 m |
| Film length (hanging down from arm) | 44 m |
| **Panel area per arm** | **440 m²** |
| **Total panel area** | **880 m²** |
| Film type | GaAs thin-film, roll-out |
| Substrate | Vectran woven fabric |
| Cell efficiency | 30% |
| Azimuth tracking | Full 360° rotation, ~0.5°/hour |

---

## Power Output

| Parameter | Value |
|---|---|
| Total area | 880 m² |
| Solar constant | 1,357 W/m² |
| Vertical panel incidence factor | ~1.0 (cos 1.5°–6.5° ≈ 1) |
| GaAs efficiency | 30% |
| Gross output | ~358 kW |
| System losses (dust, cable, thermal) | ~10% |
| Annual availability | ~89% |
| **Working power estimate** | **~280 kW continuous** |

---

## Stowage

Both arms and their 44 m films stow inside the pod during launch and transit. The film rolls up onto spools mounted on each arm. On deployment, the arms swing out from the top mast segment as it locks into position, and the films unroll under lunar gravity (1/6 g) — no mechanical unfurling required. In vacuum with no wind, gravity alone extends the film to its full length.

---

## Azimuth Tracking

A single slow-speed motor at the mast base rotates the entire mast at approximately 0.5°/hour — matching the rate at which the sun moves around the Peary horizon over a lunar month. Both arms and their films remain perpendicular to the sun continuously. No complex pointing control is needed — one axis, one motor, one slow rotation.

---

## Dust Management

Lunar dust on vertical film surfaces falls by gravity (1/6 g) rather than accumulating. The primary risk is electrostatic adhesion. Mitigation:

1. **Robot cleaning** — a CMB-R1 robot with a soft brush periodically cleans the film surface
2. **Electrostatic mitigation** — alternating voltage on transparent electrodes above the cells mobilises dust particles
3. **Gravity assistance** — vertical orientation means gravity always acts to remove accumulated particles

The actual dust accumulation rate on the Peary rim at the specific landing site is not measured. Cleaning frequency must be determined from Demonstrator 2 dust testing.

---

## Key References

- ROSA (Roll-Out Solar Array) — NASA ISS deployment, similar roll-out architecture
- GaAs thin-film photovoltaics — standard space power technology
- Speyerer & Robinson (2005) — Peary rim illumination geometry
