-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 5 ]] --[[ Name: createUseEffect ]]
    return function(v1, v2) --[[ Line: 6 ]]
        -- upvalues: v0 (copy)
        assert(typeof(v1) == "function", "useEffect callback is not a function");
        local l_v0_0 = v0;
        l_v0_0.hookCounter = l_v0_0.hookCounter + 1;
        l_v0_0 = v0.hookCounter;
        v0.effects[l_v0_0] = {
            v1, 
            v2
        };
    end;
end;