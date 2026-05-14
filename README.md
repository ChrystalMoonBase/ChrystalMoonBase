# Chrystal Moon Base
## Official Open-Source Repository

**A concept proposal for a permanent Moon base built from local lunar materials by autonomous robots.**  
No flags. No patents. Built for all of humanity.

**Website:** https://chrystalmoonbase.com  
**Licence:** Hardware: CERN-OHL-S-2.0 · Documents: CC0 · Software: proprietary  
**Status:** Phase 0 — Earth demonstrators (concept and planning stage)  
**ESA OSIP:** Qualified — Open for Discussion · 2026

---

## What This Is

Chrystal Moon Base is an open-source concept for building a permanent human settlement on the lunar north pole (Peary Crater rim, 88.63°N) using:

- **Autonomous octopod robots** (CMB-R1) — 16 robots with fully integrated sensors, powered by laser beamed from a ~35-metre solar mast
- **In-situ laser sintering** — fusing lunar regolith into structural basalt floors, walls, and dome foundations
- **600 m² roll-out CIGS solar system** — two arms (9 m × 30 m each) providing ~104–143 kW continuous power
- **Local material processing** — 13 processing modules extracting glass, titanium, aluminium, oxygen, water, and other materials from the Moon itself
- **Multi-layer glass domes** — titanium-reinforced, self-sealing, water-shielded habitats for permanent human residents
- **Maglev transport** — connecting all base facilities and eventually all lunar provinces

This is not an engineering specification. It is a feasibility concept — every number is an estimate, every design is a starting point. The purpose of publishing it openly is so that people who know what they are talking about can review it, correct it, and improve it.

---

## The Founder

**Berechja Kerkdijk**  
Sittard / Hegelsom, Netherlands.  
No PhD. No laboratory. No investors.  
Just a man with a dream — researched and grounded in current science and technology.

---

## Key Specifications — Phase 0.2 Pod

| Parameter | Value |
|---|---|
| Launch vehicle | SpaceX Falcon Heavy |
| Pod diameter | ~4.6 m (octagonal inner frame) |
| Pod height (stowed) | ~11 m |
| Base plate | 1.0 m thick Al-Li 2099 isogrid |
| Fuel | MMH/NTO hypergolic |
| Mast height (deployed) | ~35 m (5 segments · 6th segment: open engineering question) |
| Mast material | Toray M55J CFRP + cyanate ester resin |
| Mast rotation | Magnetically levitated bearing (AMB/PMB) |
| Solar film | 2 × 9 m × 30 m roll-out CIGS = **600 m²** |
| Continuous power | **~104 kW** (conservative) — **~143 kW** (optimistic) |
| Laser output | ~10–20 kW class diode laser |
| Robot fleet | **16 CMB-R1 octopods** (2 per garage) |
| Garages | 8 × 2.0 m × 2.0 m × 1.5 m |
| BSM count | 5 (one per segment, at ~7 / 14 / 21 / 28 / 35 m) |
| Operational radius | **2+ km** from mast |
| Total mass (excl. robots) | **~4,200 kg** |
| Falcon Heavy TLI capacity | ~15,000 kg |
| **Mass margin** | **~10,800 kg** |

---

## Repository Structure

```
foundation/
  governance/           CMB authority, tenant model, Earth relationship
  location/             Why Peary Crater — site selection and data
  philosophy/           Open-source principles, civilisation blueprint

media/                  Pitch, technical, and vision one-pagers

roadmap/
  phase-0-earth/        Five Earth demonstrators (validation programme)
  phase-0_2-the-pod.md  First lunar mission concept
  phase-1-foundation.md Phase 1 — scaling up
  phase-2-the-city/     Phase 2 — first permanent human community
  phase-3-spaceport.md  Phase 3 — lunar spaceport
  phase-4-beyond.md     Phase 4 — beyond the Moon
  civilisation-blueprint/ Four provinces of a lunar civilisation

systems/
  pod/                  MAST-POD — mast, solar, laser, anchoring
  robot-cmb-r1/         CMB-R1 robot — chassis, legs, AI, swarm
  sintering/            Laser sintering physics and quality control
  processing-modules/   All 13 resource extraction modules
  domes/                Habitat dome architecture and construction
  life-support/         Atmosphere, water, food, radiation, gravity
  ai-and-monitoring/    Base AI, safety systems, privacy policy
  underground-network/  Tunnels, maglev, emergency shelters
  surface-access/       Decontamination sequence

public/                 Website source (chrystalmoonbase.com)
```

---

## Current Status

| Phase | Status |
|---|---|
| Phase 0 — Earth demonstrators | **Planning** — no hardware exists yet |
| Phase 0.2 — The Pod (first Moon mission) | Concept proposal |
| Phase 1+ | Long-term concept |

---

## How to Contribute

**Find an error:** Open a GitHub Issue. Specify the document, the incorrect claim, the correct value, and the source. This is the most valuable contribution possible.

**Improve a document:** Fork, edit, pull request. Explain what you changed and why.

**Write a missing document:** The structure lists many documents not yet written. Write one.

**Run a simulation:** Many open questions can be answered by simulation. Publish your method and results openly.

**You are an engineer or scientist:** Review the MAST-POD concept. Find the problems. Say so clearly.

**You represent a university, lab, or institution:** Phase 0 demonstrators need facilities, equipment, and expertise. The repository is the place to start that conversation.

Read [CONTRIBUTING.md](./CONTRIBUTING.md) for full guidelines.  
All contributors are credited in [CREDITS.md](./CREDITS.md).

---

## Philosophy

The ISS proved that former rivals can build what neither could alone.  
CERN proved that 23 nations can discover what one never would.  
Chrystal Moon Base aspires to that same principle.

The Moon belongs to all of us.  
This repository is our invitation to build it right.

---

## Contact

- **Email:** info@chrystalmoonbase.com
- **Website:** https://chrystalmoonbase.com
- **X:** [@chrystalbase](https://x.com/chrystalbase)

---

*No flags. No patents. No false promises.*  
*Just a question worth asking honestly — and a Moon worth building together.*  
🌙
