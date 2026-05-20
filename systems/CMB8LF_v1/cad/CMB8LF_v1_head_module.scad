// ============================================================
// CMB8LF v1 — HEAD MODULE
// RPLIDAR A1M8 · Pi Camera 3 · VL53L1X ×2 · BNO055
// WS2812B ring · 10W Spotlight · 3W LED · Laser indicators
// ============================================================
// RENDER MODES:
//   MODE = "assembly"   → volledig hoofd gemonteerd
//   MODE = "skeleton"   → alleen structuur
//   MODE = "lid"        → alleen deksel met sensor mounts
//   MODE = "test"       → sensor fit testprint isolatie
// ============================================================

$fn = 24; // 24 test · 80 finale print

MODE = "assembly";

// ── PRINT PARAMETERS ─────────────────────────────────────────
wall          = 4.0;
armor_wall    = 2.5;
thermal_gap   = 1.2;
tol_fit       = 0.2;
tol_snap      = 0.15;   // PC Space Grade shrinkage ~0.3% - validated at 400°C
heatset_d     = 3.2;
heatset_dep   = 6.0;
m3_clear      = 3.4;
rib_w         = 1.5;
vent_w        = 1.8;
cool_slot_w   = 3.0;

// ── HOOFD AFMETINGEN ─────────────────────────────────────────
head_w        = 130.0; // breedte
head_d        = 110.0; // diepte voor-achter
head_h        = 80.0;  // hoogte
head_r        = 18.0;  // hoekradius (afgerond)

// ── SENSOR SPECS ─────────────────────────────────────────────
// RPLIDAR A1M8
lidar_d       = 68.0;  // body diameter
lidar_h       = 38.0;  // body hoogte
lidar_mount_d = 4.0;   // montagegat diameter
lidar_mount_r = 31.0;  // mounting hole radius van center

// Pi Camera Module 3
cam_w         = 25.0;
cam_d         = 24.0;
cam_h         = 9.0;
cam_lens_d    = 7.4;   // lens opening
cam_tilt_range = 30;   // ±30° tilt mogelijk

// VL53L1X ToF sensor
tof_w         = 16.0;
tof_d         = 10.0;
tof_h         = 4.0;
tof_lens_d    = 4.5;   // optisch venster

// BNO055 IMU breakout
imu_w         = 20.0;
imu_d         = 27.0;
imu_h         = 4.0;

// ── VERLICHTING SPECS ─────────────────────────────────────────
// WS2812B ring
ws_ring_od    = 88.0;  // buitendiameter ring
ws_ring_id    = 70.0;  // binnendiameter ring
ws_ring_h     = 5.0;   // hoogte PCB ring
ws_led_count  = 24;    // aantal LEDs op ring

// 10W Spotlight
spot_d        = 38.0;  // reflector diameter
spot_h        = 32.0;  // diepte behuizing
spot_lens_d   = 32.0;  // lens diameter

// 3W White LED
led3w_d       = 20.0;  // heatsink diameter
led3w_h       = 12.0;
led3w_lens_d  = 10.0;

// Laser indicators (zie wiring diagram GP17-20)
laser_d       = 6.2;   // 6mm module
laser_d_armor = 7.0;

// RGB ogen WS2812B (2 stuks, voorkant)
eye_d         = 12.0;  // bezel diameter
eye_depth     = 8.0;
eye_spacing   = 38.0;  // center-to-center

// ── NECK / BODY AANSLUITING ───────────────────────────────────
neck_d        = 42.0;  // koker diameter
neck_h        = 25.0;  // koker hoogte
neck_bolt_r   = 18.0;  // M3 boutcirkel radius
neck_bolts    = 4;     // aantal boutpunten

// ============================================================
// HULP-MODULES
// ============================================================

module m3_heatset(depth = heatset_dep) {
    cylinder(d = heatset_d, h = depth + 0.1);
}

module m3_bolt_pattern(r, n, depth = heatset_dep) {
    for(i = [0:n-1])
        rotate([0, 0, i*(360/n)])
            translate([r, 0, 0])
                m3_heatset(depth);
}

module rounded_box(w, d, h, r) {
    hull()
        for(x = [-1,1]) for(y = [-1,1])
            translate([x*(w/2-r), y*(d/2-r), 0])
                cylinder(r=r, h=h);
}

module sensor_window(w, d, depth = wall+1) {
    // Rechthoekig venster met afgeronde hoeken
    hull()
        for(x = [-1,1]) for(y = [-1,1])
            translate([x*(w/2-1.5), y*(d/2-1.5), -0.1])
                cylinder(r=1.5, h=depth+0.2);
}

module vent_array(count_x, count_y, spacing_x, spacing_y) {
    for(x = [0:count_x-1]) for(y = [0:count_y-1])
        translate([x*spacing_x - (count_x-1)*spacing_x/2,
                   y*spacing_y - (count_y-1)*spacing_y/2, 0])
            cube([vent_w, vent_w*4, wall+2], center=true);
}

// ============================================================
// HOOFD SKELET
// ============================================================

module head_skeleton() {
    difference() {
        union() {
            // Hoofdbehuizing — afgeronde doos
            rounded_box(head_w, head_d, head_h, head_r);

            // LIDAR dom boven
            translate([0, 0, head_h])
                cylinder(d=lidar_d+wall*2, h=lidar_h/2);

            // Nek connector onder
            translate([0, 0, -neck_h])
                cylinder(d=neck_d, h=neck_h+wall);

            // Camera gimbal beugel voor
            translate([0, -head_d/2-wall+1, head_h*0.45])
                rotate([90, 0, 0])
                    cylinder(d=cam_w+wall*3, h=wall*2);

            // Spotlight neus voor
            translate([0, -head_d/2, head_h*0.25])
                rotate([90, 0, 0])
                    cylinder(d=spot_d+wall*2, h=wall*2);

            // 3W LED beugels (links + rechts van spotlight)
            for(side = [-1, 1])
                translate([side*28, -head_d/2, head_h*0.25])
                    rotate([90, 0, 0])
                        cylinder(d=led3w_d+wall*2, h=wall*2);

            // ToF sensor mounts voor (links + rechts)
            for(side = [-1, 1])
                translate([side*42, -head_d/2+1, head_h*0.55])
                    rotate([90, 0, 0])
                        cube([tof_w+wall*2, tof_h+wall*2, wall*2],
                             center=true);

            // RGB oog bezels voor
            for(side = [-1, 1])
                translate([side*eye_spacing/2, -head_d/2+1,
                           head_h*0.35])
                    rotate([90, 0, 0])
                        cylinder(d=eye_d+wall*2, h=wall*2);
        }

        // ── UITSPARINGEN ──────────────────────────────────────

        // Binnenkamer
        translate([0, 0, wall])
            rounded_box(head_w-wall*2, head_d-wall*2,
                        head_h-wall+1, head_r-wall);

        // LIDAR uitsparing + montagegaten
        translate([0, 0, head_h+0.5])
            cylinder(d=lidar_d+tol_fit*2, h=lidar_h+1);
        // LIDAR 4× M3 montagegaten
        translate([0, 0, head_h+wall])
            m3_bolt_pattern(lidar_mount_r, 4, heatset_dep);

        // LIDAR kabeluitgang
        translate([lidar_d/2-8, 0, head_h+lidar_h/2])
            cube([10, 8, lidar_h], center=true);

        // Pi Camera venster + tilt speling
        translate([0, -head_d/2-0.1, head_h*0.45])
            rotate([90, 0, 0]) {
                // Lens opening
                cylinder(d=cam_lens_d+2, h=wall*3);
                // Camera body uitsparing
                translate([0, 0, wall])
                    cube([cam_w+tol_fit*2, cam_h+tol_fit*2,
                          cam_d+tol_fit], center=true);
                // Tilt speling (±30°)
                rotate([cam_tilt_range, 0, 0])
                    cylinder(d=cam_lens_d+4, h=wall*2);
                rotate([-cam_tilt_range, 0, 0])
                    cylinder(d=cam_lens_d+4, h=wall*2);
            }

        // Camera M2 heat-set inserts (×2)
        for(x = [-cam_w/2+2, cam_w/2-2])
            translate([x, -head_d/2-wall+heatset_dep,
                       head_h*0.45])
                rotate([90, 0, 0])
                    cylinder(d=2.6, h=heatset_dep+0.1);

        // Spotlight uitsparing
        translate([0, -head_d/2-0.1, head_h*0.25])
            rotate([90, 0, 0]) {
                cylinder(d=spot_lens_d+tol_fit*2, h=wall*3);
                translate([0, 0, wall])
                    cylinder(d=spot_d+tol_fit*2, h=spot_h);
            }
        // Spotlight M3 mounts
        for(ang = [0, 90, 180, 270])
            rotate([0, 0, ang])
                translate([spot_d/2-2, -head_d/2-wall+heatset_dep,
                           head_h*0.25])
                    rotate([90, 0, 0])
                        m3_heatset();

        // 3W LED uitsparingen
        for(side = [-1, 1])
            translate([side*28, -head_d/2-0.1, head_h*0.25])
                rotate([90, 0, 0]) {
                    cylinder(d=led3w_lens_d+tol_fit*2, h=wall*3);
                    translate([0, 0, wall])
                        cylinder(d=led3w_d+tol_fit*2, h=led3w_h);
                }

        // ToF vensters voor (XSHUT toegankelijk)
        for(side = [-1, 1])
            translate([side*42, -head_d/2-0.1, head_h*0.55])
                rotate([90, 0, 0]) {
                    sensor_window(tof_w, tof_h);
                    // ToF mount gaten
                    for(x = [-tof_w/2+2, tof_w/2-2])
                        translate([x, 0, wall])
                            cylinder(d=2.2, h=heatset_dep);
                }

        // RGB oog uitsparingen
        for(side = [-1, 1])
            translate([side*eye_spacing/2, -head_d/2-0.1,
                       head_h*0.35])
                rotate([90, 0, 0]) {
                    cylinder(d=eye_d+tol_fit*2, h=eye_depth);
                    cylinder(d=eye_d-3, h=wall*3);
                }

        // WS2812B ring groef (aan binnenkant bovenkant)
        translate([0, 0, head_h-ws_ring_h-wall])
            difference() {
                cylinder(d=ws_ring_od+tol_fit*2,
                         h=ws_ring_h+tol_fit);
                cylinder(d=ws_ring_id-tol_fit*2,
                         h=ws_ring_h+2);
            }

        // IMU (BNO055) zitplaats — centraal boven
        translate([0, head_d/4, head_h-wall-imu_h-2])
            cube([imu_w+tol_fit*2, imu_d+tol_fit*2,
                  imu_h+2], center=true);

        // Nek uitsparing
        translate([0, 0, -neck_h-0.1])
            cylinder(d=neck_d-wall*2, h=neck_h+wall+1);
        // Nek kabelgoot
        translate([0, 0, -neck_h-0.1])
            cube([12, 12, neck_h+wall+1], center=true);
        // Nek M3 boutgaten
        translate([0, 0, -2])
            m3_bolt_pattern(neck_bolt_r, neck_bolts);

        // Ventilatie achterkant
        translate([0, head_d/2, head_h*0.5])
            vent_array(4, 3, 12, 10);

        // Ventilatie bovenzijde (LIDAR warmte)
        for(ang = [0:45:315])
            rotate([0, 0, ang])
                translate([lidar_d/2-5, 0, head_h+lidar_h/4])
                    cube([vent_w, vent_w*5, lidar_h/2+1],
                         center=true);

        // Kabelgoot naar nek
        translate([head_w/4, 0, head_h/2])
            cube([10, head_d-wall*4, head_h], center=true);

        // Laser indicator gaten (2× rood + 2× groen)
        // Onder de ToF sensors, voorhoek links+rechts
        for(side = [-1, 1]) {
            // Rood
            translate([side*52, -head_d/2-0.1, head_h*0.42])
                rotate([90, 0, 0])
                    cylinder(d=laser_d, h=wall*3);
            // Groen
            translate([side*52, -head_d/2-0.1, head_h*0.30])
                rotate([90, 0, 0])
                    cylinder(d=laser_d, h=wall*3);
        }

        // Deksel schroefgaten (4 hoeken)
        for(x = [-1,1]) for(y = [-1,1])
            translate([x*(head_w/2-10), y*(head_d/2-10),
                       head_h-heatset_dep])
                m3_heatset();
    }
}

// ============================================================
// HOOFD DEKSEL (afneembaar voor onderhoud)
// ============================================================

module head_lid() {
    difference() {
        union() {
            // Deksel plaat
            rounded_box(head_w-tol_snap*2,
                        head_d-tol_snap*2,
                        wall*2, head_r-wall);
            // Lip die in behuizing past
            translate([0, 0, wall])
                rounded_box(head_w-wall*2-tol_snap*2,
                            head_d-wall*2-tol_snap*2,
                            wall, head_r-wall*2);
        }
        // M3 doorgangsgaten
        for(x = [-1,1]) for(y = [-1,1])
            translate([x*(head_w/2-10), y*(head_d/2-10), -0.1])
                cylinder(d=m3_clear, h=wall*3);
        // Kabeluitgang deksel
        translate([0, 0, 0])
            cube([14, 14, wall*3+1], center=true);
    }
}

// ============================================================
// HOOFD ARMOR PANEEL (voorkant)
// ============================================================

module head_front_armor() {
    difference() {
        union() {
            // Paneel
            hull()
                for(x = [-1,1])
                    translate([x*(head_w/2-head_r),
                               -head_d/2-armor_wall, 0])
                        cylinder(r=head_r, h=head_h*0.7);
            // Spotlight bezel
            translate([0, -head_d/2-armor_wall*2, head_h*0.25])
                rotate([90, 0, 0])
                    cylinder(d=spot_d+armor_wall*2, h=armor_wall*2);
            // LED bezels
            for(side = [-1,1])
                translate([side*28, -head_d/2-armor_wall*2,
                           head_h*0.25])
                    rotate([90, 0, 0])
                        cylinder(d=led3w_d+armor_wall*2,
                                 h=armor_wall*2);
        }
        // Skelet uitsparing
        translate([0, -head_d/2-armor_wall-0.1, 0])
            hull()
                for(x = [-1,1])
                    translate([x*(head_w/2-head_r-armor_wall),
                               0, armor_wall])
                        cylinder(r=head_r-armor_wall,
                                 h=head_h*0.7);
        // Spotlight opening
        translate([0, -head_d/2-armor_wall*3, head_h*0.25])
            rotate([90, 0, 0])
                cylinder(d=spot_lens_d, h=armor_wall*4);
        // LED openingen
        for(side = [-1,1])
            translate([side*28, -head_d/2-armor_wall*3,
                       head_h*0.25])
                rotate([90, 0, 0])
                    cylinder(d=led3w_lens_d, h=armor_wall*4);
        // Camera venster (groot voor FOV)
        translate([0, -head_d/2-armor_wall*3, head_h*0.45])
            rotate([90, 0, 0])
                cylinder(d=cam_lens_d+8, h=armor_wall*4);
        // ToF vensters
        for(side = [-1,1])
            translate([side*42, -head_d/2-armor_wall*3,
                       head_h*0.55])
                rotate([90, 0, 0])
                    sensor_window(tof_w+2, tof_h+2,
                                  armor_wall*4);
        // Oog vensters
        for(side = [-1,1])
            translate([side*eye_spacing/2,
                       -head_d/2-armor_wall*3, head_h*0.35])
                rotate([90, 0, 0])
                    cylinder(d=eye_d, h=armor_wall*4);
        // Laser vensters (4×)
        for(side = [-1,1]) {
            translate([side*52, -head_d/2-armor_wall*3,
                       head_h*0.42])
                rotate([90, 0, 0])
                    cylinder(d=laser_d_armor, h=armor_wall*4);
            translate([side*52, -head_d/2-armor_wall*3,
                       head_h*0.30])
                rotate([90, 0, 0])
                    cylinder(d=laser_d_armor, h=armor_wall*4);
        }
        // Ventilatieslots
        for(i = [-2:2])
            translate([i*14, -head_d/2-armor_wall*2,
                       head_h*0.65])
                cube([vent_w, armor_wall*4+1, 8], center=true);
    }
}

// ============================================================
// NECK CONNECTOR (verbindt hoofd met body)
// ============================================================

module neck_connector() {
    // Laat toe: ±15° kantelen (nicken)
    difference() {
        union() {
            // Onderste flens (naar body)
            cylinder(d=neck_d+wall*4, h=wall*2);
            // Koker
            translate([0, 0, wall*2])
                cylinder(d=neck_d, h=neck_h);
            // Bovenste flens (naar hoofd)
            translate([0, 0, neck_h+wall*2])
                cylinder(d=neck_d+wall*4, h=wall*2);
        }
        // Centrale doorvoer (kabels + as)
        cylinder(d=neck_d-wall*2, h=neck_h+wall*5);
        // Boutgaten boven
        translate([0, 0, neck_h+wall*2])
            m3_bolt_pattern(neck_bolt_r, neck_bolts);
        // Boutgaten onder
        m3_bolt_pattern(neck_bolt_r, neck_bolts);
        // Tilt speling sleuven (±15° nicken)
        for(ang = [0, 180])
            rotate([0, 0, ang])
                translate([neck_d/2-wall, 0, neck_h/2+wall*2])
                    cube([wall+2, 8, neck_h*0.6], center=true);
    }
}

// ============================================================
// TESTPRINT MODULE
// ============================================================

module head_testprint() {
    // 1. LIDAR mount ring
    translate([0, 0, 0])
        color("SteelBlue")
        difference() {
            cylinder(d=lidar_d+wall*2, h=wall*3);
            cylinder(d=lidar_d+tol_fit*2, h=wall*3+1);
            m3_bolt_pattern(lidar_mount_r, 4, heatset_dep);
        }
    // 2. Camera tilt beugel
    translate([90, 0, 0])
        color("SteelBlue")
        difference() {
            cube([cam_w+wall*4, cam_d+wall*4, cam_h+wall*4],
                 center=true);
            cube([cam_w+tol_fit*2, cam_d+tol_fit*2,
                  cam_h+tol_fit], center=true);
            rotate([90, 0, 0])
                cylinder(d=cam_lens_d+2, h=cam_d+wall*5,
                         center=true);
        }
    // 3. ToF sensor pocket
    translate([160, 0, 0])
        color("SteelBlue")
        difference() {
            cube([tof_w+wall*4, tof_d+wall*4, tof_h+wall*4],
                 center=true);
            cube([tof_w+tol_fit*2, tof_d+tol_fit*2,
                  tof_h+tol_fit], center=true);
            translate([0, 0, -(tof_h/2+wall*2)])
                cylinder(d=tof_lens_d, h=tof_h+wall*5);
        }
    // 4. Nek connector testprint
    translate([0, 120, 0])
        color("Orange") neck_connector();
    // 5. Laser mount (2× naast elkaar)
    translate([90, 120, 0])
        color("SteelBlue")
        for(i = [0, 1])
            translate([i*20, 0, 0])
            difference() {
                cylinder(d=laser_d+wall*4, h=wall*2+laser_d);
                rotate([90, 0, 0])
                    cylinder(d=laser_d, h=wall*3+1,
                             center=true);
            }
}

// ============================================================
// VOLLEDIGE HOOFD ASSEMBLY
// ============================================================

module head_assembly() {
    // Skelet
    color("SteelBlue", 0.9) head_skeleton();

    // Deksel boven
    color("SteelBlue", 0.75)
        translate([0, 0, head_h])
            head_lid();

    // Front armor paneel
    color("DimGray", 0.8) head_front_armor();

    // Nek connector
    color("DimGray", 0.9)
        translate([0, 0, -neck_h])
            neck_connector();

    // LIDAR (visueel)
    color("Black", 0.8)
        translate([0, 0, head_h+wall])
            cylinder(d=lidar_d, h=lidar_h);

    // Camera (visueel)
    color("DarkGreen", 0.9)
        translate([0, -head_d/2-wall, head_h*0.45])
            rotate([90, 0, 0])
                cylinder(d=cam_w, h=cam_d);

    // Spotlight (visueel)
    color("Yellow", 0.6)
        translate([0, -head_d/2-wall, head_h*0.25])
            rotate([90, 0, 0])
                cylinder(d=spot_lens_d, h=spot_h);

    // RGB ogen (visueel)
    for(side = [-1,1])
        color("Red", 0.8)
            translate([side*eye_spacing/2,
                       -head_d/2-eye_depth, head_h*0.35])
                rotate([90, 0, 0])
                    cylinder(d=eye_d-2, h=eye_depth);

    // WS2812B ring (visueel)
    color("Green", 0.6)
        translate([0, 0, head_h-ws_ring_h-wall+0.5])
            difference() {
                cylinder(d=ws_ring_od, h=ws_ring_h);
                cylinder(d=ws_ring_id, h=ws_ring_h+1);
            }

    // Laser indicators (visueel · rood + groen)
    for(side = [-1,1]) {
        color("Red", 0.9)
            translate([side*52, -head_d/2-wall-15, head_h*0.42])
                rotate([90, 0, 0])
                    cylinder(d=6, h=20);
        color("Green", 0.9)
            translate([side*52, -head_d/2-wall-15, head_h*0.30])
                rotate([90, 0, 0])
                    cylinder(d=6, h=20);
    }

    // ToF sensors (visueel)
    for(side = [-1,1])
        color("DarkBlue", 0.8)
            translate([side*42, -head_d/2-wall, head_h*0.55])
                rotate([90, 0, 0])
                    cube([tof_w, tof_h, tof_d], center=true);

    // IMU BNO055 (visueel)
    color("DarkGreen", 0.7)
        translate([0, head_d/4, head_h-wall-imu_h/2-2])
            cube([imu_w, imu_d, imu_h], center=true);
}

// ============================================================
// RENDER
// ============================================================

if(MODE == "assembly") {
    head_assembly();
} else if(MODE == "skeleton") {
    color("SteelBlue") head_skeleton();
} else if(MODE == "lid") {
    color("SteelBlue") head_lid();
} else if(MODE == "test") {
    head_testprint();
}

// ============================================================
// PRINT INSTRUCTIES
// ── HOOFD SKELET ────────────────────────────────────────────
//   Materiaal  : Prusament PC Space Grade Black
//   Layer      : 0.2mm · 400°C nozzle (hardened steel) · Infill: 40% gyroid
//   Oriëntatie : rechtop (nek naar beneden)
//   Supports   : organic op LIDAR dom + camera beugel
//
// ── FRONT ARMOR ─────────────────────────────────────────────
//   Materiaal  : Prusament PC Space Grade Black
//   Layer      : 0.15mm · 400°C nozzle · Infill: 25% gyroid
//   Oriëntatie : binnenzijde op bed
//   Supports   : geen (vensters zelfonderstenend)
//
// ── DEKSEL ──────────────────────────────────────────────────
//   Materiaal  : PETG-CF
//   Layer      : 0.15mm · 400°C nozzle · Infill: 30% gyroid     // PC Space Grade: enclosure mandatory
//   Oriëntatie : plat op bed
//
// ── NEK CONNECTOR ───────────────────────────────────────────
//   Materiaal  : PETG-CF
//   Layer      : 0.2mm · 400°C nozzle (hardened steel) · Infill: 50% gyroid (kracht!)
//   Oriëntatie : rechtop
//
// ── SENSOR MONTAGE VOLGORDE ─────────────────────────────────
//   1. LIDAR A1M8    → dom boven · 4× M3 heat-set
//   2. BNO055 IMU    → centraal boven · tape + 2× M2
//   3. VL53L1X ×2   → voor links+rechts · XSHUT kabel vrij
//   4. Pi Camera 3   → voor centraal · CSI ribbon naar nek
//   5. WS2812B ring  → druk in groef · data van Pico GP14
//   6. RGB ogen ×2   → druk in bezel · WS2812B data chain
//   7. Spotlight 10W → voor centraal · MOSFET IRLZ44N
//   8. 3W LED ×2     → voor zij · MOSFET IRLZ44N
//   9. Laser ×4      → schuif in · rood GP17/19 · groen GP18/20
//  10. Front armor   → klik op dovetail · geen gereedschap
//
// ── KABELROUTING ────────────────────────────────────────────
//   Alle kabels via nek koker naar body
//   CSI ribbon flat via dedicated sleuf
//   I2C: BNO055 + VL53L1X ×2 op zelfde bus (Pi5 I2C1)
//   UART: RPLIDAR via nek naar Pi5 GPIO14/15
//   Power: 5V via nek voor logic + LEDs
// ============================================================
