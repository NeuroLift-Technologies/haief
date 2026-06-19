# HAIEF Overview

## Mission

The Human & AI ElevAItion Foundation (HAIEF) is a community-governed initiative building open standards for human-centered AI governance. The repository combines:

- **Public-facing governance website** (Astro pages under `src/pages/`, shared layout/components, CSS in `public/assets/`)
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
- `src/pages/*.md`: major narrative and framework pages, including the Anthropic-Pentagon case study and safety case template.
- `src/pages/404.astro`: static not-found page.
- `src/layouts/Base.astro`: shared page shell, metadata tags, JSON-LD, stylesheet and favicon references.
- `src/components/Header.astro` and `src/components/Footer.astro`: reusable navigation surfaces.
- `public/assets/css/main.css`: design system and page-specific components, served at `/assets/css/main.css`.
- `public/assets/images/favicon.svg`: favicon, served at `/assets/images/favicon.svg`.
- `astro.config.mjs`: Astro config, `@astrojs/sitemap`, and canonical `site: 'https://haief.org'`.
- `package.json`: Node `>=22`, Astro build/dev scripts, and Cloudflare Pages deploy command.

### Public interfaces contributors should treat as stable

1. **Page front matter contract**
   - Required fields in practice for Markdown pages: `layout`, `title`, and `description`.
   - Pages are routed by their file path under `src/pages/`; do not add Jekyll `permalink` fields.
   - Example:
     ```yaml
     ---
     layout: ../layouts/Base.astro
     title: "Page Title"
     description: "One-sentence summary for SEO and previews"
     ---
     ```

2. **Navigation contract**
   - Header navigation is maintained in `src/components/Header.astro`.
   - Footer links are maintained separately in `src/components/Footer.astro`.
   - Adding a primary public page usually requires changes in both components.

3. **Metadata contract**
   - `src/layouts/Base.astro` emits `description`, Open Graph tags, Twitter card fields, canonical URLs, and organization JSON-LD.
   - Markdown pages pass metadata through front matter; `.astro` pages pass `title` and `description` props to `Base`.
   - Missing descriptions degrade sharing previews.

4. **Internal link contract**
   - Use root-relative links such as `/target-path/`.
   - The Astro site has no `/haief` base URL and does not process Jekyll Liquid filters.

5. **Agent safety case template contract**
   - `src/pages/safety-case-template.md` is the canonical public template for documenting an agent safety case.
   - The template is exposed as `Safety Case Template` in header navigation and footer resources.
   - The page currently contains ten numbered sections. If a section is renamed, added, or removed, update governance runbooks and contributor guidance in the same change.
   - The page uses root-relative links for local site pages and full GitHub URLs for specifications and Discussions.

6. **Build and deploy contract**
   - `npm run dev` starts Astro locally.
   - `npm run build` and `npm run check` run `astro build` and emit `dist/`.
   - `npm run preview` serves the built output locally.
   - `npm run deploy` runs `astro build && wrangler pages deploy dist --project-name haief-site`; production deployment requires explicit human authorization.

## Changed Subsystem: Case Study, Public Goals, and Safety Case Flow

Recent governance updates expanded the site from a case-study narrative into a public-goal and safety-case workflow spanning:

- `src/pages/safety-case-template.md` (canonical agent safety case template)
- `src/pages/who-we-are.md` (public-goals framing and model-spec/safety-case/governance-layer distinction)
- `src/pages/the-problem.md` (containment crisis timeline and external-governance rationale)
- `src/pages/case-study-anthropic-pentagon-2026.md` (case-study source and scenario tracking)
- `src/pages/index.astro` (homepage callouts and primary calls to action)
- `src/components/Header.astro` and `src/components/Footer.astro` (discovery/navigation for primary pages)

The architecture intent is:

1. **Public goal specification** explains what a system is supposed to do.
2. **Safety case documentation** records why maintainers believe it will do that under defined conditions.
3. **Governance layer mapping** points to the HAIEF mechanisms that enforce behavior when goals conflict, agents hand off work, identity changes, or users enter vulnerable states.

Maintenance constraints:

- Treat safety-case content as a public interface. Do not change section numbers, review language, or linked specifications casually.
- Keep factual crisis/timeline claims sourced in the page that makes the claim.
- Use root-relative internal links such as `/path/`; do not reintroduce Jekyll Liquid or `/haief` base URL assumptions.
- When the safety case template changes, verify navigation in `src/components/Header.astro`, footer discovery in `src/components/Footer.astro`, and contributor guidance in `CONTRIBUTING.md`.
- Reuse existing design primitives (`callout`, `grid`, `card`, `timeline`) before adding new CSS classes.

This means public-governance additions are now a **cross-file subsystem**, not a single page change.

---

*This is a living document maintained by the HAIEF community.*
