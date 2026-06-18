# Mast Solar Film System
## Chrystal Moon Base — Phase 0.2 Power Generation

**Status:** Concept proposal  
**Licence:** CC0

---

## Concept — Definitive Configuration

Two arms extend horizontally from **segment 1 (the lowest mast segment)**, positioned just above the pod garages. From each arm, a 30-metre roll-out CIGS solar film hangs vertically — unrolling upward as the mast extends. The entire mast rotates slowly in azimuth to keep both arms perpendicular to the sun at all times.

**Total solar area: ~600 m²** (2 arms × 9 m wide × 30 m long)

The mast rotates on a **magnetically levitated bearing** (AMB or PMB) — frictionless, maintenance-free, silent. No mechanical contact between the rotating mast and the fixed pod structure.

---

## Why Vertical?

At 88.6°N, the sun moves around the horizon at an elevation of 1.5°–6.5°. A horizontal panel receives:

**Horizontal panel:** 1,370 W/m² × sin(elevation) ≈ 35–155 W/m²

A vertical panel facing the sun receives:

**Vertical panel:** 1,370 W/m² × cos(elevation) ≈ 1,365–1,370 W/m²

The vertical panel receives **8–40× more power** than a horizontal panel at the same location. This is the fundamental solar advantage of the Peary pole location — and it only works with a vertical, azimuth-tracking panel.

---

## Why CIGS, Not GaAs

GaAs (Gallium Arsenide) offers higher efficiency (~30%) but has a crystalline structure — it is brittle and **cannot be rolled**. The roll-out deployment architecture requires a flexible thin-film cell.

**CIGS (Copper Indium Gallium Selenide)** on a flexible titanium or polyimide substrate:
- Flexible and rollable ✓
- Demonstrated in space and terrestrial applications ✓
- Specific power ~1,900 W/kg ✓
- Conservative efficiency: 15.7% (realistic growth path to 21.5%) ✓

---

## Why Two Arms, Not Four or More

The sun at Peary is always on the horizon — it never rises above 6.5°. It circles the horizon over a ~29.5-day lunar day. This means:

- **Two arms parallel to the sun direction** — neither casts shadow on the other ✓
- **Cross-shaped (4 arms)** — two arms always shadow the other two ✗
- **Single arm** — half the area for the same mast height ✗

Two arms, aligned perpendicular to the sun and rotated to track it, is the only configuration that avoids inter-arm shadowing while maximising panel area.

---

## Why Arms on the Lowest Segment

Placing the arms on segment 1 (lowest) rather than the top offers significant advantages:

- **No complex folding at height** — arms deploy near ground level where access is straightforward
- **Film unrolls upward** as mast extends — the mast deployment mechanism itself pulls the film out
- **Lower centre of mass** for the arm/film system during deployment
- **Simpler mechanism** — the katrol (pulley) system guides the film upward via cables through precision pulleys on the top segment

The top segment (segment 5) is reserved exclusively for the Ka-band antenna and BSM 5 — no arms, no moving parts beyond the sensor and beamer.

---

## Deployment Sequence

1. Pod lands and bloom deploys
2. Arms on segment 1 fold out horizontally (spring-loaded, at bloom level)
3. Film spools on each arm are locked — film not yet extended
4. Mast begins telescoping upward
5. Cables from film edges run through precision pulleys on top segment
6. As top segment rises, cables pull film upward off the spools
7. Film extends uniformly and simultaneously on both sides
8. At full mast extension (~35 m), film is fully deployed and tensioned
9. Mast begins azimuth tracking

---

## Configuration

| Parameter | Value |
|---|---|
| Mast deployed height | ~35 m (5 segments · 6th: open engineering question) |
| Mast material | Toray M55J CFRP + cyanate ester resin |
| Mast rotation | Magnetically levitated bearing (AMB/PMB) |
| Arm position | Segment 1 — lowest segment, above garages |
| Number of arms | 2 |
| Arm length | ~9 m each |
| Film width | ~9 m (= arm length) |
| Film length | ~30 m (hangs vertically, guided by pulley cables) |
| **Panel area per arm** | **~270 m²** |
| **Total panel area** | **~600 m²** |
| Film type | CIGS thin-film on flexible substrate |
| Cell efficiency (conservative) | 15.7% |
| Cell efficiency (optimistic) | 21.5% |
| Azimuth tracking | Full 360° rotation, ~0.5°/hour |

---

## Power Output

| Parameter | Conservative | Optimistic |
|---|---|---|
| Total area | 600 m² | 600 m² |
| Solar constant | 1,370 W/m² | 1,370 W/m² |
| CIGS efficiency | 15.7% | 21.5% |
| System losses | 10% | 10% |
| Annual availability | 89% | 89% |
| **Working power** | **~104 kW** | **~143 kW** |

Both figures represent a substantial improvement over any previous configuration and provide ample power for robot operations, laser power beaming, and battery charging simultaneously.

---

## Stowage

Both arms fold flat against segment 1 during launch. The CIGS film rolls onto spools housed within each arm — compact, protected, and thermally stable. On deployment, the pulley-and-cable system guides the film upward as the mast extends. No separate unfurling motor is required — the mast extension mechanism does the work.

---

## Azimuth Tracking

The magnetically levitated bearing at the mast base allows the entire mast to rotate continuously and frictionlessly. Rotation rate: ~0.5°/hour — matching the sun's circuit of the Peary horizon over a lunar month. The tracking system requires only a sun sensor and a simple control loop to maintain perpendicular alignment.

---

## Dust Management

Vertical film surfaces are less prone to dust accumulation than horizontal ones — gravity (1/6 g) acts continuously to pull loose particles downward. Primary risk remains electrostatic adhesion. Mitigation strategies:

1. **Robot cleaning** — CMB8LF-L1 robot with soft brush attachment cleans film surface periodically
2. **Electrostatic mitigation** — alternating voltage on transparent electrodes mobilises dust particles
3. **Gravity assistance** — vertical orientation assists passive dust removal

Actual dust accumulation rate at Peary is not measured. Cleaning frequency must be determined from Phase 0 Demonstrator 2 testing.

---

## Key References

- Powalla et al. (2017) — CIGS thin-film photovoltaics review, Advanced Energy Materials
- ROSA (Roll-Out Solar Array) — NASA ISS deployment, similar roll-out architecture
- Noda et al. (2008) — SELENE polar illumination data
- Speyerer & Robinson (2005) — Peaks of Eternal Light illumination mapping
