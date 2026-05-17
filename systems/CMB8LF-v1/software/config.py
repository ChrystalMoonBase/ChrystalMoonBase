# CMB-R1 Scale Model — config.py  (PREMIUM BUILD)
# Chrystal Moon Base · Phase 0 Demonstrator
# MicroPython · Raspberry Pi Pico W
# CC0

# ── SERVO ARCHITECTUUR ────────────────────────────────────────────────────────
#
#  Heup rotatie (hip_rot)  → DS3240  35 kg/cm @ 7.4 V  — rechtstreeks op LiPo
#  Heup pitch (hip_pitch)  → MG996R  10 kg/cm @ 5.0 V  — via step-down
#  Knie (knee)             → MG996R  10 kg/cm @ 5.0 V  — via step-down
#  Enkel (ankle)           → SG90    1.2 kg/cm @ 5.0 V  — via step-down
#
#  POWER WIRING:
#  LiPo 7.4V ──┬── DS3240 VCC (rechtstreeks, max 8.4V)
#              └── Step-down 5V ──┬── MG996R VCC
#                                 ├── SG90 VCC
#                                 └── Pico W VSYS / PCA9685 VCC
#
#  PCA9685 levert alleen PWM-signaal (3.3V logica).
#  Servo-power loopt NIET via PCA9685 V+-rail.
#  PCA9685 V+ = 5V (alleen voor interne logica).

# ── I2C PINS ──────────────────────────────────────────────────────────────────
I2C0_SDA = 4   # PCA9685 boards
I2C0_SCL = 5
I2C1_SDA = 6   # MPU6050 IMU
I2C1_SCL = 7
I2C_FREQ  = 400_000

# ── PCA9685 ADRESSEN ─────────────────────────────────────────────────────────
PCA_A = 0x40   # Board A: poten 1-4 (AR, AL, SR1, SL1)
PCA_B = 0x41   # Board B: poten 5-8 (SR2, SL2, SR3, SL3)
PCA_FREQ = 50  # Hz

# ── MPU6050 ───────────────────────────────────────────────────────────────────
MPU_ADDR = 0x68

# ── GPIO ──────────────────────────────────────────────────────────────────────
LED_PIN    = 25
LASER_PIN  = 15   # linker arm laser (via MOSFET)
LASER_R    = 16   # rechter arm (optioneel)
BUTTON_PIN = 14

# ── WIFI ──────────────────────────────────────────────────────────────────────
WIFI_SSID     = "CMB-R1"
WIFI_PASSWORD = "moonbase1"
AP_MODE       = True
ROUTER_SSID   = ""
ROUTER_PASS   = ""
WEB_PORT      = 80

# ── SERVO PULSBREEDTES (microseconden) ───────────────────────────────────────
#
# DS3240:  500–2500 µs, neutraal 1500 µs (zelfde als standaard)
# MG996R:  500–2500 µs, neutraal 1500 µs
# SG90:    500–2400 µs, neutraal 1500 µs
#
SERVO_MIN_US = 500
SERVO_MAX_US = 2500
SERVO_MID_US = 1500

# SG90 iets smaller bereik voor veiligheid:
SG90_MIN_US  = 500
SG90_MAX_US  = 2400

# ── POOTDEFINITIES ────────────────────────────────────────────────────────────
# Elk kanaal-tuple: (board, ch_rot, ch_pitch, ch_knee, ch_ankle, side, type)
# servo_types per kanaal: rot=DS3240, pitch=MG996R, knee=MG996R, ankle=SG90
LEGS = {
    #       brd  rot  pitch  knee  ankle  side    type
    'AR':  ('A',  0,   1,    2,    3,   'R', 'arm'),
    'AL':  ('A',  4,   5,    6,    7,   'L', 'arm'),
    'SR1': ('A',  8,   9,   10,   11,   'R', 'stance'),
    'SL1': ('A', 12,  13,   14,   15,   'L', 'stance'),
    'SR2': ('B',  0,   1,    2,    3,   'R', 'stance'),
    'SL2': ('B',  4,   5,    6,    7,   'L', 'stance'),
    'SR3': ('B',  8,   9,   10,   11,   'R', 'stance'),
    'SL3': ('B', 12,  13,   14,   15,   'L', 'stance'),
}

# ── SERVO HOEKLIMITEN (graden van neutraal 0°) ────────────────────────────────
# DS3240 heeft meer mechanisch bereik dan MG996R maar we limiteren conservatief.
LIMITS = {
    'hip_rot':   (-65, 65),   # DS3240: ruimer bereik mogelijk, limiet conservatief
    'hip_pitch': (-45, 60),   # MG996R
    'knee':      (-10, 90),   # MG996R
    'ankle':     (-30, 30),   # SG90
}

# ── STANCEPOSE (stilstaan) ────────────────────────────────────────────────────
# Hoeken in graden: [hip_rot, hip_pitch, knee, ankle]
STANCE_POSE = {
    'AR':  [ 32, -22, 52,  0],
    'AL':  [ 32, -22, 52,  0],
    'SR1': [ 38,  10, 58,  5],
    'SL1': [ 38,  10, 58,  5],
    'SR2': [  5,  10, 58,  5],
    'SL2': [  5,  10, 58,  5],
    'SR3': [-32,  10, 58,  5],
    'SL3': [-32,  10, 58,  5],
}

# ── GAIT PARAMETERS ───────────────────────────────────────────────────────────
GAIT_STEP_HEIGHT = 28
GAIT_STEP_LENGTH = 32
GAIT_SPEED       = 0.8
GAIT_CYCLE_MS    = 550   # iets sneller door meer koppel DS3240

TRIPOD_A = ['AR', 'SL1', 'SR2', 'SL3']
TRIPOD_B = ['AL', 'SR1', 'SL2', 'SR3']

# ── KALIBRATIE OFFSETS (graden, instelbaar per robot) ────────────────────────
# Na eerste opstarttest aanpassen in Thonny.
# Formaat: (hip_rot, hip_pitch, knee, ankle)
CALIBRATION = {
    'AR':  (0, 0, 0, 0),
    'AL':  (0, 0, 0, 0),
    'SR1': (0, 0, 0, 0),
    'SL1': (0, 0, 0, 0),
    'SR2': (0, 0, 0, 0),
    'SL2': (0, 0, 0, 0),
    'SR3': (0, 0, 0, 0),
    'SL3': (0, 0, 0, 0),
}

# ── BATTERIJ INFO (voor runtime berekening in web interface) ──────────────────
BATTERY_MAH    = 4000   # mAh per cel-pack
BATTERY_CELLS  = 2      # 2S = 7.4V nominaal
BATTERY_PACKS  = 2      # per robot
# Verwachte runtime: ~90 min slow demo, ~35 min actief lopen
