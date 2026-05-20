# CMB8LF v1 — Print Settings & Tolerances

**Printer:** QIDI Tech Plus4 (305×305×280mm, 65°C chamber, 370°C hotend)  
**Slicer:** OrcaSlicer / QIDI Print  
**Last updated:** 2026  
**Licence:** CC0

---

## Critical: Before You Print Anything

Run these calibrations in order on fresh filament. Do not skip.  
Wrong calibration on CF filaments = parts that don't fit. No exceptions.

### 1. Flow Rate Calibration (per filament)
CF filaments flow differently than standard plastics.

1. Print a flow rate calibration cube in OrcaSlicer
2. Measure wall thickness with calliper
3. Adjust flow until walls hit target exactly
4. Save profile per filament spool — do not mix profiles

> ⚠️ 1% too high = parts printed oversize = bayonet and dovetail joints won't close

### 2. X-Y Hole Compensation
Holes always shrink inward on FDM prints. Without compensation:
- M2/M3 bolts will not pass through
- F688-2RS bearings (8mm shaft) will not seat
- Heat-set insert holes will be too tight to start the insert

**Setting in OrcaSlicer:** `Filament Settings → Advanced → X-Y Hole Compensation`

| Material | Compensation |
|---|---|
| PETG-CF | +0.10 mm to +0.15 mm |
| PA12-CF | +0.10 mm to +0.15 mm |
| TPU 95A | +0.00 mm (flexible, self-adjusts) |
| PLA+ | +0.10 mm (test prints only) |

> Start at +0.10mm. Print a bearing test hole (Ø8.0mm). If F688-2RS drops in cleanly with light press: correct. If tight: go to +0.15mm.

### 3. First Layer Calibration (Z-offset)
Run live Z-offset on every new build plate session. CF filaments are less forgiving than standard PETG on adhesion. PEI plate, no glue needed.

---

## Material Profiles

### PETG-CF — Chassis, frame, panels, electronics tray

| Parameter | Value |
|---|---|
| Nozzle | Hardened steel **0.6mm** |
| Nozzle temp | 250–260°C |
| Bed temp | 85°C |
| Chamber temp | 40–50°C |
| Print speed | 50 mm/s (perimeters), 80 mm/s (infill) |
| Layer height | 0.2mm |
| Walls | 4 perimeters |
| Infill | 40% gyroid |
| Cooling | Moderate (30–50% fan) |
| Supports | Tree supports, on build plate only |

> Use 0.6mm nozzle — not 0.4mm. Carbon fibre micro-particles clog 0.4mm nozzles quickly. 0.6mm also produces thicker walls = significantly stronger chassis.

### PA12-CF (Nylon Carbon) — Bayonet sockets, dovetail joints, bearing housings

| Parameter | Value |
|---|---|
| Nozzle | Hardened steel **0.6mm** |
| Nozzle temp | 270–280°C |
| Bed temp | 90°C |
| Chamber temp | **55–60°C** (active heating required) |
| Print speed | 40 mm/s (perimeters), 60 mm/s (infill) |
| Layer height | 0.2mm |
| Walls | 5 perimeters |
| Infill | 50% gyroid |
| Cooling | Minimal (0–15% fan) |
| Dry filament | **Yes — 8h at 70°C before printing** |
| Post-print | **Leave in closed chamber 30 min before opening** |

> The 30-minute closed-chamber cooldown is mandatory. Opening early causes internal stress in bayonet sockets and dovetail joints — parts will warp or crack under load.

> Dry PA12-CF before every session. Nylon absorbs moisture fast. Wet filament = weak layer adhesion = joints that fail under servo torque.

### TPU 95A — Snowshoe feet, vibration damping layers

| Parameter | Value |
|---|---|
| Nozzle | Hardened steel 0.4mm or 0.6mm |
| Nozzle temp | 225–235°C |
| Bed temp | 45°C |
| Chamber temp | Off / 30°C max |
| Print speed | 25 mm/s (slow — TPU strings at speed) |
| Layer height | 0.25mm |
| Walls | 3 perimeters |
| Infill | 20% gyroid |
| Retraction | Minimal or off |
| Cooling | High (80–100% fan) |

### PLA+ — Test prints only

| Parameter | Value |
|---|---|
| Nozzle | Any 0.4mm |
| Nozzle temp | 215°C |
| Bed temp | 60°C |
| Chamber temp | Off |
| Print speed | 60 mm/s |
| Layer height | 0.2mm |
| Walls | 3 perimeters |
| Infill | 20% gyroid |

> PLA+ is for fit testing only. Never install PLA+ parts in the final robot.

---

## Design Tolerances

Apply these in CAD before exporting to slicer. Non-negotiable.

### Sliding / Moving Interfaces (bayonet, dovetail, panel clips)

| Interface type | Clearance per side |
|---|---|
| Bayonet lock (leg socket) | **0.15–0.20mm** |
| Dovetail / chassis segment | **0.15–0.20mm** |
| Panel clip (shield panels) | **0.10–0.15mm** |
| Sliding rail | **0.20mm** |

> Start at 0.15mm. Print one test pair. If it locks smoothly with light force and releases cleanly with the wip tool: correct. Tighter = stuck. Looser = wobbles under servo load.

### Press-fit / Seated Interfaces

| Part | Design size | Note |
|---|---|---|
| F688-2RS bearing seat (Ø16mm OD) | **Ø15.85mm** | Light press fit |
| M3 bolt clearance hole | **Ø3.3mm** (before hole comp) | Passes freely |
| M2 bolt clearance hole | **Ø2.2mm** (before hole comp) | Passes freely |
| M3 heat-set insert hole | **OD_insert − 0.5mm** | Melts in snug |
| M2 heat-set insert hole | **OD_insert − 0.5mm** | Melts in snug |

> Heat-set insert holes: measure the outer diameter of your specific insert brand first. Then subtract 0.5mm. This gives the printed hole diameter. The plastic melts snugly around the insert and will not pull out under servo load.

### Sensor Cutouts

| Sensor | Cutout size | Note |
|---|---|---|
| RPLIDAR A1M8 | Ø76mm circle | Rotate scan window clear of frame |
| Pi Camera Module 3 | 25×24mm rectangle | Add 0.3mm clearance |
| VL53L1X | 5×2.5mm window | Flush with outer panel surface |

---

## Print Order — CMB8LF v1

Print in this order. Each step validates the previous.

| Step | Part | Material | Purpose |
|---|---|---|---|
| 1 | Bearing test block (F688-2RS) | PETG-CF | Validate hole comp setting |
| 2 | M3 bolt test plate | PETG-CF | Validate clearance holes |
| 3 | Bayonet socket + poot pin (test pair) | PA12-CF | Validate 0.15mm tolerance |
| 4 | Dovetail pair (chassis test segment) | PETG-CF | Validate 0.15mm tolerance |
| 5 | Snowshoe foot ×1 | TPU 95A | Validate TPU profile |
| 6 | Snoeuwschoen voet final ×16 | TPU 95A | Full set |
| 7 | Chassis segment A (left half) | PETG-CF | First structural part |
| 8 | Chassis segment B (right half) | PETG-CF | Mate with A, check fit |
| 9 | Leg set ×8 (coxa, femur, tibia) | PETG-CF + PA12-CF | Per robot |
| 10 | Shield panels | PETG-CF | Last — outer skin |

> Never skip steps 1–5. Getting calibration wrong on step 1 wastes filament and time on every part that follows.

---

## Heat-Set Insert Installation

1. Heat soldering iron to **200–220°C** (lower than printing temp)
2. Place insert on hole opening — do not press yet
3. Touch iron tip gently to top of insert
4. Apply **slow, steady downward pressure** — let heat do the work
5. Stop when insert is **0.2–0.3mm below surface** (flush or just below)
6. Remove iron, hold insert still for **10 seconds** while plastic re-solidifies
7. Do not stress the insert for **2 minutes**

> Too fast = crooked insert = bolt goes in at an angle = joint fails.  
> Too hot = melted plastic floods the thread = useless.

---

*CC0 — Chrystal Moon Base 2026*  
*Calibration values validated for QIDI Tech Plus4 + OrcaSlicer*  
*Credit: slicer settings and tolerance methodology contributed by Gemini*
