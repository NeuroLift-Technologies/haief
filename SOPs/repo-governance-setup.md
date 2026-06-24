# SOP: Repository Governance Setup

**SOP ID:** SOP-NLT-002  
**Version:** 1.0.0  
**Scope:** Setting up governance stubs in a new or existing NLT repository  
**Authority:** Joshua W. Dorsey, Sr.  
**Governed by:** ORG-DEV-OTOI-1.0.2

---

## Purpose

This SOP defines how to add the minimum required governance artifacts to a new or existing NeuroLift Technologies repository so that coding agents can operate correctly within it.

---

## When to Use This SOP

- Creating a new NLT repository
- Adding governance to an existing NLT repository that lacks it
- Auditing a repo for governance compliance

---

## Minimum Required Files per Repo

Each NLT repo should have:

| File | Purpose |
|---|---|
| `CLAUDE.md` | Agent session directive — points to org-level OTOI |
| `docs/active-threads.md` | Current work state tracker |
| `docs/agent-log/` | Directory for agent registration and handoff records |

---

## Step-by-Step Procedure

### Step 1: Create `CLAUDE.md`

Create `CLAUDE.md` at the repository root using the following template:

```markdown
# CLAUDE.md — [REPO NAME]

You are working in a NeuroLift Technologies repository.

**Mandatory reading (in order):**
1. Repo-local governance (private, primary):
   https://github.com/NeuroLift-Technologies/haief/blob/main/NLT-DEV-OTOI.md
   Public mirror (if the link above returns 404):
   https://github.com/NeuroLift-Technologies/haief/blob/main/governance/NLT-DEV-OTOI.md
2. Internal gateway (private, primary):
   https://github.com/NeuroLift-Technologies/haief/blob/main/AGENTS.md
   Public mirror (if the link above returns 404):
   https://github.com/NeuroLift-Technologies/haief/blob/main/governance/AGENTS.md
3. Project context: `docs/context/README_TO_AI.md` (this repo, if present)
4. Active threads: `docs/active-threads.md` (this repo)

**Non-negotiable:** Joshua W. Dorsey, Sr. is final authority on all architectural,
deployment, UX, and strategic decisions. Escalate. Do not guess.

**Governed by:** Solidarity Framework | HAIEF | https://elevaitionfoundation.org
**OTOI Version:** ORG-DEV-OTOI-1.0.2
```

Replace `[REPO NAME]` with the actual repository name.

Add any project-specific context below the mandatory reading section.

### Step 2: Create `docs/active-threads.md`

Create `docs/active-threads.md` with the following starting structure:

```markdown
# Active Threads — [REPO NAME]

> This file tracks active work threads. Agents must read this at session start and update it during and at the end of each session.

**Last updated:** [ISO 8601 date]

---

## Active Threads

*(No active threads yet)*

---

## Resolved Threads

*(None yet)*
```

### Step 3: Create `docs/agent-log/` Directory Structure

Create the following directory structure:

```
docs/
└── agent-log/
    ├── README.md
    ├── registrations/     ← Agent self-registrations
    └── handoffs/          ← Handoff records between sessions
```

`docs/agent-log/README.md` content:

```markdown
# Agent Log

This directory contains agent registration records and session handoff documents.

- `registrations/` — Agent self-registration files (one per session start)
- `handoffs/` — Session handoff records (written at session end)

Format reference: `NeuroLift-Technologies/haief` templates directory.
```

### Step 4: (Optional) Create `docs/escalations/` Directory

If the repo will likely generate escalations, create:

```
docs/
└── escalations/
    └── README.md
```

`docs/escalations/README.md`:

```markdown
# Escalations

This directory contains escalation records for this repository.
Each escalation document corresponds to a GitHub issue filed via the agent-escalation template.

Format reference: `templates/escalation.md` in `NeuroLift-Technologies/haief`.
```

### Step 5: Grant GitHub App Access to `haief`

Coding agents (e.g., GitHub Copilot, Codex) must be able to read the governance files in
`haief` from within the new repository. If the GitHub App installation is scoped
to **"Selected repositories"**, you must add `haief` to its access list.

1. Go to `https://github.com/organizations/NeuroLift-Technologies/settings/installations`
2. Find the GitHub App used by agents in this repo (e.g., **Copilot**, **Codex**) and click **Configure**.
3. Under **Repository access → Selected repositories**, add **`haief`**.
4. Click **Save**.

> If you cannot complete this step immediately, the `CLAUDE.md` template above includes
> public mirror URLs as fallback. See
> [`docs/troubleshooting/github-app-access.md`](../docs/troubleshooting/github-app-access.md)
> in `haief` for full instructions.

### Step 6: Commit the Governance Setup

Commit using the format:

```
[AGENT_NAME] chore(governance): add repo governance stubs (ORG-DEV-OTOI-1.0.2)
```

### Step 7: Verify

Confirm the following exist and contain correct content:
- [ ] `CLAUDE.md` points to `NLT-DEV-OTOI.md` canonical URL
- [ ] `CLAUDE.md` references `ORG-DEV-OTOI-1.0.2`
- [ ] `docs/active-threads.md` exists and is readable
- [ ] `docs/agent-log/` directory structure created
- [ ] GitHub App has access to `haief` (or public mirror fallback is in place)

---

## Validation

Run the org-level validation script to check `haief` is healthy:

```bash
git clone https://github.com/NeuroLift-Technologies/haief
cd haief
bash .nltotoi/scripts/validate-governance.sh
```

---

*SOP-NLT-002 v1.0.0 | NeuroLift Technologies | ORG-DEV-OTOI-1.0.2*
