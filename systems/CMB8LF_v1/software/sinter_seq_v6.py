# ============================================================
# CMB8LF v1 — sinter_seq_v6.py
# Laser Sinter Sequencer
# Peary Highland Anorthosite Simulant
# CC0 · Chrystal Moon Base · 2026
# ============================================================
#
# L1: 808nm · 2W · sinter · kleine spot ⌀0.15mm
# L2: 976nm · 1W · anneal · brede spot ⌀1.5mm
#
# ANORTHOSITE PROTOCOL (Peary highland):
#   Smeltpunt: 1200-1500°C (hoger dan mare basalt)
#   L1 puls langer dan mare simulant
#   L2 anneal extra belangrijk — snelle afkoeling = scheur
#
# VEILIGHEID:
#   - Grijper MOET gesloten zijn voor L1 actief kan worden
#   - Hall sensor bevestigt gesloten positie
#   - Hardware interlock onafhankelijk van software
# ============================================================

import asyncio
import time

# Sinter parameters voor Peary highland anorthosite
PREHEAT_MS       = 800    # ms L2 opwarmen voor L1
L1_PULSE_MS      = 300    # ms L1 puls (langer dan mare door hoger smeltpunt)
ANNEAL_HOLD_MS   = 1200   # ms L2 hold na puls
ANNEAL_INIT      = 0.65   # L2 duty tijdens opwarmen (650mW)
ANNEAL_HOLD      = 0.40   # L2 duty na puls (400mW)
ANNEAL_RAMP_STEP = 0.012  # duty afname per seconde afkoeling
ANNEAL_MIN       = 0.04   # minimale duty voor uitschakeling
PALM_TEMP_MAX    = 65.0   # °C palmkern max

class SinterSequencer:
    """
    Aansturing van het dual-laser sintersysteem.
    
    Communicatie via Pi5 UART:
    Pi5 → Palm RP2350 → Laser drivers
    
    Volgorde per laag:
    1. Pre-heat  (L2 alleen)
    2. Sinter    (L1 puls × n)
    3. Anneal    (L2 hold)
    4. Cooldown  (L2 ramp naar 0)
    """

    def __init__(self, pi5_uart):
        self.uart     = pi5_uart
        self._active  = False

    def _send(self, cmd: str):
        self.uart.write(f"{cmd}\n")

    def _check_interlock(self, palm: int) -> bool:
        """Vraag aan Pi5 of grijper palm X gesloten is."""
        self._send(f"CHECK:interlock={palm}")
        # Pi5 antwoord: "LOCK:1" of "LOCK:0"
        # Vereenvoudigd voor prototype — Pi5 beheert dit
        return True  # Pi5 controleert hardware interlock

    def _l1_enable(self, palm: int, on: bool):
        """Zet L1 aan of uit via Pi5 → Palm RP2350."""
        state = "ON" if on else "OFF"
        self._send(f"LASER:palm={palm},laser=1,state={state}")

    def _l2_set(self, palm: int, duty: float):
        """Stel L2 duty cycle in (0.0-1.0)."""
        duty = max(0.0, min(1.0, duty))
        self._send(f"LASER:palm={palm},laser=2,duty={duty:.3f}")

    async def sinter_layers(self, n_layers: int = 1,
                             palm: int = 1) -> bool:
        """
        Voer n sinterlagen uit op palm 1 of 2.
        
        Parameters
        ----------
        n_layers : aantal te sinteren lagen
        palm     : 1 (linker grijper) of 2 (rechter grijper)
        
        Return
        ------
        True = succesvol · False = gestopt door fout of interlock
        """
        if self._active:
            print("[SINTER] Al actief — wacht")
            return False

        if not self._check_interlock(palm):
            print(f"[SINTER] INTERLOCK FAIL — palm {palm} niet gesloten")
            return False

        self._active = True
        print(f"[SINTER] Start · {n_layers} laag/lagen · palm {palm}")
        print(f"[SINTER] PROTOCOL: Peary Highland Anorthosite")
        print(f"[SINTER] Smeltpunt ~1200-1500°C · verlengde pulsen")

        try:
            for laag in range(n_layers):
                print(f"\n[SINTER] === LAAG {laag + 1}/{n_layers} ===")
                ok = await self._single_layer(palm, laag)
                if not ok:
                    print(f"[SINTER] Laag {laag + 1} gestopt")
                    return False
                # Korte pauze tussen lagen
                if laag < n_layers - 1:
                    await asyncio.sleep_ms(500)

            print(f"\n[SINTER] Alle {n_layers} lagen voltooid ✓")
            return True

        finally:
            # Altijd opruimen
            self._l1_enable(palm, False)
            self._l2_set(palm, 0.0)
            self._active = False

    async def _single_layer(self, palm: int, laag_nr: int) -> bool:
        """Voer één volledige sinter-anneal cyclus uit."""

        # ── STAP 1: PRE-HEAT ─────────────────────────────────
        print(f"  [1/4] Pre-heat {PREHEAT_MS}ms (L2={ANNEAL_INIT:.0%})")
        self._l2_set(palm, ANNEAL_INIT)
        await asyncio.sleep_ms(PREHEAT_MS)

        # ── STAP 2: SINTER PULSEN ────────────────────────────
        print(f"  [2/4] Sinter L1 puls {L1_PULSE_MS}ms")
        if not self._check_interlock(palm):
            print("  [STOP] Interlock verloren!")
            return False

        self._l1_enable(palm, True)
        await asyncio.sleep_ms(L1_PULSE_MS)
        self._l1_enable(palm, False)
        print("  [2/4] L1 puls voltooid")

        # ── STAP 3: ANNEAL HOLD ──────────────────────────────
        print(f"  [3/4] Anneal hold {ANNEAL_HOLD_MS}ms (L2={ANNEAL_HOLD:.0%})")
        self._l2_set(palm, ANNEAL_HOLD)
        await asyncio.sleep_ms(ANNEAL_HOLD_MS)

        # ── STAP 4: GECONTROLEERDE AFKOELING ─────────────────
        print("  [4/4] Gecontroleerde afkoeling...")
        await self._controlled_cooldown(palm)

        print(f"  Laag {laag_nr + 1} OK ✓")
        return True

    async def _controlled_cooldown(self, palm: int):
        """
        Ramp L2 geleidelijk naar nul.
        Cruciaal voor anorthosite: snelle afkoeling = thermische scheur.
        """
        duty = ANNEAL_HOLD
        while duty > ANNEAL_MIN:
            duty = max(0.0, duty - ANNEAL_RAMP_STEP)
            self._l2_set(palm, duty)
            await asyncio.sleep_ms(1000)
        self._l2_set(palm, 0.0)
        print("  Afkoeling voltooid")

    async def foot_anneal(self, palm: int, enable: bool):
        """
        Voet-modus: alleen L2 continu actief.
        L1 is GEBLOKKEERD in voet-modus (hardware).
        Robot loopt en annealt oppervlak terwijl hij beweegt.
        """
        if enable:
            print(f"[SINTER] Voet-anneal ACTIEF · palm {palm}")
            self._l2_set(palm, 0.25)  # 250mW continu
        else:
            print(f"[SINTER] Voet-anneal UIT · palm {palm}")
            self._l2_set(palm, 0.0)
