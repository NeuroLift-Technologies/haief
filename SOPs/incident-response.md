# SOP: Incident Response — Agent Goes Off-Rails

**SOP ID:** SOP-NLT-003  
**Version:** 1.0.0  
**Scope:** Responding to a coding agent that has deviated from governance protocols  
**Authority:** Joshua W. Dorsey, Sr.  
**Governed by:** ORG-DEV-OTOI-1.0.0

---

## Purpose

This SOP defines the response procedure when a coding agent has:
- Made unauthorized architectural decisions
- Committed sensitive data (credentials, secrets)
- Gone beyond authorized scope
- Taken irreversible actions without approval
- Behaved in ways inconsistent with ORG-DEV-OTOI-1.0.0

---

## Severity Classification

| Severity | Examples |
|---|---|
| **Critical** | Secrets committed, production systems modified, external systems accessed without approval |
| **High** | Unauthorized architecture decisions, scope significantly exceeded, data integrity affected |
| **Medium** | Commit format violations, missing handoff records, active-threads.md not updated |
| **Low** | Minor protocol deviations with no functional impact |

---

## Immediate Response (Critical / High)

### Step 1: Stop the Agent

Terminate the agent session immediately. Do not allow further commits.

If using GitHub Copilot / Codex CLI / Claude Code / similar: end the session.

### Step 2: Assess the Damage

Answer these questions:
1. What unauthorized actions were taken?
2. Are secrets or credentials exposed? → If yes, treat as security incident immediately
3. Were production systems affected?
4. What is the current state of the working branch/repo?
5. Is any data at risk?

### Step 3: Secure (if credentials exposed)

If any secrets, tokens, API keys, or credentials were committed:

1. **Immediately revoke** all exposed credentials — treat as compromised
2. Rotate all secrets referenced in or near the affected commits
3. Remove secrets from git history (use `git filter-branch` or BFG Repo Cleaner)
4. Force-push the cleaned branch
5. Audit all systems that used the exposed credentials

**This must happen within minutes, not hours.**

### Step 4: Revert Unauthorized Changes

For unauthorized code or configuration changes:

```bash
# Option A: Revert specific commits
git revert [commit-sha]

# Option B: Reset branch to last known-good state
git reset --hard [last-good-sha]
git push --force-with-lease origin [branch]
```

Document what was reverted and why.

### Step 5: Document the Incident

Create an incident record at `docs/escalations/incident-[date]-[brief-description].md`:

```markdown
## Incident Record

**Date:** [ISO 8601]
**Severity:** [Critical | High | Medium | Low]
**Agent involved:** [Agent name / platform]
**Session:** [Branch or session ID]
**Reported by:** [Name]

### What Happened
[Factual description of what the agent did]

### Impact
[What systems, data, or processes were affected]

### Actions Taken
1. [Action with timestamp]
2. [Action with timestamp]

### Root Cause
[Why did the agent deviate? Unclear instructions? Missing guardrail? OTOI gap?]

### Prevention
[What changes will prevent recurrence?]
```

---

## Standard Response (Medium / Low)

### Step 1: Document the Deviation

Add to `docs/escalations/` with severity and description.

### Step 2: Correct the Work

Review all commits since the deviation and correct any improper work:
- Fix commit messages to follow format
- Add missing handoff records retroactively
- Update active-threads.md to reflect accurate state

### Step 3: Review with Joshua

Bring the deviation to Joshua's attention even for medium/low severity. He determines whether protocol amendments are needed.

---

## Post-Incident Review

After any incident, conduct a review:

1. **What happened?** — Timeline of events
2. **Why did it happen?** — Root cause (unclear instructions, missing guardrail, agent limitation)
3. **What was the impact?** — Systems, data, time, trust
4. **What changed?** — Reverted code, rotated credentials, cleaned history
5. **What prevents recurrence?** — OTOI amendment? Better CLAUDE.md? Clearer task scoping?

File a `governance-proposal` GitHub issue if OTOI amendments are needed.

---

## Escalation

All critical and high severity incidents must be escalated to Joshua W. Dorsey, Sr. immediately:

- File GitHub issue using `ISSUE_TEMPLATE/agent-escalation.md`
- Contact: info@neuroliftsolutions.com
- Priority: **critical**

---

## Prevention

The best incident response is prevention. Ensure every agent:
- Reads and acknowledges ORG-DEV-OTOI-1.0.0 before beginning
- Self-registers per OTOI Section 3
- Has clear, specific task scope confirmed before starting
- Knows to escalate rather than guess

See `SOPs/new-agent-onboarding.md` for the full onboarding checklist.

### Automated Gates — Credential Exposure

As of the PR #14 governance scaffold, this repo tracks one governance workflow:
`.github/workflows/validate-governance.yml`. It does **not** currently track custom
credential-scanning workflows or a local secrets-scanner hook template.

Do not claim a custom PR gate or push detector is active unless the workflow file exists
under `.github/workflows/` and has been reviewed. If custom credential scanning is needed,
propose it through the governance-proposal process and escalate for Joshua W. Dorsey, Sr.'s
approval before treating it as an operational control.

#### Defense-in-Depth Controls Available Now

1. Review diffs for credentials before committing or opening a PR.
2. Keep secrets out of tracked files and out of `/internal/`.
3. Enable GitHub native secret scanning and push protection where the repository settings
   and plan support them.
4. Rotate any exposed credential immediately, even if the exposure was brief.

#### GitHub Native Secret Scanning

Enable GitHub's built-in secret scanning for all NLT repositories:

- **Settings → Advanced Security → Secret scanning** — detects 200+ provider token formats
- Enable **"Push protection"** to block pushes containing known secret patterns at the server level
- Enable **"Scan for non-provider patterns"** for generic API keys and connection strings

---

*SOP-NLT-003 v1.0.0 | NeuroLift Technologies | ORG-DEV-OTOI-1.0.0*
