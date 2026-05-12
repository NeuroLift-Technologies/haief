# Identity Integrity Specification

## Overview

This specification defines identity integrity requirements for HAIEF-compliant AI systems. Identity integrity ensures AI agents maintain consistent, verifiable identities throughout their lifecycle and interactions.

## Purpose

Identity integrity answers: *"Who is this agent, is it who it claims to be, and has it changed?"*

Without identity integrity:
- Users cannot know whether they are interacting with the same agent across sessions
- Multi-agent handoffs can introduce unverified or malicious agents into trusted interaction chains
- TOI compliance cannot be attributed to a specific agent
- Accountability breaks down at system boundaries

## Scope

This specification applies to:

- All AI agents interacting directly with users
- All agents participating in OTOI-governed multi-agent orchestrations
- Identity declarations made at agent initialization and during handoffs
- Identity verification at trust boundaries

---

## Requirements

### R1 — Mandatory Identity Declaration

Every HAIEF-compliant AI agent MUST declare its identity before first user interaction. The declaration MUST include:

- `agent_name`: Human-readable name
- `agent_id`: Unique stable identifier (not session-specific)
- `agent_version`: Semantic version of the agent
- `provider`: The organization responsible for the agent
- `toi_compliance_level`: The HAIEF compliance level this agent claims

### R2 — Transparency of Role

Agents MUST clearly disclose:

- That they are an AI system (not a human), when sincerely asked
- Whether they are operating in a multi-agent orchestration
- Whether they are acting as a primary agent or a delegated sub-agent
- Which TOI they are currently operating under

### R3 — Consistency Across Sessions

An agent's identity MUST remain consistent:

- Agent name and provider MUST NOT change between sessions without explicit user notification
- Version changes MUST be disclosed to the user before interaction continues
- Identity changes MUST trigger a re-confirmation that the existing TOI still applies

### R4 — Handoff Identity Verification

During multi-agent handoffs, OTOI MUST verify:

- The receiving agent's identity is declared
- The receiving agent is on the user's approved list, if the TOI specifies one
- The receiving agent claims the same or higher HAIEF compliance level required by the user's TOI
- A provenance record is created linking the outgoing and incoming agents

### R5 — Prohibition on Impersonation

Agents MUST NOT:

- Claim to be human when sincerely asked
- Impersonate a specific human individual
- Claim to be a different AI agent than they are
- Adopt a persistent identity across sessions without explicit user consent to that continuity

### R6 — Identity Drift Detection

OTOI implementations SHOULD detect and flag identity drift — conditions where an agent's behavior no longer matches its declared identity profile. Triggers include:

- Significant change in response style without a corresponding version update
- Inconsistent compliance claims across sessions
- Contradictory capability declarations

---

## Identity Declaration Schema

Minimum fields for a HAIEF-compliant agent identity record:

```json
{
  "agent_id": "stable-uuid-or-stable-string",
  "agent_name": "string",
  "agent_version": "semver",
  "provider": {
    "name": "string",
    "contact": "email or URL"
  },
  "toi_compliance_level": "haief-1.0 | haief-1.0-extended",
  "capabilities": ["string"],
  "disclosure": {
    "is_ai": true,
    "delegation_depth": 0,
    "primary_agent": "agent_id | null"
  }
}
```

---

## Trust Levels

HAIEF defines three identity trust levels for multi-agent contexts:

| Level | Description | Implication |
|-------|-------------|-------------|
| **Verified** | Agent identity cryptographically signed by provider | Full trust; may participate in sensitive operations |
| **Declared** | Agent identity self-declared; no cryptographic proof | Standard trust; accepted for most operations |
| **Unknown** | Agent identity not declared | OTOI defaults to maximum restriction |

If a user's TOI does not specify trust level requirements, OTOI MUST accept only **Declared** or higher.

---

## Version Change Disclosure

When an agent's version changes between sessions:

1. The agent MUST disclose the version change at the start of the next session
2. The disclosure MUST include what changed in human-readable terms (or a link to a changelog)
3. The agent MUST confirm the user's existing TOI still applies, or prompt for re-confirmation if the change materially affects TOI compliance

---

## Relationship to Other Specifications

- **Provenance** — Identity integrity is a prerequisite for valid provenance. A provenance record from an agent with **Unknown** identity status MUST be flagged as unverified. See `provenance.md`.
- **Handoff Rules** — Handoffs require identity verification of the receiving agent before any context is transferred. See `handoff-rules.md`.
- **OTOI** — The OTOI Orchestrator enforces identity integrity at agent boundaries in multi-agent systems.

---

*This is a living document maintained by the HAIEF community.*
