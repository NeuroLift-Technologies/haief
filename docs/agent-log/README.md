# Agent Log

This directory contains agent registration records and session handoff documents.

- `registrations/` — Agent self-registration files (one per session start)
- `handoffs/` — Session handoff records (written at session end)

## File Naming

Use stable, date-prefixed names so future agents can scan the directory quickly:

- `registrations/YYYY-MM-DD-[agent-or-session].json`
- `handoffs/YYYY-MM-DD-[session-id]-handoff.json`

## Required Templates

- Registration format: `templates/agent-registration.json`
- Handoff format: `templates/handoff-record.json`

Each significant session should also update `docs/active-threads.md` before ending.
