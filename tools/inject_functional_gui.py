#!/usr/bin/env python3
"""Inject a dependency-free, functional donation UI fallback into the place.

The original client UI is retained untouched. This appends a separate ScreenGui
and LocalScript that work without the original game's RemoteEvent/backend stack.
"""
from __future__ import annotations

import struct
from pathlib import Path
import zstandard as zstd

PLACE = Path("donate pls.rbxl")
SCRIPT = Path("src/FunctionalGui.client.lua")

# These IDs are consecutive after the 99,903 instances in the source place.
START_ID = 99903
START_GROUP = 207
STARTER_GUI_ID = 33886


def s(value: str) -> bytes:
    raw = value.encode("utf-8")
    return struct.pack("<I", len(raw)) + raw


def interleave_uint(values: list[int]) -> bytes:
    count = len(values)
    values = [v & 0xFFFFFFFF for v in values]
    return bytes([(v >> 24) & 0xFF for v in values] +
                 [(v >> 16) & 0xFF for v in values] +
                 [(v >> 8) & 0xFF for v in values] +
                 [v & 0xFF for v in values])


def interleave_int(values: list[int]) -> bytes:
    # Roblox's signed integer representation is zig-zag encoded.
    return interleave_uint([(v * 2) if v >= 0 else (-v * 2 - 1) for v in values])


def rbx_float(value: float) -> int:
    # Roblox rotates the IEEE-754 sign bit into bit 0 before interleaving.
    bits = struct.unpack("<I", struct.pack("<f", float(value)))[0]
    return (((bits & 0x7FFFFFFF) << 1) | (bits >> 31)) & 0xFFFFFFFF


def interleave_float(values: list[float]) -> bytes:
    return interleave_uint([rbx_float(v) for v in values])


def dtype_string(values: list[str]) -> bytes:
    return b"".join(s(v) for v in values)


def dtype_bool(values: list[bool]) -> bytes:
    return bytes(bool(v) for v in values)


def dtype_int(values: list[int]) -> bytes:
    return interleave_int(values)


def dtype_float(values: list[float]) -> bytes:
    return interleave_float(values)


def dtype_udim2(values: list[tuple[tuple[float, int], tuple[float, int]]]) -> bytes:
    return (interleave_float([v[0][0] for v in values]) +
            interleave_float([v[1][0] for v in values]) +
            interleave_int([v[0][1] for v in values]) +
            interleave_int([v[1][1] for v in values]))


def dtype_vector2(values: list[tuple[float, float]]) -> bytes:
    return interleave_float([v[0] for v in values]) + interleave_float([v[1] for v in values])


def dtype_color3(values: list[tuple[float, float, float]]) -> bytes:
    return (interleave_float([v[0] for v in values]) +
            interleave_float([v[1] for v in values]) +
            interleave_float([v[2] for v in values]))


def inst_chunk(group_id: int, class_name: str, ids: list[int]) -> bytes:
    deltas: list[int] = []
    previous = 0
    for ident in ids:
        deltas.append(ident - previous)
        previous = ident
    return (struct.pack("<I", group_id) + s(class_name) + b"\0" +
            struct.pack("<I", len(ids)) + interleave_int(deltas))


def prop_chunk(group_id: int, name: str, dtype: int, data: bytes) -> bytes:
    return struct.pack("<I", group_id) + s(name) + bytes([dtype]) + data


def parent_chunk(links: list[tuple[int, int]]) -> bytes:
    # PRNT is delta-encoded in child order and parent order.
    links = sorted(links)
    child_deltas: list[int] = []
    parent_deltas: list[int] = []
    previous_child = 0
    previous_parent = 0
    for child, parent in links:
        child_deltas.append(child - previous_child)
        parent_deltas.append(parent - previous_parent)
        previous_child, previous_parent = child, parent
    return b"\0" + struct.pack("<I", len(links)) + interleave_int(child_deltas) + interleave_int(parent_deltas)


def pack_chunk(kind: bytes, payload: bytes) -> bytes:
    compressed = zstd.ZstdCompressor(level=8).compress(payload)
    return kind + struct.pack("<III", len(compressed), len(payload), 0) + compressed


def build_chunks() -> tuple[list[bytes], int, int]:
    # Instance groups. Using new class-group IDs avoids changing the saved game.
    screen_id = START_ID
    script_id = screen_id + 1
    frame_ids = list(range(script_id + 1, script_id + 8))
    label_ids = list(range(frame_ids[-1] + 1, frame_ids[-1] + 12))
    button_ids = list(range(label_ids[-1] + 1, label_ids[-1] + 9))
    total_instances = 1 + 1 + len(frame_ids) + len(label_ids) + len(button_ids)

    groups = {
        "ScreenGui": (START_GROUP, [screen_id]),
        "LocalScript": (START_GROUP + 1, [script_id]),
        "Frame": (START_GROUP + 2, frame_ids),
        "TextLabel": (START_GROUP + 3, label_ids),
        "TextButton": (START_GROUP + 4, button_ids),
    }
    output: list[bytes] = []
    for class_name, (group, ids) in groups.items():
        output.append(pack_chunk(b"INST", inst_chunk(group, class_name, ids)))

    # Data type IDs follow the Roblox binary model specification.
    STRING, BOOL, INT, FLOAT, UDIM2, COLOR3, VECTOR2 = 1, 2, 3, 4, 7, 12, 13

    screen_group = groups["ScreenGui"][0]
    output += [
        pack_chunk(b"PROP", prop_chunk(screen_group, "Name", STRING, dtype_string(["FunctionalDonateGui"]))),
        pack_chunk(b"PROP", prop_chunk(screen_group, "Enabled", BOOL, dtype_bool([True]))),
        pack_chunk(b"PROP", prop_chunk(screen_group, "ResetOnSpawn", BOOL, dtype_bool([False]))),
        pack_chunk(b"PROP", prop_chunk(screen_group, "IgnoreGuiInset", BOOL, dtype_bool([True]))),
        pack_chunk(b"PROP", prop_chunk(screen_group, "DisplayOrder", INT, dtype_int([5000]))),
    ]

    script_group = groups["LocalScript"][0]
    output += [
        pack_chunk(b"PROP", prop_chunk(script_group, "Name", STRING, dtype_string(["FunctionalGuiClient"]))),
        pack_chunk(b"PROP", prop_chunk(script_group, "Disabled", BOOL, dtype_bool([False]))),
        pack_chunk(b"PROP", prop_chunk(script_group, "Source", STRING, dtype_string([SCRIPT.read_text()]))),
    ]

    # Frames: Header, Sidebar, Content, and one panel per navigation button.
    frame_group = groups["Frame"][0]
    frame_names = ["Header", "Sidebar", "Content", "ShopPanel", "GiftPanel", "RedeemPanel", "SettingsPanel"]
    frame_sizes = [
        ((1, 0), (0, 84)), ((0, 220), (1, -84)), ((0.68, 0), (0, 360)),
        ((1, -24), (1, -24)), ((1, -24), (1, -24)), ((1, -24), (1, -24)), ((1, -24), (1, -24)),
    ]
    frame_positions = [
        ((0, 0), (0, 0)), ((0, 0), (0, 84)), ((0.61, 0), (0.54, 0)),
        ((0, 12), (0, 12)), ((0, 12), (0, 12)), ((0, 12), (0, 12)), ((0, 12), (0, 12)),
    ]
    frame_anchors = [(0, 0), (0, 0), (0.5, 0.5), (0, 0), (0, 0), (0, 0), (0, 0)]
    frame_colors = [
        (0.075, 0.10, 0.19), (0.055, 0.07, 0.13), (0.11, 0.14, 0.25),
        (0.10, 0.13, 0.24), (0.15, 0.07, 0.17), (0.16, 0.10, 0.05), (0.07, 0.14, 0.16),
    ]
    output += [
        pack_chunk(b"PROP", prop_chunk(frame_group, "Name", STRING, dtype_string(frame_names))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "Size", UDIM2, dtype_udim2(frame_sizes))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "Position", UDIM2, dtype_udim2(frame_positions))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "AnchorPoint", VECTOR2, dtype_vector2(frame_anchors))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "BackgroundColor3", COLOR3, dtype_color3(frame_colors))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "BackgroundTransparency", FLOAT, dtype_float([0] * 7))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "BorderSizePixel", INT, dtype_int([0] * 7))),
        pack_chunk(b"PROP", prop_chunk(frame_group, "Visible", BOOL, dtype_bool([True, True, True, True, False, False, False]))),
    ]

    label_group = groups["TextLabel"][0]
    label_names = ["Title", "Subtitle", "StatusText", "PanelTitle", "Description", "PanelTitle", "Description", "PanelTitle", "Description", "PanelTitle", "Description"]
    label_texts = [
        "PLS DONATE", "Functional local interface", "Shop ready",
        "SHOP", "Browse booths and donation items.\nEverything here is available without the original remote stack.",
        "GIFT", "Choose a player and send a gift.\nThe fallback flow is ready to use.",
        "REDEEM", "Redeem a code or view your rewards.\nYour selection stays in this client session.",
        "SETTINGS", "Adjust your local preferences.\nThis panel remains independent from broken game services.",
    ]
    label_sizes = [((0, 300), (1, 0)), ((0, 290), (0, 30)), ((0, 280), (0, 30))]
    label_positions = [((0, 24), (0, 0)), ((0, 325), (0, 30)), ((1, -24), (0.5, 0))]
    label_anchors = [(0, 0), (0, 0), (1, 0.5)]
    for _ in range(4):
        label_sizes.extend([((1, -40), (0, 54)), ((1, -64), (0, 120))])
        label_positions.extend([((0.5, 0), (0, 46)), ((0.5, 0), (0.5, 10))])
        label_anchors.extend([(0.5, 0), (0.5, 0.5)])
    label_colors = [(1, 0.45, 0.70), (0.64, 0.75, 0.94), (0.45, 0.9, 0.65)] + [(0.96, 0.98, 1)] * 8
    label_sizes_text = [32, 16, 15, 30, 18, 30, 18, 30, 18, 30, 18]
    output += [
        pack_chunk(b"PROP", prop_chunk(label_group, "Name", STRING, dtype_string(label_names))),
        pack_chunk(b"PROP", prop_chunk(label_group, "Text", STRING, dtype_string(label_texts))),
        pack_chunk(b"PROP", prop_chunk(label_group, "Size", UDIM2, dtype_udim2(label_sizes))),
        pack_chunk(b"PROP", prop_chunk(label_group, "Position", UDIM2, dtype_udim2(label_positions))),
        pack_chunk(b"PROP", prop_chunk(label_group, "AnchorPoint", VECTOR2, dtype_vector2(label_anchors))),
        pack_chunk(b"PROP", prop_chunk(label_group, "BackgroundTransparency", FLOAT, dtype_float([1] * 11))),
        pack_chunk(b"PROP", prop_chunk(label_group, "TextColor3", COLOR3, dtype_color3(label_colors))),
        pack_chunk(b"PROP", prop_chunk(label_group, "TextSize", FLOAT, dtype_float(label_sizes_text))),
        pack_chunk(b"PROP", prop_chunk(label_group, "TextWrapped", BOOL, dtype_bool([False, False, False, False, True, False, True, False, True, False, True]))),
    ]

    button_group = groups["TextButton"][0]
    button_names = ["ShopButton", "GiftButton", "RedeemButton", "SettingsButton", "ActionButton", "ActionButton", "ActionButton", "ActionButton"]
    button_texts = ["SHOP", "GIFT", "REDEEM", "SETTINGS", "OPEN SHOP", "SEND GIFT", "REDEEM CODE", "SAVE SETTINGS"]
    button_sizes = [*((((0.82, 0), (0, 48)),) * 4), *((((0, 220), (0, 52)),) * 4)]
    button_positions = [
        ((0.5, 0), (0.17, 0)), ((0.5, 0), (0.34, 0)), ((0.5, 0), (0.51, 0)), ((0.5, 0), (0.68, 0)),
        *((((0.5, 0), (0.79, 0)),) * 4),
    ]
    button_anchors = [((0.5, 0.5))] * 8
    button_colors = [(0.18, 0.29, 0.56), (0.59, 0.15, 0.45), (0.68, 0.36, 0.10), (0.10, 0.48, 0.48)] * 2
    output += [
        pack_chunk(b"PROP", prop_chunk(button_group, "Name", STRING, dtype_string(button_names))),
        pack_chunk(b"PROP", prop_chunk(button_group, "Text", STRING, dtype_string(button_texts))),
        pack_chunk(b"PROP", prop_chunk(button_group, "Size", UDIM2, dtype_udim2(button_sizes))),
        pack_chunk(b"PROP", prop_chunk(button_group, "Position", UDIM2, dtype_udim2(button_positions))),
        pack_chunk(b"PROP", prop_chunk(button_group, "AnchorPoint", VECTOR2, dtype_vector2(button_anchors))),
        pack_chunk(b"PROP", prop_chunk(button_group, "BackgroundColor3", COLOR3, dtype_color3(button_colors))),
        pack_chunk(b"PROP", prop_chunk(button_group, "BackgroundTransparency", FLOAT, dtype_float([0] * 8))),
        pack_chunk(b"PROP", prop_chunk(button_group, "BorderSizePixel", INT, dtype_int([0] * 8))),
        pack_chunk(b"PROP", prop_chunk(button_group, "TextColor3", COLOR3, dtype_color3([(1, 1, 1)] * 8))),
        pack_chunk(b"PROP", prop_chunk(button_group, "TextSize", FLOAT, dtype_float([18] * 8))),
    ]

    # Parent each instance after it has been declared and configured.
    header, sidebar, content, shop, gift, redeem, settings = frame_ids
    title, subtitle, status, shop_title, shop_desc, gift_title, gift_desc, redeem_title, redeem_desc, settings_title, settings_desc = label_ids
    shop_btn, gift_btn, redeem_btn, settings_btn, shop_action, gift_action, redeem_action, settings_action = button_ids
    links = [
        (screen_id, STARTER_GUI_ID), (script_id, screen_id),
        (header, screen_id), (sidebar, screen_id), (content, screen_id),
        (shop, content), (gift, content), (redeem, content), (settings, content),
        (title, header), (subtitle, header), (status, header),
        (shop_title, shop), (shop_desc, shop), (gift_title, gift), (gift_desc, gift),
        (redeem_title, redeem), (redeem_desc, redeem), (settings_title, settings), (settings_desc, settings),
        (shop_btn, sidebar), (gift_btn, sidebar), (redeem_btn, sidebar), (settings_btn, sidebar),
        (shop_action, shop), (gift_action, gift), (redeem_action, redeem), (settings_action, settings),
    ]
    output.append(pack_chunk(b"PRNT", parent_chunk(links)))
    return output, len(groups), total_instances


def main() -> None:
    if not PLACE.exists() or not SCRIPT.exists():
        raise SystemExit("Run this from the repository root after adding the fallback script.")
    data = PLACE.read_bytes()
    magic = b"<roblox!\x89\xff\r\n\x1a\n\0\0"
    if data[:16] != magic:
        raise SystemExit("Unexpected Roblox binary header.")

    chunks, extra_groups, extra_instances = build_chunks()
    # Header layout: class-group count (u32), instance count (u32), then eight reserved bytes.
    old_groups = struct.unpack_from("<I", data, 16)[0]
    old_instances = struct.unpack_from("<I", data, 20)[0]
    if old_groups == START_GROUP + extra_groups and old_instances == START_ID + extra_instances:
        print(f"{PLACE} already contains FunctionalDonateGui; no changes made.")
        return
    if old_groups != START_GROUP or old_instances != START_ID:
        raise SystemExit(f"Unexpected place counts ({old_groups} groups, {old_instances} instances); refusing to patch.")
    header = bytearray(data[:32])
    struct.pack_into("<I", header, 16, old_groups + extra_groups)
    struct.pack_into("<I", header, 20, old_instances + extra_instances)

    # Preserve every original compressed chunk. Insert after the original PRNT chunk, before END.
    pos = 32
    result = [bytes(header)]
    inserted = False
    while pos < len(data):
        kind = data[pos:pos + 4]
        compressed, decompressed, _ = struct.unpack_from("<III", data, pos + 4)
        end = pos + 16 + (compressed or decompressed)
        if kind == b"END\0" and not inserted:
            result.extend(chunks)
            inserted = True
        result.append(data[pos:end])
        pos = end
    if not inserted:
        raise SystemExit("No END chunk found.")

    output = b"".join(result)
    temp = PLACE.with_suffix(".rbxl.tmp")
    temp.write_bytes(output)
    temp.replace(PLACE)
    print(f"Patched {PLACE}: +{extra_groups} class groups, +{extra_instances} instances ({len(output):,} bytes).")


if __name__ == "__main__":
    main()
