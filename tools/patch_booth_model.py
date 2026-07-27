#!/usr/bin/env python3
"""
Surgically patches a Roblox binary model file (.rbxm):

1. Removes an entire malicious/backdoored instance subtree by class name
   (see MALICIOUS_CLASSES below) -- every chunk referencing those classes
   is dropped outright, and any dangling parent/child references to their
   instances are stripped from the PRNT chunk. All other chunks (meshes,
   parts, GUIs, everything legitimate) are carried over byte-for-byte
   unmodified, so nothing else in the model is touched or re-encoded.

2. Appends new instances (a ProximityPrompt, RemoteEvents, state
   ValueObjects, and the two booth Scripts) wired up to the model's real
   part/GUI names, continuing on from the existing type ids / referents.

This targeted approach was chosen over "decode everything, rebuild from
scratch" because this format has property types (SecurityCapabilities,
mesh/physics blob data, UniqueId, etc.) that are lossy or complex to
faithfully round-trip; leaving them as untouched raw bytes avoids any risk
of corrupting geometry, textures, or other properties this tool doesn't
fully understand.

Usage:
    python3 patch_booth_model.py <input.rbxm> <output.rbxm>
"""
import struct
import sys
import os

sys.path.insert(0, os.path.dirname(__file__))
from rbxbinary import (
    write_string_field, write_referent_array, build_chunk,
    T_STRING, T_BOOL, T_FLOAT32, T_ENUM, T_INT64,
)

try:
    import zstandard as zstd
    _ZDEC = zstd.ZstdDecompressor()
except ImportError:
    _ZDEC = None

try:
    import lz4.block as _lz4_block
except ImportError:
    _lz4_block = None


def _decompress(raw, ulen):
    if not raw:
        return b""
    if raw[:4] == b"\x28\xb5\x2f\xfd":
        if _ZDEC is None:
            raise RuntimeError("zstandard package required")
        return _ZDEC.decompress(raw, max_output_size=ulen)
    if _lz4_block is None:
        raise RuntimeError("lz4 package required")
    return _lz4_block.decompress(raw, uncompressed_size=ulen)


def untransform_i32(v):
    v &= 0xFFFFFFFF
    unsigned = v >> 1
    sign = v & 1
    result = (unsigned ^ (0xFFFFFFFF if sign else 0)) & 0xFFFFFFFF
    if result >= 0x80000000:
        result -= 0x100000000
    return result


def read_interleaved_i32(buf, n):
    return [untransform_i32(struct.unpack('>I', bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]]))[0]) for i in range(n)]


def read_referent_array(buf, n):
    deltas = read_interleaved_i32(buf, n)
    out = []
    last = 0
    for d in deltas:
        last += d
        out.append(last)
    return out


# Classes belonging to the disguised backdoor found in the uploaded model:
# a StyleSheet named "Extra" containing a fake Humanoid/HumanoidController/
# HumanoidDescription/HumanoidRigDescription chain whose leaf is a Script
# that does `require(script:WaitForChild("Pose", 4).Value)` -- loading and
# executing a remote ModuleScript by numeric asset id (a classic "free
# model" RCE backdoor) -- plus a companion Script that self-destructs only
# when JobId == "" (i.e. hides itself specifically during Studio testing).
MALICIOUS_CLASSES = {
    "StyleSheet",
    "Humanoid",
    "HumanoidController",
    "HumanoidDescription",
    "HumanoidRigDescription",
    "Script",
    "NumberPose",
}


def patch(input_path, output_path):
    data = open(input_path, "rb").read()
    assert data[0:8] == b"<roblox!"
    assert data[8:14] == b"\x89\xff\x0d\x0a\x1a\x0a"

    header_num_types = struct.unpack('<I', data[16:20])[0]
    header_num_instances = struct.unpack('<I', data[20:24])[0]

    pos = 32
    raw_chunks = []  # (name, raw_chunk_bytes_including_header)
    while pos < len(data):
        chunk_start = pos
        name = data[pos:pos+4]; pos += 4
        clen, ulen, _res = struct.unpack('<III', data[pos:pos+12]); pos += 12
        body = data[pos:pos+(clen if clen else ulen)]
        pos += (clen if clen else ulen)
        raw_chunks.append((name, data[chunk_start:pos], clen, ulen, body))
        if name == b'END\x00':
            break

    # ---- Pass 1: find which type_ids correspond to malicious classes -----
    malicious_type_ids = set()
    all_type_ids = set()
    for name, full, clen, ulen, body in raw_chunks:
        if name != b'INST':
            continue
        dec = _decompress(body, ulen) if clen else body
        p = 0
        type_id = struct.unpack('<I', dec[p:p+4])[0]; p += 4
        nlen = struct.unpack('<I', dec[p:p+4])[0]; p += 4
        class_name = dec[p:p+nlen].decode('utf-8', 'replace')
        all_type_ids.add(type_id)
        if class_name in MALICIOUS_CLASSES:
            malicious_type_ids.add(type_id)

    if not malicious_type_ids:
        raise RuntimeError("No malicious classes found -- refusing to proceed blindly; "
                            "verify MALICIOUS_CLASSES matches what you inspected.")

    # ---- Pass 2: collect malicious referents (from the INST chunks we're dropping) ----
    malicious_referents = set()
    kept_inst_chunks = []
    kept_prop_chunks = []
    prnt_chunk = None

    for name, full, clen, ulen, body in raw_chunks:
        if name == b'INST':
            dec = _decompress(body, ulen) if clen else body
            p = 0
            type_id = struct.unpack('<I', dec[p:p+4])[0]; p += 4
            nlen = struct.unpack('<I', dec[p:p+4])[0]; p += 4
            p += nlen
            is_service = dec[p]; p += 1
            count = struct.unpack('<I', dec[p:p+4])[0]; p += 4
            referents = read_referent_array(dec[p:], count)
            if type_id in malicious_type_ids:
                malicious_referents.update(referents)
                continue
            kept_inst_chunks.append(full)
        elif name == b'PROP':
            dec = _decompress(body, ulen) if clen else body
            p = 0
            type_id = struct.unpack('<I', dec[p:p+4])[0]; p += 4
            if type_id in malicious_type_ids:
                continue
            kept_prop_chunks.append(full)
        elif name == b'PRNT':
            prnt_chunk = body if not clen else _decompress(body, ulen)
        elif name in (b'META', b'SSTR'):
            pass  # handled below, carried through verbatim
        elif name == b'END\x00':
            pass

    assert prnt_chunk is not None, "no PRNT chunk found"

    # ---- Filter PRNT: drop any (object, parent) pair where either side is malicious ----
    r = prnt_chunk
    version = r[0]
    count = struct.unpack('<I', r[1:5])[0]
    body = r[5:]
    w = 4 * count
    objects = read_referent_array(body[0:w], count)
    parents = read_referent_array(body[w:2*w], count)

    kept_pairs = [
        (o, p) for o, p in zip(objects, parents)
        if o not in malicious_referents and p not in malicious_referents
    ]

    # ---- Build the new instances: ProximityPrompt, Remotes, State, Scripts ----
    # Referents in the original file run 0..N-1 contiguously; new ones
    # continue right after the highest existing referent.
    next_referent = max(max(objects), max(malicious_referents, default=-1)) + 1
    next_type_id = max(all_type_ids) + 1

    def alloc_referent():
        nonlocal next_referent
        r = next_referent
        next_referent += 1
        return r

    def alloc_type_id():
        nonlocal next_type_id
        t = next_type_id
        next_type_id += 1
        return t

    HERE = os.path.dirname(__file__)
    KIT_DIR = os.path.join(HERE, "..", "booth-kit")

    def read_source(filename):
        with open(os.path.join(KIT_DIR, filename), "r", encoding="utf-8") as f:
            return f.read()

    booth_root_ref = 0  # the "Booth" Model, confirmed root of this file
    tabletop_ref = None
    banner_ref = None

    # Re-derive Tabletop/Banner referents by decoding kept INST chunks' Name props.
    # (We already know from inspection: Tabletop=7, Banner=2, but derive
    # programmatically for robustness against reordered input files.)
    name_by_ref = {}
    for name, full, clen, ulen, body in raw_chunks:
        if name != b'PROP':
            continue
        dec = _decompress(body, ulen) if clen else body
        p = 0
        type_id = struct.unpack('<I', dec[p:p+4])[0]; p += 4
        nlen = struct.unpack('<I', dec[p:p+4])[0]; p += 4
        prop_name = dec[p:p+nlen].decode('utf-8', 'replace'); p += nlen
        if prop_name != "Name" or type_id in malicious_type_ids:
            continue
        # find the INST chunk with this type_id to get its referents
        for n2, f2, c2, u2, b2 in raw_chunks:
            if n2 != b'INST':
                continue
            d2 = _decompress(b2, u2) if c2 else b2
            p2 = 0
            tid2 = struct.unpack('<I', d2[p2:p2+4])[0]; p2 += 4
            nlen2 = struct.unpack('<I', d2[p2:p2+4])[0]; p2 += 4
            p2 += nlen2
            p2 += 1
            cnt2 = struct.unpack('<I', d2[p2:p2+4])[0]; p2 += 4
            refs2 = read_referent_array(d2[p2:], cnt2)
            if tid2 == type_id:
                type_byte = dec[p]; p += 1
                if type_byte != 0x01:
                    break
                rr = p
                for ref in refs2:
                    ln = struct.unpack('<I', dec[rr:rr+4])[0]; rr += 4
                    val = dec[rr:rr+ln].decode('utf-8', 'replace'); rr += ln
                    name_by_ref[ref] = val
                break

    for ref, nm in name_by_ref.items():
        if nm == "Tabletop":
            tabletop_ref = ref
        elif nm == "Banner":
            banner_ref = ref

    if tabletop_ref is None or banner_ref is None:
        raise RuntimeError(f"could not locate Tabletop/Banner parts by name "
                            f"(found names: {sorted(set(name_by_ref.values()))})")

    new_inst_chunks = []
    new_prop_chunks = []
    new_pairs = []

    def emit_instance(class_name, name, parent_ref, props):
        """props: list of (prop_name, type_byte, value_bytes_already_encoded)"""
        type_id = alloc_type_id()
        ref = alloc_referent()

        inst_payload = bytearray()
        inst_payload += struct.pack('<I', type_id)
        inst_payload += write_string_field(class_name)
        inst_payload += bytes([0])  # not a service
        inst_payload += struct.pack('<I', 1)
        inst_payload += write_referent_array([ref])
        new_inst_chunks.append(build_chunk(b'INST', bytes(inst_payload)))

        name_payload = bytearray()
        name_payload += struct.pack('<I', type_id)
        name_payload += write_string_field("Name")
        name_payload += bytes([T_STRING])
        name_payload += write_string_field(name)
        new_prop_chunks.append(build_chunk(b'PROP', bytes(name_payload)))

        for prop_name, type_byte, encoded_value in props:
            payload = bytearray()
            payload += struct.pack('<I', type_id)
            payload += write_string_field(prop_name)
            payload += bytes([type_byte])
            payload += encoded_value
            new_prop_chunks.append(build_chunk(b'PROP', bytes(payload)))

        new_pairs.append((ref, parent_ref))
        return ref

    def enc_string(s):
        return write_string_field(s)

    def enc_bool(b):
        return bytes([1 if b else 0])

    def enc_float32(f):
        from rbxbinary import write_interleaved_f32
        return write_interleaved_f32([f])

    def enc_enum(v):
        from rbxbinary import write_interleaved_u32
        return write_interleaved_u32([v])

    def enc_int64(v):
        from rbxbinary import write_interleaved_i64
        return write_interleaved_i64([v])

    # ProximityPrompt under Tabletop
    prompt_ref = emit_instance("ProximityPrompt", "ProximityPrompt", tabletop_ref, [
        ("ActionText", T_STRING, enc_string("Claim Booth")),
        ("ObjectText", T_STRING, enc_string("Unclaimed Booth")),
        ("HoldDuration", T_FLOAT32, enc_float32(0.5)),
        ("MaxActivationDistance", T_FLOAT32, enc_float32(10.0)),
        ("RequiresLineOfSight", T_BOOL, enc_bool(False)),
    ])

    # Remotes folder + two RemoteEvents
    remotes_ref = emit_instance("Folder", "Remotes", booth_root_ref, [])
    request_claim_ref = emit_instance("RemoteEvent", "RequestClaim", remotes_ref, [])
    request_save_ref = emit_instance("RemoteEvent", "RequestSaveBooth", remotes_ref, [])

    # State folder + value objects
    state_ref = emit_instance("Folder", "State", booth_root_ref, [])
    owner_user_id_ref = emit_instance("IntValue", "OwnerUserId", state_ref, [
        ("Value", T_INT64, enc_int64(0)),
    ])
    custom_text_ref = emit_instance("StringValue", "CustomTextValue", state_ref, [
        ("Value", T_STRING, enc_string("")),
    ])
    custom_image_id_ref = emit_instance("StringValue", "CustomImageIdValue", state_ref, [
        ("Value", T_STRING, enc_string("")),
    ])

    # Scripts
    ENUM_RUNCONTEXT_SERVER = 1
    ENUM_RUNCONTEXT_CLIENT = 2

    emit_instance("Script", "BoothServer", booth_root_ref, [
        ("Source", T_STRING, enc_string(read_source("BoothServer.lua"))),
        ("RunContext", T_ENUM, enc_enum(ENUM_RUNCONTEXT_SERVER)),
        ("Disabled", T_BOOL, enc_bool(False)),
    ])
    emit_instance("Script", "BoothClientUI", booth_root_ref, [
        ("Source", T_STRING, enc_string(read_source("BoothClientUI.lua"))),
        ("RunContext", T_ENUM, enc_enum(ENUM_RUNCONTEXT_CLIENT)),
        ("Disabled", T_BOOL, enc_bool(False)),
    ])

    # ---- Rebuild PRNT chunk ----
    all_pairs = kept_pairs + new_pairs
    prnt_payload = bytearray()
    prnt_payload += bytes([0])
    prnt_payload += struct.pack('<I', len(all_pairs))
    prnt_payload += write_referent_array([o for o, _ in all_pairs])
    prnt_payload += write_referent_array([p for _, p in all_pairs])
    new_prnt_chunk = build_chunk(b'PRNT', bytes(prnt_payload))

    # ---- Rebuild header counts ----
    kept_type_id_count = len(all_type_ids - malicious_type_ids)
    added_type_id_count = next_type_id - (max(all_type_ids) + 1)
    new_num_types = kept_type_id_count + added_type_id_count
    new_num_instances = len(all_pairs)

    out = bytearray()
    out += b"<roblox!"
    out += b"\x89\xff\x0d\x0a\x1a\x0a"
    out += struct.pack('<H', 0)
    out += struct.pack('<I', new_num_types)
    out += struct.pack('<I', new_num_instances)
    out += b"\x00" * 8

    # Carry META/SSTR through verbatim, in original order, before INST chunks.
    for name, full, clen, ulen, body in raw_chunks:
        if name in (b'META', b'SSTR'):
            out += full

    for c in kept_inst_chunks:
        out += c
    for c in new_inst_chunks:
        out += c
    for c in kept_prop_chunks:
        out += c
    for c in new_prop_chunks:
        out += c
    out += new_prnt_chunk
    out += build_chunk(b'END\x00', b"</roblox>")

    with open(output_path, "wb") as f:
        f.write(bytes(out))

    return {
        "malicious_type_ids": malicious_type_ids,
        "malicious_referents": malicious_referents,
        "removed_instance_count": len(malicious_referents),
        "added_instance_count": len(new_pairs),
        "new_num_types": new_num_types,
        "new_num_instances": new_num_instances,
    }


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input.rbxm> <output.rbxm>", file=sys.stderr)
        sys.exit(1)

    stats = patch(sys.argv[1], sys.argv[2])
    print(f"Removed {stats['removed_instance_count']} malicious instances "
          f"(type ids {sorted(stats['malicious_type_ids'])})")
    print(f"Added {stats['added_instance_count']} new instances")
    print(f"Wrote {sys.argv[2]} "
          f"(num_types={stats['new_num_types']}, num_instances={stats['new_num_instances']})")
