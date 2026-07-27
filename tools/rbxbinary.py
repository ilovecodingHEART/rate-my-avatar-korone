"""
Minimal, from-scratch writer for Roblox's binary model/place format (.rbxm/.rbxl).

Implements just enough of the format (as documented by the rbx-dom project's
rbx_binary crate: https://github.com/rojo-rbx/rbx-dom) to emit a valid,
Studio-loadable .rbxm containing plain Instances, Parts, GUI objects, Scripts,
RemoteEvents, Value objects, etc. Compression is intentionally skipped
(CompressionType::None) since our payload is tiny and it removes an entire
class of potential bugs.
"""
import struct

FILE_MAGIC = b"<roblox!"
FILE_SIGNATURE = b"\x89\xff\x0d\x0a\x1a\x0a"
FILE_VERSION = 0
FILE_FOOTER = b"</roblox>"

# ---- low level helpers -----------------------------------------------

def _mask32(v):
    return v & 0xFFFFFFFF

def _mask64(v):
    return v & 0xFFFFFFFFFFFFFFFF

def transform_i32(value):
    v = _mask32(value)
    shifted = _mask32(v << 1)
    sign = 0xFFFFFFFF if (value & 0x80000000) else 0
    return shifted ^ sign

def transform_i64(value):
    v = _mask64(value)
    shifted = _mask64(v << 1)
    sign = 0xFFFFFFFFFFFFFFFF if (value & 0x8000000000000000) else 0
    return shifted ^ sign

def rotate_left_f32_bits(f):
    bits = struct.unpack('>I', struct.pack('>f', f))[0]
    return _mask32((bits << 1) | (bits >> 31))

def interleave(chunks, width):
    n = len(chunks)
    buf = bytearray(width * n)
    for i, c in enumerate(chunks):
        for b in range(width):
            buf[i + b * n] = c[b]
    return bytes(buf)

def write_interleaved_u32(values):
    return interleave([struct.pack('>I', _mask32(v)) for v in values], 4)

def write_interleaved_i32(values):
    return interleave([struct.pack('>I', transform_i32(v)) for v in values], 4)

def write_interleaved_f32(values):
    return interleave([struct.pack('>I', rotate_left_f32_bits(v)) for v in values], 4)

def write_interleaved_i64(values):
    return interleave([struct.pack('>Q', transform_i64(v)) for v in values], 8)

def write_referent_array(values):
    """values: list of python ints, -1 represents a null referent."""
    deltas = []
    last = 0
    for v in values:
        deltas.append(v - last)
        last = v
    return write_interleaved_i32(deltas)

def write_string_field(s):
    if isinstance(s, str):
        b = s.encode('utf-8')
    else:
        b = bytes(s)
    return struct.pack('<I', len(b)) + b

# ---- chunk framing -----------------------------------------------------

def build_chunk(name4, payload):
    assert len(name4) == 4
    header = name4 + struct.pack('<III', 0, len(payload), 0)
    return header + payload

# ---- instance tree model -------------------------------------------------

class Inst:
    __slots__ = ("class_name", "name", "props", "children", "referent")

    def __init__(self, class_name, name):
        self.class_name = class_name
        self.name = name
        self.props = {}  # propname -> (type_byte, value)
        self.children = []
        self.referent = None

    def add(self, child):
        self.children.append(child)
        return child

    def set(self, propname, type_byte, value):
        self.props[propname] = (type_byte, value)
        return self


# Binary type byte constants we use
T_STRING = 0x01
T_BOOL = 0x02
T_INT32 = 0x03
T_FLOAT32 = 0x04
T_UDIM2 = 0x07
T_COLOR3 = 0x0C
T_VECTOR2 = 0x0D
T_VECTOR3 = 0x0E
T_CFRAME = 0x10
T_ENUM = 0x12
T_REF = 0x13
T_COLOR3UINT8 = 0x1A
T_INT64 = 0x1B


DEFAULTS_BY_TYPE = {
    T_STRING: "",
    T_BOOL: False,
    T_INT32: 0,
    T_FLOAT32: 0.0,
    T_VECTOR2: (0.0, 0.0),
    T_UDIM2: (0.0, 0, 0.0, 0),
    T_COLOR3: (0.0, 0.0, 0.0),
    T_VECTOR3: (0.0, 0.0, 0.0),
    T_CFRAME: ((0.0, 0.0, 0.0), ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0))),
    T_ENUM: 0,
    T_REF: None,
    T_COLOR3UINT8: (0, 0, 0),
    T_INT64: 0,
}


def _encode_values(type_byte, values, referent_of):
    """values: list of raw python values (already in per-property python form)"""
    if type_byte == T_STRING:
        return b"".join(write_string_field(v) for v in values)
    if type_byte == T_BOOL:
        return bytes(1 if v else 0 for v in values)
    if type_byte == T_INT32:
        return write_interleaved_i32(values)
    if type_byte == T_FLOAT32:
        return write_interleaved_f32(values)
    if type_byte == T_VECTOR2:
        x = write_interleaved_f32([v[0] for v in values])
        y = write_interleaved_f32([v[1] for v in values])
        return x + y
    if type_byte == T_UDIM2:
        # Values use Roblox's own UDim2.new(xScale, xOffset, yScale, yOffset)
        # argument order.
        sx = write_interleaved_f32([v[0] for v in values])
        sy = write_interleaved_f32([v[2] for v in values])
        ox = write_interleaved_i32([int(v[1]) for v in values])
        oy = write_interleaved_i32([int(v[3]) for v in values])
        return sx + sy + ox + oy
    if type_byte == T_COLOR3:
        r = write_interleaved_f32([v[0] for v in values])
        g = write_interleaved_f32([v[1] for v in values])
        b = write_interleaved_f32([v[2] for v in values])
        return r + g + b
    if type_byte == T_VECTOR3:
        x = write_interleaved_f32([v[0] for v in values])
        y = write_interleaved_f32([v[1] for v in values])
        z = write_interleaved_f32([v[2] for v in values])
        return x + y + z
    if type_byte == T_CFRAME:
        per_inst = bytearray()
        for v in values:
            pos, rot = v  # rot: 3x3 tuple of tuples, row-major (x,y,z basis rows as in Matrix3)
            per_inst += bytes([0x00])
            for row in rot:
                for comp in row:
                    per_inst += struct.pack('<f', comp)
        xs = write_interleaved_f32([v[0][0] for v in values])
        ys = write_interleaved_f32([v[0][1] for v in values])
        zs = write_interleaved_f32([v[0][2] for v in values])
        return bytes(per_inst) + xs + ys + zs
    if type_byte == T_ENUM:
        return write_interleaved_u32(values)
    if type_byte == T_REF:
        refs = [(-1 if v is None else referent_of[id(v)]) for v in values]
        return write_referent_array(refs)
    if type_byte == T_COLOR3UINT8:
        r = bytes(v[0] for v in values)
        g = bytes(v[1] for v in values)
        b = bytes(v[2] for v in values)
        return r + g + b
    if type_byte == T_INT64:
        return write_interleaved_i64(values)
    raise ValueError(f"Unsupported type byte {type_byte:#x}")


def serialize(root_instances):
    """root_instances: list of top-level Inst objects (siblings, no shared parent
    in the file itself -- typical for a .rbxm containing one or more root models)."""

    # Flatten the whole tree (DFS), assigning referents in encounter order.
    flat = []
    def visit(inst, parent):
        inst.referent = len(flat)
        flat.append((inst, parent))
        for c in inst.children:
            visit(c, inst)
    for r in root_instances:
        visit(r, None)

    referent_of = {id(inst): inst.referent for inst, _ in flat}

    # Group by class name, preserving first-seen order.
    class_order = []
    class_groups = {}
    for inst, _ in flat:
        if inst.class_name not in class_groups:
            class_groups[inst.class_name] = []
            class_order.append(inst.class_name)
        class_groups[inst.class_name].append(inst)

    type_id_of_class = {cname: i for i, cname in enumerate(class_order)}

    out = bytearray()
    out += FILE_MAGIC
    out += FILE_SIGNATURE
    out += struct.pack('<H', FILE_VERSION)
    out += struct.pack('<I', len(class_order))
    out += struct.pack('<I', len(flat))
    out += b"\x00" * 8

    # INST chunks
    for cname in class_order:
        insts = class_groups[cname]
        type_id = type_id_of_class[cname]
        payload = bytearray()
        payload += struct.pack('<I', type_id)
        payload += write_string_field(cname)
        payload += bytes([0])  # isService = false
        payload += struct.pack('<I', len(insts))
        payload += write_referent_array([i.referent for i in insts])
        out += build_chunk(b'INST', bytes(payload))

    # PROP chunks (Name is always emitted, plus every declared property)
    for cname in class_order:
        insts = class_groups[cname]
        type_id = type_id_of_class[cname]

        # Name property (always present)
        payload = bytearray()
        payload += struct.pack('<I', type_id)
        payload += write_string_field("Name")
        payload += bytes([T_STRING])
        payload += _encode_values(T_STRING, [i.name for i in insts], referent_of)
        out += build_chunk(b'PROP', bytes(payload))

        # Union of explicit property names across instances of this class,
        # in first-seen order.
        prop_names = []
        seen = set()
        for i in insts:
            for pname in i.props:
                if pname not in seen:
                    seen.add(pname)
                    prop_names.append(pname)

        for pname in prop_names:
            # Instances of the same class may define different subsets of
            # properties (e.g. only some TextLabels set TextWrapped). Any
            # instance missing an explicitly-set property falls back to
            # that type's documented Roblox default so PROP chunks always
            # carry one value per instance, as the format requires.
            type_byte = None
            for i in insts:
                if pname in i.props:
                    type_byte, _ = i.props[pname]
                    break

            values = []
            for i in insts:
                if pname in i.props:
                    _, v = i.props[pname]
                else:
                    if type_byte not in DEFAULTS_BY_TYPE:
                        raise ValueError(
                            f"{cname}.{pname} missing on instance {i.name!r} and "
                            f"type {type_byte:#x} has no registered default"
                        )
                    v = DEFAULTS_BY_TYPE[type_byte]
                values.append(v)

            payload = bytearray()
            payload += struct.pack('<I', type_id)
            payload += write_string_field(pname)
            payload += bytes([type_byte])
            payload += _encode_values(type_byte, values, referent_of)
            out += build_chunk(b'PROP', bytes(payload))

    # PRNT chunk
    payload = bytearray()
    payload += bytes([0])  # version
    payload += struct.pack('<I', len(flat))
    payload += write_referent_array([inst.referent for inst, _ in flat])
    payload += write_referent_array([(-1 if parent is None else parent.referent) for _, parent in flat])
    out += build_chunk(b'PRNT', bytes(payload))

    # END chunk (uncompressed always, but our build_chunk always writes
    # compressed_len=0 anyway, so this is consistent)
    out += build_chunk(b'END\x00', FILE_FOOTER)

    return bytes(out)
