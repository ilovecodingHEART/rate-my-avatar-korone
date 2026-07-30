-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x1, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Shared);
local v3 = {};
local function _(v4) --[[ Line: 17 ]] --[[ Name: getHumanoid ]]
    local l_Character_0 = v4.Character;
    if not l_Character_0 then
        return;
    else
        return (l_Character_0:FindFirstChild("Humanoid"));
    end;
end;
v3.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    return {
        throttle = 0
    };
end;
v3.is = function(v7, _) --[[ Line: 31 ]] --[[ Name: is ]]
    if v7.UserInputType == Enum.UserInputType.Keyboard then
        return true;
    else
        return false;
    end;
end;
local _ = function(v9, v10, _, _) --[[ Line: 39 ]] --[[ Name: handleHoldInput ]]
    if v10.KeyCode == Enum.KeyCode.Space then
        v2.setThrottle(v9, 0);
    end;
end;
v3.inputBeganCallback = function(v14, v15, v16) --[[ Line: 46 ]] --[[ Name: inputBeganCallback ]]
    if v16 then
        return;
    elseif v15.KeyCode ~= Enum.KeyCode.Space then
        return;
    elseif not v14._jetpack then
        return;
    else
        local l_Character_1 = l_LocalPlayer_0.Character;
        local v18 = __2021_if(function() return not l_Character_1 end, function() return nil end, function() return l_Character_1:FindFirstChild("Humanoid") end);
        if not v18 then
            return;
        else
            local l_v18_State_0 = v18:GetState();
            if l_v18_State_0 == Enum.HumanoidStateType.Freefall or l_v18_State_0 == Enum.HumanoidStateType.Flying then
                v2.setThrottle(v14, 1);
            end;
            return;
        end;
    end;
end;
v3.inputEndedCallback = function(v20, v21, v22) --[[ Line: 70 ]] --[[ Name: inputEndedCallback ]]
    if v22 then
        return;
    else
        if v21.KeyCode == Enum.KeyCode.Space then
            v2.setThrottle(v20, 0);
        end;
        return;
    end;
end;
v3.inputChangedCallback = function(_, _, _) --[[ Line: 76 ]] --[[ Name: inputChangedCallback ]]

end;
__2021_freeze(v3);
return v3;