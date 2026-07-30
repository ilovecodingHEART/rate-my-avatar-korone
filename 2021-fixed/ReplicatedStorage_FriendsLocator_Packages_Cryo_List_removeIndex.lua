-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 4 ]] --[[ Name: removeIndex ]]
    local v2 = {};
    local v3 = 0;
    for v4 = 1, #v0 do
        if v4 == v1 then
            v3 = 1;
        else
            v2[v4 - v3] = v0[v4];
        end;
    end;
    return v2;
end;