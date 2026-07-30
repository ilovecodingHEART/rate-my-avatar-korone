# rate-my-avatar-korone

`donate pls.rbxl` is a full PLS DONATE decompile. This branch makes it run on a
**2021-era Roblox client (pekora.zip)** — as **script replacements you paste
yourself** (no converted .rbxl; say the word if you want one later, the tooling can
emit it).

**Start here: [REPORT-2021.md](REPORT-2021.md)** — delete list, paste list, GUI
rebuild notes, limitations.

| Folder | Contents |
|---|---|
| `2021-patches/` | 72 hand-verified script replacements (see `INDEX.md` inside) |
| `2021-fixed/` | the other 1,208 scripts, auto-fixed; only the 254 in `CHANGED.md` differ — 14 of those still need the hand edits in `MANUAL-FIXES.md` |
| `extracted/` | raw 1,280-script dump + `manifest.json` (reference) |
| `tools/` | rbxl chunk walker, API scanner, patch & fix generators |
