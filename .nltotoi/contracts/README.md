# .nltotoi/contracts — Governance Contract Namespace

This directory is the versioned governance contract namespace for NeuroLift Technologies.

## Canonical Contract

| Document | Path | Version |
|---|---|---|
| NLT Developer Operations & Team Orientation Index | `NLT-DEV-OTOI.md` (root) | ORG-DEV-OTOI-1.0.0 |

The canonical contract lives at **`NLT-DEV-OTOI.md`** in the repository root, not inside this namespace directory. This README serves as the reference pointer for tooling and agents.

## Contract Versioning

Contracts follow semantic versioning: `ORG-DEV-OTOI-MAJOR.MINOR.PATCH`

- **MAJOR** — breaking changes to agent protocols or authority structure
- **MINOR** — additions to protocols, new sections, new templates
- **PATCH** — corrections, clarifications, minor updates

## Amendment Process

1. File a `governance-proposal` GitHub issue (use template: `ISSUE_TEMPLATE/governance-proposal.md`)
2. Joshua W. Dorsey, Sr. reviews and approves
3. Version number increments in `NLT-DEV-OTOI.md` header and `nltotoi.json`
4. Commit with: `[HUMAN] docs(governance): update OTOI to vX.Y.Z`

Agents may **not** self-amend governance contracts.

## Historical Contracts

Future versions of the contract will be archived here as:
- `.nltotoi/contracts/archive/ORG-DEV-OTOI-{version}.md`

---

*Contract namespace — NeuroLift Technologies | ORG-DEV-OTOI-1.0.0*
