# CMB-R1 Scale Model — web.py
# WiFi access point + simple web control interface
# MicroPython · CC0

import network
import socket
import json
import time
from config import (WIFI_SSID, WIFI_PASSWORD, AP_MODE,
                    ROUTER_SSID, ROUTER_PASS, WEB_PORT)

HTML = """\
<!DOCTYPE html><html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>CMB-R1 Control</title>
<style>
  body{background:#080c0f;color:#00e5cc;font-family:monospace;text-align:center;margin:0;padding:20px}
  h1{font-size:1.2em;letter-spacing:3px;margin-bottom:4px}
  p.sub{font-size:0.75em;color:rgba(0,229,204,0.5);margin-bottom:24px}
  .btn{display:inline-block;margin:6px;padding:14px 20px;background:rgba(0,229,204,0.12);
       border:1.5px solid #00e5cc;color:#00e5cc;font-family:monospace;font-size:0.9em;
       letter-spacing:2px;cursor:pointer;border-radius:4px;min-width:110px;
       text-decoration:none}
  .btn:active{background:rgba(0,229,204,0.3)}
  .btn.stop{border-color:#ff4444;color:#ff4444;background:rgba(255,68,68,0.12)}
  .row{margin:8px auto}
  .status{margin-top:20px;font-size:0.8em;color:rgba(0,229,204,0.5)}
  .laser{border-color:#ff6b35;color:#ff6b35;background:rgba(255,107,53,0.12)}
</style>
</head>
<body>
<h1>CMB-R1</h1>
<p class="sub">CHRYSTAL MOON BASE · PHASE 0 DEMONSTRATOR</p>

<div class="row">
  <a class="btn" href="/cmd?a=forward">&#9650; FORWARD</a>
</div>
<div class="row">
  <a class="btn" href="/cmd?a=left">&#9668; LEFT</a>
  <a class="btn stop" href="/cmd?a=stop">&#9632; STOP</a>
  <a class="btn" href="/cmd?a=right">RIGHT &#9658;</a>
</div>
<div class="row">
  <a class="btn" href="/cmd?a=backward">&#9660; BACK</a>
</div>

<div class="row" style="margin-top:20px">
  <a class="btn" href="/cmd?a=stand">STAND</a>
  <a class="btn" href="/cmd?a=center">CENTER</a>
  <a class="btn" href="/cmd?a=demo">DEMO</a>
</div>
<div class="row">
  <a class="btn" href="/cmd?a=sinter">SINTER POSE</a>
  <a class="btn" href="/cmd?a=blade">BLADE POSE</a>
  <a class="btn" href="/cmd?a=wave">WAVE GAIT</a>
</div>
<div class="row">
  <a class="btn laser" href="/cmd?a=laser_on">LASER ON</a>
  <a class="btn laser" href="/cmd?a=laser_off">LASER OFF</a>
</div>

<div class="status" id="st">READY</div>
</body></html>
"""

class WebServer:
    def __init__(self, gait, laser_pin=None):
        self.gait      = gait
        self.laser     = laser_pin
        self._wlan     = None
        self._socket   = None
        self._ip       = "0.0.0.0"

    def start_wifi(self):
        if AP_MODE:
            self._wlan = network.WLAN(network.AP_IF)
            self._wlan.config(essid=WIFI_SSID,
                              password=WIFI_PASSWORD,
                              authmode=network.AUTH_WPA_WPA2_PSK)
            self._wlan.active(True)
            while not self._wlan.active():
                time.sleep_ms(100)
            self._ip = self._wlan.ifconfig()[0]
            print(f"[WIFI] AP active: {WIFI_SSID}  IP: {self._ip}")
        else:
            self._wlan = network.WLAN(network.STA_IF)
            self._wlan.active(True)
            self._wlan.connect(ROUTER_SSID, ROUTER_PASS)
            timeout = 15
            while not self._wlan.isconnected() and timeout:
                time.sleep(1); timeout -= 1
            if self._wlan.isconnected():
                self._ip = self._wlan.ifconfig()[0]
                print(f"[WIFI] Connected — IP: {self._ip}")
            else:
                print("[WIFI] Connection failed — starting AP fallback")
                self.start_ap_fallback()
        return self._ip

    def start_ap_fallback(self):
        self._wlan = network.WLAN(network.AP_IF)
        self._wlan.config(essid=WIFI_SSID, password=WIFI_PASSWORD,
                          authmode=network.AUTH_WPA_WPA2_PSK)
        self._wlan.active(True)
        self._ip = self._wlan.ifconfig()[0]

    def start_server(self):
        self._socket = socket.socket()
        self._socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self._socket.bind(('', WEB_PORT))
        self._socket.listen(1)
        self._socket.settimeout(0.1)
        print(f"[WEB] Listening on http://{self._ip}:{WEB_PORT}")

    def _handle_cmd(self, action: str) -> str:
        print(f"[CMD] {action}")
        g = self.gait

        if action == 'forward':
            import _thread
            _thread.start_new_thread(g.walk, (0.0, 6))
        elif action == 'backward':
            import _thread
            _thread.start_new_thread(g.walk, (180.0, 4))
        elif action == 'left':
            g.turn(-45)
        elif action == 'right':
            g.turn(45)
        elif action == 'stop':
            g.stop(); g.stand()
        elif action == 'stand':
            g.stand()
        elif action == 'center':
            g.center_all()
        elif action == 'demo':
            import _thread
            _thread.start_new_thread(g.run_demo, ())
        elif action == 'sinter':
            g.sinter_pose()
        elif action == 'blade':
            g.blade_pose()
        elif action == 'wave':
            import _thread
            _thread.start_new_thread(g.wave_step, ())
        elif action == 'laser_on' and self.laser:
            self.laser.value(1)
        elif action == 'laser_off' and self.laser:
            self.laser.value(0)

        return action.upper() + " OK"

    def _respond(self, conn, body: str, content_type: str = 'text/html'):
        response = (
            "HTTP/1.1 200 OK\r\n"
            f"Content-Type: {content_type}\r\n"
            "Connection: close\r\n\r\n" + body
        )
        conn.sendall(response.encode())

    def tick(self):
        """Call this in the main loop — handles one pending request."""
        try:
            conn, addr = self._socket.accept()
        except OSError:
            return   # no connection pending

        try:
            request = conn.recv(512).decode('utf-8', 'ignore')
            line1 = request.split('\r\n')[0]
            path  = line1.split(' ')[1] if len(line1.split(' ')) > 1 else '/'

            if path.startswith('/cmd?a='):
                action = path.split('a=')[1].split('&')[0].split(' ')[0]
                msg    = self._handle_cmd(action)
                # Redirect back to root
                conn.sendall(b"HTTP/1.1 302 Found\r\nLocation: /\r\n\r\n")
            else:
                self._respond(conn, HTML)
        except Exception as e:
            print(f"[WEB] Error: {e}")
        finally:
            conn.close()

    @property
    def ip(self):
        return self._ip
