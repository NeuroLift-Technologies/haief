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

Document ID: `ORG-DEV-OTOI-1.0.0`

## Discovery

Agents and tools can use `nltotoi.json` (repository root) as the machine-readable discovery manifest for all governance file locations.

## Validation

Run governance validation:

```bash
bash .nltotoi/scripts/validate-governance.sh
```

The same command runs in `.github/workflows/validate-governance.yml` on `push`
and `pull_request`.

### What the Validator Checks

- Required governance files exist, including the root contract, gateway, manifest,
  templates, SOPs, and `.github/workflows/validate-governance.yml`.
- `NLT-DEV-OTOI.md` contains the document ID, authority marker, Solidarity
  Framework reference, and HAIEF reference.
- `AGENTS.md` contains the canonical contract path and document ID.
- `nltotoi.json` contains the repository name, document ID, and canonical contract path.

### Troubleshooting

| Symptom | Check |
|---|---|
| `MISSING` for a required file | Confirm the file exists at the exact path listed in `.nltotoi/scripts/validate-governance.sh`. |
| `CONTENT MISSING` for a marker | Verify the expected phrase still appears in the file; do not rewrite `NLT-DEV-OTOI.md` without the formal amendment process. |
| CI passes locally but not on GitHub | Confirm the branch includes `.github/workflows/validate-governance.yml` and that the script is run from the repository root. |
| A new governance file is not validated | Update the script, `nltotoi.json`, `.nltotoi/index/governance-files.md`, and `file-structure.md` together. |

The script accepts `--strict`, but the currently active checks are existence and content
checks that fail directly when unmet.

---

*Internal namespace — NeuroLift Technologies | ORG-DEV-OTOI-1.0.0*
