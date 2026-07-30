-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 5 ]] --[[ Name: reverse ]]
    local v1 = {};
    local v2 = #v0;
    local v3 = v2 + 1;
    for v4 = 1, v2 do
        v1[v4] = v0[v3 - v4];
    end;
    return v1;
end;