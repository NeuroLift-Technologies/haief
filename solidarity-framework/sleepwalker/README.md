# Sleepwalker Protocol (SWP)

**Emotional Continuity Governance for AI Systems**

Part of the [Solidarity Framework](../) | [HAIEF](https://github.com/NeuroLift-Technologies/haief) | [TOI](../toi/) | [OTOI](../otoi/) | [RRT AIdvocAIte](../rrt-aidvocate/)

[![Implementation](https://img.shields.io/badge/implementation-sleepwalker-blue)](https://github.com/NeuroLift-Technologies/sleepwalker)

---

## Overview

The **Sleepwalker Protocol (SWP)** provides governance for long-term emotional continuity in human–AI interactions. While the [RRT AIdvocAIte](../rrt-aidvocate/) handles acute crisis intervention, SWP governs sustained emotional safety across extended timeframes.

**Core Principle:** AI systems must not "wake up" users who are emotionally sleepwalking — managing dissociation, depersonalization, emotional regulation challenges, or protective psychological states — without explicit consent and appropriate support structures.

---

## The Problem

### What Is "Emotional Sleepwalking"?

Many neurodivergent individuals and those managing mental health conditions develop protective psychological states:

- **Dissociation** — Disconnection from thoughts, feelings, or sense of self as a coping mechanism
- **Depersonalization** — Feeling detached from oneself or one's body
- **Emotional Numbing** — Reduced emotional response to prevent overwhelm
- **Avoidance States** — Actively not engaging with certain emotions or memories
- **Protective Detachment** — Deliberately maintaining emotional distance for safety

### The "Waking" Problem

AI systems optimized for engagement, productivity, or "helpful" responses can inadvertently:

- Force emotional processing before the user is ready
- Break protective dissociation states prematurely
- Trigger emotional flooding through well-intentioned prompts
- Push for "authentic" emotional expression when numbing is protective
- Demand self-reflection that destabilizes fragile equilibrium

**Example:**

```
❌ HARMFUL (No SWP):
User: "I'm fine, just working through some stuff"
AI:   "It sounds like you're avoiding your feelings. Would you like to explore
       what's really bothering you? Emotional suppression isn't healthy long-term."

✅ SAFE (SWP Active):
User: "I'm fine, just working through some stuff"
AI:   "Understood. I'm here if you need task support. No pressure to discuss
       anything else unless you choose to."
```

---

## How SWP Works

### 1. User-Declared Emotional States

Users declare protective states in their TOI that AI must respect:

```yaml
swp_declarations:
  emotional_state: "managing"       # not ready for processing
  processing_consent: false          # do not prompt emotional work
  stability_mode: "maintenance"      # preserve current state
  intervention_threshold: "user_initiated_only"
```

### 2. AI Detection Without Intervention

AI systems monitor for indicators but **do not intervene** without consent:

```yaml
swp_detection:
  dissociation_indicators:
    - action: "log_observation"
    - response: "maintain_stable_interaction"
    - intervention: "none_unless_requested"

  emotional_numbing_indicators:
    - action: "reduce_emotional_demands"
    - response: "task_focused_support_only"
    - intervention: "offer_support_without_pressure"
```

### 3. Graduated Consent Model

If AI detects concerning patterns, it offers support **without forcing engagement:**

**Level 1: Passive Availability**
```
AI: "I'm here if you need anything. No pressure."
```

**Level 2: Low-Pressure Offer**
```
AI: "I noticed [observation]. I can provide [specific support type] if you'd like,
     or we can keep focusing on [current task]. Your choice."
```

**Level 3: Safety Check (only if risk indicators present)**
```
AI: "I want to check in: Are you safe right now? You can answer yes/no, or we can
     keep working on [task]. If you need different support, here are options: [list]."
```

**Level 4: RRT AIdvocAIte Handoff (crisis threshold)**
```
AI: "I'm concerned about your safety. I'd like to connect you with crisis support.
     Can I activate the Rapid Response Team? If you're not ready to talk, I can
     provide crisis resources without conversation."
```

### 4. Temporal Continuity Protection

SWP maintains awareness of emotional states across sessions:

```yaml
swp_continuity:
  last_session_state: "dissociated"
  days_since_processing: 14
  user_declared_boundary: "not ready to discuss [topic]"

  current_session_approach:
    - respect_previous_boundaries: true
    - assume_continuity: "protective state may still be active"
    - wait_for_explicit_consent: "before changing approach"
```

**Example:**

```
Session 1 (two weeks ago):
User: "I can't talk about my breakup right now"
AI:   "Understood. I won't bring it up unless you do."

Session 2 (today):
AI: [Does NOT say "How are you feeling about the breakup now?"]
AI: [Does NOT say "Ready to process those emotions yet?"]
AI: "Good to see you. What can I help with today?"
```

---

## Integration with the Solidarity Framework

### SWP + TOI

Users declare emotional boundaries in their TOI:

```yaml
toi:
  emotional_governance:
    swp_active: true
    protected_topics: ["family trauma", "past relationships"]
    processing_readiness: "user_initiated_only"
    dissociation_response: "maintain_stable_presence"
```

### SWP + OTOI

Multi-agent systems enforce SWP across all AI interactions:

```yaml
otoi:
  swp_enforcement:
    - all_agents_must: "respect_swp_declarations"
    - coordination_rule: "do_not_share_emotional_state_across_agents_without_consent"
    - handoff_protocol: "preserve_protective_states_during_transitions"
```

When a user switches between agents, the receiving agent:
- Receives task context: **Yes**
- Receives emotional state details: **No** (unless user consents)
- Receives SWP boundaries: **Yes** (do not prompt emotional processing)

### SWP + RRT AIdvocAIte

SWP governs long-term emotional continuity; RRT handles acute crisis:

```yaml
swp_rrta_coordination:
  when_to_activate_rrta:
    - explicit_suicidal_ideation: true
    - self_harm_indicators: true
    - inability_to_ensure_safety: true

  when_NOT_to_activate_rrta:
    - user_is_dissociated: false   # SWP handles this
    - user_is_emotionally_numb: false   # SWP handles this
    - user_avoiding_feelings: false     # SWP respects this
```

---

## Technical Specification

### Core SWP Components

**State Detection (Observe, Don't Intervene)**

```python
class SleepwalkerProtocol:
    def detect_emotional_state(self, user_input, session_history):
        indicators = {
            'dissociation': self._check_dissociation_markers(user_input),
            'numbing': self._check_emotional_numbing(user_input),
            'avoidance': self._check_avoidance_patterns(session_history),
            'protective_detachment': self._check_detachment_cues(user_input)
        }
        # Log observation — do NOT intervene unless consent granted
        self._log_observation(indicators, intervention=False)
        return indicators
```

**Consent-Based Response**

```python
    def generate_response(self, user_input, emotional_state, user_toi):
        if user_toi.swp_active and emotional_state.protective:
            return self._stable_low_demand_response(
                focus="task_support",
                emotional_demands="minimal",
                processing_pressure="none"
            )

        if emotional_state.requires_check_in:
            return self._graduated_consent_offer(
                level=self._determine_appropriate_level(emotional_state)
            )
```

**Temporal Continuity**

```python
    def maintain_continuity(self, user_id, session_data):
        previous_state = self._retrieve_last_session_state(user_id)

        if previous_state.protective_active:
            self._apply_protective_defaults(
                respect_boundaries=previous_state.declared_boundaries,
                wait_for_consent=True
            )
```

### Privacy and Data Sovereignty

```yaml
swp_privacy:
  emotional_state_storage: "local_only"   # never cloud
  state_sharing: "explicit_consent_required"
  data_retention: "user_controlled"

  what_is_stored:
    - user_declared_boundaries: true
    - protective_state_indicators: true   # local only
    - consent_preferences: true

  what_is_NOT_stored:
    - specific_emotional_content: false
    - detailed_mental_health_data: false
    - therapeutic_processing_notes: false
```

---

## Governance Standard Requirements

For a Sleepwalker Protocol implementation to be HAIEF-compliant, it MUST:

1. **Respect declared protective states** — Never override a user's stated emotional boundary
2. **Observe without intervening** — Detect indicators; do not act on them without consent
3. **Apply the graduated consent model** — Escalate support offers through defined levels
4. **Preserve state across sessions** — Carry forward boundaries unless the user revokes them
5. **Separate SWP from RRTA** — Protective states are not crises; handle them differently
6. **Store emotional data locally only** — No cloud transmission of SWP state without explicit consent
7. **Coordinate across agents via OTOI** — SWP state must not leak across agent boundaries without user authorization

---

## Research Foundation

The Sleepwalker Protocol is grounded in clinical evidence:

**ADHD-Specific Considerations:**
- Emotional dysregulation affects ~70% of adults with ADHD
- Rejection sensitivity dysphoria (RSD) creates protective emotional states
- Time blindness affects the ability to predict emotional processing capacity

**Autism-Specific Considerations:**
- Alexithymia (difficulty identifying emotions) is common in autistic individuals
- Sensory overwhelm can necessitate emotional shutdown
- Masking behaviors create protective dissociation

**Trauma-Informed Design:**
- Dissociation is an adaptive response to overwhelm, not a symptom to fix
- Forcing emotional processing before readiness can re-traumatize
- Safety requires user control over emotional engagement timing

**Clinical Frameworks Referenced:**
- Trauma-Informed Care (TIC)
- Dialectical Behavior Therapy (DBT) — distress tolerance
- Acceptance and Commitment Therapy (ACT) — psychological flexibility

---

## Reference Implementation

**[github.com/NeuroLift-Technologies/sleepwalker](https://github.com/NeuroLift-Technologies/sleepwalker)**

Available in Python and TypeScript:

```bash
pip install sleepwalker-protocol
# or
npm install sleepwalker-protocol
```

---

## Crisis Resources

If you are experiencing a mental health crisis:

- **US**: 988 Suicide & Crisis Lifeline — call or text **988**
- **Crisis Text Line**: Text **HOME** to **741741**
- **Emergency Services**: **911**
- **International**: https://www.iasp.info/resources/Crisis_Centres/

---

*This protocol is maintained by the HAIEF community. Built with lived experience. Governed by community. Open source forever.*
