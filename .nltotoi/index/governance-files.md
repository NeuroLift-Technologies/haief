# Governance File Index — NeuroLift Technologies `haief`

**Last updated:** 2026-05-28  
**Maintained by:** `.nltotoi/` namespace tooling and documentation automation  
**Scope:** Source-verified governance files tracked in `NeuroLift-Technologies/haief`

---

## Core Governance Files

| File | Type | Purpose | Required |
|---|---|---|---|
| `NLT-DEV-OTOI.md` | Contract | Canonical repo-local coding agent contract (`ORG-DEV-OTOI-1.0.0`) | Yes |
| `AGENTS.md` | Gateway | Internal agent coordination gateway and file map | Yes |
| `CLAUDE.md` | Instructions | Session entry instructions for coding agents | Yes |
| `nltotoi.json` | Manifest | Machine-readable governance discovery manifest | Yes |
| `README.md` | Overview | Public project overview plus engineering governance entry points | Yes |
| `file-structure.md` | File map | Source-verified governance structure, validation workflow, and pitfalls | Yes |

---

## `.nltotoi` Namespace

| File | Purpose | Required |
|---|---|---|
| `.nltotoi/README.md` | Namespace overview and validation runbook | Yes |
| `.nltotoi/contracts/README.md` | Contract namespace and versioning notes | Yes |
| `.nltotoi/index/governance-files.md` | This source-verified governance registry | Yes |
| `.nltotoi/proposals/validation-roadmap.md` | Planned validation improvements | Yes |
| `.nltotoi/scripts/validate-governance.sh` | Local and CI governance validator | Yes |

---

## Templates and Agent Records

| File or directory | Purpose | Source |
|---|---|---|
| `templates/agent-registration.json` | Agent self-registration format | OTOI Section 3 |
| `templates/handoff-record.json` | Session handoff format | OTOI Section 5 |
| `templates/escalation.md` | Escalation record format | OTOI Section 4.3 |
| `templates/intent-log.md` | Intent logging before significant actions | OTOI Section 7 |
| `templates/commit-message.md` | Commit message format reference | OTOI Section 4.2 |
| `docs/active-threads.md` | Active and resolved multi-agent work threads | OTOI Section 6 |
| `docs/agent-log/` | Session registrations and handoffs | OTOI Sections 3 and 5 |
| `docs/escalations/` | Escalation record storage | OTOI Section 4.3 |

---

## GitHub and Repo-Local Contribution Templates

| File or directory | Purpose |
|---|---|
| `.github/ISSUE_TEMPLATE/` | Public GitHub issue templates for the HAIEF project |
| `ISSUE_TEMPLATE/agent-escalation.md` | Repo-local governance escalation issue template reference |
| `ISSUE_TEMPLATE/governance-proposal.md` | Repo-local OTOI amendment proposal template reference |
| `PULL_REQUEST_TEMPLATE/agent-contribution.md` | Agent PR checklist with governance requirements |

---

## CI Workflows

| File | Purpose | Trigger |
|---|---|---|
| `.github/workflows/validate-governance.yml` | Runs `bash .nltotoi/scripts/validate-governance.sh` | `push`, `pull_request` |

No other governance CI workflow is tracked in this repo as of the date above. If a new
workflow is added, update this registry, `file-structure.md`, and `nltotoi.json` in
the same change.

---

## SOPs and Agent Profiles

| File | Purpose |
|---|---|
| `SOPs/new-agent-onboarding.md` | SOP-NLT-001: required reading, self-registration, task scope, and handoff |
| `SOPs/repo-governance-setup.md` | Procedure for adding governance stubs to another NLT repo |
| `SOPs/incident-response.md` | SOP-NLT-003: incident triage, containment, escalation, and prevention |
| `agents/nlt-governance-steward.md` | Governance steward agent profile |

---

## Validation Coverage

`bash .nltotoi/scripts/validate-governance.sh` verifies:

1. Required governance files exist.
2. Key content markers are present in `NLT-DEV-OTOI.md`, `AGENTS.md`, and `nltotoi.json`.
3. The repository name, document ID, and canonical contract path remain discoverable.

The validator does not currently verify every row in this index or inspect GitHub branch
protection settings. Keep this index source-verified when adding, moving, or deleting files.

---

## File Count Summary

| Category | Count |
|---|---:|
| Core governance files | 6 |
| `.nltotoi` namespace files | 5 |
| Templates | 5 |
| Coordination doc roots | 3 |
| GitHub/repo-local contribution template roots | 4 |
| CI workflows | 1 |
| SOPs | 3 |
| Agent profiles | 1 |

---

*Generated from source-verified repo state | NeuroLift Technologies | ORG-DEV-OTOI-1.0.0*
