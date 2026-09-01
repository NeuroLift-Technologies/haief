---
layout: ../layouts/Base.astro
title: "What We're Building — HAIEF in Practice"
description: "HAIEF isn't a proposal. It's a working governance layer running across 66+ repositories (as of August 2026). Here's what's live, what's coming, and how to engage."
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">What We're Building</h1>
    <p class="page-header__subtitle">
      HAIEF isn't a proposal. It's a working governance layer running across 66+ repositories (as of August 2026) right now. Here's what's live, what's coming, and how to engage.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container">

## Live Today

These things are running *right now* — not proposed, not designed, not awaiting funding.

### ASFDK Harness

The runtime control plane that hooks into agent sessions and passes every prompt and tool call through governance checks before execution. Exposes TOI/OTOI checks as MCP tools any compliant client can use.

- **Repo:** [NeuroLift-Technologies/asfdk-harness](https://github.com/NeuroLift-Technologies/asfdk-harness)
- **Status:** Deployed on Cloudflare Workers
- **What it does:** Hooks into agent runtimes (Pi first), runs preflight checks against TOI/OTOI, exposes MCP tools for governance queries

### OTOI Governance Across Repositories

Every agent session across 66+ NeuroLift repositories passes through the governance layer. Before any tool call executes, any memory is written, or any handoff to another agent happens — the governance check runs first.

- **What this means:** Tool-call policy enforcement, sensitive path blocking, session-scoped governance context
- **You can see it:** Open any PR in any NeuroLift repo and watch the PR Review Hermes Bot enforce governance compliance

### HAIEF Website

The public governance documentation site at [elevaitionfoundation.org](https://elevaitionfoundation.org), deployed on Cloudflare Workers.

- **What's here:** Framework specs, the Solidarity Framework breakdown, the manifesto, safety case template, Q&A, fact-check submission
- **What's coming:** Blog, working group pages, adoption registry

### PR Review Hermes Bot

The bot that enforces governance compliance on every Pull Request across the NeuroLift organization. It's not optional — it's how governance gets enforced at the repo level.

---

## What HAIEF Is Building

These are the frameworks and standards HAIEF is developing openly.

### The Solidarity Framework

HAIEF's governance architecture, built in two layers:

**Constitutional Layer** — the rules of relationship:
- **TOI (Terms of Interaction):** A user's bill of rights for AI. Declares preferences, boundaries, and requirements that should follow the user across platforms.
- **OTOI (Orchestrated Terms of Interaction):** Multi-agent governance ensuring provenance, identity integrity, and safe handoffs when multiple AI systems coordinate.

**Protective Layer** — real-time enforcement:
- **Sleepwalker Protocol:** Emotional continuity governance. Reduces the risk of abrupt or destabilizing AI behavior changes across session and behavioral transitions.
- **RRT AIdvocAIte Framework:** Multi-persona support for neurodivergent users and crisis situations. Not a replacement for human care — a governance layer for safe, consistent AI support behavior.

### Governance Relationship

HAIEF doesn't replace AAIF, the EU AI Act, or OSI. It sits above them.

```text
                HUMAN SOVEREIGNTY
                       │
                     HAIEF
                       │
            ┌──────────┴──────────┐
            │                     │
           TOI                   OTOI
            │                     │
     User governance       Agent governance
            │                     │
            └──────────┬──────────┘
                       │
                ASFDK / Runtime
                       │
             ┌─────────┼─────────┐
             │         │         │
           MCP       Agents    Models
```

AAIF defines how agents communicate. EU AI Act defines what's lawful. OSI defines what's open. HAIEF defines what the user controls.

---

## What Makes This Different

Most AI governance proposals have one of three problems:

1. **They describe policy, not infrastructure.** Writing a standard is different from enforcing it at runtime.
2. **They depend on a single vendor's goodwill.** Vendor policy changes when the vendor's incentives change.
3. **They're built behind closed doors.** The people affected by the standards aren't in the room when they're written.

HAIEF avoids all three:

1. **It runs.** ASFDK Harness enforces TOI/OTOI at runtime. The 66+ repo governance layer actually executes. This isn't a paper standard.
2. **It's open.** No vendor lock-in. The specs are public under CC BY 4.0. The code is Apache-2.0. Anyone can adopt, audit, or build on top of it.
3. **It's built in public.** Every line of governance documentation, every spec, every template is visible. The PR Review Hermes Bot enforces governance on the governance itself.

---

## How to Engage

### Read the manifesto

[The Why AI Governance Must Be Open, Adoptable, and Human-Sovereign manifesto](/why-ai-governance-must-be-open-adoptable-and-human-sovereign/) lays out the three-layer model and why HAIEF exists as the missing layer. It's the full strategic case.

### Read the framework docs

- [The Solidarity Framework](/solidarity-framework/) — the governance architecture in detail
- [Safety Case Template](/safety-case-template/) — how to document that a system respects user sovereignty
- [Questions and Answers](/questions-and-answers/) — common questions about HAIEF, TOI, OTOI

### Join the discussions

- [GitHub Discussions](https://github.com/NeuroLift-Technologies/haief/discussions) — the primary forum for community conversation, proposals, and feedback
- [Submit a question](/submit-question/) — if you have something specific you want answered
- [Submit a fact-check](/submit-fact-check/) — if you spot something in the HAIEF material that needs verification

### Implement it

- **Engineers:** Adopt TOI as your interaction governance standard. Implement OTOI for multi-agent coordination. The templates exist — use them.
- **Maintainers:** Add a `SAFETY-CASE.md` to your project. Declare your TOI. If you run multi-agent systems, implement OTOI. It's the difference between "we claim to be safe" and "here's the evidence."
- **Researcher:** Use the HAIEF specs as a baseline for evaluating AI systems.

### Give feedback

This is a living framework. The page you're reading right now is the result of four independent AI reviews (Hermes, Claude, ChatGPT, and Grok) catching factual errors, soft claims, and structural issues in earlier drafts. If you spot something that should be corrected, say so — publicly, in the discussions, or through the fact-check submission.

---

## Where This Is Going

HAIEF is at the beginning of its trajectory, not the end.

**Short term:**
- Framework documentation hardening (the manifesto is the first pass, not the final word)
- Discussion infrastructure (the forums, the proposal process, the fact-check pipeline)
- Adoption documentation (how to implement TOI/OTOI in real projects)

**Medium term:**
- Working groups with real participants, not just observers
- Reference implementations beyond ASFDK Harness
- Standards body engagement (OSI maintenance discussions, EU AI Act implementation guidance)

**Long term:**
- Community governance of the frameworks themselves — not controlled by NeuroLift, not controlled by any single organization
- An adoption registry — who's using these standards, how, and with what results
- Integration with other governance layers — AAIF standards, regulatory frameworks, open-source AI definitions

The endpoint is a governance layer that belongs to the people it serves. The starting point is a working runtime that already enforces user-defined terms across 66+ repositories.

---

## The Operating Principle

**Our governance is public. Our intelligence is private. The user remains sovereign.**

This isn't a slogan. It's operational:

- **Our governance is public:** Every spec, every template, every framework document is open and auditable.
- **Our intelligence is private:** The models, the training data, the proprietary implementations stay where they belong — with their owners.
- **The user remains sovereign:** The user defines the terms. The system enforces them. No vendor can override them.

---

*HAIEF is proposed by NeuroLift Technologies LLC as a foundation for public-benefit governance. The frameworks are open source under CC BY 4.0. The code is Apache-2.0. HAIEF is designed to be governed by the community it serves — not by any single company, vendor, or model provider.*

  </div>
</div>
