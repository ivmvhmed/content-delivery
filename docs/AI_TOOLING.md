# AI tooling: the Obsidian brain

Claude's memory for this repository is a set of short notes in [`docs/brain/`](brain/README.md),
shown in Ahmed's Obsidian vault under `Projects\content-delivery\brain`. Moved into the repository
2026-10-16. There is no code map: the repository holds files, not code. The repository is public,
so the notes are public too and hold only what the repository already shows.

## Setup on Ahmed's PC (one time)

Clone the repository into `Documents\Projects\content-delivery`, then from the clone run once:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\obsidian\link-brain.ps1
```

It turns the vault's `Projects\content-delivery` into a folder link to the clone's `docs\` folder.
A folder already there is renamed `content-delivery (old)`, never deleted. `Home.md` links are
pointed at `Projects/content-delivery/brain/`. Use `-Vault` or `-Repo` if the folders live
elsewhere. The link leads into the repository: never delete it recursively (`Remove-Item -Recurse`
empties the repository's `docs\`). `cmd /c rmdir "<vault>\Projects\content-delivery"` removes only
the link.

## Daily use

- The routine pushes new `d/` folders to `main` most days: `git pull` before editing a note.
- The clone shows the notes of whatever branch it is on; keep it on `main`.
- Nothing private in the notes, ever.

Related: [content-delivery brain](brain/README.md) · [docs index](INDEX.md)
