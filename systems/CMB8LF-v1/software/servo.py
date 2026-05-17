# CMB-R1 Scale Model — servo.py  (PREMIUM BUILD)
# Servo abstractie — ondersteunt DS3240, MG996R, SG90
# MicroPython · CC0

from config import SERVO_MIN_US, SERVO_MAX_US, SERVO_MID_US, SG90_MIN_US, SG90_MAX_US

# Servo-type presets
SERVO_TYPES = {
    'DS3240': {'min_us': 500,  'max_us': 2500, 'mid_us': 1500},  # 35 kg/cm heupservo
    'MG996R': {'min_us': 500,  'max_us': 2500, 'mid_us': 1500},  # 10 kg/cm knie/pitch
    'SG90':   {'min_us': 500,  'max_us': 2400, 'mid_us': 1500},  # 1.2 kg/cm enkel
}

class Servo:
    """
    Servo abstractie voor DS3240, MG996R of SG90.
    angle=0   → neutraal (middenpuls)
    angle=90  → maximaal positief
    angle=-90 → maximaal negatief
    """
    def __init__(self, driver, channel: int,
                 servo_type: str = 'MG996R',
                 limit: tuple = (-90, 90),
                 offset: float = 0.0,
                 invert: bool = False,
                 freq: int = 50):
        self.drv    = driver
        self.ch     = channel
        self.freq   = freq
        self.limit  = limit
        self.offset = offset
        self.invert = invert
        self.type   = servo_type

        t = SERVO_TYPES.get(servo_type, SERVO_TYPES['MG996R'])
        self.min_us = t['min_us']
        self.max_us = t['max_us']
        self.mid_us = t['mid_us']
        self._angle = 0.0

    def _angle_to_us(self, angle: float) -> int:
        a = angle + self.offset
        if self.invert:
            a = -a
        lo, hi = self.limit
        a = max(lo, min(hi, a))
        if a >= 0:
            us = self.mid_us + (a / 90.0) * (self.max_us - self.mid_us)
        else:
            us = self.mid_us + (a / 90.0) * (self.mid_us - self.min_us)
        return int(max(self.min_us, min(self.max_us, us)))

    def move(self, angle: float):
        lo, hi = self.limit
        self._angle = max(lo, min(hi, angle))
        self.drv.set_us(self.ch, self._angle_to_us(self._angle), self.freq)

    def center(self):
        self.move(0)

    def relax(self):
        """Stroom naar servo onderbreken (houdt positie door wrijving)."""
        self.drv.set_channel(self.ch, 0, 0)

    @property
    def angle(self) -> float:
        return self._angle

    def __repr__(self):
        return f"Servo({self.type} ch={self.ch} {self._angle:.1f}°)"
