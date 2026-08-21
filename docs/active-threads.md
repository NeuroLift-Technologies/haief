# Active Threads — haief

> This file tracks active work threads. Agents must read this at session start and update it during and at the end of each session.

**Last updated:** 2026-08-21T16:22:57-04:00

---

## Active Threads

### Thread: 2026-08-21-hermes-otoi-1.0.3-sync
**Status:** open
**Owner:** Hermes (Hermes Agent, Nous Research)
**Started:** 2026-08-21T16:22:57-04:00
**Last updated:** 2026-08-21T16:22:57-04:00
**Summary:** Synced this repository's governance contract from ORG-DEV-OTOI-1.0.2 to ORG-DEV-OTOI-1.0.3 against the canonical source in `.github-private`. Bumped the document ID across 22 files, applied the 1.0.3 full-ISO-8601-timestamp requirement to agent registration, handoff, and active-thread formats, and backfilled the PR-only workflow provisions from 1.0.1 (§4.1 step 6, §4.2, §4.4 guardrail, AGENTS.md guardrail table) that had never reached this repository. Added NLT-DEV-OTOI.md §11 Change Log. Verified: governance validator 29/29 pass, Astro build 14 pages, exit 0. Repo-local scoping preserved rather than copying org canon wholesale.
**Blockers:** None. Awaiting Joshua's review — agents cannot self-approve.
**Next action:** Joshua to review and merge the PR. Then decide whether to rename `.nltotoi/` → `.otoi/` to match asfdk-harness, whether to address dependabot PR #36 (esbuild 0.27.7 → 0.28.1), and whether the remaining repos still on pre-1.0.3 OTOI need the same sync.

---

## Resolved Threads

### Thread: 2026-06-22-cursor-docs-automation-pr33
**Status:** resolved
**Owner:** Cursor Cloud Automation
**Started:** 2026-06-22
**Last updated:** 2026-06-22
**Summary:** Source-verified the merged PR #33 dual-license changes and updated existing contributor, overview, repository-structure, and public Q&A docs for the Apache-2.0 software / CC BY 4.0 HAIEF content split.
**Blockers:** None.
**Next action:** Review the documentation PR; separately decide whether to tighten `package.json` `engines.node` beyond `>=22` and whether to address the existing low-severity npm audit findings.

### Thread: 2026-06-27-codex-anthropic-research-rights
**Status:** resolved
**Owner:** codex
**Started:** 2026-06-27
**Last updated:** 2026-06-27
**Summary:** Source-cleaned Anthropic-related governance content, added the evergreen AI-Human Bond Research Rights page, wired navigation, verified local build, and wrote the session handoff.
**Blockers:** None.
**Next action:** Review the public copy and decide whether to further source or remove the remaining TODO items on the Anthropic evidence page.

### Thread: 2026-06-19-cursor-docs-automation-pr26
**Status:** resolved
**Owner:** Cursor Cloud Automation
**Started:** 2026-06-19
**Last updated:** 2026-06-19
**Summary:** Source-verified the merged PR #26 Astro workflow documentation against the current Cloudflare Worker deployment source and aligned developer docs with `@astrojs/cloudflare`, `wrangler.jsonc`, `wrangler deploy`, static asset handling, and the verified Node build pitfall.
**Blockers:** None.
**Next action:** Review the documentation PR; separately decide whether package `engines.node` should be tightened beyond `>=22` and whether to address the existing low-severity npm audit findings.

### Thread: 2026-06-19-cursor-docs-automation-pr23
**Status:** resolved
**Owner:** Cursor Cloud Automation
**Started:** 2026-06-19
**Last updated:** 2026-06-19
**Summary:** Source-verified the merged PR #23 Astro documentation follow-up and added focused developer documentation for public route inventory, client-only submission workflows, Cloudflare Pages deployment constraints, canonical/preview URL handling, and site-build PR checks.
**Blockers:** None.
**Next action:** Review the documentation PR; separately decide whether to update the pre-existing stale sitemap host in `public/robots.txt` and how to address the existing low-severity npm audit findings.

### Thread: 2026-06-19-cursor-docs-automation-pr21
**Status:** resolved
**Owner:** Cursor Cloud Automation
**Started:** 2026-06-19
**Last updated:** 2026-06-19
**Summary:** Source-verified the merged PR #21 Astro/Cloudflare Pages site migration and updated developer-facing documentation that still referenced the removed Jekyll/GitHub Pages scaffold.
**Blockers:** None.
**Next action:** Review the documentation PR; separately decide whether to address the existing npm audit findings and stale `public/robots.txt` sitemap URL.

### Thread: 2026-05-28-cursor-docs-automation-pr13
**Status:** resolved
**Owner:** Cursor Cloud Automation
**Started:** 2026-05-28
**Last updated:** 2026-05-28
**Summary:** Source-verified the governance baseline merged in PR #13 and added focused documentation for governance validation, the implemented file registry, commit/PR workflow caveats, and incident-response automation gaps.
**Blockers:** None.
**Next action:** Review the documentation PR and decide whether to implement the planned workflow gates described as not currently present.
