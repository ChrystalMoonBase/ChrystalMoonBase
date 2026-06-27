# Naming cleanup — robot-cmb-r1 → CMB8LF-L1

**Date:** 2026-06-20
**Scope:** Repository-wide consistency pass on the lunar robot naming.

## Why

The repository had already moved to the **CMB8LF** naming scheme (S = Scale,
L = Lunar; e.g. CMB8LF-S1, CMB8LF-L1). The file *content* was already updated —
but the old `robot-cmb-r1` name survived in:
- the folder name `systems/robot-cmb-r1/`
- six path references pointing into that folder
- a leftover duplicate overview file

A reader (or an ESA reviewer) seeing both `CMB8LF-L1` in the text and
`robot-cmb-r1` in the paths would see two names for one robot. This pass removes
that inconsistency at the root.

## What changed

### Folder renamed
- `systems/robot-cmb-r1/`  →  `systems/robot-cmb8lf-l1/`
  (all 22 files inside preserved; their content already used "CMB8LF-L1")

### Duplicate removed
- Deleted `robot-cmb-r1-overview.md` (was a near-identical copy of `overview.md`).
  The single better-worded line from the duplicate — "...at ~7, 14, 21, 28, or
  35 m on the 35 m mast..." — was merged into the kept `overview.md`.

### Path references updated (6 files)
- `README.md` — repository-structure listing
- `roadmap/phase-0.2-the-pod.md`
- `systems/ai-and-monitoring/cybersecurity.md`
- `systems/ai-and-monitoring/overview.md`
- `systems/pod/laser-system.md`
- `systems/sintering/crack-prevention.md`

## What was deliberately NOT changed

- `WEBSITE-CORRECTION-STATUS.md` still contains the strings "CMB-R1 naming: none
  remain" and "CMB-R1 = 0". These are **correct** — that file is a status report
  *documenting* that the old name was removed. Editing them would falsify the
  record.

## Verification

- `grep` for `robot-cmb-r1` across all `*.md`: **0 results**.
- `grep` for `cmb-r1` / `CMB-R1` across all `*.md` outside the status report: **0
  results**.
- Robot folder now `systems/robot-cmb8lf-l1/` with all 22 files intact.
- No reference to the deleted duplicate remains.

## To commit

```
git add -A
git commit -m "Naming cleanup: robot-cmb-r1 -> CMB8LF-L1 (folder, paths, dedup)"
```
