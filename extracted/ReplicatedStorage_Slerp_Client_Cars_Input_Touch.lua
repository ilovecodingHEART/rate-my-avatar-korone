-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_MobileGui_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("MobileGui");
local v2 = l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule", 5);
local v3 = nil;
if not v2 then
    warn("PlayerModule not found. Mobile controls are disabled");
else
    v3 = require(v2);
end;
local l_Car_0 = l_MobileGui_0.Buttons:WaitForChild("Car");
local l_Drift_0 = l_Car_0:WaitForChild("Drift");
local l_MakeUpright_0 = l_Car_0:WaitForChild("MakeUpright");
local l_ToggleLights_0 = l_Car_0:WaitForChild("ToggleLights");
local l_Parent_0 = script.Parent;
local v9 = require(l_Parent_0.Shared);
local v28 = {
    new = function(v10) --[[ Line: 17 ]] --[[ Name: new ]]
        -- upvalues: l_Drift_0 (copy), v9 (copy), l_MakeUpright_0 (copy), l_ToggleLights_0 (copy)
        return {
            driftButtonDown = l_Drift_0.MouseButton1Down:Connect(function() --[[ Line: 20 ]]
                -- upvalues: v9 (ref), v10 (copy)
                v9.setHandbrakeIsEngaged(v10, true);
            end), 
            driftButtonUp = l_Drift_0.MouseButton1Up:Connect(function() --[[ Line: 24 ]]
                -- upvalues: v9 (ref), v10 (copy)
                v9.setHandbrakeIsEngaged(v10, false);
            end), 
            makeUprightPressed = l_MakeUpright_0.MouseButton1Click:Connect(function() --[[ Line: 28 ]]
                -- upvalues: v9 (ref), v10 (copy)
                v9.flip(v10);
            end), 
            lightTogglePressed = l_ToggleLights_0.MouseButton1Click:Connect(function() --[[ Line: 32 ]]
                -- upvalues: v9 (ref), v10 (copy)
                v9.toggleLights(v10);
            end)
        };
    end, 
    destroy = function(v11) --[[ Line: 38 ]] --[[ Name: destroy ]]
        -- upvalues: l_Car_0 (copy)
        l_Car_0.Visible = false;
        v11.driftButtonUp:Disconnect();
        v11.driftButtonDown:Disconnect();
        v11.makeUprightPressed:Disconnect();
        v11.lightTogglePressed:Disconnect();
    end, 
    is = function(v12, _) --[[ Line: 46 ]] --[[ Name: is ]]
        -- upvalues: l_MobileGui_0 (copy)
        if v12.UserInputType == Enum.UserInputType.Touch then
            l_MobileGui_0.Enabled = true;
            return true;
        else
            return false;
        end;
    end, 
    onCarEntered = function(_) --[[ Line: 55 ]] --[[ Name: onCarEntered ]]
        -- upvalues: l_Car_0 (copy)
        l_Car_0.Visible = true;
    end, 
    onCarExited = function(_) --[[ Line: 59 ]] --[[ Name: onCarExited ]]
        -- upvalues: l_Car_0 (copy)
        l_Car_0.Visible = false;
    end, 
    inputBeganCallback = function(_, _, _) --[[ Line: 63 ]] --[[ Name: inputBeganCallback ]]

    end, 
    inputEndedCallback = function(v19, _, _) --[[ Line: 66 ]] --[[ Name: inputEndedCallback ]]
        -- upvalues: v9 (copy)
        v9.setSteer(v19, 0);
        v9.setThrottle(v19, 0);
    end, 
    inputChangedCallback = function(v22, _, _) --[[ Line: 71 ]] --[[ Name: inputChangedCallback ]]
        -- upvalues: v3 (ref), v9 (copy)
        local l_MoveVector_0 = v3:GetControls():GetMoveVector();
        local l_X_0 = l_MoveVector_0.X;
        local l_Z_0 = l_MoveVector_0.Z;
        v9.setSteer(v22, -l_X_0);
        v9.setThrottle(v22, -l_Z_0);
    end
};
table.freeze(v28);
return v28;