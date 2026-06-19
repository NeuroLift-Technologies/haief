# HAIEF Governance

## Philosophy

HAIEF is designed to be owned by the world, not by any single company, vendor, or model provider.

## Community-Driven Model

The HAIEF standards and frameworks are:

- **Organized** by the community
- **Built** by the community
- **Extended** by the community
- **Deployed** by the community
- **Governed** by the community

## Governance in Practice: Three-Pillar Framing

HAIEF documentation uses a three-pillar governance frame:

1. **Corporate governance (Terms of Service):** company-controlled policy.
2. **State governance (constitutional/regulatory power):** government-controlled authority.
3. **User governance (Terms of Interaction):** community-owned rights and interaction constraints.

The documentation stance is to explain where each pillar applies, and where user protections fail if one pillar dominates.

## Documentation Governance Rules

When updating governance content, contributors should follow these constraints:

- **Do not publish unsourced factual claims.** Tie event claims to verifiable source links.
- **Separate observed events from analysis.** Facts first, interpretation second.
- **Avoid framework drift.** TOI/OTOI/Sleepwalker/RRT terms should be used consistently with current framework pages.
- **Keep cross-page language aligned.** Changes to a major claim should be reflected in `src/pages/index.astro`, `src/pages/the-problem.md`, and relevant action/education pages when applicable.
- **Prefer update-over-duplication.** Expand existing governance pages before creating new standalone pages.

## Runbook: Public Goals and Agent Safety Cases

Use this checklist when changing public-goal language or the agent safety case template:

1. **Confirm the governance distinction**
   - A model specification or public goal explains intended behavior.
   - A safety case explains the evidence and constraints that make the goal credible.
   - The governance layer explains enforcement when goals conflict, systems drift, handoffs occur, or users are placed at risk.
2. **Update the canonical template first**
   - The public template lives at `src/pages/safety-case-template.md`.
   - Keep the ten-section structure complete unless the governance model itself changes.
   - Preserve links to TOI/OTOI, Provenance, Identity Integrity, and Handoff Rules when those specifications remain applicable.
3. **Keep discovery paths current**
   - Header navigation is configured in `src/components/Header.astro`.
   - Footer resources are maintained in `src/components/Footer.astro`.
   - Contributor-facing instructions live in `CONTRIBUTING.md`.
4. **Avoid unsupported compliance claims**
   - Do not describe a safety case as reviewed, certified, or registered unless the corresponding public review process exists.
   - "Submitted for community review" and "planned registry" language should remain distinct from completed recognition.
5. **Validate examples and constraints**
   - Examples should name required evidence types, such as provenance logs, identity declarations, handoff records, red-team results, escalation triggers, and shutdown behavior.
   - Constraints should state default behavior for absent TOI, unsupported handoffs, unlisted tools, memory retention, and crisis escalation.

## Runbook: Publishing a Governance Case Study

Use this checklist when adding event-based governance documentation:

1. **Create or update the case-study page in `src/pages/`**
   - Markdown pages should include `layout: ../layouts/Base.astro`, `title`, and `description` front matter.
   - Astro derives the route from the file name; do not add Jekyll `permalink` fields.
2. **Add discovery paths**
   - Header nav (`src/components/Header.astro`) and footer links (`src/components/Footer.astro`) if the page is a primary reference.
3. **Wire context across key paths**
   - Link from homepage and from the affected framework/problem/action pages.
4. **Add only required styling**
   - Place new reusable classes in `public/assets/css/main.css`; avoid one-off inline styles when a class is reusable.
5. **Validate metadata coverage**
   - Confirm the page has a description so Open Graph/Twitter card metadata remain meaningful.
6. **Document sources**
   - Add a source section in the case-study page and keep link text specific to each claim.

## Runbook: Astro and Cloudflare Pages Maintenance

Use this checklist when package updates change Astro, Wrangler, or related build tooling:

1. **Verify the package contract**
   - `package.json` requires Node.js `>=22` and exposes `dev`, `build`, `check`, `preview`, and `deploy` scripts.
   - `package-lock.json` is the npm lockfile; regenerate it with npm, never by manual editing.
2. **Install and build from a clean lockfile**
   - Run `npm ci`.
   - Run `npm run build` or `npm run check` to confirm Astro can emit the static site.
3. **Respect deployment boundaries**
   - `npm run deploy` runs `wrangler pages deploy dist --project-name haief-site`.
   - Do not run deploys without explicit human authorization.
4. **Keep docs source-accurate**
   - Replace stale Jekyll references (`_pages`, `_config.yml`, `_includes`, Liquid helpers) with Astro paths and root-relative links.
   - If dependency updates change script behavior, update `CONTRIBUTING.md` and `docs/overview.md` in the same change.

## Operational Pitfalls and Safeguards

- **Pitfall:** Publishing a page without nav integration.  
  **Safeguard:** Check both `src/components/Header.astro` and `src/components/Footer.astro`.
- **Pitfall:** Broken links due to base URL differences.  
  **Safeguard:** Use root-relative links such as `/path/`; remove stale Jekyll Liquid.
- **Pitfall:** Overstating framework guarantees.  
  **Safeguard:** Verify wording against existing framework documents before merge.
- **Pitfall:** Style sprawl from repeated inline formatting.  
  **Safeguard:** Promote repeated styles to named CSS classes in `public/assets/css/main.css`.
- **Pitfall:** Accidentally deploying while testing build tooling.
  **Safeguard:** Use `npm run build`, `npm run check`, or `npm run preview`; reserve `npm run deploy` for explicitly authorized production actions.

## Contribution Guidelines

(See `/community/guidelines.md` for detailed contribution guidelines)

## Decision-Making Process

(To be defined by the community)

## Governance Structure

(To be defined by the community)

## Roles and Responsibilities

(To be defined by the community)

## Conflict Resolution

(To be defined by the community)

---

*This is a living document maintained by the HAIEF community.*
