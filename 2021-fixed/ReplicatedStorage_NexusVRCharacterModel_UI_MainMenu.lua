-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x1, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent.Parent;
local l_NexusButton_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusButton"));
local l_NexusVRCore_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusVRCore"));
local v8 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v9 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
local l_ApiBaseView_0 = require(l_Parent_0:WaitForChild("UI"):WaitForChild("View"):WaitForChild("ApiBaseView"));
local l_EnigmaView_0 = require(l_Parent_0:WaitForChild("UI"):WaitForChild("View"):WaitForChild("EnigmaView"));
local l_SettingsView_0 = require(l_Parent_0:WaitForChild("UI"):WaitForChild("View"):WaitForChild("SettingsView"));
local v13 = l_NexusButton_0.TextButtonFactory.CreateDefault(Color3.fromRGB(0, 170, 255));
v13:SetDefault("Theme", "RoundedCorners");
local l_ScreenGui3D_0 = l_NexusVRCore_0.ScreenGui3D;
local v15 = {};
v15.__index = v15;
local v16 = nil;
v15.new = function() --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), l_ScreenGui3D_0 (copy), l_GuiService_0 (copy), v13 (copy), l_SettingsView_0 (copy), l_EnigmaView_0 (copy), l_Players_0 (copy)
    local v17 = setmetatable({}, v15);
    local v18 = l_ScreenGui3D_0.new();
    v18.ResetOnSpawn = false;
    v18.Enabled = false;
    v18.CanvasSize = Vector2.new(500, 605);
    v18.FieldOfView = 0;
    v18.Easing = 0.25;
    v17.ScreenGui = v18;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(0, 500, 0, 500);
    l_Frame_0.Parent = v18:GetContainer();
    v17.ViewAdornFrame = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.BackgroundTransparency = 0.6 * l_GuiService_0.PreferredTransparency;
    l_Frame_1.Position = UDim2.new(0, 0, 0, 505);
    l_Frame_1.Size = UDim2.new(1, 0, 0, 100);
    l_Frame_1.Parent = l_Frame_0;
    l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 74 ]]
        -- upvalues: l_Frame_1 (copy), l_GuiService_0 (ref)
        l_Frame_1.BackgroundTransparency = 0.6 * l_GuiService_0.PreferredTransparency;
    end);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.25, 0);
    l_UICorner_0.Parent = l_Frame_1;
    local v22, v23 = v13:Create();
    v22.BorderSize = UDim.new(0.075, 0);
    v22.Size = UDim2.new(0, 80, 0, 80);
    v22.Position = UDim2.new(0, 10, 0, 10);
    v22.Parent = l_Frame_1;
    v23.Text = "<";
    v17.LeftButton = v22;
    local v24, v25 = v13:Create();
    v24.BorderSize = UDim.new(0.075, 0);
    v24.Size = UDim2.new(0, 80, 0, 80);
    v24.Position = UDim2.new(0, 410, 0, 10);
    v24.Parent = l_Frame_1;
    v25.Text = ">";
    v17.RightButton = v24;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0, 300, 0, 60);
    l_TextLabel_0.Position = UDim2.new(0, 100, 0, 20);
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.Parent = l_Frame_1;
    v17.ViewTextLabel = l_TextLabel_0;
    v17.CurrentView = 1;
    v17.Views = {};
    l_SettingsView_0.new(v17:CreateView("Settings"));
    l_EnigmaView_0.new(v17:CreateView("Enigma"), v17);
    v17:UpdateVisibleView();
    local v27 = true;
    v22.MouseButton1Down:Connect(function() --[[ Line: 119 ]]
        -- upvalues: v27 (ref), v17 (copy)
        if not v27 then
            return;
        else
            v27 = false;
            v17.CurrentView = v17.CurrentView - 1;
            if v17.CurrentView == 0 then
                v17.CurrentView = #v17.Views;
            end;
            v17:UpdateVisibleView();
            task.wait();
            v27 = true;
            return;
        end;
    end);
    v24.MouseButton1Down:Connect(function() --[[ Line: 134 ]]
        -- upvalues: v27 (ref), v17 (copy)
        if not v27 then
            return;
        else
            v27 = false;
            v17.CurrentView = v17.CurrentView + 1;
            if v17.CurrentView > #v17.Views then
                v17.CurrentView = 1;
            end;
            v17:UpdateVisibleView();
            task.wait();
            v27 = true;
            return;
        end;
    end);
    v18.Parent = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
    return v17;
end;
v15.GetInstance = function() --[[ Line: 158 ]] --[[ Name: GetInstance ]]
    -- upvalues: v16 (ref), v15 (copy)
    if not v16 then
        v16 = v15.new();
    end;
    return v16;
end;
v15.SetUpOpening = function(v28) --[[ Line: 169 ]] --[[ Name: SetUpOpening ]]
    -- upvalues: v8 (copy), l_Workspace_0 (copy), v9 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_v8_Setting_0 = v8:GetSetting("Menu.MenuToggleGestureActive");
    if l_v8_Setting_0 == nil then
        l_v8_Setting_0 = true;
    end;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new();
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Parent = l_Workspace_0.CurrentCamera;
    local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
    l_BoxHandleAdornment_0.Color3 = Color3.fromRGB(0, 170, 255);
    l_BoxHandleAdornment_0.AlwaysOnTop = true;
    l_BoxHandleAdornment_0.ZIndex = 0;
    l_BoxHandleAdornment_0.Adornee = l_Part_0;
    l_BoxHandleAdornment_0.Parent = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Transparency = 1;
    l_Part_1.Size = Vector3.new();
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.CanQuery = false;
    l_Part_1.Parent = l_Workspace_0.CurrentCamera;
    local l_BoxHandleAdornment_1 = Instance.new("BoxHandleAdornment");
    l_BoxHandleAdornment_1.Color3 = Color3.fromRGB(0, 170, 255);
    l_BoxHandleAdornment_1.AlwaysOnTop = true;
    l_BoxHandleAdornment_1.ZIndex = 0;
    l_BoxHandleAdornment_1.Adornee = l_Part_1;
    l_BoxHandleAdornment_1.Parent = l_Part_1;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Transparency = 1;
    l_Part_2.Size = Vector3.new(1, 1, 0, 0);
    l_Part_2.Anchored = true;
    l_Part_2.CanCollide = false;
    l_Part_2.CanQuery = false;
    l_Part_2.Parent = l_Workspace_0.CurrentCamera;
    local l_Part_3 = Instance.new("Part");
    l_Part_3.Transparency = 1;
    l_Part_3.Size = Vector3.new(1, 1, 0, 0);
    l_Part_3.Anchored = true;
    l_Part_3.CanCollide = false;
    l_Part_3.CanQuery = false;
    l_Part_3.Parent = l_Workspace_0.CurrentCamera;
    local l_SurfaceGui_0 = Instance.new("SurfaceGui");
    l_SurfaceGui_0.Active = false;
    l_SurfaceGui_0.Face = Enum.NormalId.Front;
    l_SurfaceGui_0.CanvasSize = Vector2.new(500, 500);
    l_SurfaceGui_0.LightInfluence = 0;
    l_SurfaceGui_0.Enabled = l_v8_Setting_0;
    l_SurfaceGui_0.AlwaysOnTop = true;
    l_SurfaceGui_0.Adornee = l_Part_2;
    l_SurfaceGui_0.Parent = l_Part_2;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.ImageTransparency = 1;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Rotation = 180;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Image = "rbxassetid://6537091378";
    l_ImageLabel_0.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_0.ImageRectOffset = Vector2.new(0, 0);
    l_ImageLabel_0.Parent = l_SurfaceGui_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.ImageTransparency = 1;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_1.ZIndex = 2;
    l_ImageLabel_1.Image = "rbxassetid://6537091378";
    l_ImageLabel_1.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_1.ImageRectOffset = Vector2.new(0, 512);
    l_ImageLabel_1.Parent = l_SurfaceGui_0;
    local l_SurfaceGui_1 = Instance.new("SurfaceGui");
    l_SurfaceGui_1.Active = false;
    l_SurfaceGui_1.Face = Enum.NormalId.Back;
    l_SurfaceGui_1.CanvasSize = Vector2.new(500, 500);
    l_SurfaceGui_1.LightInfluence = 0;
    l_SurfaceGui_1.Enabled = l_v8_Setting_0;
    l_SurfaceGui_1.AlwaysOnTop = true;
    l_SurfaceGui_1.Adornee = l_Part_2;
    l_SurfaceGui_1.Parent = l_Part_2;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.ImageTransparency = 1;
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_2.Image = "rbxassetid://6537091378";
    l_ImageLabel_2.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_2.ImageRectOffset = Vector2.new(512, 0);
    l_ImageLabel_2.Parent = l_SurfaceGui_1;
    local l_ImageLabel_3 = Instance.new("ImageLabel");
    l_ImageLabel_3.ImageTransparency = 1;
    l_ImageLabel_3.BackgroundTransparency = 1;
    l_ImageLabel_3.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_3.ZIndex = 2;
    l_ImageLabel_3.Image = "rbxassetid://6537091378";
    l_ImageLabel_3.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_3.ImageRectOffset = Vector2.new(0, 512);
    l_ImageLabel_3.Parent = l_SurfaceGui_1;
    local l_SurfaceGui_2 = Instance.new("SurfaceGui");
    l_SurfaceGui_2.Active = false;
    l_SurfaceGui_2.Face = Enum.NormalId.Front;
    l_SurfaceGui_2.CanvasSize = Vector2.new(500, 500);
    l_SurfaceGui_2.LightInfluence = 0;
    l_SurfaceGui_2.Enabled = l_v8_Setting_0;
    l_SurfaceGui_2.AlwaysOnTop = true;
    l_SurfaceGui_2.Adornee = l_Part_3;
    l_SurfaceGui_2.Parent = l_Part_3;
    local l_ImageLabel_4 = Instance.new("ImageLabel");
    l_ImageLabel_4.ImageTransparency = 1;
    l_ImageLabel_4.BackgroundTransparency = 1;
    l_ImageLabel_4.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_4.Image = "rbxassetid://6537091378";
    l_ImageLabel_4.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_4.ImageRectOffset = Vector2.new(512, 0);
    l_ImageLabel_4.Parent = l_SurfaceGui_2;
    local l_ImageLabel_5 = Instance.new("ImageLabel");
    l_ImageLabel_5.ImageTransparency = 1;
    l_ImageLabel_5.BackgroundTransparency = 1;
    l_ImageLabel_5.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_5.ZIndex = 2;
    l_ImageLabel_5.Image = "rbxassetid://6537091378";
    l_ImageLabel_5.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_5.ImageRectOffset = Vector2.new(0, 512);
    l_ImageLabel_5.Parent = l_SurfaceGui_2;
    local l_SurfaceGui_3 = Instance.new("SurfaceGui");
    l_SurfaceGui_3.Active = false;
    l_SurfaceGui_3.Face = Enum.NormalId.Back;
    l_SurfaceGui_3.CanvasSize = Vector2.new(500, 500);
    l_SurfaceGui_3.LightInfluence = 0;
    l_SurfaceGui_3.Enabled = l_v8_Setting_0;
    l_SurfaceGui_3.AlwaysOnTop = true;
    l_SurfaceGui_3.Adornee = l_Part_3;
    l_SurfaceGui_3.Parent = l_Part_3;
    local l_ImageLabel_6 = Instance.new("ImageLabel");
    l_ImageLabel_6.ImageTransparency = 1;
    l_ImageLabel_6.BackgroundTransparency = 1;
    l_ImageLabel_6.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_6.Image = "rbxassetid://6537091378";
    l_ImageLabel_6.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_6.ImageRectOffset = Vector2.new(0, 0);
    l_ImageLabel_6.Parent = l_SurfaceGui_3;
    local l_ImageLabel_7 = Instance.new("ImageLabel");
    l_ImageLabel_7.BackgroundTransparency = 1;
    l_ImageLabel_7.Rotation = 180;
    l_ImageLabel_7.ImageTransparency = 1;
    l_ImageLabel_7.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_7.ZIndex = 2;
    l_ImageLabel_7.Image = "rbxassetid://6537091378";
    l_ImageLabel_7.ImageRectSize = Vector2.new(512, 512);
    l_ImageLabel_7.ImageRectOffset = Vector2.new(0, 512);
    l_ImageLabel_7.Parent = l_SurfaceGui_3;
    v8:GetSettingsChangedSignal("Menu.MenuToggleGestureActive"):Connect(function() --[[ Line: 341 ]]
        -- upvalues: v8 (ref), l_SurfaceGui_0 (copy), l_SurfaceGui_1 (copy), l_SurfaceGui_2 (copy), l_SurfaceGui_3 (copy)
        local l_v8_Setting_1 = v8:GetSetting("Menu.MenuToggleGestureActive");
        if l_v8_Setting_1 == nil then
            l_v8_Setting_1 = true;
        end;
        l_SurfaceGui_0.Enabled = l_v8_Setting_1;
        l_SurfaceGui_1.Enabled = l_v8_Setting_1;
        l_SurfaceGui_2.Enabled = l_v8_Setting_1;
        l_SurfaceGui_3.Enabled = l_v8_Setting_1;
    end);
    local v49 = nil;
    local v50 = false;
    task.spawn(function() --[[ Line: 360 ]]
        -- upvalues: v8 (ref), v9 (ref), v49 (ref), v50 (ref), l_Workspace_0 (ref), l_Part_0 (copy), l_Part_1 (copy), l_Part_2 (copy), l_Part_3 (copy), l_BoxHandleAdornment_0 (copy), l_BoxHandleAdornment_1 (copy), v28 (copy), l_TweenService_0 (ref), l_ImageLabel_0 (copy), l_ImageLabel_2 (copy), l_ImageLabel_1 (copy), l_ImageLabel_3 (copy), l_ImageLabel_4 (copy), l_ImageLabel_6 (copy), l_ImageLabel_5 (copy), l_ImageLabel_7 (copy), l_RunService_0 (ref)
        while true do
            local l_v8_Setting_2 = v8:GetSetting("Menu.MenuToggleGestureActive");
            if l_v8_Setting_2 == nil then
                l_v8_Setting_2 = true;
            end;
            local l_v9_VRInputs_0 = v9:GetVRInputs();
            local v53 = l_v9_VRInputs_0[Enum.UserCFrame.Head]:Inverse() * l_v9_VRInputs_0[Enum.UserCFrame.LeftHand];
            local v54 = l_v9_VRInputs_0[Enum.UserCFrame.Head]:Inverse() * l_v9_VRInputs_0[Enum.UserCFrame.RightHand];
            local v55 = v53.UpVector.Y < 0;
            local v56 = v54.UpVector.Y < 0;
            local v57 = v53.LookVector.Z < 0;
            local v58 = v54.LookVector.Z < 0;
            local v59 = v55 and v57;
            local v60 = v56 and v58;
            if l_v8_Setting_2 and v59 and v60 then
                v49 = v49 or tick();
            else
                v49 = nil;
                v50 = false;
            end;
            local v61 = l_Workspace_0.CurrentCamera:GetRenderCFrame() * l_v9_VRInputs_0[Enum.UserCFrame.Head]:Inverse();
            l_Part_0.CFrame = v61 * l_v9_VRInputs_0[Enum.UserCFrame.LeftHand] * CFrame.new(0, -0.25, 0.25);
            l_Part_1.CFrame = v61 * l_v9_VRInputs_0[Enum.UserCFrame.RightHand] * CFrame.new(0, -0.25, 0.25);
            l_Part_2.CFrame = v61 * l_v9_VRInputs_0[Enum.UserCFrame.LeftHand];
            l_Part_3.CFrame = v61 * l_v9_VRInputs_0[Enum.UserCFrame.RightHand];
            if v49 and not v50 then
                local v62 = (tick() - v49) / 1;
                l_BoxHandleAdornment_0.Size = Vector3.new(0.1, 0, 0.25 * v62);
                l_BoxHandleAdornment_1.Size = Vector3.new(0.1, 0, 0.25 * v62);
                l_BoxHandleAdornment_0.Visible = true;
                l_BoxHandleAdornment_1.Visible = true;
                if v62 >= 1 then
                    v50 = true;
                    task.spawn(function() --[[ Line: 400 ]]
                        -- upvalues: v28 (ref)
                        v28:Toggle();
                    end);
                end;
            else
                l_BoxHandleAdornment_0.Visible = false;
                l_BoxHandleAdornment_1.Visible = false;
            end;
            local function v70(v63, v64, v65, v66, v67, v68) --[[ Line: 412 ]] --[[ Name: UpdateHintParts ]]
                -- upvalues: l_TweenService_0 (ref)
                local v69 = TweenInfo.new(0.25);
                l_TweenService_0:Create(v64, v69, {
                    Size = __2021_if(function() return v63 end, function() return Vector3.new(1, 1, 0, 0) end, function() return Vector3.new(1.5, 1.5, 0, 0) end)
                }):Play();
                l_TweenService_0:Create(v65, v69, {
                    ImageTransparency = v63 and 0 or 1
                }):Play();
                l_TweenService_0:Create(v66, v69, {
                    ImageTransparency = v63 and 0 or 1
                }):Play();
                l_TweenService_0:Create(v67, v69, {
                    ImageTransparency = v63 and 0 or 1
                }):Play();
                l_TweenService_0:Create(v68, v69, {
                    ImageTransparency = v63 and 0 or 1
                }):Play();
            end;
            local v71 = v28.ScreenGui.Enabled and not v59;
            local v72 = v28.ScreenGui.Enabled and not v60;
            if v28.LeftHandHintVisible ~= v71 then
                v28.LeftHandHintVisible = v71;
                v70(v71, l_Part_2, l_ImageLabel_0, l_ImageLabel_2, l_ImageLabel_1, l_ImageLabel_3);
            end;
            if v28.RightHandHintVisible ~= v72 then
                v28.RightHandHintVisible = v72;
                v70(v72, l_Part_3, l_ImageLabel_4, l_ImageLabel_6, l_ImageLabel_5, l_ImageLabel_7);
            end;
            local v73 = tick() * 10 % 360;
            l_ImageLabel_0.Rotation = v73;
            l_ImageLabel_2.Rotation = -v73;
            l_ImageLabel_4.Rotation = -v73;
            l_ImageLabel_6.Rotation = v73;
            l_RunService_0.RenderStepped:Wait();
        end;
    end);
end;
v15.Toggle = function(v74, v75) --[[ Line: 456 ]] --[[ Name: Toggle ]]
    -- upvalues: l_RunService_0 (copy)
    if v74.ScreenGui.Enabled == v75 then
        return;
    else
        local v76 = v74.ScreenGui.Enabled and 0.6981317007977318 or 0;
        local v77 = v74.ScreenGui.Enabled and 0 or 0.6981317007977318;
        if not v74.ScreenGui.Enabled then
            v74.ScreenGui.Enabled = true;
        end;
        local v78 = tick();
        while tick() - v78 < 0.25 do
            local v79 = math.sin(((tick() - v78) / 0.25 - 0.5) * 3.141592653589793) / 2 + 0.5;
            v74.ScreenGui.FieldOfView = v76 + (v77 - v76) * v79;
            l_RunService_0.RenderStepped:Wait();
        end;
        if v77 == 0 then
            v74.ScreenGui.Enabled = false;
        end;
        return;
    end;
end;
v15.RegisterView = function(v80, v81, v82) --[[ Line: 485 ]] --[[ Name: RegisterView ]]
    warn("MainMenu::RegisterView is deprecated and may be removed in the future. Use MainMenu::CreateView instead.");
    v82.Visible = false;
    v82.Name = v81;
    v82.Parent = v80.ViewAdornFrame;
    table.insert(v80.Views, v82);
end;
v15.CreateView = function(v83, v84) --[[ Line: 500 ]] --[[ Name: CreateView ]]
    -- upvalues: l_ApiBaseView_0 (copy)
    local v85 = l_ApiBaseView_0.new(v84);
    v85.Frame.Parent = v83.ViewAdornFrame;
    table.insert(v83.Views, v85);
    v85:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 507 ]]
        -- upvalues: v83 (copy)
        v83:UpdateVisibleView();
    end);
    v85.Destroyed:Connect(function() --[[ Line: 510 ]]
        -- upvalues: v83 (copy), v85 (copy)
        for v86 = 1, #v83.Views do
            if v83.Views[v86] == v85 then
                table.remove(v83.Views, v86);
                if v86 < v83.CurrentView then
                    local l_v83_0 = v83;
                    l_v83_0.CurrentView = l_v83_0.CurrentView + -1;
                    break;
                else
                    break;
                end;
            end;
        end;
        v83:UpdateVisibleView();
    end);
    return v85;
end;
v15.UpdateVisibleView = function(v88, v89) --[[ Line: 528 ]] --[[ Name: UpdateVisibleView ]]
    v88.LeftButton.Visible = #v88.Views > 1;
    v88.RightButton.Visible = #v88.Views > 1;
    if v89 then
        for v90, v91 in pairs(v88.Views) --[[ 2021 ]] do
            if v91.Name == v89 then
                v88.CurrentView = v90;
                break;
            end;
        end;
    end;
    v88.ViewTextLabel.Text = v88.Views[v88.CurrentView].Name;
    for v92, v93 in pairs(v88.Views) --[[ 2021 ]] do
        v93.Visible = v92 == v88.CurrentView;
    end;
end;
return v15;