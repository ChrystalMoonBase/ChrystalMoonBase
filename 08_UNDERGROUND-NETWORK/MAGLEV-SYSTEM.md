# Maglev Transport System
## Chrystal Moon Base — Transport Infrastructure Concept

**Status:** Concept proposal  
**Author:** Berechja Kerkdijk  
**Licence:** CC0

---

## Philosophy

All transport on and between Chrystal Moon Base locations uses magnetic levitation (maglev). No wheels. No combustion. No mechanical contact between vehicle and track. One system, one standard, everywhere humans need to go — from a single dome to the equatorial spaceport thousands of kilometres away.

This is not an engineering convenience. It is a deliberate civilisation decision: the transport infrastructure of a lunar civilisation should be clean, silent, maintenance-minimal, and built from local materials where possible.

---

## Why Maglev Is the Right Choice for the Moon

The Moon provides conditions that make maglev more practical there than almost anywhere on Earth:

**No atmosphere:** Zero air resistance. On Earth, maglev trains are limited partly by aerodynamic drag at high speed. On the Moon, there is no drag. A maglev vehicle can theoretically reach any speed the track and passenger comfort allow.

**1/6 gravity:** The levitation force required is one sixth of what Earth maglev requires. Simpler magnets, less energy, lighter track structure.

**Vacuum aids superconductors:** Superconducting magnets — which provide the most powerful and efficient levitation — perform best cold. The lunar environment provides cold for free, particularly in shaded areas and underground.

**Dust:** Lunar dust is electrostatically charged and jumps constantly off the surface. A ground-level track would accumulate dust continuously. An **elevated track** — even 0.5–1 metre above the surface — sits above the worst of the electrostatic dust layer. Elevation is the natural solution.

**No weather:** No ice, no rain, no wind. The track requires no weather protection. Maintenance needs are minimal.

---

## Network Scope

The maglev network is conceived at three scales:

### Scale 1 — Within-Base Network (underground)
Connects all domes, processing modules, medical facilities, farm domes, aquaculture domes, and terminal stations within a single base location. Runs entirely underground in pressurised sintered basalt tunnels. Carries people and cargo silently between all base facilities without any surface exposure.

### Scale 2 — Base to Surface Facilities (short surface routes)
Connects the underground base network to the arrival pad, departure pad, and any surface installations. Transitions from underground to elevated surface track. Pods remain pressurised throughout — passengers never need suits for this transit.

### Scale 3 — Inter-Provincial Network (long-distance surface)
Eventually connects the four provinces of the lunar civilisation:
- Peary Solar Capital (88.6°N) → Equatorial Gateway Plains (~2,600 km)
- Equatorial Gateway Plains → Far-Side Departure Gate
- Peary Solar Capital → Water Treasury (South Pole, ~4,000 km via surface)

At 1,000–2,000 km/h in vacuum, Peary to the equatorial zone takes 1.5–3 hours. The lack of atmosphere makes these speeds achievable without enormous energy cost.

**Long-distance track construction:** Built by CMB-R1 robots from local sintered basalt and locally produced aluminium and steel. Support pillars at regular intervals elevate the track above the dust layer. The track is built incrementally — first the route to the nearest facility, then extended over decades as the network grows.

---

## Track Design

**Elevated, not ground-level:** All surface tracks are elevated on sintered basalt pillars. Elevation height: minimum 0.5 metres, preferably 1 metre above the local surface. This clears the electrostatic dust layer and provides better thermal stability than ground contact.

**Pillar material:** Sintered basalt — produced in situ by CMB-R1 robots. The track infrastructure is built from the Moon itself.

**Track standard:** A single published interface standard for the track geometry, magnetic field configuration, and power supply. Any maglev pod built to this standard can run on any section of the network. This is the open infrastructure principle applied to transport.

**Underground sections:** Within the base, tracks run in pressurised sintered basalt tunnels. The tunnel cross-section is sized to accommodate the largest cargo pod in the network, with clearance for maintenance robots.

---

## The Pods

**Passenger pods:** Small pressurised glass capsules — the same five-layer glass construction as the domes, scaled down to pod size. Transparent. Passengers travel in shirtsleeves, watching the lunar landscape through the glass at high speed. Capacity: 6–10 people per pod.

**Cargo pods:** Unpressurised flat-bed or container pods carrying equipment, modules, food, and materials between locations. Standardised container interface.

**Sleeping pods:** See GRAVITY-COUNTERMEASURE-MAGLEV-BEDS.md — a specialised application of the maglev system for gravity countermeasure during sleep.

---

## Terminal Stations

Every maglev terminal is located:
1. **Underground** — no surface access required to board or exit
2. **Behind the decontamination barrier** — on the dirty side, between the surface/maglev environment and the clean base dome network

This means every person arriving at any base location via maglev must pass through the full decontamination sequence before entering the dome network. The maglev network is treated as a surface-equivalent environment — clean relative to the Moon, but dirty relative to the base interior.

**Terminal layout:**
```
CLEAN BASE NETWORK
        ↕
DECONTAMINATION SEQUENCE (full protocol)
        ↕
MAGLEV TERMINAL (dirty side)
        ↕
MAGLEV POD (sealed, pressurised)
        ↕
MAGLEV TRACK
```

This applies at every location in the network — no exceptions. The decontamination protocol does not change because the transit was "only underground" or "only between base locations." Any maglev transit is a potential contamination pathway and is treated accordingly.

---

## Power Supply

The maglev system draws power from the base power grid — initially the mast laser power system, later the expanded solar and storage infrastructure. Power is distributed to the track via conductors embedded in the track structure.

Energy recovery: braking pods regenerate power back into the grid — the same principle as regenerative braking in electric vehicles. At the speeds and distances involved, regenerative recovery is significant and must be included in the power budget.

---

## Construction Sequence

The maglev network is built in phases matching the base construction sequence:

1. **Phase 1.1** — First within-base tunnel segments connecting the initial dome cluster to the surface access pads
2. **Phase 1.2** — Full within-base network connecting all domes, processing modules, and facilities
3. **Phase 2** — Network extended to the full Phase 2 base footprint
4. **Phase 3** — Long-distance surface routes to the equatorial spaceport begin construction
5. **Phase 4+** — Inter-provincial network connecting all four civilisation provinces

---

## Open Questions

1. What maglev technology variant — electromagnetic suspension (EMS), electrodynamic suspension (EDS), or permanent magnet — is optimal for the lunar environment? The vacuum and temperature range favour superconducting EDS.
2. What speed limits apply to passenger comfort given the Coriolis effect in the rotating Moon reference frame at high speeds?
3. How are track sections maintained and repaired when damaged — by micrometeorite impact or thermal stress — in a location that may be far from the base?
4. What is the realistic track construction rate achievable by CMB-R1 robots, and how does this set the timeline for long-distance network expansion?
5. What communication and signalling system manages pod traffic across a network spanning thousands of kilometres with a 2.5-second Earth communication delay?

Engineers with maglev, superconductor, or rail infrastructure expertise are specifically invited to engage with these questions.
