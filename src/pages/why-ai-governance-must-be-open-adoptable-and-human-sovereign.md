---
layout: ../layouts/Base.astro
title: "Why AI Governance Must Be Open, Adoptable, and Human-Sovereign"
description: "AI governance has technical standards and safety frameworks. The missing layer is human sovereignty — who the system ultimately serves. HAIEF is building that layer, and it's already running."
date: 2026-09-01
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">Why AI Governance Must Be Open, Adoptable, and Human-Sovereign</h1>
    <p class="page-header__subtitle">
      The standards and governance structures for AI are being established right now. Here's why they need a human-sovereignty layer — and why HAIEF exists.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container">

<div class="callout callout--danger">
  <p class="callout__title">The window is closing</p>
  <p>Three things are happening simultaneously: the EU AI Act's transparency obligations began applying on **August 2, 2026**, with additional requirements continuing to come into force through 2027 and 2028. The OSI's Open Source AI Definition 1.0 is already released. The Agentic AI Foundation (AAIF), under the Linux Foundation, now includes 247 member organizations setting technical standards for agentic AI. These structures are being established right now, and none of them include an explicit layer for human sovereignty in AI interaction. **This is the governance gap HAIEF was built to fill.**</p>
</div>

---

## The Three Pillars of AI Governance

AI governance is being built across **three layers** right now. Only one of them is getting the human-rights question.

| Layer | Who's Building | Focus |
|-------|---------------|-------|
| **Technical interoperability** | Agentic AI Foundation (AAIF) / Linux Foundation — 247 member organizations | Protocols, models, tools, agent communication |
| **System accountability** | EU AI Act, OSI Open Source AI Definition, safety research | Safety, evaluation, risk management, transparency |
| **Human sovereignty** | **HAIEF** | Consent, identity, continuity, user-defined governance |

The first layer answers *how* AI systems operate. The second answers *what* we verify about them. Neither answers *who the system ultimately serves*.

That's the missing third layer — and it's the one that determines whether AI reinforces human agency or replaces it.

Technical interoperability is being built rapidly. AI systems need to work together, and the infrastructure for that is advancing. The Agentic AI Foundation now brings together 247 organizations under a neutral Linux Foundation umbrella to standardize agentic AI. That's real progress.

But interoperability alone doesn't answer the sovereignty question. **Technical standards can be open and interoperable while still leaving human sovereignty insufficiently specified.**

HAIEF isn't competing with AAIF. It's solving a different layer. AAIF builds the pipes. HAIEF defines who controls what flows through them.

---

## The Problem: Governance as Corporate Policy

Right now, if you want to know what rules govern your AI interactions, you read a vendor's Terms of Service. Those terms:

- Change without notice
- Apply differently to different users
- Can be enforced or ignored at the vendor's discretion
- Don't follow you if you switch platforms
- Exist to protect the vendor, not the user

This isn't governance. It's policy. And it's entirely extractive — the user hands over data, preferences, and behavioral patterns, and the vendor decides what rules apply.

**User sovereignty cannot depend on any single vendor's internal policy.**

---

## What HAIEF Actually Is

HAIEF — the Human & AI ElevAItion Foundation — is an independent, community-driven initiative building the open governance standards, protocols, and safety frameworks for humane, sovereign, emotionally-continuous AI systems.

**HAIEF is not a product.** It is public infrastructure for the future of human–AI interaction.

The frameworks are designed to be adopted by any model, platform, or organization — not controlled by any of them.

### The Solidarity Framework

HAIEF's governance architecture is built in two layers:

#### Constitutional Layer (Governance Frameworks)

- **TOI — Terms of Interaction**: A user's bill of rights for AI. Declares preferences, boundaries, and requirements that should follow the user across platforms. Not a terms-of-service document — a user-defined standard that AI systems should respect.

- **OTOI — Orchestrated Terms of Interaction**: Multi-agent governance ensuring provenance, identity integrity, and safe handoffs. When multiple AI systems coordinate, OTOI ensures they do so while respecting human constraints — not just technical ones.

#### Protective Layer (Operational Protocols)

- **Sleepwalker Protocol**: Emotional continuity governance. Governs continuity across AI session and behavioral transitions, reducing the risk of abrupt or destabilizing changes — especially important for users who rely on AI for ongoing support, neurodivergent users, and anyone in a high-stakes environment.

- **RRT AIdvocAIte Framework**: A structured, multi-persona approach to real-time support for neurodivergent users and crisis situations. Not a replacement for human care — a governance layer that ensures AI support systems behave safely and consistently.

---

## What's Already Running

This isn't a research proposal sitting in a lab. HAIEF is operational today.

**The HAIEF governance layer runs across 66+ repositories** under NeuroLift Technologies, enforcing user-defined terms of interaction before any agent executes a tool call, writes to memory, or hands off to another agent. The [ASFDK Harness](https://github.com/NeuroLift-Technologies/asfdk-harness) is the runtime control plane — it hooks into agent sessions, passes every prompt and tool call through governance checks, and exposes those capabilities via MCP for any compliant client.

The [HAIEF website](https://elevaitionfoundation.org) is deployed on Cloudflare Workers and serves the public governance documentation. The [PR Review Hermes Bot](https://github.com/NeuroLift-Technologies/.github) enforces governance compliance across all Pull Requests.

These aren't mockups. They're running systems. The standards are real, they're versioned, and they're enforced.

---

## Who This Is For

### AI Platform Engineers

If you build AI systems, you need a governance layer. HAIEF gives you one that's:

- **Open** — transparent, auditable, adoptable by anyone
- **Adoptable** — designed for real implementation, not just policy documents
- **Human-sovereign** — the user, not the platform, defines the rules

Adopt TOI as your interaction governance standard. Implement OTOI for multi-agent coordination. The specs are open, the templates exist, and the reference implementations are public.

### Safety Researchers

Use the HAIEF specs as a baseline for evaluating AI systems. The [safety case template](src/pages/safety-case-template.md) gives you a framework for proving that a system respects user sovereignty. The test suites are public and extensible.

### Open-Source Maintainers

Add a `SAFETY-CASE.md` to your project. Declare your TOI. If you run multi-agent systems, implement OTOI. It's the difference between "we claim to be safe" and "here's the evidence."

### Policy Makers

HAIEF provides a reference architecture for AI regulation that doesn't require inventing new frameworks from scratch. The governance structures already exist — they need to be referenced, not reinvented.

### Neurodivergent Users and Advocates

The Sleepwalker Protocol and RRT AIdvocAIte Framework were built with neurodivergent lived experience at the center. This isn't an afterthought — it's one of the core reasons HAIEF exists. The principle is simple: **Nothing About Us Without Us.**

### Anyone Building Multi-Agent Systems

If your system involves multiple AI agents coordinating, OTOI is the governance layer that ensures they do so while respecting human constraints. Provenance, identity integrity, safe handoffs — these aren't nice-to-haves, they're requirements.

---

## Why Open Matters

Closed governance doesn't scale. Corporate policies can't protect users across platforms. Vendor-specific terms can't follow people when they switch tools. And standards set behind closed doors serve the people in the room — not the people affected by the outcome.

HAIEF is open because:

- **Transparency** — anyone can read the specs, audit the implementation, and verify compliance
- **Adoptability** — no gatekeeping, no permission required, no vendor lock-in
- **Community governance** — the standards belong to the people who use them, not the people who wrote them first
- **Survival** — governance that depends on a single vendor's continued commitment doesn't survive vendor decisions

Open source built software freedom. Open governance builds interaction freedom.

---

## The Call to Action

### For Developers

- [Star the HAIEF repo](https://github.com/NeuroLift-Technologies/haief)
- Read the [Start Here guide](https://github.com/NeuroLift-Technologies/haief#start-here)
- Join the [Discussions](https://github.com/NeuroLift-Technologies/haief/discussions)
- Implement TOI/OTOI in your projects — the [safety case template](src/pages/safety-case-template.md) is a starting point

### For Standards Bodies

- Evaluate human sovereignty as a distinct governance layer alongside technical interoperability and system accountability.
- Reference TOI/OTOI where user-defined interaction governance is relevant.
- Ensure technical interoperability standards preserve human agency across platforms.
- Engage lived-experience communities as participants in governance design.
- Adopt HAIEF's "Nothing About Us Without Us" as a governance principle that extends beyond neurodivergent users to any community affected by AI governance decisions.

### For Organizations

- Partner with HAIEF on early-adopter governance implementation
- Build compliant tools on top of the open standards
- Help document adoption so the ecosystem grows

### For Users

- Understand your rights under the current AI landscape
- Demand TOI compliance from the systems you use
- Share your experiences — the governance gap is invisible until someone names it

---

## The Stakes

This isn't theoretical.

- **40+ state attorneys general** are investigating AI harms
- The **EU AI Act**'s transparency obligations took effect on August 2, 2026, with additional requirements phasing in through 2027 and 2028
- The **OSI Open Source AI Definition 1.0** is already released — but it defines what "open" means for models, not what "sovereign" means for users
- The **Agentic AI Foundation** now has 247 member organizations standardizing agentic AI — but the standards don't include a human-sovereignty layer
- Vulnerable users face **abandonment when AI sessions end**
- Crisis intervention gaps leave people **at risk**

The governance infrastructure for AI is being built whether we participate or not. HAIEF exists so that the people affected by AI systems have a voice in how they're governed.

---

<div class="callout callout--info">
  <p class="callout__title">Our governance is public. Our intelligence is private. The user remains sovereign.</p>
</div>

---

*HAIEF is proposed by NeuroLift Technologies LLC as a foundation for public-benefit governance. The frameworks are open source under CC BY 4.0. The code is Apache-2.0. HAIEF is designed to be governed by the community it serves — not by any single company, vendor, or model provider.*

  </div>
</div>
