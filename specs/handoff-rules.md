# Handoff Rules Specification

## Overview

This specification defines handoff rules for multi-agent collaboration in HAIEF-compliant systems. Handoff rules ensure safe, transparent, and trackable transitions between AI agents.

## Purpose

Handoffs are where accountability breaks most often in multi-agent systems. A user's protections — declared in their TOI — must survive every transition between agents, whether those transitions are planned, triggered by context, or required by system architecture.

## Scope

This specification applies to:

- Any transition where one AI agent transfers task execution to another
- Orchestrator-to-subagent delegations
- Agent-to-agent handoffs at capability or context boundaries
- Session transfers (user moving between AI systems mid-interaction)

---

## Requirements

### R1 — Explicit Handoff Records

Every handoff MUST produce an explicit handoff record before the transition occurs. This record MUST be created by the outgoing agent and acknowledged by the receiving agent before the user's context is transferred.

### R2 — TOI Portability

The user's active TOI MUST be transmitted with every handoff. The receiving agent MUST:

- Parse and acknowledge the TOI before accepting the handoff
- Confirm it can honor the TOI's declarations
- Refuse the handoff and return control to the originating agent if it cannot honor the TOI

### R3 — Sleepwalker State Preservation

If the Sleepwalker Protocol is active for the user at handoff time, the receiving agent MUST:

- Receive the SWP state context
- Maintain protective behavior without resetting or overriding it
- NOT prompt the user to re-justify their protective state

### R4 — User Notification

Handoffs MUST be disclosed to the user:

- **Synchronous disclosure** — user is informed before the handoff completes (preferred)
- **Deferred disclosure** — user is informed at the start of the next interaction with the receiving agent (minimum acceptable)

Silent, undisclosed handoffs are a compliance violation except in specific crisis scenarios defined by R5.

### R5 — RRT AIdvocAIte Crisis Exception

During an active RRT AIdvocAIte intervention, handoffs to crisis-specialized agents may occur without prior user notification if:

- The user's TOI explicitly permits crisis handoffs, OR
- The user is in a state where notification would cause harm, as determined by the RRT AIdvocAIte's crisis assessment

In all cases, the user MUST be informed about crisis handoffs at the earliest safe opportunity after stabilization.

### R6 — Rollback Capability

If a receiving agent cannot honor the user's TOI, the handoff MUST be reversible:

- The originating agent retains context until the handoff is confirmed
- Rollback returns the user to the originating agent's state
- No user data or context is lost during a rolled-back handoff

### R7 — Provenance Linkage

All handoffs MUST produce provenance records that link the outgoing and receiving agents. See [Provenance Specification](./provenance.md).

---

## Handoff Record Schema

Minimum required fields for a HAIEF-compliant handoff record:

```json
{
  "handoff_id": "uuid-v4",
  "provenance_id": "uuid-v4",
  "interaction_id": "uuid-v4",
  "parent_interaction_id": "uuid-v4 | null",
  "from_agent": {
    "agent_id": "string",
    "agent_version": "semver"
  },
  "to_agent": {
    "agent_id": "string",
    "agent_version": "semver"
  },
  "toi_version": "string",
  "toi_transmitted": true,
  "swp_state": {
    "active": "boolean",
    "context_transmitted": "boolean"
  },
  "user_notified": "boolean",
  "notification_timing": "synchronous | deferred | crisis-exception",
  "handoff_reason": "string",
  "timestamps": {
    "initiated_at": "ISO 8601",
    "confirmed_at": "ISO 8601 | null"
  },
  "status": "pending | confirmed | refused | rolled-back"
}
```

Field definitions:

- `handoff_id` — Unique identifier for this handoff event.
- `provenance_id` — The provenance record ID that this handoff contributes to.
- `interaction_id` — The interaction being handed off (required by Provenance R1; used to link into the provenance chain).
- `parent_interaction_id` — The `interaction_id` of the interaction that triggered this handoff; `null` for user-originated handoffs.

---

## Safety Checks

Before accepting a handoff, a receiving agent MUST verify:

| Check | Required Action on Failure |
|-------|---------------------------|
| TOI present and parseable | Refuse handoff |
| TOI declarations are supportable by this agent | Refuse handoff or disclose unsupported declarations |
| Agent identity declared (per Identity Integrity spec) | Refuse handoff |
| SWP state received (if active) | Refuse handoff |
| `interaction_id` present in handoff record | Refuse handoff |
| Provenance chain intact | Log integrity warning; proceed with caution |

---

## Conflict Resolution

When a receiving agent's defaults conflict with the incoming TOI:

1. **TOI wins** — override the default silently if it is safe to do so
2. **Disclose the conflict** — inform the user that a constraint has been applied
3. **Refuse the handoff** — if the conflict cannot be resolved safely

An agent MUST NOT accept a handoff and then silently ignore TOI declarations it cannot honor.

---

## Session Transfer Rules

When a user moves between AI systems (e.g., from one vendor to another):

- TOI MUST be portable in a vendor-neutral format
- The user's interaction history MUST NOT be automatically transmitted unless the user's TOI authorizes cross-system history sharing
- The receiving system MUST treat the user as a new session subject to their TOI, unless explicit continuity is authorized in the TOI

---

## Relationship to Other Specifications

- **Provenance** — Handoff records are a required input to the provenance chain; `interaction_id` in the handoff record satisfies Provenance R1. See `provenance.md`.
- **Identity Integrity** — Identity verification is a prerequisite for all handoffs. See `identity-integrity.md`.
- **OTOI** — The OTOI Orchestrator coordinates and enforces handoff rules in multi-agent systems.
- **Sleepwalker Protocol** — SWP state must be explicitly transmitted and preserved through handoffs.

---

*This is a living document maintained by the HAIEF community.*
