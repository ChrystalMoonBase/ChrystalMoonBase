// ============================================================
// CMB8LF v1 HL — CMB8LF_v1_HL_config.scad
// Head-Less variant config — OVERRIDES ONLY
// Includes the shared base config; adds body-integrated
// sensor positions. Does NOT redefine shared dimensions.
// CC0 · Chrystal Moon Base · 2026
// ============================================================

// Pull in ALL shared dimensions (body, legs, couplings, motors).
// Only NEW or CHANGED values are defined below.
include <../../CMB8LF_v1/cad/CMB8LF_v1_vacuum_config.scad>

// ── HEAD-LESS: no head module ───────────────────────────────
// HEAD_W/HEAD_D/HEAD_H from the base are now UNUSED (no head).
// The front head coupling is blanked (see body_chassis HL).
HEADLESS              = true;

// ── WORK-SENSING WINDOW (front lobe, forward/down) ──────────
// Position is on the front lobe of the spider body.
WORKWIN_X            = BODY_L * 0.40;   // forward, on the front lobe
WORKWIN_Z           = BODY_H * 0.35;    // lower third (looks down at palms)
WORKWIN_W           = 46.0;             // window aperture width  (mm)
WORKWIN_H           = 30.0;             // window aperture height (mm)
WORKWIN_TILT        = 25;               // deg oblique (off-axis from laser)
WORKWIN_RECESS      = 12.0;             // mm set-back recess depth
WORKWIN_GLASS_T     = 2.0;              // mm sacrificial window thickness

// Thermal (FLIR Lepton 3.5) and visual (Pi Cam 3 NoIR) share the
// recess, side by side, behind the sacrificial window.
THERMAL_DX          = 14.0;             // offset within window
VISUAL_DX           = -12.0;

// ── ILLUMINATION RING (around work window) ──────────────────
IRLED_COUNT         = 6;
IRLED_RING_R        = 26.0;             // mm radius around window
SPOT_DIA            = 18.0;             // 10W spotlight aperture

// ── 360 AWARENESS ───────────────────────────────────────────
LIDAR_RISER_X       = 0;                // body top centre
LIDAR_RISER_Y       = 0;
LIDAR_RISER_H       = 18.0;             // short fixed riser
LIDAR_DIA           = 70.0;             // RPLIDAR A1M8 body

TOF_Z               = BODY_H * 0.45;    // side ToF height
TOF_DIA             = 8.0;

// ── OVERRIDE SURROUND CAMERAS ───────────────────────────────
// Wide-angle fixed cameras around the body for engineer override.
// Azimuths (deg) measured from front (0 = forward).
SURROUND_CAM_AZ     = [0, 90, 180, 270];
SURROUND_CAM_Z      = BODY_H * 0.6;
SURROUND_CAM_DIA    = 16.0;

// ── FSO COMMS PORT ──────────────────────────────────────────
FSO_X               = BODY_L * 0.30;
FSO_DIA             = 12.0;
