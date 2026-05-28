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

## Runbook: Public Goals and Agent Safety Cases

Use this checklist when changing public-goal language or the agent safety case template:

1. **Confirm the governance distinction**
   - A model specification or public goal explains intended behavior.
   - A safety case explains the evidence and constraints that make the goal credible.
   - The governance layer explains enforcement when goals conflict, systems drift, handoffs occur, or users are placed at risk.
2. **Update the canonical template first**
   - The public template lives at `_pages/safety-case-template.md`.
   - Keep the ten-section structure complete unless the governance model itself changes.
   - Preserve links to TOI/OTOI, Provenance, Identity Integrity, and Handoff Rules when those specifications remain applicable.
3. **Keep discovery paths current**
   - Header navigation is configured in `_config.yml`.
   - Footer resources are maintained in `_includes/footer.html`.
   - Contributor-facing instructions live in `CONTRIBUTING.md`.
4. **Avoid unsupported compliance claims**
   - Do not describe a safety case as reviewed, certified, or registered unless the corresponding public review process exists.
   - "Submitted for community review" and "planned registry" language should remain distinct from completed recognition.
5. **Validate examples and constraints**
   - Examples should name required evidence types, such as provenance logs, identity declarations, handoff records, red-team results, escalation triggers, and shutdown behavior.
   - Constraints should state default behavior for absent TOI, unsupported handoffs, unlisted tools, memory retention, and crisis escalation.

Current public workflow:

- Authors copy `_pages/safety-case-template.md`, complete all ten sections, and link the completed safety case from the agent repository README.
- Submission currently means opening a GitHub Discussions thread through `site.social.discussions`.
- Discussion feedback or acknowledgment is not certification, registration, or a HAIEF compliance seal.
- A registry can only be documented as active after the public review process and registry location are defined.

Verification checklist:

- Confirm `_config.yml` and `_includes/footer.html` both expose `/safety-case-template/`.
- Count ten `## Section` headings in `_pages/safety-case-template.md`.
- Check that review links use `site.social.discussions` and specification links use `site.social.github`.
- Run `bundle exec jekyll build` when Ruby dependencies are available; otherwise perform the static checks above before opening a docs PR.

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
