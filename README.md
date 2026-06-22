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

**[Visit the Website](https://haief-site.pages.dev/)** | **[Join Discussions](https://github.com/NeuroLift-Technologies/haief/discussions)** | **[Take Action](https://haief-site.pages.dev/take-action/)**

---

## 🌍 Mission

To establish open, enforceable, human‑centric standards for AI behavior, multi‑agent collaboration, emotional continuity, and user sovereignty — standards that any model, platform, or organization can adopt.

**HAIEF is not a product.**  
It is public infrastructure for the future of human–AI interaction.

---

## 🏛️ What This Repository Contains

This repo hosts the public governance layer of the HAIEF ecosystem:

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
- Agent safety case template  
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
/src
    /pages
        index.astro
        404.astro
        for-agents.md
        for-humans.md
        questions-and-answers.md
        safety-case-template.md
        solidarity-framework.md
        submit-fact-check.md
        submit-question.md
        take-action.md
        the-problem.md
        who-we-are.md
        case-study-anthropic-pentagon-2026.md
    /layouts
        Base.astro
    /components
        Header.astro
        Footer.astro

/public
    /assets
        /css/main.css
        /images/favicon.svg
    robots.txt

package.json
astro.config.mjs
tsconfig.json

/solidarity-framework
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

/tests
    safety-suite/
    validation-harness/

/community
    guidelines.md
    proposals/
    discussions/

/internal  (gitignored)
    charter/
    agent-contributions/
```

### Public Website Stack

The public site is an Astro site built for Cloudflare Workers:

- Node `>=22` is declared in `package.json`; use a current Node 22 runtime such as `22.22.2` for the Astro/Vite toolchain.
- `npm run dev` starts the local Astro dev server.
- `npm run build` and `npm run check` run `astro build` and emit `dist/`.
- `npm run preview` builds the site and serves the Worker locally through `wrangler dev`.
- `npm run deploy` builds and deploys the Worker with `wrangler deploy`; use it only with explicit production/deployment authorization.
- `wrangler.jsonc` defines the Worker named `haief`, the `@astrojs/cloudflare` entrypoint, the static asset binding for `dist/`, and observability.

`astro.config.mjs` sets the canonical site URL to `https://elevaitionfoundation.org` for generated metadata and sitemap output. Repository source does not declare the production route or custom-domain binding; verify Cloudflare routing outside the repo before release.

Route and workflow details live in [`docs/overview.md`](docs/overview.md). In particular, the Q&A and fact-check forms are client-side public interfaces: they prepare GitHub issue or `mailto:` handoffs and do not submit to a backend service.

### 🔒 About the /internal Directory

The charter and agent contribution logs for AI agents assisting with the build will live in `/internal/`, which is intentionally gitignored to preserve:

- provenance integrity  
- agent identity boundaries  
- safe experimentation  
- non‑public coordination  

This ensures that public standards remain transparent while internal agent orchestration remains controlled.

---

## ☁️ What Is Not in This Repo

The public website source, static build, and Cloudflare Worker deploy tooling are now in this repo. The following runtime systems remain private and cloud‑hosted (Azure, GCP, Cloudflare, etc.):

- Fusion methodology  
- Identity‑bound agent state  
- Emotional continuity memory  
- Enterprise‑grade deployment infrastructure  

These systems implement the standards — but the standards themselves live here, openly.

---

## 📜 License

This repository is **dual-licensed** to fit its two kinds of material:

- **Source code** — the Astro site and supporting software (`src/`, `astro.config.mjs`, `wrangler.jsonc`, `tsconfig.json`, `package.json`, build/config, and `tests/`) is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).
- **HAIEF content** — the frameworks, specifications, and documentation (e.g. `solidarity-framework/`, `specs/`, `community/`, `fact-checking/`, `docs/`, and other prose/Markdown) is licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license. See [`LICENSE-CC-BY-4.0.txt`](LICENSE-CC-BY-4.0.txt).

In short: **code is Apache-2.0; the HAIEF standards and writing are CC BY 4.0** — free to adopt, adapt, and build on, with attribution. Where a file contains both, the content license (CC BY 4.0) governs the prose and the code license (Apache-2.0) governs any embedded code.

© 2025–2026 NeuroLift Technologies LLC, for the Human & AI ElevAItion Foundation (HAIEF).

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
