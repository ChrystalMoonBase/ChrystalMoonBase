// ============================================================
// CMB8LF v1 — COMPLETE LEG MODULE
// Skeleton + Koeling + Schildlaag — print-ready
// Referentie: Arachnid M-X1 render + femur_config.scad specs
// Printer: Voron 2.4 · Rapido HF 2 UHF · Klipper
// ============================================================
// GEBRUIK:
//   SHOW_SKELETON = true  → print in Prusament PC Space Grade Black
//   SHOW_ARMOR    = true  → print in Prusament PC Space Grade Black (schild)
//   SHOW_THERMAL  = true  → koelkanalen zichtbaar
//   SHOW_ASSEMBLY = true  → volledig been gemonteerd
// ============================================================

$fn = 24; // 24 voor test, 80 voor finale print

// ── RENDER MODE ──────────────────────────────────────────────
SHOW_SKELETON = true;
SHOW_ARMOR    = true;
SHOW_THERMAL  = false; // zet true om koelkanalen te checken
SHOW_ASSEMBLY = true;

// ── SERVO SPECS ───────────────────────────────────────────────
// Hip — DS3240
ds3240_w      = 40.5;
ds3240_d      = 20.5;
ds3240_h      = 40.0;
ds3240_shaft  = 33.0;  // as hoogte vanaf montagevlak
ds3240_shaft_d = 5.9;
ds3240_mount  = 28.0;  // M3 gat spacing

// Femur — DS3225
ds3225_w      = 40.5;
ds3225_d      = 20.5;
ds3225_h      = 38.0;
ds3225_shaft  = 32.0;
ds3225_shaft_d = 5.9;
ds3225_mount  = 28.0;

// Tibia — DS3218
ds3218_w      = 40.5;
ds3218_d      = 20.5;
ds3218_h      = 36.0;
ds3218_shaft  = 30.0;
ds3218_shaft_d = 5.9;
ds3218_mount  = 28.0;

// ── LAGER: F688-2RS ──────────────────────────────────────────
brg_od        = 16.0;
brg_id        = 8.0;
brg_h         = 5.0;
brg_tol       = 0.1;   // H7 press fit
brg_clr       = 0.3;   // loopdraai speling

// ── BEEN AFMETINGEN ───────────────────────────────────────────
femur_len     = 122.0; // center-to-center
tibia_len     = 95.0;  // center-to-center
hip_offset    = 18.0;  // hip arm lengte

// ── PRINT PARAMETERS ─────────────────────────────────────────
wall          = 5.0;
armor_wall    = 2.5;
thermal_gap   = 1.2;   // luchtspouw skeleton→schild
tol_fit       = 0.2;   // algemeen
tol_snap      = 0.3;   // snap-fit
heatset_d     = 3.2;   // M3 heat-set insert diameter
heatset_dep   = 6.0;   // M3 heat-set insert diepte (CORRECTIE: 6.0 niet 4.0)
m3_clear      = 3.4;   // M3 doorsteekgat
rib_w         = 1.5;   // verstevigingsrib dikte
cool_slot_w   = 3.0;   // koelkanaal breedte
cool_slot_d   = 2.5;   // koelkanaal diepte
vent_w        = 1.8;   // ventilatieslot in schild
cable_ch_w    = 8.0;   // kabelgoot breedte
cable_ch_h    = 6.0;   // kabelgoot hoogte

// ── QUICK RELEASE ─────────────────────────────────────────────
qr_pin_d      = 3.2;   // lock pin diameter
qr_spring_w   = 1.5;   // veergroef breedte
qr_depth      = 12.0;  // insteekkanaals diepte
qr_catch_d    = 4.5;   // klik-vangst diameter

// ============================================================
// HULP-MODULES
// ============================================================

module m3_heatset(depth = heatset_dep) {
    cylinder(d = heatset_d, h = depth + 0.1);
}

module m3_through() {
    cylinder(d = m3_clear, h = 100, center = true);
}

module bearing_pocket(tol = brg_tol) {
    cylinder(d = brg_od + tol*2, h = brg_h + tol, center = false);
}

module servo_volume(w, d, h, clearance = tol_fit) {
    // Servo body + kabeluitgang
    translate([-w/2 - clearance, -d/2 - clearance, -clearance])
        cube([w + clearance*2, d + clearance*2, h + clearance*2]);
    // Kabeluitgang onderzijde
    translate([-cable_ch_w/2, -d/2 - clearance, -clearance - cable_ch_h])
        cube([cable_ch_w, d + clearance*2, cable_ch_h + 1]);
}

// Ventilatie slots array
module vent_slots(count, length, spacing) {
    for(i = [0:count-1])
        translate([0, i * spacing, 0])
            cube([length, vent_w, armor_wall + 1], center = true);
}

// Koelvinnen langs servobody
module cooling_channels_side(servo_h, servo_d, count = 4) {
    spacing = (servo_h - wall) / (count + 1);
    for(i = [1:count])
        translate([-cool_slot_w/2, -servo_d/2 - cool_slot_d, i * spacing])
            cube([cool_slot_w, cool_slot_d + 0.1, cool_slot_w]);
}

// Thermisch pad zitplaats (vlak verzonken voor koperen pad)
module thermal_pad_seat(w, d, depth = 0.8) {
    translate([-w/2, -d/2, -0.1])
        cube([w, d, depth + 0.1]);
}

// Ribben structuur
module ribs(length, height, count = 5) {
    spacing = length / (count + 1);
    for(i = [1:count])
        translate([i * spacing - length/2, 0, 0])
            cube([rib_w, wall + 2, height], center = true);
}

// Quick release lock pin systeem
module quick_release_slot() {
    // Insteekkanaal
    translate([-qr_pin_d/2 - tol_snap, 0, 0])
        cube([qr_pin_d + tol_snap*2, qr_depth, qr_pin_d + tol_snap*2]);
    // Veergroef
    translate([-qr_spring_w/2, 0, -qr_pin_d])
        cube([qr_spring_w, qr_depth, qr_pin_d*2]);
    // Klik-vangst
    translate([0, qr_depth - qr_catch_d/2, 0])
        sphere(d = qr_catch_d + tol_snap);
}

// DoMoS₂ dry lubeail snap connector (voor schildpaneel)
module dovetail_male(h = 8) {
    linear_extrude(h)
        polygon(points=[[-2,0],[-4,6],[4,6],[2,0]]);
}

module dovetail_female(h = 8) {
    linear_extrude(h + 0.2)
        polygon(points=[
            [-2 - tol_snap, -0.1],
            [-4 - tol_snap, 6 + tol_snap],
            [4 + tol_snap, 6 + tol_snap],
            [2 + tol_snap, -0.1]
        ]);
}

// ============================================================
// SKELET MODULES
// ============================================================

// ── HIP JOINT SKELET ─────────────────────────────────────────
module hip_skeleton() {
    difference() {
        union() {
            // Hoofdbehuizing
            hull() {
                cube([ds3240_w + wall*2, ds3240_d + wall*2, ds3240_h + wall], center = true);
                translate([0, 0, -ds3240_h/2 - wall])
                    cylinder(d = ds3240_d + wall*2, h = 2, center = true);
            }
            // Lagerhuis boven (dual support F688-2RS)
            translate([0, 0, ds3240_h/2 + wall/2])
                cylinder(d = brg_od + wall*2, h = brg_h*2 + wall);
            // Lagerhuis onder
            translate([0, 0, -ds3240_h/2 - wall - brg_h*2])
                cylinder(d = brg_od + wall*2, h = brg_h*2 + wall);
            // Hip arm naar femur
            translate([hip_offset/2, 0, ds3240_shaft/2])
                cube([hip_offset + brg_od + wall*2, brg_od + wall*2,
                      brg_h*2 + wall*2], center = true);
        }

        // Servo uitsparing
        servo_volume(ds3240_w, ds3240_d, ds3240_h);

        // Lager boven
        translate([0, 0, ds3240_h/2 + wall/2])
            bearing_pocket();
        // Lager onder
        translate([0, 0, -ds3240_h/2 - wall - brg_h])
            bearing_pocket();
        // As doorvoer
        cylinder(d = brg_id + tol_fit*2, h = ds3240_h + wall*4, center = true);

        // M3 montagegaten servo
        for(x = [-ds3240_mount/2, ds3240_mount/2])
            translate([x, 0, -ds3240_h/2 - wall + heatset_dep])
                rotate([0,0,0]) m3_heatset();

        // Femur pivot lager
        translate([hip_offset + brg_od/2 + wall, 0, ds3240_shaft/2])
            rotate([90, 0, 0])
                bearing_pocket(tol = brg_tol);

        // Koelkanalen langs servo
        cooling_channels_side(ds3240_h, ds3240_d, count = 4);
        mirror([0, 1, 0]) cooling_channels_side(ds3240_h, ds3240_d, count = 4);

        // Quick release aansluitpunt voor beenwisseling
        translate([0, ds3240_d/2 + wall - 1, 0])
            rotate([90, 0, 0]) quick_release_slot();

        // Kabelgoot verticaal
        translate([ds3240_w/2 - cable_ch_w/2, 0, 0])
            cube([cable_ch_w, cable_ch_w, ds3240_h + wall*2 + 2], center = true);

        // DoMoS₂ dry lubeail voor schildpaneel
        translate([ds3240_w/2 + wall - 0.1, 0, 0])
            rotate([90, 0, 90]) dovetail_female(h = 10);
    }
}

// ── FEMUR SKELET ─────────────────────────────────────────────
module femur_skeleton() {
    difference() {
        union() {
            // Hoofdbuis — D-profiel voor stijfheid
            translate([0, 0, 0])
            difference() {
                cube([femur_len, ds3225_d + wall*2, ds3225_h/2 + wall], center = true);
                // Lichtgewicht uitsparing binnenin
                translate([0, 0, wall])
                    cube([femur_len - wall*4, ds3225_d + wall*2 - rib_w*2,
                          ds3225_h/2], center = true);
            }

            // Servo behuizing centraal
            translate([0, 0, -ds3225_h/4])
                cube([ds3225_w + wall*2, ds3225_d + wall*2, ds3225_h/2 + wall],
                     center = true);

            // Pivot lagerhuis proximal (naar hip)
            translate([-femur_len/2, 0, 0])
                rotate([90, 0, 0])
                    cylinder(d = brg_od + wall*2, h = brg_h*2 + wall, center = true);

            // Pivot lagerhuis distal (naar tibia)
            translate([femur_len/2, 0, 0])
                rotate([90, 0, 0])
                    cylinder(d = brg_od + wall*2, h = brg_h*2 + wall, center = true);

            // Verstevigingsribben
            ribs(femur_len, ds3225_h/2 + wall, count = 5);
        }

        // Servo uitsparing
        translate([0, 0, -wall/2])
            servo_volume(ds3225_w, ds3225_d, ds3225_h);

        // Servo shaft doorvoer
        cylinder(d = ds3225_shaft_d + tol_fit*2, h = ds3225_h + wall*2, center = true);

        // Lager proximal
        translate([-femur_len/2, 0, 0])
            rotate([90, 0, 0]) bearing_pocket();

        // Lager distal
        translate([femur_len/2, 0, 0])
            rotate([90, 0, 0]) bearing_pocket();

        // As doorvoer beide uiteinden
        for(x = [-femur_len/2, femur_len/2])
            translate([x, 0, 0])
                rotate([90, 0, 0])
                    cylinder(d = brg_id + tol_fit*2, h = brg_h*3 + wall*2, center = true);

        // M3 heat-set inserts servo mount
        for(sign = [-1, 1])
            translate([sign * ds3225_mount/2, 0, -ds3225_h/2 + heatset_dep - wall])
                m3_heatset();

        // Koelkanalen boven servo (warmteafvoer)
        for(i = [-1.5, -0.5, 0.5, 1.5])
            translate([i * 10, 0, ds3225_h/4 + wall/2])
                cube([cool_slot_w, ds3225_d + wall*2 + 1, cool_slot_d], center = true);

        // Koelkanalen langs zijkanten
        cooling_channels_side(ds3225_h, ds3225_d, count = 4);
        mirror([0, 1, 0]) cooling_channels_side(ds3225_h, ds3225_d, count = 4);

        // Kabelgoot langs femur
        translate([0, ds3225_d/2 + wall/2, -ds3225_h/4])
            cube([femur_len - wall*4, cable_ch_w, cable_ch_h], center = true);

        // Thermisch pad zitplaatsen op servo contact vlak
        translate([0, 0, ds3225_h/4])
            thermal_pad_seat(ds3225_w - wall, ds3225_d - wall);

        // DoMoS₂ dry lubeail receptors voor schildpaneel (beide zijden)
        for(side = [-1, 1])
            translate([side * (femur_len/4), 0, ds3225_h/4 + wall - 0.1])
                rotate([0, 0, 0]) dovetail_female(h = 8);
    }
}

// ── TIBIA SKELET ─────────────────────────────────────────────
module tibia_skeleton() {
    difference() {
        union() {
            // Hoofdbuis — taps toelopend voor gewicht/esthetiek
            hull() {
                translate([-tibia_len/2, 0, 0])
                    cube([1, ds3218_d + wall*2, ds3218_h/2 + wall], center = true);
                translate([tibia_len/2, 0, 0])
                    cube([1, ds3218_d + wall, ds3218_h/3 + wall], center = true);
            }

            // Servo behuizing
            translate([-tibia_len/4, 0, -ds3218_h/4])
                cube([ds3218_w + wall*2, ds3218_d + wall*2, ds3218_h/2 + wall],
                     center = true);

            // Pivot lagerhuis proximal
            translate([-tibia_len/2, 0, 0])
                rotate([90, 0, 0])
                    cylinder(d = brg_od + wall*2, h = brg_h*2 + wall, center = true);

            // Voet mount distaal
            translate([tibia_len/2 - wall, 0, 0])
                sphere(d = brg_od + wall*2);

            // Ribben
            ribs(tibia_len, ds3218_h/2 + wall, count = 4);
        }

        // Servo uitsparing
        translate([-tibia_len/4, 0, -wall/2])
            servo_volume(ds3218_w, ds3218_d, ds3218_h);

        // Servo shaft
        translate([-tibia_len/4, 0, 0])
            cylinder(d = ds3218_shaft_d + tol_fit*2,
                     h = ds3218_h + wall*2, center = true);

        // Lager proximal
        translate([-tibia_len/2, 0, 0])
            rotate([90, 0, 0]) bearing_pocket();
        translate([-tibia_len/2, 0, 0])
            rotate([90, 0, 0])
                cylinder(d = brg_id + tol_fit*2, h = brg_h*3, center = true);

        // M3 servo mounts
        for(sign = [-1, 1])
            translate([-tibia_len/4 + sign * ds3218_mount/2, 0,
                       -ds3218_h/2 + heatset_dep - wall])
                m3_heatset();

        // Koelkanalen
        cooling_channels_side(ds3218_h, ds3218_d, count = 3);
        mirror([0, 1, 0]) cooling_channels_side(ds3218_h, ds3218_d, count = 3);

        // Kabelgoot
        translate([0, ds3218_d/2 + wall/2, -ds3218_h/4])
            cube([tibia_len - wall*4, cable_ch_w, cable_ch_h], center = true);

        // Thermisch pad
        translate([-tibia_len/4, 0, ds3218_h/4])
            thermal_pad_seat(ds3218_w - wall, ds3218_d - wall);

        // Laser module mount (6mm diameter, voor rode/groene laser)
        translate([tibia_len/2 - wall*2, 0, ds3218_h/4])
            rotate([0, 90, 0])
                cylinder(d = 6.2, h = wall*2 + 1, center = true);  // rood
        translate([tibia_len/2 - wall*2, ds3218_d/3, ds3218_h/4])
            rotate([0, 90, 0])
                cylinder(d = 6.2, h = wall*2 + 1, center = true);  // groen

        // DoMoS₂ dry lubeail voor schildpaneel
        for(side = [-1, 1])
            translate([side * tibia_len/4, 0, ds3218_h/4 + wall - 0.1])
                dovetail_female(h = 8);
    }
}

// ============================================================
// SCHILD / ARMOR MODULES
// ============================================================

// ── FEMUR SCHILDPANEEL ────────────────────────────────────────
module femur_armor() {
    difference() {
        union() {
            // Buitenschil — sluit om skelet heen met thermal_gap speling
            hull() {
                cube([femur_len + armor_wall*2,
                      ds3225_d + wall*2 + thermal_gap*2 + armor_wall*2,
                      ds3225_h/2 + wall + thermal_gap + armor_wall],
                     center = true);
            }
            // DoMoS₂ dry lubeail knoppen die in skelet klikken
            for(side = [-1, 1])
                translate([side * (femur_len/4),
                           ds3225_d/2 + wall + thermal_gap + armor_wall - 0.1,
                           ds3225_h/4 + wall])
                    rotate([90, 0, 0]) dovetail_male(h = 8);
        }

        // Skelet + thermal gap uitsparing
        cube([femur_len + tol_snap*2,
              ds3225_d + wall*2 + thermal_gap*2,
              ds3225_h/2 + wall + thermal_gap + 1],
             center = true);

        // Ventilatieslots boven (warmte uitlaat)
        for(i = [-2:2])
            translate([i * 18, 0, ds3225_h/4 + wall + thermal_gap/2 + armor_wall/2])
                cube([vent_w, ds3225_d + wall + thermal_gap, armor_wall + 1],
                     center = true);

        // Ribben/paneel detail (esthetisch + lichtgewicht)
        for(i = [-1, 0, 1])
            translate([i * (femur_len/4), 0,
                       ds3225_h/4 + armor_wall + thermal_gap])
                cube([vent_w*3, ds3225_d + wall + thermal_gap*2 + armor_wall*2 + 1,
                      armor_wall + 0.5], center = true);
    }
}

// ── TIBIA SCHILDPANEEL ────────────────────────────────────────
module tibia_armor() {
    difference() {
        union() {
            // Taps toelopende schil
            hull() {
                translate([-tibia_len/2, 0, 0])
                    cube([1, ds3218_d + wall*2 + thermal_gap*2 + armor_wall*2,
                          ds3218_h/2 + wall + thermal_gap + armor_wall],
                         center = true);
                translate([tibia_len/2, 0, 0])
                    cube([1, ds3218_d + wall + thermal_gap + armor_wall*2,
                          ds3218_h/3 + wall + thermal_gap + armor_wall],
                         center = true);
            }
            // DoMoS₂ dry lubeail knoppen
            for(side = [-1, 1])
                translate([side * tibia_len/4,
                           ds3218_d/2 + wall + thermal_gap + armor_wall - 0.1,
                           ds3218_h/4 + wall])
                    rotate([90, 0, 0]) dovetail_male(h = 8);
        }

        // Skelet uitsparing
        hull() {
            translate([-tibia_len/2, 0, 0])
                cube([1, ds3218_d + wall*2 + thermal_gap*2,
                      ds3218_h/2 + wall + thermal_gap + 1], center = true);
            translate([tibia_len/2, 0, 0])
                cube([1, ds3218_d + wall + thermal_gap,
                      ds3218_h/3 + wall + thermal_gap + 1], center = true);
        }

        // Laser vensters (6mm + 0.5 speling, voor rode + groene laser)
        translate([tibia_len/2 - wall*2, 0, ds3218_h/4])
            rotate([0, 90, 0])
                cylinder(d = 7.0, h = armor_wall*3 + 1, center = true);
        translate([tibia_len/2 - wall*2, ds3218_d/3, ds3218_h/4])
            rotate([0, 90, 0])
                cylinder(d = 7.0, h = armor_wall*3 + 1, center = true);

        // Ventilatieslots
        for(i = [0:3])
            translate([-tibia_len/4 + i * 14, 0,
                       ds3218_h/4 + wall + thermal_gap/2 + armor_wall/2])
                cube([vent_w, ds3218_d + wall + thermal_gap,
                      armor_wall + 1], center = true);

        // Sensor venster (optioneel ToF of IR)
        translate([tibia_len/2 - wall*3, -ds3218_d/3, ds3218_h/4])
            rotate([0, 90, 0])
                cylinder(d = 5.5, h = armor_wall*3, center = true);
    }
}

// ── HIP SCHILDPANEEL ─────────────────────────────────────────
module hip_armor() {
    difference() {
        // Ronde schil om hip joint
        cylinder(d = ds3240_w + wall*2 + thermal_gap*2 + armor_wall*2,
                 h = ds3240_h + wall*2 + thermal_gap*2, center = true);

        // Hip skelet uitsparing
        cylinder(d = ds3240_w + wall*2 + thermal_gap*2,
                 h = ds3240_h + wall*2 + 1, center = true);

        // As doorvoer boven en onder
        cylinder(d = brg_od + wall*2 + thermal_gap + 2,
                 h = ds3240_h + wall*4 + 2, center = true);

        // Ventilatie slots (6 rondom)
        for(i = [0:5])
            rotate([0, 0, i * 60])
                translate([ds3240_w/2 + wall + thermal_gap/2, 0, 0])
                    cube([armor_wall + 1, vent_w*3, ds3240_h/2], center = true);

        // DoMoS₂ dry lubeail voor bodypaneel aansluiting
        translate([0, ds3240_d/2 + wall + thermal_gap + armor_wall - 0.1, 0])
            rotate([90, 0, 0]) dovetail_female(h = 12);
    }
}

// ============================================================
// KOELKANALEN VISUALISATIE (debug)
// ============================================================

module thermal_channels_debug() {
    color("cyan", 0.5) {
        // Femur koellucht kanalen
        for(i = [-1.5, -0.5, 0.5, 1.5])
            translate([i * 10, 0, ds3225_h/4 + wall/2])
                cube([cool_slot_w, ds3225_d + wall*2 + 1, cool_slot_d], center = true);

        // Thermische pad positie
        color("orange", 0.7)
            translate([0, 0, ds3225_h/4 - 0.8])
                cube([ds3225_w - wall, ds3225_d - wall, 0.8], center = true);

        // Luchtspouw rondom skelet
        color("lightblue", 0.2)
            cube([femur_len + armor_wall*2,
                  ds3225_d + wall*2 + thermal_gap*2,
                  ds3225_h/2 + wall + thermal_gap],
                 center = true);
    }
}

// ============================================================
// ASSEMBLY — VOLLEDIG BEEN
// ============================================================

module full_leg_assembly() {
    // ── HIP JOINT ──
    translate([0, 0, 0]) {
        if(SHOW_SKELETON)
            color("SteelBlue", 0.9) hip_skeleton();
        if(SHOW_ARMOR)
            color("DimGray", 0.7) hip_armor();
    }

    // ── FEMUR (rotatie as op hip pivot) ──
    translate([hip_offset + femur_len/2 + brg_od/2 + wall, 0, ds3240_shaft/2]) {
        if(SHOW_SKELETON)
            color("SteelBlue", 0.9) femur_skeleton();
        if(SHOW_ARMOR)
            color("DimGray", 0.7) femur_armor();
        if(SHOW_THERMAL)
            thermal_channels_debug();
    }

    // ── TIBIA (aan distaal einde femur) ──
    translate([hip_offset + femur_len + tibia_len/2 + brg_od + wall*2,
               0, ds3240_shaft/2]) {
        if(SHOW_SKELETON)
            color("SteelBlue", 0.85) tibia_skeleton();
        if(SHOW_ARMOR)
            color("DimGray", 0.65) tibia_armor();
    }

    // ── LAGERS VISUALISATIE ──
    if(SHOW_SKELETON) {
        // Hip top lager
        color("Silver")
            translate([0, 0, ds3240_h/2 + wall/2])
                cylinder(d = brg_od, h = brg_h);
        // Hip onder lager
        color("Silver")
            translate([0, 0, -ds3240_h/2 - wall - brg_h])
                cylinder(d = brg_od, h = brg_h);
        // Femur pivot lager
        color("Silver")
            translate([hip_offset + brg_od/2 + wall, -brg_h/2, ds3240_shaft/2])
                rotate([90, 0, 0])
                    cylinder(d = brg_od, h = brg_h);
    }
}

// ============================================================
// RENDER — kies wat je wil zien
// ============================================================

if(SHOW_ASSEMBLY) {
    full_leg_assembly();
} else {
    // Los renderen voor printen:
    // Skelet
    if(SHOW_SKELETON) {
        translate([0, 0, 0])       color("SteelBlue") hip_skeleton();
        translate([200, 0, 0])     color("SteelBlue") femur_skeleton();
        translate([400, 0, 0])     color("SteelBlue") tibia_skeleton();
    }
    // Schilden
    if(SHOW_ARMOR) {
        translate([0, 100, 0])     color("DimGray") hip_armor();
        translate([200, 100, 0])   color("DimGray") femur_armor();
        translate([400, 100, 0])   color("DimGray") tibia_armor();
    }
}

// ============================================================
// PRINT INSTRUCTIES
// ── SKELET (SteelBlue) ──────────────────────────────────────
//   Materiaal : Prusament PC Space Grade Black
//   Layer     : 0.2mm structureel
//   Infill    : 40-60% gyroid  // PC Space Grade: verify bed adhesion (glue stick + 100°C)
//   Supports  : organic (alleen lagerhuizen)
//   Oriëntatie: femur plat, tibia taps uiteinde omhoog
//
// ── SCHILD (DimGray) ────────────────────────────────────────
//   Materiaal : Prusament PC Space Grade Black
//   Layer     : 0.15mm detail
//   Infill    : 20-30% gyroid     // PC Space Grade: enclosure mandatory
//   Supports  : minimaal (dovetails zelfonderstenend)
//   Oriëntatie: binnenste vlak op bed
//
// ── LAGERS ──────────────────────────────────────────────────
//   F688-2RS (8x16x5mm) x2 per gewricht = 6 per been
//   6 poten structureel + 2 armen = 48 lagers totaal
//
// ── HEAT-SET INSERTS ────────────────────────────────────────
//   M3 x 6.0mm diepte — inpersen op 200°C soldeerbout
//   Per been: 6 servo mounts + 4 deksel = 10 inserts
//
// ── LASER MODULES ───────────────────────────────────────────
//   Tibia distaal: 2x 6mm gat — rood 650nm + groen 520nm
//   Schuif in na print, klemt op snap (geen lijm nodig (EP21TDCHT indien structureel))
// ============================================================
