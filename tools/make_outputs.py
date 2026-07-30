#!/usr/bin/env python3
"""Write extracted unique scripts + candidate patched copies + manifest."""
import json, re, os, hashlib, collections

ROOT='/home/user/rate-my-avatar-korone'
m=json.load(open('/tmp/place_model.json'))
scan=json.load(open('/tmp/scan.json'))
ref_class={int(k):v for k,v in m['ref_class'].items()}
parent_of={int(k):int(v) for k,v in m['parent_of'].items()}
props={int(k):v for k,v in m['props'].items()}
SCRIPTS={'Script','LocalScript','ModuleScript'}
EXT={'Script':'.server.lua','LocalScript':'.client.lua','ModuleScript':'.lua'}

def path_of(ref):
    parts=[]; cur=ref; seen=set()
    while cur in parent_of and cur not in seen:
        seen.add(cur); parts.append(props.get(cur,{}).get('Name') or ref_class.get(cur,'?')); cur=parent_of[cur]
    return '.'.join(reversed(parts))

groups=collections.defaultdict(list)
for ref,p in props.items():
    src=p.get('Source')
    if src is not None and ref_class.get(ref) in SCRIPTS:
        groups[hashlib.sha1(src.encode()).hexdigest()[:10]].append((ref,ref_class[ref],path_of(ref),src))

def safe(s): return re.sub(r'[^A-Za-z0-9_.-]+','_',s)[:80]

for d in ('extracted','2021-patches'):
    os.makedirs(f'{ROOT}/{d}', exist_ok=True)

manifest=[]
for h,locs in sorted(groups.items()):
    ref,cls,path,src=locs[0]
    fname=f'{safe(path.replace(".","/"))}'
    # keep file names unique enough w/ hash suffix
    fn=f'{fname}{EXT[cls]}'
    full=f'extracted/{fn}'
    os.makedirs(os.path.dirname(f'{ROOT}/{full}'),exist_ok=True)
    if os.path.exists(f'{ROOT}/{full}'):
        fn=f'{fname}.{h}{EXT[cls]}'; full=f'extracted/{fn}'
    with open(f'{ROOT}/{full}','w') as f: f.write(src)
    manifest.append({'hash':h,'class':cls,'file':full,'paths':sorted({l[2] for l in locs}),
                     'count':len(locs),'hits':scan['report'].get(h[:8],{}).get('hits',{})})
json.dump(manifest, open(f'{ROOT}/extracted/manifest.json','w'), indent=1)
print('unique:',len(manifest),'files written')
hits_n=sum(1 for x in manifest if x['hits'])
print('with hits:',hits_n)
