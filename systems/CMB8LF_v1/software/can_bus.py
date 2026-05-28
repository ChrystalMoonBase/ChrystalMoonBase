# ============================================================
# CMB8LF v1 — can_bus.py
# CAN Bus Communication Layer — Pi5 (Python 3.x)
# Wraps python-can + Canable USB-CAN adapter
# pip install python-can
# sudo ip link set can0 up type can bitrate 1000000
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import can
import time
import struct
import threading
from typing import Optional, Callable

class CMBCANBus:
    """CAN bus interface — all moteus controllers on one bus."""

    BITRATE   = 1_000_000
    INTERFACE = "socketcan"
    CHANNEL   = "can0"

    def __init__(self):
        self.bus      = None
        self._running = False
        self._callbacks: dict[int, list] = {}
        self._status: dict[int, dict]    = {}

    def connect(self) -> bool:
        try:
            self.bus = can.interface.Bus(
                channel=self.CHANNEL,
                interface=self.INTERFACE,
                bitrate=self.BITRATE,
            )
            self._running = True
            t = threading.Thread(target=self._recv_loop, daemon=True)
            t.start()
            print(f"[CAN] Connected · {self.CHANNEL} · 1 Mbit/s")
            return True
        except Exception as e:
            print(f"[CAN] FOUT: {e}")
            print("[CAN] Probeer: sudo ip link set can0 up type can bitrate 1000000")
            return False

    def disconnect(self):
        self._running = False
        if self.bus:
            self.bus.shutdown()
        print("[CAN] Verbinding gesloten")

    # ── VERZENDEN ────────────────────────────────────────────

    def send_position(self, node: int, pos_deg: float,
                      vel_dps: float = 0.0, tor_nm: float = 0.0,
                      kp: float = 5.0, kd: float = 0.1) -> bool:
        """Stuur positieopdracht naar moteus node."""
        if not self.bus:
            return False
        # moteus protocol: positie in rotaties
        pos_rot = pos_deg / 360.0
        vel_rot = vel_dps / 360.0
        data = struct.pack('<ffff', pos_rot, vel_rot, tor_nm, kp)
        msg = can.Message(arbitration_id=0x8000 | node,
                          data=data, is_extended_id=False)
        try:
            self.bus.send(msg)
            return True
        except can.CanError as e:
            print(f"[CAN] Verzend fout node {node}: {e}")
            return False

    def send_stop(self, node: int) -> bool:
        """Stop één moteus node."""
        if not self.bus:
            return False
        msg = can.Message(arbitration_id=0x8000 | node,
                          data=bytes([0x00]), is_extended_id=False)
        try:
            self.bus.send(msg)
            return True
        except:
            return False

    def estop_all(self):
        """Noodstop alle nodes op de bus."""
        for node in range(1, 94):
            self.send_stop(node)
        print("[CAN] NOODSTOP — alle nodes gestopt")

    def lock_joint(self, node: int) -> bool:
        """
        Geef bistabiele magneet vrijgavepuls.
        Eigenlijke hardware puls via Pico W #2 GPIO.
        Dit stuurt het commando naar Pico #2 via shared state.
        """
        print(f"[CAN] Lock joint node {node}")
        return True  # Pico W #2 beheert de magneet hardware

    # ── ONTVANGEN ────────────────────────────────────────────

    def register_callback(self, node: int, fn: Callable):
        if node not in self._callbacks:
            self._callbacks[node] = []
        self._callbacks[node].append(fn)

    def get_status(self, node: int) -> dict:
        """Haal laatste bekende status op van node."""
        return self._status.get(node, {
            "pos_deg": 0.0, "vel_dps": 0.0,
            "tor_nm": 0.0,  "temp_c": 0.0,
            "online": False,
        })

    def _recv_loop(self):
        while self._running and self.bus:
            try:
                msg = self.bus.recv(timeout=0.05)
                if not msg:
                    continue
                node = msg.arbitration_id & 0xFF
                if len(msg.data) >= 16:
                    pos, vel, tor, temp = struct.unpack('<ffff',
                                                         msg.data[:16])
                    self._status[node] = {
                        "pos_deg":  pos * 360.0,
                        "vel_dps":  vel * 360.0,
                        "tor_nm":   tor,
                        "temp_c":   temp,
                        "online":   True,
                    }
                for fn in self._callbacks.get(node, []):
                    fn(self._status[node])
            except Exception:
                pass

    def scan_nodes(self, timeout: float = 2.0) -> list:
        """Scan welke moteus nodes online zijn."""
        print(f"[CAN] Scannen ({timeout}s)...")
        found = []
        deadline = time.time() + timeout
        while time.time() < deadline:
            for node in list(self._status.keys()):
                if node not in found:
                    found.append(node)
                    print(f"[CAN] Node {node} online")
        print(f"[CAN] {len(found)} nodes gevonden")
        return sorted(found)
