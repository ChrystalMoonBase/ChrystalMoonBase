# ============================================================
# CMB8LF v1 — pi5_main.py
# Pi5 — Strategisch AI · Navigatie · CAN Brug
# Draait op Raspberry Pi 5 (Python 3.11+)
# Vereisten: pip install python-can asyncio
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import asyncio
import serial
import json
import time
from can_bus     import CMBCANBus
from moteus_ctrl import LegController, HeadController

# ── HARDWARE INIT ────────────────────────────────────────────
print("[PI5] CMB8LF v1 — Pi5 Strategisch AI")
print("[PI5] Initialiseren...")

# CAN bus via Canable USB adapter
can_bus = CMBCANBus()
if not can_bus.connect():
    print("[PI5] CAN niet beschikbaar — check adapter")

# UART naar Pico W #1 (gait coördinatie)
pico1_uart = serial.Serial("/dev/ttyAMA0", 115200, timeout=0.1)
# UART naar Pico W #2 (safety)
pico2_uart = serial.Serial("/dev/ttyAMA2", 115200, timeout=0.1)

# Leg controllers
legs = {i: LegController(i, can_bus) for i in range(1, 9)}
head = HeadController(can_bus)

# ── STATUS ───────────────────────────────────────────────────
robot_state = {
    "mode":      "idle",      # idle/walk/work/sinter/emergency
    "legs":      {},
    "head":      {},
    "laser":     {"l1": False, "l2": 0.0},
    "battery":   {},
    "timestamp": 0.0,
}

# ── PICO W COMMUNICATIE ──────────────────────────────────────

def send_to_pico1(cmd: str):
    """Stuur commando naar Pico W #1 (gait master)."""
    pico1_uart.write(f"{cmd}\n".encode())

def send_to_pico2(cmd: str):
    """Stuur commando naar Pico W #2 (safety)."""
    pico2_uart.write(f"{cmd}\n".encode())

def read_pico(uart, timeout=0.05) -> str:
    """Lees respons van Pico W."""
    deadline = time.time() + timeout
    buf = ""
    while time.time() < deadline:
        if uart.in_waiting:
            buf += uart.read(uart.in_waiting).decode("utf-8", "ignore")
            if "\n" in buf:
                return buf.split("\n")[0].strip()
    return ""

# ── MODI ─────────────────────────────────────────────────────

async def mode_walk(direction: float = 1.0):
    """Activeer wave gait lopen."""
    if robot_state["mode"] == "work":
        await mode_idle()
    robot_state["mode"] = "walk"
    send_to_pico1(f"WALK:dir={direction:.1f}")
    print(f"[PI5] Lopen · richting={direction:.1f}")

async def mode_work():
    """Activeer werkstand — robot vergrendeld."""
    send_to_pico1("WORK")
    resp = read_pico(pico1_uart)
    if "OK" in resp:
        robot_state["mode"] = "work"
        print("[PI5] Werkstand ACTIEF")
        return True
    return False

async def mode_idle():
    """Stop en ga naar rust."""
    send_to_pico1("STOP")
    robot_state["mode"] = "idle"
    print("[PI5] Rust")

async def mode_sinter(n_layers: int = 1, palm: int = 1):
    """Activeer sinter sequentie."""
    if robot_state["mode"] != "work":
        print("[PI5] Eerst werkstand activeren")
        return False
    robot_state["mode"] = "sinter"
    send_to_pico1(f"SINTER:n={n_layers},palm={palm}")
    print(f"[PI5] Sinteren · {n_layers} laag/lagen · palm {palm}")
    return True

async def emergency_stop():
    """Noodstop — alles uit."""
    robot_state["mode"] = "emergency"
    send_to_pico1("ESTOP:all")
    send_to_pico2("ESTOP:all")
    can_bus.estop_all()
    print("[PI5] ⚠ NOODSTOP")

# ── STATUS VERZAMELEN ────────────────────────────────────────

async def update_status():
    """Verzamel status van alle subsystemen."""
    robot_state["timestamp"] = time.time()
    # Leg status via CAN
    for leg_id, leg in legs.items():
        robot_state["legs"][leg_id] = leg.status()
    # Head status
    robot_state["head"] = {
        "pan":  head.pan.status(),
        "tilt": head.tilt.status(),
    }

# ── COMMANDO ONTVANGEN (van laptop of autonoom) ──────────────

def parse_laptop_command(raw: str) -> dict:
    """Parseer JSON commando van laptop dashboard."""
    try:
        return json.loads(raw)
    except:
        return {}

async def handle_command(cmd: dict):
    """Verwerk binnenkomend commando."""
    action = cmd.get("action", "").upper()

    if action == "WALK":
        await mode_walk(float(cmd.get("dir", 1.0)))
    elif action == "STOP":
        await mode_idle()
    elif action == "WORK":
        await mode_work()
    elif action == "SINTER":
        await mode_sinter(
            int(cmd.get("layers", 1)),
            int(cmd.get("palm", 1)))
    elif action == "ESTOP":
        await emergency_stop()
    elif action == "LOOK":
        head.look_at(
            float(cmd.get("pan", 0)),
            float(cmd.get("tilt", 0)))
    elif action == "STATUS":
        await update_status()
        print(json.dumps(robot_state, indent=2))

# ── HOOFDLUS ─────────────────────────────────────────────────

async def main():
    print("[PI5] Opstarten...")
    # Wacht op CAN bus
    await asyncio.sleep(1)
    online = can_bus.scan_nodes(timeout=3.0)
    print(f"[PI5] {len(online)} CAN nodes online: {online}")

    # Hoofd naar centrum
    head.center()
    await asyncio.sleep(0.5)

    print("[PI5] ✓ Gereed")

    # Hoofdlus
    while True:
        await update_status()
        await asyncio.sleep(0.05)  # 20 Hz status update

try:
    asyncio.run(main())
except KeyboardInterrupt:
    print("\n[PI5] Gestopt")
    asyncio.run(emergency_stop())
