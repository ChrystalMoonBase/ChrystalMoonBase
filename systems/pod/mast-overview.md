# The 55-Metre Mast — Overview
## Chrystal Moon Base — Phase 0.2 Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Purpose

The mast is the central infrastructure element of the Pod. It serves three simultaneous functions:

1. **Power generation** — the solar curtain attached to the mast generates ~280 kW of electrical power
2. **Power distribution** — five Beam and Sensor Modules (BSMs) on the mast deliver this power as a laser beam to working robots up to 2+ km away
3. **Communications** — a Ka-band antenna at the mast top maintains continuous contact with Earth

Everything else in the Pod concept depends on the mast being operational. If the mast fails to deploy, the mission ends before it begins. Mast deployment reliability is therefore the highest priority single engineering challenge in the Phase 0.2 concept.

---

## Physical Description

The mast is a 5-segment telescoping structure of carbon-fibre reinforced PEEK (polyether ether ketone). PEEK was selected for its thermal stability across the full lunar surface temperature range (−200°C to +130°C), its radiation resistance, and its strength-to-weight ratio.

**Stowed configuration:** The 5 segments are nested inside each other — the innermost (smallest diameter) at the top, the outermost (largest diameter) at the bottom, like a collapsed telescope. Total stowed height: approximately 10–11 metres, fitting within the Falcon Heavy payload fairing height with margin.

**Deployed configuration:** Each segment extends and locks sequentially, driven by a single Dyneema tension band running through all segments from a drive motor at the base. Each segment overlaps with the next by approximately 0.5 metres, so each 11-metre segment adds ~9.5 metres of net height. Five segments × 9.5 metres ≈ 95 metres, plus the base structure and top platform: 100 metres total.

**Segment locking:** A passive collet mechanism at each segment interface locks automatically when the segment reaches full extension. No active locking is required — the collects engage mechanically under the tension of the Dyneema band. This eliminates a class of potential failures (active lock mechanism failures) at the cost of making deliberate retraction impossible, which is acceptable since the mast is not designed to be retracted.

---

## Deployment Sequence

1. Motor at mast base activates, pulling Dyneema band
2. Innermost (top) segment rises first
3. Collet at top of second segment engages when first segment reaches full extension
4. Second segment begins to rise
5. Sequence continues until all 5 segments are locked in place
6. Solar curtain, wrapped around the mast during launch, unfurls as segments extend
7. Ka-band antenna at mast top deploys final
8. BSMs (pre-mounted on mast segments) activate after solar power is established

Estimated deployment time: 2–4 hours. The deployment is slow and controlled — rapid deployment risks dynamic loads that could damage the structure.

---

## Key Documents

| Document | Description |
|---|---|
| MAST-SEGMENTS.md | Individual segment design |
| MAST-SOLAR-CURTAIN.md | GaAs solar curtain power generation |
| MAST-BSM-BEAM-SENSOR-MODULE.md | Power delivery modules |
| MAST-ANCHOR-SPIKE.md | Anchor variant 1 |
| MAST-ANCHOR-PURE-BLOOM.md | Anchor variant 2 |
| MAST-ANCHOR-ADAPTIVE-BLOOM.md | Anchor variant 3 |
| MAST-ANCHOR-ROOTED-HYBRID.md | Anchor variant 4 (preferred) |
