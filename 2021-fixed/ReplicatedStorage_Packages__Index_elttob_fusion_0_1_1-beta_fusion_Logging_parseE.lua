-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 9 ]] --[[ Name: parseError ]]
    return {
        raw = v2, 
        message = v2:gsub("^.+:%d+:%s*", ""), 
        trace = debug.traceback(nil, 2)
    };
end;