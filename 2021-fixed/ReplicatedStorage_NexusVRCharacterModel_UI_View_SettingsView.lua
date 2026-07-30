-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_NexusButton_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusButton"));
local v4 = require(l_Parent_0:WaitForChild("State"):WaitForChild("CameraService")).GetInstance();
local v5 = require(l_Parent_0:WaitForChild("State"):WaitForChild("ControlService")).GetInstance();
local v6 = require(l_Parent_0:WaitForChild("State"):WaitForChild("DefaultCursorService")).GetInstance();
local v7 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v8 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
local _ = require(l_Parent_0:WaitForChild("UI"):WaitForChild("View"):WaitForChild("ApiBaseView"));
local v10 = l_NexusButton_0.TextButtonFactory.CreateDefault(Color3.fromRGB(0, 170, 255));
v10:SetDefault("Theme", "RoundedCorners");
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_VRService_0 (copy), v7 (copy), v4 (copy), v5 (copy), v6 (copy), v10 (copy), v8 (copy), l_UserInputService_0 (copy)
    v12:AddBackground();
    local v13 = setmetatable({}, v11);
    local l_v12_Container_0 = v12:GetContainer();
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(0.4, 0, 0.4, 0);
    l_ImageLabel_0.Position = UDim2.new(0.3, 0, -0.075, 0);
    l_ImageLabel_0.Image = "http://www.roblox.com/asset/?id=1499731139";
    l_ImageLabel_0.Parent = l_v12_Container_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0.8, 0, 0.1, 0);
    l_TextLabel_0.Position = UDim2.new(0.1, 0, 0.225, 0);
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.Text = "Nexus VR Character Model";
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.Parent = l_v12_Container_0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(0.8, 0, 0.11, 0);
    l_Frame_0.Position = UDim2.new(0.1, 0, 0.325, 0);
    l_Frame_0.Parent = l_v12_Container_0;
    v13:PopulateSettingsFrame(l_Frame_0, "View", function() --[[ Line: 64 ]]
        -- upvalues: l_VRService_0 (ref), v7 (ref)
        if l_VRService_0.AvatarGestures then
            return {
                "Default"
            };
        else
            return v7:GetSetting("Camera.EnabledCameraOptions") or {};
        end;
    end, function() --[[ Line: 69 ]]
        -- upvalues: v4 (ref)
        return v4.ActiveCamera;
    end, function(v18) --[[ Line: 71 ]]
        -- upvalues: v4 (ref)
        v4:SetActiveCamera(v18);
    end);
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Size = UDim2.new(0.8, 0, 0.11, 0);
    l_Frame_1.Position = UDim2.new(0.1, 0, 0.475, 0);
    l_Frame_1.Parent = l_v12_Container_0;
    v13:PopulateSettingsFrame(l_Frame_1, "Control", "Movement.EnabledMovementMethods", function() --[[ Line: 80 ]]
        -- upvalues: v5 (ref)
        return v5.ActiveController;
    end, function(v20) --[[ Line: 82 ]]
        -- upvalues: v5 (ref)
        v5:SetActiveController(v20);
    end);
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(0.8, 0, 0.11, 0);
    l_Frame_2.Position = UDim2.new(0.1, 0, 0.625, 0);
    l_Frame_2.Parent = l_v12_Container_0;
    v13:PopulateSettingsFrame(l_Frame_2, "Roblox VR Cursor", function() --[[ Line: 91 ]]
        -- upvalues: v6 (ref)
        return v6.CursorOptionsList;
    end, function() --[[ Line: 93 ]]
        -- upvalues: v6 (ref)
        return v6.CurrentCursorState;
    end, function(v22) --[[ Line: 95 ]]
        -- upvalues: v6 (ref)
        v6:SetCursorState(v22);
    end);
    local v23, v24 = v10:Create();
    v23.Size = UDim2.new(0.4, 0, 0.075, 0);
    v23.Position = UDim2.new(l_VRService_0.AvatarGestures and 0.3 or 0.075, 0, 0.85, 0);
    v23.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v23.Parent = l_v12_Container_0;
    v24.Text = "Recenter";
    v23.MouseButton1Down:Connect(function() --[[ Line: 107 ]]
        -- upvalues: l_VRService_0 (ref), v8 (ref), l_UserInputService_0 (ref)
        if not l_VRService_0.AvatarGestures then
            v8:Recenter();
            return;
        else
            l_UserInputService_0:RecenterUserHeadCFrame();
            return;
        end;
    end);
    if not l_VRService_0.AvatarGestures then
        local v25, v26 = v10:Create();
        v25.Size = UDim2.new(0.4, 0, 0.075, 0);
        v25.Position = UDim2.new(0.525, 0, 0.85, 0);
        v25.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        v25.Parent = l_v12_Container_0;
        v26.Text = " Set Eye Level ";
        v25.MouseButton1Down:Connect(function() --[[ Line: 123 ]]
            -- upvalues: v8 (ref)
            v8:SetEyeLevel();
        end);
    end;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.AnchorPoint = Vector2.new(0.5, 1);
    l_TextLabel_1.Size = UDim2.new(0.8, 0, 0.04, 0);
    l_TextLabel_1.Position = UDim2.new(0.5, 0, 1, 0);
    l_TextLabel_1.Font = Enum.Font.SourceSansBold;
    l_TextLabel_1.Text = ("Version %s (%s)"):format(v7:GetSetting("Version.Tag"), (v7:GetSetting("Version.Commit")));
    l_TextLabel_1.TextScaled = true;
    l_TextLabel_1.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_1.TextStrokeTransparency = 0;
    l_TextLabel_1.Parent = l_v12_Container_0;
    return v11;
end;
v11.PopulateSettingsFrame = function(_, v29, v30, v31, v32, v33) --[[ Line: 149 ]] --[[ Name: PopulateSettingsFrame ]]
    -- upvalues: v7 (copy), v10 (copy)
    local v34 = nil;
    if typeof(v31) == "string" then
        v34 = v31;
        v31 = function() --[[ Line: 154 ]]
            -- upvalues: v7 (ref), v34 (ref)
            return v7:GetSetting(v34) or {};
        end;
    end;
    local v35, v36 = v10:Create();
    v35.Size = UDim2.new(1, 0, 1, 0);
    v35.Position = UDim2.new(0, 0, 0, 0);
    v35.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v35.Parent = v29;
    v36.Text = "<";
    local v37, v38 = v10:Create();
    v37.AnchorPoint = Vector2.new(1, 0);
    v37.Size = UDim2.new(1, 0, 1, 0);
    v37.Position = UDim2.new(1, 0, 0, 0);
    v37.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v37.Parent = v29;
    v38.Text = ">";
    local l_TextLabel_2 = Instance.new("TextLabel");
    l_TextLabel_2.BackgroundTransparency = 1;
    l_TextLabel_2.Size = UDim2.new(0.8, 0, 0.5, 0);
    l_TextLabel_2.Position = UDim2.new(0.1, 0, -0.0125, 0);
    l_TextLabel_2.Font = Enum.Font.SourceSansBold;
    l_TextLabel_2.Text = v30;
    l_TextLabel_2.TextScaled = true;
    l_TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_2.TextStrokeTransparency = 0;
    l_TextLabel_2.Parent = v29;
    local l_TextLabel_3 = Instance.new("TextLabel");
    l_TextLabel_3.BackgroundTransparency = 1;
    l_TextLabel_3.Size = UDim2.new(0.6, 0, 0.7, 0);
    l_TextLabel_3.Position = UDim2.new(0.2, 0, 0.3, 0);
    l_TextLabel_3.Font = Enum.Font.SourceSansBold;
    l_TextLabel_3.TextScaled = true;
    l_TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_3.TextStrokeTransparency = 0;
    l_TextLabel_3.Parent = v29;
    local function v47(v41) --[[ Line: 201 ]] --[[ Name: UpdateSettings ]]
        -- upvalues: v32 (copy), v31 (ref), v35 (copy), v37 (copy), l_TextLabel_3 (copy), v33 (copy)
        local v42 = v32();
        local v43 = 1;
        local v44 = v31();
        for v45, v46 in pairs(v44) --[[ 2021 ]] do
            if v46 == v42 then
                v43 = v45;
                break;
            end;
        end;
        if v41 and v41 ~= 0 then
            v43 = v43 + v41;
            if v43 <= 0 then
                v43 = #v44;
            end;
            if #v44 < v43 then
                v43 = 1;
            end;
        end;
        v35.Visible = #v44 > 1;
        v37.Visible = #v44 > 1;
        l_TextLabel_3.Text = v44[v43] or "(N/A)";
        if v41 and v41 ~= 0 and v44[v43] then
            v33(v44[v43]);
        end;
    end;
    local v48 = true;
    if v34 then
        v7:GetSettingsChangedSignal(v34):Connect(v47);
    end;
    v35.MouseButton1Down:Connect(function() --[[ Line: 242 ]]
        -- upvalues: v48 (ref), v47 (copy)
        if not v48 then
            return;
        else
            v48 = false;
            v47(-1);
            task.wait();
            v48 = true;
            return;
        end;
    end);
    v37.MouseButton1Down:Connect(function() --[[ Line: 249 ]]
        -- upvalues: v48 (ref), v47 (copy)
        if not v48 then
            return;
        else
            v48 = false;
            v47(1);
            task.wait();
            v48 = true;
            return;
        end;
    end);
    v47();
end;
return v11;