# TOI — Terms of Interaction

**The user declaration layer of the Solidarity Framework.**

TOI defines portable, machine-readable interaction requirements that travel with users across AI systems. It is the constitutional layer — the terms users set, own, and carry.

[![Implementation](https://img.shields.io/badge/implementation-nlt--toi-blue)](https://github.com/NeuroLift-Technologies/nlt-toi)
[![OTOI Governance](https://img.shields.io/badge/governed_by-OTOI-green)](../otoi/)

---

## Overview

A TOI document is a user-owned declaration of how AI systems should engage with them. Instead of accepting opaque provider defaults, users write their own terms — and HAIEF-compliant systems are required to honor them.

TOI is designed to be:

- **Portable** — travels with the user across platforms and vendors
- **Machine-readable** — structured JSON/YAML that AI systems can parse and enforce
- **Human-readable** — written in plain language the user can review and update
- **Versioned** — auditable history of preference changes over time
- **Revocable** — users can update, restrict, or retract declarations at any time

---

## What a TOI Document Declares

### Communication Preferences
How the AI should communicate:
- Style (formal, casual, direct, collaborative)
- Verbosity (concise, detailed, structured)
- Feedback approach (blunt, gentle, Socratic)

### Cognitive Accessibility Needs
Accommodations that support the user:
- Processing time requirements
- Information structure (bullet-points, narrative, numbered steps)
- Cognitive load management preferences
- Sensory sensitivity considerations

### Boundaries
What the AI should not do:
- Topics to avoid or approach only with explicit consent
- Behaviors the user has not authorized
- Escalation constraints

### Crisis and Safety Protocols
How to respond in high-stakes situations:
- RRT AIdvocAIte activation threshold
- Emergency contact preferences
- Sleepwalker Protocol configuration

### Privacy and Data Handling
How user data should be treated:
- Retention policy (session-only, persistent, user-controlled)
- Sharing consent (never, explicit-consent-only, etc.)
- Cloud processing restrictions

### Identity Standards
How the AI should represent itself:
- Persona transparency requirements
- Disclosure obligations
- Consistency expectations across sessions

### Continuity Preferences
What should persist across sessions:
- Context to carry forward
- Context to reset between sessions
- Memory and history settings

---

## TOI Document Structure

A Personal TOI document follows the `personal-toi` JSON schema:

```json
{
  "version": "1.0.0",
  "metadata": {
    "created": "2025-01-01T00:00:00Z",
    "updated": "2025-01-01T00:00:00Z",
    "author": "your-identifier"
  },
  "communication": {
    "style": "direct",
    "verbosity": "concise",
    "formality": "casual"
  },
  "cognitive": {
    "processing_time": "flexible",
    "information_structure": "bullet-points",
    "cognitive_load": "minimal"
  },
  "privacy": {
    "data_retention": "session-only",
    "sharing_consent": "never",
    "cloud_processing": "opt-in-only"
  },
  "boundaries": {
    "topics": [],
    "behaviors": []
  },
  "crisis": {
    "rrt_threshold": "user-initiated",
    "swp_active": true
  },
  "continuity": {
    "carry_forward": ["task-context"],
    "reset_each_session": ["emotional-state-assessments"]
  }
}
```

---

## Quick Start

### Using the reference implementation

```bash
pip install nlt-toi

# Interactive wizard
toi-generator --interactive --output my-toi.md

# From a preferences file
toi-generator --input preferences.json --format json --output my-toi.json

# Validate an existing TOI document
toi-generator --input my-toi.json --validate
```

### Python library usage

```python
from nlt_toi import TOIDocumentGenerator

# Generate from defaults
gen = TOIDocumentGenerator.from_defaults(author="alice")
print(gen.to_markdown())

# Generate from preferences dict
gen = TOIDocumentGenerator.from_dict({
    "version": "1.0.0",
    "metadata": {"author": "alice"},
    "communication": {"style": "direct"},
    "privacy": {"data_retention": "session-only", "sharing_consent": "never"}
})
gen.validate()
print(gen.to_json())
```

### Start from a template

Templates in the reference implementation under `/templates`:

- `personal-toi-template.md` — guided template with field explanations
- `quick-start-template.md` — minimal starter
- `collaborative-charter-template.md` — multi-user/team charter

---

## Governance Standard Requirements

For a TOI implementation to be HAIEF-compliant, it MUST:

1. **Honor declared preferences** — Act on communication, cognitive, and boundary declarations
2. **Preserve portability** — Accept standard TOI documents without proprietary lock-in
3. **Enforce revocability** — Apply updates and retractions immediately
4. **Maintain auditability** — Log when and how TOI declarations influenced behavior
5. **Protect privacy** — Follow declared data handling requirements precisely
6. **Surface conflicts** — When a system default conflicts with a TOI declaration, TOI wins or the conflict is disclosed to the user

---

## Schema

The canonical TOI JSON schemas are maintained in the reference implementation:

- [`personal-toi.schema.json`](https://github.com/NeuroLift-Technologies/nlt-toi/blob/main/schemas/personal-toi.schema.json) — Individual user TOI
- [`collaborative-charter.schema.json`](https://github.com/NeuroLift-Technologies/nlt-toi/blob/main/schemas/collaborative-charter.schema.json) — Multi-user or team charter

---

## Relationship to Other Components

- **OTOI** enforces TOI declarations in single-agent and multi-agent systems. OTOI is the machine-side enforcement layer; TOI is the user-side declaration layer.
- **Sleepwalker Protocol** reads TOI's emotional governance fields to configure protective behaviors during vulnerable states.
- **RRT AIdvocAIte** activates according to the crisis thresholds and response preferences declared in the user's TOI.

---

## Reference Implementation

The canonical implementation is maintained at:

**[github.com/NeuroLift-Technologies/nlt-toi](https://github.com/NeuroLift-Technologies/nlt-toi)**

Includes:
- TOI schema and validation
- Python library (`nlt_toi`) for generating and validating TOI documents
- CLI tool (`toi-generator`)
- Templates and neurodivergent-focused examples
- GitHub Pages interface for browser-based TOI interaction (no install required)

---

*This framework is maintained by the HAIEF community. See the [contribution guidelines](../../CONTRIBUTING.md) to get involved.*
