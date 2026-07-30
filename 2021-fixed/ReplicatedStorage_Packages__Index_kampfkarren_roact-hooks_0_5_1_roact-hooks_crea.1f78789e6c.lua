-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 3 ]] --[[ Name: createUseReducer ]]
    return function(v2, v3) --[[ Line: 4 ]]
        local v4, v5 = v1(v3);
        return v4, (v0(function(v6) --[[ Line: 6 ]]
            v5(v2(v4, v6));
        end, {
            v4
        }));
    end;
end;