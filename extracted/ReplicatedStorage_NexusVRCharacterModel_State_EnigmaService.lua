-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent;
local l_Enigma_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("Enigma"));
local l_Head_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Head"));
local v8 = {};
v8.__index = v8;
local v9 = nil;
v8.new = function() --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        Offsets = {}
    }, v8));
end;
v8.GetInstance = function() --[[ Line: 45 ]] --[[ Name: GetInstance ]]
    -- upvalues: v9 (ref), v8 (copy)
    if not v9 then
        v9 = v8.new();
    end;
    return v9;
end;
v8.GetCFrames = function(v10, v11) --[[ Line: 55 ]] --[[ Name: GetCFrames ]]
    -- upvalues: l_Enigma_0 (copy), l_UserInputService_0 (copy)
    if not l_Enigma_0.Enabled then
        return {};
    else
        local v12 = v11.Parts.Head.CFrame * v11.Head:GetEyesOffset() * l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse();
        local l_l_Enigma_0_UserCFrame_0 = l_Enigma_0:GetUserCFrame("LeftFoot");
        local l_l_Enigma_0_UserCFrame_1 = l_Enigma_0:GetUserCFrame("RightFoot");
        local v15 = {};
        if l_l_Enigma_0_UserCFrame_0 and v10.Offsets.LeftFoot then
            v15.LeftFoot = v12 * l_l_Enigma_0_UserCFrame_0 * v10.Offsets.LeftFoot;
        end;
        if l_l_Enigma_0_UserCFrame_1 and v10.Offsets.RightFoot then
            v15.RightFoot = v12 * l_l_Enigma_0_UserCFrame_1 * v10.Offsets.RightFoot;
        end;
        return v15;
    end;
end;
v8.Calibrate = function(v16, v17) --[[ Line: 75 ]] --[[ Name: Calibrate ]]
    -- upvalues: l_Enigma_0 (copy), l_Workspace_0 (copy), l_UserInputService_0 (copy), l_Head_0 (copy)
    if not l_Enigma_0.Enabled then
        return;
    else
        local l_l_Enigma_0_UserCFrame_2 = l_Enigma_0:GetUserCFrame("LeftFoot");
        local l_l_Enigma_0_UserCFrame_3 = l_Enigma_0:GetUserCFrame("RightFoot");
        if not l_l_Enigma_0_UserCFrame_2 and not l_l_Enigma_0_UserCFrame_3 then
            return;
        else
            local l_Attachments_0 = v17.Attachments;
            local l_RenderCFrame_0 = l_Workspace_0.CurrentCamera:GetRenderCFrame();
            local v22 = l_RenderCFrame_0 * l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse();
            local v23 = v22 * l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Floor);
            local v24 = l_Head_0.new(v17.Parts.Head);
            local v25 = v24:GetNeckCFrame((v24:GetHeadCFrame(l_RenderCFrame_0))) * l_Attachments_0.UpperTorso.NeckRigAttachment.CFrame:Inverse() * l_Attachments_0.UpperTorso.WaistRigAttachment.CFrame * l_Attachments_0.LowerTorso.WaistRigAttachment.CFrame:Inverse();
            if l_l_Enigma_0_UserCFrame_2 then
                local v26 = v22 * l_l_Enigma_0_UserCFrame_2;
                local v27 = v25 * l_Attachments_0.LowerTorso.LeftHipRigAttachment.CFrame * l_Attachments_0.LeftUpperLeg.LeftHipRigAttachment.CFrame:Inverse() * l_Attachments_0.LeftUpperLeg.LeftKneeRigAttachment.CFrame * l_Attachments_0.LeftLowerLeg.LeftKneeRigAttachment.CFrame:Inverse() * l_Attachments_0.LeftLowerLeg.LeftAnkleRigAttachment.CFrame * l_Attachments_0.LeftFoot.LeftAnkleRigAttachment.CFrame:Inverse();
                local v28 = v27 * l_Attachments_0.LeftFoot.LeftFootAttachment.CFrame;
                v27 = CFrame.new(0, v23.Y - v28.Y, 0) * v27;
                v16.Offsets.LeftFoot = v26:Inverse() * v27;
            end;
            if l_l_Enigma_0_UserCFrame_3 then
                local v29 = v22 * l_l_Enigma_0_UserCFrame_3;
                local v30 = v25 * l_Attachments_0.LowerTorso.RightHipRigAttachment.CFrame * l_Attachments_0.RightUpperLeg.RightHipRigAttachment.CFrame:Inverse() * l_Attachments_0.RightUpperLeg.RightKneeRigAttachment.CFrame * l_Attachments_0.RightLowerLeg.RightKneeRigAttachment.CFrame:Inverse() * l_Attachments_0.RightLowerLeg.RightAnkleRigAttachment.CFrame * l_Attachments_0.RightFoot.RightAnkleRigAttachment.CFrame:Inverse();
                local v31 = v30 * l_Attachments_0.RightFoot.RightFootAttachment.CFrame;
                v30 = CFrame.new(0, v23.Y - v31.Y, 0) * v30;
                v16.Offsets.RightFoot = v29:Inverse() * v30;
            end;
            return;
        end;
    end;
end;
v8.Enable = function(_) --[[ Line: 113 ]] --[[ Name: Enable ]]
    -- upvalues: l_Enigma_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), l_Players_0 (copy), l_Workspace_0 (copy), l_VRService_0 (copy)
    l_Enigma_0:Enable();
    local v33 = Vector3.new(0, 0, 0, 0);
    local v34 = false;
    l_UserInputService_0.InputBegan:Connect(function(v35) --[[ Line: 121 ]]
        -- upvalues: v34 (ref)
        if v35.KeyCode == Enum.KeyCode.ButtonA then
            v34 = true;
        end;
    end);
    l_UserInputService_0.InputChanged:Connect(function(v36) --[[ Line: 126 ]]
        -- upvalues: v33 (ref)
        if v36.KeyCode == Enum.KeyCode.Thumbstick1 then
            if v36.Position.Magnitude > 0.2 then
                v33 = v36.Position;
                return;
            else
                v33 = Vector3.new(0, 0, 0, 0);
            end;
        end;
    end);
    l_UserInputService_0.InputEnded:Connect(function(v37) --[[ Line: 135 ]]
        -- upvalues: v33 (ref), v34 (ref)
        if v37.KeyCode == Enum.KeyCode.Thumbstick1 then
            v33 = Vector3.new(0, 0, 0, 0);
            return;
        else
            if v37.KeyCode == Enum.KeyCode.ButtonA then
                v34 = false;
            end;
            return;
        end;
    end);
    l_RunService_0:BindToRenderStep("EnigmaCustomMovement", Enum.RenderPriority.Input.Value + 1, function() --[[ Line: 143 ]]
        -- upvalues: l_Enigma_0 (ref), l_Players_0 (ref), l_Workspace_0 (ref), v33 (ref), l_VRService_0 (ref), v34 (ref)
        if not l_Enigma_0:IsActive() then
            return;
        else
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            if not l_Character_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
                if not l_Humanoid_0 or l_Humanoid_0.Health <= 0 then
                    return;
                else
                    local l_RenderCFrame_1 = l_Workspace_0.CurrentCamera:GetRenderCFrame();
                    local l_Position_0 = (CFrame.new(-l_RenderCFrame_1.Position) * l_RenderCFrame_1 * CFrame.new(v33.X, 0, -v33.Y)).Position;
                    if l_Position_0.Magnitude > 0.01 or not l_VRService_0.AvatarGestures then
                        l_Players_0.LocalPlayer:Move(l_Position_0, false);
                    end;
                    if v34 then
                        l_Humanoid_0.Jump = true;
                    end;
                    return;
                end;
            end;
        end;
    end);
end;
return v8;