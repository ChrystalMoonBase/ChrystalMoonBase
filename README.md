# Chrystal Moon Base
## Official Open-Source Repository

**A concept proposal for a permanent Moon base built from local lunar materials by autonomous robots.**
No flags. No patents. Built for all of humanity.

**Website:** https://chrystalmoonbase.com
**Licence:** Hardware: CERN-OHL-S-2.0 · Documents: CC0 · Software: GPL-3.0
**Status:** Phase 0 — Earth demonstrators (concept and planning stage)
**ESA OSIP:** Qualified — Open for Discussion · 2026

---

## What This Is

Chrystal Moon Base is an open-source concept for building a permanent human settlement on the lunar north pole (Peary Crater rim, 88.63°N) using:

- **Autonomous octopod robots** (CMB-R1) — 16 robots powered by laser beamed from a ~35-metre solar mast
- **In-situ laser sintering** — fusing Peary highland regolith (anorthosite) into structural sintered glass-ceramic floors, walls, and dome foundations
- **600 m² roll-out CIGS solar system** — ~104–143 kW continuous power
- **Local material processing** — 13 processing modules extracting glass, titanium, aluminium, oxygen, water from the Moon
- **Multi-layer glass domes** — titanium-reinforced, self-sealing habitats for permanent human residents
- **Maglev transport** — connecting all base facilities

---

## The Founder

**Berechja Kerkdijk**
Sittard / Hegelsom, Netherlands.
No PhD. No laboratory. No investors.
Just a man with a dream — researched and grounded in current science and technology.

---

## CMB8LF v1 — Scale Prototype

The **CMB8LF v1** (Chrystal Moon Base 8 Legged Freaks, version 1) is a 1:3.5 scale prototype of the CMB-R1 lunar robot. It is the door that opens all other doors — a fully functional demonstrator that proves the concept physically.

**Key specifications:**
- 26× brushless BLDC motors with moteus r4.11 CAN controllers
- Distributed 22V power (25 independent battery nodes)
- Wave gait locomotion (maximum stability — 7 feet always grounded)
- Dual-laser palm: 808nm sinter + 976nm anneal (real glass powder sintering)
- 4-finger adaptive gripper: box grip / pincer / foot modes
- Bistable electromagnetic coupling (9 identical interfaces)
- All sensors in detachable head module
- Full vacuum compatibility (MoS₂ dry film · Si₃N₄ ceramic bearings · PEEK-CF)
- CAN bus internal · FSO laser communication external

**See:** `systems/CMB8LF_v1/`

---

## Repository Structure

```
foundation/
  governance/         CMB authority, tenant model, Earth relationship
  location/           Why Peary Crater — site selection and data
  philosophy/         Open-source principles, civilisation blueprint

media/                Pitch, technical, and vision one-pagers

roadmap/
  phase-0-earth/      Five Earth demonstrators (validation programme)
  phase-0.2-the-pod.md
  phase-1-foundation.md
  phase-2-the-city/
  phase-3-spaceport.md
  phase-4-beyond.md
  civilisation-blueprint/

systems/
  CMB8LF_v1/          ← Scale prototype robot (BUILD THIS FIRST)
    software/         All firmware (MicroPython + Python)
    cad/              All 3D models (OpenSCAD)
    docs/             BOM, assembly, shopping list
    diagrams/         Wiring, system overview
  robot-cmb-r1/       Lunar robot concept specification
  sintering/          Laser sintering physics
  pod/                MAST-POD — mast, solar, laser, anchoring
  processing-modules/ All 13 resource extraction modules
  domes/              Habitat dome architecture
  life-support/       Atmosphere, water, food, radiation, gravity
  ai-and-monitoring/  Base AI, safety systems
  underground-network/Tunnels, maglev, emergency shelters
  surface-access/     Decontamination sequence

public/               Website source (chrystalmoonbase.com)
```

---

## Current Status

| Phase | Status |
|---|---|
| Phase 0 — CMB8LF v1 prototype | **Active development** |
| Phase 0 — Earth demonstrators | Planning |
| Phase 0.2 — The Pod | Concept proposal |
| Phase 1+ | Long-term concept |

---

## How to Contribute

**Find an error:** Open a GitHub Issue.
**Improve a document:** Fork → edit → pull request.
**Build the prototype:** Follow `systems/CMB8LF_v1/README.md`
**You are an engineer:** Review the specifications. Find the problems. Say so clearly.

All contributors credited in `CREDITS.md`.

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
