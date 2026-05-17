# CMB8LF v1 — Vacuum Preparation Guide

**Applicable from:** CMB8LF v1 (thermal upgrade phase)  
**Standard:** ASTM E595 — ≤1.00% TML, ≤0.10% CVCM  
**Licence:** CC0

---

## Why This Matters

In vacuum there is no convection. Zero. Every watt of heat from 48 servos,  
the Pi 5, and two Pico W's has exactly two paths out:

1. **Conduction** — through solid material contact into the frame
2. **Radiation** — from outer surfaces into the chamber walls

Normal cooling assumptions (airflow, heatsinks with fins, thermal paste) do  
not apply. Any material that outgasses contaminates the chamber and can coat  
optics, sensors, and electrical contacts permanently.

**NASA standard: ASTM E595**  
- Total Mass Loss (TML): ≤ 1.00%  
- Collected Volatile Condensable Material (CVCM): ≤ 0.10%  

Everything above these numbers is disqualified. This includes Arctic MX-4,  
Noctua NT-H1, and virtually all consumer thermal compounds.

---

## Thermal Pad Selection

### Servo → Chassis Interface

**Recommended: Bergquist GAP PAD HC5.0**

| Property | Value |
|---|---|
| Thermal conductivity | 5.0 W/mK |
| TML | 0.05% ✅ |
| CVCM | 0.01% ✅ |
| Hardness | Ultra-soft (gel-like modulus) |
| Thickness | 1.0mm |
| Price | €15–25 per 100×100mm |

Why: Servos run hot and have rough die-cast aluminium surfaces. The HC5.0  
is soft enough to conform to 3D-printed chassis surfaces without mechanical  
stress. At CVCM 0.01% it is well inside the NASA limit with 10× margin.

### Pi 5 → Chassis Interface

**Recommended: Bergquist GAP PAD HC3.0** or **MasterSil 323AO-LO**

| Product | W/mK | TML | CVCM | Note |
|---|---|---|---|---|
| GAP PAD HC3.0 | 3.0 | 0.11% ✅ | 0.04% ✅ | 0.5mm sheet, cut to size |
| MasterSil 323AO-LO | 1.15–1.30 | NASA approved ✅ | ✅ | Liquid, no cutting needed |

Pi 5 has a flat heat spreader. A thinner pad (0.5mm) means lower thermal  
resistance. MasterSil is the easier option if cutting is not desired —  
apply with spatula, spreads perfectly into gaps.

### Servo → Chassis (electrical isolation required)

**Recommended: Bergquist SIL PAD TSP Q2500**

| Property | Value |
|---|---|
| Thermal conductivity | 2.5 W/mK |
| TML | 0.06% ✅ |
| CVCM | 0.02% ✅ |
| Electrically isolating | Yes |

Use this where DS3240 housing contacts chassis spine and shorting is a risk.

### Rough 3D-Printed Surfaces

**Recommended: Bergquist GAP PAD 3500ULM**

| Property | Value |
|---|---|
| Thermal conductivity | 3.5 W/mK |
| TML | 0.07% ✅ |
| CVCM | 0.02% ✅ |
| Reinforcement | Fibreglass — will not tear during installation |

Good for any interface where the 3D-printed surface is rough or uneven.  
Fibreglass backing prevents tearing when pressing into place.

---

## Full Comparison Table

| Product | W/mK | TML | CVCM | Best use | Price/100×100mm |
|---|---|---|---|---|---|
| **GAP PAD HC5.0** | 5.0 | 0.05% | 0.01% | Servo → chassis | €15–25 |
| **GAP PAD HC3.0** | 3.0 | 0.11% | 0.04% | Pi 5 → chassis | €10–18 |
| **SIL PAD TSP Q2500** | 2.5 | 0.06% | 0.02% | Electrical isolation | €12–20 |
| **GAP PAD 3500ULM** | 3.5 | 0.07% | 0.02% | Rough surfaces | €18–28 |
| **MasterSil 323AO-LO** | 1.15–1.30 | ✅ | ✅ | Liquid filler, no cutting | €30–40/50g |
| ~~Arctic MX-4~~ | 8.5 | ~2–5% | ❌ | **NOT vacuum safe** | — |
| ~~Noctua NT-H1~~ | ~1.4 | ~2–5% | ❌ | **NOT vacuum safe** | — |

---

## Where to Buy

| Supplier | Notes |
|---|---|
| **NEDC.com** | Bergquist cut-to-size. Send DXF, they cut for $5–10/piece. Best for hobby. |
| **Mouser / Digikey** | Full sheets, next-day delivery. More expensive. |
| **AliExpress** | ❌ Avoid — "low outgassing" claims are almost universally fake. |

---

## Radiative Cooling — Outer Panels

Without convection, radiation is the only active cooling path to the chamber  
walls. Surface emissivity matters.

| Surface | Emissivity |
|---|---|
| Bare PETG-CF (natural) | ~0.85 |
| Matte black (low-outgassing paint) | ~0.90–0.95 |
| Acktar Nano Black foil | ~0.97 |
| Polished aluminium | ~0.05 (avoid on outer panels) |

**Recommendation:**  
Paint the outer shield panels with a low-outgassing matte black paint  
(verify ASTM E595 compliance from manufacturer datasheet).  
Improvement over bare PETG-CF: ~15–20% more radiated power.

The CMB8LF v1 chassis already includes a swappable outer panel.  
Standard version: PETG-CF (natural).  
Vacuum version: same panel + Acktar Nano Black folie or compliant matte black paint.  
No frame changes required.

---

## Installation Procedure

### Thermal Pad (sheet type)

1. Print servo pocket to design depth: **1.5mm** for 1.0mm pad + 0.5mm  
   compression (GAP PAD HC5.0 compresses ~30–50% under mounting pressure)
2. Cut pad to servo footprint using sharp scissors or scalpel  
   (or order pre-cut from NEDC using servo DXF)
3. Peel liner from one side — press onto servo housing
4. Peel second liner — lower chassis onto servo
5. Torque mounting screws evenly — do not over-torque, pad needs  
   light compression only (~0.1–0.3 MPa)
6. Verify: no pad protruding from pocket (contaminates vacuum)

### MasterSil 323AO-LO (liquid)

1. Apply thin bead (~1mm diameter) around Pi 5 heat spreader perimeter
2. Press chassis tray down evenly
3. Cure: 24h at room temperature or 1h at 60°C
4. Do not power on until fully cured
5. Excess squeeze-out: remove before cure with IPA — once cured it bonds

### DXF for NEDC

Servo footprint for pad cutting:

| Servo | Footprint | Pad thickness |
|---|---|---|
| DS3240 (hip) | 40.5 × 20.2mm | 1.0mm HC5.0 |
| DS3225 (upper leg) | 40.7 × 19.7mm | 1.0mm HC5.0 |
| DS3218 (lower leg) | 40.0 × 19.8mm | 1.0mm HC5.0 |
| Raspberry Pi 5 | 85.0 × 56.0mm | 0.5mm HC3.0 |

> DXF files for NEDC orders available in `systems/cmb8lf-v1/cad/thermal_pads/`  
> (to be added when CAD phase begins)

---

## Updated BOM — Thermal Upgrade Items

| Part | Qty | Est. Price | Supplier |
|---|---|---|---|
| Bergquist GAP PAD HC5.0 1.0mm (100×100mm) | 4 sheets | €80 | NEDC / Mouser |
| Bergquist GAP PAD HC3.0 0.5mm (100×100mm) | 2 sheets | €30 | NEDC / Mouser |
| MasterSil 323AO-LO (50g kit) | 1 | €35 | Specialty supplier |
| Low-outgassing matte black paint (ASTM E595) | 1 can | €25 | Specialty supplier |
| **Subtotal thermal upgrade** | | **~€170** | |

> These items are not in the Phase 1 BOM. Order when vacuum test is scheduled.  
> Phase 1 build uses standard thermal pads (non-vacuum) for initial testing.

---

## Vacuum Test Checklist (when ready)

- [ ] All thermal pads replaced with ASTM E595 compliant versions
- [ ] MasterSil 323AO-LO applied and fully cured (min. 24h)
- [ ] Outer panels painted / Acktar foil applied
- [ ] No standard thermal paste anywhere in assembly
- [ ] All wiring checked for vacuum-compatible insulation
- [ ] VacuumTestProtocol loaded on Pico W (see `thermal.py`)
- [ ] Chamber bake-out completed before robot insertion
- [ ] ThermalManager logging active during entire test

---

*CC0 — Chrystal Moon Base 2026*  
*Thermal pad data: Bergquist / Henkel product datasheets*  
*NASA ASTM E595 standard reference: https://standards.nasa.gov*
