# M-Silicon-Purification — Solar/Electronic-Grade Purification Complex

**Status:** Concept proposal, sourced, maximum depth. Each purification step is treated
as its own **sub-factory**. Tentative where noted.
**Licence:** CC0
**Role:** Stage 3, heaviest purification in the base. Takes raw/structural silicon
(~99 %, from M-Silicon) to **solar/electronic grade (<ppb, 6N–9N+)**. Feeds local
solar-cell manufacture.
**Design rule:** *No shortcuts; minimise Earth dependence.* Every sub-factory below has
an explicit **Earth-dependence** line, and the **physical** (reagent-free) route is
preferred over the **chemical** (Earth-reagent) one wherever possible. The lunar
environment (hard vacuum + solar heat) strongly favours the physical methods.

---

## Why a complex, not a step

Boron and phosphorus in silicon have segregation coefficients near 1 and (for B) very
low vapour pressure, so **simple zone refining alone does not remove them** —
"the separation of boron from MG-Si is the key challenge." Reaching PV grade therefore
needs **several distinct processes in series**, each its own sub-factory. The order
below is chosen so each removes what the next cannot.

```
 raw Si (~99%) ─► [SF-1 vacuum melt: P] ─► [SF-2 slag + gas: B, C] ─►
                 [SF-3 directional solidification: metals] ─► [SF-4 zone refine: final]
                 ─► solar/electronic Si (<ppb)
```

---

## SF-1 — Vacuum Melting (removes Phosphorus)

- **Removes:** phosphorus (P), and other high-vapour-pressure volatiles.
- **Process:** melt silicon in vacuum; P evaporates because its vapour pressure
  (~40.9 Pa) hugely exceeds silicon's (~0.40 Pa). Boron (~7×10⁻⁷ Pa) does **not**
  leave here — that is SF-2's job.
- **Earth-dependence:** **NONE.** Needs only vacuum (free on the lunar surface) and
  heat (solar/electric). This is the ideal first step for the Moon.

```
   molten Si  ──(hard vacuum, ~1500°C)──►  P, volatiles evaporate ──► pumped away
        │
        ▼  Si with P removed (B, metals still present)
```
*Conceptual; melt temperature, vacuum level and dwell time are open parameters.*

---

## SF-2 — Slag Refining + Reactive-Gas Blowing (removes Boron, Carbon)

This is the hard one — and, happily, doable with local materials.

- **Removes:** boron (B), carbon (C), and some Al/Ca/Mg.
- **Process (oxidative slagging):** molten silicon is contacted with a **CaO–SiO₂
  slag**; boron is oxidised at the silicon/slag interface and diffuses into the slag as
  **calcium borate**. Simultaneously, **water-vapour + oxygen gas blowing** oxidises
  boron and carbon out of the melt. The "united technique" of H₂O+O₂ blowing *with*
  CaO–SiO₂ slag gives a large improvement. Electromagnetic induction slag melting with a
  SiO₂–CaO–Al₂O₃ system reduced B from 1.5×10⁻⁵ to 0.2×10⁻⁵ and also removed Al (~85 %),
  Ca (~50 %), Mg (~67 %).
- **Earth-dependence:** **LOW — this is the key win.** CaO and SiO₂ both come from local
  anorthosite; O₂ from M-MRE; H₂O from polar ice. The whole reactive system is local.
  > Avoided Earth-dependent *enhancers:* halide/fluoride/lithium fluxes (CaCl₂, Na₃AlF₆,
  > Li₂O) boost boron removal but rely on chlorine/fluorine/lithium, which are scarce at
  > Peary. We design around the local CaO–SiO₂ + O₂/H₂O route and accept it may need
  > more passes than the halide-boosted terrestrial process.

```
   molten Si ──┬── CaO–SiO₂ slag (local) ──► B → calcium borate → into slag ──► slag tapped
               └── O₂ + H₂O gas blow (local) ──► B, C oxidised → off-gas
        │
        ▼  Si with B, C (and some Al/Ca/Mg) removed
```
*Conceptual; slag ratio, gas flow, passes are open. Halide boosters deliberately excluded.*

---

## SF-3 — Directional Solidification (removes metals: Fe, Al, Ti, Ca, Cu…)

- **Removes:** transition and other metals with small segregation coefficients
  (Fe, Al, Ti, Ca, Cu, Cr, Ni). Twice-applied directional solidification removes most.
- **Process:** slowly freeze the melt from one end; impurities with low segregation
  coefficients stay in the last-to-freeze liquid, which is then cut off and recycled
  back to MRE. Pure crystal grows directionally.
- **Earth-dependence:** **NONE.** Heat + controlled cooling only. The lunar night and
  PSR cold sinks can even *aid* the thermal gradient.

```
   melt ▓▓▓▓▓▓▓▓░░░░  ◄── slow solidification front moves this way
   pure Si crystal │ impurity-rich tail (cut off → back to MRE)
```
*Conceptual; gradient, pull rate and number of passes are open.*

---

## SF-4 — Zone Refining (final sweep)

- **Removes:** residual metals to trace levels; sharpens the ingot to PV/electronic grade.
- **Process:** a narrow molten zone is passed repeatedly along the solid rod; impurities
  travel with the zone to one end. Vacuum directional solidification + slag has reached
  ~99.98 %; repeated zone passes push toward the <ppb (6N–9N) target.
- **Earth-dependence:** **NONE.** Localised heating (laser/induction) + vacuum only.

```
   ══════╫▓▓▓╫══════  molten zone (▓) swept along the rod →→→
         impurities ride the zone to the discard end (recycled to MRE)
```
*Conceptual; zone width, speed, pass count are open.*

---

## Output & downstream

Solar/electronic-grade silicon (<ppb). In the lunar vacuum (~10⁻¹⁰ torr) it can be
**vacuum-deposited directly** as thin-film cells onto moonglass — no vacuum chamber
needed. (If this whole complex proves too costly, the **perovskite-on-moonglass**
route in `m-silicon.md` is the fallback — but that is a *choice*, not a shortcut inside
this complex.)

---

## Earth-dependence summary (the whole complex)

| Sub-factory | Removes | Local inputs | Earth-dependent? |
|---|---|---|---|
| SF-1 vacuum melt | P | vacuum, heat | **No** |
| SF-2 slag + gas | B, C | CaO, SiO₂, O₂, H₂O | **Low** (avoid halide boosters) |
| SF-3 directional solidification | metals | heat, cooling | **No** |
| SF-4 zone refining | residual | heat, vacuum | **No** |

**Net:** the only Earth-dependence is the *optional* halide/fluoride/Li boosters in
SF-2, which we deliberately exclude in favour of the all-local CaO–SiO₂ + O₂/H₂O route.
This complex is therefore **almost fully Earth-independent** — at the cost of more
passes and energy than the terrestrial halide-boosted process.

---

## Open questions

1. How many SF-2 passes does the local (halide-free) slag route need to hit PV boron specs?
2. Can SF-2 slag (now boron-loaded) be safely recycled, or must boron be sequestered?
3. Energy budget of the full train — at which Pod/power level does it become viable?
4. Dopant sourcing for the finished cells (a separate, small but real Earth-dependence)?

---

## References (verify and extend)

- ScienceDirect 2019 / Sep. Purif. Rev. 2019 — boron removal review: slag (CaO–SiO₂),
  gas blowing (H₂O+O₂), plasma; directional solidification/vacuum useless for B.
- ScienceDirect 2017 — CaO–SiO₂(–CaCl₂) slag + Ar–H₂O–O₂ gas blowing; 99.47 % → 99.98 %
  with vacuum directional solidification.
- EISM study — SiO₂–CaO–Al₂O₃ slag: B 1.5×10⁻⁵→0.2×10⁻⁵; Al/Ca/Mg also removed.
- US Patent 6,090,361 — vacuum-melt (P), zone-melt (Fe/Al/Ti/Ca) sequence.
- J. solar-Si segregation data — kB≈0.8, kP≈0.35; B vapour pressure ~7×10⁻⁷ Pa.

*All figures are terrestrial lab/industrial values on MG-Si; lunar performance unproven.
This is a proposal, not a settled design.*
