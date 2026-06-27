# Open Design Inquiry — Does the robot need a "head" at all?

**Status: active design direction, seeking engineering validation.**
**We are taking the lead with an integrated (head-less) concept, but we are explicitly
asking: did we make the right call, or should we step back to the detachable-head design?**

This is a question-led document in the spirit of the project: we would rather show the
open question honestly and invite correction than present a frozen decision. If you are an
engineer reading this — robotics, field robotics, space hardware, autonomy — your input on
this specific trade-off is genuinely wanted.

---

## The question in one line

Should each CMB8LF robot have a **distinct sensor head** (mounted at the front, detachable
like a leg), or should we **drop the head entirely** and integrate everything into the
body + legs?

---

## How we got here

The earlier design gave each robot a **head**: a front-mounted unit (spider position),
carrying the sensors and the working-laser optics, attached through the same universal EPM
coupling as the legs — so it could be swapped or harvested like a leg. (See the "Previous
concept" note in `systems/robot-cmb8lf-l1/chassis.md` and the `head-*.md` files.)

While reviewing the design we questioned a basic assumption: *is a "head" a real
engineering need, or is it a human/animal image we projected onto a machine?* A spider's
head is not a detachable add-on — it is fused with the body. A self-driving car has no
head — its sensors are distributed around the chassis. That reframing led to the current
direction.

---

## The direction we are now taking (and want validated)

**Drop the separate head. Integrate sensing into the body and legs.** Concretely:

1. **No detachable head.** Body + legs as one unit, like a real spider. This removes a
   coupling that can fail, a moving part, a dust-entry point, and a component that can be
   lost.

2. **The brain stays deep in the body.** Critical compute (the Jetson-class strategic AI)
   lives in the protected three-layer body core, never in an exposed, moving part. Putting
   costly hardware in the most exposed place would raise its failure rate and lose it if
   that part is damaged.

3. **"Measuring" is not "seeing."** For autonomous work the robot does not need eyes:
   - It knows where its arm-legs are from **joint encoders** (proprioception), not from
     looking at them.
   - It knows whether a sinter/melt is good from **thermal + spectroscopic measurement**,
     not from a camera view.
   - It builds a spatial map from **LiDAR / ranging**, not from human-style vision.

4. **Two distinct sensing needs, separated by function:**
   - **Targeted work-sensing — between the front legs.** Where the arm-legs do the
     sinter/melt work, downward/forward-looking measurement sensors watch the work zone
     directly.
   - **360° awareness — around the body.** Distributed fixed sensors around the chassis
     give all-round situational awareness (navigation, obstacles, other robots). No single
     moving head can cover 360° at once; distributed sensors can.

5. **A live camera feed is still required — but for the human, not the robot.** Every
   robot must support **override by a CMB engineer**. A human cannot override on encoder
   angles and spectra alone; they need a human-interpretable image. So each robot carries
   camera(s) feeding the work zone **plus** surrounding cameras, so an engineer can assess
   the whole situation before acting. Because of the ~2.6 s round-trip delay, this is for
   **situation assessment and re-tasking, not real-time joysticking** — which lowers the
   feed's latency requirements.

---

## What this buys us, and what it costs

**Gains:** fewer failure points (no head coupling, no head-swap mechanism), no
head-as-moving-part, better-than-a-head 360° coverage from distributed sensors, brain kept
in the safest place, lighter and simpler front end.

**Costs / things we give up or must solve:**
- We lose a *detachable* head that could be harvested from a dead unit. (Legs and
  arm-modules remain harvestable; is that enough redundancy?)
- Sensors that used to sit on a movable head are now fixed — we rely on distributed
  coverage + the robot turning its body instead of panning a head.
- **Open sub-question (unsolved):** the work-sensing between the front legs looks straight
  at intense heat, laser glare, and out-gassing/spatter from the melt zone — the most
  hostile spot for a sensor. How best to protect it (replaceable/closable window, oblique
  off-axis mounting, time-sharing while the laser is at full power)? We have deliberately
  **not** fixed this yet.

---

## The validation question for engineers

We are asking, plainly:

1. **Is dropping the head the right call** for a field robot doing autonomous lunar
   sinter/melt construction — or are we over-rotating on "no human assumptions" and
   throwing away a genuinely useful degree of freedom?
2. **Is encoder-based proprioception + distributed fixed sensing** truly sufficient for
   this kind of precise, close-up manipulation work, or does practice demand an
   articulated sensor platform after all?
3. **How would you protect the work-zone sensor** facing the melt? (The open sub-question
   above.)
4. If you would **step back to the detachable head**, what is the deciding reason?

Honest "you got this wrong because…" answers are the most useful kind. The full design is
open (`github.com/ChrystalMoonBase`, `chrystalmoonbase.com`); hardware under CERN-OHL-S-2.0,
docs under CC0.

> **Note:** the head-less direction is not just a sketch — a **complete parallel prototype
> variant** is already worked out at `systems/CMB8LF_v1_HL/` (BOM, CAD, schematics, firmware).
> So whichever way this resolves, the build is ready: it is a choice between two finished
> designs, not a request to start designing the alternative.

---

*This document records a design direction under active consideration. It is intentionally
not yet propagated into the full build documents; `chassis.md` now leads with the
integrated concept and references the superseded detachable-head design, but the older
`head-*.md` files are retained (with superseded banners) so the full history of the
decision stays visible.*
