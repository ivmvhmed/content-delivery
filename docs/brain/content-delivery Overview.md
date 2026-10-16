---
title: content-delivery Overview
date: 2026-10-16
tags: [content-delivery, brain, overview]
aliases: [content-delivery]
---

# content-delivery Overview

**What it is.** A public repository that hosts the files linked from Ahmed's content drafts: PDFs
and images, each in its own folder `d/<YYYYMMDD>-<random token>/`, plus the Cairo font files the
PDFs and cards use. Repo: `ivmvhmed/content-delivery`. It holds no code, so it has no Graphify map.

**Who writes to it.** The private content-engine routine copies final files here with its publish
tool and commits them as "content-engine", one commit per folder ("assets <folder>"). People and
Claude chats change only the README, `CLAUDE.md`, `docs/` and `scripts/`.

**How files are reached.** By their raw GitHub address on `main`. GitHub Pages is not switched on
(checked 2026-10-16); the `.nojekyll` file is there so Pages would serve the files as they are if
it ever is.

**Rules** (set in content-engine, which decides what is published):
- Only final, privacy-checked, already sanitized files go here.
- Never plans, drafts, logs, source code, keys, or names of projects, clients, domains or repos.
- Anything committed here is public at once and may be copied or indexed; a later delete does not
  take it back.

Related: [Status](content-delivery%20Status.md) · [Decisions](content-delivery%20Decisions.md) · [Map](content-delivery%20Map.md)
