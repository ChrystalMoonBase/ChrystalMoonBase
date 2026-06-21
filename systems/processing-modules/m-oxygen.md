# M-Oxygen — Oxygen Extraction & Purification

**Status:** Concept proposal, sourced. Tentative where noted.
**Licence:** CC0
**Role:** Stage 2/3. The single most important consumable: life-support atmosphere
and propellant oxidiser. Largely a *co-product* of the MRE keystone, then purified.
**Ground truth:** Peary highland / anorthosite (`PEARY-MATERIALS-REFERENCE.md`).

---

## What it does

Oxygen is bound in the regolith as oxides (highland regolith is ~45 % oxygen by
mass). M-Oxygen is mostly **not a separate reactor** — it is the **oxygen output of
M-MRE** (evolved at the anode), captured, cleaned and liquefied/stored.

---

## Input → Output

- **Input:** the anode O₂ stream from M-MRE (plus, optionally, O₂ from water
  electrolysis if local ice is processed).
- **Output:** breathing-grade O₂ (≥99.5 %) for the habitat; LOₓ for propellant.

---

## The science (grounded)

Molten-salt / molten-regolith electrolysis extracts **97–99 % of the feedstock
oxygen**, with higher efficiency on anorthosite than mare. The raw anode gas can carry
traces of co-evolved species and electrode-derived contaminants, so it is cleaned
(scrubbing/drying) and then **cryogenically liquefied** for dense storage. Cryogenic
separation/distillation reaching 99.5 %+ is routine terrestrial practice.

> Alternative/secondary routes exist (hydrogen reduction of ilmenite — but that is a
> *mare* process needing ilmenite, so it is not the Peary route; carbothermal). At
> highland Peary, **electrolysis is the natural oxygen source** because it works
> directly on anorthosite and co-produces the metals.

---

## Conceptual schematic — O₂ capture & storage

```
  M-MRE anode  ──O₂(raw)──►  scrub/dry  ──►  compressor  ──►  cryo-liquefier
                                                                   │
                                          habitat O₂  ◄── buffer ──┤
                                          (≥99.5%)                 ▼
                                                              LOₓ tank (propellant)
```
*Conceptual only; flows, pressures and tank sizing are open parameters.*

---

## Lunar-specific factors

- **Cold sinks help cryogenics:** permanently shadowed regions and the long night
  aid liquefaction/storage — but boil-off management is still a real engineering load.
- **Storage is the hard part, not extraction:** keeping LOₓ cold over the lunar night
  and dust-free transfer are the practical challenges.

---

## Purity (per function)

- Breathing air: **≥99.5 %**, with controlled CO₂/trace removal — easy for cryo.
- Propellant LOₓ: high purity, mainly a water/CO₂-free requirement.

---

## Maturity (honest)

Oxygen-from-regolith is among the **highest-TRL** ISRU goals (multiple processes,
lunar demos targeted late-2020s). The extraction is well studied; the gating items at
Peary are **power** (it rides on MRE) and **cryogenic storage** through the night.

---

## Open questions

1. What contaminants are in the raw MRE anode gas, and what cleanup train removes them?
2. Cryo-storage strategy for the lunar night (active cooling vs PSR passive)?
3. Split between life-support O₂ and propellant LOₓ as the base grows?

---

## References (verify and extend)

- ScienceDirect 2025 — molten-salt electrolysis of anorthosite: 97–99 % O₂.
- Sibille et al. (KSC) — MRE anode O₂, co-evolved gas analysis (AIAA 2009-659). See `m-mre-electrolysis.md` for full citation/links.
- Schreiner/MIT — MRE oxygen sizing for highland regolith.
- Schlüter & Cowley — review of higher-TRL O₂ routes (HRI, MRE, MSE).

*Figures are simulant/lab and modelling values; lunar performance unproven.*
