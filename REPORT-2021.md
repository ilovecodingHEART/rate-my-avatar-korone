# REPORT-2021 — running this PLS DONATE decompile on a 2021 client (pekora.zip)

`donate pls.rbxl` is a full save-instance decompile of modern PLS DONATE: **99,903
instances, 1,726 script instances, 1,280 unique script sources**. Two things stop it
from working on a 2021 client:

1. **The file itself** — the place is written with zstd-compressed chunks; 2021 clients
   only read LZ4 chunks. It will never open in 2021 Studio. (Bring the game over by
   copying objects from a modern-Studio session, per below. If you ever decide you'd
   rather have a converted .rbxl, the tools here can decompress/recompress it — ask.)
2. **The code** — it calls 2022–2023 APIs and uses 2022 Luau syntax that a 2021 build
   can't even compile. That's what this downgrade fixes.

Everything below is designed for a "I'll paste it myself" workflow.

---

## Folder map

| Folder | What it is | You care? |
|---|---|---|
| `2021-patches/` | **72 hand-verified full script replacements** (the scripts that had 2022+ API calls). Index: `2021-patches/INDEX.md` | YES — paste all |
| `2021-fixed/` | The other 1,208 scripts, mechanically fixed. Only **254 differ** from the originals (list: `2021-fixed/CHANGED.md`); the other 954 are untouched, bring them straight from modern Studio. 14 of the 254 still need hand edits: see `2021-fixed/MANUAL-FIXES.md` | YES — paste the 254 |
| `extracted/` | Raw script dump from the place file, for reference (`manifest.json` maps every script hash to its place paths) | reference only |
| `tools/` | The pipeline (`extract_scripts.py`, `analyze.py`, `make_outputs.py`, `make_patches.py`, `fix_all2021.py`) | optional re-runs |

All replacement files are complete scripts: paste over the **whole** Source of the
matching script. Every change is marked `[2021]` in a comment.

---

## Step 0 — get the place into 2021 Studio

1. Open `donate pls.rbxl` in **modern** Studio (it opens fine there).
2. Copy services/folders piece by piece into your 2021 place (Explorer multi-select →
   Copy/Paste works between two Studio windows).
3. Skip everything in the **delete list** below — it either doesn't exist on 2021
   (paste errors) or is engine junk the save tool captured.
4. Don't copy service containers that aren't creatable on 2021 (`TextChatService`,
   `UGCAvatarService`, `VideoCaptureService`, `VideoService`,
   `ServiceVisibilityService`, `AvatarSettings`, `AvatarRules`).

## Step 1 — delete list (do NOT bring these over)

**Dead on 2021 (classes that don't exist there):**

| What | Count | Replacement |
|---|---|---|
| `AdGui` (rewarded-ad billboards) | 94 | none on 2021 — ad code is already stubbed, see caveats |
| `BodyPartDescription` children inside HumanoidDescriptions | 120 | set the same numbers directly on the HumanoidDescription's number properties if you care; otherwise dummies just use default body |
| `AccessoryDescription` children | 38 | same: set `HumanoidDescription`'s accessory properties manually |
| `AvatarAbilityRules`, `AvatarAccessoryRules`, `AvatarAnimationRules`, `AvatarBodyRules`, `AvatarClothingRules`, `AvatarCollisionRules`, `AvatarRules` | 7 | none on 2021 |
| `AvatarSettings` service instance | 1 | none |
| `BubbleChatConfiguration`, `ChannelTabsConfiguration`, `ChatInputBarConfiguration`, `ChatWindowConfiguration` (+ the `TextChatService` container itself) | 5 | 2021 bubble chat = `ChatService.BubbleChatEnabled` / ClassicCap settings |
| `UnreliableRemoteEvent` | 1 | replace with a normal `RemoteEvent` named the same (it's the penalty-minigame net channel) |
| `UGCAvatarService`, `VideoCaptureService`, `VideoService`, `ServiceVisibilityService` | 4 | none |

**Engine junk the save tool captured (2021 already ships its own versions — keeping
these BREAKS the 2021 built-ins):**

- `Chat.ChatScript` (ChatMain, ChatWindow, ChatBar, MessageLabel, …) — the 2021 client
  injects its own chat UI scripts at runtime.
- `Chat.ClientChatModules` — same story for client command modules.
- `StarterPlayer.StarterPlayerScripts.PlayerModule` + `RbxCharacterSounds` — engine
  camera/control/sound overrides captured from the runtime.
- `Workspace.AssetReuploader` (a whole Studio plugin that ended up in Workspace,
  type annotations and all — delete the folder).
- `ReplicatedStorage.NexusVRCharacterModel` — VR support package. 2021 doesn't have
  the APIs this wants. Delete it; nothing breaks if nothing `require`s it. If a
  require chain errors on it, drop an empty ModuleScript in its place.
- Any `*_spec` scripts (Roact test files) — dead code, skip them.

## Step 2 — paste the 72 patches

`2021-patches/INDEX.md` maps every patch file to its exact instance path and class.
The big ones, so you know what you're looking at:

- **`StarterGui.ScreenGui.ClientMain` (LocalScript)** and **`ServerScriptService.AdminPanel`** —
  the 5,500-line client+admin twins: VoiceChatService stub (voice = off),
  TextChatService shim that routes system messages through legacy
  `StarterGui:SetCore("ChatMakeSystemMessage")` (rich-text size/color attributes are
  parsed and approximated), `table.clear`→loop, invite button → 1-arg
  `PromptGameInvite`, sound RollOff→Min/MaxDistance, all 2022 syntax lowered.
  **Note:** `AdminPanel` is a server `Script` that contains *client* code (it used
  RunContext on modern). Move it to **StarterPlayerScripts as a LocalScript**, or it
  will never run.
- **`ReplicatedStorage.Client.remotes`** — the penalty minigame's ZAP buffer-protocol
  client; 2021 has no `buffer` library, so the patch injects a pure-Lua buffer shim
  over strings. Its **server twin is not in the save** (lived outside the DataModel),
  so penalty minigame matchmaking needs that module if you ever get it — same shim
  applies.
- **`ReplicatedStorage.Icon` + Satchel's vendored topbarplus** — the topbar/backpack
  UI: Font value-type code rewritten to legacy `Enum.Font`, CanvasGroup→Frame,
  UIFlex/ScreenInsets/PreferredInput emulation, one `Enum.PreferredInput` crash fixed
  with a device-capability helper.
- **`ServerScriptService.Commands`** — BanAsync/UnbanAsync → Kick/warn (no Ban API on
  2021; no alt-account exclusion, no cross-server persistence).
- **`ServerScriptService.Script`** ("DumbIdiot") — was broken on *every* Roblox
  version (`game:GetService("DumbIdiot")`); replaced with a no-op stub.
- **Two more misplaced scripts:** `ServerScriptService.Game.Protection.AntiCheat.Anti Cheat`
  is a *LocalScript* sitting in ServerScriptService — it never runs there even on
  modern; move it to StarterPlayerScripts if you want the anti-cheat. Same story for
  any other LocalScript you find under ServerScriptService/ServerStorage.

## Step 3 — paste the 2021-fixed scripts that changed

`2021-fixed/CHANGED.md` lists the 254 files that needed changes. Paste those from
`2021-fixed/`. Bring the other ~954 over from modern Studio untouched.

Mechanical fixes applied to them (all semantics-exact):

- `%*` → `%s` (445 sites). `%*` is the decompiler's stand-in for string
  interpolation; 2021's `string.format` refuses it. Only lines that actually feed
  `format(` were touched — Lua *patterns* using `%*` (Cmdr) are left alone.
- `for k, v in t do` → `for k, v in pairs(t) do` (250 sites). Bare-table iteration
  is the 2022 "generalized iteration" feature; on 2021 it's a runtime error.
- if-expressions → `__2021_if(condFn, thenFn, elseFn)` (147 sites). A lazy-ternary
  local is injected at the top of each affected file; branches only evaluate when
  chosen (conditions often guard nil paths, so `and/or` rewrites would be wrong).
- Compound assignments `x += y` etc. → `x = x + (y)` (37 sites).
- Library shims injected where used (93 files): `table.clear`, `table.clone`,
  `table.freeze` (identity), `table.find`, `math.round` (half-away-from-zero),
  `Color3.fromHex`. All are exact for the uses in this codebase.
- `.FontFace = Font.fromEnum(X)` → `.Font = X`; other `.FontFace = Font.*(...)` →
  `.Font = Enum.Font.Gotham` fallback (wide Montserrat/BuilderSans usage collapses to
  the Gotham family — that's what GothamSSm mostly was anyway).
- Decompiler damage repaired: `x = obj:Method` colon-values → dot indexing (2 sites —
  these were broken even on modern Roblox), and one stray `§` line removed.

**14 files still need hand edits** (6 `continue`, tricky/multi-line if-expressions).
They're listed with line numbers in `2021-fixed/MANUAL-FIXES.md`, the lines are marked
inline in each file, and the recipes are in the next section. Six of the 14 you can
also just **skip**: the 3 AssetReuploader plugin files (deleted in step 1 anyway),
`NexusVR…EnigmaView` (VR, step 1), `Robase`/`Robase.Promise` (Firebase — dead on a
revival no matter what), and arguably the Iris debug windows. The ones that matter:
`ReplicatedStorage.Client.UI.UIRoot`, `ServerScriptService.Shop`,
`ServerScriptService.Cmdr.BuiltInCommands.Utility.runLines`,
`StarterPlayer.StarterPlayerScripts.RealismClient`, the two `roact-hooks` packages.

## Step 4 — GUI rebuild notes

Scripts look up a few GUI objects **by the name the modern classes forced**:

- The modern game uses `CanvasGroup` (2022) for fade-out menus. On 2021 build those
  as plain `Frame`s but **keep the name `CanvasGroup`** where scripts
  `WaitForChild("CanvasGroup")`:
  - the billboard child inside `StarterGui.YourBooth` (fade code now tweens
    `BackgroundTransparency` instead, per-instance-safe),
  - the container inside the `JetpackFuel` ScreenGui,
  - `ScreenGui.Shade.CanvasGroup` (used by transitions).
- Vendor UI (Icon/topbarplus/Caption) detects `Frame` fine; fades are approximated by
  `BackgroundTransparency` so only backgrounds fade (text stays — cosmetic).
- 2021 has `IgnoreGuiInset` instead of `ScreenInsets`; the patches already use it.

---

## Fixing scripts yourself (recipes, if you hit one in the wild)

1. **`%*` format args** → change to `%s`. Only in strings passed to `string.format`
   / `:format`. Never in Lua patterns (`string.gsub/find/match/gmatch`).
2. **`for a, b in t do`** (no pairs) → `for a, b in pairs(t) do`.
3. **`local x = if c then a else b`** → paste this helper at the top of the script:
   ```lua
   local function __2021_if(vcond, vthen, velse)
       if vcond() then return vthen() else return velse() end
   end
   ```
   then write `local x = __2021_if(function() return c end, function() return a end, function() return b end)`.
   (Do **not** use `c and a or b` — it breaks when `a` is false/nil, and it evaluates
   `b` eagerly, which errors when `c` was guarding a nil.)
4. **`continue` inside a loop** → wrap the loop tail: the `continue` in this game
   always skips a fixed tail. Either invert the condition
   (`if not X then ...rest... end`) or set a flag (`local skip = false … else skip = true end`
   … `if not skip then tail() end`). One worked example is in
   `2021-patches/StarterGui_Rewind_PDRewind_Main_TextHandler.lua`.
5. **`x += y` / `x ..= y`** → `x = x + (y)` (any of `+ - * / % ^ ..`).
6. **2022+ library calls** → drop in the matching shim from any `2021-fixed` file
   that has one (`__2021_clear/clone/freeze/find/round`, `color3_fromHex_2021`).
7. **2022+ classes/enums/props** → quick swap table: CanvasGroup→Frame,
   GroupTransparency→BackgroundTransparency, ScreenInsets→IgnoreGuiInset,
   RaycastFilterType.Include/Exclude→Whitelist/Blacklist,
   HighlightDepthMode.Occluded→Default, RollOffMin/MaxDistance→Min/MaxDistance,
   `Font.from*`/FontFace→closest `Enum.Font` (Gotham family covers
   GothamSSm/Montserrat/BuilderSans), VanishingPoint… just delete it.

---

## Caveats (read once)

- **Voice chat is stubbed off** (`IsVoiceEnabledForUserIdAsync` returns false).
- **Rewarded ads show "CURRENTLY UNAVAILABLE"** — AdService is 2022+. The button is
  pcall-guarded and degrades cleanly.
- **RSVP/event-invites UI is hidden**; friend invites fall back to 1-arg
  `PromptGameInvite` (no launch-data options).
- **Ban command = Kick** with a warn in output; no persistence, no alt-exclusion.
- **Ban history & leaderboard history** Chat-window shims are best-effort (legacy
  `Chatted`-based stubs); the **Iris** debug UIs are also best-effort — leave them out
  if they complain, nothing else depends on them.
- **Fonts**: Montserrat/BuilderSans/GothamSSm → Gotham/GothamSemibold/GothamBold;
  FredokaOne exists on 2021 and is kept.
- **Highlights** lose `Occluded` (falls back to `Default`).
- **Robase (Firebase) can't work on a revival** (no Roblox HttpService backend); the
  module is untouched — its `Enum` scan hit was a false positive (it shadows `Enum`).
- The decompile also shipped **two live Hugging Face API tokens** (`ServerScriptService.Game.RoBot`
  and `…Game.AISuggestions` — AI chat features). They are **redacted in this repo**
  (`hf_YOUR_TOKEN_HERE`); external HTTP won't reach Hugging Face from a revival
  anyway, so those two features are dead unless you wire up your own backend and key.
- `task.*` library and Instance Attributes need a **mid-2021-or-later build**
  (~v0.480+; the v0.506 Dec-2021 build has everything the patches use — verified
  against the Dec-2021 API dump + Studio autocomplete list). If your revival build is
  older, expect to shim `task` too.
- Type annotations (`local x: T`, `function f(a: T)`) **compile fine on 2021** — a
  few scripts have them; leave them.
- Some extracted originals use CRLF line endings; the patches/normalized copies are
  LF. Studio doesn't care either way.
- Almost nothing here has run in a real 2021 client — it was all verified against the
  Dec-2021 (v0.506.2) API dump, enum list, and Studio autocomplete metadata, plus a
  full syntax sweep. If something errors at runtime, the marker comments (`[2021]`)
  tell you exactly what to touch, and the recipes above cover every construct class.

## Re-running the pipeline

```bash
python tools/extract_scripts.py   # place -> /tmp model json (already done; committed state)
python tools/analyze.py           # class/enum/API scan vs the 2021 dump
python tools/make_outputs.py      # model -> extracted/ + manifest.json
python tools/make_patches.py      # extracted/ -> 2021-patches/ (321 ops, asserted)
python tools/fix_all2021.py       # extracted/ -> 2021-fixed/ (mechanical pass + reports)
```

`make_patches.py` fails loudly if any expected source text drifts; `fix_all2021.py`
only ever applies transforms that are exact, and flags everything else.
