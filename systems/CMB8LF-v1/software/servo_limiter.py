# CMB8LF v1 — servo_limiter.py
# Dubbele-rail servo stroom- en bewegingsbegrenzer
# Gecorrigeerd na stroomsanity check:
#   - 7.4V rail gesplitst over 2× 20A buck (A en B)
#   - MAX_SIMUL_7V4_PER_BUCK = 6 → max 16.8A piek per buck ≤ 20A
#   - INA226 adressen gecorrigeerd (geen conflict met PCA9685 0x40/0x41)
# CC0

import time
import machine

# ── RAIL CONFIGURATIE ─────────────────────────────────────────────────────────
#
# 7.4V rail: 2× 20A buck per robot
#   Buck A: DS3240 heup ×4 + DS3225 bovenbeen ×4   (kanalen 0,4,8,12 + 1,5,9,13)
#   Buck B: DS3240 heup ×4 + DS3225 bovenbeen ×4   (kanalen 2,6,10,14 + 3,7,11,15)
#   Max 6 servo's tegelijk per buck → 16.8A piek ≤ 20A ✓
#
# 6.0V rail: 1× 10A buck (XL4016/MP4569)
#   DS3218 onderbeen ×8 — max 4 tegelijk → 7.2A ≤ 8-9A continu ✓
#
# INA226 adressen (conflictvij — PCA9685 gebruikt 0x40 en 0x41):
#   0x44 = 7.4V buck A
#   0x45 = 7.4V buck B
#   0x46 = 6.0V rail
#   0x47 = 5V rail (optioneel)

MAX_SIMUL_7V4_PER_BUCK = 6    # max per 20A buck → 16.8A piek
MAX_SIMUL_6V0          = 4    # max op 10A (XL4016) → 7.2A piek
PULSE_LIMIT            = 0.80
NEUTRAL_US             = 1500
MIN_US, MAX_US         = 500, 2500
UPDATE_MS              = 20

_MAX_P = NEUTRAL_US + int((MAX_US - NEUTRAL_US) * PULSE_LIMIT)  # 2300µs
_MIN_P = NEUTRAL_US - int((NEUTRAL_US - MIN_US) * PULSE_LIMIT)  # 700µs

# DS3240/DS3225 kanalen per PCA9685 board
# Buck A: kanalen 0,1,4,5,8,9,12,13  (heup+bovenbeen poten 1,2,3,4)
# Buck B: kanalen 2,3,6,7,10,11,14,15 (heup+bovenbeen poten 5,6,7,8)
BUCK_A_CHANNELS = {0, 1, 4, 5, 8, 9, 12, 13}
BUCK_B_CHANNELS = {2, 3, 6, 7, 10, 11, 14, 15}
# DS3218 kanalen (onderbeen) — board B, kanalen 0-7
DS3218_CHANNELS = {0, 1, 2, 3, 4, 5, 6, 7}   # op board B


class DualRailServoLimiter:
    """
    Servo bewegingsbegrenzer met drie sub-rails:
      7.4V buck A — DS3240/DS3225 poten 1-4
      7.4V buck B — DS3240/DS3225 poten 5-8
      6.0V        — DS3218 poten 1-8

    Max 6 servo's per 20A buck → piek 16.8A ≤ 20A ✓
    Max 4 servo's op 6V rail  → piek  7.2A ≤ 8-9A XL4016 continu ✓
    """

    def __init__(self, drv_a, drv_b,
                 max_7v4: int = MAX_SIMUL_7V4_PER_BUCK,
                 max_6v0: int = MAX_SIMUL_6V0):
        self.drv_a   = drv_a
        self.drv_b   = drv_b
        self.max_7v4 = max_7v4
        self.max_6v0 = max_6v0

        # Aparte queues per sub-rail
        self._q_buck_a  = {}   # 7.4V buck A
        self._q_buck_b  = {}   # 7.4V buck B
        self._q_6v0     = {}   # 6.0V rail

        self._pos        = {}
        self._running    = True
        self._flush_flag = False
        self._timer      = None

    # ── Publieke API ─────────────────────────────────────────────────────────

    def move(self, driver, channel: int, target_us: int):
        if not self._running:
            return
        if not (MIN_US <= target_us <= MAX_US):
            raise ValueError(f"Puls {target_us}µs buiten bereik")

        us  = self._clamp(target_us)
        key = (id(driver), channel)

        # Routeer naar juiste sub-rail
        if driver is self.drv_b and channel in DS3218_CHANNELS:
            # 6.0V rail
            self._q_6v0[key] = (driver, channel, us)
            if len(self._q_6v0) >= self.max_6v0:
                self._flush_rail(self._q_6v0, self.max_6v0)
        elif channel in BUCK_A_CHANNELS:
            # 7.4V buck A
            self._q_buck_a[key] = (driver, channel, us)
            if len(self._q_buck_a) >= self.max_7v4:
                self._flush_rail(self._q_buck_a, self.max_7v4)
        else:
            # 7.4V buck B
            self._q_buck_b[key] = (driver, channel, us)
            if len(self._q_buck_b) >= self.max_7v4:
                self._flush_rail(self._q_buck_b, self.max_7v4)

    def tick(self):
        """Aanroepen in main loop — verwerkt pending flush."""
        if not self._running:
            return
        if self._flush_flag:
            self._flush_rail(self._q_buck_a, self.max_7v4)
            self._flush_rail(self._q_buck_b, self.max_7v4)
            self._flush_rail(self._q_6v0,    self.max_6v0)
            self._flush_flag = False

    def flush_now(self):
        self._flush_rail(self._q_buck_a, self.max_7v4)
        self._flush_rail(self._q_buck_b, self.max_7v4)
        self._flush_rail(self._q_6v0,    self.max_6v0)

    def emergency_stop(self, reason: str = "handmatig"):
        print(f"\n[E-STOP] {reason}")
        self._running = False
        self.stop_timer()
        for drv in [self.drv_a, self.drv_b]:
            if drv is None: continue
            try: drv.set_all_off()
            except Exception: pass
        self._q_buck_a.clear()
        self._q_buck_b.clear()
        self._q_6v0.clear()
        print("[E-STOP] Alle servo's ontspannen.")

    def resume(self):
        self._running = True

    def start_timer(self):
        self._timer = machine.Timer()
        self._timer.init(freq=50, mode=machine.Timer.PERIODIC,
                         callback=self._timer_cb)

    def stop_timer(self):
        if self._timer:
            self._timer.deinit()
            self._timer = None

    def _timer_cb(self, t):
        """Interrupt-veilig: alleen flag. Geen I2C."""
        self._flush_flag = True

    def get_status(self) -> dict:
        return {
            "running":    self._running,
            "q_buck_a":   len(self._q_buck_a),
            "q_buck_b":   len(self._q_buck_b),
            "q_6v0":      len(self._q_6v0),
            "max_7v4":    self.max_7v4,
            "max_6v0":    self.max_6v0,
        }

    def _clamp(self, us: int) -> int:
        return max(_MIN_P, min(_MAX_P, us))

    def _flush_rail(self, queue: dict, max_sim: int):
        if not queue: return
        items = list(queue.items())
        queue.clear()
        for i in range(0, len(items), max_sim):
            batch = items[i:i + max_sim]
            for key, (drv, ch, us) in batch:
                try:
                    drv.set_us(ch, us)
                    self._pos[key] = us
                except Exception as e:
                    print(f"[LIMITER] ch {ch} fout: {e}")
            if i + max_sim < len(items):
                time.sleep_ms(UPDATE_MS)

    def current_us(self, driver, channel: int) -> int:
        return self._pos.get((id(driver), channel), NEUTRAL_US)
