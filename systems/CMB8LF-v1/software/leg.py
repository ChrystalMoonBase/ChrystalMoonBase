# CMB-R1 Scale Model — leg.py  (PREMIUM BUILD)
# Enkelbeen besturing met IK — DS3240 heup, MG996R knie/pitch, SG90 enkel
# MicroPython · CC0

import math
from servo import Servo
from config import LIMITS, CALIBRATION

# Pootsegment lengtes (mm, schaalmodel 1:3.5)
L_COXA  = 45
L_FEMUR = 80
L_TIBIA = 70
L_FOOT  = 20

class Leg:
    """
    4-DOF poot: hip_rot (DS3240), hip_pitch (MG996R),
                knee (MG996R), ankle (SG90).

    Coördinatenstelsel (per poot):
      x = voorwaarts
      y = naar buiten (van chassismidden)
      z = omhoog (positief = omhoog)
    """
    def __init__(self, name: str, drv_a, drv_b,
                 cfg: dict, side: str = 'R', leg_type: str = 'stance'):
        self.name  = name
        self.side  = side
        self.type  = leg_type
        self.invert = (side == 'L')
        cal = CALIBRATION[name]

        board = drv_a if cfg[0] == 'A' else drv_b
        _, ch_rot, ch_pitch, ch_knee, ch_ankle = cfg[:5]

        lim = LIMITS
        # DS3240 voor heup-rotatie (meer koppel, ruimer bereik)
        self.hip_rot = Servo(board, ch_rot,
                             servo_type='DS3240',
                             limit=lim['hip_rot'],
                             offset=cal[0],
                             invert=self.invert)
        # MG996R voor heup-pitch
        self.hip_pitch = Servo(board, ch_pitch,
                               servo_type='MG996R',
                               limit=lim['hip_pitch'],
                               offset=cal[1])
        # MG996R voor knie
        self.knee = Servo(board, ch_knee,
                          servo_type='MG996R',
                          limit=lim['knee'],
                          offset=cal[2])
        # SG90 voor enkel
        self.ankle = Servo(board, ch_ankle,
                           servo_type='SG90',
                           limit=lim['ankle'],
                           offset=cal[3])

        self._target_x = 0.0
        self._target_z = -(L_FEMUR + L_TIBIA) * 0.6

    # ── Directe hoekcontrole ─────────────────────────────────────────────────

    def set_angles(self, rot: float, pitch: float,
                   knee: float, ankle: float = 0.0):
        self.hip_rot.move(rot)
        self.hip_pitch.move(pitch)
        self.knee.move(knee)
        self.ankle.move(ankle)

    def center(self):
        for s in (self.hip_rot, self.hip_pitch, self.knee, self.ankle):
            s.center()

    def relax(self):
        for s in (self.hip_rot, self.hip_pitch, self.knee, self.ankle):
            s.relax()

    # ── 2D inverse kinematica (verticaal vlak) ────────────────────────────────

    def _ik_vertical(self, reach: float, height: float):
        d = math.sqrt(reach**2 + height**2)
        max_r = L_FEMUR + L_TIBIA
        min_r = abs(L_FEMUR - L_TIBIA)
        if d > max_r or d < min_r:
            return None

        phi = math.atan2(height, reach)

        cos_k = (L_FEMUR**2 + L_TIBIA**2 - d**2) / (2 * L_FEMUR * L_TIBIA)
        cos_k = max(-1.0, min(1.0, cos_k))
        knee_rad = math.acos(cos_k)

        cos_h = (L_FEMUR**2 + d**2 - L_TIBIA**2) / (2 * L_FEMUR * d)
        cos_h = max(-1.0, min(1.0, cos_h))
        hip_rad = phi - math.acos(cos_h)

        return (math.degrees(hip_rad), math.degrees(knee_rad))

    def move_to(self, x: float, z: float,
                rot: float = None, ankle: float = 0.0):
        if rot is not None:
            self.hip_rot.move(rot)
        result = self._ik_vertical(x, abs(z))
        if result is None:
            return False
        hp, kn = result
        if z < 0:
            hp = -hp
        self.hip_pitch.move(hp)
        self.knee.move(kn)
        self.ankle.move(ankle)
        self._target_x = x
        self._target_z = z
        return True

    def lift(self, height_mm: float):
        self.move_to(self._target_x, self._target_z + height_mm)

    def plant(self):
        self.move_to(self._target_x, self._target_z)

    @property
    def target(self):
        return (self._target_x, self._target_z)

    def __repr__(self):
        return (f"Leg({self.name} "
                f"rot={self.hip_rot.angle:.0f}° "
                f"pitch={self.hip_pitch.angle:.0f}° "
                f"knee={self.knee.angle:.0f}°)")
