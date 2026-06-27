# Consistency pass — 2026-06-27

Summary of all changes made in this session. **No substance was added** — this pass
*removes obsolete information and resolves contradictions* that survived earlier targeted
scans, and records each removal here with the reason. The guiding rule for this session
(founder's instruction): *obsolete information must be removed, but noted in a changelog
with an explanation.*

Why these errors kept surfacing despite earlier scans: each previous scan was **targeted**
(it looked for one specific thing — a temperature, a battery figure, an Earth-visibility
claim). A targeted search for "1600 °C" cannot find a stray "13 modules." This session was
the first **full letter-by-letter read of all 169 files at once**, which is why traces from
several different older versions all surfaced together. The repo grew in layers over months;
correcting a core document sometimes left a reference deep in a one-pager or phase document
untouched, and occasionally a fix in file A exposed a now-inconsistent file B.

---

## 1 — Processing-module count harmonised to ~20

**Problem:** three different counts existed in the repo — "13 modules" (README, phase-1),
"22 modules" (horizon docs), while the actual `systems/processing-modules/` folder contains
**20** `m-*.md` files and the `overview.md` index lists 20.

**Fix (count verified by file count + index):**
- `README.md` — "13 processing modules" → "~20 processing modules".
- `roadmap/phase-1-foundation.md` — "13 processing modules" → "~20"; **also removed
  "titanium" from the list of locally-produced materials** (see §2).
- `horizon/HORIZON_ISRU_cable_network.md` and `horizon/_werkversie_NL/HORIZON_ISRU_kabelnetwerk.md`
  — "22 modules" → "~20 modules".

**Why "~20" and not a hard "20":** two of the twenty modules are explicitly *parked / not
viable at Peary* (`m-titanium`, `m-helium3`), so an approximate count is the honest framing.

---

## 2 — Titanium removed as a local product (highland-anorthosite correction)

**Problem:** leftover mare-composition assumptions still presented titanium / ilmenite as a
Peary resource, contradicting `PEARY-MATERIALS-REFERENCE.md` (Peary is highland anorthosite;
ilmenite is a mare mineral, effectively absent; ~0.4 wt% TiO₂).

**Fix:**
- `roadmap/phase-1-foundation.md` — removed "titanium" from local production; added a one-line
  note that ilmenite is absent at highland Peary and aluminium is the local structural metal.
- `media/vision-one-pager.md` — "Ilmenite bearing titanium" removed from "what might already
  be there"; rewritten to anorthosite/aluminium/calcium reality.

---

## 3 — "Earth continuously visible" softened (relay-backed)

**Problem:** `peary-crater-selection.md` still asserted Earth is *continuously* visible from
the Peary rim — the same over-strong claim already nuanced elsewhere
(`data-relay-to-earth.md`). Earth sits low over the polar horizon; libration and local terrain
can interrupt the direct line of sight.

**Fix (`foundation/location/peary-crater-selection.md`):**
- Criterion list: "continuous line-of-sight" → "line-of-sight a high fraction of the time
  (relay-backed for any gaps)".
- Earth-Visibility section rewritten: visible low on the horizon a large fraction of the time,
  not 100%; gaps covered by data buffering and a lunar relay satellite (ESA Lunar
  Pathfinder / Moonlight); exact % to be confirmed against high-resolution LOLA.
- **Left intact:** the equatorial "Earth always visible" line in `civilisation-blueprint.md`
  — that one is factually correct for the equatorial near-side and is not about Peary.

---

## 4 — Robot fleet: obsolete "8 robots / 32 swappable heads" model removed

**Problem — the biggest one.** Two robot philosophies co-existed in the repo:
- **Old (obsolete):** 8 robots that changed role by swapping one of **four physical heads**
  (sintering / thermal-buddy / bulldozer / watcher), 32 heads stored in the Pod.
- **Current:** **16 identical robots, everything integrated** (all sensors + sintering laser +
  infrared annealing), role set by **software task assignment**; only the two **heavy tools**
  (bulldozer blade, digger) are physically swapped, via the EPM arm interface.

The old model still lived in `swarm-logic.md`, `head-storage-in-pod.md`, `ai-onboard.md`, and
the four `head-*.md` files. This is the model the founder had already moved away from.

**Fix — obsolete model removed and replaced (per-file):**
- `systems/robot-cmb8lf-l1/swarm-logic.md` — Core Philosophy + Fleet + Dynamic Configuration
  rewritten from "8 robots / 32 heads / role-by-head-swap" to "16 robots / integrated /
  role-by-task-assignment"; an explicit *superseded* note added. "Monitors all 8 robots" → 16;
  "Pod head inventory" → heavy-tool & spare-parts inventory; Watcher "installs a replacement
  head" → installs a replacement leg/tool/module; open-question about head inventory rewritten.
- `systems/robot-cmb8lf-l1/head-storage-in-pod.md` — **fully rewritten.** Was "Tool Head
  Storage — 32 heads." Now "Spare-Parts & Tool Storage": the Pod is a depot for spare legs,
  spare integrated modules, heavy tools (blade/digger) and wear parts — not role-heads. A
  superseded banner explains the change.
- `systems/robot-cmb8lf-l1/ai-onboard.md` — "Head Operation: each head type has its own AI
  module" → "Tool and Task Operation": the AI runs the module for the assigned *task*; sensing
  and sintering are integrated, only blade/digger are swapped.
- `systems/robot-cmb8lf-l1/head-watcher.md` — retitled "The Watcher **Task**"; Role rewritten:
  the full sensor suite is integrated on every robot, so "Watcher" is a task the AI assigns,
  not a head. **Sensor-suite technical detail kept** — it is simply integrated, not detachable.
- `systems/robot-cmb8lf-l1/head-sintering.md` — retitled "Sintering (Integrated Function)";
  superseded banner: the sintering laser is integrated in the arm-legs, not a head; "leads a
  4-robot team" framing removed. Optics/process detail kept.
- `systems/robot-cmb8lf-l1/head-thermal-buddy.md` — retitled "Thermal-Buddy / Annealing
  (Integrated Function)"; banner: IR lamps are integrated on every robot (per-robot melt+anneal),
  "Thermal Buddy" is a broader-area *task*. Thermal detail kept.
- `systems/robot-cmb8lf-l1/head-bulldozer.md` — retitled "Bulldozer Task (Swappable Heavy
  Tool)"; banner: the blade is one of the two EPM heavy tools, not a role-head; "leads the
  construction team" removed. Grading detail kept.
- `systems/sintering/crack-prevention.md` — "Thermal Buddy robot applies IR heating" reworded
  to "every robot's integrated IR lamps … a robot assigned the broader-area Thermal-Buddy task".

> **Note on the `head-*.md` filenames:** the files are retitled internally but keep their
> `head-*.md` filenames for now (renaming files would break inbound links across the repo). A
> later naming-cleanup pass can rename them; the content is already corrected and each carries a
> superseded banner. The `README.md` "Previous concept (archived): four specialist robot types"
> note was already correct and was left as-is.

---

## 5 — Head position corrected: front (spider), not central-upper

**Problem:** `chassis.md` placed the tool head "centrally on the **upper** surface, not at the
front," and argued *against* a front mount. This contradicts the actual design — the robot is a
**spider** (the *8 Legged Freaks*; the S1 prototype's `DIMENSIONS_v2.md` states
"Vorm: Spin · achthoekig elliptisch" and the CAD is "Spider body"). The head sits at the
**front**, like a spider's prosoma.

**Fix (`systems/robot-cmb8lf-l1/chassis.md`):**
- Coupling-points list and "head attaches" sentence: head is at the **front**, on the same
  universal EPM coupling as the legs — **removable just like a leg** (founder's clarification),
  for repair or donor-harvesting.
- "Tool Head Position — Central Upper Mount" section **fully rewritten** to "Front (Spider
  Layout)" with a superseded banner explaining the old top-mount/360° argument is dropped.
- Clarified the brain/senses split: **head carries the sensors** (cameras, LiDAR, thermal,
  spectroscopy + working laser optics); **AI/compute lives in the body** (electronics bay).
  Earlier wording risked implying the AI sat in the head. The "Central upper section houses the
  main compute" line reworded to make clear the compute is in the body, distinct from the front
  head.
- **Added the founder's design rationale** for the split, so the *why* is on record: the head is
  the most exposed, moving, heat/dust-facing part, so putting critical hardware there would raise
  its failure rate and lose the hardware if the head is damaged/swapped; the body is the protected
  three-layer core, so the brain belongs there and the head is kept light, simple and cheap to
  replace (lose *eyes*, not *brain*). Also recorded that head mass is negligible vs the body, so a
  light pan/tilt head does not affect balance — it buys viewing/working angles at no cost to footing.

---

## 6 — Prototype brain: Raspberry Pi 5 → NVIDIA Jetson Orin Nano

**Reason:** the strategic brain runs the heavy AI (vision, SLAM, gait planning, sensor fusion,
the spectroscopy pipeline). The Jetson Orin Nano Super (~67 TOPS, 7–25 W) provides
GPU-accelerated inference far beyond the Pi 5. The layered architecture is unchanged —
**Jetson** (strategic) · **Pico W ×2** (CAN master + safety) · **RP2350 ×26** (per-segment
reflexes); CAN bus and moteus controllers untouched. One Jetson is bought for the prototype.

**Fix:**
- `systems/CMB8LF_v1/CMB8LF_v1_BOM_v6.md` — COMPUTE section: Pi 5 (€90) → Jetson Orin Nano
  Super 8GB (€249); MicroSD → NVMe M.2 SSD; peripheral "→ Pi5" labels → "→ Jetson"; rationale
  note added. Subtotal €284 → **€453**. Budget overview ROBOT TOTAAL €6.647 → **€6.815**,
  EINDTOTAAL €7.312 → **€7.497**. Top "kostenstructuur" block marked *indicative* and its
  compute line aligned (it never summed to the full total — pre-existing, now flagged).
- `systems/CMB8LF_v1/README.md` — "3-layer AI: Pi5 strategic" → "Jetson Orin Nano strategic";
  software file `pi5_main.py` → `jetson_main.py`; I2C/CAN pinout table "Pi5 …" → "Jetson …".
- `systems/CMB8LF_v1/SUPPLIER_MAILS_v6.md` — camera-interface line "Raspberry Pi 5" → "Jetson
  Orin Nano"; also fixed a licence claim ("open source (CC0/GPL)" → "open hardware CERN-OHL-S
  & open docs CC0", matching `LEGAL-STRUCTURE.md`).
- **Left as-is:** `SUPPLIER_MAILS_v5.md` (superseded older version; README points to v6).

---

## 7 — Software licence corrected in prototype README

**Problem:** prototype `README.md` stated "Software: GPL-3.0", contradicting
`LEGAL-STRUCTURE.md` and `software/README.md` (software is **proprietary**, kept in a separate
private repo).

**Fix (`systems/CMB8LF_v1/README.md`):** both the header licence line and the License section
changed to "Software: Proprietary (separate private repo)".

---

## 8 — Robot "head": integrated (head-less) direction opened for validation

**Not a correction — a design direction, recorded openly per the project's question-led
approach.** While reviewing the head, the founder questioned whether a "head" is a real
engineering need or a human/animal image projected onto a machine (a spider's head is fused
to its body; a car has none). The session worked through a **head-less, integrated** concept:
no separate head; brain deep in the body; *measuring ≠ seeing* (encoders for limb position,
thermal/spectroscopy for melt quality, LiDAR for mapping); targeted work-sensing between the
front legs; 360° awareness from distributed body sensors; and a live camera feed retained **for
the human override engineer**, not the robot (situation assessment, not real-time control, given
the ~2.6 s delay).

**Recorded as follows (leading with the new direction, old design kept visible):**
- New root document **`OPEN-DESIGN-INQUIRY-robot-head.md`** — lays out the trade-off and asks
  engineers to validate: is dropping the head right, or should we step back to the detachable
  head? Includes the unsolved sub-question of protecting the work-zone sensor from melt heat/glare.
- `systems/robot-cmb8lf-l1/chassis.md` — the head section now **leads with the integrated
  head-less direction** and references the earlier **detachable front-head** design as the
  fallback "under review"; the nine-coupling list updated to mark the front/head coupling as
  under review (may be dropped in the integrated design). Brain-in-body holds in both.
- The `head-*.md` files are **kept** (with their existing superseded banners) so the full
  decision history stays visible; they are not deleted.

**Deliberately not done:** the integrated concept is **not** propagated into all build/prototype
documents yet — it is a direction seeking validation, not a frozen decision. This matches the
founder's "laten bezinken / slow but sure" discipline.

---

## 9 — Complete head-less prototype variant created (`systems/CMB8LF_v1_HL/`)

**New parallel build, fully worked out so the design choice does not cost months later.** At the
founder's request, a complete head-less version of the CMB8LF-S1 prototype was created alongside
the standard one — *"so that if the choice is made, we already have it ready, including the
schematics and everything."*

**Scope of the difference:** only the **sensing/camera layer** changes. The working **laser-palm
stays in the front leg**; legs, chassis envelope, CAN bus, moteus, motors, Jetson brain, power,
gait and all motion firmware are **identical and shared** — the variant references the base files
instead of duplicating them, so the two cannot silently drift apart.

**Files created:**
- `systems/CMB8LF_v1_HL/README.md` — variant anchor + shared-vs-different table.
- `docs/HEADLESS_DESIGN.md` — full sensor-relocation spec (head → body), incl. deletion of the
  cosmetic "RGB eyes" and the pan/tilt mechanism, and the three work-window protection measures.
- `docs/DIMENSIONS_HL.md` — new sensor-position dimensions (delta to base).
- `CMB8LF_v1_HL_BOM.md` — delta BOM (−€34 removed, +€129 added → ~€7.592 total, ~€95 over base).
- `cad/CMB8LF_v1_HL_config.scad` — includes base config, adds sensor positions.
- `cad/CMB8LF_v1_HL_body_chassis.scad` — body with sensor recesses + LiDAR riser, 9th (head)
  coupling blanked.
- `cad/CMB8LF_v1_HL_sensor_mounts.scad` — body-integrated sensor/camera carriers (replaces
  `head_module.scad`).
- `diagrams/CMB8LF_v1_HL_Sensor_Layout.svg` — top + side view of every sensor position.
- `diagrams/CMB8LF_v1_HL_Wiring_Diagram.svg` — sensor-layer wiring (CSI/SPI/UART/I²C).
- `software/config_headless.py` — base config import with pan/tilt nodes removed + body sensor map.
- `software/sensors_headless.py` — sensor manager for body sensing + the human override feed.

**Cross-references added:** `systems/CMB8LF_v1/README.md` (points to the variant),
`OPEN-DESIGN-INQUIRY-robot-head.md` (notes the variant is fully built, not a sketch).

---

## Verification

After the pass, repo-wide greps confirm **0** remaining instances of: "13 modules",
"22 modules", "8 identical chassis / 32 heads" (outside superseded notes that quote them),
"Earth is continuously visible", "ilmenite bearing titanium", "Software: GPL" in the prototype
README, and "Pi5/Pi 5" in the active prototype docs (BOM_v6, README, SUPPLIER_MAILS_v6).
"16 robots / sixteen identical" now appears consistently.

**Not changed (out of scope, noted for a future pass):**
- The `head-*.md` files keep their filenames (internal titles corrected; rename later to avoid
  breaking links).
- A full "plate-style" rename of the whole robot family remains a deliberate later task.
- `SUPPLIER_MAILS_v5.md` left untouched as a superseded version.
