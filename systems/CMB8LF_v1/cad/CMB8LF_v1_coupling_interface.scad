// ============================================================
// CMB8LF v1 — coupling_interface.scad
// Bistabiele Magneetkoppeling — identiek op alle 9 punten
// NdFeB N52 permanente magneet + release spoel
// Si₃N₄ keramisch kogellager · MoS₂ coating
// CC0 · Chrystal Moon Base · 2026
// ============================================================

include <CMB8LF_v1_vacuum_config.scad>

// Componenten:
// RENDER_PART = "body_side"   — body kant koppeling
//               "leg_side"    — been kant koppeling
//               "guide_cone"  — geleidingsneus
//               "pogo_holder" — pogo pin houder
//               "full_assembly" — complete weergave

RENDER_PART = "full_assembly";

// ── BODY KANT (vastgemonteerd op body) ───────────────────────
module coupling_body_side() {
    difference() {
        union() {
            // Buitenring
            cylinder(d=COUPLING_DIA, h=COUPLING_H);
            // Flens voor bevestiging aan body
            translate([0, 0, COUPLING_H - 4])
            cylinder(d=COUPLING_DIA + 10, h=4);
        }
        // Magneetring uitsparing
        translate([0, 0, 8])
        difference() {
            cylinder(d=COUPLING_DIA - 2, h=10);
            cylinder(d=COUPLING_DIA - 14, h=11);
        }
        // Spoel uitsparing (release spoel)
        translate([0, 0, 3])
        difference() {
            cylinder(d=COUPLING_DIA - 2, h=6);
            cylinder(d=COUPLING_DIA - 14, h=7);
        }
        // Pogo pin gaten (5 stuks, ringverdeling)
        for (i = [0:POGO_N-1])
        rotate([0, 0, i * 360/POGO_N])
        translate([POGO_RING_DIA/2, 0, 0])
        cylinder(d=2.5, h=COUPLING_H + 1);
        // Keyway (oriëntatie slot)
        translate([COUPLING_DIA/2 - 4, -3, -1])
        cube([5, 6, COUPLING_H + 2]);
        // Lager uitsparing
        translate([0, 0, COUPLING_H - 8])
        difference() {
            cylinder(d=32, h=9);
            cylinder(d=22, h=9);
        }
    }
}

// ── BEEN KANT (vastgemonteerd op been) ───────────────────────
module coupling_leg_side() {
    difference() {
        union() {
            // Hoofdlichaam
            cylinder(d=COUPLING_DIA - 2, h=COUPLING_H - 2);
            // Flens voor bevestiging aan segment
            cylinder(d=COUPLING_DIA + 6, h=4);
        }
        // Geleidingsneus opening
        translate([0, 0, COUPLING_H - 8])
        cylinder(d=30, h=10);
        // Pogo pin kontakten (veergeladen)
        for (i = [0:POGO_N-1])
        rotate([0, 0, i * 360/POGO_N])
        translate([POGO_RING_DIA/2, 0, COUPLING_H - 6])
        cylinder(d=3.5, h=8);
        // Keyway nok
        translate([COUPLING_DIA/2 - 5, -2.5, COUPLING_H - 10])
        cube([3, 5, 12]);
        // Magneet uitsparing
        translate([0, 0, 5])
        difference() {
            cylinder(d=COUPLING_DIA - 3, h=8);
            cylinder(d=COUPLING_DIA - 15, h=9);
        }
    }
}

// ── GELEIDINGSNEUS ───────────────────────────────────────────
module guide_cone() {
    // Conische neus voor automatische uitlijning
    // 30° hoek — passeert zichzelf bij aanbieden
    difference() {
        union() {
            cylinder(d1=28, d2=8, h=20);  // kegel
            translate([0, 0, 20])
            cylinder(d=8, h=5);           // stift
        }
        cylinder(d=6, h=26);  // kabelgoot door midden
    }
}

// ── POGO PIN HOUDER ──────────────────────────────────────────
module pogo_holder() {
    // Houder voor 5 pogo pinnen in ringverdeling
    difference() {
        cylinder(d=POGO_RING_DIA + 8, h=12);
        cylinder(d=POGO_RING_DIA - 8, h=13);
        for (i = [0:POGO_N-1])
        rotate([0, 0, i * 360/POGO_N])
        translate([POGO_RING_DIA/2, 0, -1]) {
            cylinder(d=2.2, h=14);   // pogo pin doorgang
            cylinder(d=4, h=5);      // verzonken kop
        }
        // Keyway positie markering
        translate([POGO_RING_DIA/2 + 2, -1.5, -1])
        cube([4, 3, 14]);
    }
    // Label pins (notch per pin)
    for (i = [0:POGO_N-1])
    rotate([0, 0, i * 360/POGO_N])
    translate([POGO_RING_DIA/2 + 5, 0, 10])
    sphere(d=1.5);
}

// ── VOLLEDIGE ASSEMBLY (weergave) ────────────────────────────
module full_assembly() {
    // Body kant (grijs)
    color("DimGray") coupling_body_side();
    // Been kant (donkerder)
    color("SlateGray", 0.8)
    translate([0, 0, COUPLING_H + 2])
    rotate([180, 0, 0])
    coupling_leg_side();
    // Geleidingsneus
    color("LightGray")
    translate([0, 0, COUPLING_H + 2])
    guide_cone();
}

// ── RENDER ───────────────────────────────────────────────────
if (RENDER_PART == "body_side")      coupling_body_side();
else if (RENDER_PART == "leg_side")  coupling_leg_side();
else if (RENDER_PART == "guide_cone") guide_cone();
else if (RENDER_PART == "pogo_holder") pogo_holder();
else full_assembly();
