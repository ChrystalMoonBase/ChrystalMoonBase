# ============================================================
# CMB8LF v1 — spectroscopy_v1.py
# Gelaagde Spectroscopische Sensor Suite
# Layer 1: HSI hyperspectrale camera (Pi5)
# Layer 2: SWIR MEMS-FPI spectrometer (Palm RP2350)
# Layer 3: Micro-LIBS atomaire analyse (Palm RP2350)
#
# Data-architectuur:
#   Ruwe spectraaldata NOOIT over CAN bus
#   Lokale verwerking → alleen mineraalpercentages via CAN
#   Formaat: {"SiO2": 45.2, "Al2O3": 34.1, "CaO": 12.3, ...}
#
# Platform: Pi5 (Python 3.x) — voor HSI verwerking
# CC0 · Chrystal Moon Base · 2026
# ============================================================

import numpy as np
import time
import json
from typing import Optional

# ── HSI HYPERSPECTRALE CAMERA (Pi5 · USB3) ──────────────────
# Hardware: Ximea xiSpec / Imec mosaic snapshot sensor
# Interface: USB3 rechtstreeks op Pi5
# Verwerking: lokale mineralogische kaart via spectrale unmixing

class HSICamera:
    """
    Hyperspectrale micro-camera interface.
    Genereert realtime mineralogische kaart van omgeving.
    Output wordt gebruikt door SLAM voor routeplanning.

    Spectrale bereik: ~470-900nm (Imec mosaic filter array)
    Resolutie: snapshot (geen lijn-scan vereist)
    Framerate: 5-15 fps afhankelijk van resolutie
    Massa: <30 gram
    """

    # Spectrale handtekeningen Peary highland mineralen (genormaliseerd)
    # Gebaseerd op USGS Spectral Library + maanmonster data
    MINERAL_SIGNATURES = {
        "anorthosite":  [0.82, 0.85, 0.88, 0.90, 0.88, 0.84],  # hoge albedo, vlak
        "ilmenite":     [0.12, 0.13, 0.14, 0.15, 0.16, 0.17],  # donker, FeTiO3
        "pyroxene":     [0.35, 0.38, 0.42, 0.48, 0.45, 0.40],  # absorptie ~900nm
        "ice_h2o":      [0.70, 0.72, 0.65, 0.55, 0.48, 0.42],  # H2O absorptie
        "basalt_mare":  [0.25, 0.28, 0.32, 0.35, 0.33, 0.30],  # donkerder
    }

    BAND_CENTERS_NM = [470, 530, 580, 650, 750, 860]

    def __init__(self, device_id: int = 0):
        self.device_id = device_id
        self._cam      = None
        self._online   = False

    def connect(self) -> bool:
        """Verbind met Ximea xiSpec camera via USB3."""
        try:
            from ximea import xiapi
            self._cam = xiapi.Camera()
            self._cam.open_device_by_id(self.device_id)
            self._cam.set_exposure(15000)     # 15ms belichtingstijd
            self._cam.set_gain(0)
            self._cam.start_acquisition()
            self._online = True
            print("[HSI] Ximea xiSpec verbonden")
            return True
        except ImportError:
            print("[HSI] Ximea SDK niet gevonden — simulatie modus")
            self._online = False
            return False
        except Exception as e:
            print(f"[HSI] Verbindingsfout: {e}")
            return False

    def capture_cube(self) -> Optional[np.ndarray]:
        """
        Neem spectrale datacube op.
        Return: array (H, W, bands) of None bij fout.
        """
        if not self._online:
            return self._simulate_cube()
        try:
            img = xiapi.Image()
            self._cam.get_image(img)
            data = img.get_image_data_numpy()
            # Demosaïc spectrale kanalen uit mosaic patroon
            return self._demosaic_spectral(data)
        except Exception as e:
            print(f"[HSI] Capture fout: {e}")
            return None

    def _demosaic_spectral(self, raw: np.ndarray) -> np.ndarray:
        """
        Extracteer spectrale kanalen uit Imec mosaic sensorpatroon.
        Imec 4x4 tegel = 16 spectrale kanalen per 4x4 pixel blok.
        """
        h, w = raw.shape
        bands = 6  # vereenvoudigd voor dit gebruik
        cube = np.zeros((h//4, w//4, bands), dtype=np.float32)
        for b in range(bands):
            row, col = divmod(b, 4)
            cube[:, :, b] = raw[row::4, col::4].astype(np.float32) / 65535.0
        return cube

    def _simulate_cube(self) -> np.ndarray:
        """Gesimuleerde datacube voor testen zonder hardware."""
        cube = np.random.uniform(0.3, 0.9, (64, 64, 6)).astype(np.float32)
        # Voeg anorthosiet handtekening toe in centrum
        cx, cy = 32, 32
        for b, val in enumerate(self.MINERAL_SIGNATURES["anorthosite"]):
            cube[cx-5:cx+5, cy-5:cy+5, b] = val + np.random.normal(0, 0.02)
        return cube

    def analyse_mineralogy(self, cube: np.ndarray) -> dict:
        """
        Bereken mineralogische kaart via spectrale unmixing.
        Gebruikt lineair mengmodel: spectrum = som(fractie_i × handtekening_i)

        Return: dict met pixel-kaart per mineraal + dominante mineraal
        """
        h, w, bands = cube.shape
        minerals = list(self.MINERAL_SIGNATURES.keys())
        n_minerals = len(minerals)

        # Eindmembers matrix
        A = np.array([self.MINERAL_SIGNATURES[m]
                      for m in minerals]).T  # (bands, n_minerals)

        # Bereken fractionele abundantie per pixel (least squares)
        fractions = np.zeros((h, w, n_minerals), dtype=np.float32)
        for i in range(h):
            for j in range(w):
                pixel = cube[i, j, :]
                result, _, _, _ = np.linalg.lstsq(A, pixel, rcond=None)
                result = np.clip(result, 0, 1)
                if result.sum() > 0:
                    result /= result.sum()  # normaliseer naar 100%
                fractions[i, j, :] = result

        # Gemiddelde fractions voor hele scene
        mean_fractions = fractions.mean(axis=(0, 1))

        mineralogy = {
            minerals[i]: round(float(mean_fractions[i]) * 100, 1)
            for i in range(n_minerals)
        }
        dominant = max(mineralogy, key=mineralogy.get)

        return {
            "mineralogy_pct":  mineralogy,
            "dominant":        dominant,
            "ice_detected":    mineralogy.get("ice_h2o", 0) > 5.0,
            "ilmenite_pct":    mineralogy.get("ilmenite", 0),
            "timestamp":       time.time(),
        }

    def get_slam_labels(self) -> dict:
        """
        Volledige pipeline: opname → analyse → SLAM labels.
        Output direct bruikbaar voor Pi5 SLAM routeplanning.
        """
        cube = self.capture_cube()
        if cube is None:
            return {}
        result = self.analyse_mineralogy(cube)
        print(f"[HSI] Dominant: {result['dominant']} | "
              f"Ijs: {'JA' if result['ice_detected'] else 'nee'} | "
              f"Ilmeniet: {result['ilmenite_pct']:.1f}%")
        return result

    def disconnect(self):
        if self._cam and self._online:
            self._cam.stop_acquisition()
            self._cam.close_device()
        print("[HSI] Verbinding gesloten")


# ── MINERALOGY INTEGRATION MET SLAM ──────────────────────────

class MineralogyMapper:
    """
    Integreert HSI mineralogische data met SLAM kaart.
    Markeert ISRU-interessante zones voor autonome navigatie.
    Draait op Pi5 als achtergrondtaak.
    """

    PRIORITY_THRESHOLDS = {
        "ice_h2o":    5.0,    # >5% ijs → hoge ISRU prioriteit
        "ilmenite":   10.0,   # >10% ilmeniet → zuurstof-extractie potentieel
        "anorthosite": 60.0,  # >60% anorthosiet → goede sinterlocatie
    }

    def __init__(self, hsi: HSICamera):
        self.hsi    = hsi
        self.map    = {}  # {(x,y): mineralogy_result}
        self._zones = []  # lijst van ISRU-interessante zones

    def update_map(self, robot_x: float, robot_y: float):
        """Update mineralogische kaart op huidige robotpositie."""
        result = self.hsi.get_slam_labels()
        if not result:
            return
        self.map[(round(robot_x, 1), round(robot_y, 1))] = result
        self._classify_zone(robot_x, robot_y, result)

    def _classify_zone(self, x: float, y: float, result: dict):
        """Classificeer zone als ISRU-interessant."""
        min_map = result.get("mineralogy_pct", {})
        priority = 0

        if min_map.get("ice_h2o", 0) > self.PRIORITY_THRESHOLDS["ice_h2o"]:
            priority = 10  # hoogste prioriteit
        elif min_map.get("ilmenite", 0) > self.PRIORITY_THRESHOLDS["ilmenite"]:
            priority = 7
        elif min_map.get("anorthosite", 0) > self.PRIORITY_THRESHOLDS["anorthosite"]:
            priority = 5   # goed sintermateriaal

        if priority > 0:
            self._zones.append({
                "x": x, "y": y,
                "priority": priority,
                "mineralogy": min_map,
            })
            print(f"[MAPPER] ISRU zone gevonden @ ({x:.1f}, {y:.1f}) "
                  f"prioriteit {priority} — {result['dominant']}")

    def get_next_target(self) -> Optional[dict]:
        """Geef hoogste prioriteit ISRU zone terug voor navigatie."""
        if not self._zones:
            return None
        return max(self._zones, key=lambda z: z["priority"])

    def export_to_slam(self) -> list:
        """Exporteer alle zones als SLAM waypoints."""
        return sorted(self._zones,
                      key=lambda z: z["priority"], reverse=True)
