# CMB8LF-S1 — Dimensie Overzicht v2
## Alle maten berekend van binnen naar buiten
**CC0 · Chrystal Moon Base · 2026**

---

## Maatcascade Principe

```
ELEKTRONICA (datasheets)
    ↓ + 2mm speling
BOT BINNENMAAT
    ↓ + 3mm PEEK-CF wand
BOT BUITENMAAT
    ↓ + 10mm aerogel (als spieren om bot — blijft bij wissel)
AEROGEL BUITENKANT
    ↓ + 3mm schild wand
SCHILD BUITENMAAT (met gripuitsparingen)
    ↓ grijper pakt hier
GRIJPER SPANWIJDTE
```

---

## Segment Dimensies

| Segment | Bot Binnen | Bot Buiten | Aerogel | Schild Buiten | Lengte |
|---|---|---|---|---|---|
| **Coxa** | 54 × 72mm | 60 × 78mm | 10mm | **86 × 104mm** | 85mm |
| **Femur** | 52 × 70mm | 58 × 76mm | 10mm | **84 × 102mm** | 145mm |
| **Tibia** | 50 × 68mm | 56 × 74mm | 10mm | **82 × 100mm** | 105mm |

---

## Elektronica Binnenmaat Bepaling

### Coxa (heup) — GM5208-150T motor
```
GM5208 motor:      ⌀50.0 × 20.0mm
moteus r4.11:       46 × 46 × 14mm
6× 16340 batterij: 32 × 48 × 34mm (2×3 blok)
6S BMS mini:       50 × 30 × 5mm
RP2350:            25 × 25 × 5mm
─────────────────────────────────
Minimaal nodig:    52 × 70mm
+ 2mm speling:     54 × 72mm ✓
```

### Femur (bovenbeen) — GM4108H-120T motor
```
GM4108H motor:     ⌀40.8 × 26.0mm
moteus r4.11:       46 × 46 × 14mm  ← dominant
6× 16340 batterij: 32 × 48 × 34mm
─────────────────────────────────
Minimaal nodig:    50 × 68mm
+ 2mm speling:     52 × 70mm ✓
```

### Tibia (onderbeen) — GM3506-2 motor
```
GM3506 motor:      ⌀35.0 × 20.0mm
moteus r4.11:       46 × 46 × 14mm  ← dominant
6× 16340 batterij: 32 × 48 × 34mm
─────────────────────────────────
Minimaal nodig:    48 × 65mm
+ 2mm speling:     50 × 68mm ✓
```

---

## Aerogel Dikte Berekening

```
Peary rim buitentemperatuur:     -50°C (worst case)
Elektronica doeltemperatuur:     +25°C nominaal
Temperatuurverschil ΔT:          75°C nominaal · 90°C worst case

Aerogel λ:                       0.015 W/m·K
Intern warmtevermogen motor:     ~5W per segment
Segmentoppervlak:                ~0.04 m²
Interne warmteflux:              125 W/m²

Benodigde dikte:
d = λ × ΔT / flux = 0.015 × 90 / 125 = 0.011m = 11mm

Gekozen: 10mm (prototype) · 15mm (vluchtversie)
```

---

## Gripuitsparing Geometrie

```
Doel: grijper pakt schild vast · kwart slag · schild los
Aerogel blijft OM het bot · schild gaat er recht af

4 uitsparingen · 90° verdeling
Vorm: trapezium (zelfcentrerend — vinger glijdt in positie)

Afmetingen:
  Diepte:        8mm   (vinger grijpt zeker)
  Breedte buiten: 16mm  (vinger 12mm + 2mm speling)
  Breedte binnen: 12mm  (trapezium versmalt → centrering)
  Hoogte:        20mm  (langs bot)
  Positie:       35% van elk uiteinde

Bajonet vergrendeling:
  4 nokken op schild (45° verdeling)
  4 L-sleuven op schild (kwart slag vergrendeling)
  Geen gereedschap · geen lijm · grijper doet het
```

---

## Grijper Spanwijdte

```
Grootste object om te pakken: coxa schild = 86 × 104mm
Vereiste spanwijdte box grip: 104 + 2 × 3mm speling = 110mm

Vinger lengte:    55mm
Vinger breedte:   12mm
Palm breedte:     70mm
Palm diepte:      55mm

Box grip (4 vingers sluiten):   110mm span
Pincet grip (2 vingers):        60mm span
Voet modus (4 open):            breed uitgespreid
```

---

## Laser Palm

```
Palm kern (AL6061):    70 × 55 × 42mm
Laser boring L1:       ⌀5.7mm · 808nm sinter
Laser boring L2:       ⌀5.7mm · 976nm anneal
Hart-op-hart:          5.0mm
Werkafstand:           1–3mm
MLX90614 pocket:       ⌀4.8mm · tussen lasers
```

---

## Body

```
Lengte:          400mm
Breedte midden:  300mm (breedste · bij been 3-6)
Breedte voor:    200mm (bij hoofd)
Breedte achter:  180mm
Hoogte:          85mm
Vorm:            Spin · achthoekig elliptisch
```

---

## Hoofd

```
Breedte:   90mm
Diepte:    70mm
Hoogte:    60mm
Positie:   TUSSEN been 1 en been 2 (niet bovenop)
Pan:       ±90°
Tilt:      -45° tot +90°
```

*DIMENSIONS_v2.md · berekend uit datasheets · CC0 2026*
