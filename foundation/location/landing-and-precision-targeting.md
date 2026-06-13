# Landing and Precision Targeting
## Chrystal Moon Base — Foundation / Location

**Status:** Concept proposal — strategy, not a validated flight design
**Licence:** CC0
**Last updated:** 2026

> Landing is the single highest-risk moment of the entire mission. A large fraction of recent robotic lunar landing attempts have failed, most often in the terminal descent phase. This document sets out how the Pod is intended to reach a narrow illuminated peak on the Peary rim accurately — and why the strategy deliberately includes redundancy that a cost-driven design might cut.

---

## The Problem

The four candidate illumination peaks on the Peary rim are not broad plateaus. They are narrow ridges and crater-rim strips — on the order of a hundred metres long and only metres to tens of metres wide (see `illumination-data.md`). Landing "approximately" on such a strip is not good enough. The Pod must place its compact landing footprint within metres of a chosen point, on terrain that may be locally sloped and littered with impact debris.

This requires metre-class precision landing — a capability that exists in modern spaceflight but is unforgiving on a target this small.

---

## The Strategy — Map First, Then Match

The approach separates the problem into two independent steps that do not have to happen at the same time:

### Step 1 — Build a precise terrain map of the target (before descent)

A high-resolution elevation map of the chosen peak is prepared in advance. The primary source is existing LRO/LOLA laser-altimetry data of the Peary rim. Where the existing data is not sharp enough for a narrow ridge (LOLA is coarse at the metre scale that matters for a strip this small), a **dedicated pre-mission orbital survey** is flown: the spacecraft passes over the peak and uses its own laser altimeter to measure the exact position and height profile of the landing strip, recording it to a map.

This is laser altimetry — the same physical method LOLA used to map the lunar poles. The laser is a *measuring instrument that builds a map*, not a live beacon pointed at the ground during descent. Because the measurement is made and stored beforehand, nothing has to stay synchronised during the landing itself.

### Step 2 — Match the map during descent (Terrain Relative Navigation)

During powered descent the Pod carries the pre-built map onboard. Its camera (and a downward-looking laser/LIDAR) images the terrain in real time and matches it against the stored map, locating the Pod to within metres and steering it to the chosen point. This is **Terrain Relative Navigation (TRN)** — the same class of technique NASA's Mars 2020 lander used to set down accurately among hazards. A downward LIDAR scan in the final hundreds of metres builds a live 3-D image to detect slopes and boulders and select the safe touchdown spot.

The laser that *does* operate during descent is onboard the Pod, looking down — so its geometry is always correct, because the designator and the lander are the same object.

---

## Why Independent Verification — Even With a Perfect Map

A reasonable objection: if a sufficiently precise LOLA map already exists, why fly your own survey passes? The answer is risk management, not precision.

**One data source is one point of failure.** If the existing map carries a systematic error — a calibration offset, a stale measurement, an artefact precisely over the chosen ridge — then the Pod lands accurately *on the wrong place*, and the error is only discovered when it is too late. A second, independent altimetry pass gives something to cross-check against. If the two agree, confidence is high. If they disagree, the problem is found *before* descent, not after.

**Fresh data beats old data.** LOLA measurements can be over a decade old. A survey flown shortly before the mission captures the current state — a recent small impact, shifted loose debris — for a strip where centimetres matter.

**The cost argument does not apply at this budget.** A few extra survey passes cost a marginal amount of propellant, time, and complexity. Against a mission valued in the hundreds of millions, where the landing is the critical failure moment, that marginal cost is negligible. Multiple independent measurements are simply the standard at this risk profile — a reviewer would more likely question their *absence*. This redundancy is a deliberate, documented choice.

---

## Sequence Summary

1. Existing LRO/LOLA data assessed for resolution over the chosen peak.
2. If needed, a dedicated pre-mission orbital laser-altimetry survey maps the landing strip precisely.
3. At least one independent verification pass cross-checks the map; disagreements are resolved before commit.
4. The verified map is loaded onboard as the TRN reference.
5. The lander system delivers the Pod to a coarse target zone.
6. During descent, the Pod's TRN matches camera/LIDAR imagery to the map, and its downward LIDAR selects the safe touchdown point within the narrow strip.
7. Touchdown on the compact landing footprint; deployment (bloom, mast) follows — panels are unfolded only *after* landing, never before (see `landing-zone-criteria.md`).

---

## Open Questions

1. What is the actual LRO/LOLA resolution over each of the four candidate peaks, and which require a dedicated survey?
2. What landing accuracy (CEP) is realistically achievable with TRN on a ridge of this width, and what slope limit does that impose on site selection?
3. How many independent verification passes are justified, and what disagreement threshold triggers a target change?
4. What sensor suite (camera bands, LIDAR range/resolution) does the Pod need for reliable TRN in the low-sun-angle lighting of the Peary rim?
5. Is a small precursor mapping mission warranted before any Pod is committed?

*Engineers with GNC, TRN, or planetary-landing experience are invited to review and improve this document via GitHub Issues.*

---

## Key References

- Bussey et al. (2005) Nature 434:842 — Peary rim illumination peaks
- Noda et al. (2008) GRL — SELENE/KAGUYA polar illumination (~89% best peak)
- Smith et al. (2010) Space Science Reviews — Lunar Orbiter Laser Altimeter (LOLA) instrument
- NASA Mars 2020 / Lander Vision System — Terrain Relative Navigation flight demonstration
- Johnson et al. — Terrain Relative Navigation for planetary landing (method overview)
