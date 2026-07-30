#!/usr/bin/env python3
"""Extract scripts + instance census from a modern (zstd/LZ4) binary .rbxl.

Only decodes what we need: SSTR, INST, PROP(Name/Source), PRNT.
Full-consume validation on the chunks we do decode.
"""
import struct, sys, json, os, collections
import lz4.frame  # not used for decode (zstd-era file) but kept for old files
import lz4.block
try:
    import zstandard
except ImportError:
    zstandard = None

ZSTD_MAGIC = b'\x28\xb5\x2f\xfd'
SCRIPT_CLASSES = {'Script', 'LocalScript', 'ModuleScript'}

class R:
    def __init__(self, b): self.b=b; self.i=0
    def u8(self): v=self.b[self.i]; self.i+=1; return v
    def le_u32(self): v=struct.unpack('<I', self.b[self.i:self.i+4])[0]; self.i+=4; return v
    def le_i32(self): v=struct.unpack('<i', self.b[self.i:self.i+4])[0]; self.i+=4; return v
    def bstring(self):
        n=self.le_u32(); v=self.b[self.i:self.i+n]; self.i+=n; return v
    def string(self): return self.bstring().decode('utf-8','replace')
    def interleaved(self, count, n):
        raw=self.b[self.i:self.i+count*n]; self.i+=count*n
        return [[raw[v + k*count] for k in range(n)] for v in range(count)]
    def i32_array(self, count):
        out=[]
        for bs in self.interleaved(count,4):
            v=struct.unpack('>i', bytes(bs))[0]
            out.append((v>>1) ^ -(v&1))          # zigzag untransform
        return out
    def u32_array(self, count):
        return [struct.unpack('>I', bytes(bs))[0] for bs in self.interleaved(count,4)]
    def referents(self, count):
        out=[]; last=0
        for delta in self.i32_array(count):
            last+=delta; out.append(last)
        return out
    def done(self): return self.i==len(self.b)

def read_chunks(path):
    d=open(path,'rb').read()
    assert d[:14]==b'<roblox!\x89\xff\x0d\x0a\x1a\x0a'
    ver=struct.unpack('<H',d[14:16])[0]
    nclass,ninst=struct.unpack('<II',d[16:24])
    i=32; chunks=[]
    while i < len(d):
        name=d[i:i+4].decode('latin1'); clen,ulen,res=struct.unpack('<III',d[i+4:i+16])
        payload=d[i+16:i+16+clen] if clen else d[i+16:i+16+ulen]
        if clen==0: dec=payload
        elif payload[:4]==ZSTD_MAGIC:
            assert zstandard, 'zstandard module required'
            dec=zstandard.ZstdDecompressor().decompress(payload, max_output_size=ulen)
        else:
            dec=lz4.block.decompress(struct.pack('<I',ulen)+payload)
        assert len(dec)==ulen, (name,len(dec),ulen)
        chunks.append((name,dec))
        i += 16 + (clen if clen else ulen)
        if name=='END\x00': break
    assert i==len(d), f'trailing bytes: {len(d)-i}'
    return ver,nclass,ninst,chunks

def parse(path):
    ver,nclass,ninst,chunks=read_chunks(path)
    sstr=[]
    type_info={}      # type_id -> dict(class, referents[])
    props=collections.defaultdict(dict)  # referent -> {propname: value}
    parent_of={}      # referent -> parent referent (-1 = DataModel root)
    roots=[]
    for name,dec in chunks:
        r=R(dec)
        if name=='META':
            n=r.le_u32()
            for _ in range(n): r.string(); r.string()
            assert r.done(), 'META leftover'
        elif name=='SSTR':
            v=r.le_u32(); assert v==0
            n=r.le_u32()
            for _ in range(n):
                r.i+=16  # md5 hash
                sstr.append(r.bstring())
            assert r.done(), f'SSTR leftover {len(r.b)-r.i}'
        elif name=='INST':
            tid=r.le_u32(); cname=r.string(); fmt=r.u8(); n=r.le_u32()
            refs=r.referents(n)
            if fmt==1:  # service marker bytes follow (one bool per instance)
                markers=[r.u8() for _ in range(n)]
                if all(mv==0 for mv in markers):
                    print(f'   note: INST {cname} fmt=1 but markers all zero')
            assert r.done(), f'INST {cname} leftover {len(r.b)-r.i}'
            type_info[tid]={'class':cname,'referents':refs,'fmt':fmt}
        elif name=='PROP':
            tid=r.le_u32(); pname=r.string()
            try: tbyte=r.u8()
            except IndexError: continue
            ti=type_info.get(tid)
            if ti is None: continue
            n=len(ti['referents']); cname=ti['class']
            if pname=='Name' and tbyte==0x01:      # sequential binary strings
                for ref in ti['referents']:
                    props[ref]['Name']=r.bstring().decode('utf-8','replace')
                continue
            if pname=='Source' and cname in SCRIPT_CLASSES:
                if tbyte==0x1C:                    # SharedString indices
                    for ref,idx in zip(ti['referents'], r.u32_array(n)):
                        props[ref]['Source']=sstr[idx]
                elif tbyte==0x01:                  # inline strings
                    for ref in ti['referents']:
                        props[ref]['Source']=r.bstring()
                else:
                    print(f'!! Source type byte {hex(tbyte)} for {cname}', file=sys.stderr)
                continue
            # not needed: skip
        elif name=='PRNT':
            v=r.u8(); assert v==0
            n=r.le_u32()
            subjects=r.referents(n); parents=r.referents(n)
            assert r.done(), 'PRNT leftover'
            for s,p in zip(subjects,parents):
                parent_of[s]=p
                if p==-1: roots.append(s)
    # referent -> class
    ref_class={}
    for ti in type_info.values():
        for ref in ti['referents']:
            ref_class[ref]=ti['class']
    return {
        'version':ver, 'declared_classes':nclass, 'declared_instances':ninst,
        'sstr_count':len(sstr), 'type_info':type_info, 'props':dict(props),
        'parent_of':parent_of, 'roots':roots, 'ref_class':ref_class,
    }

def build_path(ref, parent_of, props, ref_class):
    parts=[]
    cur=ref
    seen=set()
    while cur in parent_of and cur not in seen:
        seen.add(cur)
        nm=props.get(cur,{}).get('Name') or ref_class.get(cur,'?')
        parts.append(nm)
        cur=parent_of[cur]
    return '.'.join(reversed(parts))

if __name__=='__main__':
    path=sys.argv[1] if len(sys.argv)>1 else '/home/user/rate-my-avatar-korone/donate pls.rbxl'
    m=parse(path)
    print(f"file ok: version={m['version']} classes={m['declared_classes']} instances(declared)={m['declared_instances']} sstr={m['sstr_count']}")
    census=collections.Counter(m['ref_class'].values())
    print(f"instances(parsed)={len(m['ref_class'])} classTypes={len(census)}")
    n_scripts=0
    for ref,p in m['props'].items():
        if 'Source' in p and m['ref_class'].get(ref) in SCRIPT_CLASSES:
            n_scripts+=1
    print(f"scripts with source: {n_scripts}")
    with open('/tmp/place_model.json','w') as f:
        json.dump({
            'ref_class':m['ref_class'],
            'parent_of':m['parent_of'],
            'props':{k:{kk:(vv.decode('utf-8','replace') if isinstance(vv,bytes) else vv) for kk,vv in v.items()} for k,v in m['props'].items()},
        }, f)
    print('wrote /tmp/place_model.json')
