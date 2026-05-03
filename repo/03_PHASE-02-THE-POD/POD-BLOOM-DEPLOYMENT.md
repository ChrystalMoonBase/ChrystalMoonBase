# Pod Bloom Deployment
## Chrystal Moon Base — Phase 0.2 Technical Concept

**Status:** Concept proposal  
**Licence:** CC0

> This document describes a concept, not a tested design. The bloom deployment mechanism has not been prototyped. All descriptions are engineering proposals requiring ground validation.

---

## Overview

The Pod's outer structure consists of 8 rigid structural leaves arranged symmetrically around a central column. During launch and transit, these leaves form the outer shell of the Pod — protecting the robots and equipment inside. On landing, they unfold downward and outward in a controlled sequence, each leaf becoming a ramp from the Pod interior to the lunar surface.

This mechanism is called the Bloom. It was designed to solve four problems simultaneously:

1. **Landing stability** — leaves spread the footprint, reducing ground pressure and tipping risk
2. **Surface access** — each leaf is a ramp; no separate deployment mechanism needed
3. **Dust containment** — cloth between leaves seals the work area immediately on deployment
4. **Permanent anchoring** — leaves are sintered to the regolith by the robots as their first task, making the Pod a permanent fixture

---

## Leaf Structure

Each of the 8 leaves is a rigid composite panel, approximately trapezoidal in shape — wider at the base (ground end) than at the top (pod attachment end). The inner face carries a textured anti-slip surface for robot traction. The outer face is thermal-coated sintered basalt composite.

Each leaf is hinged at its attachment point to the central pod column. The hinge is a passive spring-loaded mechanism: on ground contact and structural release, springs drive the leaves downward. No powered actuator is required for deployment. Redundancy is built in — if one leaf fails to deploy fully, the remaining 7 still provide access and stability.

The leaves are sized so that when fully deployed, the outer edge of each leaf rests on the lunar surface and the inner face forms a ramp at an angle of approximately 20–30 degrees from horizontal — shallow enough for a loaded robot to ascend or descend safely.

---

## Dust Containment Cloth

Between each pair of adjacent leaves, a panel of Vectran fabric is attached along both leaf edges. Vectran is a liquid crystal polymer fibre with extremely high tensile strength, near-zero stretch, and proven performance in space environments — it was used in the Mars Pathfinder and MER rover airbag systems.

As the leaves deploy outward, the Vectran panels tension automatically. When the leaves reach their fully deployed position, the cloth is taut, forming 8 triangular panels between the leaves that together create a continuous sealed skirt around the pod base.

This sealed enclosure is not pressurised. It does not contain breathable atmosphere. Its sole purpose is to exclude lunar regolith dust from the working area directly around the pod. This matters because:

- Lunar dust is electrostatically charged and adheres to everything
- Sintering quality is compromised by loose dust contamination
- Robot joints, sensors, and head attachment mechanisms are protected from the worst dust exposure
- The first sintered surface (the leaves themselves) is produced in a cleaner environment

The cloth does not need to be airtight — gaps at ground level are acceptable. The goal is dust reduction, not dust elimination.

---

## v2.5 Levelling Configuration

In the standard configuration, leaves deploy to a pre-set angle and rest on whatever surface they find. On uneven terrain, this may result in some leaves being higher than others, creating an unlevel working platform.

The v2.5 configuration adds a variable-angle hinge with a locking mechanism. Before sintering, robots can adjust individual leaf angles — raising or lowering the outer edge — to level the overall platform. Once levelled to within an acceptable tolerance, the locking mechanism engages and the leaves are sintered in that position.

This adds mechanical complexity to the hinge but significantly improves operational outcomes on terrain that is not perfectly flat. Given the uncertainty in landing site topography at the 1–10 metre scale, the v2.5 configuration is the preferred design for the first Pod.

The levelling mechanism must be validated in ground testing under simulated lunar gravity (1/6 g) and temperature conditions before being included in a flight design.

---

## Bloom Deployment Sequence

**T+0** — Pod confirms surface contact. Landing legs lock.  
**T+0:30** — Structural release command sent to leaf hinges.  
**T+0:30 to T+1:00** — Leaves unfold under spring force. Vectran cloth tensions as leaves spread.  
**T+1:00** — Leaves at full deployment angle. Cloth fully tensioned.  
**T+1:00 to T+3:00** — v2.5 levelling adjustment (if required). Robots remain inside.  
**T+3:00** — Leaves locked in final position. Mast deployment begins.  
**T+5:00 (estimated)** — First solar power. Robots begin charging.  
**T+5:00 to T+53:00 (estimated)** — Robots power on sequentially. First task: sinter all 8 leaves to the lunar floor.  
**T+53:00+** — Leaves permanently anchored. Pod is stable. Outward sintering begins.

Times are estimates. Actual sequence depends on illumination geometry at landing, robot charging time, and leaf sintering rate.

---

## Why Permanent Anchoring

The leaves are not designed to be retracted or reused. Once sintered to the regolith, they become part of the lunar surface — a permanent extension of the Pod structure.

This is intentional. Retraction mechanisms add mass, complexity, and failure modes. The Pod is not designed to return to Earth. There is no mission scenario in which retractable leaves provide an advantage over permanent sintered anchors.

The sintered leaf-to-regolith bond provides:
- Resistance to toppling from robot vibration, cargo loading, or seismic events
- A permanent level platform for ongoing operations
- The first demonstration that sintered basalt can bond structural hardware to the lunar surface — a proof of concept for all future construction

---

## Open Questions

The following aspects of the Bloom deployment require ground validation and engineering input:

1. **Spring force calibration** — leaves must deploy reliably in 1/6 g, after months of cold soak at launch temperatures, and after vibration loads during ascent and landing
2. **Vectran cloth attachment** — the cloth must remain attached to leaf edges through all load cases and tension correctly on deployment
3. **Hinge dust tolerance** — hinges that function during deployment must also resist dust ingress over years of operation
4. **Sintering bond strength** — the bond between a composite leaf underside and sintered regolith has not been tested at scale
5. **Levelling accuracy** — the v2.5 variable hinge must achieve level tolerance within the required limit before locking

Engineers with experience in deployable space structures, composite hinges, or regolith mechanics are invited to engage with these questions via GitHub Issues.
