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
    for _, v8 in v5 do
        v6[v8] = true;
    end;
    return v6;
end;
local v10 = {};
for _, v12 in v4 do
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
        local v27 = if not l_Character_1 then nil else l_Character_1:FindFirstChild("Humanoid");
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
table.freeze(v3);
return v3;