# MAST-POD v2.1 — Adaptive Bloom (Self-Leveling Bloom)
## Chrystal Moon Base · Pod Architecture
**Status:** Concept — engineering review required  
**Part of:** [PHASE-02-The-Pod.md](../01_mission-architecture/PHASE-02-The-Pod.md)  
**License:** CC BY 4.0  

---

> *The same large platform as v2.0 — but it adapts to the terrain instead of demanding perfection from it.*

---

## Philosophy

v2.1 retains the 26.5-metre platform and mass efficiency of v2.0 but adds compliant footpads or flexures at each rib tip. These absorb local height differences and allow the rib ends to conform to uneven terrain without tilting the mast. Optional low-power actuators can trim individual rib positions after contact.

The trade-off is increased mechanical complexity — more hinges, more potential failure modes, more components that must survive lunar conditions.

---

## Key Specifications

| Parameter | Value | Notes |
|---|---|---|
| Wet mass | ~10,900–11,200 kg | +150–300 kg vs v2.0 |
| Footprint diameter | 26.5 m | Same as v2.0 |
| Touchdown velocity | <1 m/s | Very soft landing required |
| Platform leveling | <0.5–1° final tilt | Even on 4–7° average slopes |
| Terrain tolerance | Medium-High | Handles local variations up to ~8–10° |
| Time to basic stability | Hours | Bloom + leveling |
| Time to permanent anchor | ~5.1 months | Same ring as v2.0 |
| Sintering volume | ~6 m³ | Continuous perimeter ring |
| Mechanical complexity | Medium-High | 8 ribs + compliant footpads + optional actuators |

---

## How It Works

Identical to v2.0, with one critical addition: compliant footpads or flexures at each rib tip absorb local height differences, allowing the rib ends to conform to uneven terrain without tilting the mast. Optional low-power lead-screw actuators can trim individual rib positions after contact, leveling the platform to within 0.5 to 1 degree on slopes averaging 4 to 7 degrees. The Vectran panels include abrasion-resistant coatings. The sintering sequence is identical to v2.0.

---

## What Makes It Credible

The 150 to 300 kilogram mass penalty buys substantially better terrain tolerance. Where v2.0 requires a nearly perfect 26.5-metre flat zone, v2.1 can work on slopes averaging up to 7 degrees — a dramatically larger pool of candidate sites on the Peary rim.

Graceful degradation is a genuine structural advantage: if one rib mechanism fails during deployment, the remaining seven provide a 7/8-complete platform that retains the overwhelming majority of the stability benefit.

---

## What Makes It Difficult

Every hinge, actuator, and flexure must survive months of cold soak at −150°C, launch vibration, and touchdown shock — all in lunar vacuum without human maintenance. Eight independent compliant footpads, each potentially with an active trim actuator, is a meaningful step up in mechanical complexity.

The fabric must accommodate small post-bloom movements as footpads settle. The 5-month sintering window is unchanged from v2.0 — the larger terrain tolerance does nothing to accelerate the anchoring.

---

## Primary Risk

**Hinge and actuator reliability in lunar vacuum at extreme temperatures.**  
Every additional mechanism is an additional failure mode. The question is not whether any individual component is reliable — it is whether all of them are reliable simultaneously, over a multi-month mission, without maintenance.

---

## Best Suited For

Missions wanting the largest possible clean working area with better real-world terrain adaptability than v2.0, and willing to accept higher mechanical complexity to achieve it.

---

## Open Questions for Engineers

1. What dry-film lubricant or bearing design maintains acceptable performance across −150°C to +120°C in vacuum?
2. Is passive spring deployment sufficiently reliable, or does active deployment add necessary margin?
3. What is the maximum post-bloom movement the Vectran fabric can accommodate without tearing?
4. What actuator technology provides 0.5° leveling precision at the required torque in lunar conditions?

---

## References

1. Vectran fabric vacuum performance and abrasion resistance data.
2. Dry-film lubricant performance in lunar vacuum — MoS₂ and PTFE heritage data.
3. ESA deployable structure qualification programmes — cold soak and vibration testing.
4. LRO LOLA — Peary rim slope distribution analysis.

---

*See also: [POD-v1-The-Spike.md](POD-v1-The-Spike.md) · [POD-v20-Pure-Bloom.md](POD-v20-Pure-Bloom.md) · [POD-v25-Rooted-Hybrid.md](POD-v25-Rooted-Hybrid.md)*  
*Chrystal Moon Base · chrystalmoonbase.com*
