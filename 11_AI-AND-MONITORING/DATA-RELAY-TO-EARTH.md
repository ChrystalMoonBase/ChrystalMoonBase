# Data Relay to Earth
## Chrystal Moon Base — Communications

**Status:** Concept proposal  
**Licence:** CC0

---

## Communication Architecture

The base maintains continuous communication with Earth via the Ka-band antenna on the mast top. From the near-side Peary rim, Earth is always visible — there is no communication blackout period (a significant advantage over far-side locations).

**One-way signal delay:** 1.3–2.6 seconds (depending on Earth-Moon distance in current orbital position)
**Round-trip delay:** 2.6–5.2 seconds

This delay prevents real-time human control of anything on the base. All systems are designed to operate autonomously. Earth provides oversight, parameter updates, and support — not control.

---

## Data Transmitted to Earth

**Continuous (low bandwidth):**
- Base status summary (all monitored parameters, compressed)
- Robot positions and status
- Construction progress metrics
- Life support system status

**Scheduled windows (medium bandwidth):**
- Watcher robot sensor data (compressed)
- Scientific observations
- Resident personal communications (video, voice, data — during allocated personal communication windows)
- Engineering analysis data

**Priority transmission (interrupt any other traffic):**
- Safety alerts (Level 3 and 4)
- Emergency communications
- Critical system failure data

**Bulk download (high bandwidth windows):**
- Full sensor data archives from Watcher robots
- Construction imagery and video
- Scientific datasets

---

## Earth-Side Teams

Earth-side engineering teams review transmitted data continuously during their working hours. Multiple teams across time zones ensure near-continuous Earth-side coverage.

Their responsibilities:
- Review Watcher quality control data and identify construction issues
- Analyse system performance and recommend parameter adjustments
- Respond to information requests from the base
- Monitor safety data and flag concerns

Earth-side teams can send updated parameters and software to the base at any time. Changes to safety-critical systems require a defined approval process before transmission.

---

## Open Science

All non-personal base data — construction progress, environmental monitoring, scientific observations, system performance — is published openly on a time-delayed basis (delay TBD based on operational considerations).

The Chrystal Moon Base is a shared project. Its data belongs to everyone.
