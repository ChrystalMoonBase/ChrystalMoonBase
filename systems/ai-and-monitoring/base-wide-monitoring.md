# Base-Wide Monitoring
## Chrystal Moon Base — Safety Architecture

**Status:** Concept proposal  
**Licence:** CC0

---

## What Is Monitored

Every physical system in the base is monitored continuously. Monitoring is not optional for any system that could affect resident safety.

**Atmospheric monitoring (every dome and tunnel section):**
- O₂ partial pressure
- CO₂ concentration
- Total pressure
- Humidity
- Temperature
- Particulate count (dust, smoke)

**Structural monitoring (dome shells and tunnel walls):**
- Strain gauges embedded in sintered regolith during construction
- Acoustic emission sensors (detect crack propagation)
- Pressure differential across dome shell

**Power systems:**
- Voltage and current at all distribution points
- Battery state of charge and health
- Solar curtain output
- Laser system status

**Water systems:**
- Flow rates in all distribution lines
- Water quality (pH, conductivity, contaminant flags)
- Cistern levels

**Robot status:**
- Position of all active robots
- Power level and charging status
- Active head type
- Fault flags

**Access and movement:**
- Position of all residents (via wearable transponders — required for safety)
- Status of all floor hatches and airlock cycles
- Access log for restricted zones

---

## Alert Levels

**Level 1 — Information:** Parameter outside normal range, no immediate risk. Log, display on monitoring dashboard, no automatic action.

**Level 2 — Warning:** Parameter approaching safety limit. Log, alert duty officer, automated advisory actions (e.g., increase ventilation).

**Level 3 — Alert:** Parameter at safety limit. Log, alert all residents in affected area, automated protective actions begin.

**Level 4 — Emergency:** Life-safety threat. Alert all residents base-wide, automated emergency actions execute immediately, Earth notified on next available uplink.

---

## Human-AI Relationship

At Level 1 and 2, humans decide. The AI informs and advises.
At Level 3, the AI acts and humans confirm or override.
At Level 4, the AI acts immediately. Humans can override after the fact, but the initial response is automated.

This hierarchy is not negotiable. An emergency that requires human deliberation before any action is taken will kill people faster than the deliberation time allows.
