// ============================================================
// CMB8LF v1 HL — CMB8LF_v1_HL_body_chassis.scad
// Head-Less body shell: spider body + integrated sensor
// recesses, 9th (head) coupling BLANKED. 8 leg couplings kept.
// PEEK-CF · two halves (too large for one print)
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_HL_config.scad>

RENDER_PART = "full_preview";   // "top_half" / "bottom_half" / "full_preview"

// ── Reuse the proven spider outline from the base build ─────
// (kept identical so the chassis envelope does not change)
module body_outline(h) {
    hull() {
        translate([0,0,0]) linear_extrude(h)
            scale([BODY_W_MAX/2, BODY_W_MAX/2.5]) circle(d=1);
        translate([BODY_L*0.35, 0, 0]) linear_extrude(h)
            scale([BODY_W_FRONT/2, BODY_W_FRONT/3]) circle(d=1);
        translate([-BODY_L*0.35, 0, 0]) linear_extrude(h)
            scale([BODY_W_REAR/2, BODY_W_REAR/3]) circle(d=1);
    }
}

// ── Sensor recess negatives (subtracted from shell) ─────────
module work_window_recess() {
    // Oblique, recessed window on the front lobe (looks fwd+down)
    translate([WORKWIN_X, 0, WORKWIN_Z])
    rotate([0, WORKWIN_TILT, 0])
    union() {
        // aperture
        cube([WORKWIN_RECESS*2, WORKWIN_W, WORKWIN_H], center=true);
        // sacrificial window seat (slightly larger lip)
        translate([WORKWIN_RECESS, 0, 0])
        cube([WORKWIN_GLASS_T*2, WORKWIN_W+6, WORKWIN_H+6], center=true);
    }
}

module illum_ring_recess() {
    // 6 IR LEDs around the work window + central spotlight
    translate([WORKWIN_X, 0, WORKWIN_Z])
    rotate([0, WORKWIN_TILT, 0]) {
        for (a = [0 : 360/IRLED_COUNT : 359])
            rotate([a, 0, 0])
            translate([0, 0, IRLED_RING_R])
            rotate([0,90,0]) cylinder(d=7, h=WORKWIN_RECESS*2, center=true);
        // spotlight (centre, just below window)
        translate([0, 0, -IRLED_RING_R*0.6])
        rotate([0,90,0]) cylinder(d=SPOT_DIA, h=WORKWIN_RECESS*2, center=true);
    }
}

module tof_recess() {
    // side proximity ToF, both sides
    for (s = [1, -1])
        translate([0, s*BODY_W_MAX/2, TOF_Z])
        rotate([90, 0, 0]) cylinder(d=TOF_DIA, h=12, center=true);
}

module surround_cam_recess() {
    for (az = SURROUND_CAM_AZ)
        rotate([0, 0, az])
        translate([BODY_W_MAX/2 - 4, 0, SURROUND_CAM_Z])
        rotate([0, 90, 0]) cylinder(d=SURROUND_CAM_DIA, h=14, center=true);
}

module fso_recess() {
    translate([FSO_X, 0, BODY_H - 6]) cylinder(d=FSO_DIA, h=14);
}

module lidar_riser() {
    // short fixed riser boss on top centre for the RPLIDAR
    translate([LIDAR_RISER_X, LIDAR_RISER_Y, BODY_H - 1])
    difference() {
        cylinder(d=LIDAR_DIA + 8, h=LIDAR_RISER_H);
        translate([0,0,PEEK_WALL])
        cylinder(d=LIDAR_DIA, h=LIDAR_RISER_H);
        // cable pass-through
        translate([0,0,-1]) cylinder(d=10, h=PEEK_WALL+2);
    }
}

// ── 8 leg couplings (head coupling intentionally absent) ────
module leg_couplings_only() {
    // 4 per side, symmetric — matches base leg positions.
    for (s = [1, -1])
        for (i = [0:3])
            translate([BODY_L*0.30 - i*(BODY_L*0.60/3), s*BODY_W_MAX*0.42, BODY_H*0.5])
            rotate([0, 0, s>0 ? 90 : -90])
            cylinder(d=COUPLING_DIA, h=COUPLING_H, center=true);
}

module body_full() {
    difference() {
        // outer spider shell
        body_outline(BODY_H);
        // hollow electronics bay (same as base)
        translate([0, 0, PEEK_WALL]) scale([0.92,0.92,1]) body_outline(BODY_H);
        // sensor negatives
        work_window_recess();
        illum_ring_recess();
        tof_recess();
        surround_cam_recess();
        fso_recess();
        // 8 leg coupling bores
        leg_couplings_only();
        // NOTE: no 9th/front head coupling bore — HEAD-LESS.
    }
    // add LiDAR riser (positive)
    lidar_riser();
}

if (RENDER_PART == "full_preview") body_full();
else body_full();   // half-split handled by print-prep as in base build
