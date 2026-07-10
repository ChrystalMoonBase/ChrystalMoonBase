# Cybersecurity and Network Trust Architecture
**Chrystal Moon Base — AI and Monitoring**

**Status:** Concept proposal — security architecture, **not yet independently audited or penetration-tested**
**Licence:** CC0
**Last updated:** July 2026
**Companion document:** `threat-scenario-analysis.md` (10-scenario stress test of this architecture)

---

## 0. Why This Document Exists, and What It Honestly Is

CMB publishes all its designs openly. That rules out "security through obscurity" —
the idea that a system is safe because its blueprint is secret. History shows that
approach fails: Kerckhoffs's Principle, formulated in 1883 and still the foundation
of modern cryptography, holds that a system must remain secure even if everything
about it *except the key* is public knowledge. Every standard referenced in this
document (AES, the NIST post-quantum signature schemes, TLS) follows this principle.
CMB's openness is therefore not a handicap to work around — it is the correct
starting assumption: **assume the attacker has the blueprints. Design so that this
does not matter.**

**What this document is not:** a guarantee, a certification, or a substitute for a
real audit. Section 8 states plainly where this architecture is weakest and what
independent testing is still required before any human-rated operation. A security
document that claims to have been "tested" or to "score highly" without an actual,
named, external test is worse than no claim at all — it creates false confidence.
Nothing in this document is presented as tested unless a real test is described.

---

## 1. Core Frame: Growth and Security Are the Same Mechanism

Pod 1 cannot be pre-loaded with the software for Pod 2, 3, or 4, because those
systems do not exist yet and their design depends on what Pod 1 proves. This is an
engineering necessity, not a security feature bolted on afterwards — but it produces
the strongest possible security posture as a side effect: **the network can only
ever grow through an explicit, authorised, cryptographically signed update.**
Necessity and security converge on the same mechanism.

The Earth–Moon link has an inherent light-time delay of roughly 1.3 seconds each
way (about 2.6 seconds round-trip at lunar distance), which makes real-time
"joystick" control physically impossible regardless of security posture. All
systems must run autonomously; Earth provides oversight and authorised updates,
not live control (see `data-relay-to-earth.md`).

---

## 2. Threat Model — Who and What This Defends Against

A security architecture is only meaningful against a stated threat model. This one
assumes the attacker may:

- Possess the complete public design (by definition — CMB is open).
- Intercept, jam, or spoof the physical communication link.
- Attempt to introduce counterfeit or tampered hardware anywhere in the supply
  chain or during a physical replacement/repair.
- Attempt to replay, delay, or reorder previously captured legitimate commands.
- Compromise a single individual with legitimate access (insider threat).
- Have access to a large-scale quantum computer at some point during the system's
  multi-decade operational life (harvest-now-decrypt-later).
- Cause or exploit naturally occurring radiation-induced hardware faults.

It explicitly does **not** assume the attacker has the update-signing key, physical
access to the air-gapped signing facility, or control of a quorum of key-holders —
because if any of those hold, no software architecture can help (see Section 7).

---

## 3. The Seven Layers of Defence

### Layer 0 — Physical Link Hardening
Communication uses directional laser links; over time, additional RF options at
less common frequencies may be added for redundancy. A narrow laser beam is
physically difficult to intercept without occupying the beam path, and directional
links are harder to jam than omnidirectional RF.

**Honest limit:** this raises the cost of eavesdropping and jamming — it is not the
defence against a hostile command, and CMB does not rely on frequency secrecy
(the designs are public, so the frequency is not a secret either). Anyone with a
spectrum analyser and line of sight into the beam can detect the transmission.
This layer buys time and difficulty; Layer 1 is where trust actually lives.

### Layer 1 — Command Authentication and Confidentiality (CCSDS Space Data Link Security)
Every command is cryptographically signed; an unsigned or invalidly signed command
is rejected outright, and knowing the frequency or replaying old traffic achieves
nothing without a valid, fresh signature.

This is not a bespoke protocol. The space industry has a standing, mature standard
for exactly this problem: **CCSDS 355.0-B-2, the Space Data Link Security (SDLS)
Protocol**, which provides authentication, encryption, and authenticated encryption
services at the data link layer for Telecommand, Telemetry, and Advanced Orbiting
Systems links, and has been used across civil space agencies for over a decade.
CMB's command authentication layer is specified as an SDLS-conformant implementation
rather than a custom scheme — reusing a standard that has already had a decade of
agency-level scrutiny is safer than inventing a new one. Replay protection uses
sequence numbers / freshness values as specified in SDLS; a command with a
previously-seen or out-of-window sequence number is rejected regardless of
signature validity.

**Post-quantum note:** because the operational life of this system is measured in
decades, and because "harvest now, decrypt later" means an adversary can record
today's signed traffic and attack it once a cryptographically relevant quantum
computer exists, the signature scheme for command authentication is specified as
**ML-DSA (FIPS 204)**, finalised by NIST in August 2024, with **SLH-DSA (FIPS 205)**
— a conservative, hash-based scheme whose security does not depend on lattice
hardness assumptions — as a structurally independent fallback if a future
cryptanalytic advance weakens lattice-based schemes. Key exchange (where a session
key must be established, e.g. for bulk telemetry encryption) uses **ML-KEM
(FIPS 203)**. All three are the NIST-standardised replacements for RSA/ECDH/ECDSA,
selected after an eight-year public evaluation process.

### Layer 2 — Hardware Root of Trust and Firmware Resilience
Every critical component (motor controller, sensor head, power receiver, onboard
computer) boots only firmware it can cryptographically verify, following the
structure of **NIST SP 800-193, Platform Firmware Resiliency Guidelines**, whose
three mandatory properties are:

1. **Protect** — firmware cannot be modified except through an authorised, signed
   update mechanism.
2. **Detect** — the platform can cryptographically detect if firmware has been
   corrupted or tampered with before it is allowed to execute.
3. **Recover** — if compromised firmware is detected, the platform can restore a
   known-good, signed image without manual intervention where possible.

This Root of Trust is the anchor of a **Chain of Trust**: each stage of boot
verifies the signature of the next stage before executing it, so trust extends
from an immutable hardware anchor up through firmware to application software. A
component whose boot chain cannot be verified refuses to start and reports a
fault rather than running possibly-compromised code.

### Layer 3 — Hardware Identity and Supply Chain Integrity
Every physical component carries a unique cryptographic identity (a device
certificate bound to a hardware-protected key, not just a serial number printed on
a label) established at manufacture and checked at integration. This follows the
device-lifecycle and supply-chain risk management structure of **NIST SP 800-161
Rev. 1, Cybersecurity Supply Chain Risk Management Practices**, which explicitly
frames counterfeit insertion, unauthorised production, and tampering as supply
chain threats to be mitigated by traceable component provenance and acceptance
testing, not discovered after the fact.

A component whose identity cannot be verified against records introduced by an
authorised update (see Layer 4) is not trusted, regardless of how correctly it
otherwise behaves — this is the same principle mobile device platforms use to
reject unpaired hardware, applied at the rigor level a life-safety system requires.

**Consequence:** an attacker cannot introduce tampered or counterfeit hardware
into the supply chain, or swap a component in the field, without possessing both
the physical means and a valid identity credential that was never issued to them.

### Layer 4 — Closed Trust Network (Default-Deny)
The network trusts nothing by default. A new node — Pod, robot, or component —
does not exist for the system until introduced through an authorised, signed
update from mission control. This is the "default-deny" model that NIST's
**Zero Trust Architecture (SP 800-207)** formalises: access (and here, existence
within the trusted network) is never granted implicitly by network location or
prior presence; every subject and resource is explicitly evaluated, and nothing is
trusted merely because it is "inside." Before authorisation, an unregistered node
is not merely rejected — it is architecturally invisible; existing nodes do not
attempt to establish a session with it at all.

**Consequence:** even a perfect physical counterfeit, transmitting on the correct
frequency with a cloned appearance, achieves nothing, because trust here does not
depend on recognising an attack in progress — it depends on the absence of prior
authorisation, which cannot be forged without the signing key.

### Layer 5 — Human and Procedural Controls (Key Custody)
Cryptography fails if the people controlling it are a single point of failure. The
update-signing capability requires:

- **Multi-party authorisation (quorum signing):** no single individual can
  authorise a network-changing update alone; a defined minimum number of
  independent, vetted key-holders must concur (an *m-of-n* threshold scheme).
- **Air-gapped signing environment:** the systems that hold and use signing keys
  are never connected to the general internet, reducing remote-compromise surface
  to zero for that specific operation.
- **Immutable audit logging:** every signing event, key access, and authorisation
  decision is logged to an append-only record that cannot be edited after the
  fact, so a compromise leaves forensic evidence rather than a clean trail.

This layer exists because Layers 1–4 all ultimately answer to the same secret,
and no purely technical control protects a secret from the humans authorised to
use it — only procedural discipline does.

### Layer 6 — Radiation Tolerance and Fail-Safe Behaviour
Space radiation causes genuine, frequent, non-malicious bit flips (**Single Event
Upsets**) in memory and logic — a well-characterised effect, not a hypothetical
one, documented across decades of spacecraft operations. CMB's integrity systems
must distinguish "cosmic ray flipped a bit" from "an attacker tampered with this
data," and handle both without ever assuming the more dangerous case is the
default.

- **Error Detection and Correction (EDAC):** memory uses SECDED (single-error-
  correct, double-error-detect) codes such as extended Hamming codes, which add a
  modest number of parity bits (e.g. 8 bits for a 64-bit word) and transparently
  correct the single-bit upsets that dominate the space radiation environment.
- **Triple Modular Redundancy (TMR):** for critical control logic and small,
  high-value memories, three independent copies vote on the correct value; TMR
  has been flight-proven on multiple small-satellite programs specifically to
  survive SEUs, at the cost of roughly 200% storage/logic overhead, which is why
  it is reserved for the smallest, most critical elements rather than applied
  everywhere.
- **Fail-safe on integrity failure:** if a component detects an integrity fault
  it cannot resolve internally (an uncorrectable EDAC error, a failed boot-chain
  signature check, or a HRS lookup that returns "unknown"), it does not guess —
  it enters a defined safe state, halts the affected function, and raises an
  Integrity Alert to Earth. Ambiguity is treated as a fault condition, not
  resolved in the direction of continued operation.

---

## 4. Where the Risk Concentrates — Honest Disclosure

Layers 1–4 all reduce to the same root secret: **the update-signing key(s)**.
Whoever holds a valid quorum can introduce a new trusted node. Whoever steals a
usable share of the key material — or coerces enough key-holders — can do the
same. This is not a flaw to be argued away; it is where a well-designed
default-deny system necessarily concentrates its risk, and any reviewer will (and
should) ask about it first.

Mitigations, all of which are **procedural and organisational as much as
technical**, and remain open work:

- **Key generation and custody.** Where keys are generated (ideally in a hardware
  security module, never as plaintext on a general-purpose computer), who may
  access them, and under what multi-person authorisation (Layer 5).
- **Key rotation and revocation.** A defined schedule for rotating signing keys,
  and a defined, tested procedure for revoking and replacing a key across a
  network that may be **partially out of contact for weeks** — revocation cannot
  assume all nodes are reachable at once.
- **Recovery from key loss or compromise.** Loss of all key shares means no new
  node can ever be authorised again (a permanent capability freeze); compromise
  means a false node *could* be authorised. Both scenarios need a rehearsed,
  written response, not an improvised one.
- **Defence in depth as a backstop, not a substitute.** Even a successfully
  forged update should not translate into unlimited real-time control: Layer 3's
  hardware identity binding and Layer 6's fail-safe behaviour independently limit
  what a rogue, freshly-authorised node can actually do before a human on Earth
  notices and can revoke it.

---

## 5. Post-Quantum Cryptography — Why It Applies Here Specifically

Most systems can defer post-quantum migration; a system intended to operate for
decades on the Moon cannot, for two independent reasons that both apply to CMB:

1. **Harvest-now-decrypt-later.** An adversary can record encrypted or signed
   traffic today and break it retroactively once a cryptographically relevant
   quantum computer exists. Anything CMB signs or encrypts today is potentially
   exposed to tomorrow's quantum capability — including years-old firmware
   update signatures and command logs.
2. **Multi-decade operational life.** NIST's own transition timeline (NIST IR 8547)
   plans to deprecate RSA-2048/ECC P-256 by 2030 and remove quantum-vulnerable
   algorithms from federal standards entirely by 2035 — squarely inside CMB's
   planned operational window.

CMB therefore specifies **ML-KEM (FIPS 203)** for key exchange and **ML-DSA
(FIPS 204)** for signatures as the primary post-quantum algorithms, both finalised
NIST standards as of August 2024, with **SLH-DSA (FIPS 205)** — a hash-based
scheme with security resting only on hash-function collision resistance, a
structurally different (and more conservative) assumption than the lattice
problems underlying ML-KEM/ML-DSA — carried as an independent fallback signature
scheme. This mirrors the U.S. NSA's own CNSA 2.0 suite, which mandates ML-KEM and
ML-DSA as primary with SLH-DSA as the alternate for new national security systems.

Where classical algorithms remain in use during any transition period, CMB runs
them in **hybrid mode** (classical + post-quantum together), the same approach
major internet infrastructure providers use today, so that security never regresses
below today's classical baseline even if a post-quantum implementation has an
undiscovered flaw.

---

## 6. Fail-Safe Design Philosophy

Across every layer, the same rule applies: **when the system cannot verify that
something is safe, it treats it as unsafe** — not the reverse. Concretely:

- An unsigned or invalidly-signed command is **rejected**, not executed-with-a-warning.
- An unrecognised hardware identity is **ignored**, not trusted-until-proven-hostile.
- An uncorrectable memory error halts the affected function and alerts Earth; it
  does not continue on unverified data.
- A jammed or degraded link causes the system to **hold its last safe autonomous
  state**, not to fail open and accept whatever it next receives.

This "fail closed" posture is deliberately more conservative than a system
optimised purely for uptime — for a system with no on-site human operator and a
multi-second command delay, a false negative (missing a legitimate command) is
recoverable; a false positive (accepting an illegitimate one) may not be.

---

## 7. Limits of Any Architecture — What This Document Does Not Solve

Stated plainly, so it cannot be mistaken for a guarantee:

- No cryptographic architecture protects against a compromised quorum of
  legitimate key-holders acting maliciously or under coercion — that is a human
  and organisational problem, addressed (imperfectly) by Layer 5, not eliminated.
- No architecture eliminates the risk of an undiscovered flaw in a standardised
  algorithm's implementation (as opposed to the algorithm itself) — this is why
  independent code audits and formal verification, not just "using the right
  algorithm," are listed as open work below.
- Physical destruction, jamming severe enough to prevent all communication, or a
  sustained denial-of-service against the ground segment are not "solved" by any
  layer above — they are handled by the fail-safe posture (Section 6) and mission
  design margin, not prevented.

---

## 8. Open Questions and Required Independent Validation

- **Independent penetration testing and third-party security audit** of the full
  command, update, and trust chain by a qualified external party — required
  before any human-rated operation, and not yet performed.
- **Formal specification and verification** of the state machine governing
  Layer 4's default-deny logic, given how much of the architecture's strength
  depends on that logic being implemented exactly as specified.
- **Exact key-custody, rotation, revocation, and recovery procedures** (Section 4)
  need to be written as literal, rehearsable playbooks, not principles.
- **Behaviour under a real, sustained, adversarial jamming attempt** (as opposed
  to natural link degradation) needs to be tested against the fail-safe claims in
  Section 6, ideally via red-team exercise.
- **The open-publication boundary:** how CMB keeps designs public while never
  publishing live keys, signed production binaries, or the specific hardware
  identity records issued to real components (consistent with
  `LICENSE-SOFTWARE.md`, which keeps flight software proprietary while hardware
  and documentation remain open).

Security researchers and cryptography engineers are explicitly invited to review
and challenge this architecture via GitHub Issues.
**Responsible-disclosure contact:** info@chrystalmoonbase.com

---

## Sources

1. Kerckhoffs, A. (1883). *La Cryptographie Militaire* — origin of the
   "public algorithm, secret key" principle underlying this entire document.
2. NIST FIPS 203 — *Module-Lattice-Based Key-Encapsulation Mechanism Standard
   (ML-KEM)*, finalised 13 August 2024.
3. NIST FIPS 204 — *Module-Lattice-Based Digital Signature Standard (ML-DSA)*,
   finalised 13 August 2024.
4. NIST FIPS 205 — *Stateless Hash-Based Digital Signature Standard (SLH-DSA)*,
   finalised 13 August 2024.
5. NIST IR 8547 — post-quantum transition timeline (RSA-2048/ECC P-256
   deprecated 2030; quantum-vulnerable algorithms removed by 2035).
6. NSA CNSA 2.0 Suite — mandates ML-KEM/ML-DSA primary, SLH-DSA alternate, for
   new National Security Systems.
7. CCSDS 355.0-B-2 — *Space Data Link Security (SDLS) Protocol*, the
   space-industry standard this document's Layer 1 conforms to.
8. CCSDS 350.1-G-3 — *Security Threats Against Space Missions*.
9. NIST SP 800-193 — *Platform Firmware Resiliency Guidelines* (Protect / Detect
   / Recover), the basis for Layer 2.
10. NIST SP 800-161 Rev. 1 — *Cybersecurity Supply Chain Risk Management
    Practices for Systems and Organizations*, the basis for Layer 3.
11. NIST SP 800-207 — *Zero Trust Architecture*, the basis for Layer 4's
    default-deny model.
12. Single-Event Upset literature (multiple, converging sources): Wikipedia
    "Single-event upset"; ScienceDirect *Single Event Upset — an overview*;
    NASA NEPP, *Lessons Learned from Radiation Induced Effects on Solid State
    Recorders* — basis for the EDAC/SECDED and TMR claims in Layer 6, including
    the ~200% TMR storage overhead figure and flight heritage on small-satellite
    onboard computers.

*(Full URLs available on request / in the repository's citation log — omitted here
per this project's copyright and citation conventions.)*
