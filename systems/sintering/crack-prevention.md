# Crack Prevention in Sintered Basalt
## Chrystal Moon Base — Construction Quality

**Status:** Based on materials science principles and limited published data  
**Licence:** CC0

---

## The Problem

Thermal cracking is the primary quality failure mode in sintered lunar material. When glass-ceramic material cools too rapidly, thermal stress develops faster than the material can relieve it through deformation — and the material cracks.

Cracks in the sintered floor compromise:
- **Structural integrity** — cracks propagate under load, potentially causing surface collapse
- **Dust exclusion** — cracks allow lunar dust to infiltrate sintered areas
- **Future dome foundations** — a cracked surface cannot reliably support dome construction

---

## Physical Mechanism

The thermal expansion coefficient of basalt glass-ceramic is approximately 7–10 × 10⁻⁶ /°C. When a freshly sintered patch at ~1200°C cools to ambient (~−30°C at Peary), it contracts by approximately:

ΔL/L = α × ΔT ≈ 8 × 10⁻⁶ × 1230 ≈ 0.0098 ≈ 1%

A 1% linear contraction in a constrained material (bonded to the surrounding regolith) creates significant tensile stress. If this stress exceeds the tensile strength of the sintered material (estimated 10–50 MPa for glass-ceramic — much lower than compressive strength), cracks form.

---

## Mitigation Strategies

**1. Controlled cooling rate (Thermal Buddy robot):**
The primary mitigation is to control the cooling rate so that thermal stress develops slowly enough for the material to relieve it by creep and micro-deformation rather than cracking. The thermal buddy robot applies infrared heating to the freshly sintered surface to slow cooling.

Target cooling rate: < 50°C/minute (this figure is a rough estimate based on glass annealing literature — actual required rate for lunar basalt composition must be determined experimentally).

### Dual-laser annealing — every robot melts *and* holds

Crack prevention is built into the robot hardware, not left to a single dedicated machine. Every full CMB-R1 carries **two laser functions**: one melts the regolith (sintering), the second holds the just-formed material at temperature and slows its cooling (in-place annealing). The melting laser forms the floor; the annealing laser trails it, keeping the fresh sintered material above the critical cracking temperature until thermal stress has dissipated. This is the glassworker's annealing principle applied per-robot: melt slowly, cool slowly — *slow but sure*. Because the annealing travels with every sintering robot, no point is sintered without immediate cooling-rate control.

The dedicated **Thermal Buddy** role (`systems/robot-cmb-r1/head-thermal-buddy.md`, infrared area heating) complements this at larger area scale — managing the cooling of a broader freshly-built region rather than just the bead behind one robot. Together: per-robot annealing laser for the immediate weld, Thermal Buddy for the surrounding area.

> **Design note / to confirm:** the per-robot dual-laser (melt + anneal) is the current design intent. Its exact relationship to the separate Thermal Buddy robot — whether the Thermal Buddy is a complement at area scale or is partly superseded by per-robot annealing — should be stated consistently across the robot documents in a future pass.

### Separate problem — long-term thermal cycling of the *finished* floor

The dual-laser annealing solves cracking *during construction*. It does **not** address what happens to a large, finished, cooled floor over years of repeated day/night thermal cycling. Two factors make this milder than it first appears, and one keeps it open:

- **Mild cycles at the peak.** On a ~89% illuminated peak the dark period (~11%) is shorter and less extreme than the 14-day night elsewhere on the Moon, so the temperature swing the finished floor sees is smaller than at the equator.
- **Regolith buffering.** The floor sits on/in thermally slow regolith, which damps the rate of temperature change reaching the slab.
- **Still open:** a large, rigid, brittle slab can nonetheless accumulate stress through repeated expansion/contraction. Expansion joints or a ring-segmentation design (sintering the floor as keyed segments rather than one monolithic sheet) are the likely mitigations. Validating the real long-term cracking behaviour — and the joint/segmentation design — is a specific Phase 0 thermal-cycling test task. The annealing lasers cannot help here, because they are not present once the floor is finished.

**2. Pre-heating the surface:**
Before sintering, the surface is pre-heated by the thermal buddy's infrared lamps. A warmer starting temperature reduces the total temperature drop and therefore the total thermal stress.

**3. Segmented sintering:**
Rather than sintering a continuous large area at once, the surface is sintered in smaller segments with time between segments to allow cooling and stress relief. The ring-by-ring pattern naturally creates this segmentation.

**4. Stress-relief scoring:**
In dome construction (not floor sintering), deliberate narrow grooves in the sintered surface at controlled intervals can redirect crack propagation to these planned locations, preventing random cracking. This approach is used in concrete construction on Earth.

---

## Validation Required

The effective cooling rate threshold, the required infrared lamp power and pattern, and the role of surface pre-heating must all be determined experimentally in Demonstrator 1. This cannot be reliably predicted from first principles alone — the specific composition and grain size distribution of the actual sintering material dominates the outcome.
