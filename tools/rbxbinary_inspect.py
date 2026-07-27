"""
Generic inspector for Roblox binary model/place files (.rbxm/.rbxl).

Unlike rbxbinary_reader.py (which only supports the small set of types our
own writer emits, for round-trip self-checks), this module aims to decode
*any* real Studio-exported file well enough to answer "what instances,
names, and properties does this model contain" -- which is what we need
when wiring scripts up to a model someone else built in Studio.

Compression: handles LZ4 (Roblox's default) and Zstd chunks transparently,
as well as uncompressed chunks.

Property decoding covers the common types (string/bool/int/float/UDim/UDim2/
Color3/Vector2/Vector3/CFrame/Enum/Ref/Color3uint8/Int64/Font/NumberSequence/
ColorSequence/NumberRange/Rect/SharedString) -- enough for level/UI/script
inspection. Anything unsupported is captured as raw bytes with a type-byte
tag rather than crashing, so a single unknown property never blocks
inspecting the rest of the file.
"""
import struct

try:
    import zstandard as zstd
    _ZSTD = zstd.ZstdDecompressor()
except ImportError:
    _ZSTD = None

try:
    import lz4.block as _lz4_block
except ImportError:
    _lz4_block = None


def _decompress(raw, uncompressed_len):
    if raw[:4] == b"\x28\xb5\x2f\xfd":
        if _ZSTD is None:
            raise RuntimeError("zstandard package required to decompress this file")
        return _ZSTD.decompress(raw, max_output_size=uncompressed_len)
    if _lz4_block is None:
        raise RuntimeError("lz4 package required to decompress this file")
    return _lz4_block.decompress(raw, uncompressed_size=uncompressed_len)


def untransform_i32(v):
    v &= 0xFFFFFFFF
    unsigned = v >> 1
    sign = v & 1
    result = (unsigned ^ (0xFFFFFFFF if sign else 0)) & 0xFFFFFFFF
    if result >= 0x80000000:
        result -= 0x100000000
    return result


def untransform_i64(v):
    v &= 0xFFFFFFFFFFFFFFFF
    unsigned = v >> 1
    sign = v & 1
    result = (unsigned ^ (0xFFFFFFFFFFFFFFFF if sign else 0)) & 0xFFFFFFFFFFFFFFFF
    if result >= 0x8000000000000000:
        result -= 0x10000000000000000
    return result


def read_interleaved_i32(buf, n):
    return [untransform_i32(struct.unpack('>I', bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]]))[0]) for i in range(n)]


def read_interleaved_u32(buf, n):
    return [struct.unpack('>I', bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]]))[0] for i in range(n)]


def read_interleaved_f32(buf, n):
    out = []
    for i in range(n):
        bits = struct.unpack('>I', bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]]))[0]
        bits = ((bits >> 1) | (bits << 31)) & 0xFFFFFFFF
        out.append(struct.unpack('>f', struct.pack('>I', bits))[0])
    return out


def read_interleaved_i64(buf, n):
    out = []
    for i in range(n):
        b = bytes(buf[i + k*n] for k in range(8))
        out.append(untransform_i64(struct.unpack('>Q', b)[0]))
    return out


def read_referent_array(buf, n):
    deltas = read_interleaved_i32(buf, n)
    out = []
    last = 0
    for d in deltas:
        last += d
        out.append(last)
    return out


FACES = [(1, 0, 0), (0, 1, 0), (0, 0, 1), (-1, 0, 0), (0, -1, 0), (0, 0, -1)]


def _basic_rotation(rot_id):
    right = FACES[(rot_id - 1) // 6]
    up = FACES[(rot_id - 1) % 6]
    back = (
        right[1]*up[2] - up[1]*right[2],
        right[2]*up[0] - up[2]*right[0],
        right[0]*up[1] - up[0]*right[1],
    )
    return (right, up, back)


class R:
    __slots__ = ("data", "pos")

    def __init__(self, data):
        self.data = data
        self.pos = 0

    def read(self, n):
        b = self.data[self.pos:self.pos+n]
        self.pos += n
        return b

    def u8(self):
        return self.read(1)[0]

    def u16(self):
        return struct.unpack('<H', self.read(2))[0]

    def u32(self):
        return struct.unpack('<I', self.read(4))[0]

    def i16(self):
        return struct.unpack('<h', self.read(2))[0]

    def f32(self):
        return struct.unpack('<f', self.read(4))[0]

    def string(self):
        n = self.u32()
        return self.read(n)

    def remaining(self):
        return len(self.data) - self.pos


def parse_file(data):
    assert data[0:8] == b"<roblox!", "not a roblox binary file"
    assert data[8:14] == b"\x89\xff\x0d\x0a\x1a\x0a", "bad file signature"
    num_types = struct.unpack('<I', data[16:20])[0]
    num_instances = struct.unpack('<I', data[20:24])[0]

    pos = 32
    chunks = []
    while pos < len(data):
        name = data[pos:pos+4]; pos += 4
        clen, ulen, _res = struct.unpack('<III', data[pos:pos+12]); pos += 12
        raw = data[pos:pos+(clen if clen else ulen)]
        pos += (clen if clen else ulen)
        dec = _decompress(raw, ulen) if clen else raw
        chunks.append((name, dec))
        if name == b'END\x00':
            break

    classes = {}    # type_id -> {"name":..., "referents":[...]}
    instances = {}  # referent -> {"class":..., "name":..., "props": {...}}
    parents = {}
    meta = {}

    for name, raw in chunks:
        if name == b'META':
            r = R(raw)
            count = r.u32()
            for _ in range(count):
                k = r.string().decode('utf-8', 'replace')
                v = r.string().decode('utf-8', 'replace')
                meta[k] = v

        elif name == b'INST':
            r = R(raw)
            type_id = r.u32()
            class_name = r.string().decode('utf-8', 'replace')
            _is_service = r.u8()
            count = r.u32()
            referents = read_referent_array(raw[r.pos:], count)
            classes[type_id] = {"name": class_name, "referents": referents}
            for ref in referents:
                instances[ref] = {"class": class_name, "name": None, "props": {}}

        elif name == b'PROP':
            r = R(raw)
            type_id = r.u32()
            prop_name = r.string().decode('utf-8', 'replace')
            if r.pos >= len(raw):
                continue
            type_byte = r.u8()
            if type_id not in classes:
                continue
            referents = classes[type_id]["referents"]
            n = len(referents)
            body = raw[r.pos:]

            try:
                values = _decode_prop(type_byte, body, n)
            except Exception as e:
                values = [f"<undecoded type {type_byte:#x}: {e}>"] * n

            for ref, val in zip(referents, values):
                if prop_name == "Name":
                    instances[ref]["name"] = val.decode('utf-8', 'replace') if isinstance(val, (bytes, bytearray)) else val
                else:
                    instances[ref]["props"][prop_name] = val

        elif name == b'PRNT':
            r = R(raw)
            r.u8()  # version
            count = r.u32()
            body = raw[r.pos:]
            w = 4*count
            objs = read_referent_array(body[0:w], count)
            pars = read_referent_array(body[w:2*w], count)
            for o, p in zip(objs, pars):
                parents[o] = p

    return {
        "num_types": num_types,
        "num_instances": num_instances,
        "meta": meta,
        "classes": classes,
        "instances": instances,
        "parents": parents,
    }


def _decode_prop(type_byte, body, n):
    if type_byte == 0x01:  # String
        r = R(body)
        return [r.string() for _ in range(n)]
    if type_byte == 0x02:  # Bool
        return [b != 0 for b in body[:n]]
    if type_byte == 0x03:  # Int32
        return read_interleaved_i32(body, n)
    if type_byte == 0x04:  # Float32
        return read_interleaved_f32(body, n)
    if type_byte == 0x05:  # Float64
        r = R(body)
        return [struct.unpack('<d', r.read(8))[0] for _ in range(n)]
    if type_byte == 0x06:  # UDim
        w = 4*n
        scale = read_interleaved_f32(body[0:w], n)
        offset = read_interleaved_i32(body[w:2*w], n)
        return list(zip(scale, offset))
    if type_byte == 0x07:  # UDim2
        w = 4*n
        sx = read_interleaved_f32(body[0:w], n)
        sy = read_interleaved_f32(body[w:2*w], n)
        ox = read_interleaved_i32(body[2*w:3*w], n)
        oy = read_interleaved_i32(body[3*w:4*w], n)
        return list(zip(sx, ox, sy, oy))
    if type_byte == 0x08:  # Ray
        r = R(body)
        out = []
        for _ in range(n):
            origin = (r.f32(), r.f32(), r.f32())
            direction = (r.f32(), r.f32(), r.f32())
            out.append((origin, direction))
        return out
    if type_byte == 0x09:  # Faces
        return [body[i] for i in range(n)]
    if type_byte == 0x0A:  # Axes
        return [body[i] for i in range(n)]
    if type_byte == 0x0B:  # BrickColor
        return read_interleaved_u32(body, n)
    if type_byte == 0x0C:  # Color3
        w = 4*n
        rr = read_interleaved_f32(body[0:w], n)
        gg = read_interleaved_f32(body[w:2*w], n)
        bb = read_interleaved_f32(body[2*w:3*w], n)
        return list(zip(rr, gg, bb))
    if type_byte == 0x0D:  # Vector2
        w = 4*n
        xx = read_interleaved_f32(body[0:w], n)
        yy = read_interleaved_f32(body[w:2*w], n)
        return list(zip(xx, yy))
    if type_byte == 0x0E:  # Vector3
        w = 4*n
        xx = read_interleaved_f32(body[0:w], n)
        yy = read_interleaved_f32(body[w:2*w], n)
        zz = read_interleaved_f32(body[2*w:3*w], n)
        return list(zip(xx, yy, zz))
    if type_byte == 0x10:  # CFrame
        pos = 0
        rots = []
        for _ in range(n):
            rid = body[pos]; pos += 1
            if rid == 0:
                floats = struct.unpack('<9f', body[pos:pos+36]); pos += 36
                rots.append((floats[0:3], floats[3:6], floats[6:9]))
            else:
                rots.append(_basic_rotation(rid))
        rest = body[pos:]
        w = 4*n
        xx = read_interleaved_f32(rest[0:w], n)
        yy = read_interleaved_f32(rest[w:2*w], n)
        zz = read_interleaved_f32(rest[2*w:3*w], n)
        return list(zip(zip(xx, yy, zz), rots))
    if type_byte == 0x12:  # Enum
        return read_interleaved_u32(body, n)
    if type_byte == 0x13:  # Ref
        return read_referent_array(body, n)
    if type_byte == 0x14:  # Vector3int16
        r = R(body)
        return [(r.i16(), r.i16(), r.i16()) for _ in range(n)]
    if type_byte == 0x15:  # NumberSequence
        r = R(body)
        out = []
        for _ in range(n):
            count = r.u32()
            kps = [(r.f32(), r.f32(), r.f32()) for _ in range(count)]
            out.append(kps)
        return out
    if type_byte == 0x16:  # ColorSequence
        r = R(body)
        out = []
        for _ in range(n):
            count = r.u32()
            kps = []
            for _ in range(count):
                t = r.f32()
                c = (r.f32(), r.f32(), r.f32())
                r.f32()  # envelope, unused
                kps.append((t, c))
            out.append(kps)
        return out
    if type_byte == 0x17:  # NumberRange
        r = R(body)
        return [(r.f32(), r.f32()) for _ in range(n)]
    if type_byte == 0x18:  # Rect
        w = 4*n
        x0 = read_interleaved_f32(body[0:w], n)
        y0 = read_interleaved_f32(body[w:2*w], n)
        x1 = read_interleaved_f32(body[2*w:3*w], n)
        y1 = read_interleaved_f32(body[3*w:4*w], n)
        return list(zip(x0, y0, x1, y1))
    if type_byte == 0x19:  # PhysicalProperties
        r = R(body)
        out = []
        for _ in range(n):
            disc = r.u8()
            if disc in (0, 2):
                out.append(None)  # Default
            elif disc == 1:
                out.append(tuple(r.f32() for _ in range(5)))
            elif disc == 3:
                out.append(tuple(r.f32() for _ in range(6)))
            else:
                raise ValueError(f"bad PhysicalProperties discriminator {disc}")
        return out
    if type_byte == 0x1A:  # Color3uint8
        rr = body[0:n]; gg = body[n:2*n]; bb = body[2*n:3*n]
        return list(zip(rr, gg, bb))
    if type_byte == 0x1B:  # Int64
        return read_interleaved_i64(body, n)
    if type_byte == 0x1C:  # SharedString (index into SSTR -- not resolved here)
        return read_interleaved_u32(body, n)
    if type_byte == 0x20:  # Font
        r = R(body)
        out = []
        for _ in range(n):
            family = r.string()
            weight = r.u16()
            style = r.u8()
            cached_face_id = r.string()
            out.append((family, weight, style, cached_face_id))
        return out
    raise ValueError(f"unsupported type byte {type_byte:#x}")


def print_tree(result, max_depth=None):
    children = {}
    for ref, p in result["parents"].items():
        children.setdefault(p, []).append(ref)

    def show(ref, indent=0):
        if max_depth is not None and indent > max_depth:
            return
        inst = result["instances"][ref]
        name = inst.get("name") or "?"
        cls = inst["class"]
        propkeys = sorted(inst["props"].keys())
        print("  "*indent + f"[{ref}] {cls} '{name}'  props={propkeys}")
        for c in sorted(children.get(ref, [])):
            show(c, indent+1)

    roots = sorted(ref for ref, p in result["parents"].items() if p == -1)
    for r in roots:
        show(r)


if __name__ == "__main__":
    import sys
    data = open(sys.argv[1], "rb").read()
    result = parse_file(data)
    print("num_types:", result["num_types"], "num_instances:", result["num_instances"])
    if result["meta"]:
        print("meta:", result["meta"])
    print_tree(result)
