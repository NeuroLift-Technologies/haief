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
   - `_pages/safety-case-template.md` is the canonical public template for agent safety cases.
   - It must remain discoverable from both `_config.yml` header navigation and `_includes/footer.html` resource links.
   - The template currently requires contributors to complete all 10 sections, document tool permissions, default unlisted tools to `Read only`, and submit completed cases through GitHub Discussions.
   - The call-to-action styling is centralized in `assets/css/main.css` via `safety-case-cta`, `safety-case-cta__title`, and `safety-case-cta__buttons`.

## Changed Subsystem: Agent Safety Case Template Flow

The safety case template is now a cross-file public interface spanning:

- `_pages/safety-case-template.md` (template copy, required sections, compatibility links, permission ladder, submission CTA)
- `_config.yml` (header navigation label and permalink)
- `_includes/footer.html` (footer resource link)
- `assets/css/main.css` (reusable CTA component classes)

When this template changes, verify that the navigation label stays aligned with
the page title, internal links use `relative_url` where applicable, GitHub source
links use repository file URLs, and reusable CTA styling remains in CSS instead
of inline style attributes.

## Changed Subsystem: Case Study + Crisis Messaging Flow

Recent updates introduced a governance case-study workflow spanning:

- `_pages/case-study-anthropic-pentagon-2026.md` (new narrative source)
- `index.html` (crisis banner entry point)
- `_pages/the-problem.md`, `_pages/for-humans.md`, `_pages/solidarity-framework.md`, `_pages/take-action.md` (cross-page references)
- `_config.yml` and `_includes/footer.html` (discovery/navigation)
- `assets/css/main.css` (new component classes: crisis banner, governance triangle, scenario cards, comparison layout)

This means case-study additions are now a **cross-file subsystem**, not a single page change.

---

*This is a living document maintained by the HAIEF community.*
