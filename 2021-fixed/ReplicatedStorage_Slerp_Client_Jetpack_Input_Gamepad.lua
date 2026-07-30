-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x1, compound-assign x0, shims: __2021_freeze
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
local v4 = {
    Enum.UserInputType.Gamepad1
};
local _ = function(v5) --[[ Line: 21 ]] --[[ Name: toSet ]]
    local v6 = {};
    for _, v8 in pairs(v5) --[[ 2021 ]] do
        v6[v8] = true;
    end;
    return v6;
end;
local v10 = {};
for _, v12 in pairs(v4) --[[ 2021 ]] do
    v10[v12] = true;
end;
local l_v10_0 = v10;
v10 = function(v14) --[[ Line: 31 ]] --[[ Name: getHumanoid ]]
    local l_Character_0 = v14.Character;
    if not l_Character_0 then
        return;
    else
        return (l_Character_0:FindFirstChild("Humanoid"));
    end;
end;
v3.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    return {
        throttle = 0
    };
end;
v3.is = function(v16, _) --[[ Line: 45 ]] --[[ Name: is ]]
    if l_v10_0[v16.UserInputType] then
        return true;
    else
        return false;
    end;
end;
local _ = function(v18, v19, _, _) --[[ Line: 53 ]] --[[ Name: handleHoldInput ]]
    if v19.KeyCode == Enum.KeyCode.ButtonA then
        v2.setThrottle(v18, 0);
    end;
end;
v3.inputBeganCallback = function(v23, v24, v25) --[[ Line: 59 ]] --[[ Name: inputBeganCallback ]]
    if v25 then

    end;
    if v24.KeyCode ~= Enum.KeyCode.ButtonA then
        return;
    elseif not v23._jetpack then
        return;
    else
        local l_Character_1 = l_LocalPlayer_0.Character;
        local v27 = __2021_if(function() return not l_Character_1 end, function() return nil end, function() return l_Character_1:FindFirstChild("Humanoid") end);
        if not v27 then
            return;
        else
            local l_v27_State_0 = v27:GetState();
            if l_v27_State_0 == Enum.HumanoidStateType.Freefall or l_v27_State_0 == Enum.HumanoidStateType.Flying then
                v2.setThrottle(v23, 1);
            end;
            return;
        end;
    end;
end;
v3.inputEndedCallback = function(v29, v30, v31) --[[ Line: 83 ]] --[[ Name: inputEndedCallback ]]
    if v31 then

    end;
    if v30.KeyCode == Enum.KeyCode.ButtonA then
        v2.setThrottle(v29, 0);
    end;
end;
v3.inputChangedCallback = function(_, _, _) --[[ Line: 89 ]] --[[ Name: inputChangedCallback ]]

end;
__2021_freeze(v3);
return v3;