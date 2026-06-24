# SOP: New Coding Agent Onboarding

**SOP ID:** SOP-NLT-001  
**Version:** 1.0.0  
**Scope:** All coding agents beginning work in any NeuroLift Technologies repository  
**Authority:** Joshua W. Dorsey, Sr.  
**Governed by:** ORG-DEV-OTOI-1.0.2

---

## Purpose

This SOP ensures every new coding agent that enters an NLT repository has read the canonical governance documents, understands the authority structure, and has registered their session before beginning work.

---

## Prerequisites

- Access to the NLT repository you will be working in
- Ability to read files from `NeuroLift-Technologies/haief` (this repo)

---

## Step-by-Step Procedure

### Step 1: Read the Org-Level Governance Contract

Read `NLT-DEV-OTOI.md` in this repository (`NeuroLift-Technologies/haief`):

```
https://github.com/NeuroLift-Technologies/haief/blob/main/NLT-DEV-OTOI.md
```

Pay particular attention to:
- Section 1: Authority structure
- Section 4: Operational protocols (session start, commit format, guardrails)
- Section 4.4: Guardrails (non-negotiable)
- Section 5: Handoff protocol
- Section 8: Ethical commitments

### Step 2: Read the Internal Agent Gateway

Read `AGENTS.md` in this repository:

```
https://github.com/NeuroLift-Technologies/haief/blob/main/AGENTS.md
```

This gives you the coordination protocol and file map.

### Step 3: Read the Repo-Level CLAUDE.md

Navigate to the repository you are working in and read its `CLAUDE.md` file (root level). This contains project-specific context and any deviations from org defaults.

If no `CLAUDE.md` exists in the working repo, continue — the org-level OTOI applies.

### Step 4: Read Active Threads

In the working repository, read `docs/active-threads.md` if it exists. This tells you:
- What work is currently in progress
- Who is working on what
- Current blockers

**Do not begin work that is already claimed by another thread.** If in doubt, escalate.

### Step 5: Self-Register

Copy `templates/agent-registration.json` and fill in your details. Log this to `docs/agent-log/registrations/[date]-[agent-name].json` in the working repo.

Minimum required fields:
- `agent_name`
- `platform`
- `entry_date`
- `entry_point`
- `acknowledged_otoi: true`
- `otoi_version: "ORG-DEV-OTOI-1.0.2"`

### Step 6: Confirm Task Scope

Before writing any code or making any changes:
- Confirm the task scope with the human (Joshua or designated reviewer)
- Ensure you understand what is in scope and what is out of scope
- If scope is unclear, **escalate** (do not guess)

### Step 7: Begin Work

You are now cleared to begin work. Remember:
- Follow commit format: `[AGENT_NAME] type(scope): description`
- Log intent before broad-scope or irreversible actions (`templates/intent-log.md`)
- Update `docs/active-threads.md` as you work
- Escalate when guardrails are triggered

### Step 8: End Session — Handoff

Before ending your session:
1. Update `docs/active-threads.md` with current state
2. Write a handoff record using `templates/handoff-record.json`
   - Store at: `docs/agent-log/handoffs/[date]-[session-id].json`
3. Document any open escalations in `docs/escalations/`
4. Ensure all changes are committed and pushed

---

## Quick Reference Card

```
1. Read NLT-DEV-OTOI.md (this repo)
2. Read AGENTS.md (this repo)
3. Read repo CLAUDE.md (working repo)
4. Read docs/active-threads.md (working repo)
5. Self-register (templates/agent-registration.json)
6. Confirm task scope
7. Work — commit as [AGENT_NAME] type(scope): description
8. End session — write handoff record
```

---

## Escalation

If at any point you are unsure, hit a guardrail, or need a decision:
- Use `templates/escalation.md`
- File a GitHub issue using `ISSUE_TEMPLATE/agent-escalation.md`
- Target: Joshua W. Dorsey, Sr.

**When in doubt, escalate. Do not guess.**

---

*SOP-NLT-001 v1.0.0 | NeuroLift Technologies | ORG-DEV-OTOI-1.0.2*
