# ============================================================
# CMB8LF v1 — moteus_ctrl.py
# moteus r4.11 Controller Interface
# Hogere abstractie boven can_bus.py
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import time
from can_bus import CMBCANBus
from config_v6 import JOINT_LIMITS, TORQUE_LIMITS

class MoteusNode:
    """Eén moteus r4.11 controller — één BLDC motor."""

    def __init__(self, node_id: int, joint_type: str, can: CMBCANBus):
        self.node_id    = node_id
        self.joint      = joint_type  # coxa/femur/tibia/pan/tilt
        self.can        = can
        self._pos       = 0.0
        self._online    = False
        can.register_callback(node_id, self._on_data)

    def _on_data(self, data: dict):
        self._pos    = data["pos_deg"]
        self._online = True

    @property
    def online(self) -> bool:
        return self._online

    @property
    def position(self) -> float:
        return self._pos

    def move_to(self, degrees: float, speed: float = 180.0,
                torque: float = None) -> bool:
        """Beweeg naar hoek in graden."""
        lo, hi = JOINT_LIMITS.get(self.joint, (-90, 90))
        degrees = max(lo, min(hi, degrees))
        if torque is None:
            torque = TORQUE_LIMITS.get(self.joint, 1.0)
        return self.can.send_position(
            self.node_id, degrees, speed, torque)

    def hold(self) -> bool:
        """Houd huidige positie (laag koppel)."""
        return self.can.send_position(
            self.node_id, self._pos, 0.0, 0.2)

    def relax(self) -> bool:
        """Geen koppel — motor vrij te bewegen."""
        return self.can.send_stop(self.node_id)

    def center(self) -> bool:
        """Ga naar nulpositie."""
        return self.move_to(0.0)

    def status(self) -> dict:
        s = self.can.get_status(self.node_id)
        s["node_id"] = self.node_id
        s["joint"]   = self.joint
        return s


class LegController:
    """3-segment been: coxa + femur + tibia."""

    def __init__(self, leg_id: int, can: CMBCANBus):
        self.leg_id = leg_id
        base = leg_id * 10
        self.coxa  = MoteusNode(base + 1, "coxa",  can)
        self.femur = MoteusNode(base + 2, "femur", can)
        self.tibia = MoteusNode(base + 3, "tibia", can)
        self._locked = False

    @property
    def online(self) -> bool:
        return (self.coxa.online and
                self.femur.online and
                self.tibia.online)

    def move(self, coxa_deg: float, femur_deg: float,
             tibia_deg: float) -> bool:
        """Beweeg alle 3 gewrichten tegelijk."""
        ok  = self.coxa.move_to(coxa_deg)
        ok &= self.femur.move_to(femur_deg)
        ok &= self.tibia.move_to(tibia_deg)
        return ok

    def hold_all(self) -> bool:
        """Houd alle gewrichten."""
        return (self.coxa.hold() and
                self.femur.hold() and
                self.tibia.hold())

    def relax_all(self) -> bool:
        """Ontspan alle servo's."""
        return (self.coxa.relax() and
                self.femur.relax() and
                self.tibia.relax())

    def lock(self) -> bool:
        """
        Bistabiele magneet vergrendeling.
        Servo's kunnen daarna ontspannen — magneet houdt positie.
        """
        self.hold_all()
        time.sleep(0.1)
        self.can.lock_joint(self.coxa.node_id)
        self.can.lock_joint(self.femur.node_id)
        self.can.lock_joint(self.tibia.node_id)
        time.sleep(0.05)
        self.relax_all()
        self._locked = True
        return True

    def status(self) -> dict:
        return {
            "leg_id": self.leg_id,
            "online": self.online,
            "locked": self._locked,
            "coxa":   self.coxa.status(),
            "femur":  self.femur.status(),
            "tibia":  self.tibia.status(),
        }


class HeadController:
    """Hoofd: pan + tilt."""

    def __init__(self, can: CMBCANBus):
        self.pan  = MoteusNode(91, "pan",  can)
        self.tilt = MoteusNode(92, "tilt", can)

    def look_at(self, pan_deg: float, tilt_deg: float):
        self.pan.move_to(pan_deg)
        self.tilt.move_to(tilt_deg)

    def center(self):
        self.pan.center()
        self.tilt.center()

    def scan(self):
        """360° pan scan voor LIDAR mapping."""
        for angle in range(-90, 91, 10):
            self.pan.move_to(angle, speed=90)
            time.sleep(0.15)
        self.center()
