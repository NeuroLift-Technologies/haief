# HAIEF Overview

## Mission

The Human & AI ElevAItion Foundation (HAIEF) is a community-governed initiative building open standards for human-centered AI governance. The repository combines:

- **Public-facing governance website** (Astro pages under `src/pages/`, shared components/layout, public assets)
- **Reference governance artifacts** (`solidarity-framework/`, `specs/`, `tests/`, and `docs/`)

## Core Principles

1. **Human-Centric Design**: AI serves people, not the other way around.
2. **Transparency**: Open standards, open governance, open development.
3. **Dignity**: Respect for human autonomy and emotional wellbeing.
4. **Global Accessibility**: Standards available to all, owned by none.
5. **Community Governance**: Built and maintained by the global community.

## Core Framework Components

- **TOI (Terms of Interaction):** user-declared boundaries and interaction requirements.
- **OTOI (Orchestrated Terms of Interaction):** multi-agent enforcement and coordination layer.
- **Sleepwalker Protocol:** emotional continuity and anti-disruption protections.
- **RRT AIdvocAIte Framework:** crisis intervention and high-stakes support protocols.

## Public Website Architecture (Current)

### Content surfaces

- `src/pages/index.astro`: homepage sections and callouts.
- `src/pages/*.md`: major narrative and framework pages (including the Anthropic-Pentagon case study).
- `src/pages/404.astro`: not-found page emitted by Astro.
- `src/layouts/Base.astro`: shared page shell, metadata tags, canonical URLs, and the navigation toggle script.
- `src/components/Header.astro` and `src/components/Footer.astro`: reusable navigation surfaces.
- `public/assets/css/main.css`: design system and page-specific components served as `/assets/css/main.css`.
- `astro.config.mjs`: static-site config, sitemap integration, and canonical `site` URL.
- `package.json` and `package-lock.json`: npm toolchain, scripts, and locked Astro/Wrangler dependency graph.

### Public interfaces contributors should treat as stable

1. **Page front matter contract**
   - Markdown pages use `layout: ../layouts/Base.astro`, `title`, and `description`.
   - Astro derives routes from file names, so do not add Jekyll `permalink` fields.
   - Example:
     ```yaml
     ---
     layout: ../layouts/Base.astro
     title: "Page Title"
     description: "One-sentence summary for SEO and previews"
     ---
     ```

2. **Navigation contract**
   - Header navigation is configured in the `nav` array in `src/components/Header.astro`.
   - Footer links are maintained separately in `src/components/Footer.astro`.
   - Adding a public page usually requires changes in both files.

3. **Metadata contract**
   - `src/layouts/Base.astro` emits `description`, canonical, Open Graph tags, and Twitter card fields from page props or Markdown front matter.
   - Missing descriptions degrade sharing previews.

4. **Internal link contract**
   - Use root-relative links such as `/target-path/`.
   - Do not use Jekyll Liquid helpers (`relative_url`, `site.*`, or `baseurl`); Astro does not process them in Markdown content.

5. **Agent safety case template contract**
   - `src/pages/safety-case-template.md` is the canonical public template for documenting an agent safety case.
   - The template is exposed as `Safety Case Template` in the header navigation and footer resources list.
   - The page currently contains ten numbered sections. If a section is renamed, added, or removed, update governance runbooks and contributor guidance in the same change.
   - The page uses explicit GitHub Discussions and repository links instead of Jekyll `site.social.*` variables.

## Changed Subsystem: Astro Site Tooling and Public Governance Flow

The current site is built with Astro and deployed as static output to Cloudflare
Pages. PR #22 updated the root npm dependency graph for this subsystem:

- `astro`: `5.16.9` → `6.4.6`
- `wrangler`: `4.94.0` → `4.102.0`

Maintenance constraints for dependency and build-tool changes:

- Use Node.js 22 or newer, matching `package.json`.
- Use `npm ci` so validation uses `package-lock.json` exactly.
- Verify site output with `npm run build` or `npm run check`; both run Astro's production build today.
- Treat `npm run deploy` as a production action because it runs `wrangler pages deploy dist --project-name haief-site`.
- Do not rely on global Wrangler behavior when documenting or testing this repo; use the repo-local dependency through npm scripts.

## Changed Subsystem: Case Study, Public Goals, and Safety Case Flow

Recent governance updates expanded the site from a case-study narrative into a public-goal and safety-case workflow spanning:

- `src/pages/safety-case-template.md` (canonical agent safety case template)
- `src/pages/who-we-are.md` (public-goals framing and model-spec/safety-case/governance-layer distinction)
- `src/pages/the-problem.md` (containment crisis timeline and external-governance rationale)
- `src/pages/case-study-anthropic-pentagon-2026.md` (case-study source and scenario tracking)
- `src/components/Header.astro` and `src/components/Footer.astro` (discovery/navigation for the template and public pages)

The architecture intent is:

1. **Public goal specification** explains what a system is supposed to do.
2. **Safety case documentation** records why maintainers believe it will do that under defined conditions.
3. **Governance layer mapping** points to the HAIEF mechanisms that enforce behavior when goals conflict, agents hand off work, identity changes, or users enter vulnerable states.

Maintenance constraints:

- Treat safety-case content as a public interface. Do not change section numbers, review language, or linked specifications casually.
- Keep factual crisis/timeline claims sourced in the page that makes the claim.
- Use root-relative links such as `/path/`.
- When the safety case template changes, verify navigation in `src/components/Header.astro`, footer discovery in `src/components/Footer.astro`, and contributor guidance in `CONTRIBUTING.md`.
- Reuse existing design primitives (`callout`, `grid`, `card`, `timeline`) before adding new CSS classes.

This means public-governance additions are now a **cross-file subsystem**, not a single page change.

---

*This is a living document maintained by the HAIEF community.*
