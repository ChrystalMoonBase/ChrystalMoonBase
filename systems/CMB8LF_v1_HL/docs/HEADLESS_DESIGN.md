# Head-Less Design — Sensor Relocation

**CMB8LF-S1-HL · Chrystal Moon Base · CC0**

This document specifies exactly how the sensing layer of the standard prototype's detachable
head is relocated into the body, with no separate head and no pan/tilt. It is the engineering
heart of the head-less variant.

---

## 1. What the standard head carried

The standard prototype's head module (`../CMB8LF_v1/cad/CMB8LF_v1_head_module.scad`, mounted
between front legs 1 and 2, on a pan/tilt base) carried:

| # | Item | Function | Kept? |
|---|---|---|---|
| 1 | Pi Camera 3 NoIR | Visual camera (work + override feed) | **Yes** → relocated |
| 2 | FLIR Lepton 3.5 | Thermal camera (sinter/melt temperature) | **Yes** → relocated |
| 3 | RPLIDAR A1M8 | 360° ranging / mapping | **Yes** → relocated (body top) |
| 4 | 2× VL53L1X ToF | Side proximity | **Yes** → relocated (body sides) |
| 5 | 6× IR LED array | Illumination for camera | **Yes** → relocated |
| 6 | 2× WS2812B "RGB eyes" | *Cosmetic eyes* | **Removed** (human affectation) |
| 7 | 10 W spotlight | Work-area illumination | **Yes** → relocated (front) |
| 8 | FSO laser comm | Free-space optical comms | **Yes** → relocated (body top-front) |
| 9 | Pan/tilt mechanism | Aims the head | **Removed** (no head to aim) |

Two items are **deleted**, not moved: the cosmetic "RGB eyes" (a human/animal affectation —
exactly the assumption that motivated going head-less) and the **pan/tilt mechanism** (with no
head, there is nothing to aim — its job is replaced by distributed fixed coverage + the robot
turning its body). Removing the pan/tilt also removes two small servos, their drivers, and a
moving mechanical assembly: a net reduction in part count and failure points.

---

## 2. Where each sensor goes

The spider body already has a narrower **front lobe** (the old "head position" in
`body_chassis.scad`) and a wide mid-body. Sensors are distributed in three functional groups:

### Group A — Work-sensing (between the front legs, forward/down-looking)
Mounted in the **front lobe of the body**, looking forward and down at the work zone where the
front-leg palms do the sinter/melt:
- **FLIR Lepton 3.5 (thermal)** — the critical sinter/melt temperature sensor; fixed aim at the
  palm work point.
- **Pi Camera 3 NoIR (visual)** — work-zone close view (also feeds the override engineer).
- **Palm spectroscopy** stays in the palm itself (unchanged, shared) — it is already at the work
  point on the leg.

These look straight at heat/glare/spatter → see §3 for protection.

### Group B — 360° awareness (around the body)
- **RPLIDAR A1M8** — mounted on a short fixed riser on the **body top centre** for unobstructed
  360° scanning (it spins itself; it never needed a pan/tilt). This is the one sensor that sits
  slightly proud of the shell, on the body, not on a head.
- **2× VL53L1X ToF** — one each side of the body for close-in proximity where LiDAR has blind
  spots.

### Group C — Override / situational cameras (for the human engineer)
- **Pi Camera 3 NoIR (work)** from Group A doubles as the work view.
- **Surround cameras** — additional wide-angle camera positions around the body so a CMB
  engineer doing an override can see the whole situation, not just straight ahead. (The standard
  build relied on panning the single head camera; the head-less build uses several fixed wide
  cameras instead — better for override, since the engineer sees everything at once with no aiming
  delay across the ~2.6 s link.)

### Illumination
- **6× IR LED array** + **10 W spotlight** relocate to the **front lobe**, around the work-sensing
  window, lighting the work zone for the cameras.

### Comms
- **FSO laser comm** relocates to the **body top-front**, with clear sky view.

---

## 3. Protecting the work-sensing window (the open sub-question)

The Group A sensors face the most hostile spot on the robot — the sinter/melt zone (intense IR,
laser glare, out-gassing, spatter). This is the one genuinely hard part of going head-less, and
in the standard build the pan/tilt head could at least turn away. Fixed body sensors cannot, so
protection is designed in. The prototype implements **all three** mitigations so they can be
tested and compared:

1. **Recessed, replaceable window.** Each work-sensor sits behind a sacrificial, swappable
   optical window (sapphire or fused-silica for the thermal/visual path), set back inside a recess
   in the front lobe so spatter lands on the window, not the sensor. The window is a cheap, tool-free
   replace item (like a welding-helmet shade lens).
2. **Oblique (off-axis) mounting.** Sensors look at the work point from an angle, not straight down
   the laser axis, so direct glare and the densest spatter plume are off-axis.
3. **Duty-cycled capture.** The thermal/visual capture is time-shared with the laser duty cycle
   where possible — full-resolution reads when the laser is between pulses; the controller already
   sequences the sinter pulses (`sinter_seq_v6.py`, shared), so the sensor read can be interleaved.

A small **gas-knife / purge** (a puff of inert gas across the window) is noted as a possible
fourth measure but is **not** in the prototype — it adds plumbing and on the airless Moon would
spend a consumable; flagged for evaluation, not built.

> This §3 is exactly the question put to engineers in `OPEN-DESIGN-INQUIRY-robot-head.md`. The
> prototype is the test rig for finding which mitigation (or combination) actually holds up.

---

## 4. What changes in the body shell

- The **9th coupling point** (the head coupling at the front) is **removed/blanked**: the spider
  keeps 8 leg couplings; there is no detachable head.
- **Sensor recesses** are added to the front lobe (work-sensing window, IR/spotlight ring) and the
  body sides (ToF), plus a **LiDAR riser** boss on the top centre and an **FSO port** top-front.
- Internal volume is otherwise unchanged; the electronics bay (Jetson, power, comms) is identical.

See `cad/CMB8LF_v1_HL_body_chassis.scad` and `cad/CMB8LF_v1_HL_sensor_mounts.scad`.

---

## 5. What does NOT change (shared base)

Legs (standard + gripper), the laser-palm and its optics/spectroscopy, the coupling interface,
all motors, the CAN bus, the moteus controllers, the RP2350 per-segment boards, the Pico W
safety/coordination, the Jetson brain, the power rail, the gait, and all motion firmware are
**identical** to `../CMB8LF_v1/` and are not duplicated. Only the sensing layer differs.
