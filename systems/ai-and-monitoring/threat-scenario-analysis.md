# Threat-Scenario Stress Test
**Companion to `cybersecurity-and-network-trust.md`**

**Status:** Hypothetical / desk-based red-team exercise performed by the author and
an AI assistant. **This is not a substitute for independent penetration testing**
(see Section 8 of the main document) — it is a structured sanity check to find
obvious gaps before that real testing happens.

**Method:** each scenario states an attacker goal and capability, then walks it
through the seven layers, and gives an honest verdict: **HOLDS** (architecture
stops it), **PARTIAL** (slows/limits it but doesn't fully stop it), or **GAP**
(architecture as described does not yet address it). A "HOLDS" verdict is only
given when a specific layer's mechanism actually blocks the specific step of the
attack — not by general reassurance.

---

## Scenario 1 — Spoofed command from a fake ground station
**Attacker goal:** send a malicious command ("open airlock", "disable safe mode")
pretending to be mission control.
**Capability:** knows the frequency, knows the protocol (it's public), can transmit
on the correct band.

**Walkthrough:** Layer 0 does not stop this (frequency isn't secret). The command
reaches a robot/Pod. **Layer 1 (CCSDS SDLS authentication)** checks the signature
against ML-DSA keys the attacker does not have. Signature fails verification →
command rejected before execution.

**Verdict: HOLDS**, entirely on Layer 1. This is the textbook case the whole
architecture is built around, and it is also the *easiest* one — real attackers
will avoid it and target Scenarios 4–6 instead, which is exactly why Section 4 of
the main document says the real risk is the key, not the link.

---

## Scenario 2 — Replay of a previously captured legitimate command
**Attacker goal:** re-send a real, previously-observed, validly-signed command
(e.g. a genuine "extend mast" command) at a moment of the attacker's choosing.
**Capability:** passively recorded a real transmission earlier.

**Walkthrough:** the signature is genuinely valid — Layer 1's signature check alone
would pass it. This is why SDLS specifies **sequence numbers / freshness windows**,
not signature-only authentication. A replayed frame carries an old, already-used
(or out-of-window) sequence number and is rejected on that basis, independent of
signature validity.

**Verdict: HOLDS**, but only if replay/freshness checking is implemented correctly
— this is flagged explicitly as a place where an implementation bug (not a design
flaw) could quietly reopen the hole. **Recommended addition to Section 8's open
questions:** an explicit test case verifying replay rejection, not just signature
rejection.

---

## Scenario 3 — Counterfeit hardware component swapped in during a field repair
**Attacker goal:** get a robot to accept a modified or backdoored replacement part
(e.g. a compromised motor controller) during routine maintenance.
**Capability:** physical access to the part being installed; no valid device
identity credential.

**Walkthrough:** **Layer 3** requires a hardware-bound cryptographic identity
established at manufacture. The counterfeit part either has no identity credential
or a cloned/guessed one that does not match records. **Layer 4 (default-deny)**
means the part is not merely rejected — the system never attempts to trust it in
the first place, because it was never introduced via an authorised update.

**Verdict: HOLDS**, assuming Layer 3's device identity is rooted in tamper-resistant
hardware (not just a copyable serial number in software) — the main document should
state this requirement explicitly (see recommendation below).

---

## Scenario 4 — A single rogue insider with legitimate signing access
**Attacker goal:** authorise a malicious update alone.
**Capability:** is one of the vetted key-holders.

**Walkthrough:** **Layer 5's quorum requirement (m-of-n)** means one person cannot
produce a valid signature alone by design — the cryptographic threshold scheme
mathematically requires cooperation from multiple independent key shares.

**Verdict: HOLDS**, provided *m* is set high enough relative to *n* that a single
person, or a small colluding minority, cannot reach threshold. **Open question the
main document does not yet answer:** what are the actual values of *m* and *n*?
This needs to be decided and stated, not left implicit — "quorum exists" and
"quorum is adequate" are different claims.

---

## Scenario 5 — Coordinated compromise of a full signing quorum
**Attacker goal:** compromise or coerce enough key-holders to legitimately reach
threshold and sign a malicious update.
**Capability:** sophisticated, well-resourced adversary (nation-state-level or
serious criminal organisation), targeting multiple individuals over time.

**Walkthrough:** this is explicitly **outside** what any cryptographic layer can
solve — Section 7 of the main document says this plainly. Layer 5's air-gapping and
audit logging raise the operational cost and leave forensic evidence, but do not
prevent it if enough real key-holders are genuinely compromised.

**Verdict: GAP by design admission.** This is not a flaw in the document — it is
the single most important thing the document gets right by *not* pretending to
solve it. The honest mitigation is entirely organisational: background vetting,
geographic/organisational diversity of key-holders (so one country's legal
compulsion or one company's insider can't reach threshold alone), and monitoring
for the audit-log entries this scenario would leave behind. **This belongs in
Section 4 as an explicit named risk**, not only implied by "coerce enough
key-holders."

---

## Scenario 6 — Loss of all signing key shares (not theft — loss)
**Attacker goal:** none — this is an availability scenario, not an attacker.
**Trigger:** accident, disaster, or death/incapacitation of key-holders without
succession planning.

**Walkthrough:** default-deny (Layer 4) means the network cannot authorise *any*
new node without a valid quorum signature. If the key is unrecoverable, the network
is permanently frozen at its current authorised state — safe, but frozen.

**Verdict: PARTIAL — safe but not resilient.** The architecture correctly fails
closed rather than open, which is the right default, but Section 4 lists "recovery
from key loss" as *open work* rather than a solved procedure. **This needs a real
answer** — e.g. a secret-sharing scheme (such as Shamir's Secret Sharing) with
geographically distributed shares and a defined threshold lower than the full
signing quorum but still requiring multiple independent parties, specifically for
disaster recovery. Until that exists, this is a genuine single point of
organisational failure.

---

## Scenario 7 — Jamming during an active, time-critical operation
**Attacker goal:** disrupt communication at a critical moment (e.g. during a
docking or deployment sequence) to cause a malfunction or unsafe state.
**Capability:** RF/laser jamming equipment, no cryptographic access.

**Walkthrough:** Layer 0 raises the cost of jamming a directional laser link (must
be positioned in/near the beam path) but does not claim to prevent it. **Layer 6's
fail-safe posture** is what actually matters here: loss of link causes the system
to hold its last known-safe autonomous state rather than proceeding on missing or
guessed input.

**Verdict: HOLDS for the safety consequence** (no unsafe action is taken), **GAP
for availability** (the operation is disrupted, which the jammer wanted). This is
an acceptable trade — safety over uptime — but the document should say so
explicitly rather than leaving "jamming" feeling unaddressed. **Recommended
addition:** state directly that jamming is treated as an availability attack the
architecture deliberately loses gracefully, not a safety attack it prevents.

---

## Scenario 8 — Malicious firmware update signed with a stolen-but-valid key share, submitted below quorum
**Attacker goal:** submit a partial, invalid signature hoping a buggy verifier
accepts it anyway (implementation attack, not design attack).
**Capability:** possesses one (but not enough) valid key share, and technical
skill to craft malformed signature payloads.

**Walkthrough:** this specifically tests whether **Layer 4's threshold-verification
code** is implemented correctly — a below-threshold signature must be rejected, not
just a completely absent one. This is exactly the kind of edge case that a design
document cannot verify, only working, tested code can.

**Verdict: GAP — cannot be verified by this document.** This is a pure
implementation-correctness question. **This is precisely why Section 8's demand
for independent penetration testing and (ideally) formal verification of the
threshold-signature verification logic is not optional** — no amount of
architecture review substitutes for testing the actual code path.

---

## Scenario 9 — Radiation-induced bit flip in a security-critical register, misclassified as an attack (or vice versa)
**Attacker goal:** none — this tests a false-positive/false-negative failure mode,
not an attacker.
**Trigger:** a cosmic ray flips a bit in, e.g., the hardware identity comparison
logic or the boot-chain verification result register.

**Walkthrough:** **Layer 6's EDAC/SECDED and TMR** are specifically there to
correct single-bit upsets in data before they ever reach a security decision. If
an uncorrectable multi-bit error occurs (rarer, but possible), Section 6's fail-safe
rule applies: the ambiguous result is treated as a fault, not as "probably fine" —
the component halts and alerts Earth rather than guessing in either direction.

**Verdict: HOLDS**, precisely because the architecture explicitly refuses to treat
"uncertain" as "trusted." The risk this scenario actually surfaces is operational,
not architectural: **frequent false alarms from cosmic-ray noise could train ground
operators to reflexively clear alerts without investigating**, which would
eventually let a real attack hide inside the noise. **This should be added to
Section 8** as an open question about alert-fatigue mitigation, not just detection.

---

## Scenario 10 — Supply-chain compromise before launch (pre-deployment)
**Attacker goal:** insert a hardware or firmware backdoor into a component *before*
it ever reaches CMB — i.e., compromise the manufacturer or a sub-supplier, not the
field deployment.
**Capability:** access to the manufacturing or firmware-flashing stage, before
Layer 3 identity provisioning occurs.

**Walkthrough:** this is the scenario **NIST SP 800-161 exists for**, and it is
also the scenario where CMB's Layer 3/4 architecture is *weakest*, because those
layers assume the identity provisioned at manufacture is itself trustworthy. If the
backdoor is installed before the legitimate identity credential is issued, that
credential will faithfully authenticate a compromised component forever after.

**Verdict: GAP.** Neither the original nor the current draft of the main document
specifies acceptance testing, provenance verification, or a trusted-manufacturing
chain-of-custody procedure at the point identity credentials are issued. **This is
the most significant addition this stress test surfaces**: Section 3 (Layer 3)
needs an explicit sub-section on manufacturing-stage trust — e.g. verification
against a golden reference build, multi-source component sourcing to make single-
supplier compromise harder to target, and physical inspection procedures — because
no amount of field-side cryptography fixes a backdoor introduced before the keys
were ever generated.

---

## Scenario 11 — Harvest-now-decrypt-later against archived command logs
**Attacker goal:** no live compromise attempted; passively record all encrypted/
signed traffic today, decrypt or forge retroactively once quantum computing makes
today's classical or even early lattice-based cryptography breakable.
**Capability:** patient, well-resourced, long time horizon (this is explicitly a
nation-state-class threat model).

**Walkthrough:** this is exactly Section 5's stated reason for choosing **ML-KEM /
ML-DSA now**, with **SLH-DSA** as a structurally independent fallback in case a
future cryptanalytic break affects lattice-based schemes specifically (SLH-DSA's
security rests only on hash-function collision resistance, not lattice hardness —
a different mathematical foundation).

**Verdict: HOLDS for data confidentiality/authenticity going forward**, since
CMB does not plan to use classical-only algorithms for new traffic. **PARTIAL for
anything already recorded before this policy is implemented** — any traffic sent
under classical algorithms prior to full PQC deployment is retroactively exposed
regardless of what CMB does later; there is no way to fix that after the fact.
**Recommended addition:** state explicitly that PQC must be the default from the
very first transmission, not phased in gradually, given this exact attack.

---

## Scenario 12 — Denial of service against the Earth-side ground station / mission control network
**Attacker goal:** prevent Earth from sending *any* authorised update or command,
not by attacking the Moon-side system but by attacking mission control's internet-
facing infrastructure.
**Capability:** conventional DDoS/network-layer attack against ground infrastructure.

**Walkthrough:** this scenario doesn't touch Layers 1–4 or 6 at all — the Moon-side
trust architecture is irrelevant here, because the attack is entirely on Earth,
against systems the CMB documents so far treat as implicitly trustworthy and
available. Layer 5's air-gapped signing environment protects the *signing* step
specifically, but the broader mission-control network (monitoring, scheduling,
day-to-day ground operations) is not yet described.

**Verdict: GAP — out of scope of the current document, and should not remain so.**
The main document is entirely spacecraft/robot-side; it has no equivalent layer for
ground-segment resilience. **Recommended addition:** a short explicit statement of
scope ("this document covers the space segment; ground-segment network security is
addressed in [a document that does not yet exist]") so the gap is acknowledged
rather than silently absent.

---

## Summary Table

| # | Scenario | Verdict |
|---|---|---|
| 1 | Spoofed command | HOLDS |
| 2 | Replay attack | HOLDS (implementation-dependent) |
| 3 | Counterfeit hardware swap | HOLDS (assuming tamper-resistant identity) |
| 4 | Single rogue key-holder | HOLDS (assuming *m* well-chosen) |
| 5 | Compromised full quorum | GAP by honest design admission |
| 6 | Total key loss | PARTIAL — safe but frozen, no recovery procedure |
| 7 | Jamming during operation | HOLDS (safety) / GAP (availability, accepted trade-off) |
| 8 | Below-threshold signature bug | GAP — needs code-level testing, not just design review |
| 9 | Radiation bit-flip misclassification | HOLDS (fails safe) — but alert-fatigue risk noted |
| 10 | Pre-launch supply chain compromise | **GAP — most significant finding** |
| 11 | Harvest-now-decrypt-later | HOLDS going forward / PARTIAL retroactively |
| 12 | Ground-segment DoS | GAP — out of current document's scope |

## What This Stress Test Changes in the Main Document

Five concrete additions are recommended based on the above, in priority order:

1. **Add manufacturing-stage / pre-provisioning trust procedures to Layer 3**
   (Scenario 10 — the biggest gap found).
2. **State the actual quorum values (*m*-of-*n*) and the key-loss recovery scheme**
   in Section 4, rather than leaving both as unspecified "open work" (Scenarios 4–6).
3. **Add an explicit statement of scope** excluding ground-segment network security,
   or commit to writing that companion document (Scenario 12).
4. **Add replay-rejection and below-threshold-signature as named test cases** in
   Section 8's independent testing requirements (Scenarios 2 and 8).
5. **Add alert-fatigue mitigation** to Section 8's open questions (Scenario 9).

None of these are reasons to distrust the overall architecture — a stress test
that finds nothing is not a good stress test. Finding five concrete, addressable
gaps in a *concept-stage, unaudited* document is exactly what this exercise is for.
