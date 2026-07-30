-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_BaseController_0 = require(script.Parent:WaitForChild("BaseController"));
local v1 = {};
v1.__index = v1;
setmetatable(v1, l_BaseController_0);
v1.new = function() --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: l_BaseController_0 (copy), v1 (copy)
    return (setmetatable(l_BaseController_0.new(), v1));
end;
v1.Enable = function(v2) --[[ Line: 25 ]] --[[ Name: Enable ]]
    -- upvalues: l_BaseController_0 (copy)
    l_BaseController_0.Enable(v2);
    v2.JoystickState = {
        Thumbstick = Enum.KeyCode.Thumbstick2
    };
end;
v1.Disable = function(v3) --[[ Line: 33 ]] --[[ Name: Disable ]]
    -- upvalues: l_BaseController_0 (copy)
    l_BaseController_0.Disable(v3);
    v3.JoystickState = nil;
end;
v1.UpdateCharacter = function(v4) --[[ Line: 41 ]] --[[ Name: UpdateCharacter ]]
    -- upvalues: l_BaseController_0 (copy)
    l_BaseController_0.UpdateCharacter(v4);
    if not v4.Character then
        return;
    else
        local l_v4_JoystickState_0, _, v7 = v4:GetJoystickState(v4.JoystickState);
        v4:UpdateRotating(Enum.UserCFrame.RightHand, l_v4_JoystickState_0, v7);
        return;
    end;
end;
return v1;