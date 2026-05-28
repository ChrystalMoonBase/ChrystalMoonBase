// ============================================================
// CMB8LF v1 — palm_laser.scad v2
// Laser Palm + 4-Vinger Grijper
// Maten berekend: spanwijdte 110mm · palm 70mm breed
// 808nm sinter · 976nm anneal · gripuitsparingen compatibel
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>

RENDER_PART = "full_assembly";

// ── PALM KERN (AL6061-T6) ────────────────────────────────────
module palm_kern() {
    difference() {
        rounded_box(PALM_W, PALM_D, PALM_H, r=4);

        // Laser boring L1 (808nm sinter) — links van midden
        translate([-LASER_SPACING/2, 0, -1])
        cylinder(d=LASER_BORE_DIA, h=PALM_H + 2);

        // Counter bore voor lensbarrel L1
        translate([-LASER_SPACING/2, 0, -1])
        cylinder(d=5.2, h=10);

        // Laser boring L2 (976nm anneal) — rechts van midden
        translate([LASER_SPACING/2, 0, -1])
        cylinder(d=LASER_BORE_DIA, h=PALM_H + 2);

        // Counter bore voor lensbarrel L2
        translate([LASER_SPACING/2, 0, -1])
        cylinder(d=5.2, h=10);

        // MLX90614 pocket (tussen lasers, naar voren)
        translate([0, -PALM_D/4, PALM_H - 10])
        cylinder(d=4.8, h=12);

        // Driver PCB uitsparing (achterkant palm)
        translate([0, 0, PALM_H - 20])
        rounded_box(PALM_W - 8, PALM_D - 8, 22, r=2);

        // JST-SH connector recess (rechtsonder achter)
        translate([PALM_W/2 - 10, PALM_D/2 - 6, PALM_H - 14])
        cube([12, 8, 15]);

        // Thermische pad vlak (achter)
        translate([0, PALM_D/2 - 2, PALM_H * 0.3])
        cube([PALM_W - 8, 3, PALM_H * 0.5], center=true);

        // Vinger servo gaten (4× zijkant)
        for (x = [-PALM_W * 0.28, PALM_W * 0.28])
        for (side = [-1, 1]) {
            translate([x, side * (PALM_D/2), PALM_H * 0.45])
            rotate([90, 0, 0])
            cylinder(d=9, h=PALM_D + 2);
            // M2 bevestigingsbouten servo
            translate([x, side * (PALM_D/2), PALM_H * 0.65])
            rotate([90, 0, 0])
            cylinder(d=2.2, h=PALM_D + 2);
        }

        // M2 heat-set (4× hoeken voor PEEK-CF schaal)
        for (x = [-PALM_W/2 + 5, PALM_W/2 - 5])
        for (y = [-PALM_D/2 + 5, PALM_D/2 - 5])
        translate([x, y, PALM_H - 7])
        heat_set(2.2, 7);

        // Koppeling naar tibia (bovenkant)
        translate([0, 0, PALM_H - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);
    }

    // Laser koelvin (kleine aluminium fin aan achterkant)
    translate([0, PALM_D/2, PALM_H * 0.4])
    cube([PALM_W * 0.6, 4, PALM_H * 0.3], center=true);
}

// ── GRIJPERVINGER ────────────────────────────────────────────
// Spanwijdte box grip: 110mm → vingers moeten 110/2 = 55mm bereiken
// Vinger lengte: 55mm · breedte: 12mm · dikte: 10mm

module finger() {
    difference() {
        union() {
            // Vinger lichaam
            rounded_box(FINGER_W, FINGER_H, FINGER_L, r=2);
            // Scharniercilinderr
            translate([0, 0, FINGER_L - 6])
            rotate([90, 0, 0])
            cylinder(d=FINGER_W, h=FINGER_H + 4, center=true);
        }

        // Gewicht besparing
        translate([0, 0, FINGER_L * 0.3])
        rounded_box(FINGER_W - 5, FINGER_H - 4,
                    FINGER_L * 0.5, r=1);

        // Servo arm koppeling
        translate([0, 0, FINGER_L - 10])
        cylinder(d=5, h=12);

        // Grip profiel onderkant (zelf-centrerende richels)
        for (z = [4 : 7 : FINGER_L * 0.65])
        translate([0, FINGER_H/2, z])
        rotate([45, 0, 0])
        cube([FINGER_W + 2, 2.5, 2.5], center=true);
    }
}

// ── PALM SCHAAL (PEEK-CF buitenkant) ─────────────────────────
module palm_schaal() {
    difference() {
        rounded_box(PALM_W + 6, PALM_D + 6, PALM_H - 5, r=5);
        // Palm kern uitsparing
        translate([0, 0, 2])
        rounded_box(PALM_W + 1, PALM_D + 1, PALM_H, r=3);
        // Laser vensters (2 gaten voor)
        translate([-LASER_SPACING/2, -PALM_D/2 - 1, 4])
        cylinder(d=4, h=8);
        translate([LASER_SPACING/2, -PALM_D/2 - 1, 4])
        cylinder(d=4, h=8);
        // Camera venster (MLX)
        translate([0, -PALM_D/2 - 1, PALM_H - 12])
        cylinder(d=5, h=8);
    }
}

// ── VOLLEDIGE ASSEMBLY ────────────────────────────────────────
module full_assembly() {
    // Aluminium palmkern
    color("Silver") palm_kern();

    // PEEK-CF schaal
    color("DimGray", 0.5)
    translate([0, 0, 2]) palm_schaal();

    // 4 vingers
    vinger_kleur = "SlateGray";
    vinger_offset_x = GRIP_SPAN/2 - FINGER_W/2;  // 49mm van midden

    color(vinger_kleur, 0.9) {
        // Vinger 1 — voor links (sluit naar midden)
        translate([-vinger_offset_x, -(PALM_D/2 + FINGER_L * 0.5), PALM_H/2])
        rotate([15, 0, 0]) finger();

        // Vinger 2 — voor rechts
        translate([vinger_offset_x, -(PALM_D/2 + FINGER_L * 0.5), PALM_H/2])
        rotate([15, 0, 0]) finger();

        // Vinger 3 — achter links
        translate([-vinger_offset_x, PALM_D/2 + FINGER_L * 0.5, PALM_H/2])
        rotate([-15, 0, 0]) finger();

        // Vinger 4 — achter rechts
        translate([vinger_offset_x, PALM_D/2 + FINGER_L * 0.5, PALM_H/2])
        rotate([-15, 0, 0]) finger();
    }

    // Laser indicatoren
    color("Red", 0.7)
    translate([-LASER_SPACING/2, 0, -8])
    cylinder(d=2.5, h=9);

    color("LimeGreen", 0.7)
    translate([LASER_SPACING/2, 0, -8])
    cylinder(d=2.5, h=9);

    // Spanwijdte referentielijn (preview hulp)
    color("Cyan", 0.2)
    translate([0, 0, PALM_H/2])
    cube([GRIP_SPAN, 1, 1], center=true);
}

// ── BOX GRIP PREVIEW (hoe vingers sluiten) ───────────────────
module box_grip_closed() {
    color("Silver") palm_kern();
    // Vingers gesloten rondom object van 104mm
    for (a = [0, 90, 180, 270])
    rotate([0, 0, a])
    translate([GRIP_SPAN/2 - FINGER_W/2, 0, PALM_H/2])
    rotate([0, 0, a < 180 ? 0 : 0])
    color("SlateGray") finger();
}

// ── RENDER ───────────────────────────────────────────────────
if      (RENDER_PART == "palm_kern")    palm_kern();
else if (RENDER_PART == "finger")       finger();
else if (RENDER_PART == "palm_schaal")  palm_schaal();
else if (RENDER_PART == "box_grip")     box_grip_closed();
else    full_assembly();
