# CMB8LF v1 — main.py
# Chrystal Moon Base · CMB8LF series
# MicroPython · Raspberry Pi Pico W · CC0

import time
from machine import I2C, Pin, ADC

led = Pin(25, Pin.OUT)

def blink(n=1, ms=120):
    for _ in range(n):
        led.on(); time.sleep_ms(ms)
        led.off(); time.sleep_ms(ms)

blink(3)
print("\n[BOOT] CMB8LF v1 — Chrystal Moon Base 8 Legged Freaks")
print("[BOOT] MicroPython · Pico W · CC0")

from config  import (I2C0_SDA, I2C0_SCL, I2C1_SDA, I2C1_SCL, I2C_FREQ,
                     PCA_A, PCA_B, PCA_FREQ, LASER_PIN, LEGS)
from pca9685 import PCA9685
from leg     import Leg
from gait    import GaitController
from web     import WebServer
from safety  import Failsafe, VoltageWatcher, MovementManager, run_self_test
from servo_limiter import DualRailServoLimiter
from thermal import ThermalManager, DS18B20, TEMP_SENSOR_PIN

# ── I2C ───────────────────────────────────────────────────────────────────────
print("[INIT] I2C...")
i2c0 = I2C(0, sda=Pin(I2C0_SDA), scl=Pin(I2C0_SCL), freq=I2C_FREQ)
i2c1 = I2C(1, sda=Pin(I2C1_SDA), scl=Pin(I2C1_SCL), freq=I2C_FREQ)

# ── PCA9685 ───────────────────────────────────────────────────────────────────
print("[INIT] PCA9685...")
drv_a = drv_b = None
for addr, name in [(PCA_A, 'A'), (PCA_B, 'B')]:
    try:
        drv = PCA9685(i2c0, addr)
        drv.set_freq(PCA_FREQ)
        if drv.ping():
            if name == 'A': drv_a = drv
            else:           drv_b = drv
            print(f"[INIT] Board {name} OK")
    except Exception as e:
        print(f"[ERR] Board {name}: {e}")

active_drivers = [d for d in [drv_a, drv_b] if d is not None]

# ── FAILSAFE (eerste — altijd) ────────────────────────────────────────────────
failsafe = Failsafe(active_drivers)
print("[INIT] Failsafe gereed")

# ── SPANNING WACHTER ──────────────────────────────────────────────────────────
try:
    adc = ADC(Pin(26))
    volt_watcher = VoltageWatcher(adc_pin=adc, failsafe=failsafe)
except Exception:
    volt_watcher = VoltageWatcher(adc_pin=None, failsafe=failsafe)

# ── POTEN ─────────────────────────────────────────────────────────────────────
print("[INIT] Poten...")
legs = {}
for name, cfg in LEGS.items():
    try:
        leg = Leg(name, drv_a, drv_b, cfg, side=cfg[5], leg_type=cfg[6])
        legs[name] = leg
    except Exception as e:
        print(f"[ERR] Poot {name}: {e}")

# ── GAIT ──────────────────────────────────────────────────────────────────────
gait = GaitController(legs)
gait.movement_manager = MovementManager()

# ── SERVO LIMITER ─────────────────────────────────────────────────────────────
limiter = DualRailServoLimiter(drv_a, drv_b)
limiter.start_timer()

# ── THERMISCH BEHEER ──────────────────────────────────────────────────────────
print("[INIT] Thermisch beheer...")
temp_sensor = DS18B20(TEMP_SENSOR_PIN)
thermal = ThermalManager(
    i2c       = i2c0,
    temp_sensor = temp_sensor,
    gait      = gait,
    failsafe  = failsafe,
    legs      = legs
)
thermal.start()

# ── LASER ─────────────────────────────────────────────────────────────────────
laser = Pin(LASER_PIN, Pin.OUT)
laser.off()

# ── SELF TEST ─────────────────────────────────────────────────────────────────
print("[SELF-TEST] Start...")
test_ok = run_self_test(active_drivers, legs)
if not test_ok:
    failsafe.trigger("self-test gefaald")
    blink(20, 80)
    raise SystemExit("Self-test gefaald")

# ── STAND + WIFI ──────────────────────────────────────────────────────────────
gait.stand()
blink(2)

print("[INIT] WiFi...")
web = WebServer(gait, laser_pin=laser, thermal=thermal)
ip  = web.start_wifi()
web.start_server()
blink(4)
led.on()

print(f"\n[READY] CMB8LF v1 operationeel")
print(f"[READY] http://{ip}/")
volt_watcher.log()
thermal.log()

# ── MAIN LOOP ─────────────────────────────────────────────────────────────────
VOLT_TICK = 50   # ~1 seconde
tick = heartbeat = 0

try:
    while True:
        if failsafe.active:
            led.off(); time.sleep_ms(100)
            led.on();  time.sleep_ms(100)
            continue

        web.tick()
        limiter.tick()
        thermal.tick()

        tick += 1
        if tick >= VOLT_TICK:
            tick = 0
            volt_watcher.check()

        heartbeat += 1
        if heartbeat >= 150:
            led.off(); time.sleep_ms(60); led.on()
            heartbeat = 0

        time.sleep_ms(20)

except KeyboardInterrupt:
    print("\n[STOP] Keyboard interrupt")
    gait.stand()
    time.sleep_ms(300)
    gait.relax_all()
    laser.off()
    led.off()
    limiter.stop_timer()

except Exception as e:
    failsafe.trigger(f"crash: {e}")
    import sys; sys.print_exception(e)
    laser.off(); led.off()
    limiter.stop_timer()
    blink(20, 50)
