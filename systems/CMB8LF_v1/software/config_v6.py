# ============================================================
# CMB8LF v1 — config_v6.py
# Centrale configuratie voor brushless CAN architectuur
# CC0 · Chrystal Moon Base · 2026
# ============================================================

# ── GPIO PINS (Pico W #1 — CAN Master) ──────────────────────
LED_PIN       = 25
PI5_UART_TX   = 0    # GPIO 0 → Pi5 RX
PI5_UART_RX   = 1    # GPIO 1 → Pi5 TX
ESTOP_IN      = 14   # Van Pico W #2 (safety pico) via GPIO

# ── MOTEUS NODE IDs ───────────────────────────────────────────
# Schema: XY — X=been(1-8)/hoofd(9), Y=segment(1=coxa,2=femur,3=tibia,4=palm)
NODE_IDS = {
    # Been 1 — Grijper Links
    "been1_coxa":  11, "been1_femur": 12, "been1_tibia": 13, "been1_palm": 14,
    # Been 2 — Grijper Rechts
    "been2_coxa":  21, "been2_femur": 22, "been2_tibia": 23, "been2_palm": 24,
    # Benen 3-8 — Standaard
    "been3_coxa":  31, "been3_femur": 32, "been3_tibia": 33,
    "been4_coxa":  41, "been4_femur": 42, "been4_tibia": 43,
    "been5_coxa":  51, "been5_femur": 52, "been5_tibia": 53,
    "been6_coxa":  61, "been6_femur": 62, "been6_tibia": 63,
    "been7_coxa":  71, "been7_femur": 72, "been7_tibia": 73,
    "been8_coxa":  81, "been8_femur": 82, "been8_tibia": 83,
    # Hoofd
    "head_pan":    91, "head_tilt":   92,
}

# ── WAVE GAIT VOLGORDE ────────────────────────────────────────
# Spin-patroon: buiten → binnen, diagonaal afgewisseld
# Maximale stabiliteit op oneven terrein
WAVE_ORDER = [1, 5, 3, 7, 2, 6, 4, 8]
# Been 1+2 = grijpers (vooraan)
# Been 3+4 = voor-midden
# Been 5+6 = achter-midden
# Been 7+8 = achteraan

# ── GAIT PARAMETERS ───────────────────────────────────────────
LIFT_HEIGHT     = 35    # mm — ophefhoogte
STEP_LENGTH     = 40    # mm — staplengte
STEP_TIME_MS    = 380   # ms per stap (wave gait)
GAIT_SPEED      = 1.0   # 0.0-1.0 schaalfactor

# ── WERKSTAND POSITIES (graden van nulpunt) ──────────────────
# Spin-houding: breed uitgespreid, laag zwaartepunt
WORK_POSITIONS = {
    "been1": {"coxa": +35, "femur": -25, "tibia": +60},  # grijper voor-links
    "been2": {"coxa": -35, "femur": -25, "tibia": +60},  # grijper voor-rechts
    "been3": {"coxa": +55, "femur": +15, "tibia": +65},
    "been4": {"coxa": -55, "femur": +15, "tibia": +65},
    "been5": {"coxa": +55, "femur": +15, "tibia": +65},
    "been6": {"coxa": -55, "femur": +15, "tibia": +65},
    "been7": {"coxa": +35, "femur": +15, "tibia": +65},
    "been8": {"coxa": -35, "femur": +15, "tibia": +65},
}

# ── MOTEUS LIMITEN (graden) ───────────────────────────────────
JOINT_LIMITS = {
    "coxa":  (-75, +75),   # heup rotatie
    "femur": (-50, +70),   # knie/lifthoek
    "tibia": (-15, +95),   # enkel
    "pan":   (-95, +95),   # hoofd links-rechts
    "tilt":  (-45, +90),   # hoofd omhoog-omlaag
}

# ── MOTOR KOPPEL LIMIETEN (Nm) ───────────────────────────────
TORQUE_LIMITS = {
    "coxa":  3.0,   # GM5208-150T max cont. 3.5Nm
    "femur": 1.8,   # GM4108H-120T max cont. 2.0Nm
    "tibia": 0.7,   # GM3506-2 max cont. 0.8Nm
    "pan":   1.8,   # GM4108H
    "tilt":  0.7,   # GM3506-2
}

# ── THERMISCHE LIMIETEN ───────────────────────────────────────
TEMP_WARN_C   = 55    # waarschuwing
TEMP_CUTOFF_C = 70    # noodstop
PALM_TEMP_MAX = 65    # laserpalm max

# ── SPANNING LIMIETEN ─────────────────────────────────────────
SEGMENT_VOLT_MIN  = 18.0   # 6S lege cel (3.0V/cel)
SEGMENT_VOLT_WARN = 20.0   # 6S waarschuwing (3.33V/cel)
SEGMENT_VOLT_FULL = 25.2   # 6S vol (4.2V/cel)
BODY_VOLT_MIN     = 12.0   # 4S leeg
BODY_VOLT_FULL    = 16.8   # 4S vol

# ── WIFI ─────────────────────────────────────────────────────
WIFI_SSID     = "CMB8LF-v1"
WIFI_PASSWORD = "moonbase2026"
AP_MODE       = True
WEB_PORT      = 80
