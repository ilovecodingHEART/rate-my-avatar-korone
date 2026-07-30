-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.dependenciesDifferent);
return function(v1) --[[ Line: 5 ]] --[[ Name: createUseMemo ]]
    return function(v2, v3) --[[ Line: 6 ]]
        local v4 = v1(nil);
        local v5 = v3 == nil;
        if v4.value == nil or v0(v3, v4.value.dependencies) then
            v5 = true;
        end;
        if v5 then
            v4.value = {
                dependencies = v3, 
                memoizedValue = {
                    v2()
                }
            };
        end;
        return unpack(v4.value.memoizedValue);
    end;
end;