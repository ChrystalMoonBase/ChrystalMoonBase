# CMB8LF-L1 — Bulldozer Task (Swappable Heavy Tool)
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

> **Terminology updated (was "Bulldozer head").** The bulldozer blade is **one of only two
> heavy tools** a robot still physically swaps on (the other is the digger) — but it mounts on
> the **EPM arm-leg interface**, not as a role-defining "head," and it lives on a shared tool
> rack (see `tools/README.md`, `tools/bulldozer-blade.md`). "Bulldozer" is therefore a **task**
> a robot performs while the blade is fitted, assigned in software (`swarm-logic.md`) — not a
> permanent robot type that "leads a 4-robot team." The grading detail below remains valid.

---

## Role

A robot assigned the bulldozer task — with the blade fitted via its EPM arm interface —
prepares the regolith surface for sintering. Raw lunar regolith is too rough and too loosely
compacted for high-quality sintering. The blade clears rocks, grades the surface to a
consistent level, and compacts the regolith — creating the prepared surface a sintering robot
needs. When grading is done, the robot returns the blade to the rack and resumes integrated
work.

---

## Design Concept

**Blade configuration:** Two curved blades mounted at the front of the head, angled outward in a V-pattern. The V-shape directs material to the sides of the robot's path rather than piling it up ahead. This is the same principle as a road grader.

**Blade material:** The blades contact the regolith continuously and will experience significant wear. Candidate materials: sintered regolith composite (replaceable, made from local material in later phases), tungsten carbide-tipped steel (Earth-supplied, high wear resistance).

**Compaction plate:** Behind the blades, a flat compaction plate vibrates at low frequency to compact the graded regolith. Compaction improves the density and uniformity of the surface, which affects sintering quality.

**Rock handling:** Rocks above the maximum acceptable size for sintering (~5–10 cm) are pushed aside by the blades. Larger rocks that cannot be moved are reported to the Watcher, which flags the area for a rerouted sintering path.

---

## Operating Parameters (Estimated)

| Parameter | Estimate |
|---|---|
| Blade width | 0.8–1.2 m |
| Grading depth | 2–5 cm of surface material |
| Compaction vibration frequency | 10–50 Hz |
| Robot speed during grading | 0.2–0.5 m/s |

---

## Open Questions

1. What surface preparation standard (roughness, compaction density) is required for optimal sintering quality? This must be determined experimentally.
2. How quickly do the blades wear in contact with abrasive lunar regolith, and how is blade replacement handled?
3. Can the compaction plate achieve meaningful densification in 1/6 g with the robot's limited mass pressing it down?
4. How does the bulldozer handle the transition from loose regolith to the edge of previously sintered areas?
