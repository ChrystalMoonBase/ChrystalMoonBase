// ============================================================
// CMB8LF v1 — leg_standard.scad v2
// Standaard Loopbeen — Coxa · Femur · Tibia · Schilden
// ALLE MATEN BEREKEND — elektronica → bot → aerogel → schild
// CC0 · Chrystal Moon Base · 2026
// ============================================================
// RENDER_PART:
//   "coxa"         — heup bot
//   "femur"        — bovenbeen bot
//   "tibia"        — onderbeen bot
//   "foot"         — voetpad
//   "coxa_shield"  — heup schild (met gripuitsparingen)
//   "femur_shield" — bovenbeen schild (met gripuitsparingen)
//   "tibia_shield" — onderbeen schild (met gripuitsparingen)
//   "aerogel_coxa" — aerogel mantel coxa (referentie)
//   "full_leg"     — complete been preview
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>

RENDER_PART = "full_leg";

// ── COXA BOT ─────────────────────────────────────────────────
module coxa_bot() {
    difference() {
        // Structurele PEEK-CF buis
        rounded_box(COXA_OUT_W, COXA_OUT_D, COXA_L, r=4);

        // Holle binnenkern (elektronica bay)
        translate([0, 0, PEEK_WALL])
        rounded_box(COXA_IN_W, COXA_IN_D,
                    COXA_L - PEEK_WALL + 1, r=2);

        // Motor doorvoer onderkant (koppelkant)
        translate([0, 0, -1])
        cylinder(d=MOTOR_COXA_DIA + 2, h=MOTOR_COXA_H + 2);

        // Motor mount bouten (4× M3)
        for (a = [0:90:270])
        rotate([0, 0, a])
        translate([MOTOR_COXA_DIA/2 + 4, 0, 4])
        cylinder(d=3.2, h=MOTOR_COXA_H + 2);

        // Koppelingsinterface bovenkant
        translate([0, 0, COXA_L - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);

        // Kabelgoot langs lange zijde
        translate([COXA_OUT_W/2 - 5, 0, PEEK_WALL + 2])
        cube([6, 10, COXA_L - PEEK_WALL * 2], center=true);

        // moteus r4.11 bevestiging (M3 standoffs)
        for (x = [-MOTEUS_W/2 + 4, MOTEUS_W/2 - 4])
        for (y = [-MOTEUS_D/2 + 4, MOTEUS_D/2 - 4])
        translate([x, y, COXA_L - COUPLING_H - MOTEUS_H - 8])
        cylinder(d=3.2, h=10);

        // Batterij klembeugelgaten (2× aan zijkant)
        translate([-COXA_OUT_W/2 - 1, 0, COXA_L * 0.3])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=PEEK_WALL + 2);
        translate([-COXA_OUT_W/2 - 1, 0, COXA_L * 0.6])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=PEEK_WALL + 2);

        // Heat-set M3 (8× — 4 boven 4 onder)
        for (x = [-COXA_OUT_W/2 + 7, COXA_OUT_W/2 - 7])
        for (y = [-COXA_OUT_D/2 + 7, COXA_OUT_D/2 - 7]) {
            translate([x, y, 0])     heat_set(3.2, 8);
            translate([x, y, COXA_L - 8]) heat_set(3.2, 8);
        }
    }

    // Motor mount platform
    translate([0, 0, PEEK_WALL])
    difference() {
        cylinder(d=MOTOR_COXA_DIA + 10, h=5);
        cylinder(d=MOTOR_COXA_DIA + 1,  h=6);
    }
}

// ── FEMUR BOT ────────────────────────────────────────────────
module femur_bot() {
    difference() {
        rounded_box(FEMUR_OUT_W, FEMUR_OUT_D, FEMUR_L, r=4);

        translate([0, 0, PEEK_WALL])
        rounded_box(FEMUR_IN_W, FEMUR_IN_D,
                    FEMUR_L - PEEK_WALL + 1, r=2);

        // Koppeling beide uiteinden
        translate([0, 0, -1])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);
        translate([0, 0, FEMUR_L - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);

        // Zonnecel uitsparing (brede zijde buitenwand)
        // 70% van de lengte · 3mm diep · voor GaAs dunnefilm cel
        translate([FEMUR_OUT_W/2 - 2.5, 0, FEMUR_L * 0.15])
        cube([4, FEMUR_OUT_D * 0.75, FEMUR_L * 0.7], center=true);

        // Kabelgoot
        translate([FEMUR_OUT_W/2 - 5, 0, PEEK_WALL + 2])
        cube([6, 8, FEMUR_L - PEEK_WALL * 2], center=true);

        for (x = [-FEMUR_OUT_W/2 + 7, FEMUR_OUT_W/2 - 7])
        for (y = [-FEMUR_OUT_D/2 + 7, FEMUR_OUT_D/2 - 7]) {
            translate([x, y, 0])          heat_set(3.2, 8);
            translate([x, y, FEMUR_L - 8]) heat_set(3.2, 8);
        }
    }
}

// ── TIBIA BOT ────────────────────────────────────────────────
module tibia_bot() {
    difference() {
        rounded_box(TIBIA_OUT_W, TIBIA_OUT_D, TIBIA_L, r=3);

        translate([0, 0, PEEK_WALL])
        rounded_box(TIBIA_IN_W, TIBIA_IN_D,
                    TIBIA_L - PEEK_WALL + 1, r=2);

        // Koppeling bovenkant
        translate([0, 0, TIBIA_L - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);

        // Voet interface onderkant
        translate([0, 0, -1])
        cylinder(d=32, h=18);

        // Kabelgoot
        translate([TIBIA_OUT_W/2 - 4, 0, PEEK_WALL + 2])
        cube([5, 8, TIBIA_L - PEEK_WALL * 2], center=true);

        for (x = [-TIBIA_OUT_W/2 + 6, TIBIA_OUT_W/2 - 6])
        for (y = [-TIBIA_OUT_D/2 + 6, TIBIA_OUT_D/2 - 6]) {
            translate([x, y, 0])          heat_set(3.2, 8);
            translate([x, y, TIBIA_L - 8]) heat_set(3.2, 8);
        }
    }
}

// ── VOETPAD ──────────────────────────────────────────────────
module foot_pad() {
    difference() {
        union() {
            cylinder(d=30, h=18);
            // Brede voetplaat — stabiliteit op regoliet
            translate([0, 0, 8])
            hull() {
                cylinder(d=30, h=3);
                scale([1.9, 1.5, 1])
                cylinder(d=30, h=3);
            }
        }
        // Enkel doorvoer
        cylinder(d=22, h=20);
        // Kabelgoot
        translate([0, 11, 0])
        cube([7, 7, 19], center=true);
    }
}

// ── SCHILD MET GRIPUITSPARINGEN ──────────────────────────────
// Schild klapt OM de aerogel heen — aerogel blijft op bot
// Grijper pakt schild via 4 trapezium uitsparingen
// Kwart slag → los · kwart slag terug → vergrendeld (bajonet)

module shield_with_grips(sh_w, sh_d, length, bot_w, bot_d) {

    gap_w = sh_w - 2 * SHIELD_WALL;  // binnenruimte voor aerogel
    gap_d = sh_d - 2 * SHIELD_WALL;

    difference() {
        // Schild buitenvorm
        rounded_box(sh_w, sh_d, length, r=6);

        // Binnenholte (omvat aerogel + bot)
        translate([0, 0, SHIELD_WALL])
        rounded_box(gap_w, gap_d, length, r=4);

        // ── GRIPUITSPARINGEN (4× · 90° verdeling) ───────────
        // Positie: op 35% van elk uiteinde
        pos_z_low  = length * GRIP_POS_FRAC;
        pos_z_high = length * (1 - GRIP_POS_FRAC);

        for (angle = [0, 90, 180, 270]) {
            rotate([0, 0, angle]) {
                // Brede zijde uitsparing (op sh_w kant)
                translate([sh_w/2, 0, pos_z_low])
                rotate([0, 90, 0])
                hull() {
                    cube([GRIP_H, GRIP_W_OUTER, 0.1], center=true);
                    translate([0, 0, -GRIP_DEPTH])
                    cube([GRIP_H * 0.85, GRIP_W_INNER, 0.1], center=true);
                }
                translate([sh_w/2, 0, pos_z_high])
                rotate([0, 90, 0])
                hull() {
                    cube([GRIP_H, GRIP_W_OUTER, 0.1], center=true);
                    translate([0, 0, -GRIP_DEPTH])
                    cube([GRIP_H * 0.85, GRIP_W_INNER, 0.1], center=true);
                }
            }
        }

        // ── BAJONET SLEUVEN (kwart slag vergrendeling) ───────
        // 4 sleuven · L-vorm · bot heeft bijpassende nokken
        for (angle = [45, 135, 225, 315])
        rotate([0, 0, angle]) {
            // Insteekopening
            translate([sh_w * 0.42, 0, 0])
            cylinder(d=8, h=SHIELD_WALL + 1);
            // Kwart slag sleuf
            translate([sh_w * 0.42, 0, SHIELD_WALL/2])
            rotate([0, 0, 45])
            cube([8, sh_w * 0.15, SHIELD_WALL + 1], center=true);
        }

        // ── VENTILATIE (warmteafvoer via straling) ────────────
        // Kleine sleuven zodat radiatieve warmteafvoer mogelijk is
        for (z = [length*0.25 : length*0.15 : length*0.85])
        translate([0, sh_d/2, z])
        rotate([90, 0, 0])
        hull() {
            translate([-sh_w*0.25, 0, 0]) cylinder(d=3, h=2);
            translate([ sh_w*0.25, 0, 0]) cylinder(d=3, h=2);
        }
    }

    // ── LABEL RELIËF ─────────────────────────────────────────
    // Gripuitsparing markering (kleine pijl)
    for (angle = [0, 90, 180, 270])
    rotate([0, 0, angle])
    translate([sh_w/2 - 1, 0, length/2])
    rotate([0, 90, 0])
    cylinder(d=4, h=1);
}

// ── AEROGEL MANTEL (referentie — niet printen) ───────────────
// Aerogel zit als 'spieren' om het bot
// Wordt op maat gesneden en geplakt om de PEEK-CF kern
// Schild klapt er omheen — bij schildwissel blijft aerogel zitten

module aerogel_mantel(bot_w, bot_d, length) {
    color("Wheat", 0.5)
    difference() {
        rounded_box(bot_w + 2 * AEROGEL_THICK,
                    bot_d + 2 * AEROGEL_THICK, length, r=6);
        // Bot uitsparing
        rounded_box(bot_w + 1, bot_d + 1, length + 2, r=3);
        // Koppeling uitsparingen
        translate([0, 0, -1]) cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);
        translate([0, 0, length - COUPLING_H])
        cylinder(d=COUPLING_DIA + 2, h=COUPLING_H + 2);
    }
}

// ── VOLLEDIGE BEEN PREVIEW ───────────────────────────────────
module full_leg_preview() {
    space = 20; // ruimte tussen segmenten

    // TIBIA (onderste)
    color("DimGray")
    tibia_bot();

    color("Wheat", 0.4) translate([0, 0, 0])
    aerogel_mantel(TIBIA_OUT_W, TIBIA_OUT_D, TIBIA_L);

    color("SlateGray", 0.7) translate([0, 0, 0])
    shield_with_grips(TIBIA_SH_W, TIBIA_SH_D, TIBIA_L,
                      TIBIA_OUT_W, TIBIA_OUT_D);

    // FEMUR (midden)
    translate([0, 0, TIBIA_L + space]) {
        color("DimGray") femur_bot();
        color("Wheat", 0.4)
        aerogel_mantel(FEMUR_OUT_W, FEMUR_OUT_D, FEMUR_L);
        color("SlateGray", 0.7)
        shield_with_grips(FEMUR_SH_W, FEMUR_SH_D, FEMUR_L,
                          FEMUR_OUT_W, FEMUR_OUT_D);
    }

    // COXA (bovenste)
    translate([0, 0, TIBIA_L + space + FEMUR_L + space]) {
        color("DimGray") coxa_bot();
        color("Wheat", 0.4)
        aerogel_mantel(COXA_OUT_W, COXA_OUT_D, COXA_L);
        color("SlateGray", 0.7)
        shield_with_grips(COXA_SH_W, COXA_SH_D, COXA_L,
                          COXA_OUT_W, COXA_OUT_D);
    }

    // VOET (onder tibia)
    translate([0, 0, -space - 15])
    color("DarkGray")
    foot_pad();
}

// ── RENDER ───────────────────────────────────────────────────
if      (RENDER_PART == "coxa")         coxa_bot();
else if (RENDER_PART == "femur")        femur_bot();
else if (RENDER_PART == "tibia")        tibia_bot();
else if (RENDER_PART == "foot")         foot_pad();
else if (RENDER_PART == "coxa_shield")
    shield_with_grips(COXA_SH_W,  COXA_SH_D,  COXA_L,
                      COXA_OUT_W,  COXA_OUT_D);
else if (RENDER_PART == "femur_shield")
    shield_with_grips(FEMUR_SH_W, FEMUR_SH_D, FEMUR_L,
                      FEMUR_OUT_W, FEMUR_OUT_D);
else if (RENDER_PART == "tibia_shield")
    shield_with_grips(TIBIA_SH_W, TIBIA_SH_D, TIBIA_L,
                      TIBIA_OUT_W, TIBIA_OUT_D);
else if (RENDER_PART == "aerogel_coxa")
    aerogel_mantel(COXA_OUT_W, COXA_OUT_D, COXA_L);
else
    full_leg_preview();
