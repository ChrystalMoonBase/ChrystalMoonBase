// ============================================================
// CMB8LF v1 HL — CMB8LF_v1_HL_sensor_mounts.scad
// Body-integrated sensor & camera mounts.
// REPLACES the old head_module.scad (no head, no pan/tilt).
// Printable insert carriers that drop into the body recesses.
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_HL_config.scad>

RENDER_PART = "all";   // "workpod" / "lidar_cap" / "tof" / "surround" / "all"

// ── Work-sensing pod: holds FLIR Lepton 3.5 + Pi Cam 3 NoIR ─
// behind the sacrificial window, side by side, oblique.
module work_pod() {
    difference() {
        cube([WORKWIN_RECESS, WORKWIN_W, WORKWIN_H], center=true);
        // thermal seat (FLIR Lepton 3.5 ~ 11.8 x 12.7mm)
        translate([0, THERMAL_DX, 0]) cube([WORKWIN_RECESS, 13, 13], center=true);
        // visual seat (Pi Cam 3 module ~ 25 x 24mm board, lens centred)
        translate([0, VISUAL_DX, 0]) cube([WORKWIN_RECESS, 16, 16], center=true);
    }
    // sacrificial window frame (tool-free clip-in)
    translate([WORKWIN_RECESS/2 + WORKWIN_GLASS_T, 0, 0])
    difference() {
        cube([WORKWIN_GLASS_T+2, WORKWIN_W+6, WORKWIN_H+6], center=true);
        cube([WORKWIN_GLASS_T*3, WORKWIN_W, WORKWIN_H], center=true);
    }
}

// ── LiDAR cap: clamps RPLIDAR A1M8 onto the top riser ───────
module lidar_cap() {
    difference() {
        cylinder(d=LIDAR_DIA + 6, h=6);
        translate([0,0,-1]) cylinder(d=LIDAR_DIA, h=8);
        // 3 mount screws
        for (a=[0:120:359]) rotate([0,0,a])
            translate([LIDAR_DIA/2+1.5,0,-1]) cylinder(d=3.2, h=8);
    }
}

// ── Side ToF carrier ────────────────────────────────────────
module tof_carrier() {
    difference() {
        cube([14, 14, 8], center=true);
        cylinder(d=TOF_DIA, h=10, center=true);
    }
}

// ── Surround override camera carrier (wide-angle) ───────────
module surround_cam() {
    difference() {
        cube([18, 18, 12], center=true);
        cylinder(d=SURROUND_CAM_DIA, h=14, center=true);
        // wide FOV chamfer
        translate([0,0,5]) cylinder(d1=SURROUND_CAM_DIA, d2=SURROUND_CAM_DIA+8, h=4);
    }
}

module all_preview() {
    color("SlateGray")              work_pod();
    color("DimGray")  translate([0,120,0]) lidar_cap();
    color("Gray")     translate([0,-120,0]) tof_carrier();
    color("DarkGray") translate([0,160,0]) surround_cam();
}

if      (RENDER_PART == "workpod")  work_pod();
else if (RENDER_PART == "lidar_cap") lidar_cap();
else if (RENDER_PART == "tof")      tof_carrier();
else if (RENDER_PART == "surround") surround_cam();
else all_preview();
