CMB-R1 — Construction Robot Specification
Chrystal Moon Base · Open-Source Concept Document
Version: 0.1 (Concept — Not a Construction Plan)  
Author: Berechja Kerkdijk, Founder, Chrystal Moon Base  
License: Creative Commons Attribution 4.0 International (CC BY 4.0)  
Status: Open for engineering review and contribution
---
> *This document describes the intended design of the CMB-R1 construction robot as conceived by the project founder. It is a vision document, not an engineering specification. Every number here is an estimate. Every system described here requires qualified engineering validation before it can be trusted in a mission context. If you find an error, it is mine, and I welcome the correction.*
---
1. Purpose and Role
The CMB-R1 is the primary autonomous construction robot of the Chrystal Moon Base system. Eight units are carried inside the MAST-POD and deployed after the mast is operational and the laser power link is confirmed.
The robots have one primary mission: build a permanent sintered basalt floor around the MAST-POD, growing outward ring by ring for as long as the system operates.
Everything the CMB-R1 does must be possible without human intervention, without consumables shipped from Earth, and without any material that would contaminate or compromise the lunar surface environment.
---
2. Design Philosophy
Autonomous from day one. The CMB-R1 must be capable of full independent operation from the moment it walks out of the pod. No teleoperation. No human in the loop for operational decisions.
Survive first, work second. The robot must be able to enter hibernation and survive the worst-case thermal environment at the Peary Crater rim with no external power input. Survival takes priority over productivity.
Modular by design. Every major subsystem — the head, each leg segment, the body panels — is designed to be replaceable by another CMB-R1 without human assistance. A robot that loses a component continues working with what it has.
No oils. No fuels. No consumables. All actuation is electric. All lubrication is either eliminated through frictionless design or replaced by solid-state alternatives. Nothing that can freeze, evaporate, or contaminate.
Built from what is there. The exterior armour of the CMB-R1 is sintered basalt — the same material the robots produce. The Moon provides its own protection.
---
3. General Specifications
Parameter	Value	Notes
Mass	~300 kg	Unvalidated estimate — engineering review required
Locomotion	8-legged octopod	6 legs for walking, 2 front legs dual-function as arms
Power source (primary)	Laser power beaming from mast	GaAs receiver array on body exterior
Power source (secondary)	Body-mounted photovoltaic panels	For locomotion and basic systems only
Power storage	Solid-state batteries in every segment	Hibernation and gap coverage
Operating temperature range	-200°C to +120°C	Peary Crater rim worst-case
Hibernation capability	Required	Must survive darkest period with no external power
Head design	Interchangeable modular head	Task-specific tooling in head, chassis fully autonomous without it
Exterior material	Sintered lunar basalt panels	Radiation shielding, thermal mass, produced on-site
Internal insulation	Aerogel — minimum 8 cm thickness	Four times thicker than Mars rover standard
---
4. Body Structure
4.1 The Skeleton (Primary Frame)
The structural skeleton of the CMB-R1 carries all critical systems internally. No electronics, motors, batteries, or sensors are mounted on the exterior of the frame. Everything vulnerable is inside.
The skeleton design priority, in order:
Internal routing of all cables and data lines
Internal mounting of all electronics and processors
Internal mounting of all battery cells
Structural integrity under maximum leg load
Minimised thermal bridging between interior and exterior
The skeleton material is an open engineering question. Candidates include titanium alloy, carbon-fibre reinforced PEEK, and sintered basalt composite. The material must retain structural integrity across the full operating temperature range without creep or embrittlement.
This is an open question for materials engineers.
4.2 Internal Protection Layers
Moving outward from the skeleton:
Layer 1 — Skeleton  
All electronics, batteries, and sensitive components mounted internally.
Layer 2 — Aerogel (minimum 8 cm)  
Based on the Mars rover heritage where 2 cm aerogel provided sufficient thermal protection at Martian conditions. Lunar conditions are significantly more extreme: lower minimum temperatures, harder vacuum, and no atmospheric convection. A minimum of 8 cm aerogel is specified. The exact composition and density required for lunar vacuum operation at -200°C is an open engineering question.
Layer 3 — Sintered Basalt Exterior Panels  
The outermost layer consists of sintered basalt panels produced by the robots themselves from local lunar regolith. Basalt provides:
Radiation shielding (partial — not a primary radiation strategy)
Thermal mass — slows temperature swings
Mechanical protection against micrometeorite impacts and dust abrasion
No Earth import required — fully produced on-site
The attachment mechanism for basalt panels to the aerogel layer, and the thermal expansion differential between basalt and the underlying structure across the temperature range, are open engineering questions.
4.3 Frictionless Operation
The CMB-R1 must operate without any oil-based lubrication. Oils freeze, evaporate in vacuum, and contaminate the regolith. All moving interfaces must use one of the following approaches:
Magnetic bearings — contactless, zero friction, zero wear (preferred where technically feasible)
Ceramic dry bearings — proven in vacuum applications, no lubrication required
Bistable latching mechanisms — for connection points that must lock and hold
The specific bearing design for each joint is an open engineering question.
---
5. Power Systems
5.1 Primary Power — Laser Receiver Array
The primary power input to the CMB-R1 is laser power beaming from the MAST-POD. The mast delivers approximately 13.5 kW of optical power to the robot fleet.
Receiver design (concept):  
The laser receiver is not a single panel facing the mast. It is an array of GaAs photovoltaic converter segments covering the entire exterior surface of the body. The intent is that no matter the orientation of the robot relative to the mast — regardless of which direction it is facing or what angle it is working at — some portion of the receiver array is always receiving the beam.
Each segment of the receiver array is independently connected. The AI selects the highest-output segments and routes their power to the active systems.
The body can also make micro-adjustments — estimated at 0.01 mm precision — to optimise the angle of the highest-output segment toward the beam source.
At lunar surface temperatures (~150 K in shadowed areas), GaAs laser power converters have demonstrated efficiencies approaching 74.7% in published research (Fafard et al., 2022). The cold environment of the Moon is a genuine advantage for this system.
The exact segmentation geometry, segment count, and micro-adjustment mechanism are open engineering questions.
5.2 Secondary Power — Body Solar Panels
Small photovoltaic panels are mounted on the upper body surfaces for locomotion power. These are independent of the laser receiver and provide sufficient energy for:
Walking and repositioning
Basic sensor operation
AI processing at low power
Bistable magnet switching
The solar panels do not provide enough power for sintering operations. They keep the robot mobile when the laser link is interrupted or when the robot is repositioning far from the optimal beam angle.
5.3 Power Storage — Distributed Solid-State Batteries
Every segment of every leg contains at least one solid-state battery cell. The body contains at least one additional cell. The minimum battery count per robot:
Location	Count
Each leg — 3 segments × 8 legs	24 cells
Body	1 cell minimum
Total minimum	25 cells
The distributed architecture means that losing any single battery cell — through cold failure, physical damage, or age — does not disable the robot. The remaining cells continue to function.
During hibernation, the batteries provide power only for:
Internal heaters on critical components
The AI at minimum safe operating temperature
Essential sensors for wake-up detection
The chemistry, capacity, and minimum safe operating temperature of the solid-state cells are open engineering questions. The cells must not fail catastrophically at -200°C.
---
6. Locomotion — The Eight Legs
6.1 Leg Architecture
Each leg consists of three primary segments:
Segment 1 — Upper Leg (Femur)  
Connects to the body. Contains the primary drive motor and one solid-state battery cell. The motor must operate across the full temperature range without lubrication.
Segment 2 — Lower Leg (Tibia)  
The intermediate segment. Contains one solid-state battery cell. The joint between upper and lower leg must be frictionless or use dry ceramic bearings.
Segment 3 — Foot  
The foot is broad and flat — a snowshoe principle. Wide surface area distributes the robot's weight across loose regolith and prevents sinking. The foot contains one solid-state battery cell.
The foot material must not generate static charge that attracts lunar dust, and must not damage sintered basalt surfaces. The specific geometry and material are open engineering questions.
6.2 Front Legs as Arms
The two front legs are structurally identical to the other six but are designed to also function as manipulator arms. They must be strong enough to:
Lift and position a replacement head unit
Support the robot's weight on six legs while both front legs are in arm configuration
Apply sufficient force for any manipulation task required during maintenance
The specific additional joints, degrees of freedom, and end-effector interface of the front legs are open engineering questions for robotics engineers.
6.3 Gait and Fault Tolerance
With 8 legs, the CMB-R1 can raise 2 legs simultaneously while maintaining stable contact on 6. If a leg is damaged or disabled, the AI re-optimises the gait for the remaining functional legs. The robot continues operating on 7, 6, or even 5 legs if necessary.
The gait algorithm and fault-tolerance strategy are open engineering questions for robotics and AI engineers.
---
7. The Head — Modular and Interchangeable
7.1 Design Principle
The CMB-R1 head contains all task-specific tooling. The body and legs contain no task-specific equipment — they are universal.
If a head fails, one of the other seven robots can pick up a replacement head (carried in the MAST-POD) and attach it to the damaged robot's chassis. The damaged robot assists this process by walking to a position where the replacement can be performed.
The chassis must be fully operational without any head attached. It can walk, navigate, receive laser power, communicate, and reposition — blind but functional.
7.2 Head Connection
The head connects to the body via a bistable latching mechanism. Based on bistable solenoid technology:
A single electrical pulse connects the head — then zero power consumption to hold
A single electrical pulse of opposite polarity disconnects the head
No continuous power required to maintain the connection
The connection must survive the full thermal cycle and vibration environment
The specific mechanical and electrical interface standard for head connection is an open engineering question — and one that must be standardised across all CMB-R1 units so that any head works on any chassis.
7.3 Sensor Suite (Body-Level — Always Present)
The following sensors are mounted on the body, not the head. They are always available regardless of head configuration:
Sensor	Function
LiDAR	360° environment mapping, obstacle detection, floor quality assessment
Stereo cameras	Object recognition, navigation, neighbour robot identification
Find transmitter / transponder	Robot-to-robot localisation, mast beacon tracking
Thermal imager	Ground temperature mapping, sintered area quality
IMU (Inertial Measurement Unit)	Orientation, tilt, vibration monitoring
Dust sensor	Surface contamination monitoring
Additional sensors in the head are task-specific and vary by head type.
---
8. Onboard AI
The CMB-R1 carries a complete AI system onboard. No ground control. No human in the loop for operational decisions.
AI responsibilities:
Navigation and path planning across regolith and sintered surfaces
Gait control and fault-tolerant locomotion
Laser receiver segment selection and micro-adjustment
Task execution (sintering path, inspection, bulldozing, stabilising)
Robot-to-robot coordination within the 8-unit swarm
Hibernation management — entering and exiting safely
Anomaly detection and self-diagnosis
Head swap coordination when required
AI constraints:
Must operate at minimum viable power during hibernation
Must wake up autonomously when conditions allow
Must never require a command from Earth to resume normal operation
Must be updateable via the communication link from the mast
The AI architecture, hardware platform, and software framework are open engineering questions. The AI must run on radiation-hardened hardware.
---
9. Survival — Hibernation Mode
The worst-case scenario for a CMB-R1 is an extended period without sunlight and without laser power from the mast. This can occur if:
The mast experiences a system fault
The robot moves to a location where the laser beam cannot reach it
An unusually long shadow period occurs at the operating site
In hibernation mode, the robot:
Stops all non-essential systems
Folds legs into minimum-exposure configuration
Runs internal heaters from solid-state battery reserves
Maintains AI at minimum safe temperature
Monitors for laser beam presence or solar input
Resumes full operation autonomously when power is restored
The minimum temperature that the solid-state batteries and AI hardware must survive, and the exact hibernation power budget, are open engineering questions.
---
10. Environmental Requirements
All systems must operate within these constraints without exception:
Requirement	Specification
Temperature range	-200°C to +120°C operational; -200°C survival
Vacuum	Full lunar vacuum — no atmosphere assumed anywhere in the design
Radiation	Galactic cosmic rays + solar particle events — radiation-hardened hardware required
Dust	Electrostatically charged lunar dust — all interfaces sealed or self-cleaning
Gravity	1.62 m/s² (0.165 g) — all structural loads calculated for lunar gravity
No oils	Zero tolerance — no oil-based lubricant anywhere in the system
No fuels	Zero tolerance — all energy electrical
No Earth consumables	All materials either pre-launched or produced from lunar regolith
---
11. Open Questions for Engineers
This section lists the unresolved engineering questions that require qualified expertise to answer. Contributions are welcome via GitHub Issues or Pull Requests.
Structures & Materials:
What is the optimal skeleton material for the full lunar temperature range?
What aerogel composition provides the best thermal performance in hard vacuum at -200°C?
How are sintered basalt panels attached to the aerogel layer given the thermal expansion differential?
What is the long-term fatigue life of the leg joints under the combined thermal cycling and load cycle?
Power & Energy:
5. What solid-state battery chemistry retains sufficient capacity at -200°C without catastrophic failure?
6. What is the optimal segmentation geometry for the omnidirectional GaAs laser receiver array?
7. What micro-adjustment mechanism achieves 0.01 mm precision positioning of receiver segments in lunar vacuum?
Locomotion & Mechanisms:
8. What frictionless bearing design is suitable for all 8 leg joints across the full temperature range?
9. What is the optimal foot geometry and material to minimise regolith sinking and dust adhesion?
10. What additional degrees of freedom do the front legs require to perform head replacement reliably?
AI & Software:
11. What radiation-hardened AI hardware platform is suitable for the required computational load?
12. What is the minimum power budget for the AI to remain operational during hibernation?
13. What communication protocol should be used for robot-to-robot coordination?
Head Interface:
14. What is the mechanical and electrical standard for the interchangeable head connection?
15. What force does the bistable latching connection need to withstand during leg locomotion vibration?
---
12. References
Fafard et al. (2022) — GaAs laser power converter efficiency at low temperatures. Photonics, MDPI.
Mars Exploration Rover thermal design — aerogel insulation heritage (NASA JPL).
Bistable latching solenoid technology — general engineering references.
Chrystal Moon Base MAST-POD Specification — chrystalmoonbase.com
GNU General Public License v3.0 — gnu.org
---
13. How to Contribute
This document is the starting point, not the endpoint.
If you are an engineer, scientist, or researcher with expertise in any of the open questions listed in Section 11 — your contribution is welcome and needed.
Found an error? Open a GitHub Issue.
Have a better number? Submit a Pull Request with your source.
Want to take ownership of a subsystem? Contact us at info@chrystalmoonbase.com
All contributions are credited in CREDITS.md.
---
Chrystal Moon Base · chrystalmoonbase.com · github.com/ChrystalMoonBase  
The Moon belongs to all of us.
