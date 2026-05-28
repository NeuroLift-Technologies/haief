# HAIEF Overview

## Mission

The Human & AI ElevAItion Foundation (HAIEF) is a community-governed initiative building open standards for human-centered AI governance. The repository combines:

- **Public-facing governance website** (Jekyll pages under `_pages/`, shared layout/components, CSS)
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

- `index.html`: homepage sections and callouts.
- `_pages/*.md`: major narrative and framework pages (including the Anthropic-Pentagon case study).
- `_layouts/default.html`: shared page shell and metadata tags.
- `_includes/header.html` and `_includes/footer.html`: reusable navigation surfaces.
- `_config.yml`: top-level site navigation and global settings.
- `assets/css/main.css`: design system and page-specific components.

### Public interfaces contributors should treat as stable

1. **Page front matter contract**
   - Required fields in practice: `layout`, `title`, `description`, `permalink`.
   - Example:
     ```yaml
     ---
     layout: default
     title: "Page Title"
     description: "One-sentence summary for SEO and previews"
     permalink: /page-slug/
     ---
     ```

2. **Navigation contract**
   - Header navigation is configured in `_config.yml` under `nav`.
   - Footer links are maintained separately in `_includes/footer.html`.
   - Adding a public page usually requires changes in both files.

3. **Metadata contract**
   - `_layouts/default.html` emits `description`, Open Graph tags, and Twitter card fields from `page.title` and `page.description`.
   - Missing descriptions degrade sharing previews.

4. **Internal link contract**
   - Use Jekyll-relative links:
     `{{ '/target-path/' | relative_url }}`
   - This preserves correctness under `baseurl: /haief`.

5. **Agent safety case template contract**
   - `_pages/safety-case-template.md` is the canonical public template for documenting an agent safety case.
   - The template is exposed as `Safety Case` in `_config.yml` navigation and as `Safety Case Template` in the footer resources list.
   - The page currently contains ten numbered sections. If a section is renamed, added, or removed, update governance runbooks and contributor guidance in the same change.
   - The page depends on `site.social.discussions` for review submission links and `site.social.github` for framework/specification links.

## Changed Subsystem: Case Study, Public Goals, and Safety Case Flow

Recent governance updates expanded the site from a case-study narrative into a public-goal and safety-case workflow spanning:

- `_pages/safety-case-template.md` (canonical agent safety case template)
- `_pages/who-we-are.md` (public-goals framing and model-spec/safety-case/governance-layer distinction)
- `_pages/the-problem.md` (containment crisis timeline and external-governance rationale)
- `_pages/case-study-anthropic-pentagon-2026.md` (case-study source and scenario tracking)
- `_config.yml` and `_includes/footer.html` (discovery/navigation for the new template)

The architecture intent is:

1. **Public goal specification** explains what a system is supposed to do.
2. **Safety case documentation** records why maintainers believe it will do that under defined conditions.
3. **Governance layer mapping** points to the HAIEF mechanisms that enforce behavior when goals conflict, agents hand off work, identity changes, or users enter vulnerable states.

Maintenance constraints:

- Treat safety-case content as a public interface. Do not change section numbers, review language, or linked specifications casually.
- Keep factual crisis/timeline claims sourced in the page that makes the claim.
- Use `{{ '/path/' | relative_url }}` for internal page links so GitHub Pages `baseurl: /haief` remains valid.
- When the safety case template changes, verify navigation in `_config.yml`, footer discovery in `_includes/footer.html`, and contributor guidance in `CONTRIBUTING.md`.
- Reuse existing design primitives (`callout`, `grid`, `card`, `timeline`) before adding new CSS classes.

This means public-governance additions are now a **cross-file subsystem**, not a single page change.

---

*This is a living document maintained by the HAIEF community.*
