# Solidarity Framework

The Solidarity Framework is HAIEF's open governance standard for human-centered AI interaction. It defines four interlocking protection layers that together ensure AI systems serve users — not the other way around.

This directory contains the public governance documents for each framework component. These documents define *what* compliant implementations must provide. Reference implementations live in dedicated repositories linked below.

---

## The Four Layers

```
┌───────────────────────────────────────────────────────────────────┐
│                      Solidarity Framework                         │
├─────────────────┬──────────────────┬──────────────┬──────────────┤
│  Constitutional │   Enforcement    │  Protective  │  Continuity  │
├─────────────────┼──────────────────┼──────────────┼──────────────┤
│  TOI            │  OTOI            │  RRT         │  Sleepwalker │
│  Terms of       │  Orchestrated    │  AIdvocAIte  │  Protocol    │
│  Interaction    │  Terms of        │              │              │
│                 │  Interaction     │              │              │
└─────────────────┴──────────────────┴──────────────┴──────────────┘
```

| Component | Layer | Description |
|-----------|-------|-------------|
| [TOI — Terms of Interaction](./toi/) | Constitutional | User-authored interaction rights, boundaries, and requirements that travel across AI systems |
| [OTOI — Orchestrated Terms of Interaction](./otoi/) | Enforcement | Machine-side governance layer that enforces TOI declarations in single-agent and multi-agent environments |
| [RRT AIdvocAIte](./rrt-aidvocate/) | Protective | Real-time crisis detection and multi-persona intervention for burnout, distress, and high-stakes situations |
| [Sleepwalker Protocol](./sleepwalker/) | Continuity | Emotional continuity governance that protects users in vulnerable cognitive and emotional states across sessions |

---

## How the Layers Work Together

### Single-Agent Interaction

```
User → [TOI: "here are my terms"] → AI System
                                         │
                                    OTOI enforces TOI
                                         │
                             ┌───────────┴────────────┐
                             │                        │
                        SWP monitors            RRT monitors
                        emotional state         crisis signals
```

### Multi-Agent Orchestration

```
User TOI ─────────────────────────────────────────────────────────┐
                                                                   │
Agent A → [Handoff record + TOI] → Agent B → [Handoff] → Agent C  │
    │                     │                      │
OTOI logs           OTOI verifies           OTOI enforces
provenance          TOI portability         in new context
```

In a multi-agent system:

- OTOI ensures TOI declarations survive every handoff
- Provenance chains maintain accountability across the full agent graph
- Identity integrity rules prevent unverified agents from entering the trust chain
- Sleepwalker state is preserved through transitions
- RRT AIdvocAIte can activate at any point in the chain when crisis signals are detected

---

## Guiding Principles

1. **User Sovereignty** — Users define their own terms. Systems comply. Where there is conflict, the user's TOI governs.
2. **Transparency** — All agent actions are visible and auditable. No silent overrides.
3. **Portability** — Protections travel with the user across vendors, platforms, and agents.
4. **Minimal Footprint** — Agents only do what is necessary. No collection beyond declared need.
5. **Escalation Culture** — When in doubt, escalate to the user. Never assume permission.
6. **Nothing About Us Without Us** — Neurodivergent and vulnerable users shaped this framework. Their needs are not edge cases.

---

## Technical Specifications

The technical contracts that framework implementations must satisfy:

| Spec | Description |
|------|-------------|
| [Provenance](../specs/provenance.md) | How interactions, decisions, and handoffs are traced |
| [Identity Integrity](../specs/identity-integrity.md) | How agents maintain consistent, verifiable identities |
| [Handoff Rules](../specs/handoff-rules.md) | Safe, transparent transitions in multi-agent systems |

---

## Reference Implementations

| Component | Repository |
|-----------|------------|
| TOI + OTOI | [NeuroLift-Technologies/nlt-otoi](https://github.com/NeuroLift-Technologies/nlt-otoi) · [NeuroLift-Technologies/nlt-toi](https://github.com/NeuroLift-Technologies/nlt-toi) |
| Sleepwalker Protocol | [NeuroLift-Technologies/sleepwalker](https://github.com/NeuroLift-Technologies/sleepwalker) |
| RRT AIdvocAIte | [NeuroLift-Technologies/rrt-advocate](https://github.com/NeuroLift-Technologies/rrt-advocate) |
| Unified Development Kit | [NeuroLift-Technologies/solidarity-framework](https://github.com/NeuroLift-Technologies/solidarity-framework) |

---

## Contributing

This is a community-governed standard. Contributions are welcome:

- Propose changes to framework documents via pull request
- Open issues to discuss edge cases, gaps, or conflicts
- Contribute validation tests in `/tests`

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

---

*Maintained by the HAIEF community. Framework version: 1.0.*
