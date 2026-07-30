-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = Color3.fromRGB(50, 50, 50);
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_NexusInstance_0 = require(script.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_ControllerIcon_0 = require(script.Parent:WaitForChild("ControllerIcon"));
local l_SimpleWrappedInstance_0 = require(script.Parent:WaitForChild("SimpleWrappedInstance"));
local l_ThemedFrame_0 = require(script.Parent:WaitForChild("ThemedFrame"));
local v8 = {
    Themes = l_ThemedFrame_0.Themes
};
v8.__index = v8;
setmetatable(v8, l_SimpleWrappedInstance_0);
local function _(v9, v10) --[[ Line: 52 ]] --[[ Name: MultiplyColor3 ]]
    return Color3.new(math.clamp(v9.R * v10, 0, 1), math.clamp(v9.G * v10, 0, 1), (math.clamp(v9.B * v10, 0, 1)));
end;
v8.__new = function(v12) --[[ Line: 59 ]] --[[ Name: __new ]]
    -- upvalues: l_SimpleWrappedInstance_0 (copy), l_ThemedFrame_0 (copy), l_ControllerIcon_0 (copy), v0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    l_SimpleWrappedInstance_0.__new(v12, Instance.new("TextButton"));
    local l_v12_WrappedInstance_0 = v12:GetWrappedInstance();
    l_v12_WrappedInstance_0.BackgroundTransparency = 1;
    l_v12_WrappedInstance_0.Text = "";
    local v14 = l_ThemedFrame_0.new();
    v14.Parent = l_v12_WrappedInstance_0;
    v12:DisableChangeReplication("BorderFrame");
    v12.BorderFrame = v14;
    local v15 = l_ThemedFrame_0.new();
    v15.Size = UDim2.new(1, 0, 1, 0);
    v15.ZIndex = 2;
    v15.Parent = l_v12_WrappedInstance_0;
    v12:DisableChangeReplication("BackgroundFrame");
    v12.BackgroundFrame = v15;
    v15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 79 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(false);
    end);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.ZIndex = 3;
    l_Frame_0.Parent = l_v12_WrappedInstance_0;
    v12:DisableChangeReplication("ContentsAdorn");
    v12.ContentsAdorn = l_Frame_0;
    local v17 = l_ControllerIcon_0.new();
    v17.BackgroundColor3 = v0;
    v17.Size = UDim2.new(1, 0, 1, 0);
    v17.Position = UDim2.new(1, 0, 0, 0);
    v17.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v17.AnchorPoint = Vector2.new(1, 0);
    v17.ZIndex = 4;
    v17.Parent = l_v12_WrappedInstance_0;
    v12:DisableChangeReplication("GamepadIcon");
    v12.GamepadIcon = v17;
    v12:DisableChangeReplication("MouseButton1Down");
    v12.MouseButton1Down = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton1Down:Connect(function(...) --[[ Line: 105 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton1Down:Fire(...);
    end);
    v12:DisableChangeReplication("MouseButton1Up");
    v12.MouseButton1Up = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton1Up:Connect(function(...) --[[ Line: 110 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton1Up:Fire(...);
    end);
    v12:DisableChangeReplication("MouseButton1Click");
    v12.MouseButton1Click = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton1Click:Connect(function() --[[ Line: 115 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton1Click:Fire();
    end);
    v12:DisableChangeReplication("MouseButton2Down");
    v12.MouseButton2Down = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton2Down:Connect(function(...) --[[ Line: 120 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton2Down:Fire(...);
    end);
    v12:DisableChangeReplication("MouseButton2Up");
    v12.MouseButton2Up = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton2Up:Connect(function(...) --[[ Line: 125 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton2Up:Fire(...);
    end);
    v12:DisableChangeReplication("MouseButton2Click");
    v12.MouseButton2Click = v12:CreateEvent();
    v12:GetWrappedInstance().MouseButton2Click:Connect(function() --[[ Line: 130 ]]
        -- upvalues: v12 (copy)
        v12.MouseButton2Click:Fire();
    end);
    v12:DisableChangeReplication("TweenDuration");
    v12:DisableChangeReplication("BackgroundColor3");
    v12:OnPropertyChanged("BackgroundColor3", function() --[[ Line: 137 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(false);
    end);
    v12:DisableChangeReplication("BackgroundTransparency");
    v12:OnPropertyChanged("BackgroundTransparency", function(v18) --[[ Line: 141 ]]
        -- upvalues: v15 (copy)
        v15.BackgroundTransparency = v18;
    end);
    v12:DisableChangeReplication("BorderSize");
    v12:OnPropertyChanged("BorderSize", function() --[[ Line: 145 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(false);
    end);
    v12:DisableChangeReplication("BorderSizePixel");
    v12:OnPropertyChanged("BorderSizePixel", function(v19) --[[ Line: 149 ]]
        -- upvalues: v12 (copy)
        v12.BorderSize = UDim.new(0, v19);
    end);
    v12:DisableChangeReplication("BorderSizeScale");
    v12:OnPropertyChanged("BorderSizeScale", function(v20) --[[ Line: 153 ]]
        -- upvalues: v12 (copy)
        v12.BorderSize = UDim.new(v20, 0);
    end);
    v12:DisableChangeReplication("BorderColor3");
    v12:OnPropertyChanged("BorderColor3", function() --[[ Line: 157 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(false);
    end);
    v12:DisableChangeReplication("BorderColor3");
    v12:OnPropertyChanged("AutoButtonColor", function() --[[ Line: 161 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(false);
    end);
    v12:DisableChangeReplication("BorderTransparency");
    v12:OnPropertyChanged("BorderTransparency", function(v21) --[[ Line: 165 ]]
        -- upvalues: v14 (copy)
        v14.BackgroundTransparency = v21;
    end);
    v12:DisableChangeReplication("Hovering");
    v12:OnPropertyChanged("Hovering", function() --[[ Line: 169 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(true);
    end);
    v12:DisableChangeReplication("Pressed");
    v12:OnPropertyChanged("Pressed", function() --[[ Line: 173 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(true);
    end);
    v12:DisableChangeReplication("Theme");
    v12:OnPropertyChanged("Theme", function(_) --[[ Line: 177 ]]
        -- upvalues: v15 (copy), v12 (copy), v14 (copy), v17 (copy)
        v15.Theme = v12.Theme;
        v14.Theme = v12.Theme;
        v17.Theme = v12.Theme;
    end);
    v12:DisableChangeReplication("MappedInputs");
    v12.MappedInputs = {};
    v12:DisableChangeReplication("EventConnections");
    v12.EventConnections = {};
    v12.MouseEnter:Connect(function() --[[ Line: 188 ]]
        -- upvalues: v12 (copy)
        v12.Hovering = true;
    end);
    v12.MouseLeave:Connect(function() --[[ Line: 191 ]]
        -- upvalues: v12 (copy)
        v12.Hovering = false;
    end);
    v12.MouseButton1Down:Connect(function() --[[ Line: 194 ]]
        -- upvalues: v12 (copy)
        v12.Pressed = true;
    end);
    v12.MouseButton1Up:Connect(function() --[[ Line: 197 ]]
        -- upvalues: v12 (copy)
        v12.Pressed = false;
    end);
    table.insert(v12.EventConnections, l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 200 ]]
        -- upvalues: v12 (copy)
        v12:UpdateBorder(true);
    end));
    table.insert(v12.EventConnections, l_UserInputService_0.InputBegan:Connect(function(v23, v24) --[[ Line: 203 ]]
        -- upvalues: l_GuiService_0 (ref), v12 (copy)
        if v24 and (l_GuiService_0.SelectedObject ~= v12:GetWrappedInstance() or v23.KeyCode == Enum.KeyCode.ButtonA) then
            return;
        elseif v12.Pressed then
            return;
        elseif not v12.MappedInputs[v23.KeyCode] then
            return;
        else
            local v25 = v12.MappedInputs[v23.KeyCode];
            local v26 = v12.AbsolutePosition + v12.AbsoluteSize / 2;
            if v25 == Enum.UserInputType.MouseButton1 then
                v12.MouseButton1Down:Fire(v26.X, v26.Y);
                return;
            else
                if v25 == Enum.UserInputType.MouseButton2 then
                    v12.MouseButton2Down:Fire(v26.X, v26.Y);
                end;
                return;
            end;
        end;
    end));
    table.insert(v12.EventConnections, l_UserInputService_0.InputEnded:Connect(function(v27) --[[ Line: 216 ]]
        -- upvalues: v12 (copy)
        if not v12.Pressed then
            return;
        elseif not v12.MappedInputs[v27.KeyCode] then
            return;
        else
            local v28 = v12.MappedInputs[v27.KeyCode];
            local v29 = v12.AbsolutePosition + v12.AbsoluteSize / 2;
            if v28 == Enum.UserInputType.MouseButton1 then
                v12.MouseButton1Up:Fire(v29.X, v29.Y);
                v12.MouseButton1Click:Fire();
                return;
            else
                if v28 == Enum.UserInputType.MouseButton2 then
                    v12.MouseButton2Up:Fire(v29.X, v29.Y);
                    v12.MouseButton2Click:Fire();
                end;
                return;
            end;
        end;
    end));
    table.insert(v12.EventConnections, l_UserInputService_0.InputEnded:Connect(function(v30) --[[ Line: 230 ]]
        -- upvalues: v12 (copy)
        if not v12.Pressed then
            return;
        elseif v30.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return;
        else
            v12.Pressed = false;
            return;
        end;
    end));
    v12.Size = UDim2.new(0, 200, 0, 50);
    v12.BackgroundColor3 = Color3.fromRGB(204, 204, 204);
    v12.BackgroundTransparency = 0;
    v12.BorderSize = UDim.new(0.15, 0);
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0);
    v12.BorderTransparency = 0;
    v12.AutoButtonColor = true;
    v12.Hovering = false;
    v12.Pressed = false;
    v12.TweenDuration = 0.1;
    v12.Theme = "CutCorners";
end;
v8.UpdateBorder = function(v31, v32) --[[ Line: 253 ]] --[[ Name: UpdateBorder ]]
    -- upvalues: l_GuiService_0 (copy), l_TweenService_0 (copy)
    if not v31.BorderSize then
        return;
    elseif not v31.Theme then
        return;
    else
        local l_AbsoluteSize_0 = v31.BackgroundFrame.AbsoluteSize;
        local v34 = l_AbsoluteSize_0.Y * v31.BorderSize.Scale + v31.BorderSize.Offset;
        local l_BackgroundColor3_0 = v31.BackgroundColor3;
        local l_BorderColor3_0 = v31.BorderColor3;
        if v31.AutoButtonColor ~= false then
            if v31.Pressed then
                local l_l_BackgroundColor3_0_0 = l_BackgroundColor3_0;
                l_BackgroundColor3_0 = Color3.new(math.clamp(l_l_BackgroundColor3_0_0.R * 1.4285714285714286, 0, 1), math.clamp(l_l_BackgroundColor3_0_0.G * 1.4285714285714286, 0, 1), (math.clamp(l_l_BackgroundColor3_0_0.B * 1.4285714285714286, 0, 1)));
                l_l_BackgroundColor3_0_0 = l_BorderColor3_0;
                l_BorderColor3_0 = Color3.new(math.clamp(l_l_BackgroundColor3_0_0.R * 1.4285714285714286, 0, 1), math.clamp(l_l_BackgroundColor3_0_0.G * 1.4285714285714286, 0, 1), (math.clamp(l_l_BackgroundColor3_0_0.B * 1.4285714285714286, 0, 1)));
                v34 = v34 * 0.25;
            elseif v31.Hovering or l_GuiService_0.SelectedObject == v31:GetWrappedInstance() then
                local l_l_BackgroundColor3_0_1 = l_BackgroundColor3_0;
                l_BackgroundColor3_0 = Color3.new(math.clamp(l_l_BackgroundColor3_0_1.R * 0.7, 0, 1), math.clamp(l_l_BackgroundColor3_0_1.G * 0.7, 0, 1), (math.clamp(l_l_BackgroundColor3_0_1.B * 0.7, 0, 1)));
                l_l_BackgroundColor3_0_1 = l_BorderColor3_0;
                l_BorderColor3_0 = Color3.new(math.clamp(l_l_BackgroundColor3_0_1.R * 0.7, 0, 1), math.clamp(l_l_BackgroundColor3_0_1.G * 0.7, 0, 1), (math.clamp(l_l_BackgroundColor3_0_1.B * 0.7, 0, 1)));
                v34 = v34 * 0.75;
            end;
        end;
        if v32 and v31.TweenDuration and v31.TweenDuration > 0 then
            l_TweenService_0:Create(v31.BackgroundFrame:GetWrappedInstance(), TweenInfo.new(v31.TweenDuration), {
                ImageColor3 = l_BackgroundColor3_0
            }):Play();
            l_TweenService_0:Create(v31.BorderFrame:GetWrappedInstance(), TweenInfo.new(v31.TweenDuration), {
                ImageColor3 = l_BorderColor3_0, 
                Size = UDim2.new(1, 0, 1, v34)
            }):Play();
        else
            v31.BackgroundFrame.ImageColor3 = l_BackgroundColor3_0;
            v31.BorderFrame.ImageColor3 = l_BorderColor3_0;
            v31.BorderFrame.Size = UDim2.new(1, 0, 1, v34);
        end;
        v31.GamepadIcon.SubTheme = l_AbsoluteSize_0.X / l_AbsoluteSize_0.Y < 1.2 and "MainButton" or "GamepadIconBackground";
        return;
    end;
end;
v8.GetAdornFrame = function(v39) --[[ Line: 296 ]] --[[ Name: GetAdornFrame ]]
    return v39.ContentsAdorn;
end;
v8.SetControllerIcon = function(v40, v41) --[[ Line: 303 ]] --[[ Name: SetControllerIcon ]]
    v40.GamepadIcon:SetIcon(v41);
end;
v8.MapKey = function(v42, v43, v44) --[[ Line: 310 ]] --[[ Name: MapKey ]]
    if typeof(v43) == "string" then
        v43 = Enum.KeyCode[v43];
    end;
    if typeof(v44) == "string" then
        v44 = Enum.UserInputType[v44];
    end;
    if v44 ~= Enum.UserInputType.MouseButton1 and v44 ~= Enum.UserInputType.MouseButton2 then
        error("Mouse input must be either MouseButton1 or MouseButton2.");
    end;
    v42.MappedInputs[v43] = v44;
end;
v8.UnmapKey = function(v45, v46) --[[ Line: 331 ]] --[[ Name: UnmapKey ]]
    if typeof(v46) == "string" then
        v46 = Enum.KeyCode[v46];
    end;
    v45.MappedInputs[v46] = nil;
end;
v8.Destroy = function(v47) --[[ Line: 344 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SimpleWrappedInstance_0 (copy)
    l_SimpleWrappedInstance_0.Destroy(v47);
    v47.GamepadIcon:Destroy();
    for _, v49 in v47.EventConnections do
        v49:Disconnect();
    end;
    v47.EventConnections = {};
end;
return (l_NexusInstance_0.ToInstance(v8));