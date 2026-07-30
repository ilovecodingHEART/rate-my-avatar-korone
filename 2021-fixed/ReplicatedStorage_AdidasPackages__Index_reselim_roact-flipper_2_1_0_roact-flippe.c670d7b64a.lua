-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.useMotor);
local v1 = require(script.Parent.getBinding);
local function v2(v3) --[[ Line: 4 ]] --[[ Name: getInitialValue ]]
    -- upvalues: v2 (copy)
    if v3.step then
        return v3._targetValue;
    else
        local v4 = {};
        for v5, v6 in pairs(v3) do
            v4[v5] = v2(v6);
        end;
        return v4;
    end;
end;
return function(v7, v8) --[[ Line: 16 ]] --[[ Name: useGoal ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local v9 = v0(v7, (v2(v8)));
    v9:setGoal(v8);
    return v1(v9), v9;
end;