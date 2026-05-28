# ============================================================
# CMB8LF v1 — laser_palm_v6.py
# Laser Palm Driver — Palm RP2350
# 808nm sinter + 976nm anneal
# Peary Highland Anorthosite Protocol
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import time
from machine import Pin, PWM, I2C

PALM_ID      = 1      # 1 = linker grijper · 2 = rechter
L1_PIN       = 16     # GPIO voor L1 808nm enable
L2_PIN       = 17     # GPIO voor L2 976nm PWM
EN_PIN       = 18     # Hardware interlock (HIGH = enabled)
INTERLOCK_IN = 19     # Van grijper encoder (HIGH = gesloten)
PWM_FREQ     = 1000   # Hz

l1_pin       = Pin(L1_PIN, Pin.OUT, value=0)
l2_pwm       = PWM(Pin(L2_PIN)); l2_pwm.freq(PWM_FREQ)
en_pin       = Pin(EN_PIN, Pin.OUT, value=0)
interlock_in = Pin(INTERLOCK_IN, Pin.IN, Pin.PULL_DOWN)
i2c          = I2C(0, sda=Pin(4), scl=Pin(5), freq=400_000)

# MLX90614 palmtemperatuur
def read_palm_temp() -> float:
    try:
        d = i2c.readfrom_mem(0x5A, 0x07, 3)
        r = (d[1] << 8) | d[0]
        return (r * 0.02) - 273.15
    except:
        return -999.0

def l2_set(duty: float):
    duty = max(0.0, min(1.0, duty))
    l2_pwm.duty_u16(int(duty * 65535))

def interlock_ok() -> bool:
    return bool(interlock_in.value())

def emergency_stop():
    l1_pin.value(0)
    l2_set(0.0)
    en_pin.value(0)
    print(f"[PALM-{PALM_ID}] NOODSTOP")

# UART luisteren naar Pi5 commando's
from machine import UART
uart = UART(0, baudrate=115200, tx=Pin(0), rx=Pin(1))

print(f"[PALM-{PALM_ID}] Laser palm RP2350 gereed")
print(f"[PALM-{PALM_ID}] PROTOCOL: Peary Highland Anorthosite")

buf = ""
while True:
    if uart.any():
        buf += uart.read(64).decode("utf-8", "ignore")
        while "\n" in buf:
            line, buf = buf.split("\n", 1)
            line = line.strip()
            if line.startswith(f"LASER:palm={PALM_ID}"):
                parts = dict(p.split("=") for p in line.split(",")[1:] if "=" in p)
                laser_num = parts.get("laser", "0")
                if laser_num == "1":
                    state = parts.get("state", "OFF")
                    if state == "ON":
                        if interlock_ok() and read_palm_temp() < 65.0:
                            en_pin.value(1)
                            l1_pin.value(1)
                            uart.write(f"ACK:palm={PALM_ID},l1=ON\n")
                        else:
                            uart.write(f"ERR:palm={PALM_ID},interlock=FAIL\n")
                    else:
                        l1_pin.value(0)
                elif laser_num == "2":
                    duty = float(parts.get("duty", "0"))
                    if interlock_ok() or duty < 0.3:  # voet modus laag OK
                        l2_set(duty)
                        uart.write(f"ACK:palm={PALM_ID},l2={duty:.2f}\n")
            elif line == f"CHECK:interlock={PALM_ID}":
                ok = interlock_ok()
                uart.write(f"LOCK:{1 if ok else 0}\n")
            elif line == "ESTOP:all":
                emergency_stop()

    t = read_palm_temp()
    if t > 65.0 and t != -999.0:
        emergency_stop()
        uart.write(f"ALERT:palm={PALM_ID},overheat={t:.1f}\n")

    time.sleep_ms(20)
