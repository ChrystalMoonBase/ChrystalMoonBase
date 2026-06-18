# CMB8LF-L1 Tool Interface — EPM Standard & Spare Parts

**Chrystal Moon Base · Phase 0.2**
**Licence:** CC0

---

## What the EPM rack holds

Every CMB8LF-L1 tool — including the arm modules themselves — connects via the same EPM interface. The rack in each garage holds everything:

| Item | Type | Phase | Purpose |
|---|---|---|---|
| Sintering laser module | Arm module (left) | 0.2 | Melts regolith to ~1200C |
| W-Re forming tip | Arm module (right) | 0.2 | Shapes and smooths molten regolith |
| Bulldozer blade | Heavy tool | 0.2 | Grades loose regolith |
| Digger tool | Heavy tool | 1.2+ | Excavates underground tunnels |

Spares of the laser module and W-Re tip are stored alongside the heavy tools. Same rack. Same EPM connection. Same swap procedure.

---

## The EPM interface

| Parameter | Value |
|---|---|
| Activation energy | less than 5 W for less than 1 second |
| Hold power | 0 W — permanent magnet holds without power |
| Release energy | less than 5 W for less than 1 second |
| Moving parts | None |
| Fail mode | Locked — module cannot accidentally drop |

---

## Swap procedure (any module)

1. Robot walks to tool rack
2. EPM pulse — module detaches
3. Robot aligns arm-tip to replacement module on rack
4. EPM pulse — locked
5. Robot resumes work

No second robot. No human. No mission pause.

---

## Two-arm operation

The two arm-legs operate independently. In standard sintering mode:

- **Left arm:** laser module active — melts the surface
- **Right arm:** W-Re forming tip active — presses and shapes the melt

When heavy physical work is needed, one or both arm modules are swapped for the blade or digger. The laser and forming tip go back on the rack while the heavy tool is in use. When the grading or excavation is done, the robot picks its arm modules back up.

---

## What is NOT an EPM swap

All sensors (terrain scanner, temperature sensors, cameras, photodiodes, structural load cells) are permanently integrated into the chassis body. They never swap. They never go on the rack.

---

## Compatibility

The W-Re forming tip and the sintering laser module both use the same EPM mounting geometry. A robot with two forming tips or two laser modules is mechanically possible — though the standard configuration is one of each.

---

**Parent:** [../README.md](../README.md)
**Repository:** github.com/ChrystalMoonBase/ChrystalMoonBase
