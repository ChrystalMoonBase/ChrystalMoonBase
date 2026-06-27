# Spare-Parts & Tool Storage in Pod — Strategic Depot

## Chrystal Moon Base — Logistics Concept

**Status:** Concept proposal  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

> **Supersedes an earlier "head depot" model.** An older version of this document
> described the Pod storing **32 interchangeable role-heads** (sintering / thermal-buddy
> / bulldozer / watcher), 8 per robot, where a robot changed role by swapping its head.
> That model is **superseded**. In the current design the 16 robots are **identical with
> everything integrated** (all sensors + sintering laser + infrared annealing), and role
> is set by **software task assignment**, not by swapping heads (see `swarm-logic.md` and
> `overview.md`). The Pod is therefore **not** a head depot. It is a **spare-parts and
> heavy-tool depot** — which is what this document now describes.

---

## Overview

The Pod's storage chambers serve double duty: protecting hardware during launch and
transit, and functioning as the permanent strategic **spare-parts and tool depot** on
the lunar surface for the entire operational life of the Pod.

Because every robot already carries its full sensing/sintering/annealing capability
built in, there are no role-heads to store. What the depot holds instead is what the
fleet genuinely needs to keep 16 robots working for years with no resupply:

**What the depot stores:**
- **Heavy tools** — bulldozer blades and digger tools, the only items a robot physically
  swaps onto its EPM arm interface (see `tools/README.md`). A working stock plus spares.
- **Spare legs** — complete 3-segment leg assemblies, so a robot that loses a leg can be
  restored to 8 legs by a Watcher-tasked robot rather than running indefinitely degraded.
- **Spare integrated modules** — replaceable sub-assemblies of the integrated head
  (optics, sensor packs, laser module) for in-field repair of an otherwise healthy robot.
- **Consumable/wear parts** — EPM tool plates, dust seals, and similar items expected to
  wear over a multi-year mission.

The exact quantity of each is an open logistics question, bounded by the Pod's mass and
volume margin (the Pod has a large margin — see `../pod/overview.md`). The principle is
*carry enough spares to survive expected attrition without resupply;* the numbers are an
engineering decision for a later phase, once real failure rates are known.

---

## Why a Spare Depot at All

On the Moon there is no repair crew and no parts shop. With 16 identical robots, the
fleet can absorb the loss of a robot (it is one-sixteenth of capacity), but it is far
cheaper to **repair** a robot than to lose it. A stocked depot means:

- A lost leg is replaced, not permanently lost — the robot returns to full capability.
- A degraded integrated module (a failed optic, a weak laser) can be swapped for a spare
  rather than retiring the whole robot.
- Heavy tools (blade, digger) are shared across the fleet from a common rack — no robot
  carries one it is not currently using.
- A dead robot beyond repair becomes a **parts donor** (see `failure-modes-and-degradation.md`),
  and its harvested legs/modules re-enter the depot.

This is not over-provisioning. It is the minimum required for a fully autonomous fleet
operating years from the nearest spare-parts facility.

---

## Pod Storage Chambers

Each spare item is stowed in a dedicated chamber within the Pod structure. Chambers are:

- **Structurally protective** during launch (loads up to ~6g axial during Falcon Heavy ascent)
- **Thermally protective** during transit through deep space
- **Dust-sealed** after deployment — chamber doors close when not in use
- **Robot-accessible** — a robot approaching the Pod wall can extend its front arm-legs into the chamber, grip the part or tool, and withdraw it autonomously

**Chamber orientation:** Each chamber opens outward from the Pod wall, at a height and angle accessible to a robot standing on the deployed bloom leaves. No human assistance required for any retrieval or storage operation.

**Chamber door:** Protected by the same electromagnetic cover principle as the chassis coupling points — a sintered-regolith composite cover that moves aside only during access and closes again automatically. The sensitive interfaces inside are never exposed to the lunar environment unnecessarily.

> Heavy tools (blades, diggers) may also be kept in an external tool rack near the work
> area rather than only inside the Pod, since they are swapped frequently during normal
> operation — see `tools/README.md`. The Pod chambers are best suited to the items that
> are retrieved rarely and must stay clean: spare legs, integrated modules, and wear parts.

---

## AI Depot Management

The swarm coordinator maintains a complete real-time inventory of the depot:

- Which spare part or tool is in which chamber
- Which heavy tools are currently fitted on which robots
- Which spares have been used, and how much working stock remains
- Which returned parts have been flagged as degraded or retired
- Which spares are available for immediate use

When a repair or tool change is needed — whether AI-initiated or commanded from Earth — the swarm coordinator:
1. Identifies the optimal robot to perform the repair or tool fit (often a Watcher-tasked robot)
2. Routes that robot to the Pod or the external tool rack
3. Guides retrieval of the correct part or tool from the correct chamber
4. Confirms successful installation before resuming the robot's task assignment

The depot inventory is transmitted to Earth during every communication window. Mission controllers on Earth always have a current picture of the fleet's spare-parts and tool status.

---

## Return and Inspection

Parts and tools returned to storage are inspected (by a Watcher-tasked robot) before being classified as:

- **Operational** — returned to available inventory
- **Degraded** — flagged for monitoring, used only if no operational alternative exists
- **Retired** — stored, not redeployed

A retired part is not discarded — it remains stored. Its components may have diagnostic
or donor value, and an occupied chamber is more useful than an empty one (an empty
chamber is an unprotected opening).

---

## Long-Term Depot Evolution

As the base grows in later phases, the Pod depot will eventually be supplemented or
replaced by purpose-built storage facilities produced from local materials. But for
Phase 0.2, the Pod is the only depot — and it is designed to be sufficient for the
entire Phase 0.2 operational lifetime.
