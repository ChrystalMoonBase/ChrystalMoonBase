# MAST-POD v2.0 — Pure Bloom (The Blooming Anchor)
## Chrystal Moon Base · Pod Architecture
**Status:** Concept — engineering review required  
**Part of:** [PHASE-02-The-Pod.md](../01_mission-architecture/PHASE-02-The-Pod.md)  
**License:** CC BY 4.0  

---

> *The lightest variant. The largest platform. The longest sintering window. Everything is a trade-off.*

---

## Philosophy

v2.0 eliminates the heavy penetrator entirely and replaces it with a large-area soft landing. Eight hinged ribs unfold like an opening flower, creating an immediate 26.5-metre working platform. The robots sinter a continuous basalt ring around the perimeter over approximately 5 months.

The trade-off is the most demanding site selection requirement of all four variants — and the longest period of vulnerability before the structure is permanently anchored.

---

## Key Specifications

| Parameter | Value | Notes |
|---|---|---|
| Wet mass | ~10,700–10,900 kg | Lightest variant |
| Footprint diameter | 26.5 m | Largest working area |
| Stabiliser nose mass | 80 kg | Lightweight titanium |
| Touchdown velocity | <1 m/s | Very soft landing required |
| Time to basic stability | Hours | Bloom deployment |
| Time to permanent anchor | ~5.1 months | Full perimeter ring |
| Sintering volume | ~6 m³ | Continuous perimeter ring |
| Ring dimensions | 0.3 m wide × 0.25 m deep | |
| Terrain tolerance | Lowest | Requires largest flat zone |
| Mechanical complexity | Medium | 8 hinged rib segments |

---

## How It Works

The pod descends to a very soft touchdown at low vertical velocity. An 80 kg stabiliser nose makes first contact, preventing tipping while the shells deploy. Eight hinged ribs unfold simultaneously — between each pair, a Vectran fabric panel pulls taut, forming a 26.5-metre dust-free circle on the regolith.

The robots walk out along the ribs and immediately begin sintering the outer edge: 0.3 metres wide, 0.25 metres deep, approximately 6 cubic metres of regolith fused into solid basalt.

### Sintering Energy Calculation

```
Ring sintering: 6 m³ × 8,000 kWh/m³ ÷ 13.5 kW optical ≈ 3,556 hours ≈ 5.1 months
```

*The 8,000 kWh/m³ figure is derived from laboratory experiments at sintering temperatures of approximately 1,180°C. This figure carries significant uncertainty and must be validated by Phase 0 ground tests.*

---

## What Makes It Credible

The mass saving of approximately 1,000 kilograms compared to v1 is real and substantial. The 26.5-metre footprint provides dramatically greater stability for the 100-metre mast than any penetrator design. The sintered ring, once complete, is permanent and load-bearing.

Deployable structural shells with integrated fabric panels have heritage in satellite solar arrays and deployable antenna systems.

---

## What Makes It Difficult

The 26.5-metre deployment zone must have an average slope of less than 2 degrees across the full diameter and be free of rocks larger than 20 to 30 centimetres. This is a demanding requirement — whether zones of this quality reliably exist at candidate Peary rim peaks must be confirmed from orbital reconnaissance before committing to this variant.

Vectran fabric has shown filament breakage in vacuum chamber tests with lunar simulant. Coatings are recommended but add mass and complexity. The 5-month sintering window is a long period of vulnerability — the structure relies on shell geometry alone until the ring is complete.

---

## Primary Risk

**Site flatness requirement combined with 5-month vulnerability window.**  
Finding and confirming a suitable 26.5-metre flat zone at a specific Peary rim peak requires detailed pre-landing reconnaissance. Even with confirmation, 5 months of relying on unsintered shell geometry is a significant risk exposure.

---

## Best Suited For

Missions where mass and launch cost are the primary constraints, site selection can be done with high confidence, and the 5-month sintering timeline is acceptable.

---

## Open Questions for Engineers

1. What is the probability of finding an acceptable 26.5m flat zone at Peary rim peaks based on LRO LOLA data?
2. What Vectran coating provides the best abrasion resistance at −150°C in lunar vacuum?
3. What is the fatigue life of the sintered basalt ring under repeated thermal cycling?
4. Can the hinge deployment sequence be made reliable after months of cold soak at −150°C?

---

## References

1. Vectran fabric vacuum performance — Honeywell Advanced Fibers technical data.
2. Fateri et al. (2019) — Sintering energy at laboratory scale, Scientific Reports.
3. LRO LOLA topographic data — Peary Crater rim peak analysis.
4. Deployable structure heritage — ESA SENER deployable antenna programmes.

---

*See also: [POD-v1-The-Spike.md](POD-v1-The-Spike.md) · [POD-v21-Adaptive-Bloom.md](POD-v21-Adaptive-Bloom.md) · [POD-v25-Rooted-Hybrid.md](POD-v25-Rooted-Hybrid.md)*  
*Chrystal Moon Base · chrystalmoonbase.com*
