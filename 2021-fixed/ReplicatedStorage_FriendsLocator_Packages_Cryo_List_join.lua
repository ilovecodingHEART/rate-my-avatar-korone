-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.None);
return function(...) --[[ Line: 6 ]] --[[ Name: join ]]
    local v1 = {};
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...);
        local v4 = #v1;
        for v5 = 1, #v3 do
            if v3[v5] == v0 then
                v4 = v4 - 1;
            else
                v1[v4 + v5] = v3[v5];
            end;
        end;
    end;
    return v1;
end;