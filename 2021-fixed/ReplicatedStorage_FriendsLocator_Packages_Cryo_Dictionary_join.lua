-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.None);
return function(...) --[[ Line: 12 ]] --[[ Name: join ]]
    local v1 = {};
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...);
        for v4, v5 in pairs(v3) do
            if v5 == v0 then
                v1[v4] = nil;
            else
                v1[v4] = v5;
            end;
        end;
    end;
    return v1;
end;