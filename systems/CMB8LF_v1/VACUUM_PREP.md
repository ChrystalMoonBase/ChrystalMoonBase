# CMB8LF v1 — Vacuümvoorbereiding v6
**Protocollen voor vacuümkamertesting**
**CC0 · Chrystal Moon Base · 2026**

---

## Vacuüm Test Doelstelling

Doel: 10⁻⁵ mbar (vergelijkbaar met lage maan-omgeving)
Kosten: ~€5.000 extern lab (DLR, TNO, of universiteit)
Certificeringniveau: TRL 4-5

---

## Materiaal Gereedheidsmatrix

| Onderdeel | Fase 1 (lucht) | Fase 2 (vacuüm) | Actie vereist |
|---|---|---|---|
| PEEK-CF structuur | ✅ | ✅ TML <0.1% | Geen |
| PA12-CF | ✅ | ✅ | Geen |
| Si₃N₄ lagers | ✅ | ✅ | Geen |
| MoS₂ droogfilm | ✅ | ✅ | Geen |
| moteus r4.11 PCB | ✅ | ⚠️ | Aeroglaze Z306 coating |
| 16340 cellen | ✅ | ⚠️ | Afdichten in PEEK behuizing |
| Silicoon kabel | ✅ | ✅ | Geen |
| NdFeB magneten | ✅ | ✅ | Geen |
| Bergquist thermisch | ✅ | ✅ TML 0.05% | Geen |
| MasterSil 323AO-LO | ✅ | ✅ | Geen |
| Aeroglaze Z306 | ✅ | ✅ | — (dit IS de coating) |
| MG90S servo (vingers) | ✅ | ⚠️ | Vervangen voor vluchtversie |

---

## Voorbereidingsstappen

### Stap 1 — Buitenste reiniging (48u voor test)
- Was alle onderdelen met IPA 99% (geen water)
- Droog 24u in schone omgeving (stofvrij)
- Geen vingerafdrukken — gebruik poedervrije handschoenen

### Stap 2 — PCB coating
- Spuit moteus PCB's met Aeroglaze Z306
- 2 dunne lagen, 4u tussen lagen
- Uitharden 24u bij kamertemperatuur

### Stap 3 — Batterij afdichting
- Seal 16340 pakketten volledig in PEEK behuizing
- MasterSil 323AO-LO op alle naden
- 24u uitharden voor plaatsing

### Stap 4 — Power-up volgorde (in vacuümkamer)
1. Voeding via externe connectoren
2. Wacht op druk stabilisatie (10⁻³ mbar minimum)
3. Pico W #2 (safety) eerst aanzetten
4. Wacht 30 seconden — thermische monitoring actief
5. Pico W #1 aanzetten
6. Pi5 als laatste
7. Wacht 60 seconden — self-test doorlopen

### Stap 5 — Beweging test in vacuüm
- Kleine bewegingen eerst (10% bereik)
- Observeer MoS₂ lagers — geen vastlopen
- Temperatuur monitoring kritisch — geen convectie!
- Maximale motorbelasting lager dan in lucht

---

## Thermisch Management in Vacuüm

**KRITIEK:** In vacuüm verdwijnt warmte alleen via straling.
Motoren worden significant warmer dan in lucht.

- Maximale duty cycle: 50% in vacuüm (vs 80% in lucht)
- Rust periode verplicht na elke beweging
- Thermische shutdown limieten worden strenger:
  - Waarschuwing: 45°C (vs 55°C in lucht)
  - Stop: 60°C (vs 70°C in lucht)

---

## Verboden Materialen in Vacuüm

❌ Olie / vet / smeer (verdampt, contamineert sensor)
❌ Loctite 243 (borderline — vervangen door EP21TDCHT)
❌ PLA, ABS, PETG (hoge outgassing)
❌ TPU 95A (outgassing — vervangen door PEBA)
❌ Gewone isopropanol (100% puur vereist)
❌ Rubberen O-ringen (specifieke vacuüm-grade vereist)
