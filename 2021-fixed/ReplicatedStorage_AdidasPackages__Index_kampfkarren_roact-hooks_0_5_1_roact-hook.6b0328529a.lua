-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 1 ]] --[[ Name: createUseValue ]]
    return function(v1) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local l_v0_0 = v0;
        l_v0_0.hookCounter = l_v0_0.hookCounter + 1;
        l_v0_0 = v0.hookCounter;
        if v0.values == nil then
            v0.values = {};
        end;
        if v0.values[l_v0_0] == nil then
            v0.values[l_v0_0] = {
                value = v1
            };
        end;
        return v0.values[l_v0_0];
    end;
end;