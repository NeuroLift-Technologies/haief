# Governance File Index — NeuroLift Technologies `haief`

**Last updated:** 2026-05-28  
**Maintained by:** `.nltotoi/` namespace tooling  
**Scope:** `NeuroLift-Technologies/haief`

---

## Core Governance Files

| File | Type | Purpose | Required |
|---|---|---|---|
| `NLT-DEV-OTOI.md` | Contract | Org-level coding agent contract (ORG-DEV-OTOI-1.0.2) | ✅ |
| `AGENTS.md` | Gateway | Internal agent coordination gateway | ✅ |
| `nltotoi.json` | Manifest | Machine-readable discovery manifest | ✅ |
| `README.md` | Overview | Repository overview and purpose | ✅ |
| `file-structure.md` | ADR | Architecture decision record for this repo structure | ✅ |
| `CLAUDE.md` | Instructions | Agent session instructions and plan | ✅ |

---

## .nltotoi Namespace

| File | Purpose | Required |
|---|---|---|
| `.nltotoi/README.md` | Namespace overview | ✅ |
| `.nltotoi/index/governance-files.md` | This file — governance registry | ✅ |
| `.nltotoi/contracts/README.md` | Contract namespace and versioning | ✅ |
| `.nltotoi/scripts/validate-governance.sh` | Automated compliance validation | ✅ |
| `.nltotoi/proposals/validation-roadmap.md` | Planned validation improvements | ✅ |

---

## Templates

| File | Purpose | Source |
|---|---|---|
| `templates/agent-registration.json` | Agent self-registration format | OTOI Section 3 |
| `templates/handoff-record.json` | Session handoff format | OTOI Section 5 |
| `templates/escalation.md` | Escalation record format | OTOI Section 4.3 |
| `templates/intent-log.md` | Intent logging before action | OTOI Section 7 |
| `templates/commit-message.md` | Commit message format reference | OTOI Section 4.2, SOP-NLT-001 Step 7 |

---

## GitHub Templates

| File | Purpose |
|---|---|
| `ISSUE_TEMPLATE/agent-escalation.md` | GitHub issue form for agent escalations |
| `ISSUE_TEMPLATE/governance-proposal.md` | GitHub issue form for OTOI amendment proposals |
| `PULL_REQUEST_TEMPLATE/agent-contribution.md` | Agent PR checklist with governance requirements |

---

## CI Workflows

Only workflows present in this repository are listed here. Planned reusable or
org-wide workflows belong in `.nltotoi/proposals/validation-roadmap.md` until
they are added to the tree.

| File | Purpose | Trigger | SOP |
|---|---|---|---|
| `.github/workflows/validate-governance.yml` | Governance validation (runs validate-governance.sh) | push, pull_request | SOP-NLT-002 |

---

## Agent Coordination Logs

| File | Purpose | Required |
|---|---|---|
| `docs/active-threads.md` | Tracks current and resolved work threads | ✅ |
| `docs/agent-log/README.md` | Explains registration and handoff log locations | ✅ |
| `docs/escalations/README.md` | Explains where escalation records live | Optional |

Session-specific files under `docs/agent-log/registrations/` and
`docs/agent-log/handoffs/` are records, not templates. Agents create them as
they enter and leave significant sessions.

---

## Composite Actions

| Path | Purpose |
|---|---|
| *(None currently present)* | Planned composite actions should be added to this index when implemented. |

---

## Agent Profiles (`agents/`)

| File | Purpose | Required |
|---|---|---|
| `agents/nlt-governance-steward.md` | Governance steward agent — enforces ORG-DEV-OTOI-1.0.2 | ✅ |

---

## Agent Profiles — VS Code / GitHub Copilot Chat (`.github/agents/`)

| File | Purpose | Required |
|---|---|---|
| *(None currently present)* | Add entries here when `.github/agents/*.agent.md` profiles are introduced. | Optional |

---

## SOPs (Standard Operating Procedures)

| File | Purpose |
|---|---|
| `SOPs/new-agent-onboarding.md` | How to onboard a new coding agent |
| `SOPs/repo-governance-setup.md` | How to add governance stubs to a new NLT repo |
| `SOPs/incident-response.md` | What to do when an agent goes off-rails |

---

## File Count Summary

| Category | Count |
|---|---|
| Core governance | 6 |
| .nltotoi namespace | 5 |
| Templates | 5 |
| GitHub templates | 3 |
| CI workflows | 1 |
| Agent coordination docs | 3 |
| SOPs | 3 |
| Agent profiles | 1 |
| VS Code agent profiles | 0 |
| Composite actions | 0 |
| **Total** | **27** |

---

*Generated from `.nltotoi/index/governance-files.md` | NeuroLift Technologies | ORG-DEV-OTOI-1.0.2*
