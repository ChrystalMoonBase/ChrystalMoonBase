# CMB8LF-L1 — Digger Tool Concept

**Chrystal Moon Base · Phase 1.2 (Underground Infrastructure)**
**Status:** Concept proposal — no prototype exists. This is an open question, not a specification.
**Licence:** CC0

---

## Context

The CMB8LF-L1 sintering laser is integrated into the arm-legs. The digger tool is one of only two EPM-swapped tools (the other being the bulldozer blade). It is needed only for underground construction in Phase 1.2+. Until then, all sixteen robots operate with their integrated sintering lasers and W-Re arm-tips as their primary working instruments.

---

## 1. What this document is

This document describes a possible digging tool for the CMB8LF-L1 octopod robot, intended for constructing underground tunnels in later mission phases. It is not an engineering specification. All numbers are preliminary estimates based on publicly available NASA research. We publish it openly for review and correction.

---

## 2. Why a separate digger?

The bulldozer blade is good for grading loose regolith. The sintering laser is for melting surfaces. But underground construction requires a tool that can dig into the ground, break up compacted material, and move it away.

The digger tool is needed only during the underground network phase (Phase 1.2+). It is stored in the garage or in an external tool rack until that time.

---

## 3. Excavation mechanism: bucket drum

NASA has developed several lightweight lunar excavators, notably RASSOR and IPEx. Both use a counter-rotating bucket drum design that we take inspiration from.

| Feature | Description |
|---|---|
| Two counter-rotating drums | Rotating in opposite directions cancels reaction forces, allowing digging in low gravity without the robot being pushed away. |
| Hollow cylindrical scoops | Each drum has hollow scoops that collect regolith as they rotate, then reverse to dump it. |
| Known mass range | IPEx is a 30 kg-class excavator; its digging hardware is only part of that mass. |
| Dust-tolerant design | Uses sealed motors and harmonic drives to keep dust out of critical mechanisms. |

---

## 4. Physical description

The digger consists of two drum assemblies mounted to a frame. The frame attaches to the robot's front two arm-legs via the EPM interface.

| Parameter | Estimate | Notes |
|---|---|---|
| Width | ~1.0 m | Slightly narrower than the robot to fit in tunnels |
| Height | ~0.4 m | Drum diameter, based on scaled-down RASSOR-style drums |
| Depth | ~0.5 m | Length of the drums, enough to contain scoops |
| Estimated mass | ~25–30 kg | A rough guess, based on scaling IPEx components |
| Drums / frame | Al-Mg-Sc alloy | Same alloy as the bulldozer blade for consistency |
| Cutting edges | PCD-tipped tungsten carbide, non-magnetic binder | See Section 5 |

---

## 5. Robot stability during digging

The original concern — whether a walking robot can generate enough ground reaction force to operate a digging drum — is substantially addressed by two design features of the CMB8LF-L1 chassis. This section updates the assessment.

### Counter-rotating drums cancel horizontal reaction forces internally

The key insight inherited from RASSOR is that the two drums rotate in opposite directions. The horizontal forces they generate are equal and opposite, and largely cancel before being transmitted to the robot frame. The net horizontal force the robot's legs must resist is therefore a fraction of the total cutting force. This is the principal reason this design was chosen over a single-drum or auger approach.

### Wide-foot snowshoe design provides stable ground contact

The CMB8LF-L1 feet use a broad, flat contact plate analogous to a snowshoe rather than a narrow point or spike. On loose lunar regolith, a narrow foot sinks under the reaction load of the digging operation. The wide foot distributes the load over a larger area, maintaining a stable stance. In 1/6 g, ground pressure is already low; the wide-foot design preserves this advantage.

### Six remaining legs optimally positioned for maximum stability

While the two front arm-legs carry the digger frame, the remaining six legs are free to assume the most stable possible configuration. Each leg has at least three joints, giving it full three-dimensional freedom. The legs can:

- Splay outward to maximise the support polygon against tipping moments.
- Lower the robot's centre of mass close to the ground surface.
- Pre-load each wide foot vertically against the regolith before the drums engage, maximising the available friction force.

The combination of three effects — internally cancelled drum forces, wide feet preventing sinkage, and six legs positioned for maximum friction — means the robot can sustain continuous drum operation without sliding or tipping.

**This was an open question in the previous version of this document. Based on this structural analysis, it is now an engineering verification task rather than a fundamental feasibility question.**

What remains unknown: the exact values of regolith friction coefficient and bearing capacity at the Peary rim sites. These must be measured in Phase 0 ground tests.

---

## 6. Material for cutting edges: non-magnetic tungsten alloys

The cutting edges of the bucket drums are the parts that directly contact abrasive regolith. They must be hard, wear-resistant, non-magnetic, and stable in vacuum. Four candidate material families are identified below. We do not know which is best; we present them as questions for experts.

### Polycrystalline Diamond (PCD) on tungsten carbide substrate

PCD is synthetic diamond, extremely hard and non-magnetic. It can be bonded to a tungsten carbide body. The carbide binder must be non-magnetic (e.g., nickel instead of cobalt). This combination is already used in terrestrial mining and has been tested in lunar drilling experiments.

**Open question:** Can PCD cutters survive the impact and vibration of a walking robot? PCD is brittle. The dynamic forces — particularly from wide-foot contact and six-leg stance changes during drum operation — need to be characterised.

### Tungsten-Nickel-Copper (W-Ni-Cu) heavy alloys

These are explicitly non-magnetic and used in aerospace applications where magnetic interference must be avoided. Tungsten provides hardness (~90% of the composition), while nickel and copper form a ductile binder phase. They are machinable and corrosion-resistant.

**Open question:** Is W-Ni-Cu hard enough for continuous regolith excavation, or would it wear too quickly? Would a PCD coating on top be necessary?

### Tungsten-Rhenium (W-Re) alloys

Adding rhenium (3–25%) dramatically improves ductility and lowers the brittle-to-ductile transition temperature by about 100°C. W-3%Re shows 10–35% higher elongation than pure tungsten. Rhenium is non-magnetic.

**Open question:** Is the improved toughness worth the cost and manufacturing complexity for a one-time mission? Could W-Re be used for the entire drum, or only for cutting inserts?

### Refractory High-Entropy Alloys (RHEAs)

Modern tungsten-based RHEAs achieve yield strengths above 1.6 GPa with plastic strain over 14.7% at room temperature — a strength-ductility balance previously impossible for tungsten. Some formulations reach 2.15 GPa strength with 15% ductility. This is bleeding-edge research.

**Open question:** Are RHEAs mature enough to be considered for a lunar mission, or are they still too experimental? Can they be manufactured without any ferromagnetic contaminants?

### Chemical stability note

Pure tungsten is highly chemically stable: it does not rust, does not react with most materials at room temperature, and only begins to oxidise above 500–600°C. In lunar vacuum, oxidation is impossible. Whether the same applies to the nickel or copper binder phases in heavy alloys needs verification.

---

## 7. Power and control

The drum motors are electrically driven. Power comes from the robot's internal batteries, which are continuously recharged via laser power beaming from the mast. The robot's onboard AI controls excavation depth, drum rotation speed, and dumping cycles.

Actual power consumption is unknown until drum size and regolith hardness are better defined.

---

## 8. Attachment and storage

The digger uses the same EPM interface as the [bulldozer blade](./bulldozer-blade.md). The robot docks its front arm-legs to two EPM-compatible plates on the digger frame and activates the magnets. No power is needed to maintain attachment.

**Storage:** During the main construction phase, the digger is stored in an external tool rack near the landing zone. Each garage could accommodate one digger instead of one bulldozer blade if required. The swap procedure is identical to the bulldozer blade.

---

## 9. Speculative digging sequence for tunnels

This sequence is speculative and requires testing:

1. The robot picks up the digger and walks to the tunnel entrance.
2. The robot positions its six free legs in the maximum-stability configuration — wide feet pre-loaded against the surface, low centre of mass, legs splayed for maximum support polygon.
3. The front arm-legs lower the drum assembly to the ground.
4. Counter-rotating drums engage, breaking up regolith and collecting it in the scoops.
5. The robot reverses periodically to dump collected regolith to the side.
6. A sintering robot follows, fusing tunnel walls and ceiling into solid sintered regolith.

---

## 10. Open questions

Updated from the previous version. The fundamental feasibility question about robot stability is reclassified — see Section 5.

| Question | Status / Why it matters |
|---|---|
| Can the robot generate enough reaction force to dig? **[UPDATED]** | Addressed in principle by design: counter-rotating drums cancel most horizontal force; wide feet prevent sinkage; six-leg positioning maximises friction. Requires verification via regolith mechanics simulation and Phase 0 ground test. |
| What is the optimal snowshoe foot width? | Wider improves stability but adds mass. Needs optimisation study against expected Peary rim regolith properties. |
| How much dust does digging generate? | Dry regolith in vacuum produces a long-settling dust cloud that may interfere with laser power beaming and nearby robots. Mitigation strategies not yet defined. |
| What is the optimal drum rotation speed in 1/6 g? | Too fast throws regolith away; too slow doesn't collect. Needs simulation and physical testing with simulant. |
| How long before cutting edges need replacement? | Lunar regolith is extremely abrasive. A tool-change strategy and material lifetime testing are needed. |
| Which tungsten alloy is best for cutting edges? | Four candidate families listed (PCD/WC, W-Ni-Cu, W-Re, RHEAs). Each has tradeoffs in hardness, toughness, mass, and cost. Real-world testing with lunar simulant is essential. |
| Can the digging drums shape semi-molten regolith (anorthosite)? | If drum surfaces were high-temperature tungsten alloy (melting point >3400°C), could they mould a freshly sintered tunnel surface before it fully cools? Would hot regolith stick? A question for materials engineers. |
| Can all tool materials be verified non-magnetic? | Even trace ferromagnetic contamination from manufacturing (e.g., cobalt in carbide, iron in fasteners) could attract magnetic lunar dust. A full material audit is needed. |
| Can the sintering robot follow closely during digging? | Coordination between digger and sinterer — heat, falling regolith, and dust — is an unsolved problem. |

---

**Repository:** [github.com/ChrystalMoonBase/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)
**Contact:** info@chrystalmoonbase.com
