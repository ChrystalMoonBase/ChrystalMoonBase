# Peary Materials Reference

## Chrystal Moon Base — Ground-Truth Resource Document

**Status:** Reference document — data-grounded, with sources
**Licence:** CC0
**Purpose:** This document is the *source of truth* for what materials actually
exist at the Peary site, in what abundance, and what can realistically be
extracted from them. All processing-module documents must be consistent with
this file. If a module claim conflicts with this file, this file wins — unless
this file is corrected with a better source.

> **Why this document exists.** Earlier versions of the module documents
> assumed a *mare-basalt* composition (iron- and titanium-rich). The Chrystal
> Moon Base site is **Peary crater — lunar highland / anorthosite terrain**,
> which is iron- and titanium-*poor* and aluminium-rich. This file fixes that
> at the root so every module rests on real numbers, not plausible-sounding
> assumptions.

---

## 1. The Site

| Property | Value | Source |
|---|---|---|
| Crater | Peary | [1] |
| Location | 88.63° N, 24.4° E — closest large crater to the lunar **north pole** | [1] |
| Diameter | ~79 km | [1] |
| Depth | ~1.5 km | [1] |
| Terrain type | **Highland (anorthosite)** — *not* mare basalt | [2][3] |
| Rim illumination | Four "peaks of eternal light" on the northern rim — near-permanent sunlight in summer | [4][5][2] |
| Crater floor | Permanently shadowed; ~30–40 K, among the coldest places in the Solar System | [2] |
| Polar ice | Enhanced hydrogen signal measured near Peary (Lunar Prospector); possible ice in nearby permanently shadowed regions — **unconfirmed and unquantified** | [6] |

**Honest caveat on ice:** the lunar **north** pole has substantially fewer
permanently shadowed cold-trap craters than the south pole, and the ice there
is less confirmed [7]. Any water-extraction plan for Peary must treat local ice
as a *possibility to be verified*, not a confirmed reserve.

---

## 2. Bulk Composition — Highland Regolith at a Site Like Peary

Representative average for lunar **highland** material (Warren & Taylor 2013) [3]:

| Oxide | Highland avg (wt %) | Mare basalt (wt %, for contrast) | Meaning for us |
|---|---|---|---|
| **SiO₂** | ~45 | ~45 | Abundant — glass & silicon feedstock |
| **Al₂O₃** | **~27** (locally up to ~31 in pure anorthosite [8]) | ~10–11 | **Very abundant — aluminium is the workhorse metal** |
| **CaO** | ~15–16 | ~10 | Abundant — cement / lime feedstock |
| **FeO** | **~5** | ~15–20 | **Scarce — iron yield is low** |
| **TiO₂** | **~0.4** | up to ~13 (high-Ti mare) | **Effectively absent — titanium not locally viable** |
| **MgO** | ~5–6 | ~6–10 | Minor |

Dominant mineral: **plagioclase feldspar (anorthite, ~An93–97)** — calcium/
aluminium silicate. The highland crust is >90 vol % plagioclase [3].

**Ilmenite (FeTiO₃)** — the titanium ore — is a **mare mineral**. It is scarce
in highland terrain. This is the single most important correction: ilmenite
abundance figures of "1–10 %" quoted in older module text are *mare* numbers and
do **not** apply to Peary.

---

## 3. Element-by-Element Verdict for Peary

**Abundant — build the base around these:**
- **Oxygen** — bound in every silicate; the single most extractable element.
- **Silicon** — SiO₂ ~45 %.
- **Aluminium** — Al₂O₃ ~27 %+. The primary structural metal at this site.
- **Calcium** — CaO ~15 %. Cement / lime feedstock.

**Scarce — do not depend on these locally:**
- **Iron** — FeO ~5 %. Producible but low-yield; better recovered as a
  by-product (ferrosilicon) than as a primary target.
- **Titanium** — TiO₂ ~0.4 %, no ilmenite ore. **Not locally viable.** Any
  titanium is an import item, not an ISRU product, at Peary.

**Trace — honest about marginality:**
- **Hydrogen / Water** — possible polar ice (unconfirmed) + trace solar-wind H.
- **Nitrogen** — tens of ppm, solar-wind implanted. Poor yield.
- **Helium-3** — ~ppb, *lower* in highlands than mare. Speculative.

---

## 4. Realistic Extraction Processes (with sources)

### The workhorse: Molten Regolith Electrolysis (MRE)
Melt regolith, pass current through the melt: **oxygen** collects at the anode,
a **metal alloy** (typically **ferrosilicon**) at the cathode. Repeatedly
identified as the **most effective** single ISRU process, and it works on
**highland** regolith [9][10]. A modelled plant: ~6,776 kg of hardware produces
~25 t/year of ferrosilicon alloy **and** ~23.9 t/year of oxygen from highland
regolith [10]. This single process covers oxygen *and* a structural metal alloy
at once — strong candidate as the base's primary metallurgy.

### Oxygen (M-Oxygen)
Options: MRE (above), hydrogen reduction, carbothermal reduction [11]. MRE has
shown near-complete (~96 %) oxygen recovery at ~950 °C [12]. **Verdict: solid at
Peary** — oxygen is in all minerals regardless of terrain.

### Aluminium (M-Aluminium) — primary structural metal
**FFC-Cambridge / molten-salt electrolysis at ~600 °C** has been demonstrated to
reduce **anorthite** (the abundant highland mineral) into aluminium, co-producing
oxygen, water and silica [13]. Requires a hydrogen-chloride / salt supply that
must be managed. **Verdict: strongly supported at Peary** — the feedstock is
exactly what the site has most of.

### Silicon (M-Silicon)
Carbothermal or aluminothermal reduction of SiO₂; or recovered as the "-silicon"
half of ferrosilicon from MRE. Photovoltaic-grade purity remains the hard part.
**Verdict: feedstock abundant; purity is the open challenge.**

### Glass (M-Glass)
Melt the silicate fraction (>1400 °C), cast or draw. SiO₂ is abundant.
**Verdict: solid — keep as first processing module.**

### Iron / Steel (M-Iron)
Hydrogen reduction of iron oxides works, but highland FeO is only ~5 %.
Low-carbon steel via ilmenite is only effective above **~7.5 wt % ilmenite** [9]
— a threshold Peary highland regolith does **not** meet. **Verdict: low-yield;
treat iron as a ferrosilicon by-product of MRE, not a primary target.**

### Titanium (M-Titanium)
No ilmenite ore locally. **Verdict: not an ISRU product at Peary.** Re-scope as
an import item or a long-term option contingent on finding a local Ti source.

### Cement (M-Cement)
Geopolymer cement from anorthite (Ca/Al-rich) at low temperature; anorthite
contains ~20 % lime, which can be enriched [14]. **Verdict: well-supported** —
complements (does not replace) sintered regolith.

### Structural fibre (was "M-Basalt")
**True basalt fibre needs basalt melt, which Peary does not have.** Local melt is
anorthosite (higher melting point ~1,550 °C vs ~1,200 °C for basalt; different
viscosity). **Verdict: rename to mineral / anorthosite fibre; properties differ
from basalt fibre and are not yet characterised. Do not call it "basalt."**

### Water / Propellant (M-Water, M-Fuel)
Polar-ice extraction *if* ice is confirmed near Peary's shadowed floor; plus
trace water from regolith processing. Electrolyse → H₂ + O₂ → cryogenic
propellant. **Verdict: physically sound, but gated on unconfirmed north-pole ice.
Reference Peary / the north pole — never the south pole.**

### Nitrogen, Helium-3 (M-Nitrogen, M-Helium3)
Thermal desorption of solar-wind volatiles. Both very low yield in highlands;
He-3 also has no working fusion reactor to use it. **Verdict: keep, but keep the
existing honest "speculative / poor-yield" caveats.**

---

## 5. How To Use This File (for the 5-eenheid)

When any AI is asked to "check" a module, interne consistentie alone is **not**
verification. Check every material claim against Section 2–4 of this file. If a
claim has no source here and none can be found, mark it **[unverified]** rather
than affirming it. Plausible ≠ correct.

---

## Sources

1. Peary (crater), Wikipedia — coordinates, diameter, depth, floor temperature, peaks of eternal light. https://en.wikipedia.org/wiki/Peary_(crater)
2. Astronomy.com / Bussey — north-pole region is highlands terrain; Peary rim illumination. https://www.astronomy.com/science/eternal-light-at-a-lunar-pole/
3. Lunar ore geology review (arXiv 2402.02614), citing Warren & Taylor (2013): highland average ~5.0 wt% FeO, ~0.4 wt% TiO₂, ~27 wt% Al₂O₃; highlands >90 vol% plagioclase. https://arxiv.org/pdf/2402.02614
4. Bussey et al. (2005), *Nature* 434:842 — constant illumination on Peary's northern rim. https://www.nature.com/articles/434842a
5. "Ideal landing sites near the lunar poles," LPSC 2004 — four constantly illuminated regions on Peary rim. https://www.lpi.usra.edu/meetings/lpsc2004/pdf/1582.pdf
6. LPSC 2004 (as above) — Peary lit regions lie within a zone of enhanced hydrogen (Lunar Prospector).
7. Lunar south pole, Wikipedia — north pole has fewer sheltered cold-trap craters than the south. https://en.wikipedia.org/wiki/Lunar_south_pole
8. White Mountain anorthosite simulant (LPSC 2020): SiO₂ 50.2, Al₂O₃ 30.9, CaO 14.6, TiO₂ 0.05 wt% (pure-anorthosite end member). https://www.hou.usra.edu/meetings/lpsc2020/pdf/2867.pdf
9. Comprehensive review of lunar manufacturing (arXiv 2408.05823) — MRE most efficient; low-carbon steel needs ilmenite >7.5 wt%. https://arxiv.org/pdf/2408.05823
10. Guerrero-González & Zabel, *Acta Astronautica* (2023) — highland-regolith MRE plant: 6776 kg hardware → 25 t/a ferrosilicon + 23.9 t/a O₂. https://ui.adsabs.harvard.edu/abs/2023AcAau.203..187G/abstract
11. Science.gov molten regolith electrolysis topic page — ISRU O₂ routes (H₂ reduction, carbothermal, MOE). https://www.science.gov/topicpages/m/molten+regolith+electrolysis.html
12. Lomax et al. via review — molten salt electrolysis ~96% O₂ recovery at ~950 °C.
13. LISAP-MSE, *Acta Astronautica* (2025) — FFC-Cambridge molten-salt electrolysis of anorthite at 600 °C for aluminium + O₂. https://www.sciencedirect.com/science/article/pii/S0094576525002747
14. NASA SP-509 lunar cement — anorthite ~20% lime, enrichable toward Portland-range. https://nss.org/settlement/nasa/spaceresvol3/lunacem1.htm

---

*Owner: Berechja Kerkdijk · Chrystal Moon Base · Nexus Ignis B.V.*
*If you correct this file, cite your source.*
