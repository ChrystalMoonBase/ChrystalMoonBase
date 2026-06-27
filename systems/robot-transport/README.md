# CMB Transport Bot — Robotic Hauler

> **Status:** concept. Role is concrete; exact dimensions, mass, payload, and power are
> engineering decisions for professionals once real cargo volumes and the prototype are
> known. This document fixes *what it is and why*, not the final numbers.

> **Naming note:** a clean, plate-style code (type instantly readable from the code) will
> be assigned later when the whole robot family is renamed. For now: "CMB Transport Bot".

---

## Role: move (almost) anything from A to B

The transport bot is a **dedicated hauler**. Once the base starts producing and growing,
material has to be moved: sintered components, excavated regolith, harvested modules from
dead robots, spare parts from the garages, ice-bearing material, ISRU feedstock between
factories. The octopods *can* drag loads in a pinch, but they are work platforms, not
movers — hauling over the base's own (already sintered) flat paths is a different task.

Over prepared, sintered paths, **wheels are the logical choice** — exactly the point made
in the "why legs, not wheels" discussion: wheels are perfect for rolling over prepared
ground, which is precisely what the transport bot does. It does not work on loose slopes;
it runs on the roads the octopods have already laid.

---

## The key idea: a standard canister

The transport bot is designed around a **standard canister / container**, not around any
single cargo type. This is the shipping-container principle applied to the Moon:

- Everything that needs moving goes into the **same standard canister format**.
- The transport bot does not need to know *what* it carries — only *how to couple a
  canister*.
- The same canister can be handled by the **transport bot, the octopods, and the Bobcat**
  — one shared interface across the whole fleet.

Just as standard containers transformed logistics on Earth (one size, and suddenly
everything fits every truck, ship, and crane), a single canister standard means any
machine can pick up any load. This is the transport bot's most important design decision —
arguably more important than the bot's own body.

---

## Why a separate machine (not an octopod tool-swap)

Hauling cargo efficiently over flat sintered paths is a different physical job from
standing still to sinter. Wheels + a canister coupling are simpler, lighter, more
energy-efficient, and stable enough for this task — where the octopod's eight legs would
be overkill. Different body for a different physical reality; the "no specialists"
principle holds within the octopod construction fleet, and the transport bot is a separate
class.

**Fallback safety:** if every transport bot were to fail, the octopods can still haul
loads themselves (slower, less efficient). So the transport class makes the base *more
efficient* but is not a hard single-point dependency — the construction class can fall
back on itself.

---

## How it fits the fleet

- **Runs on octopod-built roads:** transport follows construction. It needs sintered flat
  paths, which the octopods produce as they work.
- **Connects the chain:** Bobcat excavates → canister → transport bot moves it → ISRU
  module or build site. The canister standard ties it together.
- **Redundancy by number, within its own class.**

---

## When it is needed (timeline)

- **Not day one.** Early on there is little to move and few paths to move it over. The
  swarm foundation (octopods walking and sintering) comes first.
- **Grows in with the base:** as sintered paths and production volume appear, the
  transport bot becomes worthwhile. A growth-stage addition.

---

## Specifications — for the professionals

Deliberately **not fixed** here; they require cargo-volume data, mass-budget analysis, and
prototype testing:

- Size, mass, wheel/drive design, payload capacity
- The exact canister standard (dimensions, coupling mechanism, how it locks)
- Power draw and how it is fed (beamed / onboard / hybrid)
- How many transport bots per fleet (depends on cargo workload and path network size)

What is fixed: **role** (haul anything via standard canisters), **wheels over sintered
paths**, the **canister standard as the core idea**, **fleet fit**, and **octopod
fallback**.

---

## Open questions

1. Canister dimensions and coupling: what single standard serves regolith, parts,
   modules, and ice equally well?
2. Power over distance: beamed power works near the mast; long hauls may leave beam range
   — onboard battery, swappable canister-batteries, or path-side charging?
3. Does the transport bot self-load, or do octopods/Bobcat load the canisters onto it?
4. How much of the octopod's proven subsystems (sensors, comms, autonomy) can it reuse?

*Engineers and mission planners are invited to review and improve this document.*
