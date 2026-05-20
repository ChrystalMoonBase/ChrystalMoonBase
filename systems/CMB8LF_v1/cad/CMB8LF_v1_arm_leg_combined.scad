// ============================================================
// CMB8LF v1 — ARM/LEG COMBINED MODULE
// Leg 1 + Leg 2 · Dual function: walking foot OR robot arm
// Gripper end-effector · Quick release · Laser indicators
// ============================================================
// RENDER MODES:
//   MODE = "arm"      → gripper end-effector actief
//   MODE = "leg"      → standaard voet actief
//   MODE = "assembly" → volledig been + end-effector
//   MODE = "test"     → gripper + QR testprint isolatie
// ============================================================

$fn = 24; // 24 test · 80 finale print

MODE = "assembly";

// ── SERVO SPECS ───────────────────────────────────────────────
ds3240_w       = 40.5; ds3240_d = 20.5; ds3240_h = 40.0;
ds3240_shaft   = 33.0; ds3240_shaft_d = 5.9; ds3240_mount = 28.0;

ds3225_w       = 40.5; ds3225_d = 20.5; ds3225_h = 38.0;
ds3225_shaft   = 32.0; ds3225_shaft_d = 5.9; ds3225_mount = 28.0;

ds3218_w       = 40.5; ds3218_d = 20.5; ds3218_h = 36.0;
ds3218_shaft   = 30.0; ds3218_shaft_d = 5.9; ds3218_mount = 28.0;

// ── LAGER: F688-2RS 8×16×5mm ─────────────────────────────────
brg_od = 16.0; brg_id = 8.0; brg_h = 5.0; brg_tol = 0.1;

// ── BEEN AFMETINGEN ───────────────────────────────────────────
femur_len  = 134.0; // +12mm tov standaard been voor arm bereik
tibia_len  = 95.0;
hip_offset = 18.0;

// ── PRINT PARAMETERS ─────────────────────────────────────────
wall       = 5.0;
armor_wall = 2.5;
thermal_gap = 1.2;
tol_fit    = 0.2;
tol_snap   = 0.15; // PETG-CF · 0.15 per kant
heatset_d  = 3.2;
heatset_dep = 6.0;
m3_clear   = 3.4;
rib_w      = 1.5;
cool_slot_w = 3.0;
cool_slot_d = 2.5;
vent_w     = 1.8;
cable_ch_w = 8.0;
cable_ch_h = 6.0;

// ── GRIPPER SPECS ─────────────────────────────────────────────
grip_servo_w   = 40.5; // DS3225 of MG996R
grip_servo_d   = 20.5;
grip_servo_h   = 38.0;
grip_jaw_len   = 45.0; // kaaklengte
grip_jaw_w     = 18.0; // kaakbreedte
grip_jaw_h     = 12.0; // kaakhoogte
grip_open_ang  = 45;   // max openingshoek graden
grip_finger_t  = 4.0;  // vingerwand dikte

// ── QUICK RELEASE SPECS ───────────────────────────────────────
qr_pin_d    = 3.2;
qr_spring_w = 2.5;  // v1.1 fix: was 1.5mm
qr_depth    = 14.0; // iets dieper dan standaard been
qr_catch_d  = 4.5;
qr_body_d   = 22.0; // body diameter QR connector
qr_body_h   = 18.0; // body hoogte QR connector
qr_pole     = 3;    // aantal vergrendelpennen (120° spacing)

// ── LASER SPECS ───────────────────────────────────────────────
laser_d     = 6.2;  // 6mm module + 0.2 speling
laser_d_armor = 7.0; // venster in armor
laser_spacing = ds3218_d / 3;

// ============================================================
// HULP-MODULES
// ============================================================

module m3_heatset(depth = heatset_dep) {
    cylinder(d = heatset_d, h = depth + 0.1);
}

module bearing_pocket(tol = brg_tol) {
    cylinder(d = brg_od + tol*2, h = brg_h + tol);
}

module servo_volume(w, d, h, clearance = tol_fit) {
    translate([-w/2-clearance, -d/2-clearance, -clearance])
        cube([w+clearance*2, d+clearance*2, h+clearance*2]);
    translate([-cable_ch_w/2, -d/2-clearance, -clearance-cable_ch_h])
        cube([cable_ch_w, d+clearance*2, cable_ch_h+1]);
}

module cooling_channels_side(servo_h, servo_d, count=4) {
    spacing = (servo_h - wall) / (count + 1);
    for(i = [1:count])
        translate([-cool_slot_w/2, -servo_d/2-cool_slot_d, i*spacing])
            cube([cool_slot_w, cool_slot_d+0.1, cool_slot_w]);
}

module thermal_pad_seat(w, d, depth=0.8) {
    translate([-w/2, -d/2, -0.1])
        cube([w, d, depth+0.1]);
}

module ribs(length, height, count=5) {
    spacing = length / (count+1);
    for(i = [1:count])
        translate([i*spacing - length/2, 0, 0])
            cube([rib_w, wall+2, height], center=true);
}

module dovetail_male(h=8) {
    linear_extrude(h)
        polygon(points=[[-2,0],[-4,6],[4,6],[2,0]]);
}

module dovetail_female(h=8) {
    linear_extrude(h+0.2)
        polygon(points=[
            [-2-tol_snap,-0.1],[-4-tol_snap,6+tol_snap],
            [4+tol_snap,6+tol_snap],[2+tol_snap,-0.1]
        ]);
}

// ── Quick release met 2.5mm veer + 45° fillet ────────────────
module quick_release_slot() {
    translate([-qr_pin_d/2-tol_snap, 0, 0])
        cube([qr_pin_d+tol_snap*2, qr_depth, qr_pin_d+tol_snap*2]);
    translate([-qr_spring_w/2, 0, -qr_pin_d])
        cube([qr_spring_w, qr_depth, qr_pin_d*2]);
    // 45° fillet voor sterkte
    translate([-qr_spring_w/2, 0, -qr_pin_d])
        rotate([0, 45, 0])
            cube([qr_spring_w*0.7, qr_depth, qr_spring_w*0.7]);
    translate([0, qr_depth-qr_catch_d/2, 0])
        sphere(d=qr_catch_d+tol_snap);
}

// ── Laser module mount ────────────────────────────────────────
module laser_mount(armor=false) {
    d = armor ? laser_d_armor : laser_d;
    rotate([0, 90, 0])
        cylinder(d=d, h=wall*2+1, center=true);
}

// ============================================================
// QUICK RELEASE BODY CONNECTOR
// ── 3-polige vergrendeling, geen gereedschap ─────────────────
// Printen in PETG-CF · past op heup van ALLE benen
// ============================================================

module qr_connector_body() {
    // Mannelijk deel — zit aan het been
    difference() {
        union() {
            // Hoofdcilinder
            cylinder(d=qr_body_d, h=qr_body_h);
            // Flens voor positiebepaling
            translate([0, 0, qr_body_h-2])
                cylinder(d=qr_body_d+4, h=2);
        }
        // As doorvoer
        cylinder(d=brg_id+tol_fit*2, h=qr_body_h+1, center=false);
        // 3 vergrendelpennen op 120°
        for(i=[0:qr_pole-1])
            rotate([0, 0, i*(360/qr_pole)])
                translate([qr_body_d/2-2, 0, qr_body_h/2])
                    rotate([90, 0, 0])
                        quick_release_slot();
        // Kabelgoot door connector
        translate([-cable_ch_w/2, -cable_ch_w/2, -0.1])
            cube([cable_ch_w, cable_ch_w, qr_body_h+1]);
    }
}

module qr_connector_socket() {
    // Vrouwelijk deel — zit op de body/chassis
    difference() {
        cylinder(d=qr_body_d+wall*2, h=qr_body_h+wall);
        // Uitsparing voor mannelijk deel
        translate([0, 0, wall])
            cylinder(d=qr_body_d+tol_snap*2, h=qr_body_h+1);
        // As doorvoer
        cylinder(d=brg_id+tol_fit*2, h=qr_body_h+wall+1);
        // Lager pocket boven
        translate([0, 0, wall])
            bearing_pocket();
        // Vangst gaten voor 3 pennen
        for(i=[0:qr_pole-1])
            rotate([0, 0, i*(360/qr_pole)+60])
                translate([qr_body_d/2+tol_snap, 0,
                           qr_body_h/2+wall])
                    rotate([90, 0, 0])
                        cylinder(d=qr_pin_d+tol_snap*2, h=8,
                                 center=true);
        // Kabelgoot
        translate([-cable_ch_w/2, -cable_ch_w/2, -0.1])
            cube([cable_ch_w, cable_ch_w, qr_body_h+wall+1]);
    }
}

// ============================================================
// GRIPPER END-EFFECTOR
// ── DS3225/MG996R servo · twee kaken · veerbelast open ───────
// ============================================================

module gripper_jaw(side=1) {
    // Één kaak — gespiegeld voor linker/rechter
    mirror([0, side<0?1:0, 0])
    difference() {
        union() {
            // Kak lichaam
            hull() {
                cube([grip_jaw_len, grip_jaw_w/2,
                      grip_jaw_h], center=false);
                translate([grip_jaw_len, 0, grip_jaw_h/2])
                    rotate([0, 90, 0])
                        cylinder(d=grip_jaw_h, h=2);
            }
            // Servo horn bevestiging
            translate([0, 0, grip_jaw_h/2])
                rotate([0, 90, 0])
                    cylinder(d=grip_jaw_h+4, h=grip_finger_t);
        }
        // Servo horn gat
        translate([grip_finger_t/2, 0, grip_jaw_h/2])
            rotate([0, 90, 0])
                cylinder(d=ds3225_shaft_d+tol_fit*2,
                         h=grip_finger_t+1, center=true);
        // Grip reliëf (binnenzijde kak)
        for(i=[0:3])
            translate([8+i*9, -0.1, grip_jaw_h/2])
                rotate([90, 0, 0])
                    cylinder(d=3, h=grip_jaw_w/2+1);
        // Gewichtsreductie
        translate([grip_jaw_len/2, grip_jaw_w/4,
                   grip_jaw_h/2])
            cube([grip_jaw_len-grip_finger_t*4,
                  grip_jaw_w/4, grip_jaw_h-grip_finger_t*2],
                 center=true);
    }
}

module gripper_body() {
    // Hoofdbehuizing gripper servo
    difference() {
        union() {
            // Servo huis
            hull() {
                cube([grip_servo_w+wall*2,
                      grip_servo_d+wall*2,
                      grip_servo_h+wall], center=true);
                translate([0, 0, -(grip_servo_h/2+wall)])
                    cylinder(d=grip_servo_d+wall*2, h=2,
                             center=true);
            }
            // Mount ring naar tibia QR connector
            translate([0, 0, grip_servo_h/2+wall/2])
                cylinder(d=qr_body_d+wall*2,
                         h=qr_body_h+wall);
            // Laser module houders (links+rechts van neus)
            translate([grip_servo_w/2+wall-0.1, 0,
                       grip_servo_h/4])
                rotate([0, 90, 0])
                    cylinder(d=laser_d+wall*2, h=wall+0.2);
            translate([-(grip_servo_w/2+wall-0.1), 0,
                       grip_servo_h/4])
                rotate([0, 90, 0])
                    cylinder(d=laser_d+wall*2, h=wall+0.2);
        }
        // Servo uitsparing
        servo_volume(grip_servo_w, grip_servo_d, grip_servo_h);
        // Servo shaft
        cylinder(d=grip_servo_shaft_d()+tol_fit*2,
                 h=grip_servo_h+wall*2, center=true);
        // QR socket uitsparing
        translate([0, 0, grip_servo_h/2+wall])
            cylinder(d=qr_body_d+tol_snap*2,
                     h=qr_body_h+1);
        // Laser gaten rood (rechts)
        translate([grip_servo_w/2+wall, 0, grip_servo_h/4])
            laser_mount();
        // Laser gaten groen (links)
        translate([-(grip_servo_w/2+wall), 0, grip_servo_h/4])
            laser_mount();
        // M3 servo mounts
        for(sign=[-1,1])
            translate([sign*ds3225_mount/2, 0,
                       -grip_servo_h/2+heatset_dep-wall])
                m3_heatset();
        // Koelkanalen
        cooling_channels_side(grip_servo_h, grip_servo_d,
                              count=3);
        mirror([0,1,0])
            cooling_channels_side(grip_servo_h, grip_servo_d,
                                 count=3);
        // Kabelgoot
        translate([0, grip_servo_d/2+wall/2, -grip_servo_h/4])
            cube([cable_ch_w, cable_ch_w, grip_servo_h],
                 center=true);
    }
}

function grip_servo_shaft_d() = ds3225_shaft_d;

module gripper_assembly() {
    color("DarkSlateGray", 0.9) gripper_body();
    // Kaken op servo horn positie
    translate([0, grip_jaw_w/2+tol_fit, 0]) {
        color("Gray", 0.8) gripper_jaw(side=1);
        color("Gray", 0.8) gripper_jaw(side=-1);
    }
    // QR connector body (mannelijk)
    color("Orange", 0.9)
        translate([0, 0, grip_servo_h/2+wall])
            qr_connector_body();
    // Laser modules (visueel)
    color("Red", 0.9)
        translate([grip_servo_w/2+wall+1, 0, grip_servo_h/4])
            rotate([0, 90, 0])
                cylinder(d=6, h=20);
    color("Green", 0.9)
        translate([-(grip_servo_w/2+wall+21), 0,
                   grip_servo_h/4])
            rotate([0, 90, 0])
                cylinder(d=6, h=20);
}

// ============================================================
// TIBIA ARM — verlengd + laser gaten + QR socket distaal
// ============================================================

module tibia_arm() {
    difference() {
        union() {
            // Taps toelopende buis
            hull() {
                translate([-tibia_len/2, 0, 0])
                    cube([1, ds3218_d+wall*2,
                          ds3218_h/2+wall], center=true);
                translate([tibia_len/2, 0, 0])
                    cube([1, ds3218_d+wall,
                          ds3218_h/3+wall], center=true);
            }
            // Servo huis
            translate([-tibia_len/4, 0, -ds3218_h/4])
                cube([ds3218_w+wall*2, ds3218_d+wall*2,
                      ds3218_h/2+wall], center=true);
            // Proximaal lagerhuis
            translate([-tibia_len/2, 0, 0])
                rotate([90,0,0])
                    cylinder(d=brg_od+wall*2,
                             h=brg_h*2+wall, center=true);
            // QR socket distaal (voor gripper)
            translate([tibia_len/2-qr_body_h/2, 0, 0])
                rotate([90,0,0])
                    cylinder(d=qr_body_d+wall*2,
                             h=qr_body_h+wall, center=true);
            ribs(tibia_len, ds3218_h/2+wall, count=4);
        }
        // Servo uitsparing
        translate([-tibia_len/4, 0, -wall/2])
            servo_volume(ds3218_w, ds3218_d, ds3218_h);
        // Servo shaft
        translate([-tibia_len/4, 0, 0])
            cylinder(d=ds3218_shaft_d+tol_fit*2,
                     h=ds3218_h+wall*2, center=true);
        // Proximaal lager
        translate([-tibia_len/2, 0, 0])
            rotate([90,0,0]) bearing_pocket();
        translate([-tibia_len/2, 0, 0])
            rotate([90,0,0])
                cylinder(d=brg_id+tol_fit*2,
                         h=brg_h*3, center=true);
        // QR socket uitsparing distaal
        translate([tibia_len/2, 0, 0])
            rotate([90,0,0])
                cylinder(d=qr_body_d+tol_snap*2,
                         h=qr_body_h+1, center=true);
        // Lager in QR socket
        translate([tibia_len/2, 0, 0])
            rotate([90,0,0]) bearing_pocket();
        // M3 servo mounts
        for(sign=[-1,1])
            translate([-tibia_len/4+sign*ds3218_mount/2,
                       0, -ds3218_h/2+heatset_dep-wall])
                m3_heatset();
        // Laser gaten rood + groen
        translate([tibia_len/2-wall*2, 0, ds3218_h/4])
            laser_mount();
        translate([tibia_len/2-wall*2, laser_spacing,
                   ds3218_h/4])
            laser_mount();
        // Koelkanalen
        cooling_channels_side(ds3218_h, ds3218_d, count=3);
        mirror([0,1,0])
            cooling_channels_side(ds3218_h, ds3218_d, count=3);
        // Kabelgoot
        translate([0, ds3218_d/2+wall/2, -ds3218_h/4])
            cube([tibia_len-wall*4, cable_ch_w, cable_ch_h],
                 center=true);
        // Thermisch pad
        translate([-tibia_len/4, 0, ds3218_h/4])
            thermal_pad_seat(ds3218_w-wall, ds3218_d-wall);
        // DoMoS₂ dry lubeail armor
        for(side=[-1,1])
            translate([side*tibia_len/4, 0,
                       ds3218_h/4+wall-0.1])
                dovetail_female(h=8);
    }
}

// ── Voet (standaard been mode) ────────────────────────────────
module foot_standard() {
    // Simpele voet met anti-slip profiel
    difference() {
        union() {
            // Enkelhuis
            sphere(d=brg_od+wall*2);
            // Voetkubus
            translate([0, 0, -(brg_od/2+wall+8)])
                hull() {
                    cylinder(d=brg_od+wall*2, h=2,
                             center=true);
                    translate([0, 0, -10])
                        cube([20, 14, 4], center=true);
                }
        }
        // As doorvoer
        cylinder(d=brg_id+tol_fit*2, h=brg_od+wall*4,
                 center=true);
        // Anti-slip groeven
        for(i=[-1,0,1])
            translate([i*5, 0, -(brg_od/2+wall+16)])
                cube([3, 16, 4], center=true);
    }
}

// ============================================================
// FEMUR ARM — +12mm tov standaard voor arm bereik
// ============================================================

module femur_arm() {
    difference() {
        union() {
            difference() {
                cube([femur_len, ds3225_d+wall*2,
                      ds3225_h/2+wall], center=true);
                translate([0, 0, wall])
                    cube([femur_len-wall*4,
                          ds3225_d+wall*2-rib_w*2,
                          ds3225_h/2], center=true);
            }
            translate([0, 0, -ds3225_h/4])
                cube([ds3225_w+wall*2, ds3225_d+wall*2,
                      ds3225_h/2+wall], center=true);
            translate([-femur_len/2, 0, 0])
                rotate([90,0,0])
                    cylinder(d=brg_od+wall*2,
                             h=brg_h*2+wall, center=true);
            translate([femur_len/2, 0, 0])
                rotate([90,0,0])
                    cylinder(d=brg_od+wall*2,
                             h=brg_h*2+wall, center=true);
            ribs(femur_len, ds3225_h/2+wall, count=6);
        }
        translate([0, 0, -wall/2])
            servo_volume(ds3225_w, ds3225_d, ds3225_h);
        cylinder(d=ds3225_shaft_d+tol_fit*2,
                 h=ds3225_h+wall*2, center=true);
        for(x=[-femur_len/2, femur_len/2])
            translate([x, 0, 0])
                rotate([90,0,0]) {
                    bearing_pocket();
                    cylinder(d=brg_id+tol_fit*2,
                             h=brg_h*3+wall*2, center=true);
                }
        for(sign=[-1,1])
            translate([sign*ds3225_mount/2, 0,
                       -ds3225_h/2+heatset_dep-wall])
                m3_heatset();
        for(i=[-1.5,-0.5,0.5,1.5])
            translate([i*10, 0, ds3225_h/4+wall/2])
                cube([cool_slot_w, ds3225_d+wall*2+1,
                      cool_slot_d], center=true);
        cooling_channels_side(ds3225_h, ds3225_d, count=4);
        mirror([0,1,0])
            cooling_channels_side(ds3225_h, ds3225_d, count=4);
        translate([0, ds3225_d/2+wall/2, -ds3225_h/4])
            cube([femur_len-wall*4, cable_ch_w, cable_ch_h],
                 center=true);
        translate([0, 0, ds3225_h/4])
            thermal_pad_seat(ds3225_w-wall, ds3225_d-wall);
        for(side=[-1,1])
            translate([side*(femur_len/4), 0,
                       ds3225_h/4+wall-0.1])
                dovetail_female(h=8);
    }
}

// ── Hip skelet (identiek aan standaard been) ──────────────────
module hip_arm() {
    difference() {
        union() {
            hull() {
                cube([ds3240_w+wall*2, ds3240_d+wall*2,
                      ds3240_h+wall], center=true);
                translate([0,0,-ds3240_h/2-wall])
                    cylinder(d=ds3240_d+wall*2, h=2,
                             center=true);
            }
            translate([0,0,ds3240_h/2+wall/2])
                cylinder(d=brg_od+wall*2, h=brg_h*2+wall);
            translate([0,0,-ds3240_h/2-wall-brg_h*2])
                cylinder(d=brg_od+wall*2, h=brg_h*2+wall);
            translate([hip_offset/2,0,ds3240_shaft/2])
                cube([hip_offset+brg_od+wall*2,
                      brg_od+wall*2,
                      brg_h*2+wall*2], center=true);
        }
        servo_volume(ds3240_w, ds3240_d, ds3240_h);
        translate([0,0,ds3240_h/2+wall/2]) bearing_pocket();
        translate([0,0,-ds3240_h/2-wall-brg_h]) bearing_pocket();
        cylinder(d=brg_id+tol_fit*2,
                 h=ds3240_h+wall*4, center=true);
        for(x=[-ds3240_mount/2, ds3240_mount/2])
            translate([x,0,-ds3240_h/2-wall+heatset_dep])
                m3_heatset();
        translate([hip_offset+brg_od/2+wall,0,ds3240_shaft/2])
            rotate([90,0,0]) bearing_pocket(tol=brg_tol);
        // QR slot voor been-wissel op hip
        translate([0, ds3240_d/2+wall-1, 0])
            rotate([90,0,0]) quick_release_slot();
        cooling_channels_side(ds3240_h, ds3240_d, count=4);
        mirror([0,1,0])
            cooling_channels_side(ds3240_h, ds3240_d, count=4);
        translate([ds3240_w/2-cable_ch_w/2,0,0])
            cube([cable_ch_w, cable_ch_w,
                  ds3240_h+wall*2+2], center=true);
    }
}

// ============================================================
// ARMOR PANELEN (arm variant)
// ============================================================

module femur_arm_armor() {
    difference() {
        hull()
            cube([femur_len+armor_wall*2,
                  ds3225_d+wall*2+thermal_gap*2+armor_wall*2,
                  ds3225_h/2+wall+thermal_gap+armor_wall],
                 center=true);
        cube([femur_len+tol_snap*2,
              ds3225_d+wall*2+thermal_gap*2,
              ds3225_h/2+wall+thermal_gap+1], center=true);
        for(i=[-2:2])
            translate([i*18,0,
                       ds3225_h/4+wall+thermal_gap/2+armor_wall/2])
                cube([vent_w, ds3225_d+wall+thermal_gap,
                      armor_wall+1], center=true);
        for(side=[-1,1])
            translate([side*(femur_len/4),
                       ds3225_d/2+wall+thermal_gap+armor_wall-0.1,
                       ds3225_h/4+wall])
                rotate([90,0,0]) dovetail_female(h=8);
    }
    // DoMoS₂ dry lubeail knoppen
    for(side=[-1,1])
        translate([side*(femur_len/4),
                   -(ds3225_d/2+wall+thermal_gap+armor_wall-0.1),
                   ds3225_h/4+wall])
            rotate([90,0,0]) dovetail_male(h=8);
}

module tibia_arm_armor() {
    difference() {
        hull() {
            translate([-tibia_len/2,0,0])
                cube([1, ds3218_d+wall*2+thermal_gap*2+armor_wall*2,
                      ds3218_h/2+wall+thermal_gap+armor_wall],
                     center=true);
            translate([tibia_len/2,0,0])
                cube([1, ds3218_d+wall+thermal_gap+armor_wall*2,
                      ds3218_h/3+wall+thermal_gap+armor_wall],
                     center=true);
        }
        hull() {
            translate([-tibia_len/2,0,0])
                cube([1, ds3218_d+wall*2+thermal_gap*2,
                      ds3218_h/2+wall+thermal_gap+1], center=true);
            translate([tibia_len/2,0,0])
                cube([1, ds3218_d+wall+thermal_gap,
                      ds3218_h/3+wall+thermal_gap+1], center=true);
        }
        // Laser vensters rood + groen
        translate([tibia_len/2-wall*2, 0, ds3218_h/4])
            laser_mount(armor=true);
        translate([tibia_len/2-wall*2, laser_spacing, ds3218_h/4])
            laser_mount(armor=true);
        // Ventilatieslots
        for(i=[0:3])
            translate([-tibia_len/4+i*14, 0,
                       ds3218_h/4+wall+thermal_gap/2+armor_wall/2])
                cube([vent_w, ds3218_d+wall+thermal_gap,
                      armor_wall+1], center=true);
    }
    // DoMoS₂ dry lubeail knoppen
    for(side=[-1,1])
        translate([side*tibia_len/4,
                   -(ds3218_d/2+wall+thermal_gap+armor_wall-0.1),
                   ds3218_h/4+wall])
            rotate([90,0,0]) dovetail_male(h=8);
}

// ============================================================
// TESTPRINT MODULE — gripper + QR connector isolatie
// ============================================================

module arm_testprint() {
    // Print dit eerst:
    // 1. QR connector body (mannelijk)
    translate([0, 0, 0])
        color("Orange") qr_connector_body();
    // 2. QR socket
    translate([40, 0, 0])
        color("Yellow") qr_connector_socket();
    // 3. Gripper kaak (één stuks, controleer beweging)
    translate([80, 0, 0])
        color("Gray") gripper_jaw(side=1);
    // 4. Laser mount test (6mm module past?)
    translate([140, 0, 0])
        difference() {
            cylinder(d=laser_d+wall*4, h=wall*2+laser_d);
            translate([0,0,wall])
                laser_mount();
        }
}

// ============================================================
// VOLLEDIGE ARM/BEEN ASSEMBLY
// ============================================================

module arm_leg_assembly(mode="arm") {
    // Hip
    color("SteelBlue", 0.9) hip_arm();

    // Femur
    translate([hip_offset+femur_len/2+brg_od/2+wall,
               0, ds3240_shaft/2]) {
        color("SteelBlue", 0.9) femur_arm();
        color("DimGray", 0.7) femur_arm_armor();
    }

    // Tibia arm
    translate([hip_offset+femur_len+tibia_len/2+brg_od+wall*2,
               0, ds3240_shaft/2]) {
        color("SteelBlue", 0.85) tibia_arm();
        color("DimGray", 0.65) tibia_arm_armor();
    }

    // End-effector afhankelijk van mode
    translate([hip_offset+femur_len+tibia_len+brg_od*2+wall*4,
               0, ds3240_shaft/2]) {
        if(mode == "arm") {
            gripper_assembly();
        } else {
            color("SteelBlue") foot_standard();
        }
    }

    // Lagers (visueel)
    color("Silver") {
        translate([0,0,ds3240_h/2+wall/2])
            cylinder(d=brg_od, h=brg_h);
        translate([0,0,-ds3240_h/2-wall-brg_h])
            cylinder(d=brg_od, h=brg_h);
        translate([hip_offset+brg_od/2+wall,
                   -brg_h/2, ds3240_shaft/2])
            rotate([90,0,0])
                cylinder(d=brg_od, h=brg_h);
    }
}

// ============================================================
// RENDER
// ============================================================

if(MODE == "assembly") {
    arm_leg_assembly(mode="arm");
} else if(MODE == "leg") {
    arm_leg_assembly(mode="leg");
} else if(MODE == "test") {
    arm_testprint();
} else if(MODE == "arm") {
    color("DarkSlateGray") gripper_assembly();
}

// ============================================================
// PRINT INSTRUCTIES
// ── SKELET ──────────────────────────────────────────────────
//   Materiaal : Prusament PC Space Grade Black
//   Layer     : 0.2mm · 400°C nozzle (hardened steel) · Infill: 40-60% gyroid  // PC Space Grade: verify bed adhesion (glue stick + 100°C)
//   Supports  : organic op lagerhuizen + QR socket
//
// ── SCHILD ──────────────────────────────────────────────────
//   Materiaal : Prusament PC Space Grade Black
//   Layer     : 0.15mm · 400°C nozzle · Infill: 20-30% gyroid     // PC Space Grade: enclosure mandatory
//
// ── GRIPPER ─────────────────────────────────────────────────
//   Materiaal : PEBA Shore 85 (vac-safe · ASTM E595) (flex) OF PETG-CF (rigid)
//   Layer     : 0.15mm · 400°C nozzle · Infill: 30% gyroid     // PC Space Grade: enclosure mandatory
//   Kaken     : PEBA voor betere grip · geen supports nodig
//
// ── QR CONNECTOR ────────────────────────────────────────────
//   Materiaal : PETG-CF (mannelijk) · ASA (vrouwelijk socket)
//   Test eerst: MODE = "test" · check fit voor volledige print
//   Rating    : ≥15A/pin · ≥20N trekkracht na print testen
//
// ── LASER MODULES ───────────────────────────────────────────
//   Rood  650nm 5mW 6mm → tibia + gripper rechts · GP17/GP19
//   Groen 520nm 5mW 6mm → tibia + gripper links  · GP18/GP20
//   Schuif in na print · klemt op snap · geen Master Bond EP21TDCHT (vac-rated adhesive)
//
// ── LAGERS ──────────────────────────────────────────────────
//   F688-2RS 8×16×5mm · 7 per arm/been · 14 totaal (2 armen)
//
// ── TESTPROCEDURE ───────────────────────────────────────────
//   1. Print MODE="test" · check QR fit + gripper beweging
//   2. Test 20N trekkracht op QR connector
//   3. Controleer laser 6mm mount (schuiffit)
//   4. Bij goedgekeurde fit → MODE="assembly" volledige print
//   5. Wissel end-effector: arm→voet in <10 sec zonder tools
// ============================================================
