# Pod — Anchor System

**Chrystal Moon Base · Phase 0.2**
**Status:** Concept proposal — open question, not a flight specification.
**Licence:** CC0

---

## Selected design: Rooted Hybrid (v2.5)

The anchoring problem — how to attach a ~35-metre telescoping mast permanently to the lunar surface — was evaluated across four candidate concepts. After analysis, the **Rooted Hybrid** was identified as the strongest practical baseline.

**→ [mast-anchor-rooted-hybrid.md](./mast-anchor-rooted-hybrid.md) — canonical anchor specification**

### Why Rooted Hybrid

Three design principles make it the most defensible choice:

**Immediate stability** — A central titanium penetrator (120–150 kg) drives 0.5–0.8 metres into the regolith at landing. No waiting. The structure is mechanically locked from the first seconds.

**Permanent bonding** — Sintered regolith root plugs and beams, produced by the CMB8LF-L1 robots using the mast's own laser, chemically and mechanically fuse the anchor to the regolith over 6–8 weeks. Unlike pure mechanical anchors, this cannot loosen.

**Layered redundancy** — Neither the mechanical penetrator nor the sintered roots depends entirely on the other. If one system is weaker than expected due to regolith variability, the other provides backup. This is how serious aerospace structures are designed.

### Key open questions

| Question | Status |
|---|---|
| Regolith bearing capacity at Peary rim (88.63°N) | Requires Phase 0 ground testing |
| Sintering energy 8000 kWh/m³ — scalability to 0.25 m depth | Needs simulation + physical test |
| TRN landing precision — 26.5 m target zone on specific ridge | Engineering verification needed |
| Articulated shell segment reliability after cold soak at −150°C | Material and mechanism testing required |

---

## Archived alternatives

Three alternative anchor concepts were fully documented before the Rooted Hybrid was selected. They are preserved in full — not deleted — because the comparison itself is evidence of rigorous evaluation.

**→ [archive/](./archive/) — Spike, Pure Bloom, Adaptive Bloom**

The archive README explains the tradeoffs that led to the Rooted Hybrid selection.

---

## Files in this directory

| File | Description |
|---|---|
| `mast-anchor-rooted-hybrid.md` | **Canonical anchor design — use this** |
| `mast-overview.md` | Mast and solar curtain system description |
| `archive/` | Three evaluated-and-archived alternative anchor concepts |

---

**Repository:** [github.com/ChrystalMoonBase/ChrystalMoonBase](https://github.com/ChrystalMoonBase/ChrystalMoonBase)
**Contact:** info@chrystalmoonbase.com
