# The Mast — Overview
## Chrystal Moon Base — Phase 0.2 Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Purpose

The mast is the central infrastructure element of the Pod. It serves three simultaneous functions:

1. **Power generation** — two CIGS solar film arms (600 m² total) generate ~104–143 kW of electrical power
2. **Power distribution** — five Beam and Sensor Modules (BSMs), one per segment, deliver laser power to working robots up to 2+ km away
3. **Communications** — a Ka-band antenna at the mast top maintains continuous contact with Earth

Everything else in the Pod concept depends on the mast being operational. If the mast fails to deploy, the mission ends before it begins. Mast deployment reliability is therefore the highest priority single engineering challenge in the Phase 0.2 concept.

---

## Physical Description

The mast is a **5-segment telescoping structure** of Toray M55J carbon-fibre with cyanate ester resin matrix. This composite was selected for:
- Ultra-high modulus (540 GPa) — approximately twice as stiff as steel
- Near-zero thermal expansion coefficient (CTE) achievable — critical for stability under lunar thermal cycling
- Radiation resistance
- Excellent strength-to-weight ratio

**Base bearing:** The mast sits on a **magnetically levitated rotation bearing** (Active Magnetic Bearing — AMB, or Passive Magnetic Bearing — PMB). The rotor (mast) floats contactlessly above the stator — no friction, no lubrication, no wear. Designed for axial load of ~2,000 kg. Rotation: ~0.5°/hour for azimuth sun-tracking.

**Stowed configuration:** The 5 segments are nested inside each other. Total stowed height: approximately 9.7 metres — fitting within the Falcon Heavy payload fairing with margin. The pod base systems (tanks, thrusters, actuators, avionics) occupy the lower portion of the 11 m fairing height.

**Deployed configuration:** Each segment extends sequentially via central ball-screw spindles driven by brushless DC motors. Sliding surfaces are coated with dry-film lubricant (MoS₂). Segment overlap at full extension: ~45 cm per interface.

| Segment | Cross-section | Wall thickness | Length |
|---|---|---|---|
| 1 (base) | 50.0 × 50.0 cm | 5 mm | 9.70 m |
| 2 | 48.7 × 48.7 cm | 5 mm | 9.25 m |
| 3 | 47.4 × 47.4 cm | 5 mm | 8.80 m |
| 4 | 46.1 × 46.1 cm | 5 mm | 8.35 m |
| 5 (top) | 44.8 × 44.8 cm | 5 mm | 7.90 m |

**Total deployed height:** ~35 m

**Optional 6th segment:** Whether a 6th segment is structurally and mechanically feasible is an open engineering question. If added, it would increase mast height and BSM coverage. The founder has no strong preference — this decision belongs to engineers with structural and deployment analysis.

**Segment locking:** Passive collet mechanisms engage automatically when each segment reaches full extension. No active locking required. Retraction is not possible after locking — the mast is a permanent installation.

**Estimated mast mass:** ~200 kg

---

## Solar Film Arms

Two arms are mounted on **segment 1 — the lowest segment**, positioned just above the pod garages:

- Arm length: ~9 m each
- Film: 9 m × 30 m CIGS thin-film per arm = ~600 m² total
- Arms fold flat against segment 1 during launch
- Arms deploy outward when segment 1 is in position
- Film unrolls upward via pulley-and-cable system as mast extends
- Top segment carries precision pulleys — cables guide film evenly
- No separate unfurling motor required

The top segment (segment 5) carries **only** the Ka-band antenna and BSM 5. No arms. No moving parts beyond sensors and beamer optics.

---

## Deployment Sequence

1. Pod lands — bloom deploys — pod anchored
2. Arms on segment 1 fold out horizontally (spring-loaded)
3. Film spools locked — film not yet extended
4. Mast begins telescoping upward — segment 1 first
5. Cables from film edges run through pulleys on rising top segment
6. Film pulls upward off spools as top segment rises
7. All 5 segments lock sequentially
8. Film fully extended and tensioned at ~30 m
9. Ka-band antenna and BSM 5 activate
10. Solar power established — base computer initialises
11. BSMs 1–4 activate
12. Mast begins slow azimuth rotation to face sun

Estimated deployment time: 2–4 hours. Slow and controlled — rapid deployment risks dynamic loads.

---

## Beam and Sensor Modules (BSMs)

Five BSMs, one per segment, at approximately:
- BSM 1: ~7 m
- BSM 2: ~14 m
- BSM 3: ~21 m
- BSM 4: ~28 m
- BSM 5: ~35 m (top — also carries Ka-band antenna)

The AI selects the optimal BSM for each robot based on position. Lower BSMs serve nearby robots at steep angles; higher BSMs serve distant robots at shallow angles. Robots 2+ km away are reached via BSM 5 in vacuum — no atmospheric losses.

---

## Key Documents

| Document | Description |
|---|---|
| mast-solar-curtain.md | CIGS solar film — arms, deployment, power output |
| mast-bsm-beam-sensor-module.md | BSM design and laser power delivery |
| mast-anchor-spike.md | Anchor variant 1 |
| mast-anchor-pure-bloom.md | Anchor variant 2 |
| mast-anchor-adaptive-bloom.md | Anchor variant 3 |
| mast-anchor-rooted-hybrid.md | Anchor variant 4 (preferred) |
| power-budget.md | Full power budget analysis |
