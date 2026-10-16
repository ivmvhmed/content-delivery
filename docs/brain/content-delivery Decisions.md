---
title: content-delivery Decisions
date: 2026-10-16
tags: [content-delivery, brain, decisions]
---

# content-delivery Decisions

Newest first. **Source:** *documented* means a file records it; *inferred* means Claude concluded
it, for Ahmed to check.

| Date | Decision | Why | Source |
| --- | --- | --- | --- |
| 2026-10-16 | Claude's project memory lives in `docs/brain/`; Ahmed's Obsidian vault sees the same files through a folder link | A cloud session cannot reach the PC vault; the repo reaches both | decided by Ahmed, 2026-10-16 |
| 2026-10-16 | The notes in this public repository hold only what the repository already shows | Everything here is public | Claude's call, inferred from the content-engine rules; Ahmed can veto |
| 2026-10-07 | Delivered files live in a separate public repository; the drafts, plans and rules stay private | Links in emails must work without exposing the private repo | documented, content-engine's rules (DELIVERY) |
| 2026-10-07 | Each delivery gets its own folder named by date plus a random token | The token makes the addresses hard to guess | documented, content-engine's publish tool |
| 2026-10-07 | `.nojekyll` at the root | Pages, if switched on, serves the files untouched (inferred) | documented, commit for #1 |

Related: [Overview](content-delivery%20Overview.md)
