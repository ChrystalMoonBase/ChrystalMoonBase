# M-Buffer-Gas — Nitrogen & Argon (Atmosphere Buffer)

**Status:** Concept proposal, sourced. Tentative — **the hardest local-supply problem
for the atmosphere.**
**Licence:** CC0
**Role:** Stage 3. A breathable atmosphere is not pure oxygen — it needs an inert
**buffer gas** (to lower fire risk and match partial pressures). Sourcing it at Peary is
genuinely difficult.
**Ground truth:** Peary highland; nitrogen is scarce locally.

---

## What it does

Supplies inert buffer gas — **nitrogen (N₂)** ideally, **argon (Ar)** as the more
locally-available alternative — to dilute the cabin oxygen to a safe, breathable mix.

---

## The honest problem

Unlike oxygen (abundant) and the metals (in the rock), **nitrogen is not a bulk lunar
resource.** It exists only as:
- **dilute solar-wind-implanted N** in regolith (trace, needs huge throughput), and
- possible **cold-trap volatiles** (ammonia, etc.) at the poles, *if* ice is confirmed.

So buffer gas is the atmosphere component most likely to need **import or very large
processing**, and that must be stated plainly rather than glossed.

---

## Routes (grounded, in order of local-friendliness)

1. **Argon from solar wind / regolith outgassing.** Heating regolith releases implanted
   noble gases including **argon** (alongside H, He, and trace C/N). Argon is a perfectly
   good buffer gas and is more obtainable than nitrogen from regolith — a strong local
   candidate.
2. **Nitrogen from cold-trap volatiles** (ammonia/N-bearing ices), *if* Peary ice is
   confirmed — extracted alongside water (see M-Water), then cracked to N₂.
3. **Nitrogen from dilute solar-wind N** — possible but requires processing very large
   regolith volumes for small yield; likely a supplement, not a main source.
4. **Import** — the honest fallback for the shortfall, kept in a tight recycled loop
   (buffer gas is not consumed, only lost to leaks).

---

## Conceptual schematic

```
   regolith ──heat──► outgas ──► Ar (+ He, H, trace N) ──► separate ──► Ar buffer
   cold-trap ice * ──► volatiles (NH₃…) ──► crack ──► N₂ buffer
   shortfall ──► imported N₂/Ar ──► recycled (leak make-up only)
```
*Conceptual; yields are low and uncertain — this is a flagged weak point.*

---

## Earth-dependence (honest)

**This is, with the electrolyte salts, the most likely standing Earth-dependence.**
Argon-from-regolith reduces it; confirmed polar ice would reduce it further. But buffer
gas may remain a **partly imported, tightly-recycled** resource. Because it is only lost
to **leaks**, a well-sealed base needs only small make-up — which is exactly why the
glass-sealing of rooms (M-Glass) matters so much here.

---

## Maturity (honest)

Noble-gas/volatile extraction from regolith is studied but low-TRL for this purpose.
The realistic near-term answer is **argon-leaning buffer + tight sealing + small imported
make-up**, with nitrogen contingent on polar ice.

---

## Open questions

1. Argon-dominated vs nitrogen-dominated buffer — what does life support actually need?
2. How leak-tight can sintered+glass-sealed rooms get (sets the make-up rate)?
3. Does confirmed Peary ice carry enough N to matter?

---

## References (verify and extend)

- Solar-wind volatile studies — implanted H, He, Ar, trace C/N released on heating
  regolith (~1000 K).
- arXiv 2502.13679 — cold-trap volatiles include ammonia (N source) where ice exists.
- ECLSS references — buffer gas role in breathable atmosphere.

*Genuinely uncertain local supply. This is a proposal, not a settled design, and one of
the weakest links — flagged honestly.*
