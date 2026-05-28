// ============================================================
// CMB8LF v1 — body_chassis.scad
// Body Chassis — Spin Geometrie · 9 Koppelingspunten
// PEEK-CF · Twee helften (te groot voor 1 print)
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>

// RENDER_PART = "top_half" / "bottom_half" / "full_preview"
RENDER_PART = "full_preview";

// Spin-vormige body: elliptisch, breedst in midden
module body_outline(h) {
    // Complexe spin-vorm via hull van ellipsen
    hull() {
        // Midden (breedste)
        translate([0, 0, 0])
        linear_extrude(h)
        scale([BODY_W_MAX/2, BODY_W_MAX/2.5])
        circle(d=1);

        // Voor (smaller — hoofd positie)
        translate([BODY_L*0.35, 0, 0])
        linear_extrude(h)
        scale([BODY_W_FRONT/2, BODY_W_FRONT/3])
        circle(d=1);

        // Achter (smaller)
        translate([-BODY_L*0.35, 0, 0])
        linear_extrude(h)
        scale([BODY_W_REAR/2, BODY_W_REAR/3])
        circle(d=1);
    }
}

module body_full() {
    difference() {
        // Buitenvorm
        body_outline(BODY_H);

        // Holle binnenkern (electronics bay)
        translate([0, 0, PEEK_WALL])
        hull() {
            translate([0, 0, 0])
            linear_extrude(BODY_H - PEEK_WALL)
            scale([(BODY_W_MAX - 2*PEEK_WALL*2)/2,
                   (BODY_W_MAX/2.5 - PEEK_WALL*2)])
            circle(d=1);

            translate([BODY_L*0.35 - PEEK_WALL, 0, 0])
            linear_extrude(BODY_H - PEEK_WALL)
            scale([(BODY_W_FRONT - 2*PEEK_WALL*2)/2,
                   (BODY_W_FRONT/3 - PEEK_WALL)])
            circle(d=1);

            translate([-(BODY_L*0.35 - PEEK_WALL), 0, 0])
            linear_extrude(BODY_H - PEEK_WALL)
            scale([(BODY_W_REAR - 2*PEEK_WALL*2)/2,
                   (BODY_W_REAR/3 - PEEK_WALL)])
            circle(d=1);
        }

        // 8 been koppelingspunten (rondom)
        // Positie bepaald door LEG_ANGLES
        leg_positions = [
            // [x_offset, y_offset, angle] voor elk been
            [BODY_L*0.30,  BODY_W_MAX*0.38, 0],   // been 1 voor-links
            [BODY_L*0.30, -BODY_W_MAX*0.38, 0],   // been 2 voor-rechts
            [BODY_L*0.12,  BODY_W_MAX*0.48, 0],   // been 3 midden-voor-links
            [BODY_L*0.12, -BODY_W_MAX*0.48, 0],   // been 4 midden-voor-rechts
            [-BODY_L*0.12, BODY_W_MAX*0.48, 0],   // been 5 midden-achter-links
            [-BODY_L*0.12,-BODY_W_MAX*0.48, 0],   // been 6 midden-achter-rechts
            [-BODY_L*0.30, BODY_W_MAX*0.38, 0],   // been 7 achter-links
            [-BODY_L*0.30,-BODY_W_MAX*0.38, 0],   // been 8 achter-rechts
        ];

        for (pos = leg_positions)
        translate([pos[0], pos[1], 0])
        cylinder(d=COUPLING_DIA + 2, h=BODY_H + 2);

        // Hoofd koppeling (voor-midden, laag)
        translate([BODY_L*0.42, 0, BODY_H/2 - 10])
        rotate([0, 90, 0])
        cylinder(d=COUPLING_DIA + 2, h=30);

        // Pi5 uitsparing (centraal bovenin)
        translate([-15, -20, PEEK_WALL + 2])
        cube([90, 40, 20]);

        // Batterij bay (midden)
        translate([-60, -40, PEEK_WALL + 2])
        cube([120, 80, BODY_H - PEEK_WALL - 4]);

        // Middenlijn voor 2-delige print
        translate([-BODY_L*0.5 - 1, -5, -1])
        cube([BODY_L + 2, 10, BODY_H + 2]);
    }

    // Interne verstijvingsribben
    for (y = [-30, 0, 30])
    translate([-BODY_L*0.3, y, PEEK_WALL])
    cube([BODY_L*0.6, PEEK_WALL, BODY_H - 2*PEEK_WALL]);
}

// ── RENDER ───────────────────────────────────────────────────
if (RENDER_PART == "full_preview") {
    color("DarkSlateGray", 0.9) body_full();
} else if (RENDER_PART == "top_half") {
    intersection() {
        body_full();
        translate([-BODY_L/2, 0, 0])
        cube([BODY_L, BODY_W_MAX, BODY_H]);
    }
} else if (RENDER_PART == "bottom_half") {
    intersection() {
        body_full();
        translate([-BODY_L/2, -BODY_W_MAX, 0])
        cube([BODY_L, BODY_W_MAX, BODY_H]);
    }
}
