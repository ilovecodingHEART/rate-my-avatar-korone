-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Dependencies.sharedState);
local l_initialisedStack_0 = v2.initialisedStack;
return function(v4) --[[ Line: 14 ]] --[[ Name: initDependency ]]
    local l_initialisedStackSize_0 = v2.initialisedStackSize;
    for v6, v7 in ipairs(l_initialisedStack_0) do
        if l_initialisedStackSize_0 < v6 then
            return;
        else
            v7[v4] = true;
        end;
    end;
end;