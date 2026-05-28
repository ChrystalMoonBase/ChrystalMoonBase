// ============================================================
// CMB8LF v1 — head_module.scad
// Hoofd Module — Alle Sensoren · Pan + Tilt
// Positie: TUSSEN been 1 en been 2 (niet bovenop)
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>

RENDER_PART = "full_assembly";

module head_body() {
    difference() {
        rounded_box(HEAD_W, HEAD_D, HEAD_H, r=5);
        // Holle kern
        translate([0, 0, PEEK_WALL])
        rounded_box(HEAD_W - 2*PEEK_WALL,
                    HEAD_D - 2*PEEK_WALL,
                    HEAD_H, r=3);
        // Camera venster (voor)
        translate([0, -HEAD_D/2 - 1, HEAD_H*0.4])
        rotate([90, 0, 0])
        union() {
            // Pi Camera 3 NoIR
            translate([-12, 0, 0])
            cube([24, 16, 10], center=true);
            // FLIR Lepton 3.5
            translate([18, 0, 0])
            cube([13, 13, 10], center=true);
        }
        // RPLIDAR ruimte (boven)
        translate([0, 0, HEAD_H - 12])
        cylinder(d=70, h=14);
        // ToF sensors (zijkanten)
        translate([HEAD_W/2, 0, HEAD_H*0.4])
        rotate([0, 90, 0])
        cylinder(d=8, h=10);
        translate([-HEAD_W/2, 0, HEAD_H*0.4])
        rotate([0, 90, 0])
        cylinder(d=8, h=10);
        // IR LED array gaten (6×)
        for (a = [-60:30:60])
        rotate([0, 0, a])
        translate([HEAD_W*0.3, -HEAD_D/2, HEAD_H*0.35])
        cylinder(d=7, h=10);
        // RGB ogen (WS2812B ×2)
        translate([-15, -HEAD_D/2, HEAD_H*0.55])
        cylinder(d=6, h=8);
        translate([15, -HEAD_D/2, HEAD_H*0.55])
        cylinder(d=6, h=8);
        // Spotlight (10W voor)
        translate([0, -HEAD_D/2, HEAD_H*0.2])
        cylinder(d=18, h=10);
        // FSO laser comm (boven-voor)
        translate([0, -HEAD_D*0.3, HEAD_H - 8])
        cylinder(d=12, h=10);
        // Koppeling onderkant (identiek aan been koppeling)
        translate([0, 0, -1])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);
    }
}

module pan_tilt_base() {
    // Pan-as behuizing
    difference() {
        cylinder(d=50, h=20);
        cylinder(d=MOTOR_FEMUR_DIA + 2, h=21);
        // Lager uitsparing
        translate([0, 0, 12])
        difference() {
            cylinder(d=32, h=9);
            cylinder(d=22, h=9);
        }
    }
}

module full_assembly() {
    // Pan base
    color("DimGray") pan_tilt_base();
    // Hoofd (iets omhoog voor tilt as)
    color("SlateGray", 0.9)
    translate([0, 0, 25])
    head_body();
    // RPLIDAR (transparent voor preview)
    color("DarkGray", 0.5)
    translate([0, 0, 25 + HEAD_H - 8])
    cylinder(d=68, h=30);
}

if (RENDER_PART == "head_body")      head_body();
else if (RENDER_PART == "pan_base")  pan_tilt_base();
else full_assembly();
