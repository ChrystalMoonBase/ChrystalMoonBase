# ============================================================
# CMB8LF v1 — main.py v6
# Chrystal Moon Base · 8 Legged Freaks
# Volledig herschreven voor brushless CAN bus architectuur
# Platform: Raspberry Pi Pico W (×2) + Pi5 coördinatie
# CC0 · Berechja Kerkdijk · 2026
# ============================================================
# PICO W #1 — CAN MASTER (dit bestand)
#   - Wave gait coördinatie
#   - moteus commando's via CAN
#   - Sinter sequentie
#   - Ontvangt high-level commando's van Pi5 via UART
#
# PICO W #2 — SAFETY (apart bestand: safety_pico.py)
#   - E-stop bewaking
#   - Thermisch management
#   - Spanning bewaking
#   - Web interface
# ============================================================

import time
import asyncio
from machine import Pin, UART, I2C

# ── LOKALE MODULES ────────────────────────────────────────────
from config_v6   import (CAN_UART_TX, CAN_UART_RX, PI5_UART_TX,
                          PI5_UART_RX, LED_PIN, NODE_IDS, WAVE_ORDER,
                          WORK_POSITIONS, LIFT_HEIGHT, STEP_LENGTH)
from can_bus     import CANBus
from moteus_ctrl import MoteusController
from wave_gait   import WaveGait
from sinter_seq  import SinterSequencer

# ── HARDWARE INIT ─────────────────────────────────────────────
led = Pin(LED_PIN, Pin.OUT)

def blink(n=1, ms=120):
    for _ in range(n):
        led.on();  time.sleep_ms(ms)
        led.off(); time.sleep_ms(ms)

blink(3)
print("\n[BOOT] CMB8LF v1 — v6 Brushless CAN Architecture")
print("[BOOT] Pico W #1 — CAN Master · Wave Gait Controller")

# ── CAN BUS ───────────────────────────────────────────────────
# Canable USB-CAN adapter is verbonden met Pi5
# Pico W communiceert met Pi5 via UART (commando's)
# Alle moteus nodes zijn direct aangesloten op CAN bus via Pi5

print("[INIT] Pi5 UART link...")
pi5_uart = UART(0,
    baudrate=115200,
    tx=Pin(PI5_UART_TX),
    rx=Pin(PI5_UART_RX)
)
print("[INIT] Pi5 UART OK")

# ── MOTEUS CONTROLLERS ────────────────────────────────────────
# moteus r4.11 controllers worden aangestuurd via Pi5 CAN bus
# Pico W geeft commando's aan Pi5 die naar moteus stuurt
# Dit is de simplificatie voor het prototype:
# Pi5 draait moteus Python library direct

print("[INIT] Moteus node tabel laden...")

# Node ID schema: XY
# X = been (1-8), hoofd=9
# Y = positie (1=coxa/pan, 2=femur/tilt, 3=tibia, 4=palm AI)
MOTEUS_NODES = {}
for been in range(1, 9):
    for pos in range(1, 4):
        node_id = been * 10 + pos
        MOTEUS_NODES[node_id] = {
            "been": been,
            "pos":  ["coxa", "femur", "tibia"][pos - 1],
            "online": False,
            "pos_deg": 0.0,
            "torque_nm": 0.0,
            "temp_c": 0.0,
        }
# Hoofd
MOTEUS_NODES[91] = {"been": 9, "pos": "pan",  "online": False}
MOTEUS_NODES[92] = {"been": 9, "pos": "tilt", "online": False}

print(f"[INIT] {len(MOTEUS_NODES)} moteus nodes gedefinieerd")

# ── WAVE GAIT ─────────────────────────────────────────────────
gait = WaveGait(
    pi5_uart   = pi5_uart,
    nodes      = MOTEUS_NODES,
    wave_order = WAVE_ORDER,
    lift_mm    = LIFT_HEIGHT,
    step_mm    = STEP_LENGTH,
)

# ── SINTER SEQUENCER ──────────────────────────────────────────
sinter = SinterSequencer(pi5_uart=pi5_uart)

# ── COMMANDO PARSER ───────────────────────────────────────────
def parse_command(cmd: str) -> dict:
    """
    Parseer commando's van Pi5 (of laptop via Pi5).
    
    Formaat: COMMANDO:param1=val1,param2=val2
    
    Bekende commando's:
      STAND              — stabiele staande positie
      WALK:dir=1         — wave gait vooruit (dir=-1 achteruit)
      STOP               — stop gait
      WORK               — werkstand (alle gewrichten vergrendeld)
      SINTER:n=3         — sinter n lagen
      GRIP:mode=box      — grijper mode (box/pincet/voet)
      HOME               — alle gewrichten naar nulpositie
      STATUS             — stuur status terug
      NODE:id=11,pos=45  — stuur direct commando naar node
    """
    parts = cmd.strip().split(":")
    action = parts[0].upper()
    params = {}
    if len(parts) > 1:
        for p in parts[1].split(","):
            if "=" in p:
                k, v = p.split("=")
                params[k] = v
    return {"action": action, "params": params}

async def handle_command(cmd_dict: dict):
    action = cmd_dict["action"]
    params = cmd_dict["params"]

    if action == "STAND":
        await gait.stand()
        pi5_uart.write("OK:stand\n")

    elif action == "WALK":
        direction = float(params.get("dir", 1.0))
        asyncio.create_task(gait.walk(direction))
        pi5_uart.write("OK:walk\n")

    elif action == "STOP":
        await gait.stop()
        pi5_uart.write("OK:stop\n")

    elif action == "WORK":
        ok = await gait.work_stance()
        pi5_uart.write(f"{'OK' if ok else 'ERR'}:work\n")

    elif action == "SINTER":
        n = int(params.get("n", 1))
        asyncio.create_task(sinter.sinter_layers(n))
        pi5_uart.write(f"OK:sinter:{n}\n")

    elif action == "STATUS":
        online = sum(1 for n in MOTEUS_NODES.values() if n["online"])
        pi5_uart.write(f"STATUS:nodes={online}/{len(MOTEUS_NODES)}\n")

    else:
        pi5_uart.write(f"ERR:unknown:{action}\n")

# ── HEARTBEAT ─────────────────────────────────────────────────
async def heartbeat_task():
    while True:
        led.off()
        await asyncio.sleep_ms(50)
        led.on()
        await asyncio.sleep_ms(2950)  # 3 sec interval

# ── UART LUISTEREN ────────────────────────────────────────────
async def uart_listen_task():
    buf = ""
    while True:
        if pi5_uart.any():
            data = pi5_uart.read(64)
            if data:
                buf += data.decode("utf-8", "ignore")
                while "\n" in buf:
                    line, buf = buf.split("\n", 1)
                    if line.strip():
                        cmd = parse_command(line)
                        await handle_command(cmd)
        await asyncio.sleep_ms(10)

# ── STARTUP ───────────────────────────────────────────────────
async def startup():
    print("[STARTUP] Stand innemen...")
    await gait.stand()
    await asyncio.sleep_ms(500)
    blink(4)
    led.on()
    print("[READY] CMB8LF v1 operationeel")
    print("[READY] Wacht op commando's van Pi5")

# ── MAIN ──────────────────────────────────────────────────────
async def main():
    await startup()
    await asyncio.gather(
        heartbeat_task(),
        uart_listen_task(),
    )

try:
    asyncio.run(main())
except KeyboardInterrupt:
    print("\n[STOP] Handmatige stop")
    gait.emergency_stop_sync()
    led.off()
except Exception as e:
    print(f"[CRASH] {e}")
    import sys; sys.print_exception(e)
    blink(20, 50)
    led.off()
