# Underground Network — Overview
## Chrystal Moon Base — Infrastructure Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Why Underground

The dome is strong because it has no penetrations. No doors in the wall. No windows that open. No cable entries. No pipe fittings through the shell. The dome is one continuous sealed surface from foundation ring to apex.

This means everything that needs to move between the inside of a dome and the outside world — people, robots, cargo, power, water, air, data — must go through the floor and then underground.

This is not a compromise. It is a structural principle. The underground network is the circulatory system of the base. The domes are organs sitting on top of it. Neither works without the other.

---

## Network Structure

The underground network consists of two distinct systems that share the same tunnel infrastructure but are physically separated:

### Utility Conduits
Pipes, cables, and ducts carrying:
- **Electrical power** — from the surface solar and laser power distribution system to each dome
- **Data cables** — fibre optic links connecting all domes, processing modules, surface systems, and the communications mast
- **Water supply and return** — potable water, dome layer water, waste water
- **Gas lines** — oxygen, nitrogen, and other atmospheric components from the processing modules to the domes
- **Thermal control lines** — coolant loops for temperature management

Utility conduits are sized for their specific function. They do not need to be human-accessible — they are robot-maintained. Inspection and repair robots can access them through dedicated access points at regular intervals.

### Transport Tunnels
Larger passages wide enough for:
- **CMB-R1 robots** — in any configuration, including carrying cargo with front limbs
- **Cargo containers** — maximum size equal to the largest container that can be delivered by the launch vehicles used. This ensures that anything arriving on the surface can be moved underground without repackaging.
- **People** — emergency movement between domes without surface exposure
- **Processing module installation** — modules are moved from the landing pad to their operational position entirely underground, pushed or carried by robot teams

Transport tunnels are the arteries of the base. The primary tunnel network connects all dome foundations, all processing module locations, both surface access facilities (arrival and departure pads), and all major storage areas.

---

## Tunnel Construction

Tunnels are constructed by CMB-R1 robots using a combination of:

1. **Regolith excavation** — bulldozer-head robots clear material to the required depth and width
2. **Wall sintering** — sintering-head robots fuse the tunnel walls, floor, and ceiling into solid basalt, providing structural integrity and dust elimination
3. **Utility installation** — conduits, cables, and pipes are installed by robots before the tunnel section is closed
4. **Floor finishing** — the tunnel floor is sintered to a smooth, load-bearing surface

All excavated regolith is stored in designated underground cisterns. Nothing is wasted — it becomes feedstock for the processing modules.

**Tunnel depth:** Deep enough to provide meaningful radiation shielding through the overlying regolith mass, and deep enough that surface temperature fluctuations do not penetrate to the tunnel environment. A minimum depth of 2–3 metres is estimated, with deeper tunnels providing better shielding. The optimal depth requires radiation transport modelling with actual Peary regolith data.

**Tunnel dimensions:** The transport tunnel minimum cross-section must accommodate the cargo container size constraint noted above. This is a hard design requirement — if the tunnel is too small for the largest arriving cargo item, that item cannot be integrated into the underground distribution system. The Falcon Heavy payload fairing inner diameter (~5.2m) is the likely upper bound on cargo container size; tunnels must be sized accordingly with margin.

---

## Restricted Zones

Not all tunnels are accessible to all personnel. The network includes:

**Unrestricted zones:** Main transport corridors, dome access points, cargo handling areas. Any authorised resident may use these.

**Restricted zones:** Utility conduit runs, power infrastructure, atmospheric systems, AI monitoring hardware, water storage cisterns, structural monitoring sensors. Access requires authorisation and is logged. Routine access is by maintenance robots only.

**Emergency access:** All restricted zones have emergency override capability — in a life-safety situation, any authorised person can access any part of the network. Emergency access events are automatically logged and reviewed.

The restricted zone policy exists not for secrecy but for safety. An unqualified person accessing the atmospheric control system or the power distribution infrastructure could cause cascading failures. The underground network is too critical to allow uncontrolled access.

---

## Surface Access — Two Separate Facilities

The underground network connects to the lunar surface at exactly two points. These facilities are physically separated and never directly connected to each other.

### Arrival Facility
All incoming traffic — cargo, people, equipment — enters through the arrival facility. The arrival underground access tunnel leads from the landing pad through a multi-stage decontamination sequence before connecting to the main network. Nothing and nobody enters the base network without passing through decontamination. See DECONTAMINATION-SEQUENCE.md for the full protocol.

### Departure Facility
All outgoing traffic — departing people, waste, samples for Earth, equipment being retired — exits through the departure facility. It connects to a separate launch pad.

**Why separate?** Mixing arrival and departure flows creates contamination risk and operational complexity. A cargo robot moving from the landing pad toward the base should never share a corridor with a departing rocket being fuelled. Clean flows and dirty flows are kept apart from day one.

---

## Dust Management

All excavated material is treated as a resource. The base operates a zero-waste underground logistics cycle:

- Excavated regolith → underground cisterns → feedstock for M-modules
- Dust captured in decontamination → collection system → reprocessed
- Sintering byproducts → collected by Watcher robots → stored or reprocessed

Nothing leaves the base that could have been used. The underground storage cisterns are sized to accumulate material over years of construction before processing capacity becomes available.

---

## AI Monitoring in the Network

The underground network is continuously monitored by the base AI. Every tunnel section has:
- Atmospheric sensors (O2, CO2, pressure, temperature, humidity)
- Structural sensors (strain gauges embedded in sintered walls during construction)
- Radiation monitors
- Motion detection
- Visual cameras at junctions

The AI monitors for:
- Pressure drops indicating a breach
- Structural strain indicating settling or thermal movement
- Unexpected access to restricted zones
- Environmental conditions outside normal parameters

Alerts are immediate and automatic. Human review follows. The AI does not make decisions about how to respond to alerts — it alerts, and humans decide. The exception is immediate life-safety responses (dome pressure drop, fire, atmospheric contamination) where the AI acts first and reports simultaneously.

---

## Open Questions

1. **Tunnel depth optimisation** — what depth achieves the radiation shielding target at minimum excavation cost?
2. **Sintered tunnel structural limits** — what span widths can sintered basalt tunnel sections achieve without additional support structure?
3. **Cargo container size constraint** — what is the maximum cargo container size that can realistically be landed on the Peary rim and transported underground?
4. **Thermal gradient management** — at what depth does the lunar surface temperature variation become negligible for tunnel environment management?
5. **Utility conduit routing** — what separation distance is required between high-voltage power cables and sensitive data cables to prevent interference?
