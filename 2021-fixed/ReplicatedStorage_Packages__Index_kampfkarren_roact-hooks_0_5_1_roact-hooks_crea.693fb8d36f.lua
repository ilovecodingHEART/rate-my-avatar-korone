-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 1 ]] --[[ Name: createUseBinding ]]
    return function(v2) --[[ Line: 2 ]]
        return unpack(v1({
            v0.createBinding(v2)
        }).value);
    end;
end;