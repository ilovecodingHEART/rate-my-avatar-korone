-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = TweenInfo.new(0.25, Enum.EasingStyle.Quad);
local v1 = {
    [Enum.UserCFrame.LeftHand] = Enum.KeyCode.Thumbstick1, 
    [Enum.UserCFrame.RightHand] = Enum.KeyCode.Thumbstick2
};
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Api_0 = require(l_Parent_0).Api;
local _ = require(l_Parent_0:WaitForChild("Character"));
local v11 = require(l_Parent_0:WaitForChild("State"):WaitForChild("CameraService")).GetInstance();
local v12 = require(l_Parent_0:WaitForChild("State"):WaitForChild("CharacterService")).GetInstance();
local v13 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v14 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
local v15 = {};
v15.__index = v15;
local function _(v16) --[[ Line: 48 ]] --[[ Name: GetAngleToGlobalY ]]
    return (math.atan2(-v16.LookVector.X, -v16.LookVector.Z));
end;
v15.new = function() --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    return (setmetatable({
        Active = false, 
        ActionsToLock = {
            Enum.KeyCode.ButtonR3
        }
    }, v15));
end;
v15.UpdateCharacterReference = function(v18) --[[ Line: 65 ]] --[[ Name: UpdateCharacterReference ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    local l_Character_1 = v18.Character;
    v18.Character = v12:GetCharacter(l_Players_0.LocalPlayer);
    if not v18.Character then
        return false;
    else
        return l_Character_1 ~= v18.Character;
    end;
end;
v15.Enable = function(v20) --[[ Line: 77 ]] --[[ Name: Enable ]]
    -- upvalues: l_HttpService_0 (copy), l_ContextActionService_0 (copy), v14 (copy)
    if not v20.Connections then
        v20.Connections = {};
    end;
    v20.Active = true;
    if not v20.ActionsToUnbind then
        v20.ActionsToUnbind = {};
    end;
    for _, v22 in v20.ActionsToLock do
        local v23 = l_HttpService_0:GenerateGUID();
        l_ContextActionService_0:BindActionAtPriority(v23, function() --[[ Line: 85 ]]
            -- upvalues: v20 (copy)
            return v20.Active and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass;
        end, false, Enum.ContextActionPriority.High.Value, v22);
        table.insert(v20.ActionsToUnbind, v23);
    end;
    v20:UpdateCharacterReference();
    if not v20.Character then
        return;
    else
        local l_Connections_0 = v20.Connections;
        table.insert(l_Connections_0, (v14.EyeLevelSet:Connect(function() --[[ Line: 99 ]]
            -- upvalues: v20 (copy)
            local l_LastHeadCFrame_0 = v20.LastHeadCFrame;
            if l_LastHeadCFrame_0 and l_LastHeadCFrame_0.Y > 0 then
                v20.LastHeadCFrame = CFrame.new(0, -l_LastHeadCFrame_0.Y, 0) * l_LastHeadCFrame_0;
            end;
        end)));
        table.insert(l_Connections_0, v20.Character.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 107 ]]
            -- upvalues: v20 (copy), v14 (ref)
            if v20.Character:GetHumanoidSeatPart() then
                v20:PlayBlur();
                v14:Recenter();
            end;
        end));
        v20.Character.Humanoid.AutoRotate = false;
        return;
    end;
end;
v15.Disable = function(v26) --[[ Line: 122 ]] --[[ Name: Disable ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v26.Active = false;
    v26.Character = nil;
    v26.LastHeadCFrame = nil;
    v26.LastRotationUpdateTick = nil;
    if v26.Connections then
        for _, v28 in v26.Connections do
            v28:Disconnect();
        end;
    end;
    if v26.ActionsToUnbind then
        for _, v30 in v26.ActionsToUnbind do
            l_ContextActionService_0:UnbindAction(v30);
        end;
    end;
    v26.Connections = nil;
end;
v15.ScaleInput = function(v31, v32) --[[ Line: 144 ]] --[[ Name: ScaleInput ]]
    if not v31.Character or not v32 then
        return v32;
    else
        return CFrame.new(v32.Position * (v31.Character:GetHumanoidScale("BodyHeightScale") - 1)) * v32;
    end;
end;
v15.GetJoystickState = function(_, v34) --[[ Line: 159 ]] --[[ Name: GetJoystickState ]]
    -- upvalues: v14 (copy)
    local l_v14_ThumbstickPosition_0 = v14:GetThumbstickPosition(v34.Thumbstick);
    local v36 = (l_v14_ThumbstickPosition_0.X ^ 2 + l_v14_ThumbstickPosition_0.Y ^ 2) ^ 0.5;
    local v37 = math.atan2(l_v14_ThumbstickPosition_0.X, l_v14_ThumbstickPosition_0.Y);
    local v38 = nil;
    local v39 = nil;
    if v37 >= -2.356194490192345 and v37 <= -0.7853981633974483 then
        v38 = "Left";
    elseif v37 >= -0.7853981633974483 and v37 <= 0.7853981633974483 then
        v38 = "Forward";
    elseif v37 >= 0.7853981633974483 and v37 <= 2.356194490192345 then
        v38 = "Right";
    end;
    v39 = v36 >= 0.6 and "Extended" or v36 <= 0.4 and "Released" or "InBetween";
    local v40 = nil;
    if v39 == "Released" then
        if v34.RadiusState == "Extended" then
            v40 = "Released";
        end;
        v34.RadiusState = "Released";
        v34.DirectionState = nil;
        return v38, v39, v40;
    else
        if v39 == "Extended" then
            if v34.RadiusState == nil or v34.RadiusState == "Released" then
                if v34.RadiusState ~= "Extended" then
                    v40 = "Extended";
                end;
                v34.RadiusState = "Extended";
                v34.DirectionState = v38;
                return v38, v39, v40;
            elseif v34.DirectionState ~= v38 then
                if v34.RadiusState ~= "Cancelled" then
                    v40 = "Cancel";
                end;
                v34.RadiusState = "Cancelled";
                v34.DirectionState = nil;
            end;
        end;
        return v38, v39, v40;
    end;
end;
v15.PlayBlur = function(_) --[[ Line: 211 ]] --[[ Name: PlayBlur ]]
    -- upvalues: v13 (copy), l_TweenService_0 (copy), v0 (copy)
    local l_v13_Setting_0 = v13:GetSetting("Movement.SnapTeleportBlur");
    if l_v13_Setting_0 == nil then
        l_v13_Setting_0 = true;
    end;
    if not l_v13_Setting_0 then
        return;
    else
        local l_BlurEffect_0 = Instance.new("BlurEffect");
        l_BlurEffect_0.Parent = workspace.CurrentCamera;
        l_BlurEffect_0.Size = 56;
        local v44 = l_TweenService_0:Create(l_BlurEffect_0, v0, {
            Size = 0
        });
        v44:Play();
        v44.Completed:Connect(function() --[[ Line: 226 ]]
            -- upvalues: l_BlurEffect_0 (copy)
            l_BlurEffect_0:Destroy();
        end);
        return;
    end;
end;
v15.UpdateCharacter = function(v45) --[[ Line: 234 ]] --[[ Name: UpdateCharacter ]]
    -- upvalues: v14 (copy), l_Workspace_0 (copy), v11 (copy)
    local v46 = v45:UpdateCharacterReference();
    if not v45.Character then
        return;
    else
        if v46 then
            v45:Enable();
        end;
        local l_v14_VRInputs_0 = v14:GetVRInputs();
        local v48 = v45:ScaleInput(l_v14_VRInputs_0[Enum.UserCFrame.Head]);
        local v49 = v45:ScaleInput(l_v14_VRInputs_0[Enum.UserCFrame.LeftHand]);
        local v50 = v45:ScaleInput(l_v14_VRInputs_0[Enum.UserCFrame.RightHand]);
        local v51 = v48:Inverse() * v49;
        local v52 = v48:Inverse() * v50;
        if not v45.Character:GetHumanoidSeatPart() then
            if v45.LastHeadCFrame then
                local v53 = v45.Character.Parts.HumanoidRootPart.CFrame * v45.Character.Attachments.HumanoidRootPart.RootRigAttachment.CFrame * CFrame.new(0, -v45.Character.Motors.Root.Transform.Position.Y, 0) * v45.Character.Motors.Root.Transform * v45.Character.Attachments.LowerTorso.RootRigAttachment.CFrame:Inverse() * v45.Character.Attachments.LowerTorso.WaistRigAttachment.CFrame * v45.Character.Motors.Waist.Transform * v45.Character.Attachments.UpperTorso.WaistRigAttachment.CFrame:Inverse() * v45.Character.Attachments.UpperTorso.NeckRigAttachment.CFrame * v45.Character.Motors.Neck.Transform * v45.Character.Attachments.Head.NeckRigAttachment.CFrame:Inverse();
                local l_EyesOffset_0 = v45.Character.Head:GetEyesOffset();
                local v55 = v53 * l_EyesOffset_0;
                local v56 = v45.LastHeadCFrame:Inverse() * v48;
                if v48.UpVector.Y < 0 then
                    v56 = CFrame.Angles(0, 3.141592653589793, 0) * v56;
                end;
                local v57 = (CFrame.new(v48.Position) * CFrame.Angles(0, math.atan2(-v48.LookVector.X, -v48.LookVector.Z), 0)):Inverse() * v48;
                local l_LastHeadCFrame_1 = v45.LastHeadCFrame;
                local v59 = math.atan2(-l_LastHeadCFrame_1.LookVector.X, -l_LastHeadCFrame_1.LookVector.Z);
                l_LastHeadCFrame_1 = math.atan2(-v48.LookVector.X, -v48.LookVector.Z);
                local v60 = CFrame.new(0, (CFrame.new(0, l_EyesOffset_0.Y, 0) * (v48 * l_EyesOffset_0:Inverse())).Y, 0);
                local v61 = math.atan2(-v55.LookVector.X, -v55.LookVector.Z);
                local v62 = CFrame.Angles(0, v61 + (l_LastHeadCFrame_1 - v59), 0);
                local l_Position_0 = (v60 * CFrame.new((v62 * CFrame.new(v56.X, 0, v56.Z)).Position) * v55).Position;
                local v64 = CFrame.new(l_Position_0) * v62 * v57;
                v45.Character:UpdateFromInputs(v64, v64 * v51, v64 * v52);
            end;
        else
            v45.Character:UpdateFromInputsSeated(v48, v48 * v51, v48 * v52);
        end;
        if v45.Character.Parts.HumanoidRootPart:IsDescendantOf(l_Workspace_0) and v45.Character.Humanoid.Health > 0 then
            local v65 = v45.Character.Parts.HumanoidRootPart.CFrame * v45.Character.Attachments.HumanoidRootPart.RootRigAttachment.CFrame * v45.Character.Motors.Root.Transform * v45.Character.Attachments.LowerTorso.RootRigAttachment.CFrame:Inverse() * v45.Character.Attachments.LowerTorso.WaistRigAttachment.CFrame * v45.Character.Motors.Waist.Transform * v45.Character.Attachments.UpperTorso.WaistRigAttachment.CFrame:Inverse() * v45.Character.Attachments.UpperTorso.NeckRigAttachment.CFrame * v45.Character.Motors.Neck.Transform * v45.Character.Attachments.Head.NeckRigAttachment.CFrame:Inverse();
            v11:UpdateCamera(v65 * v45.Character.Head:GetEyesOffset());
            v45.LastHeadCFrame = v48;
            return;
        else
            if not l_Workspace_0.CurrentCamera.HeadLocked then
                local l_RenderCFrame_0 = l_Workspace_0.CurrentCamera:GetRenderCFrame();
                local v67 = v45.LastHeadCFrame or CFrame.new();
                local v68 = v45:ScaleInput(v14:GetVRInputs()[Enum.UserCFrame.Head]);
                v11:UpdateCamera(l_RenderCFrame_0 * v67:Inverse() * v68);
                v45.LastHeadCFrame = v68;
            end;
            return;
        end;
    end;
end;
v15.UpdateRotating = function(v69, v70, v71, v72) --[[ Line: 312 ]] --[[ Name: UpdateRotating ]]
    -- upvalues: l_VRService_0 (copy), l_Api_0 (copy), v14 (copy), v1 (copy)
    if l_VRService_0.AvatarGestures then
        v69.LastRotationUpdateTick = nil;
        return;
    elseif not v69.Character or v69.Character.Humanoid.Sit then
        v69.LastRotationUpdateTick = nil;
        return;
    elseif v71 ~= "Left" and v71 ~= "Right" then
        v69.LastRotationUpdateTick = nil;
        return;
    elseif l_Api_0.Controller and not l_Api_0.Controller:IsControllerInputEnabled(v70) then
        return;
    else
        local l_HumanoidRootPart_0 = v69.Character.Parts.HumanoidRootPart;
        if UserSettings():GetService("UserGameSettings").VRSmoothRotationEnabled then
            local l_v14_ThumbstickPosition_1 = v14:GetThumbstickPosition(v1[v70]);
            if math.abs(l_v14_ThumbstickPosition_1.X) >= 0.2 then
                local v75 = v69.LastRotationUpdateTick or tick();
                local v76 = tick();
                local v77 = v76 - v75;
                l_HumanoidRootPart_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position) * CFrame.Angles(0, -l_v14_ThumbstickPosition_1.X * 6.283185307179586 * v77, 0) * (CFrame.new(-l_HumanoidRootPart_0.Position) * l_HumanoidRootPart_0.CFrame);
                v69.LastRotationUpdateTick = v76;
                return;
            else
                v69.LastRotationUpdateTick = nil;
                return;
            end;
        else
            if v72 == "Extended" then
                if v71 == "Left" then
                    v69:PlayBlur();
                    l_HumanoidRootPart_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position) * CFrame.Angles(0, 0.5235987755982988, 0) * (CFrame.new(-l_HumanoidRootPart_0.Position) * l_HumanoidRootPart_0.CFrame);
                    return;
                elseif v71 == "Right" then
                    v69:PlayBlur();
                    l_HumanoidRootPart_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position) * CFrame.Angles(0, -0.5235987755982988, 0) * (CFrame.new(-l_HumanoidRootPart_0.Position) * l_HumanoidRootPart_0.CFrame);
                end;
            end;
            return;
        end;
    end;
end;
return v15;