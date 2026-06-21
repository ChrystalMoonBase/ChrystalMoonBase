# Cybersecurity and Network Trust
## Chrystal Moon Base — AI and Monitoring

**Status:** Concept proposal — security architecture, not yet audited
**Licence:** CC0
**Last updated:** 2026

> CMB publishes its designs openly. That makes "security through obscurity" impossible and undesirable — the whole world may know how the system is built. Security must therefore live in cryptography and trust architecture, not in secrecy. This is a strength, not a weakness: the same principle underlies all serious encryption, where the method is public and only the key is secret. This document describes the layered defence and is explicit about where the real risk concentrates.

---

## Core Frame — Security and Growth Are the Same Mechanism

You cannot pre-programme Pod 2, 3, and 4 into Pod 1. At launch, Pod 1 carries software that is complete *for what Pod 1 must do* — no more. Everything that comes later (a second Pod, new robots, new tasks) does not yet exist and is not yet known, because Pod 1 must first prove the concept. There is a long gap before Pod 2, by necessity.

This means **new capability can only ever arrive through an authorised update**. That is not a security feature bolted on afterwards — it is simply how an iterative, prove-it-first project has to work. And it happens to be the strongest possible security posture: the network grows only when we explicitly, cryptographically introduce something new. Necessity and security are the same mechanism.

The Earth–Moon command/update link has an inherent round-trip delay (~2.6 s light-time each way, on the order of a few seconds in practice). This delay already makes real-time "joystick" control of anything impossible — all systems run autonomously, and Earth provides oversight and authorised updates, not live control (see `data-relay-to-earth.md`).

---

## The Four Layers

### Layer 1 — Physical link (raises the bar for intercept/jam, does not carry the defence)

Communication uses directional laser links and, over time, less common frequencies. A narrow laser beam is physically hard to intercept — an eavesdropper must stand inside the beam — and an unusual frequency is harder to casually detect or jam.

**Stated honestly:** this is a *physical* layer that makes eavesdropping and jamming harder. It is **not** the defence against hostile commands, and CMB does not rely on frequency obscurity for security. Anyone with a spectrum analyser can find any transmission, and because the designs are open, the frequency is not secret anyway. This layer raises the bar; it does not hold the line.

### Layer 2 — Command authentication (the real defence against takeover)

Robots, masts, and Pods accept only commands that are cryptographically **signed** with a key an attacker does not have. Knowing the frequency, intercepting the beam, or replaying old traffic achieves nothing without a valid signature — every unsigned or improperly-signed command is rejected. This is what actually prevents a hostile party from issuing commands, independent of the physical layer.

### Layer 3 — Hardware–software binding (the "iPhone" principle)

Every component — laser head, power receiver, motor controller, sensor — and every robot carries a unique cryptographic identity. The system verifies these identities; a component or robot it does not recognise is not trusted. Replace a part with an unknown one and the system refuses it, exactly as a phone rejects an unpaired component. This:
- prevents tampered or counterfeit hardware from being introduced,
- secures the head-swap system (a robot accepts only a genuine, authenticated CMB head — see `systems/robot-cmb8lf-l1/head-attachment-mechanism.md`),
- prevents a hijacked robot with foreign hardware from being trusted by the swarm.

### Layer 4 — Closed trust network (whitelist / default-deny)

This is the keystone. The network trusts **nothing by default**. A new node — a second Pod, a new robot, a new component — *does not exist for the network* until an authorised, authenticated update from the company introduces it (its identity, its keys, its files). Before that update, the existing masts cannot even detect or connect to it; afterwards, the systems automatically seek and establish the connection.

The consequence: an attacker cannot smuggle in a false Pod, robot, or part, because even a perfect counterfeit on the correct frequency is simply ignored — it is not on the whitelist, so for the network it does not exist. Defence does not depend on *recognising* an attack; anything not pre-authorised is ignored by default. This is "default deny," and it is far stronger than "detect and block the malicious."

---

## Where the Risk Concentrates — Honest Disclosure

This architecture is strong, but it moves the crown jewel to a single place: **the update-signing key.** If the whole network trusts only what arrives via an authorised update, then the key used to sign those updates is the single most critical secret in the entire system. Whoever holds it can introduce a new trusted node; whoever steals it can introduce a false one.

This is not a flaw in the design — it is simply where the risk relocates, and it must be stated plainly because a reviewer will ask. The mitigations are standard but essential, and are open work:

- **Key custody:** where the update-signing key lives, who can use it, and under what multi-person authorisation.
- **Key rotation and revocation:** how keys are rotated, and how a compromised key is revoked and replaced across a network that may be partly out of contact.
- **Recovery:** what happens if the signing key is lost (no new nodes can ever be added) or compromised (a false node could be added) — both need a planned response.
- **Defence in depth:** the other three layers ensure that even a compromised update cannot, by itself, achieve real-time control, and that hardware binding still constrains what a rogue node can do.

---

## Open Questions

1. Independent penetration testing and a third-party security audit of the full command, update, and trust chain — essential before any human-rated operation.
2. Exact cryptographic schemes (signature algorithm, key lengths, post-quantum considerations given a multi-decade timeline).
3. Update-signing key custody, rotation, revocation, and recovery procedures (see above).
4. Behaviour under a degraded or jammed link during a real attack — does the network fail safe (hold position, autonomous safe mode) rather than fail open?
5. How the open-source publication boundary is drawn so that designs are open while live keys, signed binaries, and operational secrets are never published (consistent with `LICENSE-SOFTWARE.md`, which keeps flight software proprietary).

*Security researchers and cryptography engineers are explicitly invited to review and challenge this architecture via GitHub Issues. Responsible-disclosure contact: info@chrystalmoonbase.com.*
