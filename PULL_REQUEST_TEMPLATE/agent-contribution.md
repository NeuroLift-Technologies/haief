## Agent Contribution Checklist

**Agent:** [Name / platform]  
**Session:** [Branch / session ID]  
**Governed by:** ORG-DEV-OTOI-1.0.0  
**Working repo:** [Repository name]

---

### Before Merging

- [ ] Governance validation script passed (`bash .nltotoi/scripts/validate-governance.sh`)
- [ ] `docs/active-threads.md` updated with current state
- [ ] Handoff record written to `docs/agent-log/handoffs/` using `templates/handoff-record.json`
- [ ] Escalations resolved or documented in `docs/escalations/`
- [ ] No LLM provider locked in without Joshua's approval
- [ ] No architecture decisions made without Joshua's approval
- [ ] No production credentials or secrets committed
- [ ] No external service integrations added without Joshua's approval

---

### Scope Declaration

<!-- REQUIRED if this PR adds any new top-level directory or 15+ new files.
     The `pr-scope-check` CI workflow will fail if a new top-level directory
     is not mentioned somewhere in this PR description. -->

- [ ] **No new top-level directories added** — OR each new directory is explicitly documented below
- [ ] **Fewer than 15 new files added** — OR the large batch of additions is explained below

**New top-level directories (if any):**

<!--
List every new top-level directory added and explain:
  - What it contains
  - Why it is being added in this PR
  - How it relates to the stated goal of the PR

Example:
  - `agents-templates/` — copied in from JDUB1216/awesome-copilot as reference scaffolding
    for the SOP automation workflows; provides the skill and instruction templates that the
    new GitHub Actions workflows reference.

If no new directories are added, write "None."
-->

None.

---

### Commit Format Used

All commits in this PR follow: `[AGENT_NAME] type(scope): description`

---

### Changes Summary

<!-- Full description of what this PR changes and why. Include:
     - Files and directories added, modified, or deleted
     - Key changes with brief explanations
     - Any architectural or design decisions made
     Be specific — reviewers should be able to understand the complete scope
     of changes from this section alone. -->

---

### Tests

- [ ] Existing tests pass (or N/A — document why)
- [ ] New tests added for new functionality (or N/A — document why)

---

### Escalations

<!-- List any escalations raised during this session and their resolution status -->

None / [Description]

---

### Handoff Notes

<!-- What does the next agent or reviewer need to know about this PR? -->
