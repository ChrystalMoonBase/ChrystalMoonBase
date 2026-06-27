# CMB8LF-S1-HL — Head-Less Scale Prototype (parallel variant)

**Status:** Complete parallel design, ready to build if selected
**Author:** Berechja Kerkdijk
**Licence:** Hardware: CERN-OHL-S-2.0 · Software: Proprietary (separate private repo) · Docs: CC0

> **What this is.** A fully worked-out **head-less** version of the CMB8LF-S1 prototype,
> built and documented *in parallel* with the standard head variant (`../CMB8LF_v1/`). It
> exists so that, if the open design question in `OPEN-DESIGN-INQUIRY-robot-head.md` resolves
> in favour of the integrated/head-less direction, the build is **already finished** — schematics,
> CAD, BOM, firmware and all — and no months of redesign are needed. The decision becomes
> "pick variant A or B," not "now start designing B."

---

## The one difference

This variant changes **only the sensing/camera layer**. Everything else is identical to the
standard prototype:

| Subsystem | Standard `CMB8LF_v1` | This head-less `CMB8LF_v1_HL` |
|---|---|---|
| Sensors / cameras | In a **detachable front head** (pan/tilt module between leg 1 & 2) | **Integrated into the body** — work-sensing between the front legs + 360° awareness ring + override cameras. No head, no pan/tilt. |
| Working laser (sinter) | **In the front-leg palm** | **In the front-leg palm — UNCHANGED** |
| Legs (standard + gripper) | 8 legs, 3 DOF each | **Identical — shared** |
| Chassis / body shell | Spider PEEK-CF, 9th coupling = head | Spider PEEK-CF, **9th coupling removed/blanked**; sensor recesses added |
| CAN bus / moteus / motors | 26× RP2350, Pico W ×2, moteus | **Identical — shared** |
| Compute (brain) | Jetson Orin Nano in body | **Identical — shared (Jetson in body)** |
| Power / battery | Distributed rail | **Identical — shared** |
| Gait / kinematics | Wave gait, encoder-based | **Identical — shared** |

**Because only sensing changes, this variant does not duplicate the shared subsystems.** Where
a file would be byte-for-byte identical to the standard prototype, this folder **references the
shared base** instead of copying it — so the two variants cannot silently drift apart. Only the
files that genuinely differ are fully written out here.

---

## Files in this variant

**Fully worked out here (they differ):**
- `docs/HEADLESS_DESIGN.md` — the complete sensor-relocation design: what moves where, why,
  and how each sensor is protected.
- `CMB8LF_v1_HL_BOM.md` — full bill of materials (delta-marked against the standard BOM).
- `cad/CMB8LF_v1_HL_body_chassis.scad` — body shell with integrated sensor recesses and the
  9th (head) coupling blanked.
- `cad/CMB8LF_v1_HL_sensor_mounts.scad` — the new body-integrated sensor/camera mounts
  (replaces `head_module.scad`).
- `cad/CMB8LF_v1_HL_config.scad` — variant dimension overrides (sensor positions, recess sizes).
- `diagrams/CMB8LF_v1_HL_Wiring_Diagram.svg` — wiring for the relocated sensors/cameras.
- `diagrams/CMB8LF_v1_HL_Sensor_Layout.svg` — top/side view of where every sensor sits on the body.
- `software/sensors_headless.py` — sensor manager for the body-integrated layout + override feed.
- `software/config_headless.py` — pin map / sensor addresses for this variant.

**Shared with the standard prototype (do NOT duplicate — use the base files):**
- All leg CAD: `../CMB8LF_v1/cad/CMB8LF_v1_leg_*.scad`, `arm_leg_combined.scad`, `coupling_interface.scad`, `palm_laser.scad`
- All motion/control firmware: `../CMB8LF_v1/software/{gait,leg,moteus_ctrl,can_bus,rp2350_segment,safety,servo,wave_gait_v6}.py`
- Laser-palm firmware: `../CMB8LF_v1/software/laser_palm_v6.py`, `palm_spectroscopy.py`
- Print settings: `../CMB8LF_v1/PRINT_SETTINGS.md`, `CMB8LF-v1-PRINT_SETTINGS.md`
- Vacuum prep: `../CMB8LF_v1/VACUUM_PREP.md`
- Shared dimensions: `../CMB8LF_v1/cad/CMB8LF_v1_vacuum_config.scad` (this variant's config *includes* it and only overrides what changes)

---

## Why keep the laser-palm in the leg (unchanged)

The working laser stays in the front-leg palm exactly as in the standard build. This is
deliberate: the arm-legs already bring the laser precisely to the work point using
encoder-based positioning, and the palm already carries the close-range sinter/melt optics
and the palm spectroscopy. Moving the laser would change the proven leg design for no benefit.
The head-less change is *only* about where the **sensors and cameras** live — not the tool.

---

## Relationship to the L1 concept

This is the **scale prototype** expression of the head-less direction discussed for the
full-size L1 robot in `../robot-cmb8lf-l1/chassis.md` and `OPEN-DESIGN-INQUIRY-robot-head.md`.
Building it at prototype scale is how we test whether body-integrated sensing actually works
for precise close-up sinter/melt work before committing the lunar design.
