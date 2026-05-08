# Laser Communication System
## Chrystal Moon Base — Robot Communication Concept

**Status:** Concept proposal 
**Author:** Berechja Kerkdijk 
**Licence:** CC0

---

## Philosophy — Laser Only

The CMB-R1 communicates exclusively via laser. No radio systems are used between robots or between robots and the mast. This is a deliberate architectural decision based on the specific advantages of the lunar environment.

---

## Why Laser on the Moon

The Moon provides ideal conditions for laser communication that do not exist on Earth:

**No atmosphere:** Zero atmospheric absorption, scattering, or turbulence. A laser beam on the Moon travels with essentially no propagation loss. On Earth, atmosphere, weather, and thermal turbulence severely limit laser communication range and reliability.

**No interference:** Multiple robots operating laser links simultaneously do not interfere with each other — laser beams are directional and do not create the radio frequency congestion that would occur with multiple radio transmitters in close proximity.

**High bandwidth:** Laser communication carries vastly more data than radio at equivalent power levels. The CMB-R1 sensor suite — particularly the Watcher head — generates large data volumes. Laser is the only practical way to transmit this data efficiently.

**Low power:** A communication laser operates at milliwatts. The sintering laser operates at kilowatts. The same physical principle, a factor of one million difference in power. Communication laser power is negligible in the overall robot power budget.

**No heavy hardware:** No radio antenna arrays. No frequency coordination. No regulatory spectrum allocation. Simple, light, reliable optical transceivers.

---

## Communication Architecture

### Level 1 — Internal (within each robot)
All sensor data from all 25 segment units (chassis + 3 segments × 8 legs) flows internally within the robot via the structural data network. The onboard AI processes this data locally. Raw sensor streams never leave the robot — only processed, prioritised summaries are transmitted externally.

### Level 2 — Robot to Robot (direct laser)
Robots communicate directly with each other via short-range laser links between chassis receiver surfaces. This does not require the mast — robots in proximity form a local mesh network.

This direct link serves:
- Swarm coordination between nearby robots
- Watcher robot transmitting health assessments to patient robots
- Immediate coordination during time-critical operations
- Continued swarm function if the mast is unavailable

### Level 3 — Robot to Mast (primary uplink)
Each robot maintains a laser link to the nearest available BSM on the mast. The mast aggregates all robot data and manages the Earth uplink.

### Level 4 — Robot to Earth (direct, when possible)
If energy budget permits, each robot can transmit directly to Earth independently of the mast. This provides a backup communication path if the mast fails.

**The mast is a relay, not a dependency.** If the mast fails:
- Robots continue communicating directly with each other
- Robots attempt direct Earth communication if energy permits
- The swarm continues operating autonomously on last known task assignments
- Nothing stops

---

## Data Priority — Quality of Service

When multiple robots compete for uplink bandwidth, data is prioritised by urgency:

**Priority 1 — Immediate transmission regardless of queue:**
- Emergency alerts — leg lost, robot stuck, thermal overheating, structural failure
- Safety-critical sensor readings outside safe parameters
- Mast system alerts

**Priority 2 — Transmit within current communication window:**
- Watcher terrain scan data — new findings, unexpected features
- Construction quality assessment — sintering results, crack detection
- Robot health summaries — degraded performance flags

**Priority 3 — Transmit when bandwidth available:**
- Routine sensor data within normal parameters
- Construction progress metrics
- Scientific observations
- Full Watcher data archives for bulk download

The AI on each robot classifies its own data by priority. The swarm coordinator manages the queue. Emergency data from any robot preempts all lower-priority transmissions instantly.

---

## The Same Receivers for Power and Data

The distributed GaAs photovoltaic cells across the chassis and upper leg segments serve dual purpose — they receive both laser power and laser communication signals.

Power delivery and data communication use different wavelengths on the same optical path. The onboard optics separate the wavelengths — power wavelength to the power conditioning system, communication wavelength to the data processing system.

This eliminates the need for separate communication antennas or receivers. The power reception infrastructure is the communication infrastructure.

---

## Mast to Earth — Ka-band Radio

The mast communicates to Earth via Ka-band radio antenna at the mast top. Laser-to-Earth communication at the Earth-Moon distance is not yet mature enough for operational use and is not part of the current concept.

The round-trip communication delay to Earth is 2.6 to 5.2 seconds depending on orbital geometry. This delay means Earth cannot provide real-time control of any robot operation. All time-critical decisions are made autonomously by the robot AI or swarm coordinator. Earth provides strategic oversight, parameter updates, and responds to non-time-critical queries.

---

## Open Questions

1. What specific laser wavelengths optimally serve both power delivery and data communication on the same optical path with practical separation hardware?
2. What is the maximum direct robot-to-robot laser communication range across the sintered basalt work surface with typical Peary rim illumination geometry?
3. What optical transceiver design allows a robot to communicate with multiple other robots and the mast simultaneously?
4. Can direct robot-to-Earth laser communication be practically achieved within the robot power budget, and what pointing accuracy is required?
