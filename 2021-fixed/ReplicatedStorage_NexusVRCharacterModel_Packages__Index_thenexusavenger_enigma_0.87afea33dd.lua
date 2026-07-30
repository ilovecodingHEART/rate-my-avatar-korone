-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x3, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for _, v4 in pairs(v1) --[[ 2021 ]] do
        v2[v4] = v4:GetCurrentText();
    end;
    return (setmetatable({
        Inputs = v1, 
        LastText = v2[v1[1]], 
        LastTextValues = v2
    }, v0));
end;
v0.GetCurrentText = function(v5) --[[ Line: 40 ]] --[[ Name: GetCurrentText ]]
    local v6 = {};
    for _, v8 in pairs(v5.Inputs) --[[ 2021 ]] do
        v6[v8] = v8:GetCurrentText();
    end;
    for _, v10 in pairs(v5.Inputs) --[[ 2021 ]] do
        if v6[v10] ~= v5.LastTextValues[v10] then
            v5.LastText = v6[v10];
            break;
        end;
    end;
    return v5.LastText;
end;
return v0;