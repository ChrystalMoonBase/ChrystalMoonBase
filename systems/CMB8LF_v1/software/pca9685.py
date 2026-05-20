# CMB-R1 Scale Model — pca9685.py
# PCA9685 16-kanaals PWM driver met failsafe
# MicroPython · CC0

import time
from machine import I2C

_MODE1     = 0x00
_MODE2     = 0x01
_PRESCALE  = 0xFE
_LED0_ON_L = 0x06
_ALL_LED   = 0xFA

# MODE2 bits
_OUTDRV = 0x04   # totem-pole outputs (standaard voor servo's)
_OCH    = 0x08   # output change on ACK (sneller)

class PCA9685:
    """
    PCA9685 16-kanaals PWM servo driver.
    Inclusief failsafe: set_all_off() zet alle outputs naar 0% PWM.
    Servo-voeding loopt NIET via dit board — alleen PWM-signaal.
    """
    def __init__(self, i2c: I2C, addr: int = 0x40):
        self.i2c  = i2c
        self.addr = addr
        self._freq = 50
        self._reset()

    # ── Interne I2C operaties ────────────────────────────────────────────────

    def _write(self, reg, val):
        self.i2c.writeto_mem(self.addr, reg, bytes([val & 0xFF]))

    def _read(self, reg) -> int:
        return self.i2c.readfrom_mem(self.addr, reg, 1)[0]

    def _reset(self):
        """Hardware reset + OUTDRV instellen voor servo compatibiliteit."""
        self._write(_MODE1, 0x00)       # normaal mode
        time.sleep_ms(5)
        self._write(_MODE2, _OUTDRV)    # totem-pole, servo-correct
        time.sleep_ms(2)

    # ── Frequentie ────────────────────────────────────────────────────────────

    def set_freq(self, freq_hz: int):
        """
        Stel PWM-frequentie in voor alle kanalen.
        Servo's: 50 Hz. Niet boven 60 Hz gaan voor MG996R/SG90.
        """
        self._freq = freq_hz
        prescale = int(25_000_000 / (4096 * freq_hz) - 1 + 0.5)
        prescale = max(3, min(255, prescale))

        old = self._read(_MODE1)
        self._write(_MODE1, (old & 0x7F) | 0x10)   # sleep
        self._write(_PRESCALE, prescale)
        self._write(_MODE1, old & ~0x10)             # wake
        time.sleep_ms(5)
        self._write(_MODE1, old | 0x80)              # restart

    # ── Kanaalcontrole ────────────────────────────────────────────────────────

    def set_channel(self, ch: int, on: int, off: int):
        """Stel raw 12-bit on/off ticks in voor één kanaal (0–15)."""
        if not 0 <= ch <= 15:
            raise ValueError(f"Kanaal {ch} buiten bereik 0-15")
        base = _LED0_ON_L + 4 * ch
        self.i2c.writeto_mem(self.addr, base, bytes([
            on  & 0xFF, (on  >> 8) & 0x0F,
            off & 0xFF, (off >> 8) & 0x0F,
        ]))

    def set_us(self, ch: int, us: int, freq: int = None):
        """
        Stel pulsbredte in microseconden in voor één kanaal.
        Gebruikt safe_pulse niet hier — dat is de verantwoordelijkheid van Servo klasse.
        """
        f = freq or self._freq
        period_us = 1_000_000 // f
        ticks = int(us * 4096 / period_us)
        ticks = max(0, min(4095, ticks))
        self.set_channel(ch, 0, ticks)

    # ── FAILSAFE ─────────────────────────────────────────────────────────────

    def set_all_off(self):
        """
        FAILSAFE: zet alle 16 kanalen naar 0% PWM.
        Servo's verliezen aansturing maar houden positie door wrijving.
        Aanroepen bij:
          - noodstop
          - spanningsdrop
          - exception in main loop
          - WiFi disconnect (optioneel)
        """
        # ALL_LED_OFF register: bit 12 HIGH = volledig uit
        self.i2c.writeto_mem(self.addr, _ALL_LED,
                             bytes([0x00, 0x00, 0x00, 0x10]))

    def set_all_on(self):
        """Noodstand opheffen — alle kanalen terug naar 0 ticks (neutraal PWM)."""
        self.i2c.writeto_mem(self.addr, _ALL_LED,
                             bytes([0x00, 0x00, 0x00, 0x00]))

    # ── Diagnostiek ───────────────────────────────────────────────────────────

    def ping(self) -> bool:
        """Geeft True als PCA9685 bereikbaar is op I2C."""
        try:
            self._read(_MODE1)
            return True
        except OSError:
            return False

    def get_freq(self) -> int:
        return self._freq

    def __repr__(self):
        return f"PCA9685(addr=0x{self.addr:02X} freq={self._freq}Hz)"
