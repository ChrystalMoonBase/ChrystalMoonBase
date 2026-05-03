# Safety Systems
## Chrystal Moon Base — Emergency Response

**Status:** Concept proposal  
**Licence:** CC0

---

## The Design Principle

Every safety system assumes it will fail. There is always a backup. The base is designed so that the failure of any single safety system does not result in loss of life — it results in a degraded state that triggers human attention and allows time to respond.

---

## Dome Pressure Loss

**Detection:** Pressure drop rate > 0.1 kPa/minute triggers Level 3 alert.

**Automated response:**
1. Alert all residents in dome — evacuate via floor hatch immediately
2. Floor hatch to underground opens automatically
3. Adjacent dome sections notified — prepare for possible additional evacuees
4. Leak location estimated from pressure gradient data in tunnel network

**Human response:**
- Residents evacuate to underground network
- Duty engineer assesses leak magnitude and location
- Repair decision: seal and re-enter vs. abandon dome temporarily

**Design safeguard:** The dome is designed so that small leaks (micrometeorite, small crack) result in slow pressure drop — giving residents minutes to evacuate calmly, not seconds in a catastrophic failure.

---

## Atmosphere Contamination

**Detection:** Any hazardous gas above threshold triggers Level 3 alert. CO₂ > 1% triggers Level 3. Smoke detection triggers Level 4.

**Automated response:**
1. Isolate dome atmosphere from base network
2. Activate emergency ventilation if available
3. Alert all residents — move to emergency air supply points

**Emergency air:** Each dome has a sealed emergency air supply (compressed oxygen/nitrogen) sufficient for all residents for a defined time period, independent of the base atmosphere system.

---

## Power Failure

**Detection:** Main power bus loss.

**Automated response:**
1. All life-critical systems (atmosphere management, heating, emergency lighting, communications) switch to battery backup automatically
2. All non-critical systems shut down to conserve battery
3. Alert duty engineer

**Battery backup duration:** Sufficient to survive the longest expected shadow period (several days) at minimum life-support power draw. This is a design requirement, not a current specification.

---

## Medical Emergency

Medical AI assists but does not replace human medical judgment. The base medical system includes:
- AI-assisted diagnosis using vital sign data, symptom input, and medical database
- Telemedicine consultation with Earth physicians (with 2.5-second communication delay)
- Onboard surgical capability (in medical dome)
- Pharmacy and treatment protocols

No patient is ever treated by AI alone for a serious condition. The AI provides information, recommends protocols, and monitors — a human physician or medic makes the treatment decisions.
