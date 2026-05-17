# CMB8LF v1 — Software

**Platform:** Raspberry Pi Pico W · MicroPython  
**Status:** Work in progress — not yet tested on hardware  
**Licence:** CC0

## Bestanden

| Bestand | Functie |
|---|---|
| `config.py` | Pinout, servo-typen, power-rails, kalibratie |
| `pca9685.py` | PCA9685 PWM driver met failsafe |
| `servo.py` | Type-bewuste servo klasse (DS3240/DS3225/DS3218) |
| `leg.py` | Inverse kinematica per poot |
| `gait.py` | Tripod, wave, thermal-aware gait |
| `thermal.py` | Temperatuurbewaking, cooldown posture, vacuümtest protocol |
| `safety.py` | Failsafe, VoltageWatcher, MovementManager |
| `servo_limiter.py` | DualRailServoLimiter — 3 sub-rails, hardware-veilig |
| `main.py` | Boot, self-test, main loop |
| `web.py` | WiFi AP + web dashboard |

## Power architectuur

```
Pack 1 → BMS → Buck A 7.4V/20A (DS3240/DS3225 poten 1-4)
              → Buck C 6.0V/10A (DS3218 alle poten)
Pack 2 → BMS → Buck B 7.4V/20A (DS3240/DS3225 poten 5-8)
              → Buck D 5.0V/10A (Pi5, Pico, sensoren)
```

Packs nooit parallel. Strict domain separation.
