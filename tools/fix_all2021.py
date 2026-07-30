#!/usr/bin/env python3
"""Bulk 2021-fixer for every script NOT covered by a hand-verified patch.

Emits 2021-fixed/<name>.lua for each extracted script that has no entry in
2021-patches/. Two transforms are 100% mechanical and safe:
  1. `%*` -> `%s`  (only on lines that actually feed string.format/:format;
     `%*` is a *2022* Luau format specifier emitted by the decompiler wherever
     the original game used string interpolation. 2021 clients refuse it with
     "invalid conversion '%*' to 'format'". A line without format( can only be
     a Lua pattern string (Cmdr), where %* means a literal * and is left alone.)
  2. `for a, b in <table-expr> do` -> `for a, b in pairs(<table-expr>) do`
     (bare-table iteration is the 2022 "generalized iteration" feature;
     on 2021 it is a runtime error. The decompiler only emits the bare form
     for real tables, so pairs() is semantics-preserving.)

Anything that is NOT safely mechanical (if-then-else expressions, `continue`
statements - both compile errors on 2021) is NOT auto-fixed; instead each
output file's header says how many manual-fix sites it has and
2021-fixed/MANUAL-FIXES.md lists every line so you can rewrite them by hand
(recipes in REPORT-2021.md). Files with 0 manual sites are paste-and-go.
"""
import json, os, re, sys

ROOT = '/home/user/rate-my-avatar-korone'
SRC = f'{ROOT}/extracted'
DST = f'{ROOT}/2021-fixed'
PATCHES = set(os.listdir(f'{ROOT}/2021-patches'))

ITER_RE = re.compile(r'for([ \t]+[_A-Za-z0-9, \t]+[ \t]+in[ \t]+)((?:[_A-Za-z][_A-Za-z0-9]*\.)*[_A-Za-z][_A-Za-z0-9]*)[ \t]+do')
IFX_RE = re.compile(r'(=\s*if\s|\(\s*if\s|,\s*if\s|return\s+if\s|\bif\s+if\s|\belseif\s+if\s|\bwhile\s+if\s|\buntil\s+if\s|(?:\band|\bor|\bnot)\s+if\s)')
CONT_RE = re.compile(r'^\s*continue\s*;?\s*$')
# compound assignment (2022 Luau): `X op= rhs` -> `X = X op (rhs)`, simple lvalues only
COMPOUND_RE = re.compile(r'^([ \t]*)([A-Za-z_][A-Za-z0-9_\.]*)[ \t]*(\+|-|\*|/|%|\^|\.\.)=[ \t]*(.*)$', re.M)
COMPOUND_LEFT_RE = re.compile(r'[A-Za-z0-9_\.][ \t]*(\+|-|\*|/|%|\^|\.\.)=[ \t]*[^=]')
FONT_LEFT_RE = re.compile(r'Font\.fromName\(|Font\.fromId\(|Font\.fromEnum\(|Font\.new\(|\.FontFace[ \t]*=')


def _fix_compound(m):
    rest = m.group(4)
    rest = rest.split('--', 1)[0].rstrip().rstrip(';').rstrip()
    return '%s%s = %s %s (%s); --[[ 2021: was compound assignment ]]' % (
        m.group(1), m.group(2), m.group(2), m.group(3), rest)

# library shims for functions that only exist on 2022+ clients
# (each exact for the data-table/colour uses in this codebase)
SHIMS = {
 'table.clear(': ('__2021_clear', '''-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end'''),
 'table.clone(': ('__2021_clone', '''-- [2021] no table.clone on this client (2022 API); shallow clone + metatable, like the real one
local function __2021_clone(vt)
	local vn = setmetatable({}, getmetatable(vt));
	for k, v in pairs(vt) do vn[k] = v end
	return vn
end'''),
 'table.freeze(': ('__2021_freeze', '''-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end'''),
 'table.find(': ('__2021_find', '''-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end'''),
 'math.round(': ('__2021_round', '''-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end'''),
 'Color3.fromHex(': ('color3_fromHex_2021', '''-- [2021] no Color3.fromHex on this client (2023 API); local equivalent
local function color3_fromHex_2021(vhex)
	vhex = vhex:gsub("#", "");
	if #vhex == 3 then vhex = vhex:gsub("(.)", "%1%1") end
	return Color3.fromRGB(tonumber(vhex:sub(1, 2), 16), tonumber(vhex:sub(3, 4), 16), tonumber(vhex:sub(5, 6), 16))
end'''),
}

# Font value-type constructors (2022): only the property-assignment forms are
# mechanically fixable (font family fidelity on 2021 = the old Enum.Font set).
FONT_FROMENUM_RE = re.compile(r'\.FontFace[ \t]*=[ \t]*Font\.fromEnum\(([A-Za-z0-9_\.]+)\)[ \t]*;?')
FONT_CTOR_RE = re.compile(r'\.FontFace[ \t]*=[ \t]*Font\.(fromName|fromId|new)\([^;\n]*\)[ \t]*;?')
# decompiler damage that does not compile on ANY Roblox version:
#   "x = obj:Method" (method value via colon) -> dot indexing
COLONVAL_RE = re.compile(r'= ([A-Za-z_][A-Za-z0-9_\.]*):([A-Za-z_][A-Za-z0-9_]*)[ \t]*$')

# ------------------------------------------------------------ if-expr converter
# Rewrites `if C then A else B` -> __2021_if(fn(C), fn(A), fn(B)), semantics-exact
# (branches stay lazy; conditions commonly guard nil paths so and/or rewrites
# would be wrong). Works by masking strings/comments, scanning expression spans
# bracket-depth-aware, converting innermost spans first, then rescanning.
_THUNKIF = '''-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end'''

_ANCHOR = re.compile(r'(=[ \t]*|\([ \t]*|,[ \t]*|\.\.[ \t]*|[+*/%^\-][ \t]*|[=~<>]=?[ \t]*|\breturn[ \t]+|\band[ \t]+|\bor[ \t]+|\bnot[ \t]+|\bif[ \t]+|\belseif[ \t]+|\bwhile[ \t]+|\buntil[ \t]+|\belse[ \t]+)(if[ \t]+)')
_BADKW = re.compile(r'\b(end|do|local|then|else|elseif|while|until|repeat|for|break|continue)\b')
_IFWORD = re.compile(r'(?<![A-Za-z0-9_])if(?![A-Za-z0-9_])')
_CONVERTED = '__2021_if('


def _mask(line):
    """Blank out string/comment contents (positions preserved)."""
    out = list(line)
    i, n = 0, len(line)
    while i < n:
        c = line[i]
        if c in '"\'':
            q = c; j = i + 1
            while j < n:
                if line[j] == '\\': j += 2; continue
                if line[j] == q: break
                j += 1
            for k in range(i + 1, min(j, n)): out[k] = ' '
            i = j + 1
        elif line.startswith('--[[', i):
            j = line.find(']]', i + 4)
            j = n if j == -1 else j + 2
            for k in range(i, j): out[k] = ' '
            i = j
        elif line.startswith('--', i):
            for k in range(i, n): out[k] = ' '
            break
        else:
            i += 1
    return ''.join(out)


def _scan_expr(masked, start):
    """Return (end_index, depth) for the expression starting at `start`, scanning
    bracket-depth-aware over masked text. Terminates at depth 0 on: , ; EOL,
    a ' then'/' do'/' else' keyword boundary, a -- comment, or an unbalanced closer.
    depth != 0 at EOL means the expression continues on the next line (multi-line)."""
    depth = 0
    i, n = start, len(masked)
    while i < n:
        c = masked[i]
        if c in '([{':
            depth += 1
        elif c in ')]}':
            if depth == 0:
                return i, 0
            depth -= 1
        elif depth == 0:
            if c in ',;':
                return i, 0
            if c == ' ':
                for kw in ('then', 'do', 'else'):
                    if masked.startswith(kw, i + 1):
                        after = i + 1 + len(kw)
                        if after >= n or not (masked[after].isalnum() or masked[after] == '_'):
                            return i, 0
            if masked.startswith('--', i):
                return i, 0
        i += 1
    return n, depth


def convert_ifexprs(src):
    """Convert all single-line if-expressions to __2021_if thunk calls.
    Returns (new_src, n_converted, n_leftover_lines, helper_needed)."""
    converted = 0
    lines = src.split('\n')
    for li, line in enumerate(lines):
        if not _IFWORD.search(_mask(line)):
            continue
        for _pass in range(8):
            masked = _mask(line)
            made = False
            for am in _ANCHOR.finditer(masked):
                i0 = am.start(2)         # position of the `if` keyword
                j = am.end(2)            # just past `if `
                cend, _ = _scan_expr(masked, j)
                if masked[cend:] == '' or not masked.startswith(' then', cend):
                    continue
                astart = cend + 5        # past ' then'
                aend, _ = _scan_expr(masked, astart)
                if masked[aend:] == '' or not masked.startswith(' else', aend):
                    continue
                bstart = aend + 5        # past ' else'
                bend, bdepth = _scan_expr(masked, bstart)
                if bdepth != 0:
                    continue  # B continues on the next line: multi-line if-expr, manual fix
                cond, aval, bval = line[j:cend].strip(), line[astart:aend].strip(), line[bstart:bend].strip()
                if not cond or not aval or not bval:
                    continue
                if any('...' in x for x in (cond, aval, bval)):
                    continue  # varargs cannot cross a function boundary; manual fix
                ok = True
                for x in (cond, aval, bval):
                    if x.startswith(_CONVERTED):
                        continue  # already-converted nested span; known-good expression
                    if _BADKW.search(x) or _IFWORD.search(x):
                        ok = False
                        break
                if not ok:
                    continue
                repl = ('__2021_if(function() return %s end, function() return %s end, function() return %s end)'
                        % (cond, aval, bval))
                line = line[:i0] + repl + line[bend:]
                made = True
                converted += 1
                break
            if not made:
                break
        lines[li] = line
    newsrc = '\n'.join(lines)
    # leftover = lines that still present a convertible-looking if-expression anchor
    leftover = sum(1 for ln in lines if _ANCHOR.search(_mask(ln)))
    return newsrc, converted, leftover, converted > 0



manual = {}   # file -> list of (lineno, kind, text)
changed = []  # files whose emitted content differs from the extracted original
stats = {'files': 0, 'star': 0, 'iter': 0, 'ifx': 0, 'ifx_left': 0, 'compound': 0, 'shimfiles': 0}

os.makedirs(DST, exist_ok=True)

for name in sorted(os.listdir(SRC)):
    if not name.endswith('.lua') or name in PATCHES:
        continue
    src = open(f'{SRC}/{name}', encoding='utf-8', errors='replace').read()
    original_src = src
    lines = src.split('\n')
    nstar = 0
    for i, ln in enumerate(lines):
        if '%*' in ln and 'format(' in ln:
            nstar += ln.count('%*')
            lines[i] = ln.replace('%*', '%s')
    src, niter = ITER_RE.subn(r'for\1pairs(\2) --[[ 2021 ]] do', '\n'.join(lines))
    src, ncompound = COMPOUND_RE.subn(_fix_compound, src)
    # decompiler damage repair (broken on every Roblox version, incl. modern)
    out_lines_pre = []
    for ln in src.split('\n'):
        m = _mask(ln).strip()
        if m and len(m) <= 3 and all(ord(c) > 126 for c in m):
            continue  # stray garbage line (e.g. a lone '§' in Social.server)
        ln2 = COLONVAL_RE.sub(r'= \1.\2 --[[ repaired decompile colon-value damage ]]', ln)
        out_lines_pre.append(ln2)
    src = '\n'.join(out_lines_pre)
    src, nifx, nifx_left, need_thunk = convert_ifexprs(src)
    shims_used = []
    for needle, (fn, body) in SHIMS.items():
        if needle in src:
            src = body + '\n' + src
            src = src.replace(needle, fn + '(')
            shims_used.append(fn)
    nfont = 0
    src, n1 = FONT_FROMENUM_RE.subn(lambda m: '.Font = %s; --[[ 2021: no Font value type ]]' % m.group(1), src)
    src, n2 = FONT_CTOR_RE.subn('.Font = Enum.Font.Gotham; --[[ 2021: no Font value type; family fell back to Gotham ]]', src)
    nfont = n1 + n2
    if need_thunk:
        src = _THUNKIF + '\n' + src
    out_lines = src.split('\n')
    sites = []
    for i, ln in enumerate(out_lines, 1):  # NOTE: line numbers match the emitted file
        if _ANCHOR.search(_mask(ln)):
            sites.append((i, 'if-expr (could not auto-convert)', ln.strip()[:110]))
        if CONT_RE.match(ln):
            sites.append((i, 'continue', ln.strip()[:110]))
    # leftover runtime-level warnings (not compile errors): compounds we could not
    # safely rewrite, and Font value-type usage outside property assignments
    warns = []
    ncomp_left = sum(1 for ln in out_lines if COMPOUND_LEFT_RE.search(_mask(ln)))
    nfont_left = sum(1 for ln in out_lines if FONT_LEFT_RE.search(_mask(ln)))
    if ncomp_left:
        warns.append(f'{ncomp_left} compound-assignment line(s) need manual rewriting (X op= Y -> X = X op Y)')
    if nfont_left:
        warns.append(f'{nfont_left} Font.from*/Font.new/.FontFace line(s) remain (2022 Font value type); rewrite to Enum.Font by hand where it errors')
    head = (
        '-- ============================================================\n'
        '-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY\n'
        f'-- mechanical fixes applied: %* -> %s x{nstar}, pairs() wrap x{niter}, if-expr -> __2021_if x{nifx}, compound-assign x{ncompound}'
        + (', font-props x%d' % nfont if nfont else '')
        + ((', shims: ' + ', '.join(shims_used)) if shims_used else '') + '\n'
    )
    if warns:
        head += '-- WARNING: ' + '; '.join(warns) + '.\n'
    if sites:
        head += (f'-- !! MANUAL FIX REQUIRED: {len(sites)} site(s) use if-expressions or `continue`,\n'
                 '-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines\n'
                 '-- !! and REPORT-2021.md for rewrite recipes. They are marked below.\n')
    else:
        head += '-- no manual fixes needed; paste as-is.\n'
    head += '-- ============================================================\n'
    out = head + src
    # mark manual sites inline for visibility
    if sites:
        marked = out.split('\n')
        off = head.count('\n')
        for ln, kind, _ in sites:
            idx = off + ln - 1
            if 0 <= idx < len(marked):
                marked[idx] = f'{marked[idx]} -- << MANUAL FIX: {kind} (2021 cannot compile this) >>'
        out = '\n'.join(marked)
        manual[name] = sites
    open(f'{DST}/{name}', 'w').write(out)
    if src != original_src or sites:
        changed.append(name)
    stats['files'] += 1
    stats['star'] += nstar
    stats['iter'] += niter
    stats['ifx'] += nifx
    stats['ifx_left'] += nifx_left
    stats['compound'] += ncompound
    stats['shimfiles'] += 1 if shims_used else 0

with open(f'{DST}/MANUAL-FIXES.md', 'w') as f:
    f.write('# Manual fixes required (if-expressions / `continue` — do not compile on 2021)\n\n')
    f.write('Rewrite recipes are in REPORT-2021.md (section "Fixing scripts yourself").\n')
    f.write('Files are otherwise fixed and paste-ready. Total files: %d\n\n' % len(manual))
    for name in sorted(manual):
        f.write(f'## extracted/{name}\n')
        for ln, kind, text in manual[name]:
            f.write(f'- line {ln} [{kind}]: `{text}`\n')
        f.write('\n')

with open(f'{DST}/CHANGED.md', 'w') as f:
    f.write('# Files that differ from the originals — paste THESE, skip the rest\n\n')
    f.write('%d of %d scripts needed changes. The other %d are byte-identical copies;\n' % (len(changed), stats['files'], stats['files'] - len(changed)))
    f.write('bring those over straight from modern Studio and move on.\n\n')
    for name in changed:
        f.write(f'- {name}\n')

print('emitted:', stats['files'], 'files ->', DST)
print('%* -> %s total:', stats['star'], '| pairs() wraps total:', stats['iter'],
      '| if-expr auto-converted:', stats['ifx'], '| if-expr lines left:', stats['ifx_left'],
      '| compounds:', stats['compound'], '| shim files:', stats['shimfiles'])
print('files needing manual fixes:', len(manual), '| total sites:', sum(len(v) for v in manual.values()))
