# CMB8LF-S1-HL — Dimensions (delta)

**Variant:** Head-less · **Base dimensions:** `../CMB8LF_v1/docs/DIMENSIONS_v2.md`
**CC0 · Chrystal Moon Base · 2026**

All body, leg, coupling and motor dimensions are **identical to the base** and are not
repeated here. This file gives only the **new sensor-position dimensions** introduced by the
head-less layout. Values mirror `cad/CMB8LF_v1_HL_config.scad`.

---

## Body envelope (unchanged, shown for reference)

| Dim | Value |
|---|---|
| BODY_L | 400 mm |
| BODY_W_MAX | 300 mm |
| BODY_W_FRONT (front lobe) | 200 mm |
| BODY_H | 85 mm |
| COUPLING_DIA / COUPLING_H | 55 / 28 mm |

Front head coupling (9th): **removed** (blanked in `CMB8LF_v1_HL_body_chassis.scad`).

---

## New: work-sensing window (front lobe)

| Dim | Value | Note |
|---|---|---|
| Position X (forward) | 0.40 × BODY_L = 160 mm | on the front lobe |
| Position Z (height) | 0.35 × BODY_H ≈ 30 mm | lower third, looks down |
| Aperture W × H | 46 × 30 mm | thermal + visual side by side |
| Oblique tilt | 25° | off the laser axis (glare control) |
| Recess depth | 12 mm | spatter set-back |
| Sacrificial window | sapphire ⌀30 mm × 2 mm | tool-free replaceable |

## New: illumination ring

| Dim | Value |
|---|---|
| IR LED count | 6 |
| Ring radius | 26 mm around window |
| Spotlight aperture | ⌀18 mm (10 W) |

## New: 360° awareness

| Item | Position | Note |
|---|---|---|
| RPLIDAR A1M8 | body top centre | short fixed riser, 18 mm, ⌀70 mm body |
| ToF VL53L1X ×2 | body sides, Z ≈ 0.45 × BODY_H | ⌀8 mm ports |

## New: override surround cameras

| Item | Azimuths | Position |
|---|---|---|
| Wide-angle cams ×4 | 0° / 90° / 180° / 270° | body perimeter, Z ≈ 0.6 × BODY_H, ⌀16 mm |

## New: FSO comms port

| Item | Position |
|---|---|
| FSO laser comm | X = 0.30 × BODY_L, top-front, ⌀12 mm |

---

## Print note

The head-less body prints in the **same two halves** as the base body (too large for one
print). The only mould changes are the added sensor recesses and the LiDAR riser boss; the
print settings in `../CMB8LF_v1/PRINT_SETTINGS.md` apply unchanged.
