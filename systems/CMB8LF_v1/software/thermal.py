# CMB8LF v1 — thermal.py
# Thermisch beheer: monitoring, duty-cycle begrenzing, cooldown posture
# Raspberry Pi Pico W · MicroPython · CC0
#
# Idee: ChatGPT (vacuum thermal analysis)
# Implementatie: aangepast aan bestaande CMB8LF v1 architectuur
#
# Werkt samen met:
#   safety.py   — Failsafe, VoltageWatcher
#   servo.py    — Servo type-bewuste klasse
#   gait.py     — GaitController

import time
import machine

# ── DREMPELWAARDEN ────────────────────────────────────────────────────────────
TEMP_NOMINAL_C   = 35.0   # °C — normale operatie
TEMP_WARM_C      = 45.0   # °C — gait vertraging actief
TEMP_HOT_C       = 55.0   # °C — cooldown posture + duty-cycle cap
TEMP_CRITICAL_C  = 65.0   # °C — noodstop alle beweging

# Servo duty-cycle cap per thermische zone (% van normaal bereik)
DUTY_NOMINAL  = 1.00   # 100% — volledig bereik
DUTY_WARM     = 0.80   # 80%  — lichte beperking
DUTY_HOT      = 0.60   # 60%  — sterke beperking
DUTY_CRITICAL = 0.00   # 0%   — alles stil

# Gait vertraging per zone (factor op cycle tijd)
GAIT_SPEED_NOMINAL  = 1.00
GAIT_SPEED_WARM     = 0.70   # 30% langzamer
GAIT_SPEED_HOT      = 0.40   # 60% langzamer
GAIT_SPEED_CRITICAL = 0.00   # stilstand

# Holding torque rust-fase (in vacuum: servo ontspannen als positie stabiel)
REST_PHASE_INTERVAL_MS = 2000   # elke 2 sec een rust-fase mogelijk
REST_PHASE_DURATION_MS  = 200   # 200ms servo ontspannen (positie door wrijving)

# DS18B20 1-Wire pin (Pico W GPIO)
TEMP_SENSOR_PIN = 22

# INA226 I2C adres (stroom monitoring)
INA226_ADDR_7V4 = 0x40   # 7.4V rail (DS3240 + DS3225)
INA226_ADDR_6V0 = 0x41   # 6.0V rail (DS3218)


# ── THERMISCHE ZONES ──────────────────────────────────────────────────────────

class ThermalZone:
    NOMINAL  = "NOMINAL"
    WARM     = "WARM"
    HOT      = "HOT"
    CRITICAL = "CRITICAL"

    @staticmethod
    def from_temp(temp_c: float) -> str:
        if temp_c >= TEMP_CRITICAL_C: return ThermalZone.CRITICAL
        if temp_c >= TEMP_HOT_C:      return ThermalZone.HOT
        if temp_c >= TEMP_WARM_C:     return ThermalZone.WARM
        return ThermalZone.NOMINAL

    @staticmethod
    def duty_cap(zone: str) -> float:
        return {
            ThermalZone.NOMINAL:  DUTY_NOMINAL,
            ThermalZone.WARM:     DUTY_WARM,
            ThermalZone.HOT:      DUTY_HOT,
            ThermalZone.CRITICAL: DUTY_CRITICAL,
        }[zone]

    @staticmethod
    def gait_speed(zone: str) -> float:
        return {
            ThermalZone.NOMINAL:  GAIT_SPEED_NOMINAL,
            ThermalZone.WARM:     GAIT_SPEED_WARM,
            ThermalZone.HOT:      GAIT_SPEED_HOT,
            ThermalZone.CRITICAL: GAIT_SPEED_CRITICAL,
        }[zone]


# ── DS18B20 DRIVER (1-Wire) ───────────────────────────────────────────────────

class DS18B20:
    """
    Minimale 1-Wire DS18B20 driver voor Pico W.
    Meerdere sensoren op één bus worden gemiddeld.
    """
    def __init__(self, pin_num: int = TEMP_SENSOR_PIN):
        try:
            import onewire, ds18x20
            ow  = onewire.OneWire(machine.Pin(pin_num))
            self.ds  = ds18x20.DS18X20(ow)
            self.roms = self.ds.scan()
            self._ok  = len(self.roms) > 0
            print(f"[TEMP] {len(self.roms)} DS18B20 sensor(en) gevonden")
        except Exception as e:
            self._ok = False
            print(f"[TEMP] DS18B20 niet beschikbaar: {e}")

    def read(self) -> float:
        """Lees gemiddelde temperatuur van alle sensoren. Geeft -1.0 bij fout."""
        if not self._ok:
            return -1.0
        try:
            self.ds.convert_temp()
            time.sleep_ms(750)   # conversietijd DS18B20
            temps = [self.ds.read_temp(r) for r in self.roms]
            return sum(temps) / len(temps)
        except Exception:
            return -1.0


# ── INA226 STROOM MONITOR ─────────────────────────────────────────────────────

class INA226:
    """
    INA226 stroom- en vermogensmeting via I2C.
    Shunt: 0.1Ω (standaard module waarde).
    """
    _REG_CONFIG      = 0x00
    _REG_SHUNT       = 0x01
    _REG_BUS         = 0x02
    _REG_POWER       = 0x03
    _REG_CURRENT     = 0x04
    _REG_CALIB       = 0x05

    def __init__(self, i2c, addr: int, shunt_ohm: float = 0.1):
        self.i2c   = i2c
        self.addr  = addr
        self.shunt = shunt_ohm
        self._ok   = False
        self._calibrate()

    def _write(self, reg, val):
        self.i2c.writeto_mem(self.addr, reg, bytes([(val >> 8) & 0xFF, val & 0xFF]))

    def _read(self, reg) -> int:
        d = self.i2c.readfrom_mem(self.addr, reg, 2)
        return (d[0] << 8) | d[1]

    def _calibrate(self):
        try:
            # 4096 samples avg, 1.1ms conversietijd
            self._write(self._REG_CONFIG, 0x4527)
            # Kalibratie: Cal = 0.00512 / (shunt × current_lsb)
            # current_lsb = 1mA → Cal = 0.00512 / (0.1 × 0.001) = 512
            self._write(self._REG_CALIB, 512)
            self._ok = True
        except Exception as e:
            print(f"[INA226 0x{self.addr:02X}] Init fout: {e}")

    def current_a(self) -> float:
        """Stroom in Ampère."""
        if not self._ok: return 0.0
        try:
            raw = self._read(self._REG_CURRENT)
            if raw > 32767: raw -= 65536
            return raw * 0.001   # 1mA LSB
        except Exception:
            return 0.0

    def voltage_v(self) -> float:
        """Bus spanning in Volt."""
        if not self._ok: return 0.0
        try:
            raw = self._read(self._REG_BUS)
            return raw * 1.25e-3   # 1.25mV LSB
        except Exception:
            return 0.0

    def power_w(self) -> float:
        """Vermogen in Watt."""
        return self.current_a() * self.voltage_v()


# ── THERMISCH BEHEER ─────────────────────────────────────────────────────────

class ThermalManager:
    """
    Bewaakt temperatuur en servo-stroom.
    Past duty-cycle en gait-snelheid aan per thermische zone.
    Activeert cooldown posture en noodstop indien nodig.

    Gebruik in main loop:
        tm = ThermalManager(i2c, temp_sensor, gait_controller, failsafe)
        tm.start()
        # In main loop:
        tm.tick()
    """

    def __init__(self, i2c, temp_sensor: DS18B20,
                 gait=None, failsafe=None,
                 legs: dict = None):
        self.temp      = temp_sensor
        self.gait      = gait
        self.failsafe  = failsafe
        self.legs      = legs or {}

        # Stroom-monitors
        self.ina_7v4 = INA226(i2c, INA226_ADDR_7V4)
        self.ina_6v0 = INA226(i2c, INA226_ADDR_6V0)

        self._zone         = ThermalZone.NOMINAL
        self._last_temp    = 0.0
        self._check_tick   = 0
        self._rest_tick    = 0
        self._in_rest      = False
        self._cooldown_active = False
        self._running      = False

        # Log buffer (laatste 10 metingen)
        self._log = []

    # ── Publieke API ─────────────────────────────────────────────────────────

    def start(self):
        self._running = True
        print("[THERMAL] Thermisch beheer actief")
        self._check()   # directe eerste meting

    def tick(self):
        """Aanroepen in main loop — elke ~20ms."""
        if not self._running:
            return

        self._check_tick += 1
        self._rest_tick  += 1

        # Temperatuur check elke ~5 seconden (250 ticks × 20ms)
        if self._check_tick >= 250:
            self._check_tick = 0
            self._check()

        # Rust-fase check (positie vasthouden zonder stroom)
        if self._rest_tick >= (REST_PHASE_INTERVAL_MS // 20):
            self._rest_tick = 0
            if self._zone in (ThermalZone.HOT, ThermalZone.CRITICAL):
                self._rest_phase()

    def zone(self) -> str:
        return self._zone

    def duty_cap(self) -> float:
        return ThermalZone.duty_cap(self._zone)

    def gait_speed_factor(self) -> float:
        return ThermalZone.gait_speed(self._zone)

    def status(self) -> dict:
        return {
            "temp_c":       self._last_temp,
            "zone":         self._zone,
            "duty_cap":     self.duty_cap(),
            "gait_speed":   self.gait_speed_factor(),
            "current_7v4":  self.ina_7v4.current_a(),
            "current_6v0":  self.ina_6v0.current_a(),
            "power_7v4_w":  self.ina_7v4.power_w(),
            "power_6v0_w":  self.ina_6v0.power_w(),
            "cooldown":     self._cooldown_active,
        }

    def log(self):
        s = self.status()
        entry = (f"[THERMAL] {s['temp_c']:.1f}°C | zone={s['zone']} | "
                 f"duty={s['duty_cap']:.0%} | speed={s['gait_speed']:.0%} | "
                 f"7V4={s['current_7v4']:.2f}A {s['power_7v4_w']:.1f}W | "
                 f"6V0={s['current_6v0']:.2f}A {s['power_6v0_w']:.1f}W")
        print(entry)
        self._log.append(entry)
        if len(self._log) > 10:
            self._log.pop(0)

    # ── Interne methoden ─────────────────────────────────────────────────────

    def _check(self):
        """Lees sensoren en pas zone aan."""
        t = self.temp.read()
        if t < 0:
            return   # sensor fout — behoud huidige zone

        self._last_temp = t
        old_zone = self._zone
        self._zone = ThermalZone.from_temp(t)

        if self._zone != old_zone:
            self._zone_changed(old_zone, self._zone)

        if self._zone == ThermalZone.CRITICAL:
            self._emergency()
        elif self._zone == ThermalZone.HOT and not self._cooldown_active:
            self._activate_cooldown_posture()

        self.log()

    def _zone_changed(self, old: str, new: str):
        print(f"\n[THERMAL] Zone: {old} → {new} ({self._last_temp:.1f}°C)")
        if self.gait:
            self.gait.set_speed_factor(ThermalZone.gait_speed(new))
            print(f"[THERMAL] Gait snelheid: {ThermalZone.gait_speed(new):.0%}")

        # Cooldown deactiveren als we afkoelen
        if new in (ThermalZone.NOMINAL, ThermalZone.WARM):
            self._cooldown_active = False

    def _activate_cooldown_posture(self):
        """
        Cooldown posture: poten spreiden voor maximale stralingskoeling.
        In vacuum is dit het enige actieve koelpad naast conductie.

        Poten symmetrisch uitgespreid = maximaal oppervlak naar buiten.
        Robot staat stil maar koelt sneller af.
        """
        if not self.legs:
            return
        print("[THERMAL] Cooldown posture actief — poten spreiden")
        self._cooldown_active = True

        try:
            for name, leg in self.legs.items():
                side = 1 if 'R' in name else -1
                # Heup naar buiten, knie licht gebogen, enkel recht
                leg.set_angles(
                    rot   = side * 45,   # heup 45° naar buiten
                    pitch = 15,          # licht omlaag
                    knee  = 30,          # knie licht gebogen
                    ankle = 0
                )
            time.sleep_ms(500)
            # Nu servo's ontspannen — positie door wrijving en zwaartekracht
            for leg in self.legs.values():
                leg.relax()
            print("[THERMAL] Servo's ontspannen in cooldown posture")
        except Exception as e:
            print(f"[THERMAL] Cooldown posture fout: {e}")

    def _rest_phase(self):
        """
        Micro-rust: servo's kort ontspannen terwijl positie stabiel is.
        Vermindert holding torque warmte met 30-60%.
        Alleen in HOT of CRITICAL zone.
        """
        if self._in_rest:
            return
        self._in_rest = True
        try:
            for leg in self.legs.values():
                leg.relax()
            time.sleep_ms(REST_PHASE_DURATION_MS)
            # Servo's worden bij volgende gait-stap automatisch aangestuurd
        except Exception as e:
            print(f"[THERMAL] Rust-fase fout: {e}")
        finally:
            self._in_rest = False

    def _emergency(self):
        """Kritieke temperatuur — alles stilzetten."""
        if self.failsafe and not self.failsafe.active:
            self.failsafe.trigger(
                f"Kritieke temperatuur: {self._last_temp:.1f}°C "
                f"≥ {TEMP_CRITICAL_C}°C"
            )


# ── VACUUM TEST PROTOCOL ──────────────────────────────────────────────────────

class VacuumTestProtocol:
    """
    Gestructureerd test-protocol voor de vacuümkamer-sessie.
    Logt alle thermische data per fase.

    Gebruik:
        vtp = VacuumTestProtocol(thermal_manager)
        vtp.phase("Inpompen", duration_s=300)
        vtp.phase("Stilstand 10 min", duration_s=600)
        vtp.phase("Tripod walk 1 min", duration_s=60)
        vtp.report()
    """

    def __init__(self, tm: ThermalManager):
        self.tm     = tm
        self._data  = []
        self._phase = "init"

    def phase(self, name: str, duration_s: int):
        print(f"\n[VACTEST] Fase: {name} ({duration_s}s)")
        self._phase = name
        samples = []
        interval = 10   # meting elke 10 seconden
        steps = duration_s // interval

        for i in range(steps):
            time.sleep_ms(interval * 1000)
            s = self.tm.status()
            s['phase'] = name
            s['t_s']   = i * interval
            samples.append(s)
            print(f"  t={i*interval:4d}s | "
                  f"{s['temp_c']:.1f}°C | "
                  f"zone={s['zone']} | "
                  f"P_total={s['power_7v4_w']+s['power_6v0_w']:.1f}W")

        self._data.extend(samples)

    def report(self):
        if not self._data:
            print("[VACTEST] Geen data")
            return

        print("\n" + "="*60)
        print("VACUÜM TEST RAPPORT — CMB8LF v1")
        print("="*60)

        # Per fase samenvatting
        phases = {}
        for s in self._data:
            p = s['phase']
            if p not in phases:
                phases[p] = []
            phases[p].append(s)

        for phase, samples in phases.items():
            temps  = [s['temp_c'] for s in samples if s['temp_c'] > 0]
            powers = [s['power_7v4_w'] + s['power_6v0_w'] for s in samples]
            zones  = [s['zone'] for s in samples]

            if temps:
                print(f"\nFase: {phase}")
                print(f"  Temp:     {min(temps):.1f}°C → {max(temps):.1f}°C "
                      f"(gem. {sum(temps)/len(temps):.1f}°C)")
                print(f"  Vermogen: gem. {sum(powers)/len(powers):.1f}W")
                print(f"  Zones:    {set(zones)}")

        peak_temp = max((s['temp_c'] for s in self._data if s['temp_c'] > 0),
                        default=0)
        print(f"\nPiek temperatuur: {peak_temp:.1f}°C")
        if peak_temp < TEMP_HOT_C:
            print("✅ Thermisch: GOED — onder HOT drempel")
        elif peak_temp < TEMP_CRITICAL_C:
            print("⚠️  Thermisch: WARM — cooldown posture actief geweest")
        else:
            print("❌ Thermisch: KRITIEK — noodstop geactiveerd")
        print("="*60)
