-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1, v2) --[[ Line: 4 ]] --[[ Name: foldRight ]]
    local l_v2_0 = v2;
    for v4 = #v0, 1, -1 do
        l_v2_0 = v1(l_v2_0, v0[v4], v4);
    end;
    return l_v2_0;
end;