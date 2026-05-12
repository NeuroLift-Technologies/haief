# OTOI — Orchestrated Terms of Interaction

**The enforcement and orchestration layer of the Solidarity Framework.**

OTOI enforces user TOI declarations across AI systems — including complex multi-agent environments. It is the machine-side governance layer that ensures AI behavior is bound by what users have declared.

[![Implementation](https://img.shields.io/badge/implementation-nlt--otoi-blue)](https://github.com/NeuroLift-Technologies/nlt-otoi)

---

## Overview

Where TOI defines what users require, OTOI ensures those requirements are honored — at runtime, across agents, across sessions, and across vendors.

In a single-agent system, OTOI parses the user's TOI and constrains the agent accordingly. In multi-agent systems, OTOI coordinates handoffs, provenance chains, and identity continuity across the full orchestration graph.

---

## What OTOI Enforces

### TOI Compliance
- Parses and validates incoming TOI documents against canonical schemas
- Applies communication, cognitive, boundary, and privacy declarations to agent behavior
- Detects and surfaces conflicts between system defaults and TOI requirements

### Multi-Agent Governance
- Manages provenance tracking across agent handoff chains
- Enforces identity integrity through agent transitions
- Applies safe handoff rules between agents and systems
- Resolves conflicts when agent capabilities clash with TOI requirements

### Privacy Enforcement
- Prevents unauthorized data sharing based on TOI privacy declarations
- Enforces data retention limits
- Applies consent-gating to sensitive data flows in orchestrated pipelines

### Accountability
- Produces auditable interaction logs that trace decisions back to specific TOI declarations
- Records handoff events with agent identity and TOI state
- Enables post-hoc compliance verification

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│              OTOI Governance Layer                      │
├──────────────────┬──────────────────┬───────────────────┤
│  TOI Parser      │  OTOI Orchestr.  │  Privacy Guardian │
│  ─────────────   │  ─────────────── │  ─────────────── │
│  Parse & validate│  Multi-agent     │  Consent gating   │
│  TOI documents   │  coordination    │  Data flow rules  │
│                  │  Provenance log  │  Retention limits │
└──────────────────┴──────────────────┴───────────────────┘
         │                   │                  │
         ▼                   ▼                  ▼
    User-facing AI      Agent Network      Data Systems
```

### Core Components

**TOI Parser** (`src/fusion/toi_parser.py`)
Validates and normalizes TOI documents against canonical schemas. Extracts structured preference objects that downstream components act on.

**OTOI Orchestrator** (`src/fusion/otoi_orchestrator.py`)
Coordinates multi-agent interactions. Manages provenance chains, enforces handoff rules, and ensures TOI compliance is preserved as interactions pass between agents.

**Privacy Guardian** (`src/fusion/privacy_guardian.py`)
Intercepts data flows and enforces the user's privacy declarations. Blocks unauthorized sharing, applies retention limits, and gates consent-required operations.

---

## Key Concepts

### The Three-Pillar Governance Model

HAIEF governance frames user protection across three authority layers:

1. **Corporate governance** (Terms of Service) — company-controlled policy
2. **State governance** — government-regulated authority
3. **User governance** (Terms of Interaction) — **user-owned, OTOI-enforced**

OTOI exists to make the third pillar real and enforceable at runtime.

### Neurodivergent-First Design

OTOI is built with diverse cognitive needs at the center:
- Predictable, consistent enforcement behavior
- No surprise state changes
- Clear disclosure when constraints are applied
- Full support for accessibility-first TOI declarations

### Privacy-First Default

Where a TOI is absent or ambiguous, OTOI defaults to the most privacy-protective interpretation.

---

## Quick Start

### For Non-Technical Users

1. Create your TOI using the [personal-toi-template](https://github.com/NeuroLift-Technologies/nlt-otoi/blob/main/templates/personal-toi-template.md)
2. Share it with any HAIEF-compliant AI system
3. The system's OTOI layer enforces it automatically

### For Technical Users

```python
from nlt_toi.fusion.toi_parser import TOIParser
from nlt_toi.fusion.otoi_orchestrator import OTOIOrchestrator
from nlt_toi.fusion.privacy_guardian import PrivacyGuardian

# Parse and validate the user's TOI
parser = TOIParser()
toi = parser.parse("path/to/user-toi.json")

# Wire governance into your agent
orchestrator = OTOIOrchestrator(toi)
privacy = PrivacyGuardian(toi)

# Check before processing
if orchestrator.is_permitted(action, context):
    result = agent.run(action)
    result = privacy.filter_output(result, toi)
```

---

## Compliance Requirements

For an OTOI implementation to be HAIEF-compliant, it MUST:

1. **Parse standard TOI schemas** — Accept `personal-toi.schema.json` and `collaborative-charter.schema.json`
2. **Enforce at runtime** — Apply TOI declarations before, during, and after each agent action
3. **Maintain provenance** — Log all agent actions with identity and TOI-compliance status
4. **Preserve through handoffs** — TOI compliance must survive multi-agent transitions
5. **Default to protection** — Ambiguity resolves toward privacy and user protection
6. **Surface conflicts** — Never silently override a TOI declaration; disclose or refuse

---

## Schema

The canonical TOI/OTOI JSON schemas:

- [`personal-toi.schema.json`](https://github.com/NeuroLift-Technologies/nlt-otoi/blob/main/schemas/personal-toi.schema.json)
- [`collaborative-charter.schema.json`](https://github.com/NeuroLift-Technologies/nlt-otoi/blob/main/schemas/collaborative-charter.schema.json)

---

## Relationship to Other Components

- **TOI** provides the user declarations that OTOI enforces. OTOI without a TOI defaults to maximum-protection mode.
- **Sleepwalker Protocol** is invoked by OTOI during state transitions requiring emotional continuity governance.
- **RRT AIdvocAIte** is activated by OTOI when crisis thresholds declared in the user's TOI are reached.
- The `/specs` directory defines the technical contracts — provenance, identity integrity, and handoff rules — that OTOI implementations must satisfy.

---

## Reference Implementation

**[github.com/NeuroLift-Technologies/nlt-otoi](https://github.com/NeuroLift-Technologies/nlt-otoi)**

Includes:
- Python implementation (`src/fusion/`)
- JSON schemas for personal TOI and collaborative charter
- Templates for personal and team use
- Neurodivergent-focused integration examples
- Documentation: framework overview, implementation guide, and best practices

---

*This framework is maintained by the HAIEF community. See the [contribution guidelines](../../CONTRIBUTING.md) to get involved.*
