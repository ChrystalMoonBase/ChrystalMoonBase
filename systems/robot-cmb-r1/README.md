# CMB-R1 — Autonomous Octopod Construction Robot

**Chrystal Moon Base · Phase 0.2**
**Status:** Concept proposal — no prototype exists. Open question, not a specification.
**Kinematic reference:** [Robugtix T8](https://www.robugtix.com) — 8 legs, 3 DOF/leg, verified platform
**Licence:** CC0 (documents) · CERN-OHL-S-2.0 (hardware designs)

---

## Design philosophy: sixteen identical, fully capable

There are no specialists. There is no dependency between robots. Every CMB-R1 is identical to every other CMB-R1, and every CMB-R1 can do everything.

This is not a choice driven by elegance. It is driven by reliability. On the Moon there is no repair crew. With sixteen identical chassis, loss of one robot means loss of one-sixteenth of capacity — nothing more. The other fifteen continue unchanged.

---

## Key specifications

| Parameter | Value | Notes |
|---|---|---|
| Mass | ~300 kg | Estimated |
| Legs | 8 × 3-DOF | T8 kinematic architecture |
| Configuration | 6 stance · 2 arm-legs | Front pair — each carries a separate module |
| Foot type | Snowshoe flat plate | 400 × 150 mm — no sinkage in 1/6 g regolith |
| Frame | Ti-6Al-4V | Titanium alloy structural skeleton |
| Armour | Basalt fibre + MgAl2O4 ceramic | Multi-layer thermal and impact protection |
| Power | Laser beaming | GaAs PV receiver, quadrant beam tracking |
| Battery | Solid-state LiPON | One cell per leg segment — local motor power |
| Left arm module | Sintering laser | 10-20 cm compact unit, EPM-swappable |
| Right arm module | W-Re alloy forming tip | Direct basalt shaping, EPM-swappable |
| Heavy tool interface | EPM electropermanent magnet | less than 5 W pulse to lock, 0 W to hold |
| Temperature range | -180C to +130C | Full Peary crater rim operational envelope |
| AI system | Triple Modular Redundancy TMR | Fault-tolerant autonomous control |
| Degraded mode | 5-leg gait | On single leg failure — no mission abort |
| Dust sealing | Triple-ring brush NiC fibre | All joints and rotation interfaces |

---

## The two-arm system: melt and form

This is the core of what the CMB-R1 does. Two arm-legs. Two functions. One continuous motion.

### Left arm — laser module

A compact laser unit (10-20 cm) connects to the left arm-leg via EPM. It melts lunar regolith to approximately 1100-1200 degrees C. The laser module is a swappable unit: if it fails, the robot walks to the tool rack, disconnects the old module, picks up a spare, and resumes in minutes.

### Right arm — W-Re forming tip

A tungsten-rhenium alloy tip connects to the right arm-leg via EPM. While the left arm melts the surface, the right arm presses, shapes, and holds the molten basalt as it cools from ~1200C toward ~800C. The result is a formed, smooth, solid surface.

In vacuum there is no convective cooling. Molten basalt at 1200C in lunar vacuum cools significantly slower than on Earth, giving the forming tip time to work. The viscosity of molten basalt at this temperature is comparable to thick syrup — a few newtons of steady pressure is enough to shape it.

This is, in essence, robotic glassblowing on the Moon. With basalt.

> **Feedstock note:** The ~1,200 °C figure is *basalt-referenced* (from published experiments and simulants). The actual Peary feedstock is highland anorthosite, which melts hotter (~1,550 °C), raising laser-energy demand and tightening forming-tip and cooling margins. See `systems/sintering/laser-sintering-physics.md` → "Melt Temperature — Basalt versus Highland Anorthosite".


**Why W-Re:**

| Property | Value | Significance |
|---|---|---|
| Melting point | above 3000C | Safe margin over molten basalt (~1200C) |
| Ductility | W-25%Re: significantly higher elongation than pure W | Survives arm-leg impact loads without fracture |
| Magnetic | Non-magnetic | Does not attract electrostatically charged lunar dust |
| Chemical stability | No oxidation below 500-600C | In lunar vacuum: zero oxidation |
| Surface coating | HfC melting point 3958C | Reduces molten basalt adhesion to the tip |

**Thermal isolation:** A ceramic thermal break (aerogel + ZrO2 standoffs) sits between the W-Re tip and the Ti-6Al-4V arm structure.

### If a module fails: detach and replace

Both the laser module and the W-Re forming tip connect via the same EPM interface. If either fails:

1. Robot walks to the tool rack
2. EPM pulse — module detaches
3. Robot picks up spare module from rack
4. EPM pulse — locked
5. Robot resumes

No other robot needed. No mission pause. Spare inventory: laser modules, W-Re tips, bulldozer blades, digger tools — all in the same rack, all using the same EPM interface.

### Two robots working together

One robot can operate both arms on a single patch. Two robots can also collaborate: one melts with its left arm while the second forms with its right arm on the same surface. This doubles throughput on critical sections and provides natural redundancy.

---

## All sensors integrated in the chassis

No sensor specialist. Every CMB-R1 carries the full suite permanently:

- Terrain scanner — continuous surface mapping
- Temperature sensors — monitoring sintered surface temperature in real time
- Beam tracking photodiode — quadrant sensor for laser power alignment at 100 Hz
- Structural load sensors — in each leg segment
- Stereo cameras — on the main body

---

## Stability during arm operation

Six stance legs hold the robot steady while both arm-legs work.

**Snowshoe feet** — 400 x 150 mm flat plates distribute ground pressure. No sinkage even under arm reaction forces in 1/6 g regolith.

**Six-leg positioning** — 3 DOF per leg. All six splay wide, lower the centre of mass, and pre-load before arm contact.

**W-Re tip geometry** — the forming tip presses with controlled, predictable force. The HfC coating prevents sticking. The arm releases cleanly at any point in the forming cycle.

---

## Heavy tool operations (EPM-swapped)

When the robot needs to move large volumes of loose regolith or excavate tunnels, it swaps one or both arm modules for heavy tools:

- **[Bulldozer blade](./tools/bulldozer-blade.md)** — Al-Mg-Sc, 1.2 m x 0.4 m
- **[Digger tool](./tools/digger-tool.md)** — counter-rotating bucket drums (Phase 1.2+)

The swap is the same motion as swapping a laser module or forming tip. Walk to rack, EPM pulse, walk away.

---

## What this replaces

**Previous concept (archived):** Four specialist robot types — melter, all-rounder, temperature buddy, bulldozer. Specialist dependency.

**Current concept:** Sixteen identical chassis. Left arm melts. Right arm forms. EPM swaps anything. Nothing depends on a specialist.

---

## Open questions

| Question | Why it matters |
|---|---|
| Does molten basalt adhere to HfC-coated W-Re? | Core feasibility of the forming tip |
| Optimal W-Re tip geometry for basalt shaping | Flat press? Curved blade? Requires physical test |
| Thermal break performance under -150C to +1200C cycling | Ceramic standoffs must survive repeated thermal shock |
| Laser module thermal management in arm-leg | Heat routing within confined arm structure |
| Molten basalt cooling rate in lunar vacuum | Determines working window for the forming tip |
| LiPON battery after repeated thermal cycling | Leg segment power reliability |
| Sintering energy nominal 8000 kWh per cubic metre | Most uncertain number in the entire system |
| Regolith bearing capacity at Peary rim | Determines leg stance force limits |

---

## Directory structure

```
systems/robot-cmb-r1/
├── README.md                         <- this file
├── tools/
│   ├── README.md                     <- EPM interface and spare parts
│   ├── bulldozer-blade.md
│   └── digger-tool.md
└── reference/
    └── kinematic-reference-t8.md
```

---

**Repository:** github.com/ChrystalMoonBase/ChrystalMoonBase
**Contact:** info@chrystalmoonbase.com
