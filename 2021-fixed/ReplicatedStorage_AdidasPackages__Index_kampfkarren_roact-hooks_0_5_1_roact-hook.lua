-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 4 ]] --[[ Name: createUseCallback ]]
    return function(v1, v2) --[[ Line: 5 ]]
        -- upvalues: v0 (copy)
        return v0(function() --[[ Line: 6 ]]
            -- upvalues: v1 (copy)
            return v1;
        end, v2);
    end;
end;