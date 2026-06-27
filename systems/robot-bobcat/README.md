# CMB Bobcat — Robotic Excavator / Dozer

> **Status:** concept. Role is concrete; exact dimensions, mass, and power are
> engineering decisions for professionals once real excavation volumes and the prototype
> are known. This document fixes *what it is and why*, not the final numbers.

> **Naming note:** a clean, plate-style code (type instantly readable from the code) will
> be assigned later when the whole robot family is renamed. For now: "CMB Bobcat".

---

## Role: the digger and ground-mover

The Bobcat is a **dedicated earth-moving machine** — a robotic equivalent of a compact
Bobcat-style loader. It does the two heavy ground tasks that are fundamentally different
from the octopod's "stand still and sinter" work:

- **Excavating** — digging trenches, foundations, the underground network, and
  (contingent on confirmed ice) ice-bearing regolith.
- **Dozing / grading** — pushing and levelling loose regolith, preparing flat ground for
  the octopods to sinter on.

Digging and pushing require **traction and brute force in one direction**, a completely
different body from a robot that must hold an eight-point stance to weld. That physical
difference — not specialisation for its own sake — is why the Bobcat is its own class.

---

## Why a separate machine (not an octopod tool-swap)

The octopod (CMB8LF) is a work platform: it must stand rock-still on uneven ground while a
laser arm does precision work. Excavation is the opposite — it needs to **drive force into
the ground** and move material in volume. Trying to do that on eight legs built for
stillness would compromise both tasks. The Bobcat is therefore a different *body for a
different physical reality*, the same logic that gives the transport bot and the cable-worm
their own forms. The "no specialists" principle still holds **within** the construction
fleet of octopods; the Bobcat is a different class, not a fourth specialist octopod.

---

## Locomotion: tracks, not legs (likely)

Excavators on Earth use tracks for a reason: they spread weight, grip loose ground, and
resist the reaction forces of digging. On loose lunar regolith and slopes, tracks are the
strong candidate — but wheels-on-frame or a hybrid are not ruled out. **Final locomotion
choice is for the professionals**, tested against real regolith behaviour. What is fixed:
it does not walk; it drives and pushes.

---

## How it fits the fleet

- **Works ahead of the octopods:** the Bobcat prepares and levels ground; the octopods
  then sinter it. Natural task ordering.
- **Feeds the ISRU chain:** excavated regolith is raw feedstock for the processing
  modules.
- **Shares the canister standard** (see transport-bot): excavated material can be loaded
  into standard canisters for the transport bot to move.
- **Redundancy by number, within its own class:** like the octopods, the answer to "what
  if one fails" is more than one — not in-field electronics repair.

---

## When it is needed (timeline)

- **Not strictly day one.** The very first task is the octopods proving they can walk and
  sinter (the swarm foundation). Heavy excavation comes once surface work is underway and
  the base goes underground.
- **Early, though:** ground levelling helps the octopods sinter sooner, so a Bobcat is an
  early-growth addition rather than a far-future one.

---

## Specifications — for the professionals

The following are deliberately **not fixed** here; they require excavation-volume data,
mass-budget analysis, and prototype testing:

- Size, mass, and track/drive design
- Digging force, bucket/blade volume, reach
- Power draw and how it is fed (laser beaming like the octopods? onboard? hybrid?)
- Thermal handling under sustained heavy load
- How many Bobcats per fleet (depends on total excavation workload)

What is fixed: **role** (dig + doze), **why separate** (force vs. stillness), **fleet
fit** (works ahead of octopods, feeds ISRU, shares canisters), and **redundancy by
number**.

---

## Open questions

1. Tracks vs. wheels vs. hybrid on real Peary regolith and slopes?
2. Power: beamed (like octopods) or onboard? Heavy continuous digging is power-hungry.
3. Does it also load canisters, or only loosen/push material for others to load?
4. How much of the octopod's proven subsystems (sensors, comms, autonomy stack) can it
   reuse to avoid designing a second robot from scratch?

*Engineers and mission planners are invited to review and improve this document.*
