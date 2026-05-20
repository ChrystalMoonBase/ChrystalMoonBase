// ============================================================
// CMB8LF v1 — VACUUM MATERIAL & BUILD CONFIG
// Geldt voor ALLE modules: arm/leg · head · body · leg
// Gebaseerd op Meta update: vacuum-rated self-repair spec
// ============================================================

// ── MATERIAAL SYSTEEM ─────────────────────────────────────────
// STRUCTUREEL (chassis · femur · tibia · QR · armor mounts):
//   Prusament PC Space Grade Black
//   ESA outgassing: TML 0.25% · CVCM 0.00%
//   CubeSat + vacuum chamber gecertificeerd
//   Nozzle: 400°C hardened steel VERPLICHT
//   Bed: 110°C · glue stick · gesloten behuizing
//   Shrinkage: ~0.3% (tol_snap = 0.15mm al gecorrigeerd)
//
// FLEXIBEL (kabelclips · gripper kaken):
//   PEBA Shore 85 · ASTM E595 vacuum-safe
//   Geen TPU (outgast in vacuum)
//
// LIJM (structurele verbindingen):
//   Master Bond EP21TDCHT
//   Vacuum-rated · -196°C tot +177°C
//   Geen cyanoacrylaat · geen epoxy zonder cert.
//
// SMERING (alle lagers · glijvlakken):
//   MoS₂ droog smeervet (Molykote 321R of equiv.)
//   GEEN gewone vet · GEEN WD40 · outgast in vacuum
//
// THERMISCH INTERFACE (servo seats):
//   Bergquist GAP PAD 1.0mm (compressible)
//   Thermisch pasta: MasterSil 323AO-LO (low outgassing)
//
// RADIATIEVE KOELING (armor buitenzijde):
//   Aeroglaze Z306 matte zwart lak
//   Emissiviteit ε = 0.95
//   Spuit op na finale assemblage
//
// ── PRINT INSTELLINGEN PC SPACE GRADE ────────────────────────
//   Nozzle    : 400°C (hardened steel, 0.4mm)
//   Bed       : 110°C (PEI of glue stick)
//   Behuizing : gesloten + verwarmd (~60°C ambient)
//   Fan       : UIT tijdens print
//   Eerste laag: 0.3mm · 20mm/s
//   Structureel: 0.2mm · 40-60% gyroid
//   Detail    : 0.15mm · 20-30% gyroid
//   Supports  : organic · PC Space Grade breekt schoon
//
// ── DUAL MASTER CONCEPT ───────────────────────────────────────
//   Master 1: volledig actief · voert swap uit
//   Master 2: volledig actief clone · ontvangt swap
//   Beide gebouwd op identieke vacuum-rated spec
//   QR interface: ±2mm alignment tolerantie
//   Swap demo: 50+ cycli in lucht voor vacuum test
//
// ── FASERING ─────────────────────────────────────────────────
//   Phase 1 · Earth Demo:
//     Bouw Master 1 + Master 2 in PC Space Grade
//     Valideer been-wissel 50+ cycli in lucht
//     Film het · gebruik als funding pitch
//
//   Phase 2 · Vacuum Test:
//     Gebruik Phase 1 video voor vacuumkamer dag
//     Test zelfde swap bij 10^-5 mbar
//     Doelkost: ~5000 EUR kamertijd
//
//   Phase 3 · Field Prep:
//     Na vacuum-validatie: TRL 5-6
//     Pitchbaar aan: ESA · DLR · private space
//     Geen re-engineering meer (first print = flight print)
//
// ── ELEKTRONICA VACUUM AANPASSINGEN ──────────────────────────
//   DS18B20 per servo    → thermische cutoff 70°C per gewricht
//   INA226 × 4           → stroom alle rails (0x44-0x47)
//   TMP117 × 2           → frame + battery temp
//   PTC fuses per buck   → cascade faults voorkomen
//   E-Stop               → cut beide LiPo packs simultaan
//   Hibernation protocol → Pi5 shutdown non-essentials bij
//                          lage spanning of thermische alarm
//
// ── SMEER + ONDERHOUD PROTOCOL ───────────────────────────────
//   1. F688-2RS lagers: MoS₂ spray voor assemblage
//   2. QR connector pennen: MoS₂ droog
//   3. Dovetail rails: droog (PC Space Grade glijdt zelf)
//   4. Servo gears: intern gesmeerd (DS3240/25/18 sealed)
//   5. Herinspectie na 50 swap cycli
//
// ── VACUUM KWALIFICATIE CHECKLIST ────────────────────────────
//   ☐ Alle PC Space Grade prints: min 48h bake-out 85°C
//   ☐ Outgassing test per batch (QCM sensor)
//   ☐ MoS₂ lube: max 1 laag · geen overflow
//   ☐ EP21TDCHT lijm: 24h cure bij 65°C voor vacuum
//   ☐ GAP PADs: snij op maat · geen overlap met connectors
//   ☐ Z306 coating: 2 lagen · 24h cure · voor assemblage
//   ☐ Alle kabels: NASA-STD-8739.4 harness spec
//   ☐ Connectors: gold-plated · crimp · geen soldeer vlak
//   ☐ QR cyclustest: 50× in lucht · meten trekkracht na
//   ☐ Thermal cycling: -40°C tot +85°C · 10 cycli · check fit
// ============================================================

// Gebruik dit bestand als include in alle modules:
// include <CMB8LF_v1_vacuum_config.scad>

// Materiaal constante voor conditionals in code
MATERIAL = "PC-SpaceGrade";
VACUUM_RATED = true;
PHASE = 1; // 1=Earth demo · 2=Vacuum test · 3=Field

// Nozzle temp reminder (geen effect in OpenSCAD · documentatie)
NOZZLE_TEMP = 400;  // °C · hardened steel verplicht
BED_TEMP    = 110;  // °C

// Thermal cutoff per servo (DS18B20)
SERVO_TEMP_CUTOFF = 70;  // °C

// QR alignment tolerantie
QR_ALIGNMENT_TOL = 2.0;  // mm · autonome koppeling

echo("CMB8LF v1 · Vacuum Config geladen");
echo(str("Materiaal: ", MATERIAL));
echo(str("Vacuum rated: ", VACUUM_RATED));
echo(str("Phase: ", PHASE));
