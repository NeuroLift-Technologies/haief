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
- `public/.assetsignore`: Cloudflare asset upload exclusions for Worker routing artifacts.
- `astro.config.mjs`: Astro config, `@astrojs/sitemap`, `@astrojs/cloudflare`, and canonical `site: 'https://elevaitionfoundation.org'`.
- `wrangler.jsonc`: Cloudflare Worker deploy contract for the `haief` Worker and static asset binding.
- `package.json`: Node `>=22`, Astro build/dev scripts, Wrangler preview/deploy scripts, and Cloudflare dependencies. Use a current Node 22 runtime for builds; Node `22.14.0` fails with a missing `node:module.registerHooks` export before Astro loads config.

### Public route inventory

Astro derives public routes from files under `src/pages/`. Keep this table current
when adding, renaming, or removing pages:

| Source | Public route | Discovery path | Notes |
|---|---|---|---|
| `src/pages/index.astro` | `/` | Header logo and direct links | Homepage sections and calls to action. |
| `src/pages/404.astro` | `dist/404.html` fallback | Error fallback | Static not-found page. |
| `src/pages/the-problem.md` | `/the-problem/` | Header and footer | Governance problem framing. |
| `src/pages/who-we-are.md` | `/who-we-are/` | Header and footer | Public-goal and organization framing. |
| `src/pages/solidarity-framework.md` | `/solidarity-framework/` | Header and footer | Framework terminology source for contributors. |
| `src/pages/case-study-anthropic-pentagon-2026.md` | `/case-study-anthropic-pentagon-2026/` | Header and footer | Event-based governance case study. |
| `src/pages/take-action.md` | `/take-action/` | Header CTA and footer | Public participation page. |
| `src/pages/questions-and-answers.md` | `/questions-and-answers/` | Header | Public Q&A index and link to question submission. |
| `src/pages/safety-case-template.md` | `/safety-case-template/` | Header and footer resources | Canonical public safety case template. |
| `src/pages/submit-fact-check.md` | `/submit-fact-check/` | Header | Client-only fact-check request form. |
| `src/pages/submit-question.md` | `/submit-question/` | Homepage and Q&A page links | Client-only question submission form; intentionally not in header/footer. |
| `src/pages/for-humans.md` | `/for-humans/` | Header and footer | Human-facing participation guide. |
| `src/pages/for-agents.md` | `/for-agents/` | Header and footer | Agent-facing structured guidance. |

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
   - Header URLs use root-relative trailing-slash paths; active state compares normalized pathnames.
   - The `Take Action` nav item is the only header item styled as `nav-cta`.
   - Secondary workflow pages may be deep-linked instead of appearing in both nav surfaces; document that choice in the route inventory.

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

6. **Public submission handoff contract**
   - `src/pages/submit-question.md` and `src/pages/submit-fact-check.md` are static, browser-only forms.
   - They do not call a backend or store submissions. Anonymous/public submissions prepare GitHub issue URLs; private responses prepare `mailto:haief@neuroliftsolutions.com` links.
   - The GitHub labels are part of the public workflow: `question` for Q&A and `fact-check` for verification requests.
   - Preserve the privacy boundary: private response email addresses should stay in the email handoff, not public GitHub issue bodies.

7. **Agent-facing page contract**
   - `src/pages/for-agents.md` is a public interface for AI agents and should stay concise, structured, and easy to parse.
   - When agent-facing terms change, cross-check `src/pages/solidarity-framework.md`, `AGENTS.md`, and `NLT-DEV-OTOI.md` for governance alignment without amending OTOI content.

8. **URL, sitemap, and robots contract**
   - `astro.config.mjs` sets `site: 'https://elevaitionfoundation.org'`; `Base.astro` uses `Astro.site` from that config to generate per-route canonical links and Open Graph URLs.
   - `@astrojs/sitemap` uses the same `site` value for generated sitemap output.
   - `src/layouts/Base.astro` also emits organization JSON-LD with an explicit public `url`; keep it aligned when the canonical origin changes.
   - Some public pages include absolute share URLs for external services. Current source-verified examples are the Twitter intent links in `src/pages/for-humans.md` and `src/pages/take-action.md`.
   - Repository source does not declare the production route or custom-domain binding; verify Cloudflare routing outside the repo before release.
   - `public/robots.txt` is copied into the build output as a static asset. Verify its `Sitemap:` host when `astro.config.mjs` `site` or deployment domains change.
   - Suggested source check for domain changes:
     ```bash
     rg 'https://(elevaitionfoundation|haief|neurolift-technologies\.github\.io)' astro.config.mjs src public README.md CONTRIBUTING.md docs file-structure.md
     ```

9. **Build and deploy contract**
   - `npm run dev` starts Astro locally.
   - `npm run build` and `npm run check` run `astro build` and emit `dist/`.
   - `npm run preview` runs `npm run build && wrangler dev`, serving the generated Cloudflare Worker locally.
   - `npm run deploy` runs `npm run build && wrangler deploy`; production deployment requires explicit human authorization.
   - `wrangler.jsonc` names the Worker `haief`, uses `@astrojs/cloudflare/entrypoints/server` as `main`, serves `./dist` through the `ASSETS` binding, enables observability, and sets the Worker compatibility date/flags.
   - `public/.assetsignore` keeps `_worker.js` and `_routes.json` out of static asset uploads so Worker routing files are not treated as public assets.
   - This repository currently has governance validation CI only; site builds must be run manually for PRs that touch `src/`, `public/`, `astro.config.mjs`, or package files.

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
