# Data Relay to Earth
## Chrystal Moon Base — Communications

**Status:** Concept proposal  
**Licence:** CC0

---

## Communication Architecture

The base communicates with Earth via the Ka-band antenna on the mast top. Peary sits on the near-side **limb** of the Moon as seen from Earth: from the elevated rim peaks, Earth is visible **low on the horizon for a large fraction of the time** — a significant advantage over far-side locations, which never see Earth directly.

However, "always visible" cannot be assumed. Because Earth sits low over the polar horizon, lunar libration (the Moon's slight wobble) and local terrain can interrupt the direct line of sight at times. The exact **percentage of Earth-visibility** from the chosen peak(s) must be confirmed against real LOLA topography — for comparison, south-pole studies estimate ~50% from some crater rims up to ~93% from elevated massifs. The four "peaks of eternal light" on Peary's rim give multiple line-of-sight chances; only one peak needs Earth visibility at a time, since the whole base is interconnected.

**Two independent paths to Earth (robustness):**
1. **Direct link** from the rim peaks whenever Earth is in view. Data is buffered and sent when line of sight exists — adequate because CMB sends data in batches, not as real-time control.
2. **Relay satellite** to cover the gaps. Lunar relay infrastructure now exists: ESA's **Lunar Pathfinder** (operational 2026) and the wider **Moonlight** constellation (full service ~2030) provide communications relay as a *service* — no need to build it. Caveat: Moonlight currently prioritises the **south** pole; north-pole coverage for Peary must be confirmed with ESA. Until then the direct link is primary and the relay is a future enhancement.

**Signal delay:** ~1.3 s one-way, ~2.6 s round-trip (light-time at the average Earth–Moon distance; varies slightly with orbital position). In practice add processing and relay overhead.

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
