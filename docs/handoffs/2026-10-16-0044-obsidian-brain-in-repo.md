# Handoff: Claude's notes moved into docs/brain; vault link on Ahmed's PC

- Date (UTC): 2026-10-16 00:44 · Status: COMPLETE (PR open for review)
- Branch: docs/obsidian-brain (base: main) · PR: #2
- Written by: Claude Opus 5.5

## Goal
Ahmed decided on 2026-10-16 that Claude's notes for each of his repositories live in the
repository's `docs/brain/`, and his Obsidian vault shows them through a folder link.

## What changed
- `docs/brain/`: Overview, Status, Decisions, Plans, Errors, Map and a README. The vault had one
  Overview note; its facts were checked against this repository and kept. Written to be public:
  only what the repository already shows.
- `CLAUDE.md` (new): this repository is public; the brain's read order; the wrap-up routine.
- `scripts/obsidian/link-brain.ps1`, `docs/AI_TOOLING.md`, `docs/INDEX.md`, `docs/handoffs/INDEX.md`.
- The delivered files in `d/` and the fonts are untouched.

## Verification
On Ahmed's PC: `link-brain.ps1` made `Projects\content-delivery` in the vault a link to this
clone's `docs\`; the vault's Home links resolve; the old vault note went to the vault's trash;
vault lint 0 errors.

## Waiting on Ahmed
Read the notes once for anything that should not be public, then merge and `git pull` on `main`.
