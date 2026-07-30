-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Api_0 = require(l_Parent_0).Api;
local l_BaseController_0 = require(script.Parent:WaitForChild("BaseController"));
local l_ArcWithBeacon_0 = require(script.Parent:WaitForChild("Visual"):WaitForChild("ArcWithBeacon"));
local v5 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
local v6 = {};
v6.__index = v6;
setmetatable(v6, l_BaseController_0);
v6.new = function() --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: l_BaseController_0 (copy), v6 (copy)
    local v7 = setmetatable(l_BaseController_0.new(), v6);
    v7.ActionsToLock = {
        Enum.KeyCode.Thumbstick1, 
        Enum.KeyCode.ButtonR3
    };
    return v7;
end;
v6.Enable = function(v8) --[[ Line: 47 ]] --[[ Name: Enable ]]
    -- upvalues: l_BaseController_0 (copy), l_ArcWithBeacon_0 (copy)
    l_BaseController_0.Enable(v8);
    v8.LeftArc = l_ArcWithBeacon_0.new();
    v8.RightArc = l_ArcWithBeacon_0.new();
    v8.ArcControls = {
        {
            Thumbstick = Enum.KeyCode.Thumbstick1, 
            UserCFrame = Enum.UserCFrame.LeftHand, 
            Arc = v8.LeftArc
        }, 
        {
            Thumbstick = Enum.KeyCode.Thumbstick2, 
            UserCFrame = Enum.UserCFrame.RightHand, 
            Arc = v8.RightArc
        }
    };
end;
v6.Disable = function(v9) --[[ Line: 70 ]] --[[ Name: Disable ]]
    -- upvalues: l_BaseController_0 (copy)
    l_BaseController_0.Disable(v9);
    v9.LeftArc:Destroy();
    v9.RightArc:Destroy();
end;
v6.UpdateCharacter = function(v10) --[[ Line: 81 ]] --[[ Name: UpdateCharacter ]]
    -- upvalues: l_BaseController_0 (copy), v5 (copy), l_Api_0 (copy), l_Workspace_0 (copy)
    l_BaseController_0.UpdateCharacter(v10);
    if not v10.Character then
        return;
    else
        local l_v5_VRInputs_0 = v5:GetVRInputs();
        for _, v13 in Enum.UserCFrame:GetEnumItems() do
            l_v5_VRInputs_0[v13] = v10:ScaleInput(l_v5_VRInputs_0[v13]);
        end;
        local l_HumanoidSeatPart_0 = v10.Character:GetHumanoidSeatPart();
        for _, v16 in pairs(v10.ArcControls) --[[ 2021 ]] do
            if v16.Thumbstick == Enum.KeyCode.Thumbstick1 and l_HumanoidSeatPart_0 and l_HumanoidSeatPart_0:IsA("VehicleSeat") then
                v16.Arc:Hide();
            else
                local v17 = not l_Api_0.Controller or l_Api_0.Controller:IsControllerInputEnabled(v16.UserCFrame);
                local l_v10_JoystickState_0, v19, v20 = v10:GetJoystickState(v16);
                if not v17 then
                    v16.Arc:Hide();
                    v16.WaitForRelease = false;
                    v16.RadiusState = nil;
                else
                    local l_HumanoidRootPart_0 = v10.Character.Parts.HumanoidRootPart;
                    if l_v10_JoystickState_0 ~= "Forward" or v19 == "Released" then
                        v16.Arc:Hide();
                    end;
                    if v20 == "Released" then
                        v16.Arc:Hide();
                        if l_v10_JoystickState_0 == "Forward" then
                            local l_LastHitPart_0 = v16.LastHitPart;
                            if l_LastHitPart_0 and v16.LastHitPosition then
                                local v23 = false;
                                v10:PlayBlur();
                                if l_HumanoidSeatPart_0 then
                                    v23 = true;
                                    v10.IgnoreNextExternalTeleport = true;
                                    v10.Character.Humanoid.Sit = false;
                                end;
                                if (l_LastHitPart_0:IsA("Seat") or l_LastHitPart_0:IsA("VehicleSeat")) and not l_LastHitPart_0.Occupant and not l_LastHitPart_0.Disabled then
                                    if v23 then
                                        task.spawn(function() --[[ Line: 140 ]]
                                            -- upvalues: v10 (copy), l_LastHitPart_0 (copy)
                                            while v10.Character.Humanoid.SeatPart do
                                                task.wait();
                                            end;
                                            l_LastHitPart_0:Sit(v10.Character.Humanoid);
                                        end);
                                    else
                                        l_LastHitPart_0:Sit(v10.Character.Humanoid);
                                    end;
                                elseif v23 then
                                    task.spawn(function() --[[ Line: 151 ]]
                                        -- upvalues: v10 (copy), l_HumanoidRootPart_0 (copy), v16 (copy)
                                        while v10.Character.Humanoid.SeatPart do
                                            task.wait();
                                        end;
                                        l_HumanoidRootPart_0.CFrame = CFrame.new(v16.LastHitPosition) * CFrame.new(0, 4.5 * v10.Character:GetHumanoidScale("BodyHeightScale"), 0) * (CFrame.new(-l_HumanoidRootPart_0.Position) * l_HumanoidRootPart_0.CFrame);
                                    end);
                                else
                                    l_HumanoidRootPart_0.CFrame = CFrame.new(v16.LastHitPosition) * CFrame.new(0, 4.5 * v10.Character:GetHumanoidScale("BodyHeightScale"), 0) * (CFrame.new(-l_HumanoidRootPart_0.Position) * l_HumanoidRootPart_0.CFrame);
                                end;
                            end;
                        end;
                    elseif v20 == "Cancel" then
                        v16.Arc:Hide();
                    elseif l_v10_JoystickState_0 == "Forward" and v19 == "Extended" then
                        local v24, v25 = v16.Arc:Update(l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_v5_VRInputs_0[Enum.UserCFrame.Head]:Inverse() * l_v5_VRInputs_0[v16.UserCFrame]);
                        v16.LastHitPart = v24;
                        v16.LastHitPosition = v25;
                    end;
                    v10:UpdateRotating(v16.UserCFrame, l_v10_JoystickState_0, v20);
                end;
            end;
        end;
        return;
    end;
end;
return v6;