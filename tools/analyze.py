#!/usr/bin/env python3
"""Analyze extracted place: unique scripts, 2021-compat scan."""
import json, re, os, sys, hashlib, collections

ROOT='/home/user/rate-my-avatar-korone'
m=json.load(open('/tmp/place_model.json'))
ref_class={int(k):v for k,v in m['ref_class'].items()}
parent_of={int(k):int(v) for k,v in m['parent_of'].items()}
props={int(k):v for k,v in m['props'].items()}
SCRIPTS={'Script','LocalScript','ModuleScript'}

api=json.load(open('/tmp/api-2021.json'))
cls21={c['Name'] for c in api['Classes']}
enums21={}
for e in api['Enums']:
    enums21[e['Name']]={it['Name'] for it in e.get('Items',[])}
# members per class for method/prop checks (inherited walk)
cls_members=collections.defaultdict(set)
cls_super={}
for c in api['Classes']:
    cls_super[c['Name']]=c.get('Superclass')
for c in api['Classes']:
    for mem in c.get('Members',[]):
        cls_members[c['Name']].add((mem['MemberType'], mem['Name']))
def has_member(cls, name):
    seen=set()
    while cls and cls not in seen:
        seen.add(cls)
        if any(n==name for t,n in cls_members.get(cls,())): return True
        cls=cls_super.get(cls)
    return False

def path_of(ref):
    parts=[]; cur=ref; seen=set()
    while cur in parent_of and cur not in seen:
        seen.add(cur)
        parts.append(props.get(cur,{}).get('Name') or ref_class.get(cur,'?'))
        cur=parent_of[cur]
    return '.'.join(reversed(parts))

# ---- gather scripts
scripts=[]  # (ref,class,path,source)
for ref,p in props.items():
    src=p.get('Source')
    if src is not None and ref_class.get(ref) in SCRIPTS:
        scripts.append((ref,ref_class[ref],path_of(ref),src))
scripts.sort(key=lambda s:s[2])
groups=collections.defaultdict(list)
for ref,cls,path,src in scripts:
    h=hashlib.sha1(src.encode()).hexdigest()[:8]
    groups[(h,src)].append((ref,cls,path))
uniq=list(groups.items())
uniq.sort(key=lambda kv:(-len(kv[1]), kv[1][0][2]))
print(f'total script instances: {len(scripts)}  unique sources: {len(uniq)}')

os.makedirs(f'{ROOT}/extracted/scripts', exist_ok=True)
manifest=[]
for i,((h,src),locs) in enumerate(uniq):
    n_uniq=len(uniq)
print('ok')

# ---- heuristic renames / banned patterns (curated)
CURATED=[
 # (regex, id, human note)
 (r'\bTextChatService\b', 'TextChatService', 'New chat system (2023). 2021 has legacy Chat service.'),
 (r'\bVoiceChatService\b', 'VoiceChatService', 'Spatial voice service; useless/absent on revival.'),
 (r'\.RollOffMaxDistance\b', 'RollOffMaxDistance', 'Renamed sound prop (2022). 2021: MaxDistance'),
 (r'\.RollOffMinDistance\b', 'RollOffMinDistance', 'Renamed sound prop (2022). 2021: MinDistance'),
 (r'\.RollOffMode\b', 'RollOffMode', '2022 sound prop. 2021: EmitterSize/curves'),
 (r'\bBanAsync\b', 'BanAsync', 'Players:BanAsync is 2022+. 2021: :Kick()'),
 (r':GetTextBoundsAsync\b', 'GetTextBoundsAsync', 'TextService:GetTextBoundsAsync is 2022+'),
 (r'\bRespectFilteringEnabled\b', 'RespectFilteringEnabled', '2022 SoundService prop'),
 (r'\bGlobalWind\b', 'GlobalWind', '2022 Workspace prop'),
 (r'\bEvaluateStateMachine\b', 'EvaluateStateMachine', '2022 Humanoid prop'),
 (r'\.ToHex\b', 'Color3 ToHex', 'Color3:ToHex/ToHSV are 2022+/2023'),
 (r'\btable\.clone\b', 'table.clone', 'Luau 2022+. Replace with shallow-copy loop'),
 (r'\btable\.clear\b', 'table.clear', 'Added ~2021-12; may be missing. Safer: reassign {}'),
 (r'\bvector\.create\b', 'vector lib', 'Luau 2022+'),
 (r'\bbuffer\.', 'buffer lib', 'Luau 2025+'),
 (r'\bSharedTable\b', 'SharedTable', 'Luau 2025+'),
 (r'\bVideoFrame\b', 'VideoFrame', 'video ads/properties changed post-2021'),
 (r'\bWire\b|AudioPlayer|AudioEmitter|AudioListener|AudioDeviceOutput|AudioFader', 'Audio API 2023', 'New audio API (2023)'),
 (r'\.RunContext\b', 'RunContext', 'Script.RunContext is 2023+'),
 (r'\bFontFace\b|Font\.from', 'FontFace', 'FontFace/Face fonts are 2023+'),
 (r'\bMaterialVariant\b', 'MaterialVariant', '2022+ material variants'),
 (r'\bPreloadAsync\b', 'noop', 'ok'),
 (r'\bCanvasGroup\b', 'CanvasGroup', '2022+ UI class'),
 (r'\bUIFlexItem\b|HorizontalFlex|VerticalFlex', 'UIFlex', '2023 flex layout'),
 (r'\bFocusNavigationService\b', 'FocusNavigationService', '2023+'),
 (r'\.PreEmptive\b|\.Parallel\b|task\.desynchronize|task\.synchronize', 'parallel luau', '2022+ parallel Luau'),
 (r'securecall|newproxy%(', 'misc', 'misc'),
 (r':Ban2?a?sync', 'BanAsync2', ''),
]
CURATED=[c for c in CURATED if c[1] not in ('x','noop','misc')]

rx_instance_new=re.compile(r'Instance\.new\(\s*["\']([A-Za-z0-9_ ]+)["\']')
rx_enum=re.compile(r'\bEnum\.([A-Za-z0-9_]+)\.([A-Za-z0-9_]+)')
rx_getsvc=re.compile(r'GetService\(\s*["\']([A-Za-z0-9_ ]+)["\']\s*\)')

def scan_source(src):
    hits=collections.defaultdict(list)  # hitid -> [lineNos]
    def add(id, ln): hits[id].append(ln)
    for ln,line in enumerate(src.split('\n'),1):
        for rx,hid,note in CURATED:
            if re.search(rx,line): add(hid,ln)
        for mm in rx_instance_new.finditer(line):
            cl=mm.group(1)
            if cl not in cls21: add(f'NEWCLASS:{cl}',ln)
        for mm in rx_enum.finditer(line):
            cat,item=mm.group(1),mm.group(2)
            if cat in enums21:
                if item not in enums21[cat]: add(f'NEWENUM:{cat}.{item}',ln)
            else:
                add(f'NEWENUMCAT:{cat}',ln)
        for mm in rx_getsvc.finditer(line):
            sv=mm.group(1)
            if sv not in cls21: add(f'NEWSERVICE:{sv}',ln)
    return hits

# class census of the place itself
place_classes=collections.Counter(ref_class.values())
bad_place=[(c,n) for c,n in place_classes.items() if c not in cls21]
print('\n== classes in place NOT in 2021 (0.506.2):')
for c,n in sorted(bad_place, key=lambda x:-x[1]): print(f'   {c} x{n}')

report={}
for (h,src),locs in uniq:
    hits=scan_source(src)
    if hits:
        report[h]={'count':len(locs),'first':locs[0][2],'hits':{k:sorted(set(v)) for k,v in hits.items()}}
print(f'\n== unique scripts with compat hits: {len(report)}')
for h,info in sorted(report.items(), key=lambda kv:-len(kv[1]['hits'])):
    kinds=sorted(info['hits'])
    print(f"   [{h}] x{info['count']} {info['first']}")
    for k in kinds: print(f"       {k} lines={info['hits'][k][:6]}")
json.dump({'report':report,'bad_place_classes':bad_place}, open('/tmp/scan.json','w'), indent=1)
print('\nwrote /tmp/scan.json')
