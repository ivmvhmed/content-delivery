# content-delivery

This repository is PUBLIC. It hosts final files (PDFs, images) linked from Ahmed's content drafts,
each in `d/<YYYYMMDD>-<random token>/`, plus the Cairo fonts. The content-engine routine writes the
`d/` folders; never edit, rename or delete them by hand.

Anything committed here is public at once and may be copied or indexed; a later delete does not
take it back. So nothing goes in that is not meant to be public: no plans, drafts, logs, source
code, keys, passwords, or names of projects, clients, domains or repos.

## Project brain (Obsidian)

Claude's memory for this repository is the short notes in `docs/brain/`. Ahmed's Obsidian vault
shows the same files under `Projects\content-delivery\brain` (a folder link made once by
`scripts/obsidian/link-brain.ps1`). They are public like everything else here.

At the start of every chat that changes this repository:

1. Read `docs/brain/content-delivery Overview.md` and `docs/brain/content-delivery Status.md`.
2. Check `docs/brain/content-delivery Decisions.md` before changing how it works.
3. Read the newest handoff in `docs/handoffs/`.

Notes stay short, hold only what the repository already shows, use relative markdown links
(`content-delivery%20Status.md`), and mark anything Claude concluded itself "inferred".

## Before ending a session ("wrap up")

When Ahmed says "wrap up", in the same PR as the work:

- `docs/brain/content-delivery Status.md`: a new entry on top (done, waiting on Ahmed, next), under 10 lines.
- `docs/brain/content-delivery Decisions.md`: each decision made, with the date, why, and its source.
- A handoff in `docs/handoffs/`, with its line in `docs/handoffs/INDEX.md`. Public too: keep it to
  what changed here.
