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

This script checks that all required governance files exist and contain expected content markers.

---

*Internal namespace — NeuroLift Technologies | ORG-DEV-OTOI-1.0.0*
