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
- **Keep cross-page language aligned.** Changes to a major claim should be reflected in `index.html`, `_pages/the-problem.md`, and relevant action/education pages when applicable.
- **Prefer update-over-duplication.** Expand existing governance pages before creating new standalone pages.

## Runbook: Publishing a Governance Case Study

Use this checklist when adding event-based governance documentation:

1. **Create or update the case-study page in `_pages/`**
   - Include front matter with `layout`, `title`, `description`, and `permalink`.
2. **Add discovery paths**
   - Header nav (`_config.yml` `nav`) and footer links (`_includes/footer.html`) if the page is a primary reference.
3. **Wire context across key paths**
   - Link from homepage and from the affected framework/problem/action pages.
4. **Add only required styling**
   - Place new reusable classes in `assets/css/main.css`; avoid one-off inline styles when a class is reusable.
5. **Validate metadata coverage**
   - Confirm the page has a description so Open Graph/Twitter card metadata remain meaningful.
6. **Document sources**
   - Add a source section in the case-study page and keep link text specific to each claim.

## Operational Pitfalls and Safeguards

- **Pitfall:** Publishing a page without nav integration.  
  **Safeguard:** Check both `_config.yml` and `_includes/footer.html`.
- **Pitfall:** Broken links due to base URL differences.  
  **Safeguard:** Use `{{ '/path/' | relative_url }}` for internal links.
- **Pitfall:** Overstating framework guarantees.  
  **Safeguard:** Verify wording against existing framework documents before merge.
- **Pitfall:** Style sprawl from repeated inline formatting.  
  **Safeguard:** Promote repeated styles to named CSS classes in `assets/css/main.css`.

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
