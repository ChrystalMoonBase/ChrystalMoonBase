# Demonstrator 4 — Swarm Coordination
## Chrystal Moon Base — Phase 0 Earth Programme

**Status:** Not yet begun  
**Licence:** CC0

---

## Objective

Demonstrate that 2–4 CMB8LF-L1 robots can autonomously coordinate to sinter a defined area in the correct ring pattern without human intervention, using only onboard AI and mast-based coordination.

---

## This Is the Hardest Demonstrator

Demonstrators 1–3 test individual technologies. Demonstrator 4 tests their integration in a multi-robot coordination context. Software failures, communication issues, robot conflicts, and coordination breakdowns are all more likely in a multi-robot system than in any individual subsystem.

Demonstrator 4 is expected to require multiple iteration cycles before success criteria are met. Each failure cycle is valuable — it reveals a specific coordination problem that can be fixed before the flight system is designed.

---

## Test Protocol (Proposed)

**Setup:** 2–4 CMB8LF-L1 prototype robots in the sintering test area from Demonstrator 1. A fixed mast (scaled) provides simulated laser power beaming and swarm coordinator computing.

**Test series:**

1. **Two-robot coordination** — sintering robot and thermal buddy robot coordinate to sinter a 1-metre ring section. Measure ring quality and coordination continuity.

2. **Four-robot team** — full team (sinter, thermal buddy, bulldozer, watcher) coordinates on a 3-metre ring section.

3. **Ring progression** — team completes a full ring and advances to the next ring autonomously. Repeat for 3 rings.

4. **Fault response** — one robot is disabled mid-operation. Measure swarm response: role reassignment, continued operation, quality impact.

5. **Extended autonomous operation** — 8-hour autonomous sintering run with no human intervention. Monitor for AI decision errors, coordination failures, and system degradation.

---

## Success Criteria

- Four-robot team completes a full ring autonomously with quality meeting Demonstrator 1 structural criteria
- Fault response (one robot disabled) results in continued operation within 5 minutes
- 8-hour autonomous run completes without human intervention
