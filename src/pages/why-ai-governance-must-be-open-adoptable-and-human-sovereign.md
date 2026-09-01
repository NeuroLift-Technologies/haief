---
layout: ../layouts/Base.astro
title: "Why AI Governance Must Be Open, Adoptable, and Human-Sovereign"
description: "AI governance is being shaped right now by corporate-led standards bodies and academic alliances. The missing piece is who AI actually serves. HAIEF fills that gap — and it's already running."
date: 2026-09-01
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">Why AI Governance Must Be Open, Adoptable, and Human-Sovereign</h1>
    <p class="page-header__subtitle">
      The standards for AI are being written right now. Here's why they need a human-rights pillar — and why HAIEF exists.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container">

<div class="callout callout--danger">
  <p class="callout__title">The window is closing</p>
  <p>Three things are happening simultaneously: the EU AI Act's 2026 compliance deadline is approaching, the OSI is finalizing its Open Source AI Definition, and corporate-led standards bodies like the AI Alliance for Open Innovation (AAIF) are setting technical standards. None of these processes have adequate representation from the people who are actually affected by AI systems. <strong>This is the governance gap HAIEF was built to fill.</strong></p>
</div>

---

## The Three Pillars of AI Governance

AI governance is being built from three directions right now. Only two of them are getting attention.

| Pillar | Who | Focus | What's Missing |
|--------|-----|-------|----------------|
| **Technical standards** | AAIF / Linux Foundation | Interoperability, model formats, tool chains | Who controls the system |
| **Open research** | AI Alliance | Innovation, safety research, open models | Power dynamics between users and vendors |
| **Human sovereignty** | **HAIEF** | User rights, consent, continuity, governance infrastructure | — |

The first two pillars answer *how* AI works and *what* it can do. They don't answer *who it serves*. That's the missing third pillar — and it's the one that determines whether AI reinforces human agency or replaces it.

HAIEF is that pillar. It's the voice of users, communities, and democratic values in a space currently dominated by corporations with commercial incentives.

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

- **Sleepwalker Protocol**: Emotional continuity governance. Prevents abrupt, destabilizing AI behavior changes — especially important for users who rely on AI for ongoing support, neurodivergent users, and anyone in a high-stakes environment where sudden shifts in AI behavior could cause real harm.

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

- Reference HAIEF in OSI's Open Source AI Definition discussions
- Ensure user sovereignty is represented in EU AI Act implementation
- Don't let technical interoperability standards become the entire governance story

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
- The **EU AI Act** has a 2026 compliance deadline
- **OSI is finalizing** its Open Source AI Definition — right now
- **AAIF standards** are being set without user representation
- Vulnerable users face **abandonment when AI sessions end**
- Crisis intervention gaps leave people **at risk**

The governance infrastructure for AI is being built whether we participate or not. HAIEF exists so that the people affected by AI systems have a voice in how they're governed.

---

<div class="callout callout--info">
  <p class="callout__title">Our governance is public. Our intelligence is private. The user remains sovereign.</p>
</div>

---

*HAIEF is proposed by NeuroLift Technologies LLC as a global public-benefit foundation. The frameworks are open source under CC BY 4.0. The code is Apache-2.0. HAIEF is designed to be owned by the world, not by any single company, vendor, or model provider.*

  </div>
</div>
