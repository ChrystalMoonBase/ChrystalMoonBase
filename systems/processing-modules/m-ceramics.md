# M-Ceramics — Alumina (Al₂O₃) & High-Temperature Ceramics

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3. High-temperature, hard, electrically-insulating parts — crucible
liners, furnace/reactor components, electrical insulators, and the **alumina fibre** that
reinforces the domes.
**Ground truth:** Peary highland / anorthosite (~27 wt% Al₂O₃ — abundant).

---

## What it does

Produces alumina (Al₂O₃) and alumina-based ceramics from the abundant aluminium-oxide
content of anorthosite. Where aluminium *metal* is the structural workhorse, alumina
*ceramic* is the high-temperature workhorse — and it solves the dome-reinforcement fibre
problem locally.

---

## Input → Output

- **Input:** Al₂O₃ separated from anorthosite (the oxide, before/instead of reduction to
  metal).
- **Output:** alumina powder/ceramic (sintered parts) and **alumina fibre** (for in-melt
  dome reinforcement); alumina-rich ceramic slag is a related construction stream.

---

## Why alumina matters here (grounded)

The dome reinforcement analysis (`../domes/dome-reinforcement-options.md`) concluded that
**alumina fibre is the only candidate that survives being laid into the ~1550 °C glass
melt** (it stays usable to ~1200–1370 °C), and it is **stronger and lighter than the
titanium wire it replaces** — while being made from locally abundant Al₂O₃. So M-Ceramics
is what makes the preferred dome design **local**, instead of importing titanium.

Beyond fibre, alumina ceramics give:
- **Crucible / furnace / reactor liners** that withstand the high-temperature processes
  (MRE, melting) — important because containment durability is a known weak point.
- **Electrical insulators** for the power and electrolysis systems.
- **Hard wear parts** for the robots and tools.

> Honest note: the *toughness* gap (ceramics are brittle vs metals) is real, but
> oxide-fibre composites are designed to fail gracefully via fibre pull-out — which is
> why alumina fibre is acceptable in a pressure shell.

---

## Conceptual schematic

```
   anorthosite ──► separate Al₂O₃ ──┬─► sinter ──► ceramic parts (liners, insulators)
                                    ├─► draw ────► alumina FIBRE → domes (in-melt)
                                    └─► (reduce) ─► aluminium metal (M-Aluminium)
```
*Conceptual; the split between oxide (ceramic) and metal routes is a process choice.*

---

## Earth-dependence

**Very low.** Al₂O₃ is abundant locally; processing is heat-driven (sinter/draw). This is
one of the more satisfying local wins — a high-value material (high-temp ceramic + dome
fibre) from the most abundant local oxide, no imported consumables.

---

## Maturity (honest)

Alumina ceramics are fully mature terrestrially; **lunar-made** alumina fibre/ceramic is
unproven, and drawing continuous high-quality fibre in situ is the main unknown. But the
feedstock abundance makes this a high-priority, high-payoff line.

---

## Open questions

1. Best route to separate clean Al₂O₃ from anorthosite for ceramic vs metal use?
2. Can continuous alumina fibre be drawn in situ to the quality the domes need?
3. Crucible/liner lifetime — does local alumina solve the MRE containment problem?

---

## References (verify and extend)

- `../domes/dome-reinforcement-options.md` — alumina (Nextel-type) fibre data: ~2.9 GPa,
  use temp ~1200 °C; survives the glass melt; lighter/stronger than titanium wire.
- ScienceDirect 2025 (LISAP) — Al₂O₃ / silica separation from anorthite.
- `PEARY-MATERIALS-REFERENCE.md` — ~27 wt% Al₂O₃ at highland Peary.

*Lunar fibre/ceramic performance unproven. This is a proposal, not a settled design.*
