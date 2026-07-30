-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_NexusVRCharacterModel_0 = l_ReplicatedStorage_0:WaitForChild("NexusVRCharacterModel");
local l_NexusBufferedReplication_0 = require(l_NexusVRCharacterModel_0:WaitForChild("Packages"):WaitForChild("NexusBufferedReplication"));
local v9 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("CameraService")).GetInstance();
local v10 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("CharacterService")).GetInstance();
local v11 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("ControlService")).GetInstance();
local v12 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("DefaultCursorService")).GetInstance();
local v13 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("EnigmaService")).GetInstance();
local v14 = require(l_NexusVRCharacterModel_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local l_BufferProtocol_0 = require(l_NexusVRCharacterModel_0:WaitForChild("Util"):WaitForChild("BufferProtocol"));
local l_UpdateInputs_0 = l_NexusVRCharacterModel_0:WaitForChild("UpdateInputs");
local l_ReplicationReady_0 = l_NexusVRCharacterModel_0:WaitForChild("ReplicationReady");
local l_PlayerBufferedRemoteEventReceiver_0 = l_NexusBufferedReplication_0.Receiver.PlayerBufferedRemoteEventReceiver;
local l_BaseScreenGui_0 = require(l_ReplicatedStorage_0:WaitForChild("NexusVRCore")).BaseScreenGui;
if l_BaseScreenGui_0 then
    local l___new_0 = l_BaseScreenGui_0.__new;
    local l_l___new_0_0 = l___new_0 --[[ copy: 21 -> 25 ]];
    l_BaseScreenGui_0.__new = function(...) --[[ Line: 33 ]]
        -- upvalues: l_l___new_0_0 (copy)
        warn("Using the bundled (automically loaded) Nexus VR Core with Nexus VR Character Model is deprecated.\nIt is recommended to move to a fixed version, which can be downloaded from GitHub.");
        return l_l___new_0_0(...);
    end;
end;
v14:SetDefaults(l_HttpService_0:JSONDecode(l_NexusVRCharacterModel_0:WaitForChild("Configuration").Value));
local v22 = {};
l_PlayerBufferedRemoteEventReceiver_0.new(l_UpdateInputs_0, function(v23) --[[ Line: 44 ]]
    -- upvalues: l_BufferProtocol_0 (copy)
    return l_BufferProtocol_0.Deserialize(v23);
end):OnDataReceived(function(v24, v25) --[[ Line: 47 ]]
    -- upvalues: l_Players_0 (copy), v22 (copy), v10 (copy)
    if v24 == l_Players_0.LocalPlayer then
        return;
    else
        local l_UpdateTime_0 = v25.UpdateTime;
        if l_UpdateTime_0 then
            if v22[v24] and l_UpdateTime_0 < v22[v24] then
                return;
            else
                v22[v24] = l_UpdateTime_0;
            end;
        end;
        local l_v10_Character_0 = v10:GetCharacter(v24);
        if l_v10_Character_0 then
            l_v10_Character_0:UpdateFromInputs(v25.HeadCFrame, v25.LeftHandCFrame, v25.RightHandCFrame, v25.CurrentWalkspeed, {
                LeftFoot = v25.LeftFootCFrame, 
                RightFoot = v25.RightFootCFrame
            });
        end;
        return;
    end;
end);
l_Players_0.PlayerRemoving:Connect(function(v28) --[[ Line: 67 ]]
    -- upvalues: v22 (copy)
    v22[v28] = nil;
end);
l_ReplicationReady_0:FireServer();
l_RunService_0.Stepped:Connect(function() --[[ Line: 74 ]]
    -- upvalues: v10 (copy)
    v10:RefreshAllCharacters();
end);
local v29 = false;
l_UserInputService_0.InputBegan:Connect(function(v30) --[[ Line: 80 ]]
    -- upvalues: v29 (ref), l_UserInputService_0 (copy), v14 (copy)
    if not v29 and v30.KeyCode == Enum.KeyCode.F9 and (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl)) and v14:GetSetting("Output.AllowClientToOutputLoadedMessage") ~= false then
        v29 = true;
        print((("Nexus VR Character Model version %* (%*) is loaded."):format(v14:GetSetting("Version.Tag"), (v14:GetSetting("Version.Commit")))));
    end;
end);
while not l_UserInputService_0.VREnabled do
    l_UserInputService_0:GetPropertyChangedSignal("VREnabled"):Wait();
    warn("VR was detected later than when Nexus VR Character Model loaded. This may be a Roblox bug.");
end;
task.spawn(function() --[[ Line: 95 ]]
    -- upvalues: l_StarterGui_0 (copy), v12 (copy)
    for _ = 1, 600 do
        if not pcall(function() --[[ Line: 97 ]]
            -- upvalues: l_StarterGui_0 (ref), v12 (ref)
            l_StarterGui_0:SetCore("VREnableControllerModels", false);
            v12:SetCursorState("Detect");
        end) then
            task.wait(0.1);
        else
            break;
        end;
    end;
end);
local l_Character_0 = l_Players_0.LocalPlayer.Character;
while not l_Character_0 do
    l_Character_0 = l_Players_0.LocalPlayer.CharacterAdded:Wait();
end;
if l_Character_0:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
    require(l_NexusVRCharacterModel_0:WaitForChild("UI"):WaitForChild("R6Message")).new():Open();
    return;
else
    v11:SetActiveController(v14:GetSetting("Movement.DefaultMovementMethod"));
    v9:SetActiveCamera(v14:GetSetting("Camera.DefaultCameraOption"));
    require(l_NexusVRCharacterModel_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance():SetUpOpening();
    if v14:GetSetting("Extra.NexusVRBackpackEnabled") ~= false then
        task.defer(function() --[[ Line: 128 ]]
            -- upvalues: l_ReplicatedStorage_0 (copy)
            require(l_ReplicatedStorage_0:WaitForChild("NexusVRBackpack")):Load();
        end);
    end;
    if v14:GetSetting("Extra.EnigmaEnabled") ~= false then
        v13:Enable();
    end;
    l_RunService_0:BindToRenderStep("NexusVRCharacterModelUpdate", Enum.RenderPriority.Camera.Value - 1, function() --[[ Line: 140 ]]
        -- upvalues: v11 (copy)
        v11:UpdateCharacter();
    end);
    if v14:GetSetting("DisableFadeOutViewOnCollision") == true then
        l_VRService_0.FadeOutViewOnCollision = false;
    end;
    return;
end;