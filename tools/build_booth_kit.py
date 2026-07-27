#!/usr/bin/env python3
"""
Builds RateMyAvatarBooth.rbxm: an original, from-scratch claimable /
customizable donation-style booth (NOT extracted from any existing game)
supporting both a text sign and an image (via Roblox asset id).

Usage: python3 build_booth_kit.py <output.rbxm>
"""
import sys
import os

sys.path.insert(0, os.path.dirname(__file__))
from rbxbinary import (
    Inst, serialize,
    T_STRING, T_BOOL, T_INT32, T_FLOAT32, T_VECTOR2, T_UDIM2,
    T_COLOR3, T_VECTOR3, T_CFRAME, T_ENUM, T_REF, T_COLOR3UINT8, T_INT64,
)

HERE = os.path.dirname(__file__)
KIT_DIR = os.path.join(HERE, "..", "booth-kit")


def read_source(filename):
    with open(os.path.join(KIT_DIR, filename), "r", encoding="utf-8") as f:
        return f.read()


# ---- Enum values (from Roblox's public API dump) -------------------------
ENUM_MATERIAL_SMOOTH_PLASTIC = 272
ENUM_MATERIAL_WOOD_PLANKS = 528
ENUM_NORMALID_FRONT = 5
ENUM_RUNCONTEXT_SERVER = 1
ENUM_RUNCONTEXT_CLIENT = 2
ENUM_FONT_GOTHAM = 17  # unused directly (Font stored via FontFace normally,
                        # but classic `Font` enum property is fine for TextLabel)


def identity_rotation():
    return ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0))


def cframe(px, py, pz, rot=None):
    return ((px, py, pz), rot or identity_rotation())


def build():
    model = Inst("Model", "RateMyAvatarBooth")

    # ---- Podium: what the player stands near / interacts with -----------
    podium = Inst("Part", "Podium")
    podium.set("Size", T_VECTOR3, (4.0, 2.0, 4.0))
    podium.set("CFrame", T_CFRAME, cframe(0.0, 1.0, 0.0))
    podium.set("Anchored", T_BOOL, True)
    podium.set("CanCollide", T_BOOL, True)
    podium.set("Material", T_ENUM, ENUM_MATERIAL_SMOOTH_PLASTIC)
    podium.set("Color3uint8", T_COLOR3UINT8, (90, 90, 100))
    model.add(podium)

    prompt = Inst("ProximityPrompt", "ProximityPrompt")
    prompt.set("ActionText", T_STRING, "Claim Booth")
    prompt.set("ObjectText", T_STRING, "Booth")
    prompt.set("HoldDuration", T_FLOAT32, 0.5)
    prompt.set("MaxActivationDistance", T_FLOAT32, 10.0)
    prompt.set("RequiresLineOfSight", T_BOOL, False)
    podium.add(prompt)

    # ---- Board: the sign surface showing text + image --------------------
    board = Inst("Part", "Board")
    board.set("Size", T_VECTOR3, (6.0, 5.0, 0.4))
    board.set("CFrame", T_CFRAME, cframe(0.0, 5.0, -2.0))
    board.set("Anchored", T_BOOL, True)
    board.set("CanCollide", T_BOOL, True)
    board.set("Material", T_ENUM, ENUM_MATERIAL_WOOD_PLANKS)
    board.set("Color3uint8", T_COLOR3UINT8, (140, 100, 70))
    model.add(board)

    surface_gui = Inst("SurfaceGui", "BoothSurfaceGui")
    surface_gui.set("Face", T_ENUM, ENUM_NORMALID_FRONT)
    surface_gui.set("CanvasSize", T_VECTOR2, (600.0, 500.0))
    surface_gui.set("SizingMode", T_ENUM, 0)  # FixedSize
    board.add(surface_gui)

    owner_label = Inst("TextLabel", "OwnerNameLabel")
    owner_label.set("Size", T_UDIM2, (1.0, 0.0, 0.18, 0.0))
    owner_label.set("Position", T_UDIM2, (0.0, 0.0, 0.0, 0.0))
    owner_label.set("BackgroundTransparency", T_FLOAT32, 1.0)
    owner_label.set("TextColor3", T_COLOR3, (1.0, 1.0, 1.0))
    owner_label.set("TextScaled", T_BOOL, True)
    owner_label.set("Text", T_STRING, "Unclaimed Booth")
    surface_gui.add(owner_label)

    custom_image = Inst("ImageLabel", "CustomImage")
    custom_image.set("Size", T_UDIM2, (0.9, 0.0, 0.5, 0.0))
    custom_image.set("Position", T_UDIM2, (0.05, 0.0, 0.2, 0.0))
    custom_image.set("BackgroundColor3", T_COLOR3, (0.1, 0.1, 0.1))
    custom_image.set("BackgroundTransparency", T_FLOAT32, 0.4)
    custom_image.set("Image", T_STRING, "")
    custom_image.set("ScaleType", T_ENUM, 3)  # Fit
    surface_gui.add(custom_image)

    custom_text = Inst("TextLabel", "CustomText")
    custom_text.set("Size", T_UDIM2, (0.9, 0.0, 0.22, 0.0))
    custom_text.set("Position", T_UDIM2, (0.05, 0.0, 0.72, 0.0))
    custom_text.set("BackgroundTransparency", T_FLOAT32, 1.0)
    custom_text.set("TextColor3", T_COLOR3, (1.0, 1.0, 1.0))
    custom_text.set("TextScaled", T_BOOL, True)
    custom_text.set("TextWrapped", T_BOOL, True)
    custom_text.set("Text", T_STRING, "My Booth")
    surface_gui.add(custom_text)

    # ---- Remotes -----------------------------------------------------------
    remotes = Inst("Folder", "Remotes")
    model.add(remotes)

    request_claim = Inst("RemoteEvent", "RequestClaim")
    remotes.add(request_claim)

    request_save = Inst("RemoteEvent", "RequestSaveBooth")
    remotes.add(request_save)

    # ---- State (server-owned, replicated) -----------------------------------
    state = Inst("Folder", "State")
    model.add(state)

    owner_user_id = Inst("IntValue", "OwnerUserId")
    owner_user_id.set("Value", T_INT64, 0)
    state.add(owner_user_id)

    custom_text_value = Inst("StringValue", "CustomTextValue")
    custom_text_value.set("Value", T_STRING, "")
    state.add(custom_text_value)

    custom_image_id_value = Inst("StringValue", "CustomImageIdValue")
    custom_image_id_value.set("Value", T_STRING, "")
    state.add(custom_image_id_value)

    # ---- Scripts -------------------------------------------------------------
    server_script = Inst("Script", "BoothServer")
    server_script.set("Source", T_STRING, read_source("BoothServer.lua"))
    server_script.set("RunContext", T_ENUM, ENUM_RUNCONTEXT_SERVER)
    server_script.set("Disabled", T_BOOL, False)
    model.add(server_script)

    client_script = Inst("Script", "BoothClientUI")
    client_script.set("Source", T_STRING, read_source("BoothClientUI.lua"))
    client_script.set("RunContext", T_ENUM, ENUM_RUNCONTEXT_CLIENT)
    client_script.set("Disabled", T_BOOL, False)
    model.add(client_script)

    return model


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <output.rbxm>", file=sys.stderr)
        sys.exit(1)

    model = build()
    data = serialize([model])

    with open(sys.argv[1], "wb") as f:
        f.write(data)

    print(f"Wrote {sys.argv[1]} ({len(data)} bytes)")


if __name__ == "__main__":
    main()
