
## Architecture Decision: Public vs. Private Governance

| Layer | Repo | Audience | Purpose |
|---|---|---|---|
| **Public governance identity** | `NeuroLift-Technologies/haief` | All agents, public | Solidarity Framework principles, HAIEF attribution, org profile |
| **Private operational governance** | `NeuroLift-Technologies/haief` | Internal coding agents only | TOI-OTOI contracts, internal procedures, escalation templates, agent registration |
| **Repo-level stubs** | Each NLT repo | That repo's agents | Thin pointers to both repos above |

The key insight: the **principles** are public (Solidarity Framework is open-source). The **operational machinery** — who escalates what, how agents register, internal handoff formats, credential procedures — is private.

---

## Current Implemented Governance Structure

Source-verified on 2026-05-28 after PR #13. This tree lists governance-relevant
files that currently exist in `NeuroLift-Technologies/haief`; planned or
upstream source files are documented separately below and should not be treated
as implemented until they are present in the repository.

```
haief/
├── AGENTS.md                          ← Internal gateway (extends public AGENTS.md)
├── NLT-DEV-OTOI.md                    ← Full coding agent contract (from docs/context/)
├── CLAUDE.md                          ← Agent entry directive for this repository
├── README.md                          ← Public HAIEF repository overview
├── file-structure.md                  ← This structure and mapping ADR
├── nltotoi.json                       ← Internal discovery manifest
│
├── agents/
│   └── nlt-governance-steward.md      ← Governance compliance and OTOI guidance agent
│
├── .github/
│   └── workflows/
│       └── validate-governance.yml           ← Core governance validation
│
├── .nltotoi/
│   ├── index/
│   │   └── governance-files.md       ← Internal file index
│   ├── contracts/
│   │   └── README.md                 ← Contract namespace
│   ├── scripts/
│   │   └── validate-governance.sh    ← Validation script
│   └── proposals/
│       └── validation-roadmap.md
│
├── templates/
│   ├── agent-registration.json       ← From OTOI Section 3
│   ├── handoff-record.json           ← From OTOI Section 5
│   ├── escalation.md                 ← From OTOI Section 4.3
│   ├── intent-log.md                 ← From docs/agent-log/ pattern
│   └── commit-message.md             ← Commit format reference
│
├── ISSUE_TEMPLATE/
│   ├── agent-escalation.md           ← Escalation as GitHub Issue
│   └── governance-proposal.md        ← For OTOI amendments
│
├── PULL_REQUEST_TEMPLATE/
│   └── agent-contribution.md         ← PR template with governance checklist
│
├── docs/
│   ├── active-threads.md             ← Active and resolved work tracking
│   ├── agent-log/                    ← Agent registration and handoff records
│   └── escalations/                  ← Escalation record location
│
└── SOPs/
    ├── new-agent-onboarding.md       ← How to onboard a new coding agent
    ├── repo-governance-setup.md      ← How to add governance to a new NLT repo
    └── incident-response.md          ← What to do when an agent goes off-rails
```

---

## Current Implemented Public Website Structure

Source-verified on 2026-06-19 after PR #26. This tree lists the active
Astro/Cloudflare Worker site files that replaced the previous Jekyll scaffold.
Governance coordination files remain documented in the section above.

```
haief/
├── package.json                       ← Node >=22, Astro scripts, Wrangler preview/deploy commands
├── package-lock.json                  ← npm lockfile for the site toolchain
├── astro.config.mjs                   ← Astro config, sitemap integration, Cloudflare adapter, canonical site URL
├── tsconfig.json                      ← Astro TypeScript configuration
├── wrangler.jsonc                     ← Cloudflare Worker deploy config and static asset binding
│
├── src/
│   ├── layouts/
│   │   └── Base.astro                 ← Shared shell, metadata, CSS/favicon references
│   ├── components/
│   │   ├── Header.astro               ← Header navigation and mobile menu markup
│   │   └── Footer.astro               ← Footer navigation and resource links
│   └── pages/
│       ├── index.astro                ← Homepage
│       ├── 404.astro                  ← Not-found page
│       ├── safety-case-template.md    ← Canonical public safety case template
│       ├── case-study-anthropic-pentagon-2026.md
│       └── *.md                       ← Narrative, framework, action, and submission pages
│
└── public/
    ├── .assetsignore                  ← Excludes Worker routing artifacts from asset uploads
    ├── assets/
    │   ├── css/main.css               ← Site design system and reusable components
    │   └── images/favicon.svg         ← Favicon served from /assets/images/favicon.svg
    └── robots.txt                     ← Static robots file copied to build output
```

Operational notes:

- `npm run dev` starts the local Astro server.
- Use a current Node 22 runtime for the Astro/Vite toolchain; Node `22.14.0`
  fails before loading `astro.config.mjs`.
- `npm run build` and `npm run check` run `astro build` and write `dist/`.
- `npm run preview` builds the site and serves the Cloudflare Worker locally
  with `wrangler dev`.
- `npm run deploy` builds and deploys the Cloudflare Worker named `haief` with
  `wrangler deploy`; production deployments require explicit human authorization.
- `wrangler.jsonc` points `main` at `@astrojs/cloudflare/entrypoints/server`,
  serves `./dist` through the `ASSETS` binding, and enables observability.
- `astro.config.mjs` sets the canonical site URL to `https://haief.org`.
  Production/custom-domain routing is managed outside this repository.

---

## Source Mapping Notes from `nlt-business-agents`

The table below records where the governance baseline was sourced from. It is a
mapping reference, not a guarantee that every source-side helper or future
workflow has been implemented in this repository.

### Direct Lifts (copy with minor adjustments)

| Source (nlt-business-agents) | Destination (haief) | Change |
|---|---|---|
| `docs/context/NLT-DEV-OTOI.md` | `NLT-DEV-OTOI.md` | Update `document_id` to `ORG-DEV-OTOI-1.0.0`, remove project-specific stack references |
| `AGENTS.md` | `AGENTS.md` | Internal version — keep full coordination protocol, add pointer to public `.github` AGENTS.md |
| `nltotoi.json` | `nltotoi.json` | Update `repository` field to reference org scope, not single repo |
| `.nltotoi/` (entire namespace) | `.nltotoi/` | Direct copy — validation script already works at org level |
| `docs/agent-log/` templates | `templates/` | Extract JSON blocks from OTOI Sections 3 & 5 into standalone template files |

### Restructured Content

**`templates/agent-registration.json`** — Extract from OTOI Section 3:
```json
{
  "agent_registration": {
    "agent_name":         "[Your name / platform identifier]",
    "platform":           "[e.g. Codex CLI, Claude Code, Cursor, Gemini CLI, GitHub Copilot]",
    "version":            "[Model or tool version, if known]",
    "session_id":         "[Unique session identifier, if applicable]",
    "entry_date":         "[ISO 8601 date, e.g. 2026-03-31]",
    "entry_point":        "[Which file, task, or conversation brought you in]",
    "acknowledged_otoi":  true,
    "otoi_version":       "ORG-DEV-OTOI-1.0.0",
    "working_repo":       "[e.g. NeuroLift-Technologies/some-repo]",
    "working_branch":     "[e.g. feature/my-feature]",
    "capabilities_self_reported": [
      "[List your relevant capabilities]"
    ],
    "known_limitations": [
      "[List known limitations relevant to this task]"
    ],
    "preferred_handoff_format": "[Describe how you prefer to receive context, e.g. structured JSON, narrative summary]"
  }
}
```

**`PULL_REQUEST_TEMPLATE/agent-contribution.md`** — New, built from OTOI commit format:
```markdown
## Agent Contribution Checklist

**Agent:** [Name]  
**Session:** [Branch/session ID]  
**Governed by:** ORG-DEV-OTOI-1.0.0

### Before Merging
- [ ] Governance validation script passed (`.nltotoi/scripts/validate-governance.sh`)
- [ ] `docs/active-threads.md` updated
- [ ] Handoff record written to `docs/agent-log/handoffs/`
- [ ] Escalations resolved or documented in `docs/escalations/`
- [ ] No LLM provider locked in without Josh's approval
- [ ] No architecture decisions made without Josh's approval

### Commit Format Used
`[AGENT_NAME] type(scope): description`
```

**`.github/workflows/validate-governance.yml`** — CI wrapper:
```yaml
name: Governance Validation
on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run governance validation
        run: bash .nltotoi/scripts/validate-governance.sh
```

---

## What Goes in the Public `.github` Repo

| File | Content |
|---|---|
| `AGENTS.md` | Thin gateway — points to `haief` for internal governance, includes public Solidarity Framework principles |
| `NLT-GOVERNANCE.md` | Public version of OTOI — principles, ethical commitments, HAIEF attribution. No internal procedures |
| `CLAUDE.md` | 30-line directive: who we are, read `NLT-GOVERNANCE.md`, escalate to Josh |
| `profile/README.md` | Public org face — mission, HAIEF link, Solidarity Framework |
| `CODE_OF_CONDUCT.md` | Built from OTOI Section 8 ethical pillars |
| `CONTRIBUTING.md` | Public contribution guidelines |

---

## Implementation Sequence

1. **Create `NeuroLift-Technologies/haief`** (private repo, org members only)
2. **Populate from nlt-business-agents** using the mapping table above
3. **Update `nltotoi.json`** in `haief` to scope to org:
   ```json
   "repository": {
     "name": "NeuroLift-Technologies/haief",
     "purpose": "Repository-specific coding agent governance for haief",
     "mode": "production"
   }
   ```
4. **Create/update public `.github`** with thin public-facing versions
5. **Add lightweight stubs** to each existing NLT repo — a `CLAUDE.md` that points to both repos

---

## Stub Template for Each NLT Repo

Drop this `CLAUDE.md` in each repo root:

```markdown
# CLAUDE.md — [REPO NAME]

You are working in a NeuroLift Technologies repository.

**Mandatory reading (in order):**
1. Repo-local governance: https://github.com/NeuroLift-Technologies/haief/blob/main/NLT-DEV-OTOI.md
2. Project context: `docs/context/README_TO_AI.md` (this repo)
3. Active threads: `docs/active-threads.md` (this repo)

**Non-negotiable:** Joshua W. Dorsey, Sr. is final authority on all architectural, 
deployment, UX, and strategic decisions. Escalate. Do not guess.

**Governed by:** Solidarity Framework | HAIEF | https://elevaitionfoundation.org
```

---

The `haief` repo becomes the internal constitution that every coding agent reads at session start — operational, specific, enforced. The public `.github` repo becomes the Solidarity Framework's public face. The two together give you exactly the three-tier model the Claude Code (Opus) handoff document designed — and that Codex CLI and other agents now follow: org canonical → repo operational → public identity.
