# CMB8LF v1 — Software

## Bestanden

| Bestand | Platform | Functie |
|---|---|---|
| `pi5_main.py` | Pi5 (Python 3.x) | Strategisch AI · CAN bus brug · navigatie |
| `main_v6.py` | Pico W #1 (MicroPython) | Wave gait · CAN master · sinter coördinatie |
| `safety_pico.py` | Pico W #2 (MicroPython) | E-stop · thermisch · web dashboard |
| `config_v6.py` | Pico W #1 (MicroPython) | Alle parameters en node IDs |
| `wave_gait_v6.py` | Pico W #1 (MicroPython) | Wave gait controller |
| `sinter_seq_v6.py` | Pico W #1 (MicroPython) | Laser sinter sequencer |
| `can_bus.py` | Pi5 (Python 3.x) | CAN bus communicatie laag |
| `moteus_ctrl.py` | Pi5 (Python 3.x) | moteus r4.11 interface |
| `rp2350_segment.py` | RP2350 (MicroPython) | Per-segment mini AI (×24) |
| `laser_palm_v6.py` | Palm RP2350 (MicroPython) | Laser palm driver (×2) |

## Installatie

### Pi5
```bash
pip install python-can asyncio pyserial
sudo ip link set can0 up type can bitrate 1000000
python pi5_main.py
```

### Pico W #1 (via Thonny)
Upload: `main_v6.py`, `config_v6.py`, `wave_gait_v6.py`, `sinter_seq_v6.py`

### Pico W #2 (via Thonny)
Upload: `safety_pico.py`, `config_v6.py`

### Elk RP2350 segment (via Thonny)
Upload: `rp2350_segment.py` — pas `SEGMENT_ID` en `SEGMENT_TYPE` aan per segment

### Palm RP2350's (via Thonny)
Upload: `laser_palm_v6.py` — pas `PALM_ID` aan (1 of 2)

## Web Dashboard
Verbind met WiFi: **CMB8LF-v1** · Wachtwoord: **moonbase2026**
Open browser: **http://192.168.4.1**

## Spectroscopische Sensor Suite (v1 update)

| Bestand | Platform | Functie |
|---|---|---|
| `spectroscopy_v1.py` | Pi5 (Python 3.x) | HSI hyperspectrale camera — mineralogische kaart voor SLAM |
| `palm_spectroscopy.py` | Palm RP2350 (MicroPython) | SWIR + Micro-LIBS — pre-sinter check + oxidesamenstelling |

### Dataflow principe (CAN bus bescherming)
```
HSI camera (USB3)      → Pi5 lokaal → mineralogische kaart → SLAM
SWIR spectrometer      → Palm RP2350 lokaal → ijs/vocht check
Micro-LIBS spectrometer → Palm RP2350 lokaal → oxidepercentages
                                              ↓ (alleen resultaat)
Palm RP2350 → CAN bus → Pi5
{"SiO2": 45.2, "Al2O3": 34.1, "CaO": 12.3, "ice": false, "l1_pulse_ms": 280}
```
Ruwe spectraaldata gaat NOOIT over de CAN bus.
