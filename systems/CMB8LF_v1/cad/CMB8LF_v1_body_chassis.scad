// ============================================================
// CMB8LF v1 — BODY CHASSIS
// Pi5 · Pico W ×2 · PCA9685 ×2 · Buck ×7 · BMS ×2
// E-Stop · Star-point GND · Kabelkanalen · Armor
// ============================================================
// RENDER MODES:
//   MODE = "assembly"   → volledig chassis gemonteerd
//   MODE = "skeleton"   → structuur + pockets
//   MODE = "lid_top"    → bovenste deksel
//   MODE = "lid_bottom" → onderste deksel / bodemplaat
//   MODE = "armor"      → zijpanelen
//   MODE = "test"       → component fit testprint
// ============================================================

$fn = 24; // 24 test · 80 finale print

MODE = "assembly";

// ── PRINT PARAMETERS ─────────────────────────────────────────
wall          = 5.0;
armor_wall    = 2.5;
thermal_gap   = 1.2;
tol_fit       = 0.2;
tol_snap      = 0.15;   // PC Space Grade shrinkage ~0.3% - validated at 400°C
heatset_d     = 3.2;
heatset_dep   = 6.0;
m3_clear      = 3.4;
rib_w         = 2.0;
vent_w        = 1.8;
cool_slot_w   = 3.5;

// ── BODY AFMETINGEN ───────────────────────────────────────────
// Afgeleid van SVG polygon (CMB8LF octagon · schaal 1:3.5)
body_w        = 240.0; // breedte
body_d        = 200.0; // diepte
body_h        = 55.0;  // hoogte binnenwerk
body_r        = 28.0;  // octagon hoekradius
wall_body     = 6.0;   // extra dik voor structuur

// ── COMPONENT AFMETINGEN ─────────────────────────────────────
// Raspberry Pi 5
pi5_w         = 85.0;
pi5_d         = 56.0;
pi5_h         = 17.0;  // inclusief koellichaam
pi5_mount_w   = 58.0;  // bout spacing x
pi5_mount_d   = 49.0;  // bout spacing y

// Raspberry Pi Pico W
pico_w        = 51.0;
pico_d        = 21.0;
pico_h        = 4.0;
pico_mount_w  = 11.4;  // bout spacing

// PCA9685 breakout
pca_w         = 62.0;
pca_d         = 27.0;
pca_h         = 6.0;

// Buck converter XL4016 (7.4V/20A module)
buck_w        = 55.0;
buck_d        = 40.0;
buck_h        = 20.0;  // inclusief inductors

// BMS module 40A 3S
bms_w         = 65.0;
bms_d         = 45.0;
bms_h         = 8.0;

// LiPo batterij 3S 5000mAh (per stuk)
lipo_w        = 140.0;
lipo_d        = 47.0;
lipo_h        = 25.0;

// E-Stop relay 30A
relay_w       = 50.0;
relay_d       = 26.0;
relay_h       = 36.0;

// Star-point GND blok
star_w        = 40.0;
star_d        = 30.0;
star_h        = 15.0;

// ── PEG MOUNTS ────────────────────────────────────────────────
// 8 been-aansluitpunten (conform octagon polygon)
// Hoeken in graden vanuit centrum (noord = 0, rechtsom)
leg_angles    = [338, 22, 293, 67, 247, 113, 212, 148];
leg_mount_r   = 115.0; // radius van centrum naar beenmount

// Nek connector (hoofd aansluiting)
neck_d        = 42.0;
neck_mount_r  = 18.0;

// ============================================================
// HULP-MODULES
// ============================================================

module m3_heatset(depth = heatset_dep) {
    cylinder(d = heatset_d, h = depth + 0.1);
}

module m3_bolt_pattern(w, d, depth = heatset_dep) {
    for(x = [-1,1]) for(y = [-1,1])
        translate([x*w/2, y*d/2, 0])
            m3_heatset(depth);
}

module m3_standoff(h = 8) {
    difference() {
        cylinder(d = heatset_d*2+2, h = h);
        cylinder(d = m3_clear, h = h+0.1);
    }
}

module component_pocket(w, d, h, clearance = tol_fit) {
    translate([-w/2-clearance, -d/2-clearance, -0.1])
        cube([w+clearance*2, d+clearance*2, h+clearance+0.1]);
}

module cable_channel(length, w = 10, h = 8) {
    cube([length, w, h], center = true);
}

module vent_strip(length, count = 8) {
    spacing = length / (count + 1);
    for(i = [1:count])
        translate([i*spacing - length/2, 0, 0])
            cube([vent_w, wall_body+2, vent_w*4], center=true);
}

module octagon_body(w, d, h, r) {
    // Octagonaal profiel via hull van 4 cilinders op hoeken
    hull()
        for(x = [-1,1]) for(y = [-1,1])
            translate([x*(w/2-r), y*(d/2-r), 0])
                cylinder(r=r, h=h);
}

// ── Beenmount interface ───────────────────────────────────────
module leg_mount_interface() {
    // Extern vlak voor QR socket van been
    difference() {
        union() {
            cylinder(d = 35, h = wall_body*2);
            // Verstevigingsribben
            for(ang = [0, 90, 180, 270])
                rotate([0, 0, ang])
                    translate([0, 0, wall_body])
                        cube([rib_w, 35, wall_body], center=true);
        }
        // QR socket uitsparing (22mm diameter + tolerantie)
        cylinder(d = 22 + tol_fit*2, h = wall_body*2+1);
        // M3 boutgaten (4 stuks)
        for(ang = [45, 135, 225, 315])
            rotate([0, 0, ang])
                translate([14, 0, 0])
                    m3_heatset();
        // Kabelgoot centraal
        cube([10, 10, wall_body*3], center = true);
    }
}

// ============================================================
// BODY SKELET
// ============================================================

module body_skeleton() {
    difference() {
        union() {
            // Hoofdbehuizing — octagonaal profiel
            octagon_body(body_w, body_d, body_h + wall*2,
                         body_r);

            // Nek mount boven (hoofd aansluiting)
            translate([0, body_d/2-neck_d/2-wall*2, body_h+wall*2])
                cylinder(d=neck_d+wall*4, h=wall*3);

            // 8× beenmount interfaces (aan buitenrand)
            for(i = [0:7]) {
                ang = leg_angles[i];
                rotate([0, 0, -(ang-90)])
                    translate([leg_mount_r, 0, wall])
                        leg_mount_interface();
            }

            // Interne kruisverstevigingen
            translate([0, 0, body_h/2+wall])
                cube([body_w-wall*4, rib_w*2, body_h/2],
                     center=true);
            translate([0, 0, body_h/2+wall])
                cube([rib_w*2, body_d-wall*4, body_h/2],
                     center=true);

            // Pi5 standoffs (4×)
            translate([0, 20, wall])
                for(x = [-1,1]) for(y = [-1,1])
                    translate([x*pi5_mount_w/2, y*pi5_mount_d/2,0])
                        m3_standoff(h=10);
        }

        // ── COMPONENT POCKETS ──────────────────────────────────

        // Binnenkamer
        translate([0, 0, wall_body])
            octagon_body(body_w-wall_body*2,
                         body_d-wall_body*2,
                         body_h+1, body_r-wall_body);

        // Pi5 pocket (boven centraal)
        translate([0, 20, wall_body])
            component_pocket(pi5_w, pi5_d, pi5_h);

        // Pi5 active cooler ruimte
        translate([0, 20, wall_body+pi5_h])
            component_pocket(pi5_w-10, pi5_d-10, 15);

        // Pico W #1 pocket (links voor)
        translate([-70, 30, wall_body])
            component_pocket(pico_w, pico_d, pico_h);

        // Pico W #2 pocket (rechts voor)
        translate([70, 30, wall_body])
            component_pocket(pico_w, pico_d, pico_h);

        // PCA9685-A pocket (links midden)
        translate([-65, -10, wall_body])
            component_pocket(pca_w, pca_d, pca_h);

        // PCA9685-B pocket (rechts midden)
        translate([65, -10, wall_body])
            component_pocket(pca_w, pca_d, pca_h);

        // Buck converters 7.4V ×4 (links + rechts achter)
        for(i = [0:3]) {
            side = (i < 2) ? -1 : 1;
            row  = (i % 2 == 0) ? 0 : 1;
            translate([side*(body_w/4+10),
                       -40 - row*45, wall_body])
                component_pocket(buck_w, buck_d, buck_h);
        }

        // Buck converter 6.0V ×2 (midden achter)
        for(i = [-1, 1])
            translate([i*35, -50, wall_body])
                component_pocket(buck_w, buck_d, buck_h);

        // Buck converter 5.0V ×1
        translate([0, -80, wall_body])
            component_pocket(buck_w, buck_d, buck_h);

        // BMS ×2 (links + rechts buiten)
        for(side = [-1, 1])
            translate([side*82, 10, wall_body])
                component_pocket(bms_w, bms_d, bms_h);

        // LiPo batterij ×2 (links + rechts, groot!)
        for(side = [-1, 1])
            translate([side*(lipo_w/2+8), -20, wall_body])
                component_pocket(lipo_w, lipo_d, lipo_h);

        // E-Stop relay (midden voor)
        translate([0, 60, wall_body])
            component_pocket(relay_w, relay_d, relay_h);

        // Star-point GND blok (midden)
        translate([0, 0, wall_body+5])
            component_pocket(star_w, star_d, star_h);

        // ── KABELKANALEN ──────────────────────────────────────

        // Radiale kabelkanalen naar alle 8 benen
        for(i = [0:7]) {
            ang = leg_angles[i];
            rotate([0, 0, -(ang-90)])
                translate([body_w/4, 0, body_h/2+wall])
                    cable_channel(body_w/2+10, w=12, h=10);
        }

        // Centrale kabelgoot (kruis)
        translate([0, 0, wall_body+20])
            cube([body_w-wall_body*4, 12, 12], center=true);
        translate([0, 0, wall_body+20])
            cube([12, body_d-wall_body*4, 12], center=true);

        // Nek kabelgoot (hoofd aansluiting)
        translate([0, body_d/2-neck_d/2-wall*2, body_h+wall])
            cylinder(d=neck_d-wall*2, h=wall*4);

        // ── VENTILATIE ────────────────────────────────────────

        // Ventilatie voorzijde
        translate([0, -body_d/2, body_h*0.5])
            vent_strip(body_w*0.6, count=10);

        // Ventilatie achterzijde
        translate([0, body_d/2, body_h*0.5])
            vent_strip(body_w*0.6, count=10);

        // Ventilatie zijkanten
        for(side = [-1, 1])
            translate([side*body_w/2, 0, body_h*0.5])
                rotate([0, 0, 90])
                    vent_strip(body_d*0.5, count=6);

        // Ventilatie boven (warmte Pi5 + bucks)
        for(x = [-3:3])
            translate([x*25, 0, body_h+wall*2-0.1])
                cube([vent_w*2, body_d*0.4, wall+0.2],
                     center=true);

        // ── BEVESTIGINGSGATEN ─────────────────────────────────

        // Nek mount M3 (4 stuks)
        translate([0, body_d/2-neck_d/2-wall*2,
                   body_h+wall*2])
            for(ang = [45, 135, 225, 315])
                rotate([0, 0, ang])
                    translate([neck_mount_r, 0, 0])
                        m3_heatset();

        // Deksel M3 heat-set inserts (8 stuks rondom)
        for(ang = [0:45:315])
            rotate([0, 0, ang+(45/2)])
                translate([body_w/2-15, 0,
                           body_h+wall*2-heatset_dep])
                    m3_heatset();

        // Bodemplaat M3 (8 stuks)
        for(ang = [0:45:315])
            rotate([0, 0, ang+(45/2)])
                translate([body_w/2-15, 0, 0])
                    m3_heatset();
    }
}

// ============================================================
// BODEMPLAAT (onderzijde, afneembaar voor onderhoud)
// ============================================================

module body_bottom_lid() {
    difference() {
        union() {
            // Plaat
            octagon_body(body_w-tol_snap*2,
                         body_d-tol_snap*2,
                         wall*2, body_r-wall);
            // Lip
            translate([0, 0, wall])
                octagon_body(body_w-wall_body*2-tol_snap*2,
                             body_d-wall_body*2-tol_snap*2,
                             wall, body_r-wall_body);
        }
        // M3 doorgangsgaten
        for(ang = [0:45:315])
            rotate([0, 0, ang+(45/2)])
                translate([body_w/2-15, 0, -0.1])
                    cylinder(d=m3_clear, h=wall*3);
        // Batterij toegangsgat (groot, voor wisselen)
        translate([0, -20, -0.1])
            octagon_body(lipo_w*2+20, lipo_d+10, wall*3, 8);
        // Ventilatie
        for(x = [-4:4])
            translate([x*22, 0, wall])
                cube([vent_w*2, body_d*0.6, wall+0.2],
                     center=true);
    }
}

// ============================================================
// BOVENDEKSEL (afneembaar, heeft nek mount)
// ============================================================

module body_top_lid() {
    difference() {
        union() {
            octagon_body(body_w-tol_snap*2,
                         body_d-tol_snap*2,
                         wall*2, body_r-wall);
            // Lip
            translate([0, 0, -wall])
                octagon_body(body_w-wall_body*2-tol_snap*2,
                             body_d-wall_body*2-tol_snap*2,
                             wall, body_r-wall_body);
            // Nek pijp
            translate([0, body_d/2-neck_d/2-wall*2, wall*2])
                cylinder(d=neck_d+wall*2, h=wall*3);
        }
        // M3 doorgangsgaten
        for(ang = [0:45:315])
            rotate([0, 0, ang+(45/2)])
                translate([body_w/2-15, 0, -0.1])
                    cylinder(d=m3_clear, h=wall*4);
        // Nek doorvoer
        translate([0, body_d/2-neck_d/2-wall*2, -0.1])
            cylinder(d=neck_d, h=wall*6);
        // Pi5 USB-C toegang (onderhoud)
        translate([pi5_w/2-5, 20, -0.1])
            cube([14, 10, wall*3]);
        // Ventilatie
        for(x = [-3:3])
            translate([x*25, -10, wall])
                cube([vent_w*2, body_d*0.3, wall+0.2],
                     center=true);
    }
}

// ============================================================
// ZIJPANEEL ARMOR
// ============================================================

module side_armor_panel(side = 1) {
    // Één zijpaneel · gespiegeld voor links/rechts
    mirror([side < 0 ? 1 : 0, 0, 0])
    difference() {
        // Paneel volgt octagon contour
        hull()
            for(y = [-1,1])
                translate([body_w/2+armor_wall,
                           y*(body_d/2-body_r), 0])
                    cylinder(r=body_r, h=body_h+wall*2);

        // Skelet uitsparing
        hull()
            for(y = [-1,1])
                translate([body_w/2,
                           y*(body_d/2-body_r), -0.1])
                    cylinder(r=body_r+tol_snap,
                             h=body_h+wall*2+0.2);

        // Ventilatieslots
        for(i = [0:4])
            translate([body_w/2+armor_wall/2,
                       -body_d/4 + i*20,
                       body_h*0.4])
                cube([armor_wall+1, vent_w, body_h*0.4],
                     center=true);

        // Beenmount doorgangen (3 per zijkant)
        for(i = [0:2]) {
            ang = (side > 0) ?
                [67, 22, 338][i] : [113, 148, 212][i];
            rotate([0, 0, -(ang-90)])
                translate([leg_mount_r, 0, wall*1.5])
                    cylinder(d=30, h=body_h);
        }
    }
}

// ============================================================
// TESTPRINT MODULE
// ============================================================

module body_testprint() {
    // 1. Pi5 standoff + pocket sectie
    translate([0, 0, 0])
        color("SteelBlue")
        difference() {
            cube([pi5_w+wall*4, pi5_d+wall*4,
                  pi5_h+wall*2], center=true);
            component_pocket(pi5_w, pi5_d, pi5_h+0.1);
            translate([0, 0, -(pi5_h/2+wall)])
                m3_bolt_pattern(pi5_mount_w, pi5_mount_d,
                                heatset_dep);
        }
    // 2. Beenmount interface
    translate([120, 0, 0])
        color("Orange") leg_mount_interface();
    // 3. Buck pocket (fit check)
    translate([0, 90, 0])
        color("SteelBlue")
        difference() {
            cube([buck_w+wall*4, buck_d+wall*4,
                  buck_h+wall*2], center=true);
            component_pocket(buck_w, buck_d, buck_h+0.1);
        }
    // 4. LiPo pocket sectie
    translate([120, 90, 0])
        color("SteelBlue")
        difference() {
            cube([lipo_w/2+wall*4, lipo_d+wall*4,
                  lipo_h+wall*2], center=true);
            translate([0,0,wall])
                component_pocket(lipo_w/2, lipo_d, lipo_h);
        }
}

// ============================================================
// COMPONENT LAYOUT VISUALISATIE (debug · geen print)
// ============================================================

module component_layout_debug() {
    // Toon alle componenten in positie (gekleurde blokken)

    // Pi5
    color("Green", 0.8)
        translate([0, 20, wall_body+pi5_h/2])
            cube([pi5_w, pi5_d, pi5_h], center=true);

    // Pico W ×2
    for(side = [-1, 1])
        color("Cyan", 0.7)
            translate([side*70, 30, wall_body+pico_h/2])
                cube([pico_w, pico_d, pico_h], center=true);

    // PCA9685 ×2
    for(side = [-1, 1])
        color("Purple", 0.7)
            translate([side*65, -10, wall_body+pca_h/2])
                cube([pca_w, pca_d, pca_h], center=true);

    // Buck ×7
    for(i = [0:3]) {
        s = (i < 2) ? -1 : 1; r = (i%2==0) ? 0 : 1;
        color("Orange", 0.7)
            translate([s*(body_w/4+10), -40-r*45,
                       wall_body+buck_h/2])
                cube([buck_w, buck_d, buck_h], center=true);
    }
    for(i = [-1, 1])
        color("Orange", 0.7)
            translate([i*35, -50, wall_body+buck_h/2])
                cube([buck_w, buck_d, buck_h], center=true);
    color("Orange", 0.7)
        translate([0, -80, wall_body+buck_h/2])
            cube([buck_w, buck_d, buck_h], center=true);

    // BMS ×2
    for(side = [-1, 1])
        color("Red", 0.7)
            translate([side*82, 10, wall_body+bms_h/2])
                cube([bms_w, bms_d, bms_h], center=true);

    // LiPo ×2
    for(side = [-1, 1])
        color("Yellow", 0.6)
            translate([side*(lipo_w/2+8), -20,
                       wall_body+lipo_h/2])
                cube([lipo_w, lipo_d, lipo_h], center=true);

    // E-Stop relay
    color("Red", 0.9)
        translate([0, 60, wall_body+relay_h/2])
            cube([relay_w, relay_d, relay_h], center=true);

    // Star-point GND
    color("Silver", 0.8)
        translate([0, 0, wall_body+5+star_h/2])
            cube([star_w, star_d, star_h], center=true);
}

// ============================================================
// VOLLEDIGE BODY ASSEMBLY
// ============================================================

module body_assembly() {
    // Skelet
    color("SteelBlue", 0.9) body_skeleton();

    // Bodemplaat
    color("SteelBlue", 0.75)
        translate([0, 0, -wall*2])
            body_bottom_lid();

    // Bovendeksel
    color("SteelBlue", 0.75)
        translate([0, 0, body_h+wall*2])
            body_top_lid();

    // Zijpanelen armor
    color("DimGray", 0.7) side_armor_panel(side=1);
    color("DimGray", 0.7) side_armor_panel(side=-1);

    // Component layout (debug overlay)
    component_layout_debug();
}

// ============================================================
// RENDER
// ============================================================

if(MODE == "assembly") {
    body_assembly();
} else if(MODE == "skeleton") {
    color("SteelBlue") body_skeleton();
} else if(MODE == "lid_top") {
    color("SteelBlue") body_top_lid();
} else if(MODE == "lid_bottom") {
    color("SteelBlue") body_bottom_lid();
} else if(MODE == "armor") {
    color("DimGray") side_armor_panel(side=1);
    translate([body_w+20, 0, 0])
        color("DimGray") side_armor_panel(side=-1);
} else if(MODE == "test") {
    body_testprint();
}

// ============================================================
// PRINT INSTRUCTIES
// ── SKELET ──────────────────────────────────────────────────
//   Materiaal  : Prusament PC Space Grade Black
//   Layer      : 0.2mm · 400°C nozzle (hardened steel) · Infill: 40-50% gyroid
//   Oriëntatie : plat op bed (nek mount omhoog)
//   Supports   : organic op nek pijp + beenmount randen
//   Opmerking  : groot print · check bed dimensies!
//                240×200mm → Voron 2.4 Plus4 past dit
//
// ── DEKSEL TOP + BOTTOM ─────────────────────────────────────
//   Materiaal  : PETG-CF
//   Layer      : 0.15mm · 400°C nozzle · Infill: 30% gyroid     // PC Space Grade: enclosure mandatory
//   Oriëntatie : plat op bed
//
// ── ZIJPANELEN ──────────────────────────────────────────────
//   Materiaal  : Prusament PC Space Grade Black
//   Layer      : 0.15mm · 400°C nozzle · Infill: 20% gyroid
//   Oriëntatie : binnenzijde plat op bed
//
// ── COMPONENT MONTAGE VOLGORDE ──────────────────────────────
//   1. Star-point GND blok → midden · alle GND kabels hierop
//   2. BMS ×2              → links+rechts · eerst dan batterij
//   3. LiPo ×2             → schuif in zijkant via bodemplaat
//   4. Buck converters ×7  → stel spanning in VOOR aansluiting
//      7.4V ×4 → 7.40V ±0.05V
//      6.0V ×2 → 5.90V (koud!) · max 6.5V heet
//      5.0V ×1 → 5.05V ±0.05V
//   5. E-Stop relay        → voor centraal · test NC circuit
//   6. PCA9685 ×2          → V+ pin ONVERBONDEN laten!
//   7. Pico W ×2           → via USB naar Pi5
//   8. Pi5                 → laatste · USB-C vanuit 5V buck
//   9. Beenmount QR sockets → 8 stuks · kabel doorvoer eerst
//  10. Zijpanelen armor    → klik op dovetail
//  11. Deksels             → 8× M3 bolt
//
// ── KABELROUTING ────────────────────────────────────────────
//   Power (18AWG rood/zwart):
//     Batterij → BMS → E-Stop relay → buck ingangen
//     Bucks → PTC fuses → servo power rails → beenmounts
//   Signal (22AWG):
//     Pi5 I2C1 → hoofd (via nek)
//     Pi5 UART0 → hoofd RPLIDAR (via nek)
//     Pico #1 I2C0 → PCA9685 ×2
//     Pico #2 I2C1 → INA226 ×4 + TMP117 ×2
//     PCA9685 ×2 → PWM naar 8 beenmounts
//   Aarding:
//     ALLE GND → star-point centraal
//     Geen chassis GND · geen GND loops
//
// ── PRE-POWER CHECKLIST ─────────────────────────────────────
//   ☐ 7.4V buck meten ZONDER belasting → 7.40V
//   ☐ 6.0V buck meten ZONDER belasting → 5.90V
//   ☐ 5.0V buck meten → 5.05V
//   ☐ E-Stop test: relay cuts beide packs
//   ☐ PCA9685 V+ pin visueel controleren: ONVERBONDEN
//   ☐ i2cdetect -y 1: verwacht 0x28 0x29 0x2A
//   ☐ Pico #1 I2C0 scan: verwacht 0x40 0x41
//   ☐ Pico #2 I2C1 scan: verwacht 0x44-0x47 0x48 0x49
//   ☐ 6.0V HOT test onder 2A belasting → max 6.5V
// ============================================================
