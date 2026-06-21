# The MAST-POD Mast — Overview
## Chrystal Moon Base — Phase 0.2 Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Purpose

The mast is the central infrastructure element of the Pod. It serves three simultaneous functions:

1. **Power generation** — two roll-out CIGS solar film arms on the mast generate ~104–143 kW of continuous electrical power
2. **Power distribution** — five Beam and Sensor Modules (BSMs) on the mast deliver this power as a laser beam to working robots up to 2+ km away
3. **Communications** — a Ka-band antenna at the mast top maintains continuous contact with Earth

Everything else in the Pod concept depends on the mast being operational. If the mast fails to deploy, the mission ends before it begins. Mast deployment reliability is therefore the highest priority single engineering challenge in the Phase 0.2 concept.

---

## Physical Description

The mast is a 5-segment telescoping structure of Toray M55J carbon-fibre reinforced polymer with cyanate ester resin matrix. This material was selected for its stiffness-to-mass ratio, thermal stability across the lunar surface temperature range (−200°C to +130°C), radiation resistance, and minimal outgassing in vacuum.

**Stowed configuration:** The 5 segments are nested inside each other — the innermost (smallest diameter) at the top, the outermost (largest diameter) at the bottom, like a collapsed telescope. Total stowed height fits within the Pod upper section, within Falcon Heavy payload fairing constraints.

**Deployed configuration:** Each segment extends and locks sequentially, driven by a single Dyneema tension band running through all segments from a drive motor at the base. Total deployed height: approximately 35 metres.

> **Open engineering question:** A 6th segment has been discussed. Whether a 6th segment is structurally viable and adds meaningful value is an open question for qualified engineers. The current baseline is 5 segments / ~35 metres.

**Segment locking:** A passive collet mechanism at each segment interface locks automatically when the segment reaches full extension. No active locking is required — the collets engage mechanically under the tension of the Dyneema band. This eliminates a class of potential failures at the cost of making deliberate retraction impossible, which is acceptable since the mast is not designed to be retracted.

**Rotation system:** The entire mast rotates in azimuth on a magnetically levitated bearing (hybrid AMB/PMB) to track the sun continuously. This keeps the CIGS solar arms oriented perpendicular to incoming sunlight throughout the ~89% illuminated lunar year at Peary latitude.

**Why the rotating bearing survives lunar dust — by location, not just by type.** Lunar dust (fine, abrasive, electrostatically charged) is the classic enemy of any moving mechanism, so the bearing's dust strategy is deliberate and layered:

1. **Contactless by principle.** A magnetically levitated bearing has no rubbing mechanical surfaces in its load path — the mast floats on a magnetic field. There is no contact interface for dust to grind between, which removes the single worst failure mode that a conventional roller or sleeve bearing would have on the Moon.

2. **Placed inside the dust-controlled zone.** The bearing sits at the mast base, *within* the Vectran dust-containment skirt formed by the deployed bloom (see `pod-bloom-deployment.md`). That skirt is specifically there to exclude regolith dust from the working area around the pod base — so the bearing is not exposed to the open surface dust environment at all; it operates inside the protected footprint.

3. **Ringed by the garages.** The 8 robot garages are arranged around the pod base, forming an additional physical barrier between the bearing region and the surrounding terrain. They block line-of-sight dust transport (thrown by robot movement or electrostatic transport) toward the rotation axis.

Together these mean the bearing is protected three ways: it has no contact surface to foul, it lives inside the bloom's dust skirt, and it is shielded by the garage ring. (Note: the ~9 m solar arms and their ~24 m horizontal span sit high on the mast and are a separate matter from the dust skirt at the base — the skirt protects the base/bearing, not the elevated solar curtain.)

**Remaining honest open questions:** even a contactless bearing is not automatically dust-proof. Its position sensors, the control electronics, and the gap between rotating and fixed structure can still admit fine or charged dust over years of operation. A labyrinth or active seal at the rotation gap, and dust-tolerant sensor placement, remain open engineering questions for Phase 0 — the architecture reduces the dust *reaching* the bearing, but long-duration sealing of the gap itself must still be validated.

---

## Solar Power System

Two roll-out CIGS thin-film solar arms extend horizontally from the mast, one on each side.

| Parameter | Value |
|---|---|
| Solar film technology | CIGS thin-film (roll-out) |
| Total solar area | 2 × 9 m × 30 m = **600 m²** |
| Solar constant at Moon | ~1,361 W/m² (varies ~1,321–1,413/yr) |
| Conservative efficiency | 15.7% → **~104 kW** continuous |
| Optimistic efficiency | 21.5% → **~143 kW** continuous |
| Illumination availability | ~89% of lunar year at Peary rim |

These are estimates based on published CIGS efficiency ranges. Actual output depends on film degradation under UV and particle radiation, dust accumulation rate, pointing accuracy, and thermal effects. All are open engineering questions.

---

## Beam and Sensor Modules (BSMs)

Five BSMs are pre-mounted on the mast — one per segment — at approximately 7, 14, 21, 28, and 35 metres height. Each BSM:

- Receives electrical power from the solar arms
- Converts it to a directed laser beam (~10–20 kW class diode laser)
- Tracks a moving robot receiver autonomously
- Delivers usable power to the CMB8LF-L1 robot at up to 2+ km range

Multiple BSMs can operate simultaneously, powering multiple robots at once. If one BSM fails, the others continue operation.

---

## Deployment Sequence

1. Pod lands autonomously at selected high-illumination peak on Peary Crater rim
2. Pod stabilises and anchors (see Anchoring section)
3. Mast base motor activates, pulling Dyneema tension band
4. Innermost (top) segment rises first; collet locks at full extension
5. Sequence continues upward until all 5 segments are locked
6. CIGS solar arms, rolled around the mast during transit, unfurl as segments extend
7. Ka-band antenna at mast top deploys last
8. BSMs activate after solar power is confirmed
9. Garage doors open; CMB8LF-L1 robots walk out

Estimated deployment time: 2–4 hours. Deployment is slow and controlled — rapid deployment risks dynamic loads that could damage the structure in lunar vacuum and 1/6 g.

---

## Anchoring

After extensive evaluation of four anchor concepts (Spike, Pure Bloom, Adaptive Bloom, Rooted Hybrid), the **Rooted Hybrid** has been selected as the baseline design.

The Rooted Hybrid combines:
- An initial mechanical spike for immediate landing stability
- Expanding anchor elements that engage the regolith progressively
- A hardened sintered-regolith foundation sintered by the CMB8LF-L1 robots around the base over the first operational days

This approach provides immediate stability at landing while building toward permanent anchorage as construction proceeds. It is the most resilient of the four variants against unknown surface conditions at the specific landing site.

Full specification: [`systems/pod/mast-anchor-rooted-hybrid.md`](mast-anchor-rooted-hybrid.md)

---

## Key Open Engineering Questions

| Question | Why it matters |
|---|---|
| Mast deployment dynamics in lunar vacuum and 1/6 g | Thermal cycling stress on collet locks; dynamic loads during extension |
| BSM pointing accuracy over 2+ km | Beam divergence limits vs. receiver panel area on robot |
| CIGS film degradation rate | UV, particle radiation, micrometeorite flux over multi-year mission |
| Mast structural resonance | Solar wind particle pressure and thermal expansion cycles |
| Regolith bearing capacity at exact landing site | Determines anchor spike penetration depth and bloom engagement |

---

## Key Documents

| Document | Description |
|---|---|
| [`mast-solar-curtain.md`](mast-solar-curtain.md) | CIGS solar arm — power generation detail |
| [`mast-bsm-beam-sensor-module.md`](mast-bsm-beam-sensor-module.md) | BSM — laser power delivery detail |
| [`mast-anchor-rooted-hybrid.md`](mast-anchor-rooted-hybrid.md) | Anchor system — Rooted Hybrid (selected) |
