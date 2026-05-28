# CMB8LF v1 — Print Instellingen v6
## PEEK-CF · Voron 2.4 + Phaetus Rapido HF 2 UHF
**CC0 · Chrystal Moon Base · 2026**

---

## ⚠ VEILIGHEID EERST

PEEK dampen zijn schadelijk bij langdurige blootstelling.
- Zorg voor goede ventilatie (afzuiging of buiten)
- Verlaat ruimte niet onbeheerd tijdens PEEK print
- Nozzle 400°C+ = brandgevaar — brandblussers aanwezig

---

## Printer Vereisten

| Parameter | Minimum | Aanbevolen |
|---|---|---|
| Hotend temperatuur | 380°C | 400-420°C |
| Bed temperatuur | 100°C | 110°C |
| Chamber temperatuur | 45°C | 80-100°C |
| Hotend type | All-metal | Phaetus Rapido HF 2 UHF |
| Nozzle | Hardstaal 0.4mm | Hardstaal 0.4mm |
| Firmware | Klipper aanbevolen | Klipper + Rapido macro's |

---

## Materiaal

**Primair: PEEK-CF (carbon fiber gevuld)**
- Merk: Kimya PEEK-CF of 3DXTech CarbonX PEEK+CF
- TML: < 0.1% (vacuüm gecertificeerd)
- Diameter: 1.75mm
- Bewaar in droogkast (< 20% RV) na openen

**Alternatief voor niet-kritische onderdelen:**
- PA12-CF voor scharnierende onderdelen
- PEEK naturel voor eerste testprints (goedkoper)

---

## Slicer Instellingen

| Parameter | Structureel (botten) | Detail (koppelingen) |
|---|---|---|
| Laagdikte | 0.20mm | 0.15mm |
| Infill % | 40% | 60% |
| Infill type | Gyroid | Gyroid |
| Wanden | 4 | 5 |
| Top/bottom lagen | 5 | 6 |
| Print snelheid | 35mm/s | 25mm/s |
| Ventilator | UIT | UIT |
| Pressure advance | ~0.030 | ~0.025 |

---

## Print Volgorde (per segment, aanbevolen)

1. PEEK naturel testprint (dimensiecontrole)
2. Maatcorrectie: PEEK krimpt ~1.2% — schaal ×1.012 in CAD
3. PEEK-CF productie print
4. Minimaal 2 uur afkoelen in gesloten printer
5. Verwijder ALLEEN als onderdeel < 40°C is
6. 48u stabilisatie voor vacuümtest

---

## Adhesie

- PEI bouwplaat + Magigoo PC
- Bed 110°C voor plaatsen onderdeel
- Eerste laag 0.25mm (iets dikker voor adhesie)
- Rand: 5mm brim voor grote vlakke onderdelen

---

## Probleemoplossing

| Probleem | Oorzaak | Oplossing |
|---|---|---|
| Slechte adhesie | Bed te koud / vuil | 110°C + Magigoo PC |
| Laagscheiding | Chamber te koud | Minimaal 55°C chamber |
| Nozzle verstopt | PEEK gecarboniseerd | 450°C purge + koude trek |
| Barsten na print | Te snel afgekoeld | Langzamer afkoelen in printer |
| Stringing | Temp te hoog / retractie | Verlaag 5°C of verhoog retractie |
