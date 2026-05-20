// ============================================================
// CMB8LF v1 — AMBIENT LIGHTING SYSTEM
// Zachte rode gloed · ROG Strix breathing effect
// Alle zones op één WS2812B data chain · Pico W #1 GP14
// ============================================================
// ZONES:
//   Zone 1: Ogen (2x WS2812B) — al gepland in head module
//   Zone 2: Been armor vents (8 benen × 3 LEDs = 24)
//   Zone 3: Body onderkant ring (12 LEDs)
//   Zone 4: Nekring hoofd-body (8 LEDs)
//   Zone 5: Heupgewrichten (8 × 1 LED = 8 LEDs)
//   TOTAAL: ~54 WS2812B op één chain
//
// EFFECT: ROG Strix breathing
//   Base:  3% helderheid (nooit volledig uit)
//   Puls:  4-6 seconden periode
//   Piek:  18% helderheid
//   Kleur: RGB(180, 0, 0) — diep rood, niet oranje
//   Nooit: blauw · groen · wit in ambient mode
// ============================================================

$fn = 36;

// ── MATERIAAL ─────────────────────────────────────────────────
// Diffuser panelen: PEBA Shore 85 (translucent natural)
//   → print in naturel/wit PEBA · backlit rood = warm gloed
//   → geen frosted spray nodig · PEBA diffuseert van nature
// LED mounts/kanalen: Prusament PC Space Grade Black

// ── PARAMETERS ────────────────────────────────────────────────
wall         = 5.0;
armor_wall   = 2.5;
thermal_gap  = 1.2;
tol_fit      = 0.2;
tol_snap     = 0.15;

// WS2812B LED afmetingen
led_w        = 5.0;   // 5x5mm package
led_h        = 1.6;   // PCB dikte
led_pitch    = 10.0;  // center-to-center op strip
led_strip_w  = 8.0;   // strip breedte (8mm)
led_strip_h  = 2.0;   // strip dikte incl. LEDs

// Diffuser paneel
diff_t       = 1.5;   // dikte PEBA diffuser
diff_gap     = 2.0;   // luchtgap LED → diffuser (spreiding)

// ── BEEN ARMOR VENT DIFFUSER ──────────────────────────────────
// Past achter de bestaande ventilatieslots in femur/tibia armor
// Vervangt het achterste deel van het armor paneel

module leg_vent_diffuser(vent_count=4, spacing=14, vent_w_slot=1.8) {
    // Translucent PEBA paneel · print in naturel PEBA Shore 85
    // Druk in vanuit binnenzijde armor · klik op lipje
    panel_w = (vent_count - 1) * spacing + vent_w_slot * 4;
    panel_h = 20.0;

    difference() {
        // Diffuser lichaam
        union() {
            cube([panel_w, diff_t, panel_h], center=true);
            // Kliklippen voor in armor
            for(side=[-1,1])
                translate([side*(panel_w/2-3), diff_t/2, 0])
                    cube([4, 1.5, panel_h-4], center=true);
        }
        // Vent alignering (slots matchen armor)
        for(i=[0:vent_count-1])
            translate([i*spacing - (vent_count-1)*spacing/2,
                       0, 0])
                cube([vent_w_slot+0.5, diff_t+1, panel_h-4],
                     center=true);
    }
}

module leg_led_channel(led_count=3) {
    // LED strip kanaal achter diffuser · in armor binnenwand
    // Print in PC Space Grade · diffuser apart in PEBA
    channel_l = (led_count-1) * led_pitch + led_strip_w + 4;

    difference() {
        cube([channel_l, led_strip_w+4, led_strip_h+diff_gap+diff_t+2],
             center=true);
        // LED strip uitsparing
        translate([0, 0, -diff_gap/2])
            cube([channel_l-2, led_strip_w+tol_fit*2,
                  led_strip_h+tol_fit*2], center=true);
        // Diffuser groef
        translate([0, 0, led_strip_h/2+diff_gap])
            cube([channel_l+1, led_strip_w+2, diff_t+tol_fit*2],
                 center=true);
        // Kabeluitgang
        translate([channel_l/2-3, 0, -led_strip_h])
            cube([6, 4, led_strip_h*3], center=true);
    }
}

// ── NEKRING ───────────────────────────────────────────────────
// Tussen hoofd en body · 8 WS2812B · circumferentieel
// Monteert op de nekbuis (42mm diameter)

module neck_led_ring() {
    neck_d     = 42.0;
    ring_od    = neck_d + 24.0;
    ring_id    = neck_d + tol_fit*2;
    ring_h     = 8.0;
    led_count  = 8;

    difference() {
        union() {
            // Ring lichaam
            cylinder(d=ring_od, h=ring_h);
            // Flens voor montage
            translate([0,0,-2])
                cylinder(d=ring_od+4, h=2);
        }
        // Nekbuis doorvoer
        cylinder(d=ring_id, h=ring_h+1);
        // LED pockets (8 rondom, naar buiten gericht)
        for(i=[0:led_count-1])
            rotate([0,0,i*(360/led_count)])
                translate([neck_d/2+8, 0, ring_h/2])
                    cube([led_strip_w+tol_fit*2,
                          led_strip_h+tol_fit*2,
                          led_strip_w+2], center=true);
        // Diffuser groef buitenzijde (PEBA ring)
        cylinder(d=ring_od+0.5, h=diff_t, center=false);
        translate([0,0,diff_t])
            cylinder(d1=ring_od+0.5, d2=ring_od-3,
                     h=ring_h-diff_t);
        // Kabelgoot
        translate([0, neck_d/2+2, ring_h/2])
            cube([4, 8, ring_h], center=true);
        // M2 montage boutjes (4×)
        for(ang=[45,135,225,315])
            rotate([0,0,ang])
                translate([ring_od/2-4, 0, 0])
                    cylinder(d=2.4, h=ring_h+1);
    }
}

// ── NEKRING DIFFUSER ──────────────────────────────────────────
// Translucent PEBA ring · past over neck_led_ring buitenzijde

module neck_diffuser_ring() {
    neck_d  = 42.0;
    ring_od = neck_d + 24.0;

    difference() {
        cylinder(d=ring_od+diff_t*2+0.5, h=6);
        cylinder(d=ring_od-tol_snap*2, h=7);
    }
}

// ── HIP GLOED INSERT ──────────────────────────────────────────
// Kleine LED insert in hip armor · 1 WS2812B per hip
// Past in bestaande ventilatieslot heupgewricht

module hip_led_insert() {
    insert_w = 12.0;
    insert_d = led_strip_h + diff_gap + diff_t + 2;
    insert_h = 12.0;

    difference() {
        cube([insert_w, insert_d, insert_h], center=true);
        // LED uitsparing
        translate([0, -insert_d/2+led_strip_h/2+0.5, 0])
            cube([led_w+tol_fit*2, led_strip_h+tol_fit,
                  led_w+tol_fit*2], center=true);
        // Diffuser slot
        translate([0, insert_d/2-diff_t/2, 0])
            cube([insert_w-1, diff_t+tol_fit, insert_h-1],
                 center=true);
        // Kabelgoot
        translate([0, 0, -insert_h/2])
            cube([4, insert_d+1, 4], center=true);
    }
}

// ── BODY BUIK STRIP KANAAL ────────────────────────────────────
// Ring van 12 LEDs aan onderkant body · schijnt naar beneden
// Monteert in de bodemplaat van het chassis

module body_belly_channel(led_count=12, radius=80) {
    // Circulair kanaal in de body bodemplaat
    // Doorsnede: led_strip_w × (led_strip_h+diff_gap+diff_t)
    rotate_extrude(angle=360)
        translate([radius, 0, 0])
            difference() {
                square([led_strip_w+6, led_strip_h+diff_gap+diff_t+4],
                       center=true);
                // LED strip uitsparing
                translate([0, -(diff_gap+diff_t)/2])
                    square([led_strip_w+tol_fit*2,
                            led_strip_h+tol_fit*2], center=true);
                // Diffuser slot (onderkant · naar vloer gericht)
                translate([0, (led_strip_h+diff_gap)/2])
                    square([led_strip_w+2, diff_t+tol_fit*2],
                           center=true);
            }
}

module body_belly_diffuser(radius=80) {
    // PEBA diffuser ring · monteert aan onderkant body
    rotate_extrude(angle=360)
        translate([radius, 0, 0])
            square([led_strip_w+2, diff_t], center=true);
}

// ══════════════════════════════════════════════════════════════
// RENDER — kies zone om te bekijken
// ══════════════════════════════════════════════════════════════

ZONE = "all"; // "leg" "neck" "hip" "belly" "all"

if(ZONE == "leg" || ZONE == "all") {
    color("SteelBlue", 0.9)
        translate([0, 0, 0]) leg_led_channel(led_count=3);
    color("WhiteSmoke", 0.7)
        translate([0, led_strip_w/2+diff_gap+diff_t, 0])
            leg_vent_diffuser(vent_count=4);
}

if(ZONE == "neck" || ZONE == "all") {
    translate([80, 0, 0]) {
        color("SteelBlue", 0.9) neck_led_ring();
        color("WhiteSmoke", 0.5) neck_diffuser_ring();
    }
}

if(ZONE == "hip" || ZONE == "all") {
    translate([160, 0, 0])
        color("SteelBlue", 0.9) hip_led_insert();
}

if(ZONE == "belly" || ZONE == "all") {
    translate([0, 0, -30]) {
        color("SteelBlue", 0.6) body_belly_channel();
        color("WhiteSmoke", 0.5)
            translate([0, 0, (led_strip_h+diff_gap)/2])
                body_belly_diffuser();
    }
}

// ============================================================
// PRINT INSTRUCTIES
// ── LED KANALEN (SteelBlue) ─────────────────────────────────
//   Materiaal : Prusament PC Space Grade Black
//   Layer     : 0.15mm · 30% gyroid
//   Oriëntatie: kanaal opening naar boven
//
// ── DIFFUSER PANELEN (WhiteSmoke/translucent) ───────────────
//   Materiaal : PEBA Shore 85 NATUREL (niet zwart!)
//   Layer     : 0.15mm · 20% gyroid
//   Effect    : diffuseert WS2812B rood tot zachte gloed
//   Tip       : hoe dikker de wand, hoe zachter de gloed
//
// ── MONTAGE VOLGORDE ────────────────────────────────────────
//   1. WS2812B strip in kanaal drukken
//   2. Kabel doorvoeren naar Pico #1 GP14 chain
//   3. PEBA diffuser indrukken (kliklippen / wrijving)
//   4. Armor paneel sluiten
//   NB: geen lijm · PEBA is serviceable in vacuum
//
// ── FIRMWARE BREATHING EFFECT ───────────────────────────────
//   import board, neopixel, math, time
//
//   pixels = neopixel.NeoPixel(board.GP14, 54)
//
//   BASE  = 0.03   # 3% minimum brightness
//   PEAK  = 0.18   # 18% maximum brightness
//   PERIOD = 5.0   # seconds per breath
//   RED   = (180, 0, 0)  # deep red, not orange
//
//   def breath(t):
//       phase = math.sin(2 * math.pi * t / PERIOD)
//       brightness = BASE + (PEAK - BASE) * (phase + 1) / 2
//       r = int(RED[0] * brightness)
//       pixels.fill((r, 0, 0))
//       pixels.show()
//
//   t = 0
//   while True:
//       breath(t)
//       t += 0.05
//       time.sleep(0.05)
//
// ── ZONES EN LED AANTALLEN ──────────────────────────────────
//   Zone 1: Ogen (2x WS2812B) ............... index 0-1
//   Zone 2: Been armor (8x3=24 WS2812B) ..... index 2-25
//   Zone 3: Body onderkant (12 WS2812B) ..... index 26-37
//   Zone 4: Nekring (8 WS2812B) ............. index 38-45
//   Zone 5: Heupgewrichten (8 WS2812B) ...... index 46-53
//   TOTAAL: 54 WS2812B op één GP14 chain
//
//   Zones kunnen individueel aangestuurd worden:
//   pixels[0:2].fill((180,0,0))   # alleen ogen
//   pixels[38:46].fill((180,0,0)) # alleen nekring
// ============================================================
