# .nltotoi — NLT Governance Namespace

This namespace contains internal governance artifacts for the `NeuroLift-Technologies/haief` repository.

## Purpose

The `.nltotoi/` namespace is the machine-readable and tooling-oriented layer of the NLT governance system. It provides:

- **File index** — registry of all governance files and their purpose
- **Contract namespace** — formal versioned governance contracts
- **Validation scripts** — automated governance compliance checking
- **Proposals** — roadmap and amendment tracking

## Structure

```
.nltotoi/
├── README.md                        ← This file
├── index/
│   └── governance-files.md         ← Registry of all governance files
├── contracts/
│   └── README.md                   ← Contract namespace overview
├── scripts/
│   └── validate-governance.sh      ← Runs governance compliance checks
└── proposals/
    └── validation-roadmap.md       ← Planned validation improvements
```

## Canonical Contract

The canonical governance contract is: **`NLT-DEV-OTOI.md`** (repository root)

Document ID: `ORG-DEV-OTOI-1.0.2`

## Discovery

Agents and tools can use `nltotoi.json` (repository root) as the machine-readable discovery manifest for all governance file locations.

## Validation

Run governance validation from the repository root:

```bash
bash .nltotoi/scripts/validate-governance.sh
```

The script also accepts `--strict` for warning-producing checks as the validator
evolves:

```bash
bash .nltotoi/scripts/validate-governance.sh --strict
```

### What the validator checks

The current validator is a repository-local shell script. It:

- confirms the required governance files listed in the script exist;
- checks core content markers in `NLT-DEV-OTOI.md`, `AGENTS.md`, and `nltotoi.json`;
- reports pass, fail, and warning counts in human-readable output;
- exits with `0` on success or warning-only success, and `1` when checks fail;
- does not modify files.

The validator intentionally keeps running after individual failures so agents can
see the full list of missing files or missing content markers in one run.

### CI workflow

The GitHub Actions wrapper is `.github/workflows/validate-governance.yml`. It
runs on `push` and `pull_request` and executes:

```bash
bash .nltotoi/scripts/validate-governance.sh
```

The CI job does not pass `--strict`. In the current v1.0 implementation, the
called checks are required-file and content-marker checks; the roadmap tracks
additional validation that may make strict mode more useful.

### Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `MISSING: <path>` | A required governance file from the script is absent or moved. | Restore the file at the listed path or update the validator through the approved governance process. |
| `CONTENT MISSING` | A required marker such as `ORG-DEV-OTOI-1.0.2`, `Joshua W. Dorsey`, `Solidarity Framework`, or `HAIEF` is absent. | Restore the marker without changing the governance contract meaning. Escalate before changing contract language. |
| `Unknown flag` | The script only accepts `--strict`. | Re-run with no flags or with `--strict`. |
| CI fails but local run passes | The workflow runs from a clean checkout on Ubuntu. | Confirm the changed files were committed, pushed, and are present at their repository paths. |

### Current limits

The v1.0 validator does not parse JSON schema, validate every path referenced in
`nltotoi.json`, or detect orphaned governance files. Those improvements are
tracked in `.nltotoi/proposals/validation-roadmap.md`.

---

*Internal namespace — NeuroLift Technologies | ORG-DEV-OTOI-1.0.2*
