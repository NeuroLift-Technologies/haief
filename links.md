# NeuroLift Technologies — Agent Reference Links

This file is a curated reference for coding agents working on NeuroLift Technologies org repos.
Use these repositories for skills, tools, documentation, and starter patterns when building on
the Cloudflare developer platform.

---

## Agent Skills

### skills — <https://github.com/NeuroLift-Technologies/skills>

Collection of Agent Skills for building on Cloudflare: Workers, Agents SDK, Durable Objects,
MCP servers, and more. Compatible with Claude Code, Cursor, OpenCode, OpenAI Codex, and Pi.

**Install options:**

- Claude Code plugin marketplace: `https://code.claude.com/docs/en/discover-plugins#add-from-github`
  ```
  /plugin marketplace add cloudflare/skills
  /plugin install cloudflare@cloudflare
  ```
- Cursor: Settings > Rules > Add Rule > Remote Rule (GitHub) with `cloudflare/skills`
- npx: `npx skills add https://github.com/NeuroLift-Technologies/skills`
- Clone / copy skill folders into the agent's skill directory (`~/.claude/skills/`, `~/.cursor/skills/`, etc.)

**Commands (user-invocable slash commands):**

| Command | Description |
|---|---|
| `/cloudflare:build-agent` | Build an AI agent on Cloudflare using the Agents SDK |
| `/cloudflare:build-mcp` | Build an MCP server on Cloudflare |

**Available skills (auto-loaded based on conversation context):**

| Skill | Useful for |
|---|---|
| `cloudflare` | Workers, Pages, KV, D1, R2, AI, Vectorize, Agents SDK, networking, security, IaC |
| `agents-sdk` | Building stateful AI agents with state, scheduling, RPC, MCP, email, streaming chat |
| `durable-objects` | Stateful coordination (chat rooms, games, booking), RPC, SQLite, alarms, WebSockets |
| `sandbox-sdk` | Secure code execution, code interpreters, CI/CD systems, interactive dev environments |
| `wrangler` | Deploying and managing Workers, KV, R2, D1, Vectorize, Queues, Workflows |
| `web-perf` | Auditing Core Web Vitals (FCP, LCP, TBT, CLS), render-blocking resources |
| `building-mcp-server-on-cloudflare` | Building remote MCP servers with tools, OAuth, and deployment |
| `building-ai-agent-on-cloudflare` | Building AI agents with state, WebSockets, and tool integration |

**Bundled MCP servers:**

| Server | Purpose |
|---|---|
| `cloudflare-docs` | Up-to-date Cloudflare documentation and reference |
| `cloudflare-bindings` | Build Workers apps with storage, AI, and compute primitives |
| `cloudflare-builds` | Manage and get insights into Workers builds |
| `cloudflare-observability` | Debug and analyze application logs and analytics |

Agents should reference this repo for platform-specific coding guidance and contextual skills.

---

## Cloudflare Platform Tools

### mcp-server-cloudflare — <https://github.com/NeuroLift-Technologies/mcp-server-cloudflare>

Remote MCP servers exposing Cloudflare platform capabilities as tools for AI agents. Supports
`streamable-http` transport (`/mcp`) and `sse` transport (`/sse`). Use when building or
integrating MCP-powered workflows.

**Available servers:**

| Server | Description | URL |
|---|---|---|
| Documentation | Up-to-date Cloudflare docs and reference | `https://docs.mcp.cloudflare.com/mcp` |
| Workers Bindings | Build Workers apps with storage, AI, compute primitives | `https://bindings.mcp.cloudflare.com/mcp` |
| Workers Builds | Insights and management for Cloudflare Workers Builds | `https://builds.mcp.cloudflare.com/mcp` |
| Observability | Debug application logs and analytics | `https://observability.mcp.cloudflare.com/mcp` |
| Radar | Global Internet traffic insights, trends, URL scans | `https://radar.mcp.cloudflare.com/mcp` |
| Container | Spin up a sandbox development environment | `https://containers.mcp.cloudflare.com/mcp` |
| Browser Rendering | Fetch web pages, convert to markdown, take screenshots | `https://browser.mcp.cloudflare.com/mcp` |
| Logpush | Quick summaries for Logpush job health | `https://logs.mcp.cloudflare.com/mcp` |
| AI Gateway | Search logs, get details about prompts and responses | `https://ai-gateway.mcp.cloudflare.com/mcp` |
| AutoRAG | List and search documents on AutoRAGs | `https://autorag.mcp.cloudflare.com/mcp` |
| Audit Logs | Query audit logs and generate reports | `https://auditlogs.mcp.cloudflare.com/mcp` |
| DNS Analytics | Optimize DNS performance and debug issues | `https://dns-analytics.mcp.cloudflare.com/mcp` |
| Digital Experience Monitoring | Insights on critical applications for your org | `https://dex.mcp.cloudflare.com/mcp` |
| Cloudflare One CASB | Identify security misconfigurations for SaaS applications | `https://casb.mcp.cloudflare.com/mcp` |
| GraphQL | Analytics data using Cloudflare's GraphQL API | `https://graphql.mcp.cloudflare.com/mcp` |

**Connecting via mcp-remote (for clients without native remote MCP support):**

```json
{
  "mcpServers": {
    "cloudflare-observability": {
      "command": "npx",
      "args": ["mcp-remote", "https://observability.mcp.cloudflare.com/mcp"]
    },
    "cloudflare-bindings": {
      "command": "npx",
      "args": ["mcp-remote", "https://bindings.mcp.cloudflare.com/mcp"]
    }
  }
}
```

---

### agents — <https://github.com/NeuroLift-Technologies/agents>

Cloudflare Agents SDK — the core library for building stateful AI agents on Cloudflare Workers
(powered by Durable Objects). Each agent has its own state, storage, and lifecycle. Agents
hibernate when idle and wake on demand.

**Install:**

```
npm install agents
```

Or scaffold a new project:

```
npm create cloudflare@latest -- --template cloudflare/agents-starter
```

**Features:**

| Feature | Description |
|---|---|
| Persistent State | Syncs to all connected clients, survives restarts |
| Callable Methods | Type-safe RPC via the `@callable()` decorator |
| Scheduling | One-time, recurring, and cron-based tasks |
| WebSockets | Real-time bidirectional communication with lifecycle hooks |
| AI Chat | Message persistence, resumable streaming, server/client tool execution |
| MCP | Act as MCP servers or connect as MCP clients |
| Workflows | Durable multi-step tasks with human-in-the-loop approval |
| Email | Receive and respond via Cloudflare Email Routing |
| Code Mode | LLMs generate executable TypeScript instead of individual tool calls |
| SQL | Direct SQLite queries via Durable Objects |
| React Hooks | `useAgent` and `useAgentChat` for frontend integration |
| Vanilla JS Client | `AgentClient` for non-React environments |

**Packages:**

| Package | Description |
|---|---|
| `agents` | Core SDK — Agent class, routing, state, scheduling, MCP, email, workflows |
| `@cloudflare/ai-chat` | Higher-level AI chat — persistent messages, resumable streaming, tool execution |
| `hono-agents` | Hono middleware for adding agents to Hono apps |
| `@cloudflare/codemode` | Experimental — LLMs write executable code to orchestrate tools |

Docs: <https://developers.cloudflare.com/agents/>

---

### cloudflare-agents-starter — <https://github.com/NeuroLift-Technologies/cloudflare-agents-starter>

Chat Agent Starter Kit with Auth0 authentication. A full-featured scaffolding baseline for
building AI-powered chat agents on Cloudflare, secured with Auth0.

**Quick start:**

```
npx create-cloudflare@latest --template auth0-lab/cloudflare-agents-starter
```

**Features:**

- Interactive chat interface with AI and real-time streaming responses
- Auth0 authentication and authorization (JWT tokens, federated connections via Token Vault)
- Backchannel Authentication for human-in-the-loop interactions (Auth0 CIBA)
- User-specific chat history and management
- Built-in tool system with human-in-the-loop confirmation
- Task scheduling (one-time, delayed, and recurring via cron)
- Dark/Light theme support and modern responsive UI

**Prerequisites:** Cloudflare account (Workers & Workers AI enabled), OpenAI API key, Auth0 account.

Use this as the scaffolding baseline when creating new agent projects within the org.

---

## Documentation

### cloudflare-docs — <https://github.com/cloudflare/cloudflare-docs>

Open-source repository for all Cloudflare Developer Documentation.
Live site: <https://developers.cloudflare.com/>

Reference for Workers, Pages, KV, D1, R2, AI (Workers AI, Vectorize, Agents SDK), Durable
Objects, Queues, Workflows, Tunnels, and all other Cloudflare primitives used across NLT repos.
Content is licensed CC BY 4.0; code samples are MIT licensed.

---

### Cloudflare Style Guide — AI Tooling — <https://developers.cloudflare.com/style-guide/ai-tooling/>

Official guide for consuming Cloudflare documentation with AI tools.

**Docs in Markdown for LLMs:**

- Full docs index by category: `https://developers.cloudflare.com/llms.txt`
- Full docs in one file (large-context usage): `https://developers.cloudflare.com/llms-full.txt`
- Any page as Markdown: append `/index.md` to any doc URL, or send `Accept: text/markdown` header

**Documentation MCP Server:**

Connect via OAuth on Claude, Windsurf, the AI Playground, or any SDK that supports MCP.

| Client | Install |
|---|---|
| Cursor | [Direct install link](https://cursor.com/en-US/install-mcp?name=cloudflare&config=eyJjb21tYW5kIjoibnB4IG1jcC1yZW1vdGUgaHR0cHM6Ly9kb2NzLm1jcC5jbG91ZGZsYXJlLmNvbS9zc2UifQ%3D%3D) |
| VSCode | [Direct install link](vscode:mcp/install?%7B%22name%22%3A%22cloudflare%22%2C%22url%22%3A%22https%3A%2F%2Fdocs.mcp.cloudflare.com%2Fmcp%22%7D) |
| Manual | Add `npx mcp-remote https://docs.mcp.cloudflare.com/mcp` to MCP config |

```json
{
  "mcpServers": {
    "cloudflare": {
      "command": "npx",
      "args": ["mcp-remote", "https://docs.mcp.cloudflare.com/mcp"]
    }
  }
}
```

**Agent Skills:**

```sh
npx skills add https://developers.cloudflare.com
```

**AI resources for docs contributors (`cloudflare-docs` repo):**

- [`AGENTS.md`](https://github.com/cloudflare/cloudflare-docs/blob/production/AGENTS.md) — helps coding agents understand repo structure, tooling, and conventions
- Native configs for [OpenCode](https://opencode.ai/) and [Windsurf](https://windsurf.com/)
- Setup scripts via [`rulesync`](https://github.com/dyoshikawa/rulesync) for Claude Code, Cursor, and GitHub Copilot:

```bash
npm run ai-setup:claudecode   # Configure Claude Code
npm run ai-setup:cursor       # Configure Cursor
npm run ai-setup:copilot      # Configure GitHub Copilot
```
