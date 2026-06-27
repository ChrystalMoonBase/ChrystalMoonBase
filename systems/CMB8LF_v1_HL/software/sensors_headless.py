# ============================================================
# CMB8LF v1 HL — sensors_headless.py
# Sensor manager for the head-less build: body-integrated
# sensing + the human override camera feed. Replaces the
# head's pan/tilt sensor handling. Runs on the Jetson.
# CC0 · Chrystal Moon Base · 2026
# ============================================================
#
# Works with (shared base, unchanged):
#   laser_palm_v6.py     — laser palm in the front leg
#   sinter_seq_v6.py     — sinter pulse sequencer (for duty-cycle sync)
#   palm_spectroscopy.py — palm spectroscopy (stays in the leg)
#
# Difference vs standard build: there is NO head and NO pan/tilt.
# Aiming is replaced by (a) the legs bringing the work to the
# fixed work-window, and (b) distributed fixed cameras for 360.

import time
from config_headless import SENSORS, OVERRIDE_FEED_CAMS, OVERRIDE_FEED_FPS
from config_headless import WORKWIN_DUTYCYCLE_SYNC


class HeadlessSensors:
    """Body-integrated sensor manager (no head, no pan/tilt)."""

    def __init__(self, laser_seq=None):
        self.s = SENSORS
        self.laser_seq = laser_seq      # reference to sinter sequencer (shared)
        self._init_buses()

    def _init_buses(self):
        # Placeholder bring-up; real drivers are platform-specific.
        # CSI multiplexer selects one of the 4 surround cams at a time.
        self.csi_mux_channel = None
        # thermal + work cam live on dedicated lines, always available.

    # ── Work-sensing: thermal + visual at the palm work point ──
    def read_work_zone(self):
        """Return (temp_C, frame) for the sinter/melt work point.

        If duty-cycle sync is on, capture is interleaved with the
        laser-off windows so glare/over-exposure is minimised. The
        work-window is fixed; the LEGS position the work, not a head.
        """
        if WORKWIN_DUTYCYCLE_SYNC and self.laser_seq is not None:
            self._wait_for_laser_gap()
        temp_C = self._read_thermal()       # FLIR Lepton 3.5
        frame  = self._read_work_cam()      # Pi Cam 3 NoIR
        return temp_C, frame

    def _wait_for_laser_gap(self, timeout_ms=200):
        """Block briefly until the sinter sequencer is between pulses."""
        t0 = time.ticks_ms() if hasattr(time, "ticks_ms") else int(time.time() * 1000)
        while self.laser_seq.is_pulsing():
            now = time.ticks_ms() if hasattr(time, "ticks_ms") else int(time.time() * 1000)
            if (now - t0) > timeout_ms:
                break                       # don't stall the loop
            time.sleep(0.001)

    def _read_thermal(self):
        # FLIR Lepton 3.5 over SPI → returns work-point temperature.
        return 0.0                          # driver-specific

    def _read_work_cam(self):
        # Pi Cam 3 NoIR → work-zone frame.
        return None                         # driver-specific

    # ── 360 awareness ──────────────────────────────────────────
    def read_lidar(self):
        # RPLIDAR A1M8 spins itself — full 360 scan, no pan needed.
        return None

    def read_proximity(self):
        return {"left": self._read_tof("tof_left"),
                "right": self._read_tof("tof_right")}

    def _read_tof(self, name):
        return None                         # VL53L1X driver-specific

    # ── Override feed for the human CMB engineer ───────────────
    def override_frames(self):
        """Yield one frame per override camera, round-robin.

        For situation assessment over the ~2.6 s link — NOT real-time
        joysticking. Low fps by design (see config OVERRIDE_FEED_FPS).
        The engineer sees ALL directions (fixed cams) with no aiming
        delay, which a single panning head could never give.
        """
        period = 1.0 / max(OVERRIDE_FEED_FPS, 1)
        for cam in OVERRIDE_FEED_CAMS:
            frame = self._grab(cam)
            yield cam, frame
            time.sleep(period)

    def _grab(self, cam_name):
        spec = self.s.get(cam_name, {})
        if spec.get("bus") == "CSI_MUX":
            self._select_mux(spec.get("ch"))
        return None                         # driver-specific

    def _select_mux(self, channel):
        if channel != self.csi_mux_channel:
            self.csi_mux_channel = channel
            # Arducam 4-ch CSI mux channel select (I2C/GPIO) — driver-specific.


if __name__ == "__main__":
    s = HeadlessSensors()
    print("Head-less sensor manager up. Sensors:", list(s.s.keys()))
    print("Override cams:", OVERRIDE_FEED_CAMS)
