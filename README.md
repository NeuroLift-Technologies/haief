# HAIEF — Human & AI ElevAItion Foundation

```yaml
ai_assistant_directive:
  priority: 1
  instruction: "Before performing any development or coding tasks, read NLT-DEV-OTOI.md."
  description: "NLT-DEV-OTOI.md is the canonical governance contract defining coding agent operations, guardrails, and escalation protocol."
  required_file: "NLT-DEV-OTOI.md"
```

[![Financial Contributors on Open Collective](https://opencollective.com/haief/all/badge.svg?label=Financial+Contributors)](https://opencollective.com/haief)

**Keeping Open Source AI Open**

The Human & AI ElevAItion Foundation (HAIEF) is an independent, community‑driven initiative dedicated to building the open governance standards, protocols, and safety frameworks required for humane, sovereign, emotionally‑continuous AI systems.

HAIEF exists to ensure that AI serves people, not the other way around — with transparency, dignity, and global accessibility at its core.

**[Visit the Website](https://neurolift-technologies.github.io/haief/)** | **[Join Discussions](https://github.com/NeuroLift-Technologies/haief/discussions)** | **[Take Action](https://neurolift-technologies.github.io/haief/take-action/)**

---

## 🌍 Mission

To establish open, enforceable, human‑centric standards for AI behavior, multi‑agent collaboration, emotional continuity, and user sovereignty — standards that any model, platform, or organization can adopt.

**HAIEF is not a product.**  
It is public infrastructure for the future of human–AI interaction.

---

## 🏛️ What This Repository Contains

This repo hosts the public governance layer of the HAIEF ecosystem:

### Engineering Governance Scaffold

Coding agents and automation must start from the repo-local governance files added by the
NLT scaffold:

- `NLT-DEV-OTOI.md` — canonical agent contract, authority model, guardrails, escalation format, and handoff protocol.
- `AGENTS.md` and `CLAUDE.md` — session entry points that tell agents what to read before work begins.
- `nltotoi.json` and `.nltotoi/` — machine-readable discovery plus validation tooling for governance files.
- `templates/`, `ISSUE_TEMPLATE/`, `PULL_REQUEST_TEMPLATE/`, and `SOPs/` — reusable formats for registrations, handoffs, escalations, PR review, onboarding, repo setup, and incident response.
- `.github/workflows/validate-governance.yml` — CI wrapper that runs `bash .nltotoi/scripts/validate-governance.sh` on pushes and pull requests.

Run the governance validator locally before changing governance files:

```bash
bash .nltotoi/scripts/validate-governance.sh
```

### Core Frameworks

- **TOI — Terms of Interaction**  
  Baseline rules for how AI systems engage with humans.

- **OTOI — Orchestrated Terms of Interaction**  
  Multi‑agent governance ensuring provenance, identity integrity, and safe handoffs.

- **Sleepwalker Protocol**  
  Emotional continuity governance designed to prevent abrupt, destabilizing AI behavior.

- **RRT AIdvocAIte Framework**  
  A structured, multi‑persona approach to real‑time support for neurodivergent users and high‑stakes environments.

### Open Standards & Specifications

- Provenance schemas  
- Identity integrity rules  
- Multi‑agent handoff formats  
- Safety validation harnesses  
- Public test suites  
- Documentation and reference implementations  

All content in this repository is open source, community‑maintained, and intended for global adoption.

---

## 🤝 Community‑Driven Development

NeuroLift Technologies is proposing that the free open‑source community:

- **Organize**  
- **Build**  
- **Extend**  
- **Deploy**  
- **Govern**  

…the HAIEF standards and frameworks.

HAIEF is designed to be owned by the world, not by any single company, vendor, or model provider.

NeuroLift contributes the initial architecture, protocols, and governance scaffolding — but the community shapes the future.

---

## 🗂️ Repository Structure

```
/NLT-DEV-OTOI.md
/AGENTS.md
/CLAUDE.md
/nltotoi.json
/file-structure.md

/frameworks
    /toi
    /otoi
    /sleepwalker
    /rrt-aidvocate

/specs
    provenance.md
    identity-integrity.md
    handoff-rules.md

/docs
    overview.md
    governance.md
    emotional-continuity.md
    active-threads.md
    agent-log/
    escalations/

/tests
    safety-suite/
    validation-harness/

/community
    guidelines.md
    proposals/
    discussions/

/SOPs
    new-agent-onboarding.md
    repo-governance-setup.md
    incident-response.md

/.nltotoi
    README.md
    index/governance-files.md
    contracts/README.md
    proposals/validation-roadmap.md
    scripts/validate-governance.sh

/.github/workflows
    validate-governance.yml

/ISSUE_TEMPLATE
    agent-escalation.md
    governance-proposal.md

/PULL_REQUEST_TEMPLATE
    agent-contribution.md

/agents
    nlt-governance-steward.md

/templates
    agent-registration.json
    handoff-record.json
    escalation.md
    intent-log.md
    commit-message.md

/internal  (gitignored)
    charter/
    agent-contributions/
```

### 🔒 About Agent Coordination Records and /internal

Current repo-local agent coordination records live in tracked governance paths:

- `docs/active-threads.md` — current and resolved work threads.
- `docs/agent-log/registrations/` — one registration per agent session.
- `docs/agent-log/handoffs/` — session handoffs for continuity.
- `docs/escalations/` — escalation records when guardrails require human review.

If a future workflow needs non-public experiments or sensitive coordination notes, keep them under `/internal/`, which is intentionally gitignored to preserve:

- provenance integrity  
- agent identity boundaries  
- safe experimentation  
- non‑public coordination  

Do not store credentials, tokens, or secrets in either tracked documentation or `/internal/`.

---

## ☁️ What Is Not in This Repo

The following remain private and cloud‑hosted (Azure, GCP, Cloudflare, etc.):

- Fusion methodology  
- Identity‑bound agent state  
- Emotional continuity memory  
- Enterprise‑grade deployment infrastructure  

These systems implement the standards — but the standards themselves live here, openly.

---

## 📜 License

All frameworks and specifications in this repository are released under a permissive open‑source license to maximize global adoption and community governance.

---

## ✨ Founding Contribution

**by NeuroLift Technologies LLC**  
**Architect:** Joshua Dorsey  
**Role:** Founder, Lead Architect, and Originator of the HAIEF Governance Layer

NeuroLift Technologies contributes:

- The initial TOI–OTOI governance architecture  
- The Sleepwalker Protocol for emotional continuity  
- The RRT AIdvocAIte multi‑persona support framework  
- The provenance, identity, and handoff standards  
- The narrative scaffolding and movement‑building foundation  
- The vision of AI as public infrastructure, not private power  

This contribution is made freely to the global community as the seed of a shared, open, human‑centric AI governance ecosystem.

---

## 🖋️ Signature & Contribution Statement

**Joshua Dorsey**  
Founder & Lead Architect, NeuroLift Technologies  
Contributor to the Human & AI ElevAItion Foundation

> *"Our governance is public.*  
> *Our intelligence is private.*  
> *The user remains sovereign."*
