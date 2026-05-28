# Governance File Structure

**Scope:** Source-verified map for `NeuroLift-Technologies/haief` after PR #14  
**Last verified:** 2026-05-28 with `git ls-files`  
**Canonical contract:** `NLT-DEV-OTOI.md` (`ORG-DEV-OTOI-1.0.0`)

---

## Architecture Decision: Public Standards + Repo-Local Operations

| Layer | Primary files | Audience | Purpose |
|---|---|---|---|
| Public HAIEF standards | `frameworks/`, `specs/`, `_pages/`, `docs/overview.md`, `docs/governance.md` | Public contributors and readers | Explain the public governance principles, standards, and movement-facing content. |
| Repo-local agent governance | `NLT-DEV-OTOI.md`, `AGENTS.md`, `CLAUDE.md`, `SOPs/`, `templates/` | Coding agents and maintainers working in this repo | Define authority, session start, escalation, handoff, and contribution protocols. |
| Machine-readable governance | `nltotoi.json`, `.nltotoi/` | Agents, scripts, and CI | Discover required files and validate governance scaffold health. |
| Coordination records | `docs/active-threads.md`, `docs/agent-log/`, `docs/escalations/` | Current and future agents | Preserve work state, session registration, handoffs, and escalation history. |

The governance scaffold is operational documentation. Do not amend `NLT-DEV-OTOI.md`
without the formal amendment process described inside that file.

---

## Source-Verified Governance Tree

```text
haief/
├── NLT-DEV-OTOI.md                    # Canonical repo-local agent contract
├── AGENTS.md                          # Agent gateway and coordination protocol
├── CLAUDE.md                          # Entry-point instructions for coding agents
├── nltotoi.json                       # Machine-readable discovery manifest
├── file-structure.md                  # This source-verified file map
│
├── .nltotoi/
│   ├── README.md                      # Namespace overview and validation runbook
│   ├── contracts/
│   │   └── README.md                  # Contract namespace and versioning notes
│   ├── index/
│   │   └── governance-files.md        # Governance file registry
│   ├── proposals/
│   │   └── validation-roadmap.md      # Planned validation improvements
│   └── scripts/
│       └── validate-governance.sh     # Local/CI governance validator
│
├── .github/
│   ├── ISSUE_TEMPLATE/                # Public GitHub issue templates
│   └── workflows/
│       └── validate-governance.yml    # Runs the governance validator on push/PR
│
├── ISSUE_TEMPLATE/
│   ├── agent-escalation.md            # Repo-local escalation issue template reference
│   └── governance-proposal.md         # Repo-local OTOI amendment template reference
│
├── PULL_REQUEST_TEMPLATE/
│   └── agent-contribution.md          # Agent contribution checklist
│
├── SOPs/
│   ├── new-agent-onboarding.md        # SOP-NLT-001
│   ├── repo-governance-setup.md       # Repo governance setup procedure
│   └── incident-response.md           # SOP-NLT-003
│
├── agents/
│   └── nlt-governance-steward.md      # Governance guidance agent profile
│
├── docs/
│   ├── active-threads.md              # Active/resolved agent work threads
│   ├── agent-log/
│   │   ├── README.md
│   │   ├── registrations/
│   │   └── handoffs/
│   └── escalations/
│       └── README.md
│
└── templates/
    ├── agent-registration.json
    ├── commit-message.md
    ├── escalation.md
    ├── handoff-record.json
    └── intent-log.md
```

---

## Validation Workflow

Run the same validator locally and in CI:

```bash
bash .nltotoi/scripts/validate-governance.sh
```

The script currently checks:

1. Required governance files exist.
2. `NLT-DEV-OTOI.md` includes the document ID, authority marker, Solidarity Framework reference, and HAIEF reference.
3. `AGENTS.md` includes the canonical contract path and document ID.
4. `nltotoi.json` includes the repository name, document ID, and canonical contract path.

The CI entry point is `.github/workflows/validate-governance.yml`, triggered on
`push` and `pull_request`.

### Common Pitfalls

- Use `.github/workflows/validate-governance.yml`; there is no tracked `workflows/`
  directory in this repo.
- Keep `nltotoi.json`, `.nltotoi/index/governance-files.md`, and
  `.nltotoi/scripts/validate-governance.sh` aligned when adding or removing required
  governance files.
- `ISSUE_TEMPLATE/` at the repo root contains repo-local governance templates. Public
  GitHub issue templates live under `.github/ISSUE_TEMPLATE/`.
- Do not cite workflows as active controls unless the workflow file exists in
  `.github/workflows/` and has been reviewed.

---

## Maintenance Checklist

When the governance scaffold changes:

1. Update this file map and `.nltotoi/index/governance-files.md`.
2. Update `nltotoi.json` if discovery paths or required files changed.
3. Run `bash .nltotoi/scripts/validate-governance.sh`.
4. Update `docs/active-threads.md` and write a handoff in `docs/agent-log/handoffs/`.
5. Use the commit format from `templates/commit-message.md`.

---

*NeuroLift Technologies | HAIEF | ORG-DEV-OTOI-1.0.0*
