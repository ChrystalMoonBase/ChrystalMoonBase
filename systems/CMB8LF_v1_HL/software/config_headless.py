# ============================================================
# CMB8LF v1 HL — config_headless.py
# Variant config OVERRIDES for the head-less build.
# Import the shared base config, then override the bits that
# change. Do NOT re-declare shared values here.
# CC0 · Chrystal Moon Base · 2026
# ============================================================

# Pull in everything from the shared base config.
from config_v6 import *          # noqa: F401,F403  (shared base)

# ── HEAD-LESS: remove the pan/tilt head nodes ───────────────
# The base NODE_IDS includes "head_pan": 91 and "head_tilt": 92.
# There is no head, so drop them. Leg nodes are unchanged.
NODE_IDS = {k: v for k, v in NODE_IDS.items()
            if k not in ("head_pan", "head_tilt")}

HEADLESS = True

# ── Body-integrated sensor map (replaces head sensor map) ───
# All sensors now report from body positions, not a head.
SENSORS = {
    # Work-sensing (front lobe, looks fwd+down at the palm work point)
    "thermal_work":  {"type": "FLIR_Lepton35", "bus": "SPI",  "pos": "front_lobe"},
    "cam_work":      {"type": "PiCam3_NoIR",   "bus": "CSI0", "pos": "front_lobe"},
    # 360 awareness
    "lidar":         {"type": "RPLIDAR_A1M8",  "bus": "UART", "pos": "body_top_riser"},
    "tof_left":      {"type": "VL53L1X",       "bus": "I2C",  "addr": 0x29, "pos": "body_left"},
    "tof_right":     {"type": "VL53L1X",       "bus": "I2C",  "addr": 0x2A, "pos": "body_right"},
    "imu":           {"type": "BNO055",        "bus": "I2C",  "addr": 0x28, "pos": "body_centre"},
    # Override surround cameras via CSI multiplexer (Arducam 4-ch)
    "cam_front":     {"type": "OV5647", "bus": "CSI_MUX", "ch": 0, "az": 0},
    "cam_right":     {"type": "OV5647", "bus": "CSI_MUX", "ch": 1, "az": 90},
    "cam_rear":      {"type": "OV5647", "bus": "CSI_MUX", "ch": 2, "az": 180},
    "cam_left":      {"type": "OV5647", "bus": "CSI_MUX", "ch": 3, "az": 270},
}

# ── Work-window sensor protection (see HEADLESS_DESIGN.md §3) ─
WORKWIN_DUTYCYCLE_SYNC = True   # interleave thermal/visual read with laser-off windows
WORKWIN_OBLIQUE_DEG    = 25     # off-axis mounting angle
WORKWIN_HAS_SHUTTER    = False  # sacrificial window only; no active shutter on prototype

# ── Override feed ───────────────────────────────────────────
# Human engineer override: assessment, not real-time control (~2.6 s link).
OVERRIDE_FEED_FPS      = 5      # low fps is fine for assessment, saves bandwidth
OVERRIDE_FEED_CAMS     = ["cam_work", "cam_front", "cam_right", "cam_rear", "cam_left"]
