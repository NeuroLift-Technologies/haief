# Commit Message Template

> Use this format for **every commit** made in any NeuroLift Technologies repository.  
> Required by OTOI Section 4.2 for agent commits.

---

## Format

```
[AGENT_NAME] type(scope): description
```

---

## Fields

| Field | Description | Example |
|---|---|---|
| `AGENT_NAME` | Your agent name or platform identifier (no spaces) | `Claude`, `Copilot`, `Codex` |
| `type` | Change type — must be one of the allowed types below | `feat` |
| `scope` | The area of the codebase affected (short noun phrase) | `handoff-template` |
| `description` | Imperative-mood summary of the change (no period at end) | `add session end protocol fields` |

---

## Allowed Types

| Type | When to use |
|---|---|
| `feat` | New feature or file added |
| `fix` | Bug fix or correction |
| `docs` | Documentation-only change |
| `refactor` | Refactor without behavior change |
| `chore` | Maintenance, cleanup, config |
| `test` | Adding or updating tests |
| `ci` | CI workflow changes |

---

## Examples

```
[Claude] feat(templates): add commit-message template
[Copilot] fix(validate-governance): correct workflow path in required-files list
[Codex] docs(sop-001): clarify step 7 commit format requirements
[Claude] ci(agent-commit-format): extend pattern to allow bot suffix in agent name
[Copilot] chore(governance-files): update file count after adding commit template
```

---

## Common Mistakes

| Wrong | Right | Why |
|---|---|---|
| `feat: add template` | `[Claude] feat(scope): add template` | Missing `[AGENT_NAME]` |
| `[Claude] added template` | `[Claude] feat(templates): add template` | Missing type and scope |
| `[Claude] feat(templates): Added template.` | `[Claude] feat(templates): add template` | Past tense; trailing period |
| `[Claude] update(templates): ...` | `[Claude] chore(templates): ...` | `update` is not an allowed type |

---

## SOP Reference

Commit format is defined in **SOP-NLT-001 Step 7**. As of the current
repository baseline, no `.github/workflows/agent-commit-format.yml` workflow is
present; agents and reviewers must check this format manually unless that gate
is added later.

---

*ORG-DEV-OTOI-1.0.2 | templates/commit-message.md*
