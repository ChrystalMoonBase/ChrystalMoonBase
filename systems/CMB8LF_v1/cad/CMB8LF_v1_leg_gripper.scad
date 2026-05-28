// ============================================================
// CMB8LF v1 — leg_gripper.scad
// Grijper Been — Benen 1 + 2 (links + rechts)
// Identiek aan standaard been MAAR tibia eindigt in laser palm
// ipv standaard voetpad
// CC0 · Chrystal Moon Base · 2026
// ============================================================
// RENDER_PART:
//   "coxa"         — heup (identiek aan standaard)
//   "femur"        — bovenbeen (identiek aan standaard)
//   "tibia_arm"    — onderbeen voor grijper (aangepast uiteinde)
//   "palm_assembly"— laser palm + 4 vingers
//   "full_arm"     — complete grijper been preview
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>
include <CMB8LF_v1_leg_standard.scad>  // hergebruik coxa + femur

RENDER_PART = "full_arm";

// ── TIBIA VOOR GRIJPER (aangepast uiteinde) ──────────────────
// Identiek aan standaard tibia maar onderste 25mm
// is een adapterplaat voor de palm koppeling
module tibia_arm() {
    difference() {
        // Zelfde buitenvorm als standaard tibia
        rounded_box(TIBIA_OUT_W, TIBIA_OUT_D, TIBIA_L, r=3);

        // Holle kern
        translate([0, 0, PEEK_WALL])
        rounded_box(TIBIA_IN_W, TIBIA_IN_D,
                    TIBIA_L - PEEK_WALL + 1, r=2);

        // Koppeling bovenkant (naar femur)
        translate([0, 0, TIBIA_L - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);

        // Palm koppeling onderkant (anders dan standaard voet)
        // Palm gebruikt DEZELFDE bistabiele koppeling
        translate([0, 0, -1])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);

        // Kabelgoot
        translate([TIBIA_OUT_W/2 - 4, 0, PEEK_WALL + 2])
        cube([5, 8, TIBIA_L - PEEK_WALL * 2], center=true);

        // Heat-set inserts
        for (x = [-TIBIA_OUT_W/2 + 6, TIBIA_OUT_W/2 - 6])
        for (y = [-TIBIA_OUT_D/2 + 6, TIBIA_OUT_D/2 - 6]) {
            translate([x, y, 0]) heat_set(3.2, 8);
            translate([x, y, TIBIA_L - 8]) heat_set(3.2, 8);
        }
    }
}

// ── PALM KOPPELINGSADAPTER ────────────────────────────────────
// Verbindt tibia met AL6061 palmkern
// Overdraagt kracht + draait voor schild-wissel
module palm_adapter() {
    difference() {
        cylinder(d=COUPLING_DIA + 8, h=20);
        // Koppelingsinterface bovenkant (naar tibia)
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 1);
        // Palm bevestiging onderkant (M3 × 4)
        for (a = [0:90:270])
        rotate([0, 0, a])
        translate([PALM_W/3, 0, 15])
        cylinder(d=3.2, h=8);
        // Kabelgoot door midden
        cylinder(d=8, h=21);
    }
}

// ── COMPLETE GRIJPER BEEN PREVIEW ────────────────────────────
module full_arm() {
    space = 20;

    // TIBIA ARM (onderste been segment — aangepast)
    color("DimGray") tibia_arm();
    color("Wheat", 0.4)
    aerogel_mantel(TIBIA_OUT_W, TIBIA_OUT_D, TIBIA_L);
    color("SlateGray", 0.7)
    shield_with_grips(TIBIA_SH_W, TIBIA_SH_D, TIBIA_L,
                      TIBIA_OUT_W, TIBIA_OUT_D);

    // Palm adapter
    translate([0, 0, -space - 20])
    color("Silver")
    palm_adapter();

    // PALM + GRIJPER (uit palm_laser.scad)
    translate([0, 0, -space - 20 - PALM_H])
    color("Silver", 0.9) {
        // Palm kern (vereenvoudigd voor preview)
        rounded_box(PALM_W, PALM_D, PALM_H, r=4);
    }

    // FEMUR (bovenbeen — identiek aan standaard)
    translate([0, 0, TIBIA_L + space]) {
        color("DimGray") femur_bot();
        color("Wheat", 0.4)
        aerogel_mantel(FEMUR_OUT_W, FEMUR_OUT_D, FEMUR_L);
        color("SlateGray", 0.7)
        shield_with_grips(FEMUR_SH_W, FEMUR_SH_D, FEMUR_L,
                          FEMUR_OUT_W, FEMUR_OUT_D);
    }

    // COXA (heup — identiek aan standaard)
    translate([0, 0, TIBIA_L + space + FEMUR_L + space]) {
        color("DimGray") coxa_bot();
        color("Wheat", 0.4)
        aerogel_mantel(COXA_OUT_W, COXA_OUT_D, COXA_L);
        color("SlateGray", 0.7)
        shield_with_grips(COXA_SH_W, COXA_SH_D, COXA_L,
                          COXA_OUT_W, COXA_OUT_D);
    }

    // Laser indicatoren (rood + groen)
    translate([0, 0, -space - 20 - PALM_H - 8]) {
        color("Red",       0.8) translate([-LASER_SPACING/2, 0, 0]) cylinder(d=2.5, h=9);
        color("LimeGreen", 0.8) translate([ LASER_SPACING/2, 0, 0]) cylinder(d=2.5, h=9);
    }
}

// ── RENDER ───────────────────────────────────────────────────
if      (RENDER_PART == "coxa")         coxa_bot();
else if (RENDER_PART == "femur")        femur_bot();
else if (RENDER_PART == "tibia_arm")    tibia_arm();
else if (RENDER_PART == "palm_adapter") palm_adapter();
else    full_arm();
