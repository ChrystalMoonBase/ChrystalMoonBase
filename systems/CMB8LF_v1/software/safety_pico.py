# ============================================================
# CMB8LF v1 — safety_pico.py
# Pico W #2 — Veiligheid · Thermisch · Web Interface
# MicroPython · Onafhankelijk van Pico W #1 en Pi5
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import time
import asyncio
import network
import socket
from machine import Pin, I2C, ADC

from config_v6 import (WIFI_SSID, WIFI_PASSWORD, WEB_PORT,
                        TEMP_CUTOFF_C, TEMP_WARN_C,
                        BODY_VOLT_MIN, SEGMENT_VOLT_MIN)

# ── HARDWARE ─────────────────────────────────────────────────
led       = Pin(25, Pin.OUT)
estop_out = Pin(14, Pin.OUT, value=1)  # HIGH = normaal · LOW = stop
hall_pins = [Pin(i, Pin.IN, Pin.PULL_UP) for i in range(9)]  # 9 koppelingen
i2c       = I2C(1, sda=Pin(6), scl=Pin(7), freq=100_000)

state = {
    "estop":      False,
    "temp_warn":  False,
    "volt_warn":  False,
    "couplings":  [False] * 9,  # True = vergrendeld
    "mode":       "idle",
    "uptime_s":   0,
}

# ── E-STOP ───────────────────────────────────────────────────

estop_btn = Pin(15, Pin.IN, Pin.PULL_UP)

def estop_handler(pin):
    state["estop"] = True
    estop_out.value(0)   # Hardware cut
    print("[SAFETY] ⚠ E-STOP GEACTIVEERD")

estop_btn.irq(trigger=Pin.IRQ_FALLING, handler=estop_handler)

def reset_estop():
    """Handmatig resetten na oplossen probleem."""
    state["estop"] = False
    estop_out.value(1)
    print("[SAFETY] E-stop gereset")

# ── KOPPELINGSBEWAKING ───────────────────────────────────────

def check_couplings():
    """Lees Hall sensor status van alle 9 koppelingen."""
    for i, pin in enumerate(hall_pins):
        # LOW = magneet actief = vergrendeld
        state["couplings"][i] = (pin.value() == 0)

# ── THERMISCH ────────────────────────────────────────────────

class TMP117:
    def __init__(self, i2c, addr=0x48):
        self.i2c = i2c; self.addr = addr
    def read(self) -> float:
        try:
            d = self.i2c.readfrom_mem(self.addr, 0x00, 2)
            r = (d[0] << 8) | d[1]
            if r > 32767: r -= 65536
            return r * 0.0078125
        except:
            return -999.0

body_temp = TMP117(i2c, 0x48)

def check_temperature():
    t = body_temp.read()
    if t == -999.0:
        return
    if t >= TEMP_CUTOFF_C:
        state["estop"] = True
        estop_out.value(0)
        state["temp_warn"] = True
        print(f"[SAFETY] THERMISCHE STOP: {t:.1f}°C")
    elif t >= TEMP_WARN_C:
        state["temp_warn"] = True
        print(f"[SAFETY] Temp waarschuwing: {t:.1f}°C")
    else:
        state["temp_warn"] = False

# ── WEB DASHBOARD ────────────────────────────────────────────

HTML = """<!DOCTYPE html>
<html>
<head>
<title>CMB8LF v1</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
  body{background:#080a0d;color:#dce8f5;font-family:monospace;padding:20px;margin:0}
  h1{color:#ff6b2b;font-size:18px}
  .card{background:#111820;border:1px solid #1a2535;border-radius:6px;padding:14px;margin:10px 0}
  .ok{color:#2bff8f} .warn{color:#ffc72b} .err{color:#ff3b3b}
  button{background:#ff6b2b;color:#fff;border:none;padding:10px 20px;border-radius:4px;
    font-family:monospace;cursor:pointer;margin:4px;font-size:14px}
  button.stop{background:#ff3b3b;font-size:16px;width:100%;padding:14px}
  .grid{display:grid;grid-template-columns:1fr 1fr;gap:10px}
  label{color:#6b8099;font-size:11px}
</style>
</head>
<body>
<h1>🌙 CMB8LF v1 · Dashboard</h1>
<button class="stop" onclick="cmd('ESTOP')">⛔ NOODSTOP</button>
<div class="grid">
  <div class="card">
    <label>MODUS</label><br>
    <span id="mode" class="ok">IDLE</span>
  </div>
  <div class="card">
    <label>STATUS</label><br>
    <span id="status" class="ok">OK</span>
  </div>
</div>
<div class="card">
  <label>BEWEGING</label><br>
  <button onclick="cmd('WALK:dir=1')">▶ Vooruit</button>
  <button onclick="cmd('WALK:dir=-1')">◀ Achteruit</button>
  <button onclick="cmd('STOP')">⏸ Stop</button>
</div>
<div class="card">
  <label>WERKSTAND</label><br>
  <button onclick="cmd('WORK')">🔒 Werkstand</button>
  <button onclick="cmd('SINTER:n=1,palm=1')">🔴 Sinter L1</button>
  <button onclick="cmd('SINTER:n=1,palm=2')">🔴 Sinter L2</button>
</div>
<div class="card">
  <label>KOPPELINGEN</label><br>
  <div id="couplings">Laden...</div>
</div>
<script>
function cmd(c){fetch('/cmd?c='+encodeURIComponent(c))
  .then(r=>r.text()).then(t=>document.getElementById('status').innerText=t)}
setInterval(()=>fetch('/status').then(r=>r.json()).then(d=>{
  document.getElementById('mode').innerText=d.mode.toUpperCase();
  let c='';for(let i=0;i<9;i++)c+=(d.couplings[i]?'🔒':'⭕')+(i==8?'':'&nbsp;');
  document.getElementById('couplings').innerHTML=c;
}),2000);
</script>
</body>
</html>"""

async def web_server():
    wlan = network.WLAN(network.AP_IF)
    wlan.active(True)
    wlan.config(essid=WIFI_SSID, password=WIFI_PASSWORD)
    time.sleep(2)
    ip = wlan.ifconfig()[0]
    print(f"[WEB] WiFi AP: {WIFI_SSID} · http://{ip}")

    s = socket.socket()
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind(("", WEB_PORT))
    s.listen(3)
    s.setblocking(False)

    while True:
        try:
            conn, _ = s.accept()
            req = conn.recv(512).decode("utf-8", "ignore")
            if "/cmd?" in req:
                cmd_str = req.split("c=")[1].split(" ")[0]
                from urllib import unquote
                cmd_str = unquote(cmd_str)
                print(f"[WEB] Commando: {cmd_str}")
                if "ESTOP" in cmd_str:
                    state["estop"] = True
                    estop_out.value(0)
                resp = "OK"
                conn.send(b"HTTP/1.1 200 OK\r\nContent-Type:text/plain\r\n\r\n")
                conn.send(resp.encode())
            elif "/status" in req:
                import json
                conn.send(b"HTTP/1.1 200 OK\r\nContent-Type:application/json\r\n\r\n")
                conn.send(json.dumps(state).encode())
            else:
                conn.send(b"HTTP/1.1 200 OK\r\nContent-Type:text/html\r\n\r\n")
                conn.send(HTML.encode())
            conn.close()
        except OSError:
            pass
        await asyncio.sleep_ms(20)

# ── HOOFDLUS ─────────────────────────────────────────────────

async def monitor_loop():
    t = 0
    while True:
        t += 1
        check_couplings()
        if t % 50 == 0:   # elke seconde
            check_temperature()
            state["uptime_s"] += 1
        await asyncio.sleep_ms(20)

async def main():
    print("[SAFETY] Pico W #2 boot — veiligheid + web")
    await asyncio.gather(web_server(), monitor_loop())

asyncio.run(main())
