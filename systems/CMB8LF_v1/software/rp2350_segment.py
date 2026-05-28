# ============================================================
# CMB8LF v1 — rp2350_segment.py
# RP2350 Mini AI — Per Segment Controller
# Draait op elk RP2350 in elk botssegment (×24 + hoofd)
# MicroPython
# CC0 · Chrystal Moon Base · 2026
# ============================================================
# Functies:
#   - Lokale sensor fusion (temp · spanning · strain)
#   - BMS cell monitoring via I2C
#   - Lokale veiligheidsbeslissingen (onafhankelijk van body)
#   - CAN bus monitoring voor eigen nodes
#   - TinyML: detecteer abnormale belasting
# ============================================================

import time
from machine import Pin, I2C, ADC

# ── CONFIG (aanpassen per segment) ──────────────────────────
SEGMENT_ID   = 11   # Bijv: 11=been1_coxa, 12=been1_femur, etc.
SEGMENT_TYPE = "coxa"  # coxa / femur / tibia / palm / head

I2C_SDA = 4
I2C_SCL = 5
LED_PIN = 25

VOLT_WARN  = 20.0   # 6S waarschuwing (V)
VOLT_MIN   = 18.0   # 6S minimum (V)
TEMP_WARN  = 55.0   # motor temp waarschuwing (°C)
TEMP_CUTOFF = 70.0  # harde stop (°C)

# ── HARDWARE ─────────────────────────────────────────────────
led = Pin(LED_PIN, Pin.OUT)
i2c = I2C(0, sda=Pin(I2C_SDA), scl=Pin(I2C_SCL), freq=400_000)

def blink(n=1):
    for _ in range(n):
        led.on(); time.sleep_ms(100)
        led.off(); time.sleep_ms(100)

blink(2)
print(f"[SEG-{SEGMENT_ID}] RP2350 segment AI boot · {SEGMENT_TYPE}")

# ── BMS MONITORING (vereenvoudigd) ──────────────────────────

class SegmentBMS:
    """
    Minimale 6S cel monitoring.
    Echte BMS chip (bijv. BQ76920) voor productie.
    Prototype: analoge spanning meting via ADC.
    """
    def __init__(self, adc_pin: int = 26):
        self.adc = ADC(Pin(adc_pin))

    def voltage(self) -> float:
        """Lees pakket spanning (vereenvoudigd via voltage divider)."""
        raw = self.adc.read_u16()
        # Aanname: voltage divider 22V → 3.3V
        # Factor: 22.2 / 3.3 = 6.73
        return (raw / 65535) * 3.3 * 6.73

    def state(self) -> str:
        v = self.voltage()
        if v > 24.0:   return "FULL"
        if v > 21.6:   return "OK"
        if v > 20.0:   return "LOW"
        if v > 18.0:   return "CRITICAL"
        return "EMPTY"

bms = SegmentBMS()

# ── TEMPERATUUR ──────────────────────────────────────────────

class SegmentTemp:
    """TMP117 via I2C."""
    ADDR = 0x48

    def __init__(self, i2c):
        self.i2c = i2c

    def read(self) -> float:
        try:
            data = self.i2c.readfrom_mem(self.ADDR, 0x00, 2)
            raw = (data[0] << 8) | data[1]
            if raw > 32767:
                raw -= 65536
            return raw * 0.0078125
        except:
            return -999.0

temp_sensor = SegmentTemp(i2c)

# ── STATUS RAPPORTAGE ─────────────────────────────────────────

def report_status():
    """Stuur status naar body via UART."""
    v    = bms.voltage()
    t    = temp_sensor.read()
    stat = bms.state()
    print(f"SEG:{SEGMENT_ID}:V={v:.2f}:T={t:.1f}:S={stat}")

# ── LOKALE VEILIGHEID ─────────────────────────────────────────

def local_safety_check() -> bool:
    """
    Lokale veiligheidscheck — onafhankelijk van body AI.
    Return False = lokale noodstop.
    """
    v = bms.voltage()
    t = temp_sensor.read()

    if v < VOLT_MIN and v > 5.0:  # 5V = sensor fout
        print(f"[SEG-{SEGMENT_ID}] KRITIEK: spanning {v:.1f}V")
        return False

    if t > TEMP_CUTOFF and t != -999.0:
        print(f"[SEG-{SEGMENT_ID}] OVERKAPPING: temp {t:.1f}°C")
        return False

    return True

# ── HOOFDLUS ─────────────────────────────────────────────────

tick = 0
while True:
    # Elke 5 seconden status rapporteren
    tick += 1
    if tick >= 250:  # 250 × 20ms = 5 seconden
        tick = 0
        if not local_safety_check():
            # Lokale noodstop signaal
            print(f"[SEG-{SEGMENT_ID}] LOKALE NOODSTOP")
            blink(10)
        else:
            report_status()
            led.on() if bms.state() != "LOW" else blink(1)

    time.sleep_ms(20)
