# Intent Log Template

> Copy this template to `docs/agent-log/intent/[date]-[topic].md` in the working repo before taking a significant action.  
> Intent logging is required before any action with broad scope, architectural impact, or irreversibility.

---

## Intent Log Entry

**Date:** [ISO 8601, e.g. 2026-03-31T15:00:00Z]  
**Agent:** [Agent name / platform]  
**Session:** [Branch or session ID]  
**OTOI Version:** ORG-DEV-OTOI-1.0.2  
**Working repo:** [e.g. NeuroLift-Technologies/some-repo]

---

### Action

[Describe specifically what you intend to do. Be precise about files, functions, services, or data involved.]

---

### Rationale

[Why is this the right action? Connect to the task requirements, active threads, and any prior decisions.]

---

### Risks

[What could go wrong? List potential downsides, unknowns, or unintended consequences.]

---

### Alternatives Considered

1. **[Alternative A]** — [Why not chosen]
2. **[Alternative B]** — [Why not chosen]

---

### Escalation Needed

**[yes | no]**

If yes: stop and escalate using `templates/escalation.md` before proceeding.  
If no: proceed after logging this intent.

---

### Outcome

*(To be filled in after the action is taken)*

**Date completed:** [ISO 8601]  
**Result:** [What actually happened]  
**Deviations from plan:** [Any differences from the stated intent]
