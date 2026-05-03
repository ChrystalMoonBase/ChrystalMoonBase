# Dome Layer Architecture
## Chrystal Moon Base — Habitat System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

Every dome on the Chrystal Moon Base is a multi-layered composite structure. The layered approach is not an engineering luxury — it is a survival requirement. Each layer addresses a specific threat: radiation, micrometeorite impact, thermal extremes, pressure loss, and long-term material degradation. No single material can address all of these threats simultaneously. Multiple layers, each optimised for its specific role, provide the combined protection required for long-duration human habitation on the lunar surface.

The target dome count for a fully operational Phase 2 base is approximately 90–100 domes of varying sizes and functions. All domes share the same layer architecture. Differences between dome types are in size, internal configuration, and secondary support structures — not in the protective layer design.

---

## The Five-Layer System

Layers are listed from outside to inside — from the lunar environment toward the interior living space.

---

### Layer 1 — Sintered Basalt Shell

**Material:** Sintered lunar basalt  
**Thickness:** TBD by structural engineering  
**Function:** Primary structure, radiation shielding, micrometeorite protection

The outermost layer is sintered directly from the lunar regolith by CMB-R1 robots. It is not a manufactured component delivered from Earth — it is grown in place from the Moon's own material.

Sintered basalt provides:
- **Mass shielding against radiation** — the primary defence against galactic cosmic rays and solar energetic particles. The required thickness to achieve Mars-equivalent radiation levels inside is a function of basalt density and composition — this requires calculation with actual Peary regolith composition data, which is not yet available. Estimates suggest 2–5 metres of regolith equivalent for adequate shielding, though thinner layers combined with the water layer (Layer 4) provide substantial additional protection.
- **Micrometeorite protection** — the impact flux at the lunar surface is well characterised. The sintered shell must be thick enough that the largest expected impact within the dome's operational lifetime does not penetrate to Layer 2.
- **Structural load bearing** — the dome geometry distributes compressive loads efficiently. Basalt in compression is strong. The dome must also withstand internal pressure from the habitat atmosphere pressing outward.

**Critical design constraint:** All connections — power, data, water, air — pass through the floor, never through the dome wall or the shell. The shell has no penetrations. This is non-negotiable. Every penetration is a potential failure point. A dome with zero wall penetrations is structurally stronger and more reliable than one with cable entries, pipe fittings, or windows.

The dome is printed by robots using a moulding and sintering process. Molten glass (from Layer 3 printing, which happens simultaneously from inside) is not yet involved at this stage — the basalt shell is printed first as the structural form, then the inner layers are added.

---

### Layer 2 — Self-Sealing Gel

**Material:** Autonomic sealant — specific formulation is an open engineering question  
**Thickness:** TBD  
**Function:** Automatic sealing of micrometeorite penetrations

If a micrometeorite penetrates Layer 1, it may create a small hole that begins leaking the habitat atmosphere. Layer 2 is designed to seal such a hole automatically, without human intervention and without requiring depressurisation of the dome.

The concept is based on self-healing materials research — materials that contain a sealant in a dormant form and activate it on damage. Two approaches exist in current research:

**Microencapsulated sealant:** Tiny capsules distributed throughout the layer rupture when a projectile passes through. The released sealant flows into the breach and cures, sealing the hole. This approach is used in self-healing fuel tanks in military aircraft and has been researched for spacecraft hull applications by NASA and ESA.

**Interpenetrating polymer network:** A two-component system where components are kept separate until a crack or hole brings them into contact, triggering a chemical reaction that forms a solid seal. This approach has been demonstrated in laboratory settings.

**Honest assessment:** Neither approach has been demonstrated at the scale, temperature range, and vacuum conditions required for a lunar dome application. This layer is the most speculative element of the dome architecture. It is included because the concept is scientifically plausible and because the engineering questions it raises are specific and answerable through ground research. If no viable self-sealing material can be validated before dome construction begins, this layer may need to be replaced with an alternative approach — for example, a second sintered basalt layer or a Kevlar-based ballistic barrier.

This is flagged as a priority research question. Contributions from materials scientists are specifically invited.

---

### Layer 3 — Gold-Coated Glass

**Material:** High-purity glass with titanium fibre reinforcement and exterior gold coating  
**Thickness:** TBD  
**Function:** Radiation reflection, UV blocking, primary transparent barrier

This layer performs three functions simultaneously:

**Gold coating (exterior surface):** A thin-film gold coating on the outer glass surface reflects infrared and a portion of ultraviolet radiation — the same principle as the gold visor on astronaut helmets. Gold is chemically stable in vacuum, does not degrade under radiation, and has been used in spacecraft thermal control for decades. The coating is thin enough to remain partially transparent to visible light while significantly reducing the solar radiation load on the interior.

**Glass structure:** High-purity glass, manufactured from lunar silicon by the M-Glass processing module. The glass is printed in its molten state, inside-out, for maximum homogeneity and minimum defects. This printing method — starting from the inner surface and building outward — ensures that the optical quality of the interior face (which residents will look through) is the highest quality.

**Titanium fibre reinforcement:** As the glass is printed in its molten state, CMB-R1 robots lay continuous titanium fibre into the melt. The fibre is sourced from the M-Ti processing module. The resulting composite — titanium-reinforced glass — is significantly stronger in tension than plain glass, which is critical for a pressure vessel where the interior atmosphere pushes outward. The titanium and glass bond at the molecular level during the printing process. There are no interfaces, no adhesive layers, no weak joints. This is one continuous material.

---

### Layer 4 — Water

**Material:** Liquid water  
**Thickness:** TBD — engineering trade between radiation protection and structural load  
**Function:** Temperature regulation, radiation moderation

A layer of liquid water between the two glass layers serves two distinct purposes:

**Radiation moderation:** Water is an excellent moderator of neutron radiation and provides meaningful shielding against other particle radiation types. The hydrogen atoms in water are particularly effective at slowing and absorbing neutrons produced by cosmic ray interactions with the dome structure. A water layer of sufficient thickness makes a measurable contribution to reducing the radiation dose inside the dome.

**Temperature regulation:** The thermal mass of water buffers temperature fluctuations inside the dome. During the lunar day, the dome exterior heats; the water absorbs this heat slowly. During the lunar night (or during the brief illumination gaps at Peary), the water releases stored heat, moderating the interior temperature drop. This passive thermal regulation reduces the load on the dome's active heating and cooling systems.

**Water source:** All water for the dome layers comes from lunar sources — extracted from regolith processing and from nearby cold trap ice deposits. Water is accumulated over years of robotic operations before the first dome is pressurised. It is stored in underground sintered cisterns. No dome water needs to be imported from Earth.

**Freeze risk:** At Peary rim temperatures, water in a sealed layer could freeze during illumination gaps. The thermal design must ensure the water layer remains liquid under all expected operating conditions, or that freezing can be tolerated without structural damage. This is a specific engineering challenge that requires analysis.

---

### Layer 5 — Inner Glass with Anti-Decay Coating

**Material:** High-purity glass with interior transparent protective coating  
**Thickness:** TBD  
**Function:** Final pressure boundary, transparent interior surface, long-term chemical stability

The innermost layer is the surface that residents see and breathe against. It must be:

**Transparent:** Residents inside a habitat dome should be able to look up and see the lunar sky — stars during the long lunar night, the sun filtered through the outer layers during the day. This is not a luxury. Long-duration human habitation in enclosed spaces is psychologically demanding. A visible connection to the exterior environment matters.

**Pressure-tight:** The inner glass is the primary pressure boundary. It contains the habitat atmosphere — approximately Earth-normal pressure of nitrogen and oxygen. This means the inner glass is under constant outward pressure load, which the titanium fibre reinforcement in Layer 3 is partially designed to address.

**Chemically stable:** The interior atmosphere contains water vapour, carbon dioxide, trace organics, and other compounds produced by human habitation. Over years and decades, these can attack glass surfaces — fogging, etching, or depositing films that degrade optical quality and structural integrity. The anti-decay coating on the interior surface is a transparent protective layer — similar in concept to the coatings used on optical instruments and aquarium glass — that prevents this degradation. The specific formulation requires materials research for the specific chemical environment of a lunar habitat.

---

## Dome Construction Sequence

1. Robots sinter the basalt foundation ring and floor in the dome location
2. All underground connections (power, data, water, air) are routed and sealed before dome construction begins
3. The sintered basalt outer shell (Layer 1) is printed by robots, starting at the foundation ring and building upward
4. Simultaneously, from inside, the inner glass (Layer 5) is printed molten, inside-out, with titanium fibre being laid in continuously
5. Layer 3 (gold-coated glass with titanium reinforcement) is printed as a separate shell inside Layer 1
6. The gap between Layer 3 and Layer 5 is sealed to form the water cavity (Layer 4)
7. Layer 2 (self-sealing gel) is applied between Layer 1 and Layer 3
8. The water cavity is filled from the underground cistern supply
9. The dome is pressurised for the first time and leak-tested robotically before any human entry
10. Interior fit-out begins after pressure integrity is confirmed

---

## Dome Types

All domes use this layer architecture. The differences between dome types are:

| Type | Approx. Diameter | Occupancy | Notes |
|---|---|---|---|
| Sleep habitat | 8–12 m | 6–10 people | Smallest unit; breach survivable |
| Farm | 20–40 m | — | Larger span; optimised light transmission |
| Factory | Variable | — | Internal layout, no transparency required |
| Medical | 15–20 m | — | Highest cleanliness standard |
| Entertainment / social | 20–30 m | — | Open interior, gathering space |
| Research | 10–20 m | — | Specialised equipment mounts |
| Command | 15 m | — | Monitoring, communications |

Total target: **90–100 domes** across a fully operational Phase 2 base.

The small sleep habitat size — maximum 10 people — is a deliberate safety decision. If one dome fails catastrophically, the maximum loss is 10 people. The remaining residents are safe in their own domes, connected to the underground network. This is the same principle that drives the use of many small domes rather than a few large ones.

---

## Open Questions

1. **Layer 1 thickness** — what thickness of sintered Peary basalt achieves the radiation shielding target? Requires actual regolith composition data and Monte Carlo radiation transport modelling.
2. **Self-sealing gel** — is there a validated material that meets the temperature, vacuum, and activation requirements? This is a research question, not an engineering trade.
3. **Water layer freeze management** — what heating is required to prevent Layer 4 freezing, and what is the power cost?
4. **Titanium fibre printing** — what is the minimum radius of curvature that the titanium fibre can follow during molten glass printing without fracture or delamination?
5. **Inner coating formulation** — what transparent coating is stable against long-term exposure to a human habitat atmosphere in a lunar radiation environment?
6. **Structural load calculation** — the dome must resist internal pressure, thermal stress, and any surface loading. A full structural analysis is required before any dome geometry is finalised.
