# Power Budget — Phase 0.2 Pod
## Chrystal Moon Base — Phase 0.2 Systems

**Status:** Estimate — significant uncertainties noted  
**Licence:** CC0

---

## Summary

| Consumer | Estimated Draw | Notes |
|---|---|---|
| Laser system (fibre laser) | ~30 kW | Primary consumer |
| Base computer | ~0.5–1 kW | Mission AI, comms processing |
| Ka-band transmitter | ~0.5–1 kW | Varies with data rate |
| BSM actuators and electronics | ~0.5 kW total | 5 BSMs |
| Mast thermal management | ~0.5–1 kW | Heaters during shadow periods |
| Robot charging (8 units) | ~5–10 kW | Varies with charging schedule |
| **Total estimated draw** | **~37–44 kW** | |
| **Available from solar curtain** | **~32–36 kW** | |

---

## The Power Gap

The estimated total draw (37–44 kW) slightly exceeds the estimated available power (32–36 kW). This is a known issue with the current concept.

Possible resolutions:
1. **Not all robots charge simultaneously** — stagger charging so that at most 4 robots charge at any time, reducing charging draw to ~2.5–5 kW
2. **Laser operates at reduced power during charging** — prioritise charging during low-construction-demand periods (e.g., during the watcher quality assessment phase)
3. **Increase solar curtain area** — extend to 120 m² by adding an additional panel segment
4. **Improve laser efficiency** — newer laser systems may achieve >50% wall-plug efficiency

The power budget is the single most important engineering uncertainty in the Pod concept. It must be resolved in Demonstrator 2 (laser power beaming) and by detailed thermal-electrical modelling before any flight hardware is designed.

---

## Shadow Period Management

During the ~11% of the year when the Peary site is in shadow, the solar curtain produces no power. The Pod must survive these shadow periods.

**Shadow period protocol (proposed):**
- Laser system shuts down — no construction
- Robots halt at their current positions and enter hibernation mode (minimal power draw)
- Base computer reduces to minimal operation — keep-alive mode
- Mast heaters activate from battery reserve to prevent electronics from reaching minimum temperature limits
- On restoration of sunlight, system warms and restarts sequentially

**Battery reserve capacity:** Sufficient to power the mast heaters and minimal base computer for the longest expected shadow period. The longest single shadow period at the best Peary peaks is estimated at a few days based on published illumination data. Battery sizing for this requirement is an engineering trade.
