# CMB-R1 Head Attachment Mechanism
## Chrystal Moon Base — Robot System Concept

**Status:** Concept proposal  
**Licence:** CC0

---

## Requirements

The head attachment mechanism must:
- Connect any head type to any chassis reliably
- Be operable by the robot's own front limbs without human assistance
- Maintain connection under vibration, thermal cycling, and dust exposure for years
- Disconnect cleanly on command for head swapping
- Seal electrical and optical connections between head and chassis

---

## Proposed Design

**Physical connection:** A bayonet-style mechanical coupling. The head has a male bayonet fitting; the chassis interface has the corresponding female socket. The robot positions the head against the interface, pushes forward, and rotates slightly to lock. This is a one-handed operation that the front limbs can perform.

**Locking:** A spring-loaded locking collar engages automatically at the end of the bayonet rotation. Deliberate counter-rotation retracts the collar and allows disconnection.

**Dust tolerance:** The coupling surfaces are protected by wiper seals that clear dust from the mating surfaces as they engage. Dust ingress into the electrical connection is the primary failure risk — the wiper design must be validated in dust chamber testing.

**Electrical connection:** Spring-loaded electrical contacts in the coupling face connect power and data lines between head and chassis when the bayonet engages. Contact force is maintained by the spring throughout the connection. No separate connector engagement is required.

**Optical connection (if required):** Some head types (sintering) may require optical fibre connection for the laser path. An optical bulkhead connector integrated into the bayonet coupling face is proposed. Optical connectors are sensitive to dust and misalignment — this is the highest-risk element of the mechanism.

---

## Open Questions

1. Can a single bayonet coupling design accommodate both the mechanical loads (vibration, transport) and the precision requirements (optical alignment) simultaneously?
2. What wiper seal material maintains adequate dust exclusion over years of repeated coupling cycles in the lunar dust environment?
3. What is the minimum positional accuracy the robot front limbs must achieve to successfully engage the bayonet — and can the robot consistently achieve this?
