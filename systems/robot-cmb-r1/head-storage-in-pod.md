# Tool Head Storage in Pod — Strategic Depot
## Chrystal Moon Base — Logistics Concept

**Status:** Concept proposal  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

---

## Overview

All 32 tool heads travel to the Moon inside the Pod. The Pod's storage chambers serve double duty: protecting the heads during launch and transit, and functioning as the permanent strategic head depot on the lunar surface for the entire operational life of the Pod.

**32 heads total:**
- 8 sintering heads
- 8 thermal buddy heads
- 8 bulldozer heads
- 8 watcher heads

8 heads are pre-installed on the 8 robots before launch. 24 heads remain in Pod storage as operational reserve.

---

## Why 32 — One Complete Set Per Robot

Every robot carries its assigned head to the Moon pre-installed. But every robot also has access to every other head type in the Pod. This means:

- Any robot can switch to any role at any time
- If a head type has a higher-than-expected failure rate, reserves are available
- The AI can reconfigure the entire fleet based on what the mission actually needs — not what was planned on Earth
- No robot is ever permanently assigned to a role it cannot change

This is not over-provisioning. It is the minimum required for a fully flexible autonomous fleet operating years from the nearest spare parts facility.

---

## Pod Storage Chambers

Each head is stowed in a dedicated chamber within the Pod structure. Chambers are:

- **Structurally protective** during launch (loads up to ~6g axial during Falcon Heavy ascent)
- **Thermally protective** during transit through deep space
- **Dust-sealed** after deployment — chamber doors close when not in use
- **Robot-accessible** — a robot approaching the Pod wall can extend its front arm-legs into the chamber, grip the head, and withdraw it autonomously

**Chamber orientation:** Each chamber opens outward from the Pod wall, at a height and angle accessible to a robot standing on the deployed bloom leaves. No human assistance required for any head retrieval or storage operation.

**Chamber door:** Protected by the same electromagnetic cover principle as the chassis coupling points — a basalt composite cover that moves aside only during access and closes again automatically. The sensitive interfaces inside are never exposed to the lunar environment unnecessarily.

---

## AI Depot Management

The swarm coordinator maintains a complete real-time inventory of the Pod depot:

- Which head is in which chamber
- Which heads are currently installed on which robots
- Which heads have been used and for how long
- Which heads have been flagged as damaged or retired
- Which heads are available for immediate deployment

When a configuration change is needed — whether AI-initiated or commanded from Earth — the swarm coordinator:
1. Identifies the optimal robot to perform the head swap
2. Routes that robot to the Pod
3. Guides the retrieval of the correct head from the correct chamber
4. Confirms successful installation before resuming the robot's task assignment

The Pod depot inventory is transmitted to Earth during every communication window. Mission controllers on Earth always have a current picture of the fleet's head inventory and configuration status.

---

## Head Return and Inspection

After use, heads returned to Pod storage are inspected by the Watcher robot before being classified as:

- **Operational** — returned to available inventory
- **Degraded** — flagged for monitoring, used only if no operational alternative exists
- **Retired** — stored permanently, not redeployed

A retired head is not discarded — it remains in its chamber. Its components may have diagnostic value, and its storage chamber space is more useful occupied than empty (an empty chamber is an unprotected opening).

---

## Long-Term Depot Evolution

As the base grows in later phases, the Pod depot will eventually be supplemented or replaced by purpose-built storage facilities produced from local materials. But for Phase 0.2, the Pod is the only depot — and it is designed to be sufficient for the entire Phase 0.2 operational lifetime.
