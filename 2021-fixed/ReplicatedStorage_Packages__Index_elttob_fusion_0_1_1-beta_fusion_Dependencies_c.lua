-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clear
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Logging.parseError);
local v3 = require(l_Parent_0.Dependencies.sharedState);
local l_initialisedStack_0 = v3.initialisedStack;
local v5 = 0;
return function(v6, v7, ...) --[[ Line: 19 ]] --[[ Name: captureDependencies ]]
    local l_dependencySet_0 = v3.dependencySet;
    v3.dependencySet = v6;
    local l_v3_0 = v3;
    l_v3_0.initialisedStackSize = l_v3_0.initialisedStackSize + 1;
    l_v3_0 = v3.initialisedStackSize;
    local v10 = nil;
    if v5 < l_v3_0 then
        l_initialisedStack_0[l_v3_0] = {};
        v5 = l_v3_0;
    else
        v10 = l_initialisedStack_0[l_v3_0];
        __2021_clear(v10);
    end;
    local v11, v12 = xpcall(v7, v2, ...);
    v3.dependencySet = l_dependencySet_0;
    local l_v3_1 = v3;
    l_v3_1.initialisedStackSize = l_v3_1.initialisedStackSize - 1;
    return v11, v12;
end;