-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 1 ]] --[[ Name: dependenciesDifferent ]]
    local v2 = 0;
    for v3, v4 in pairs(v0) do
        v2 = v2 + 1;
        if v4 ~= v1[v3] then
            return true;
        end;
    end;
    for _ in pairs(v1) do
        v2 = v2 - 1;
    end;
    if v2 ~= 0 then
        return true;
    else
        return false;
    end;
end;