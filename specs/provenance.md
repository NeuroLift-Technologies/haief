# Provenance Specification

## Overview

This specification defines provenance requirements for HAIEF-compliant AI systems. Provenance ensures that all AI interactions, decisions, and multi-agent handoffs maintain a clear, auditable chain of origin and transformation.

## Purpose

Provenance answers: *"What happened, who did it, when, and why?"*

In multi-agent AI systems, provenance is the foundation of accountability. Without it, users cannot know which agent made which decision, whether their TOI was honored at each step, or where a harmful output originated. With it, governance becomes verifiable rather than aspirational.

## Scope

This specification applies to:

- All AI agent actions taken on behalf of a user
- All inter-agent handoffs in orchestrated multi-agent systems
- All decisions influenced by the user's TOI
- All data transformations on user-provided content

---

## Requirements

### R1 — Unique Interaction Identifiers

Every AI interaction MUST be assigned a globally unique identifier (UUID v4 or equivalent) at the point of origination. This ID MUST:

- Persist through all transformations of that interaction
- Be included in any handoff record passing this interaction to another agent
- Be recoverable from any output produced by the interaction

### R2 — Agent Identity Binding

Each provenance record MUST include the identity of the agent that produced it:

- Agent name and version
- The TOI or orchestration context under which the agent was operating
- Whether the agent is first-party (user-initiated) or delegated (invoked by another agent)

### R3 — Timestamp Integrity

Provenance records MUST include:

- `initiated_at`: when the interaction was received by the agent
- `responded_at`: when the agent produced its output
- All timestamps MUST be UTC ISO 8601 format

### R4 — TOI Compliance Record

Each provenance record MUST include a compliance attestation:

- Which TOI version was active at time of interaction
- Whether any TOI constraints were applied
- Whether any TOI conflicts were detected and how they were resolved

### R5 — Immutability

Provenance records MUST NOT be modified after creation. Systems may append to provenance chains but MUST NOT alter prior records. Append-only storage is the recommended implementation pattern.

### R6 — User Accessibility

Users MUST be able to retrieve provenance records for their own interactions:

- Full provenance chain for any interaction, on request
- Human-readable summary format available
- Machine-readable format (JSON) available for export
- Retrieval MUST be available for the duration of the user's data retention window

---

## Provenance Record Schema

Minimum required fields for a HAIEF-compliant provenance record:

```json
{
  "provenance_id": "uuid-v4",
  "interaction_id": "uuid-v4",
  "parent_interaction_id": "uuid-v4 | null",
  "agent": {
    "name": "string",
    "version": "semver",
    "delegation_source": "string | null"
  },
  "toi": {
    "version": "string",
    "constraints_applied": ["string"],
    "conflicts_detected": ["string"]
  },
  "timestamps": {
    "initiated_at": "ISO 8601",
    "responded_at": "ISO 8601"
  },
  "action_type": "string",
  "output_hash": "sha256 | null"
}
```

---

## Multi-Agent Provenance Chains

In multi-agent systems, provenance records form a chain:

```
User Request
    │ provenance_id: A
    ▼
Agent 1 (Orchestrator)
    │ provenance_id: B, parent_interaction_id: A
    ▼
Agent 2 (Sub-task)
    │ provenance_id: C, parent_interaction_id: B
    ▼
Response to User
```

Each record in the chain MUST reference its parent via `parent_interaction_id`. A missing parent reference constitutes a **provenance gap** — a compliance violation that MUST be flagged in OTOI logs.

---

## Privacy Considerations

Provenance records may contain sensitive information. Implementations MUST:

- Apply the user's TOI data retention policy to provenance records
- Encrypt provenance records at rest
- Not share provenance records across user accounts
- Honor user deletion requests in accordance with the declared retention policy
- Never include raw user message content in provenance records — reference by hash only

---

## Relationship to Other Specifications

- **Identity Integrity** — Provenance records are only meaningful when the agent identity they reference is verifiable. See `identity-integrity.md`.
- **Handoff Rules** — Each handoff event MUST produce a provenance record linking the outgoing and incoming agents. See `handoff-rules.md`.
- **OTOI** — The OTOI Orchestrator is the enforcement point for provenance in multi-agent systems.

---

*This is a living document maintained by the HAIEF community.*
