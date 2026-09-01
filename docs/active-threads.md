# Active Threads — haief

> This file tracks active work threads. Agents must read this at session start and update it during and at the end of each session.

**Last updated:** 2026-09-01T07:44:00-04:00

---

## Active Threads

### Thread: 2026-09-01-hermes-duplicate-governance-section
**Status:** in_progress
**Owner:** Hermes (Hermes Agent, Nous Research)
**Started:** 2026-09-01T07:44:00-04:00
**Last updated:** 2026-09-01T07:44:00-04:00
**Summary:** Removed duplicate "The Governance Relationship" section from the manifesto article. The section appeared at both line 51 and line 131 with identical content. PR #47 open on `fix/duplicate-governance-section`.
**Blockers:** None.
**Next action:** After merge, verify live site shows only one instance.

---

## Resolved Threads

### Thread: 2026-08-31-hermes-readme-launch-structure
**Status:** resolved
**Owner:** Hermes (Hermes Agent, Nous Research)
**Started:** 2026-08-31T21:00:00-04:00
**Last updated:** 2026-09-01T01:37:39-04:00
**Summary:** Restructured README.md for public launch — added badges, one-line value proposition, "Start Here" section, and "Who This Is For" section. AI directive preserved at top per repo convention. PR #41 merged (2026-09-01T01:37:39Z).
**Blockers:** None.
**Next action:** Completed.

---

## Resolved Threads

### Thread: 2026-08-21-hermes-astro7-migration
**Status:** resolved
**Owner:** Hermes (Hermes Agent, Nous Research)
**Started:** 2026-08-21T18:42:02-04:00
**Last updated:** 2026-08-21T19:09:43-04:00
**Summary:** Diagnosed and fixed the failing Cloudflare build on `main`. PR #36, labelled an indirect esbuild patch bump, also carried a major upgrade (astro 6.4.6 → 7.1.3, adapter ^13.7.0 → ^14.1.4) that broke the build: a legacy `overrides: { "vite": "^7" }` block from `dab1eb3` force-pinned vite to 7.3.5 while Astro 7 requires vite ^8.0.13, so the prerender chunk was emitted as `worker-entry-*` instead of `prerender-entry-*`. Reproduced locally on node 22 (identical stack frame to CF's node 24). Two PRs were prepared: #38 reverted to Astro 6 as a safety net, and #39 performed the upgrade properly (astro ^7.2.4 + adapter ^14.2.3, stale override removed, pinned ^7.2.4 because adapter 14.2.1 raised its astro peer range to ^7.2.0). Joshua merged **#39** and closed #38 as superseded. The migration also fixed a regression the passing build concealed: Astro 7's `compressHTML: 'jsx'` default fused footer text to adjacent links on all 14 pages (28 occurrences), caught only by diffing rendered output against an Astro 6 baseline. Verified content-neutral — 0/14 pages differ in visible text or structure.
**Blockers:** None.
**Next action:** Verified on merged `main` (5a87978): Deploy Astro to GitHub Pages succeeded, Governance Validation and CodeQL passed, `npm ci` + `npm run build` exit 0 with 14 pages, `npm audit` reports 0 vulnerabilities (from 10, including 8 high), and the footer spacing fix is present in output. Remaining optional follow-ups for Joshua: confirm the live Cloudflare Workers deploy and the Images/KV session bindings (not verifiable locally); decide whether `wrangler.jsonc` `assets.directory` should move from `./dist` to `./dist/client` (pre-existing and currently inert, since the adapter generates its own `dist/client/wrangler.json`); and consider constraining dependabot so major framework upgrades cannot arrive under an indirect-dependency security label, which is how this incident reached `main` unreviewed.

### Thread: 2026-08-21-hermes-otoi-1.0.3-sync
**Status:** resolved
**Owner:** Hermes (Hermes Agent, Nous Research)
**Started:** 2026-08-21T16:22:57-04:00
**Last updated:** 2026-08-21T18:42:02-04:00
**Summary:** Synced this repository's governance contract from ORG-DEV-OTOI-1.0.2 to 1.0.3 against the canonical source in `.github-private`, bumping the document ID across 22 files and applying the full-ISO-8601-timestamp requirement to the registration, handoff, and active-thread formats. Backfilled the PR-only workflow provisions from 1.0.1 (§4.1 step 6, §4.2, §4.4 guardrail, AGENTS.md guardrail table) that had never reached this repository, and added §11 Change Log plus §6.1 Historical Records and Timestamp Grandfathering. Also hardened `check_content` in the governance validator to use `grep -Fq --`, after confirming the regex form accepted a malformed `ORG-DEV-OTOI-1x0y3` as a valid document ID. Merged as PR #37.
**Blockers:** None.
**Next action:** Optionally rename `.nltotoi/` → `.otoi/` to match asfdk-harness, and diff the other repos claiming OTOI 1.0.3 against `.github-private` — this sync proved a matching version number does not imply content parity.

> **Timestamp note:** The threads from here down predate ORG-DEV-OTOI-1.0.3 and are grandfathered under §6.1 — they retain date-only `Started`/`Last updated` values. Do not retroactively convert them to full timestamps; the original times are not recoverable and inventing them would corrupt the audit trail.

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
