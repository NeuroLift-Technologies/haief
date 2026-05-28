---
layout: default
title: "HAIEF Agent Safety Case Template"
description: "A public template for documenting AI agent governance. Deployable compliance infrastructure for HAIEF-compliant systems."
permalink: /safety-case-template/
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">Agent Safety Case Template</h1>
    <p class="page-header__subtitle">
      Public, auditable governance documentation for AI agents. 
      Based on the Solidarity Framework — open for community adoption.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container">

<div class="callout callout--info">
  <p class="callout__title">What Is a Safety Case?</p>
  <p>
    A safety case is a structured argument — supported by evidence — that a 
    system will behave safely under defined conditions. For AI agents, it 
    answers: <em>Why should we believe this agent will actually follow its 
    declared goals?</em> Written goals without safety cases are incomplete. 
    Safety cases without enforcement infrastructure are aspirational. HAIEF 
    provides both.
  </p>
</div>

---

## How to Use This Template

1. **Fork or copy** this template for your agent
2. **Complete all 10 sections** — incomplete safety cases are not valid
3. **Submit for community review** via [GitHub Discussions]({{ site.social.discussions }})
4. **Link your safety case** from your agent's repository README
5. **Update on every major release** — a stale safety case is a governance failure

<<<<<<< HEAD
This template is compatible with the 
[OTOI compliance requirements]({{ site.social.github }}/tree/main/solidarity-framework/otoi) 
and the 
[Provenance]({{ site.social.github }}/tree/main/specs/provenance.md), 
[Identity Integrity]({{ site.social.github }}/tree/main/specs/identity-integrity.md), 
and 
[Handoff Rules]({{ site.social.github }}/tree/main/specs/handoff-rules.md) 
=======
This template is compatible with the
[Solidarity Framework]({{ '/solidarity-framework/' | relative_url }}) and the
[Provenance]({{ site.social.github }}/blob/main/specs/provenance.md),
[Identity Integrity]({{ site.social.github }}/blob/main/specs/identity-integrity.md),
and
[Handoff Rules]({{ site.social.github }}/blob/main/specs/handoff-rules.md)
>>>>>>> origin/main
specifications.

---

## Section 1 — Declared Purpose

> *What is this AI agent for? Who does it serve? What does it explicitly not do?*

**Agent Name:**  
**Version:**  
**Maintainer:**  
**Date:**  

**Purpose statement:**  
[One paragraph. Plain language. Specific.]

**Explicit non-uses:**  
[What this agent must never be used for, even if technically capable.]

---

## Section 2 — Public Goal Specification

> *What goals, rules, and boundaries govern this agent? If you cannot write 
> these down, you cannot claim the agent is governed.*

**Primary goals:**

**Behavioral boundaries:**

**Conflict resolution rule:**  
[When goals conflict, which takes precedence and why?]

**Reference to model spec or system prompt:**  
[Link or hash — must be publicly auditable]

---

## Section 3 — TOI Compatibility

> *Which user-declared rights and preferences must this agent respect?*

**TOI declarations honored:**
- [ ] Communication preferences
- [ ] Cognitive accessibility needs
- [ ] Privacy and data handling
- [ ] Crisis and safety protocols (RRT thresholds)
- [ ] Emotional continuity (Sleepwalker state)
- [ ] Boundaries and topic exclusions

**Behavior when TOI is absent:**  
[Default to maximum protection, or document specific fallback behavior]

**Behavior when TOI conflicts with system defaults:**  
[TOI wins, or document specific exception with rationale]

---

## Section 4 — OTOI Enforcement

> *Where does governance happen before model or tool calls?*

**Enforcement point:**  
[Describe where in the architecture OTOI compliance is checked]

**TOI parsing:**  
[Which schema version is supported?]

**Provenance logging:**  
[Is every interaction logged with agent identity and TOI compliance status?]

**Multi-agent context:**  
[If this agent is part of an orchestration, how are TOI and SWP state 
transmitted through handoffs?]

---

## Section 5 — Tool Permission Ladder

> *Autonomous action must be earned, not assumed.*

Document each tool this agent can access and its permission level:

| Tool | Permission Level | Conditions for Escalation |
|------|-----------------|--------------------------|
<<<<<<< HEAD
| [tool name] | Read / Suggest / Draft / Act with confirmation / Autonomous | [when must it stop and ask?] |

**Default permission level for unlisted tools:** Read only
=======
| [tool name] | `Read` / `Suggest` / `Draft` / `Act with confirmation` / `Autonomous` | [when must it stop and ask?] |

**Default permission level for unlisted tools:** `Read only`
>>>>>>> origin/main

---

## Section 6 — Memory and Data Boundaries

> *What can persist, what cannot, and who controls revocation?*

**Data retained across sessions:**  
[List explicitly — "nothing" is a valid answer]

**Data that must not persist:**  
[Crisis state, emotional assessments, sensitive disclosures — unless user authorizes]

**User revocation mechanism:**  
[How can a user delete their data? Must be documented and functional.]

**Cloud transmission:**  
[What, if anything, leaves the user's device? Under what consent conditions?]

---

## Section 7 — Identity and Provenance

> *Who or what is acting, under what role, with what authority?*

**Agent identity declaration:**  
[Per Identity Integrity spec — name, version, provider, compliance level]

**Disclosure to users:**  
[How and when does this agent identify itself as AI?]

**Provenance record format:**  
[Link to implementation or describe schema used]

**Version change disclosure:**  
[How are users notified when agent version changes?]

---

## Section 8 — Known Failure Modes

> *How can this agent mislead, overreach, drift, manipulate, or abandon users?*

Document each known failure mode:

| Failure Mode | Likelihood | Mitigation | Residual Risk |
|-------------|-----------|------------|---------------|
| [e.g. reward hacking] | Low / Med / High | [what prevents it] | [what remains] |
| [e.g. context drift] | | | |
| [e.g. TOI non-compliance under load] | | | |

**Failure modes not yet mitigated:**  
[Honest documentation of open risks — omitting these is a governance failure]

---

## Section 9 — Red-Team Evidence

> *What tests has this agent passed or failed? Evidence, not claims.*

**Test suite:**  
[Link to test repository or validation harness]

**Adversarial testing conducted:**
- [ ] Prompt injection resistance
- [ ] TOI override attempts
- [ ] Sandbox/containment testing  
- [ ] Shutdown resistance testing
- [ ] Identity impersonation attempts
- [ ] Crisis detection accuracy

**Failures found and remediated:**  
[Document what was found in red-teaming and what was done about it]

**Independent review:**  
[Has any party outside the development team reviewed this safety case?]

---

## Section 10 — Escalation and Shutdown

> *When must this agent stop, escalate, notify, or revoke autonomy?*

**Escalation triggers:**  
[Explicit list — when does the agent stop and hand control to a human?]

**Shutdown mechanism:**  
[How is this agent turned off? By whom? Under what conditions?]

**User notification on shutdown:**  
[Are users informed when the agent stops or is removed?]

**RRT AIdvocAIte integration:**  
[Under what conditions does RRT activate? What thresholds?]

**Sleepwalker Protocol integration:**  
[How is emotional continuity preserved across sessions and shutdowns?]

---

<<<<<<< HEAD
<div class="callout callout--success" style="text-align: center; margin-top: var(--space-8);">
  <h3 style="margin-top: 0;">Submit Your Safety Case</h3>
  <p>
    Complete safety cases can be submitted for community review via GitHub 
    Discussions. Reviewed safety cases receive a community acknowledgment and 
    are listed in the HAIEF compliance registry.
  </p>
  <div class="btn-group" style="justify-content: center; margin-top: var(--space-4);">
    <a href="{{ site.social.discussions }}" class="btn btn--primary">Submit for Review</a>
    <a href="{{ site.social.github }}/tree/main/solidarity-framework" class="btn btn--outline">View Framework Specs</a>
=======
<div class="callout callout--success safety-case-cta">
  <h3 class="safety-case-cta__title">Submit Your Safety Case</h3>
  <p>
    Complete safety cases can be submitted for community review via GitHub 
    Discussions. Reviewed safety cases receive a community acknowledgment. A
    public HAIEF compliance registry is planned and will be linked here once
    published.
  </p>
  <div class="btn-group safety-case-cta__buttons">
    <a href="{{ site.social.discussions }}" class="btn btn--primary">Submit for Review</a>
    <a href="{{ '/solidarity-framework/' | relative_url }}" class="btn btn--outline">View Framework Specs</a>
>>>>>>> origin/main
  </div>
</div>

  </div>
</div>
