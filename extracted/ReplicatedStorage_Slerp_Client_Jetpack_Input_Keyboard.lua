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
        local v18 = if not l_Character_1 then nil else l_Character_1:FindFirstChild("Humanoid");
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
table.freeze(v3);
return v3;