# CMB8LF-S1-HL — Bill of Materials (delta against standard)

**Variant:** Head-less · **Base:** `../CMB8LF_v1/CMB8LF_v1_BOM_v6.md`
**CC0 · Chrystal Moon Base · 2026**

This BOM lists **only what differs** from the standard prototype BOM. Everything not listed
here (legs, motors, moteus, CAN bus, Jetson, power, laser-palm, coupling, structure, filament)
is **identical and shared** — order it from `../CMB8LF_v1/CMB8LF_v1_BOM_v6.md`. The working
laser-palm is unchanged and stays in the front leg.

---

## What changes: the sensing layer only

### REMOVED (vs standard head)

| Onderdeel | Aantal | Prijs/st | Totaal | Reden |
|---|---|---|---|---|
| WS2812B "RGB ogen" | 2 | €1 | −€2 | Cosmetic eyes — human affectation, no function |
| Pan-as servo (kop) | 1 | €12 | −€12 | No head to pan |
| Tilt-as servo (kop) | 1 | €12 | −€12 | No head to tilt |
| Pan/tilt lager + as | 1 | €8 | −€8 | Mechanism deleted |
| **Verwijderd subtotaal** | | | **−€34** | |

### ADDED (body-integrated sensing)

| Onderdeel | Aantal | Prijs/st | Totaal | Bus | Positie |
|---|---|---|---|---|---|
| Surround override camera (wide-angle, OV5647 module) | 4 | €12 | €48 | CSI/USB → Jetson | Body 0°/90°/180°/270° |
| CSI multiplexer (Arducam 4-ch) | 1 | €45 | €45 | → Jetson | Combine cameras |
| Sacrificial optical window (sapphire ⌀30mm) | 4 | €9 | €36 | — | Work + spare set (replaceable) |
| Window clip frame (geprint PEEK-CF) | 2 | — | — | — | CAD `sensor_mounts` |
| Work-sensor pod (geprint PEEK-CF) | 1 | — | — | — | CAD `sensor_mounts` |
| LiDAR top riser + cap (geprint) | 1 | — | — | — | CAD `body_chassis` HL |
| **Toegevoegd subtotaal** | | | **€129** | | |

### RELOCATED (same parts, new place — no cost change)

These are the **same items** as the standard sensor BOM, just mounted in the body instead of a
head. They are **not re-ordered** — they move:
- RPLIDAR A1M8 (€90) → body top riser
- Pi Camera 3 NoIR (€28) → front-lobe work window (also feeds override)
- FLIR Lepton 3.5 (€180) → front-lobe work window
- 2× VL53L1X ToF (€10) → body sides
- 6× IR LED array + 10 W spotlight → front-lobe illumination ring
- FSO laser comm → body top-front
- BNO055 IMU (€8) → body (unchanged location, already internal)

---

## Net cost effect

| | Bedrag |
|---|---|
| Standard prototype EINDTOTAAL (excl. printer) | ~€7.497 |
| − removed (eyes, pan/tilt) | −€34 |
| + added (surround cams, mux, windows) | +€129 |
| **Head-less EINDTOTAAL (excl. printer)** | **~€7.592** |

The head-less variant is **~€95 more** than the standard build — the cost of four surround
cameras + multiplexer + replaceable windows, minus the deleted pan/tilt and cosmetic eyes. In
return it removes a detachable-head coupling, two servos and a moving mechanism (fewer failure
points), and gives the override engineer all-round vision.

---

## Ordering note

Order the **entire standard BOM** (`../CMB8LF_v1/CMB8LF_v1_BOM_v6.md`) **except** the pan/tilt
servos and the WS2812B eyes, then add the four "ADDED" line items above. All sensor parts that
the standard BOM lists as "Hoofd" (head) position are kept — they simply mount in the body per
`docs/HEADLESS_DESIGN.md`.
