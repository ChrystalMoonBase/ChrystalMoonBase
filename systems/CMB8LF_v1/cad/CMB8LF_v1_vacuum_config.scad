// ============================================================
// CMB8LF v1 — vacuum_config.scad v2
// Centrale dimensieconfiguratie — BEREKENDE WAARDEN
// Include in alle andere bestanden
// CC0 · Chrystal Moon Base · 2026
// ============================================================
// MAATCASCADE: elektronica → bot → aerogel → schild → grijper
// Alle maten wetenschappelijk berekend uit datasheets
// ============================================================

// ── MATERIAALWANDEN ──────────────────────────────────────────
PEEK_WALL      = 3.0;   // mm PEEK-CF wand (structureel minimum)
AEROGEL_THICK  = 10.0;  // mm aerogel isolatie (thermisch berekend)
                         // Peary -50°C buiten → -10..+40°C binnen
                         // λ=0.015 W/m·K · intern ~5W warmtebron
SHIELD_WALL    = 3.0;   // mm buitenschild PEEK-CF

// ── SEGMENT BINNENMATEN (elektronica bepaalt dit) ────────────
// Coxa: GM5208 ⌀50mm + moteus 46mm + 6× 16340 batterij 32×48mm
COXA_IN_W      = 54.0;  // mm breedte binnenkern
COXA_IN_D      = 72.0;  // mm diepte binnenkern

// Femur: GM4108H ⌀40.8mm + moteus 46mm + batterij
FEMUR_IN_W     = 52.0;
FEMUR_IN_D     = 70.0;

// Tibia: GM3506 ⌀35mm + moteus 46mm (dominant) + batterij
TIBIA_IN_W     = 50.0;
TIBIA_IN_D     = 68.0;

// ── SEGMENT BUITENMATEN (+ 2× PEEK_WALL) ────────────────────
COXA_OUT_W     = COXA_IN_W  + 2 * PEEK_WALL;  // 60mm
COXA_OUT_D     = COXA_IN_D  + 2 * PEEK_WALL;  // 78mm
FEMUR_OUT_W    = FEMUR_IN_W + 2 * PEEK_WALL;  // 58mm
FEMUR_OUT_D    = FEMUR_IN_D + 2 * PEEK_WALL;  // 76mm
TIBIA_OUT_W    = TIBIA_IN_W + 2 * PEEK_WALL;  // 56mm
TIBIA_OUT_D    = TIBIA_IN_D + 2 * PEEK_WALL;  // 74mm

// ── SEGMENTLENGTEN ────────────────────────────────────────────
COXA_L         = 85.0;
FEMUR_L        = 145.0;
TIBIA_L        = 105.0;

// ── SCHILDMATEN (bot + aerogel + schildwand) ─────────────────
// Aerogel zit OM het bot — gaat NIET mee met schild
// Schild klapt eromheen — gripuitsparingen op schild buiten
COXA_SH_W      = COXA_OUT_W  + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 86mm
COXA_SH_D      = COXA_OUT_D  + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 104mm
FEMUR_SH_W     = FEMUR_OUT_W + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 84mm
FEMUR_SH_D     = FEMUR_OUT_D + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 102mm
TIBIA_SH_W     = TIBIA_OUT_W + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 82mm
TIBIA_SH_D     = TIBIA_OUT_D + 2 * AEROGEL_THICK + 2 * SHIELD_WALL;  // 100mm

// ── GRIPUITSPARINGEN (op schild buitenkant) ──────────────────
// 4 stuks · 90° verdeling · trapezium vorm (zelfcentrerend)
GRIP_N         = 4;     // aantal uitsparingen
GRIP_DEPTH     = 8.0;   // mm diep (vinger grijpt zeker)
GRIP_W_OUTER   = 16.0;  // mm breed aan buitenkant
GRIP_W_INNER   = 12.0;  // mm breed binnenin (trapezium = zelfcentrerend)
GRIP_H         = 20.0;  // mm hoog langs het bot
GRIP_POS_FRAC  = 0.35;  // positie: 35% vanaf uiteinde

// ── GRIJPER MATEN (door schildmaat bepaald) ──────────────────
// Grootste object = coxa schild = 86 × 104mm
GRIP_SPAN      = 110.0; // mm box grip spanwijdte (104 + 2× 3mm speling)
FINGER_L       = 55.0;  // mm vingerlengte
FINGER_W       = 12.0;  // mm vingerbreedte
PALM_W         = 70.0;  // mm palmbreedte
PALM_D         = 55.0;  // mm palmdiepte
PALM_H         = 42.0;  // mm palmhoogte

// ── KOPPELING ─────────────────────────────────────────────────
COUPLING_DIA   = 55.0;
COUPLING_H     = 28.0;
GUIDE_ANGLE    = 30;
POGO_RING_DIA  = 35.0;
POGO_N         = 5;

// ── BODY ──────────────────────────────────────────────────────
BODY_L         = 400.0;
BODY_W_MAX     = 300.0;
BODY_W_FRONT   = 200.0;
BODY_W_REAR    = 180.0;
BODY_H         = 85.0;

// ── HOOFD ─────────────────────────────────────────────────────
HEAD_W         = 90.0;
HEAD_D         = 70.0;
HEAD_H         = 60.0;

// ── MOTOR AFMETINGEN (uit datasheets) ────────────────────────
MOTOR_COXA_DIA  = 50.0;   // GM5208-150T
MOTOR_COXA_H    = 20.0;
MOTOR_FEMUR_DIA = 40.8;   // GM4108H-120T
MOTOR_FEMUR_H   = 26.0;
MOTOR_TIBIA_DIA = 35.0;   // GM3506-2
MOTOR_TIBIA_H   = 20.0;

// ── MOTEUS r4.11 (uit datasheet) ─────────────────────────────
MOTEUS_W        = 46.0;
MOTEUS_D        = 46.0;
MOTEUS_H        = 14.0;

// ── LASER PALM ────────────────────────────────────────────────
LASER_BORE_DIA  = 5.7;
LASER_SPACING   = 5.0;

// ── PRINT RESOLUTIE ───────────────────────────────────────────
$fn = 64;   // productie
// $fn = 16; // snelle preview

// ── HULPFUNCTIES ─────────────────────────────────────────────
module rounded_box(w, d, h, r=3) {
    hull() {
        for (x = [-w/2+r, w/2-r])
        for (y = [-d/2+r, d/2-r])
        translate([x, y, 0])
        cylinder(r=r, h=h);
    }
}

module hollow_box(w, d, h, wall, r=3) {
    difference() {
        rounded_box(w, d, h, r);
        translate([0, 0, wall])
        rounded_box(w-2*wall, d-2*wall, h, max(1, r-wall));
    }
}

module heat_set(dia=3.2, depth=6) {
    cylinder(d=dia, h=depth);
}

// Trapezium gripuitsparing (zelfcentrerend)
module grip_recess() {
    hull() {
        translate([0, 0, 0])
        cube([GRIP_W_OUTER, GRIP_DEPTH, GRIP_H], center=true);
        translate([0, GRIP_DEPTH * 0.4, 0])
        cube([GRIP_W_INNER, 0.1, GRIP_H * 0.8], center=true);
    }
}

// Aerogel mantel om het bot
module aerogel_wrap(out_w, out_d, length) {
    color("Wheat", 0.6)
    difference() {
        rounded_box(out_w + 2*AEROGEL_THICK,
                    out_d + 2*AEROGEL_THICK,
                    length, r=5);
        rounded_box(out_w + 1, out_d + 1, length + 2, r=3);
    }
}

echo("vacuum_config.scad v2 geladen — BEREKENDE MATEN");
echo(str("Coxa schild: ",  COXA_SH_W,  " × ", COXA_SH_D,  "mm"));
echo(str("Femur schild: ", FEMUR_SH_W, " × ", FEMUR_SH_D, "mm"));
echo(str("Tibia schild: ", TIBIA_SH_W, " × ", TIBIA_SH_D, "mm"));
echo(str("Grijper span: ", GRIP_SPAN, "mm"));
echo(str("Aerogel: ",      AEROGEL_THICK, "mm"));
