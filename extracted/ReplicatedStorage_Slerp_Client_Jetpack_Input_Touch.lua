-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Shared);
local v5 = {};
local function _(v6) --[[ Line: 18 ]] --[[ Name: getHumanoid ]]
    local l_Character_0 = v6.Character;
    if not l_Character_0 then
        return;
    else
        return (l_Character_0:FindFirstChild("Humanoid"));
    end;
end;
v5.new = function(v9) --[[ Line: 26 ]] --[[ Name: new ]]
    local v13 = l_UserInputService_0.JumpRequest:Connect(function() --[[ Line: 27 ]]
        local l_Character_1 = l_LocalPlayer_0.Character;
        local v11 = if not l_Character_1 then nil else l_Character_1:FindFirstChild("Humanoid");
        if not v11 then
            return;
        else
            local l_v11_State_0 = v11:GetState();
            if l_v11_State_0 == Enum.HumanoidStateType.Freefall or l_v11_State_0 == Enum.HumanoidStateType.Flying then
                v4.setThrottle(v9, 1);
            end;
            return;
        end;
    end);
    return {
        throttle = 0, 
        jumpRequest = v13
    };
end;
v5.destroy = function(v14) --[[ Line: 45 ]] --[[ Name: destroy ]]
    if v14.jumpRequest then
        v14.jumpRequest:Disconnect();
    end;
end;
v5.is = function(v15, _) --[[ Line: 51 ]] --[[ Name: is ]]
    if v15.UserInputType == Enum.UserInputType.Touch then
        return true;
    else
        return false;
    end;
end;
local _ = function(v17, _, _, _) --[[ Line: 58 ]] --[[ Name: handleHoldInput ]]
    v4.setThrottle(v17, 0);
end;
v5.inputBeganCallback = function(v22, v23, v24) --[[ Line: 62 ]] --[[ Name: inputBeganCallback ]]
    if v24 then
        return;
    elseif v23.KeyCode ~= Enum.KeyCode.Space then
        return;
    elseif not v22._jetpack then
        return;
    else
        local l_Character_2 = l_LocalPlayer_0.Character;
        local v26 = if not l_Character_2 then nil else l_Character_2:FindFirstChild("Humanoid");
        if not v26 then
            return;
        else
            local l_v26_State_0 = v26:GetState();
            if l_v26_State_0 == Enum.HumanoidStateType.Freefall or l_v26_State_0 == Enum.HumanoidStateType.Flying then
                v4.setThrottle(v22, 1);
            end;
            return;
        end;
    end;
end;
v5.inputEndedCallback = function(v28, _, v30) --[[ Line: 86 ]] --[[ Name: inputEndedCallback ]]
    if v30 then

    end;
    v4.setThrottle(v28, 0);
end;
v5.inputChangedCallback = function(_, _, _) --[[ Line: 92 ]] --[[ Name: inputChangedCallback ]]

end;
table.freeze(v5);
return v5;