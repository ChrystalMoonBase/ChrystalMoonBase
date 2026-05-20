# CMB8LF v1 — gait.py
# Gait controller met thermisch bewuste snelheidsregeling
# MicroPython · CC0

import time
from config import TRIPOD_A, TRIPOD_B, GAIT_CYCLE_MS, GAIT_STEP_HEIGHT, GAIT_STEP_LENGTH

class GaitController:
    """
    Gait controller voor CMB8LF v1.
    Ondersteunt tripod, wave, en degraded mode (poot uitgevallen).
    Thermisch bewust via speed_factor van ThermalManager.
    """

    GAITS = ['tripod', 'wave', 'slow', 'stop']

    def __init__(self, legs: dict):
        self.legs          = legs
        self._speed_factor = 1.0   # 1.0 = normaal, 0.0 = stilstand
        self._gait         = 'tripod'
        self._running      = False
        self._disabled_legs = set()   # voor degraded mode (poot uitgevallen)
        self.movement_manager = None  # optioneel: MovementManager uit safety.py

    # ── Publieke API ─────────────────────────────────────────────────────────

    def set_speed_factor(self, factor: float):
        """
        Aangeroepen door ThermalManager bij zone-wijziging.
        0.0 = stilstand, 1.0 = volledig normaal.
        """
        self._speed_factor = max(0.0, min(1.0, factor))
        if self._speed_factor == 0.0:
            print("[GAIT] Stilstand — thermische noodmaatregel")
        else:
            print(f"[GAIT] Snelheid: {self._speed_factor:.0%}")

    def disable_leg(self, leg_name: str):
        """Schakel over naar degraded mode bij poot-uitval."""
        self._disabled_legs.add(leg_name)
        count = len(self.legs) - len(self._disabled_legs)
        print(f"[GAIT] Degraded mode: {count} poten actief "
              f"(uitgevallen: {self._disabled_legs})")

    def enable_leg(self, leg_name: str):
        self._disabled_legs.discard(leg_name)

    def stand(self):
        """Stabiele staande positie."""
        for name, leg in self.legs.items():
            if name not in self._disabled_legs:
                leg.center()
        time.sleep_ms(300)

    def relax_all(self):
        """Alle servo's ontspannen — holding torque nul."""
        for leg in self.legs.values():
            leg.relax()

    # ── Gait stap ────────────────────────────────────────────────────────────

    def _cycle_ms(self) -> int:
        """Gait cycle tijd gecorrigeerd voor thermische snelheid."""
        if self._speed_factor <= 0:
            return 0
        return int(GAIT_CYCLE_MS / self._speed_factor)

    def _active_legs(self, group: list) -> list:
        """Filter uitgevallen poten uit een groep."""
        return [l for l in group if l not in self._disabled_legs]

    def _step_group(self, group: list, direction: float = 1.0):
        """
        Til een groep poten op, zet ze naar voren, plant ze neer.
        direction: 1.0 = vooruit, -1.0 = achteruit.
        """
        active = self._active_legs(group)
        if not active:
            return

        half = self._cycle_ms() // 2

        # Optillen
        for name in active:
            leg = self.legs[name]
            x, z = leg.target
            leg.move_to(x + direction * GAIT_STEP_LENGTH * 0.5,
                        z + GAIT_STEP_HEIGHT)
        time.sleep_ms(half // 2)

        # Neerzetten
        for name in active:
            leg = self.legs[name]
            x, z = leg.target
            leg.move_to(x, z - GAIT_STEP_HEIGHT)
        time.sleep_ms(half // 2)

    # ── Loopstijlen ──────────────────────────────────────────────────────────

    def tripod_step(self, direction: float = 1.0):
        """
        Tripod gait: 2 groepen van 4 poten wisselen.
        Snelste stabiele gang, gebruikt bij normale temperatuur.
        """
        if self._speed_factor <= 0:
            return

        self._step_group(TRIPOD_A, direction)
        self._step_group(TRIPOD_B, direction)

    def wave_step(self, direction: float = 1.0):
        """
        Wave gait: één poot tegelijk.
        Langzamer, stabieler, minder thermisch piekverbruik.
        Gebruikt bij WARM zone.
        """
        if self._speed_factor <= 0:
            return

        all_legs = TRIPOD_A + TRIPOD_B
        for name in all_legs:
            if name not in self._disabled_legs:
                self._step_group([name], direction)

    def thermal_step(self, direction: float = 1.0):
        """
        Thermisch bewuste gait-selectie op basis van speed_factor.
        Aangeroepen door main loop — kiest automatisch de juiste stijl.
        """
        if self._speed_factor >= 0.7:
            self.tripod_step(direction)
        elif self._speed_factor >= 0.3:
            self.wave_step(direction)
        else:
            # Bijna stilstand — alleen kleine correctiebewegingen
            time.sleep_ms(self._cycle_ms())

    # ── Speciale postures ─────────────────────────────────────────────────────

    def sinter_pose(self):
        """Linker arm (AR) omlaag voor sinter-laser operatie."""
        if 'AR' in self.legs and 'AR' not in self._disabled_legs:
            self.legs['AR'].set_angles(rot=0, pitch=60, knee=80, ankle=0)

    def blade_pose(self):
        """Beide voorste armen omlaag voor bulldozerblad."""
        for arm in ['AR', 'AL']:
            if arm in self.legs and arm not in self._disabled_legs:
                self.legs[arm].set_angles(rot=0, pitch=45, knee=60, ankle=0)

    def demo_sequence(self, thermal_manager=None):
        """
        Demo-sequentie: stand → tripod → wave → sinter → blade → stand.
        Controleert thermische zone vóór elke stap.
        """
        print("[DEMO] Start demo-sequentie")

        self.stand(); time.sleep_ms(1000)

        if thermal_manager and thermal_manager.zone() == 'CRITICAL':
            print("[DEMO] Afgebroken — kritieke temperatuur")
            return

        print("[DEMO] Tripod 3 stappen")
        for _ in range(3):
            self.tripod_step()

        if thermal_manager and thermal_manager.gait_speed_factor() < 0.3:
            print("[DEMO] Overgeslagen — thermisch beperkt")
        else:
            print("[DEMO] Wave 2 cycli")
            for _ in range(2):
                self.wave_step()

        print("[DEMO] Sinter pose")
        self.sinter_pose(); time.sleep_ms(1500)

        print("[DEMO] Blade pose")
        self.blade_pose(); time.sleep_ms(1500)

        print("[DEMO] Terug naar stand")
        self.stand()
        print("[DEMO] Klaar")
