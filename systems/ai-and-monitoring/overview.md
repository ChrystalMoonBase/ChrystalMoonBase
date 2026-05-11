# AI and Monitoring — Overview
## Chrystal Moon Base

**Status:** Concept proposal  
**Licence:** CC0

---

## The Role of AI in the Base

The AI monitoring system is the nervous system of the base. It watches everything, remembers everything, and alerts immediately when something is wrong.

This is not surveillance. It is the minimum viable safety architecture for an environment where a small failure can cascade into a life-threatening emergency faster than any human could detect and respond unaided.

The AI does not make governance decisions, does not control residents' behaviour, and does not override human judgment on non-safety matters. Its domain is the physical state of the base: pressure, temperature, atmosphere, structural integrity, power, water, robot status, and any parameter that could affect the survival of residents.

---

## Three AI Layers

**Layer 1 — Robot AI (distributed, onboard each robot):**
Real-time control of individual robot locomotion, tool head operation, and local fault response. See `systems/robot-cmb-r1/ai-onboard.md`.

**Layer 2 — Construction AI (mast-based computer):**
Swarm coordination, construction planning, quality control aggregation, power delivery management. See `systems/robot-cmb-r1/swarm-logic.md`.

**Layer 3 — Base AI (distributed across base network):**
Overall base monitoring, life support management, safety alert system, data relay to Earth. This document.

---

## Documents

| Document | Description |
|---|---|
| base-wide-monitoring.md | What is monitored and how |
| safety-systems.md | Emergency detection and response |
| privacy-policy-on-base.md | What is monitored where |
| data-relay-to-earth.md | Earth communication and oversight |
