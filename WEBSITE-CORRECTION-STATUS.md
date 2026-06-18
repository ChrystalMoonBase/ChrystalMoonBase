# Website Correction — Status Report (index.html + codex-data.js)

**Done:** 17 June 2026. Triple-verified. This documents exactly what is corrected
and what (honestly) still needs a native re-translation pass.

---

## ✅ FULLY CORRECTED — verified

### English source (the source of truth) — 100%
- All "basalt" building-material → regolith/anorthosite.
- pc11x: "Titanium from ilmenite … all locally produced" → corrected (aluminium/
  silicon are the local metals; titanium imported; both copies fixed, including a
  corrupted copy that had been mangled by an `&` substitution bug — now clean).
- pc16x: "manufactured entirely from lunar titanium" → titanium is imported (no
  ilmenite at Peary).
- pc18x: dome Layer 1 "Ti wire mesh" → alumina-fibre reinforcement.
- pc19x: centrifuge "30 rpm ≈ 1g" → flagged as a calculation error / unresolved.
- p12.desc: titanium dropped from the "local materials" list (mare, not Peary).
- Location "Sittard" → **Hegelsom** (all 24 occurrences, every language).
- CMB-R1 naming: none remain.
- "200×200 m" is a landing-zone dimension (correct) — not a radiation claim; left.

### All 29 languages — basalt → regolith: 100%
Verified by loading the I18 object in Node: **0 residual basalt-terms across all 29
language blocks**, all 29 blocks intact, JS parses cleanly, brace balance 702/702.
Per-language scientific term used (régolithe / regolito / regolit / реголит /
风化层 / レゴリス / 레골리스 / ريغوليث / रेगोलिथ / etc.).

### codex-data.js (mineral encyclopedia)
- Basalt entry: "primary sintering feedstock" → "mare rock; NOT the Peary feedstock
  (anorthosite is)."
- Basalt Fibre: "Local mare basalt" → "local anorthosite (mare basalt not at Peary)."
- Ilmenite: tag → "Mare ore — scarce at Peary."
- Titanium: tag → "Mare metal — imported at Peary," with the no-ilmenite note.
- (Aluminium-from-anorthosite opening was already highland-correct.)

---

## ✅ CONCEPTUAL FIXES — now applied in all affected languages

The conceptual corrections (full-sentence rewrites) were applied to **every affected
language**, not just English:

| Key | Fix | Languages corrected |
|---|---|---|
| `pc11x` | titanium not local / imported (was "all locally produced") | 16 langs (NL DE FR ES IT PL RO SV CS ID TR VI FIL SW + AR UR) |
| `pc16x` | "lunar titanium" → imported titanium | FIL ID TR VI SW |
| `pc18x` | "Ti wire mesh" → alumina fibre | ZH |
| `pc19x` | "30 rpm ≈ 1g" → calculation error / unresolved | ZH TR KO |

Verified: all old error phrases gone; the JS still loads cleanly (29/29 blocks).

### ⚠ Flagged for a native check (AI-translated, meaning verified, grammar not)
The **non-Latin** conceptual rewrites should get a quick native review:
- **ZH** (pc18x alumina fibre, pc19x centrifuge)
- **KO** (pc19x centrifuge)
- **UR** (pc11x titanium)
- **AR** (pc11x) — note: the Arabic slot actually contained romanized-Russian text
  (a pre-existing data anomaly in the original site, unrelated to our corrections);
  the titanium claim there was neutralised in the same romanized style.

The Latin-script conceptual rewrites (NL DE FR ES IT PL RO SV CS ID TR VI FIL SW)
are verified.

## Verification performed (3×)
1. Brace balance 702/702 (unchanged through every edit).
2. **Node load of the I18 object**: parses cleanly; all 29 language blocks present
   with full key sets; 0 residual basalt. (This pass caught and fixed a real
   pre-existing JS syntax error in pc11x — see above.)
3. Residual-term scan: basalt = 0 everywhere; Sittard = 0; CMB-R1 = 0; remaining
   titanium mentions are either correct (imported penetrator hardware) or the
   flagged non-EN conceptual keys above.
