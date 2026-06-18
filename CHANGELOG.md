# Changelog — Chrystal Moon Base

## [Unreleased] — CMB8LF-S1 Revision 6

### CMB8LF_v1 — Complete Architecture Revision

**Breaking changes:**
- Complete redesign from hobby servos to brushless BLDC + moteus r4.11
- Power architecture: central LiPo → 25 distributed 6S nodes
- Control: PCA9685 PWM → CAN bus (1 Mbit/s, Canable USB adapter)
- Material: PC Space Grade → PEEK-CF (higher temp, lower outgassing)
- Gait: tripod → wave gait (maximum stability, 7 legs always grounded)
- Head position: top-mounted → between leg 1 and leg 2 (precision work)

**New features:**
- Bistable electromagnetic coupling ×9 (identical on all connection points)
- Si₃N₄ ceramic bearings throughout (vacuum-proof, no lubrication)
- MoS₂ dry film coating on all sliding surfaces
- Basalt exterior shields with quarter-turn click mount
- Aerogel thermal buffer between shield and structure
- Real laser sintering: 808nm/2W + 976nm/1W (not symbolic)
- Peary highland anorthosite simulant (corrected from mare basalt)
- 4-finger adaptive gripper: box grip / pincer / foot modes
- Distributed AI: Pi5 + Pico W ×2 + RP2350 ×24 + palm RP2350 ×2
- FSO laser communication (external) + CAN bus (internal)
- Wave gait implementation with work-stance lock
- Web dashboard on Pico W #2
- Spider geometry body: narrower at front and rear, widest in middle
- Distributed solar cells on femur segments + body rear
- Laser power receiving (GaAs cells, quadrant tracking) on head

**Software:**
- Complete rewrite: main_v6.py, config_v6.py, wave_gait_v6.py
- New: can_bus.py, moteus_ctrl.py, pi5_main.py
- New: rp2350_segment.py (×24 mini AI), laser_palm_v6.py
- New: safety_pico.py (Pico W #2)

**CAD:**
- New: vacuum_config.scad (central dimensions)
- New: leg_standard.scad (replaces leg_complete.scad)
- New: coupling_interface.scad (bistable magnetic)
- New: palm_laser.scad (laser palm + gripper)
- Rewritten: body_chassis.scad (spider geometry)
- Updated: head_module.scad (pan+tilt, between legs 1+2)

**Documentation:**
- BOM_v6.md (complete revision — all new hardware)
- PRINT_SETTINGS.md (PEEK-CF specific)
- VACUUM_PREP.md (updated protocols)

---

## [0.5] — BOM v5 (previous version)

- Power architecture: strict domain separation, dual 3S packs
- PTC fuses, E-stop, EMI ferrite cores added
- Prusament PC Space Grade as primary material
- CreatBot PEEK-300 as primary printer (Voron 2.4 / Intamsys as DIY alternatives)
- Tripod gait, PCA9685 servo control
- 650nm symbolic laser (visual effect only)
