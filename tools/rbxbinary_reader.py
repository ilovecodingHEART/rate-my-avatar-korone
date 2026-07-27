"""
Minimal reader/round-trip verifier for the writer in rbxbinary.py.
Only supports the property types rbxbinary.py can emit. Used purely to
self-check our generated .rbxm files structurally (chunk framing, INST/PROP/
PRNT consistency) since we have no access to Roblox Studio in this sandbox.
"""
import struct

def untransform_i32(v):
    v &= 0xFFFFFFFF
    unsigned = v >> 1
    sign = -(v & 1)
    # combine as 32-bit signed
    result = unsigned ^ (0xFFFFFFFF if sign else 0)
    result &= 0xFFFFFFFF
    if result >= 0x80000000:
        result -= 0x100000000
    return result

def read_interleaved_i32(buf, n):
    vals = []
    for i in range(n):
        b = bytes(buf[i + n*0 : i + n*0 + 1] + buf[i+n:i+n+1] + buf[i+2*n:i+2*n+1] + buf[i+3*n:i+3*n+1])
        raw = struct.unpack('>I', b)[0]
        vals.append(untransform_i32(raw))
    return vals

def read_interleaved_u32(buf, n):
    vals = []
    for i in range(n):
        b = bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]])
        vals.append(struct.unpack('>I', b)[0])
    return vals

def read_interleaved_f32(buf, n):
    vals = []
    for i in range(n):
        b = bytes([buf[i], buf[i+n], buf[i+2*n], buf[i+3*n]])
        bits = struct.unpack('>I', b)[0]
        bits = ((bits >> 1) | (bits << 31)) & 0xFFFFFFFF
        vals.append(struct.unpack('>f', struct.pack('>I', bits))[0])
    return vals

def read_referent_array(buf, n):
    deltas = read_interleaved_i32(buf, n)
    out = []
    last = 0
    for d in deltas:
        last += d
        out.append(last)
    return out


class Reader:
    def __init__(self, data):
        self.data = data
        self.pos = 0

    def read(self, n):
        b = self.data[self.pos:self.pos+n]
        self.pos += n
        return b

    def u32(self):
        return struct.unpack('<I', self.read(4))[0]

    def u8(self):
        return self.read(1)[0]

    def string(self):
        n = self.u32()
        return self.read(n)


def parse_file(data):
    assert data[0:8] == b"<roblox!"
    assert data[8:14] == b"\x89\xff\x0d\x0a\x1a\x0a"
    version = struct.unpack('<H', data[14:16])[0]
    num_types = struct.unpack('<I', data[16:20])[0]
    num_instances = struct.unpack('<I', data[20:24])[0]
    assert data[24:32] == b"\x00"*8

    pos = 32
    chunks = []
    while pos < len(data):
        name = data[pos:pos+4]; pos += 4
        clen, ulen, _res = struct.unpack('<III', data[pos:pos+12]); pos += 12
        raw = data[pos:pos+(clen if clen else ulen)]
        pos += (clen if clen else ulen)
        if clen != 0:
            raise NotImplementedError("compressed chunk not supported by this simple reader")
        chunks.append((name, raw))
        if name == b'END\x00':
            break

    classes = {}   # type_id -> {"name":..., "referents":[...]}
    instances = {} # referent -> {"class":..., "props": {}}
    parents = {}

    for name, raw in chunks:
        if name == b'INST':
            r = Reader(raw)
            type_id = r.u32()
            class_name = r.string().decode('utf-8')
            is_service = r.u8()
            count = r.u32()
            remaining = raw[r.pos:]
            referents = read_referent_array(remaining, count)
            classes[type_id] = {"name": class_name, "referents": referents}
            for ref in referents:
                instances[ref] = {"class": class_name, "props": {}}
        elif name == b'PROP':
            r = Reader(raw)
            type_id = r.u32()
            prop_name = r.string().decode('utf-8')
            if r.pos >= len(raw):
                continue
            type_byte = r.u8()
            referents = classes[type_id]["referents"]
            n = len(referents)
            body = raw[r.pos:]
            if type_byte == 0x01:  # String
                rr = Reader(body)
                values = [rr.string() for _ in range(n)]
            elif type_byte == 0x02:  # Bool
                values = [b != 0 for b in body[:n]]
            elif type_byte == 0x03:  # Int32
                values = read_interleaved_i32(body, n)
            elif type_byte == 0x04:  # Float32
                values = read_interleaved_f32(body, n)
            elif type_byte == 0x0D:  # Vector2
                w = 4*n
                xx = read_interleaved_f32(body[0:w], n)
                yy = read_interleaved_f32(body[w:2*w], n)
                values = list(zip(xx, yy))
            elif type_byte == 0x07:  # UDim2
                w = 4*n
                sx = read_interleaved_f32(body[0:w], n)
                sy = read_interleaved_f32(body[w:2*w], n)
                ox = read_interleaved_i32(body[2*w:3*w], n)
                oy = read_interleaved_i32(body[3*w:4*w], n)
                # Reported in Roblox's UDim2.new(xScale, xOffset, yScale, yOffset) order.
                values = list(zip(sx, ox, sy, oy))
            elif type_byte == 0x0C:  # Color3
                w = 4*n
                rr = read_interleaved_f32(body[0:w], n)
                gg = read_interleaved_f32(body[w:2*w], n)
                bb = read_interleaved_f32(body[2*w:3*w], n)
                values = list(zip(rr, gg, bb))
            elif type_byte == 0x0E:  # Vector3
                w = 4*n
                xx = read_interleaved_f32(body[0:w], n)
                yy = read_interleaved_f32(body[w:2*w], n)
                zz = read_interleaved_f32(body[2*w:3*w], n)
                values = list(zip(xx, yy, zz))
            elif type_byte == 0x10:  # CFrame
                pos2 = 0
                rots = []
                for _ in range(n):
                    tag = body[pos2]; pos2 += 1
                    if tag == 0:
                        floats = struct.unpack('<9f', body[pos2:pos2+36]); pos2 += 36
                        rots.append(floats)
                    else:
                        rots.append(("BASIC_ROT_ID", tag))
                rest = body[pos2:]
                w = 4*n
                xx = read_interleaved_f32(rest[0:w], n)
                yy = read_interleaved_f32(rest[w:2*w], n)
                zz = read_interleaved_f32(rest[2*w:3*w], n)
                values = list(zip(zip(xx, yy, zz), rots))
            elif type_byte == 0x12:  # Enum
                values = read_interleaved_u32(body, n)
            elif type_byte == 0x13:  # Ref
                values = read_referent_array(body, n)
            elif type_byte == 0x1A:  # Color3uint8
                rr = body[0:n]; gg = body[n:2*n]; bb = body[2*n:3*n]
                values = list(zip(rr, gg, bb))
            elif type_byte == 0x1B:  # Int64
                # interleaved i64 zigzag; width 8
                vals = []
                for i in range(n):
                    b = bytes([body[i + k*n] for k in range(8)])
                    raw_i = struct.unpack('>Q', b)[0]
                    unsigned = raw_i >> 1
                    sign = raw_i & 1
                    v = unsigned ^ (0xFFFFFFFFFFFFFFFF if sign else 0)
                    v &= 0xFFFFFFFFFFFFFFFF
                    if v >= 0x8000000000000000:
                        v -= 0x10000000000000000
                    vals.append(v)
                values = vals
            else:
                raise NotImplementedError(f"type byte {type_byte:#x} not supported by reader")

            for ref, val in zip(referents, values):
                if prop_name == "Name":
                    instances[ref]["name"] = val.decode('utf-8') if isinstance(val, bytes) else val
                else:
                    instances[ref]["props"][prop_name] = val
        elif name == b'PRNT':
            r = Reader(raw)
            ver = r.u8()
            count = r.u32()
            body = raw[r.pos:]
            w = 4*count
            objs = read_referent_array(body[0:w], count)
            pars = read_referent_array(body[w:2*w], count)
            for o, p in zip(objs, pars):
                parents[o] = p

    return {"num_types": num_types, "num_instances": num_instances,
            "classes": classes, "instances": instances, "parents": parents}
