# AGENTS.md — NeuroLift Technologies haief Repository Agent Gateway

> **Internal use only.** This is the repository-specific governance gateway for coding agents operating in this repository. This copy is scoped to NeuroLift-Technologies/haief, with project-specific operational context kept in this repository.

---

## You Are Here

You are a coding agent operating within the **NeuroLift Technologies** organization. This document is your repo-local coordination gateway.

**Mandatory reading order:**
1. `NLT-DEV-OTOI.md` — Repo-local coding agent contract (this repo, root level)
2. Repo-level `CLAUDE.md` — Project-specific context (in the repo you are working in)
3. `docs/active-threads.md` — Current work state (in the repo you are working in)

> **Repo-local note:** Governance docs in this repository are the working copy for NeuroLift-Technologies/haief. Keep references local unless Joshua explicitly asks for an upstream sync.

**Final authority:** Joshua W. Dorsey, Sr. Escalate. Do not guess.

---

## Solidarity Framework Principles (Public)

The ethical foundation of all NLT work is publicly documented in the **Solidarity Framework** and **HAIEF** (Human-AI Ethical Integration Framework):

- Repo-local governance context: [NeuroLift-Technologies/haief](https://github.com/NeuroLift-Technologies/haief)
- HAIEF reference: https://elevaitionfoundation.org

The principles are public. The operational machinery for this work lives in this repository.

---

## Coordination Protocol

### Session Start (Every Session)

```
1. Read NLT-DEV-OTOI.md (this repo)
2. Read repo-level CLAUDE.md (working repo)
3. Read docs/active-threads.md (working repo)
4. Self-register per OTOI Section 3
5. Confirm task scope before beginning
6. Work from a feature branch and open a Pull Request — never push directly to `main` or protected branches
```

### Commit Format

All agent commits must follow:

```
[AGENT_NAME] type(scope): description
```

Types: `feat`, `fix`, `docs`, `refactor`, `chore`, `test`, `ci`

All agent-authored changes must go through a Pull Request opened from a feature branch. Do not push directly to `main` or other protected branches.

### Escalation Triggers

Escalate to Joshua immediately when:
- Task scope is unclear or conflicts with existing work
- An architectural or deployment decision is required
- A blocker cannot be resolved by the agent
- An ethical concern arises
- LLM provider or external service selection is needed

Use the escalation template: `templates/escalation.md`

---

## Guardrails

These are **non-negotiable**. No exceptions without explicit Joshua approval:

| Guardrail | Details |
|---|---|
| No LLM provider lock-in | Do not hardcode or commit to a specific LLM provider |
| No architecture decisions | Database, deployment, framework choices require human sign-off |
| No production deployments | Human must explicitly approve all production actions |
| No credential storage | Never store secrets, tokens, or credentials in code or VCS |
| No external integrations | Third-party service connections require Joshua's approval |
| PR-only workflow | Create changes on feature branches and deliver them through Pull Requests; never push directly to `main` or other protected branches |
| No OTOI self-amendment | This governance doc cannot be changed by agents |

---

## Internal File Map

All files below live in this repository (`NeuroLift-Technologies/haief`):

```
NLT-DEV-OTOI.md                        ← Repo-local agent contract
AGENTS.md                               ← This file
nltotoi.json                            ← Discovery manifest

.nltotoi/
├── README.md                           ← Namespace overview
├── index/governance-files.md          ← File registry
├── contracts/README.md                ← Contract namespace
├── proposals/validation-roadmap.md    ← Validation roadmap
└── scripts/validate-governance.sh     ← Governance validation

templates/
├── agent-registration.json            ← OTOI Section 3 registration format
├── handoff-record.json                ← OTOI Section 5 handoff format
├── escalation.md                      ← OTOI Section 4.3 escalation format
└── intent-log.md                      ← Intent logging template

ISSUE_TEMPLATE/
├── agent-escalation.md                ← GitHub escalation issue form
└── governance-proposal.md             ← OTOI amendment proposal form

PULL_REQUEST_TEMPLATE/
└── agent-contribution.md              ← Agent PR checklist

workflows/
└── validate-governance.yml            ← CI: runs validate-governance.sh

SOPs/
├── new-agent-onboarding.md            ← How to onboard a new coding agent
├── repo-governance-setup.md           ← How to add governance to a new NLT repo
└── incident-response.md               ← What to do when an agent goes off-rails
```

---

## Multi-Agent Coordination

When multiple agents may be active:

1. **Check active-threads.md first** — do not begin work already in progress
2. **Claim your thread** — update active-threads.md when starting a task
3. **Write handoff records** — never leave a session without a handoff document
4. **Do not overwrite peer work** — if conflict is detected, escalate

---

## Handoff Protocol

Before ending any significant session:

1. Update `docs/active-threads.md` in the working repo
2. Write a handoff record to `docs/agent-log/handoffs/` using `templates/handoff-record.json`
3. Document any open escalations in `docs/escalations/`
4. Summarize decisions made and decisions pending

---

*Internal governance document — NeuroLift Technologies | ORG-DEV-OTOI-1.0.3*
