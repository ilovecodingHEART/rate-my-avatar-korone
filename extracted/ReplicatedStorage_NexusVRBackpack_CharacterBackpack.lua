-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    [Enum.KeyCode.ButtonL3] = true, 
    [Enum.KeyCode.ButtonR3] = true
};
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Backpack3D_0 = require(script.Parent:WaitForChild("UI"):WaitForChild("Backpack3D"));
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), l_Backpack3D_0 (copy), l_UserInputService_0 (copy), v0 (copy)
    local v9 = setmetatable({
        Enabled = true, 
        Player = l_Players_0:GetPlayerFromCharacter(v8), 
        KeyCode = Enum.KeyCode.ButtonR3, 
        UserCFrame = Enum.UserCFrame.RightHand, 
        Events = {}
    }, v7);
    local l_Humanoid_0 = v8:FindFirstChildOfClass("Humanoid");
    while not l_Humanoid_0 do
        v8.ChildAdded:Wait();
        l_Humanoid_0 = v8:FindFirstChildOfClass("Humanoid");
    end;
    v9.Humanoid = l_Humanoid_0;
    v9.Backpack = l_Backpack3D_0.new(v9.Player:WaitForChild("PlayerGui"), {
        v8, 
        v9.Player:WaitForChild("Backpack")
    });
    table.insert(v9.Events, l_UserInputService_0.InputBegan:Connect(function(v11, v12) --[[ Line: 58 ]]
        -- upvalues: v9 (copy), v0 (ref)
        if v11.KeyCode ~= v9.KeyCode then
            return;
        elseif v12 and not v0[v11.KeyCode] then
            return;
        elseif #v9.Backpack.Inventory.Tools == 0 then
            return;
        else
            v9:Open();
            return;
        end;
    end));
    table.insert(v9.Events, l_UserInputService_0.InputEnded:Connect(function(v13) --[[ Line: 64 ]]
        -- upvalues: v9 (copy)
        if v13.KeyCode ~= v9.KeyCode then
            return;
        else
            v9:Close();
            return;
        end;
    end));
    table.insert(v9.Events, v9.Humanoid.Died:Connect(function() --[[ Line: 70 ]]
        -- upvalues: v9 (copy)
        v9:Destroy();
    end));
    table.insert(v9.Events, v9.Player.CharacterAdded:Connect(function() --[[ Line: 73 ]]
        -- upvalues: v9 (copy)
        v9:Destroy();
    end));
    table.insert(v9.Events, v9.Player.CharacterRemoving:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v9 (copy)
        v9:Destroy();
    end));
    v9:SetKeyCode(Enum.KeyCode.ButtonR3);
    return v9;
end;
v7.GetBackpackCFrame = function(v14) --[[ Line: 91 ]] --[[ Name: GetBackpackCFrame ]]
    -- upvalues: l_Workspace_0 (copy), l_UserInputService_0 (copy)
    return l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_UserInputService_0:GetUserCFrame(v14.UserCFrame);
end;
v7.GetHandPosition = function(v15) --[[ Line: 98 ]] --[[ Name: GetHandPosition ]]
    return v15:GetBackpackCFrame().Position;
end;
v7.SetKeyCode = function(v16, v17) --[[ Line: 105 ]] --[[ Name: SetKeyCode ]]
    -- upvalues: l_UserInputService_0 (copy)
    v16.KeyCode = v17;
    if l_UserInputService_0:IsKeyDown(v17) then
        v16:Open();
    end;
end;
v7.SetUserCFrame = function(v18, v19) --[[ Line: 115 ]] --[[ Name: SetUserCFrame ]]
    v18.UserCFrame = v19;
end;
v7.Open = function(v20) --[[ Line: 122 ]] --[[ Name: Open ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy), l_RunService_0 (copy)
    if not v20.Enabled then
        return;
    elseif v20.Backpack.Opened then
        return;
    else
        v20.Backpack:Open();
        local l_NexusVRCharacterModelControllerApi_0 = v20.NexusVRCharacterModelControllerApi;
        if l_NexusVRCharacterModelControllerApi_0 then
            l_NexusVRCharacterModelControllerApi_0:DisableControllerInput(v20.UserCFrame);
        end;
        local v22 = (l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse()):Inverse() * v20:GetBackpackCFrame();
        v20.UpdateFocusEvent = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 134 ]]
            -- upvalues: v20 (copy), l_Workspace_0 (ref), l_VRService_0 (ref), v22 (copy)
            v20.Backpack:MoveTo(l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * v22);
            v20.Backpack:UpdateFocusedToolWorldSpace(v20:GetHandPosition());
        end);
        return;
    end;
end;
v7.Close = function(v23) --[[ Line: 143 ]] --[[ Name: Close ]]
    if not v23.Backpack.Opened then
        return;
    else
        if v23.UpdateFocusEvent then
            v23.UpdateFocusEvent:Disconnect();
            v23.UpdateFocusEvent = nil;
        end;
        local l_FocusedTool_0 = v23.Backpack:GetFocusedTool();
        if l_FocusedTool_0 then
            v23.Humanoid:EquipTool(l_FocusedTool_0);
        else
            v23.Humanoid:UnequipTools();
        end;
        v23.Backpack:Close();
        local l_NexusVRCharacterModelControllerApi_1 = v23.NexusVRCharacterModelControllerApi;
        if l_NexusVRCharacterModelControllerApi_1 then
            l_NexusVRCharacterModelControllerApi_1:EnableControllerInput(v23.UserCFrame);
        end;
        return;
    end;
end;
v7.Destroy = function(v26) --[[ Line: 169 ]] --[[ Name: Destroy ]]
    if v26.UpdateFocusEvent then
        v26.UpdateFocusEvent:Disconnect();
        v26.UpdateFocusEvent = nil;
    end;
    for _, v28 in v26.Events do
        v28:Disconnect();
    end;
    v26.Events = {};
    if v26.Backpack.Opened then
        v26.Backpack:Close();
        task.delay(0.1, function() --[[ Line: 183 ]]
            -- upvalues: v26 (copy)
            v26.Backpack:Destroy();
        end);
        return;
    else
        v26.Backpack:Destroy();
        return;
    end;
end;
return v7;