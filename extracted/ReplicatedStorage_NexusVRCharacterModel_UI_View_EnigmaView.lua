-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    ["1"] = true, 
    ["2"] = true
};
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Enigma_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("Enigma"));
local l_NexusButton_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusButton"));
local v9 = require(l_Parent_0:WaitForChild("State"):WaitForChild("CharacterService")).GetInstance();
local v10 = require(l_Parent_0:WaitForChild("State"):WaitForChild("EnigmaService")).GetInstance();
local v11 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local _ = require(l_Parent_0:WaitForChild("UI"):WaitForChild("View"):WaitForChild("ApiBaseView"));
local v13 = l_NexusButton_0.TextButtonFactory.CreateDefault(Color3.fromRGB(0, 170, 255));
v13:SetDefault("Theme", "RoundedCorners");
local v14 = {};
v14.__index = v14;
local function _(v15, v16, v17, v18) --[[ Line: 41 ]] --[[ Name: AddColor ]]
    return (("<font color=\"rgb(%*,%*,%*)\">%*</font>"):format(v16, v17, v18, v15));
end;
v14.new = function(v20, v21) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), v11 (copy), v13 (copy), v9 (copy), l_Players_0 (copy), v10 (copy), l_Enigma_0 (copy)
    v20:AddBackground();
    local l_v20_Container_0 = v20:GetContainer();
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0.9, 0, 0.6, 0);
    l_TextLabel_0.Position = UDim2.new(0.05, 0, 0.075, 0);
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.Text = "";
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.TextSize = 28;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
    l_TextLabel_0.Parent = l_v20_Container_0;
    local v24 = setmetatable({
        EnigmaText = l_TextLabel_0
    }, v14);
    if v11:GetSetting("Extra.EnigmaEnabled") == false then
        l_TextLabel_0.Text = "This game has disabled Enigma.";
        return v24;
    else
        local v25, v26 = v13:Create();
        v25.Size = UDim2.new(0.5, 0, 0.075, 0);
        v25.Position = UDim2.new(0.25, 0, 0.775, 0);
        v25.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        v25.Parent = l_v20_Container_0;
        v26.Text = " Show Trackers ";
        v24.ShowTrackersButton = v25;
        v24.DebugTrackersVisible = false;
        local v27 = true;
        v25.MouseButton1Down:Connect(function() --[[ Line: 89 ]]
            -- upvalues: v27 (ref), v24 (copy), v26 (copy)
            if not v27 then
                return;
            else
                v27 = false;
                v24.DebugTrackersVisible = not v24.DebugTrackersVisible;
                if v24.DebugTrackersVisible then
                    task.spawn(function() --[[ Line: 94 ]]
                        -- upvalues: v24 (ref)
                        v24:ShowDebugTrackers();
                    end);
                end;
                v26.Text = v24.DebugTrackersVisible and " Hide Trackers" or " Show Trackers ";
                task.wait();
                v27 = true;
                return;
            end;
        end);
        local v28, v29 = v13:Create();
        v28.Size = UDim2.new(0.5, 0, 0.075, 0);
        v28.Position = UDim2.new(0.25, 0, 0.875, 0);
        v28.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        v28.Parent = l_v20_Container_0;
        v29.Text = " Calibrate Trackers ";
        v24.CalibrateButton = v28;
        v28.MouseButton1Down:Connect(function() --[[ Line: 111 ]]
            -- upvalues: v27 (ref), v9 (ref), l_Players_0 (ref), v10 (ref)
            if not v27 then
                return;
            else
                v27 = false;
                local l_v9_Character_0 = v9:GetCharacter(l_Players_0.LocalPlayer);
                if l_v9_Character_0 then
                    v10:Calibrate(l_v9_Character_0);
                end;
                task.wait();
                v27 = true;
                return;
            end;
        end);
        v24:UpdateText();
        task.spawn(function() --[[ Line: 124 ]]
            -- upvalues: v24 (copy)
            while true do
                v24:UpdateText();
                task.wait(0.1);
            end;
        end);
        task.spawn(function() --[[ Line: 132 ]]
            -- upvalues: l_Enigma_0 (ref), v10 (ref), v21 (copy), v20 (copy), v24 (copy)
            local v31 = {
                LeftFoot = false, 
                RightFoot = false
            };
            while true do
                local v32 = true;
                local v33 = {};
                for v34, v35 in v31 do
                    if not v35 then
                        if not v35 then
                            v32 = false;
                        end;
                        if l_Enigma_0.Enabled and l_Enigma_0:GetUserCFrameEnabled(v34) and not v10.Offsets[v34] then
                            table.insert(v33, v34);
                        end;
                    end;
                end;
                for _, v37 in v33 do
                    v31[v37] = true;
                end;
                if #v33 > 0 then
                    v21:UpdateVisibleView(v20.Name);
                    v21:Toggle(true);
                    v24:UpdateText();
                end;
                if not v32 then
                    task.wait();
                else
                    break;
                end;
            end;
        end);
        return v24;
    end;
end;
v14.UpdateText = function(v38) --[[ Line: 174 ]] --[[ Name: UpdateText ]]
    -- upvalues: l_Enigma_0 (copy), v10 (copy), l_UserInputService_0 (copy), v0 (copy)
    local v39 = "";
    local v40 = l_Enigma_0.Enabled and l_Enigma_0:GetUserCFrameEnabled("LeftFoot");
    local v41 = l_Enigma_0.Enabled and l_Enigma_0:GetUserCFrameEnabled("RightFoot");
    v39 = if v40 then if v10.Offsets.LeftFoot then ("%*Left Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Active</font>"):format(0, 200, 0))) else ("%*Left Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Requires Calibration</font>"):format(200, 150, 0))) else ("%*Left Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Inactive</font>"):format(200, 0, 0)));
    v39 = if v41 then if v10.Offsets.RightFoot then ("%*\nRight Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Active</font>"):format(0, 200, 0))) else ("%*\nRight Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Requires Calibration</font>"):format(200, 150, 0))) else ("%*\nRight Foot Tracker: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Inactive</font>"):format(200, 0, 0)));
    if l_Enigma_0:IsActive() then
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if not l_l_UserInputService_0_FocusedTextBox_0 or l_l_UserInputService_0_FocusedTextBox_0.Parent and l_l_UserInputService_0_FocusedTextBox_0.Parent.Name == "EnigmaTextBoxInput" then
            v39 = ("%*\nData transfer: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Active</font>"):format(0, 200, 0)));
            if l_Enigma_0.Input then
                local v43 = string.split(l_Enigma_0.Input:GetCurrentText(), "|")[1];
                v39 = if v0[v43] then ("%*\n\nProtocol version: %*"):format(v39, v43) else ("%*\n\nProtocol version: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">%*</font>"):format(200, 150, 0, (("%* (Unsupported)"):format(v43)))));
            end;
        else
            v39 = ("%*\nData transfer: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Inactive</font>"):format(200, 0, 0)));
        end;
        v39 = if not (not not v40 or v41) and l_Enigma_0:GetUserCFrameEnabled("None") then ("%*\n\n\226\154\160\239\184\143 Trackers are detected, but the role in SteamVR is \"None\". They need to have assigned roles through the SteamVR menu."):format(v39) else ("%*\n\nTo calibrate, stand up straight with your head level and facing forward with your feet next to each other pointing forward."):format(v39);
        if v38.ShowTrackersButton then
            v38.ShowTrackersButton.Visible = true;
        end;
        if v38.CalibrateButton then
            v38.CalibrateButton.Visible = true;
        end;
    else
        v39 = ("%*\n\n\226\154\160\239\184\143 Enigma requires a desktop application. There may be experience-specific issues when Enigma is active."):format((("%*\nData transfer: %*"):format(v39, (("<font color=\"rgb(%*,%*,%*)\">Inactive</font>"):format(200, 150, 0)))));
        if v38.ShowTrackersButton then
            v38.ShowTrackersButton.Visible = false;
        end;
        if v38.CalibrateButton then
            v38.CalibrateButton.Visible = false;
        end;
    end;
    v38.EnigmaText.Text = v39;
end;
v14.ShowDebugTrackers = function(v44) --[[ Line: 242 ]] --[[ Name: ShowDebugTrackers ]]
    -- upvalues: l_Enigma_0 (copy), l_Workspace_0 (copy), l_VRService_0 (copy), l_RunService_0 (copy)
    if not l_Enigma_0.Enabled then
        return;
    else
        local v45 = {};
        local v46 = {};
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "NexusVRCharacterModelEnigmaDebugTrackers";
        l_Folder_0.Parent = l_Workspace_0.CurrentCamera;
        while v44.DebugTrackersVisible do
            local v48 = {};
            local v49 = 0;
            local v50 = l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse();
            for _, v52 in l_Enigma_0.TrackerRoles do
                local v53 = 1;
                while l_Enigma_0:GetUserCFrameEnabled(v52, v53) do
                    v48[v53 == 1 and v52 or ("%* (%*)"):format(v52, v53)] = v50 * l_Enigma_0:GetUserCFrame(v52, v53);
                    v49 = v49 + 1;
                    v53 = v53 + 1;
                end;
            end;
            local v54 = 1;
            for v55, v56 in v48 do
                if not v45[v54] then
                    local l_Part_0 = Instance.new("Part");
                    l_Part_0.BrickColor = BrickColor.new("Institutional white");
                    l_Part_0.Material = Enum.Material.Neon;
                    l_Part_0.Anchored = true;
                    l_Part_0.CanCollide = false;
                    l_Part_0.CanTouch = false;
                    l_Part_0.CanQuery = false;
                    l_Part_0.Shape = Enum.PartType.Ball;
                    l_Part_0.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
                    l_Part_0.Parent = l_Folder_0;
                    v45[v54] = l_Part_0;
                    local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
                    l_SphereHandleAdornment_0.Transparency = 0.5;
                    l_SphereHandleAdornment_0.AlwaysOnTop = true;
                    l_SphereHandleAdornment_0.Color3 = Color3.fromRGB(255, 255, 255);
                    l_SphereHandleAdornment_0.ZIndex = 1;
                    l_SphereHandleAdornment_0.Radius = 0.1;
                    l_SphereHandleAdornment_0.Adornee = l_Part_0;
                    l_SphereHandleAdornment_0.Parent = l_Part_0;
                    local l_BillboardGui_0 = Instance.new("BillboardGui");
                    l_BillboardGui_0.AlwaysOnTop = true;
                    l_BillboardGui_0.Adornee = l_Part_0;
                    l_BillboardGui_0.Size = UDim2.new(2, 0, 0.4, 0);
                    l_BillboardGui_0.StudsOffset = Vector3.new(0, 0.30000001192092896, 0, 0);
                    l_BillboardGui_0.Parent = l_Part_0;
                    local l_TextLabel_1 = Instance.new("TextLabel");
                    l_TextLabel_1.BackgroundTransparency = 1;
                    l_TextLabel_1.Size = UDim2.new(1, 0, 1, 0);
                    l_TextLabel_1.TextScaled = true;
                    l_TextLabel_1.TextColor3 = Color3.fromRGB(255, 255, 255);
                    l_TextLabel_1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
                    l_TextLabel_1.TextStrokeTransparency = 0;
                    l_TextLabel_1.Parent = l_BillboardGui_0;
                    v46[v54] = l_TextLabel_1;
                end;
                v45[v54].CFrame = v56;
                v46[v54].Text = v55;
                v54 = v54 + 1;
            end;
            for v61 = #v45, v49 + 1, -1 do
                v45[v61]:Destroy();
                v45[v61] = nil;
                v46[v61]:Destroy();
                v46[v61] = nil;
            end;
            l_RunService_0.RenderStepped:Wait();
        end;
        l_Folder_0:Destroy();
        return;
    end;
end;
return v14;