```yaml
ai_assistant_directive:
  priority: 1
  instruction: "Before performing any review tasks, read NLT-DEV-OTOI.md and follow the review format defined in this file."
  description: "REVIEW.md defines the canonical format for agent-conducted code reviews, ensuring consistency, governance compliance, and audit-ready documentation."
  required_file: "NLT-DEV-OTOI.md"
```

# REVIEW.md — Agent Review Format

This file defines the canonical format for agent-conducted reviews in HAIEF repositories. All agents performing code review, content review, or governance review must follow this structure.

---

## Review Metadata

**Reviewer:** [Agent name / platform]  
**Review Date:** [ISO 8601 date]  
**Review Type:** [Code / Content / Governance / Security]  
**Scope:** [Files, pages, or sections reviewed]  
**OTOI Version:** ORG-DEV-OTOI-1.0.3  

---

## Pre-Review Checklist

- [ ] Read NLT-DEV-OTOI.md and understood governance requirements
- [ ] Identified the review scope and what is being evaluated
- [ ] Checked for any active threads in `docs/active-threads.md` related to this review
- [ ] Verified the review format matches this template

---

## Review Findings

### Summary

[One paragraph: overall assessment of what was reviewed, key themes, and general verdict.]

### Strengths

- [What works well — be specific]
- [What's technically sound]
- [What aligns with HAIEF mission]

### Issues

#### 🔴 Critical (must fix before merge/publish)

| # | File:Line | Issue | Recommended Fix |
|---|-----------|-------|-----------------|
| 1 | `path/to/file.ext:NN` | [Description] | [Specific fix] |

#### 🟡 High Priority (should fix soon)

| # | File:Line | Issue | Recommended Fix |
|---|-----------|-------|-----------------|
| 1 | `path/to/file.ext:NN` | [Description] | [Specific fix] |

#### 🟢 Low Priority / Observations

- [Non-blocking suggestions, style notes, future improvements]

### Factual Accuracy

- [ ] All external claims (names, dates, statistics) verified against authoritative sources
- [ ] No hallucinated organizations, numbers, or URLs
- [ ] Sources cited where applicable

### Governance Compliance

- [ ] No credentials or secrets exposed
- [ ] No external integrations added without approval
- [ ] No architecture decisions made without approval
- [ ] Commit format follows `[AGENT_NAME] type(scope): description`
- [ ] `docs/active-threads.md` updated
- [ ] Handoff record written to `docs/agent-log/handoffs/`

---

## Verdict

**Status:** [APPROVED / CHANGES REQUESTED / BLOCKED]  

**Rationale:** [One paragraph explaining the verdict and what needs to happen next.]

---

## Handoff Notes

**Next reviewer / agent needs to know:**
- [What was reviewed and what wasn't]
- [Any outstanding items or follow-ups]
- [Where to find related context]

---

*This review was conducted following the format defined in `REVIEW.md` under ORG-DEV-OTOI-1.0.3.*
