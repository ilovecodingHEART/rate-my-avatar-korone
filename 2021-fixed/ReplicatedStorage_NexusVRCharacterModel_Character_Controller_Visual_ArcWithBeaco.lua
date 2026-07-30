-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Arc_0 = require(script.Parent:WaitForChild("Arc"));
local l_Beacon_0 = require(script.Parent:WaitForChild("Beacon"));
local v2 = {};
v2.__index = v2;
setmetatable(v2, l_Arc_0);
v2.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_Arc_0 (copy), v2 (copy), l_Beacon_0 (copy)
    local v3 = setmetatable(l_Arc_0.new(), v2);
    v3.Beacon = l_Beacon_0.new();
    v3:Hide();
    return v3;
end;
v2.Update = function(v4, v5) --[[ Line: 31 ]] --[[ Name: Update ]]
    -- upvalues: l_Arc_0 (copy)
    local v6, v7 = l_Arc_0.Update(v4, v5);
    local l_Beacon_1 = v4.Beacon;
    if v6 then
        l_Beacon_1:Update(CFrame.new(v7) * CFrame.new(0, 0.001, 0), v6);
        return v6, v7;
    else
        l_Beacon_1:Hide();
        return v6, v7;
    end;
end;
v2.Hide = function(v9) --[[ Line: 50 ]] --[[ Name: Hide ]]
    -- upvalues: l_Arc_0 (copy)
    l_Arc_0.Hide(v9);
    v9.Beacon:Hide();
end;
v2.Destroy = function(v10) --[[ Line: 58 ]] --[[ Name: Destroy ]]
    -- upvalues: l_Arc_0 (copy)
    l_Arc_0.Destroy(v10);
    v10.Beacon:Destroy();
end;
return v2;