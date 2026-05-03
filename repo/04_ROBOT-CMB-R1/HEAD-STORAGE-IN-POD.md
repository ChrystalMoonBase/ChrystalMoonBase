# Tool Head Storage in Pod
## Chrystal Moon Base — Logistics Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Overview

The Pod carries a full set of all four head types — plus spares — in dedicated storage chambers within the pod structure. These chambers serve double duty: protecting the heads during launch and transit, and serving as the permanent head depot on the lunar surface.

---

## Chamber Design

Each head is stowed in a dedicated chamber within the pod structure. The chamber provides:
- Structural protection during launch vibration (loads up to ~6g axial, ~2g lateral during Falcon Heavy ascent)
- Thermal protection during transit (deep space temperatures)
- Dust exclusion after deployment (chamber doors seal against the lunar environment when not in use)
- Accessibility for robots after deployment (chamber orientation and depth allow robot front limbs to reach in and retrieve the head)

**Chamber orientation:** Vertical, with the head stored horizontally inside and the opening facing outward from the pod wall. A robot approaching the pod wall can extend its front limbs into the chamber, grip the head, and withdraw it.

**Chamber door:** A spring-loaded dust cover closes the chamber between uses. The robot pushes it open with the same front limb approach. The door has no latch — spring tension alone keeps it closed.

---

## Storage Inventory (Proposed)

The first Pod carries:

| Head Type | Primary Units | Spare Units | Total |
|---|---|---|---|
| Sintering | 2 | 1 | 3 |
| Thermal Buddy | 2 | 1 | 3 |
| Bulldozer | 2 | 1 | 3 |
| Watcher | 2 | 1 | 3 |
| **Total** | **8** | **4** | **12** |

Eight heads are pre-installed on the 8 robots before launch. Four spare heads are stored in pod chambers. Any robot can retrieve a spare head if its current head fails.

The specific head types brought as spares (vs. additional primary heads) is an engineering trade based on failure probability estimates for each head type.

---

## Head Return

After use, heads are returned to pod storage chambers for maintenance inspection by the Watcher robot before being returned to service. A head that shows signs of significant wear or damage is retired (left in storage) and a spare is used.

No in-field repair of heads is possible — they are treated as line-replaceable units.
