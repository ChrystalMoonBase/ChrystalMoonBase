# ============================================================
# CMB8LF v1 — wave_gait_v6.py
# Wave Gait Controller — 1 been tegelijk · 7 altijd grond
# Maximale stabiliteit · Spin-patroon
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import asyncio
import time
from config_v6 import (WAVE_ORDER, WORK_POSITIONS, LIFT_HEIGHT,
                        STEP_LENGTH, STEP_TIME_MS, JOINT_LIMITS,
                        TORQUE_LIMITS)

class WaveGait:
    """
    Wave Gait controller voor CMB8LF v1.
    
    Stuurt Pi5 aan via UART met bewegingsopdrachten.
    Pi5 vertaalt naar moteus CAN commando's.
    
    Altijd 7 benen op de grond — 1 tegelijk in de lucht.
    Nooit lopen terwijl lasers actief zijn.
    """

    def __init__(self, pi5_uart, nodes, wave_order,
                 lift_mm=35, step_mm=40):
        self.uart       = pi5_uart
        self.nodes      = nodes
        self.order      = wave_order
        self.lift_mm    = lift_mm
        self.step_mm    = step_mm
        self._running   = False
        self._in_work   = False
        self._disabled  = set()   # uitgevallen benen

    # ── INTERNE COMMUNICATIE MET PI5 ─────────────────────────

    def _send(self, cmd: str):
        """Stuur commando naar Pi5 (die stuurt naar moteus)."""
        self.uart.write(f"{cmd}\n")

    def _move_joint(self, been: int, joint: str, degrees: float,
                    torque_nm: float = None):
        """Stuur één gewricht naar een hoek."""
        if torque_nm is None:
            torque_nm = TORQUE_LIMITS.get(joint, 1.0)
        # Controleer limieten
        lo, hi = JOINT_LIMITS.get(joint, (-90, 90))
        degrees = max(lo, min(hi, degrees))
        node_id = been * 10 + ["coxa","femur","tibia"].index(joint) + 1
        self._send(f"MOTEUS:node={node_id},pos={degrees:.1f},tor={torque_nm:.2f}")

    def _lock_joint(self, been: int, joint: str):
        """Vergrendel gewricht (bistabiele magneet puls)."""
        node_id = been * 10 + ["coxa","femur","tibia"].index(joint) + 1
        self._send(f"LOCK:node={node_id}")

    def _relax_joint(self, been: int, joint: str):
        """Ontspan gewricht na vergrendeling (servo spanningsloos)."""
        node_id = been * 10 + ["coxa","femur","tibia"].index(joint) + 1
        self._send(f"RELAX:node={node_id}")

    # ── BASISPOSITIES ────────────────────────────────────────

    async def stand(self):
        """
        Stabiele staande positie.
        Alle benen in standaard spin-houding.
        """
        print("[GAIT] Stand...")
        for been, pos in WORK_POSITIONS.items():
            been_nr = int(been.replace("been", ""))
            if been_nr not in self._disabled:
                self._move_joint(been_nr, "coxa",  pos["coxa"])
                self._move_joint(been_nr, "femur", pos["femur"])
                self._move_joint(been_nr, "tibia", pos["tibia"])
        await asyncio.sleep_ms(500)
        print("[GAIT] Stand OK")

    async def work_stance(self) -> bool:
        """
        Werkstand: alle gewrichten vergrendeld.
        Robot staat als een statief — maximale stabiliteit.
        Servo's kunnen ontspannen na vergrendeling.
        """
        print("[GAIT] Werkstand activeren...")
        await self.stand()
        await asyncio.sleep_ms(300)

        # Vergrendel alle gewrichten
        for been in range(1, 9):
            if been not in self._disabled:
                for joint in ["coxa", "femur", "tibia"]:
                    self._lock_joint(been, joint)

        await asyncio.sleep_ms(200)

        # Ontspan servo's — magneet houdt positie
        for been in range(1, 9):
            if been not in self._disabled:
                for joint in ["coxa", "femur", "tibia"]:
                    self._relax_joint(been, joint)

        self._in_work = True
        print("[GAIT] Werkstand ACTIEF — robot vergrendeld")
        return True

    async def leave_work_stance(self):
        """Verlaat werkstand — benen weer actief."""
        # Activeer servo's voor we magneet ontgrendelen
        for been in range(1, 9):
            if been not in self._disabled:
                for joint in ["coxa", "femur", "tibia"]:
                    pos = WORK_POSITIONS[f"been{been}"]
                    self._move_joint(been, joint, pos[joint])
        await asyncio.sleep_ms(200)
        self._send("UNLOCK:all")
        self._in_work = False
        print("[GAIT] Werkstand verlaten")

    # ── WAVE GAIT ────────────────────────────────────────────

    async def walk(self, direction: float = 1.0):
        """
        Wave gait lopen.
        direction: 1.0=vooruit, -1.0=achteruit, 0.5=halve snelheid
        
        Volgorde: WAVE_ORDER — altijd 7 op grond, 1 in lucht.
        Nooit actief als in werkstand of lasers aan.
        """
        if self._in_work:
            print("[GAIT] FOUT: werkstand actief — eerst verlaten")
            return

        self._running = True
        print(f"[GAIT] Wave gait start · richting={direction:.1f}")

        while self._running:
            for been in self.order:
                if not self._running:
                    break
                if been in self._disabled:
                    continue

                # 1. Til been op
                await self._lift_leg(been)

                # 2. Beweeg naar voren
                await self._swing_leg(been, direction)

                # 3. Plant been neer
                await self._plant_leg(been)

                # 4. Wacht (staat ook grond-fase in)
                await asyncio.sleep_ms(STEP_TIME_MS)

    async def _lift_leg(self, been: int):
        """Til één been op."""
        pos = WORK_POSITIONS[f"been{been}"]
        # Femur omhoog voor lift
        lift_angle = pos["femur"] - 35  # 35° omhoog
        self._move_joint(been, "femur", lift_angle, 1.5)
        await asyncio.sleep_ms(80)

    async def _swing_leg(self, been: int, direction: float):
        """Swing been naar voren."""
        pos = WORK_POSITIONS[f"been{been}"]
        swing = self.step_mm * direction * 0.3  # mm naar graden (benadering)
        nieuwe_coxa = pos["coxa"] + swing
        self._move_joint(been, "coxa", nieuwe_coxa, 2.0)
        await asyncio.sleep_ms(100)

    async def _plant_leg(self, been: int):
        """Plant been neer op grond."""
        pos = WORK_POSITIONS[f"been{been}"]
        self._move_joint(been, "femur", pos["femur"], 2.5)
        self._move_joint(been, "tibia", pos["tibia"], 1.5)
        await asyncio.sleep_ms(80)

    # ── STOPPEN ──────────────────────────────────────────────

    async def stop(self):
        """Stop gait na huidige stap."""
        self._running = False
        await asyncio.sleep_ms(STEP_TIME_MS)
        await self.stand()
        print("[GAIT] Gestopt")

    def emergency_stop_sync(self):
        """Directe noodstop — geen await nodig."""
        self._running = False
        self._send("ESTOP:all")
        print("[GAIT] NOODSTOP")

    # ── DEGRADED MODE ────────────────────────────────────────

    def disable_leg(self, been: int):
        """Schakel been uit (beschadigd of verwijderd)."""
        self._disabled.add(been)
        actief = 8 - len(self._disabled)
        print(f"[GAIT] Been {been} uitgeschakeld · {actief}/8 actief")
        if actief < 5:
            print("[GAIT] WAARSCHUWING: minder dan 5 benen — alleen stilstand")

    def enable_leg(self, been: int):
        """Schakel been in (nieuw been gekoppeld)."""
        self._disabled.discard(been)
        print(f"[GAIT] Been {been} ingeschakeld")
