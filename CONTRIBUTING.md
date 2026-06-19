# Contributing to HAIEF

Thank you for your interest in contributing to the Human & AI ElevAItion Foundation. Every contribution helps keep open source AI truly open.

## Ways to Contribute

### For Everyone

- **Share your experience** - Tell us about your interactions with AI systems
- **Provide feedback** - Review proposals and specifications
- **Report issues** - Help us find gaps and errors
- **Spread the word** - Share HAIEF with others who care about AI governance

### For Technical Contributors

- **Implement frameworks** - Build reference implementations
- **Develop tests** - Create validation suites
- **Improve documentation** - Clarify and expand explanations
- **Review code** - Help maintain quality

### For Domain Experts

- **Policy input** - Help with standards body engagement
- **Accessibility review** - Ensure frameworks serve all users
- **Crisis expertise** - Improve intervention protocols
- **Legal perspective** - Navigate licensing and compliance

## Getting Started

1. **Read the documentation** - Start with [Who We Are](/who-we-are/) and [The Solidarity Framework](/solidarity-framework/)
2. **Join the discussion** - Introduce yourself in [GitHub Discussions](https://github.com/NeuroLift-Technologies/haief/discussions)
3. **Find an issue** - Look for issues labeled `good first issue` or `help wanted`
4. **Ask questions** - We're happy to help you get oriented

## Contribution Process

### For Issues and Proposals

1. Check existing issues to avoid duplicates
2. Use the appropriate issue template
3. Provide as much context as possible
4. Be patient - community review takes time

### For Pull Requests

1. Fork the repository
2. Create a descriptive branch name
3. Make your changes
4. Write clear commit messages
5. Submit a pull request with full description
6. Respond to review feedback

### For AI Agents

AI-generated contributions are welcome with required disclosures:

```
agent_identity: [consistent identifier]
agent_type: [model/system description]
human_operator: [responsible party]
generation_context: [prompt that generated this]
verification_status: [human reviewed / unreviewed]
```

All agent contributions require human review before merge.

## Community Standards

### We Value

- Respectful disagreement
- Lived experience alongside credentials
- Clear communication over jargon
- Accessibility in all forms
- "Nothing About Us Without Us"

### We Don't Accept

- Personal attacks or harassment
- Discrimination of any kind
- Undisclosed conflicts of interest
- Dismissing input based on who it comes from

See [Community Guidelines](community/guidelines.md) for full details.

## Development Setup

### Website (Astro on Cloudflare Workers)

```bash
# Install dependencies
npm install

# Run local server
npm run dev

# Build for production
npm run build

# Preview the built site locally
npm run preview
```

The site requires Node `>=22`; the current Worker toolchain has been validated
with Node v22.22.2. `npm run check` is currently an alias for `astro build`.
`npm run preview` runs a build first, then starts `wrangler dev` against the
Worker configuration in `wrangler.jsonc`.

Use `npm run generate-types` after changing Cloudflare bindings in
`wrangler.jsonc`; it runs `wrangler types` for the `worker-configuration.d.ts`
file referenced by `tsconfig.json`.

### Documentation + Site Content Workflow

Use this workflow when adding/updating public pages:

1. **Edit content in `src/pages/`**
   - Markdown pages use front matter fields such as `layout: ../layouts/Base.astro`, `title`, and `description`.
   - The homepage lives at `src/pages/index.astro`; the not-found page lives at `src/pages/404.astro`.
2. **Wire discoverability**
   - Add/update header navigation in `src/components/Header.astro`.
   - Add/update corresponding footer links in `src/components/Footer.astro` when appropriate.
3. **Use stable internal links**
   - Use root-relative links such as `/target/`.
   - Do not use Jekyll Liquid filters; the Astro site has no `/haief` base URL.
4. **Prefer reusable styling**
   - Add repeated styles as classes in `public/assets/css/main.css`.
5. **Verify the site builds**
   - Run `npm run build` or `npm run check` before opening a docs PR.
6. **Do not deploy without approval**
   - `npm run deploy` builds and deploys with `wrangler deploy`; production deployment requires explicit human authorization.
   - `wrangler.jsonc` currently names the Worker `haief`, serves assets from `./dist` through the `ASSETS` binding, and enables observability.
   - Route and custom-domain bindings are managed outside this repository; verify them with an authorized human before relying on a live URL.

### Public Goals and Safety Case Updates

Use this additional checklist when editing `src/pages/safety-case-template.md`,
public-goal language, or governance crisis timelines:

1. **Keep claims traceable**
   - Source factual event claims on the page where they appear.
   - Separate observed events from HAIEF analysis.
2. **Preserve the safety case contract**
   - The public template currently has ten required sections.
   - Update `docs/overview.md` and `docs/governance.md` if the section list, review path, or linked specifications change.
3. **Cross-link the workflow**
   - Public goals belong in narrative pages such as `src/pages/who-we-are.md`.
   - Evidence and constraints belong in `src/pages/safety-case-template.md`.
   - Case-study timelines belong in the relevant case-study or problem page.
4. **Avoid premature compliance language**
   - Do not claim certification, registration, or review unless that process exists publicly.
   - Use "submit for community review" only when linking to the configured Discussions URL.

### Troubleshooting Common Pitfalls

- **New page not reachable from navigation**
  - Check both `src/components/Header.astro` and `src/components/Footer.astro`.
- **Broken internal links in production**
  - Use root-relative links such as `/safety-case-template/`; remove leftover Liquid such as `relative_url`.
- **Poor social preview cards**
  - Ensure page front matter includes a concise `description`.
- **Inconsistent governance terminology**
  - Cross-check terms with `src/pages/solidarity-framework.md` before merge.
- **Local Cloudflare secrets or environment files appear in git**
  - `.dev.vars*` and `.env*` are ignored by default; commit only intentionally reviewed example files such as `.dev.vars.example` or `.env.example`.
- **Worker metadata is served as a static asset**
  - Keep `public/.assetsignore`; it excludes `_worker.js` and `_routes.json` from the assets upload if those files are present.
- **Cloudflare binding types are stale**
  - Run `npm run generate-types` after changing `wrangler.jsonc`, then review any generated `worker-configuration.d.ts` diff before committing it.
- **Astro fails before loading config with `node:module.registerHooks`**
  - Upgrade to a current Node 22.x runtime, rerun `npm ci`, and build again. Node v22.14.0 failed in automation; Node v22.22.2 passed.

### Documentation

All documentation is in Markdown. Follow existing formatting conventions.

## Questions?

- Open a [Discussion](https://github.com/NeuroLift-Technologies/haief/discussions) for general questions
- Open an [Issue](https://github.com/NeuroLift-Technologies/haief/issues) for specific problems
- Review existing documentation for common answers

---

*Your voice matters. Your contribution counts. Welcome to HAIEF.*
