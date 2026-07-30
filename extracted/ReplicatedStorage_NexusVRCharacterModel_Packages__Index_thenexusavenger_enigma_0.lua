-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy)
    local v5 = setmetatable({
        WindowFocused = true, 
        LastHeartbeatTime = 0, 
        Events = {}, 
        TextBoxEvents = {}
    }, v3);
    v5:CreateTextBox(v4 or l_Players_0.LocalPlayer:WaitForChild("PlayerGui"));
    table.insert(v5.Events, l_UserInputService_0.InputBegan:Connect(function(v6) --[[ Line: 38 ]]
        -- upvalues: v5 (copy)
        if v6.KeyCode ~= Enum.KeyCode.F13 then
            return;
        else
            v5.LastHeartbeatTime = tick();
            v5:TryCaptureFocus();
            return;
        end;
    end));
    table.insert(v5.Events, l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 43 ]]
        -- upvalues: v5 (copy)
        v5.WindowFocused = true;
        v5:TryCaptureFocus();
    end));
    table.insert(v5.Events, l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 47 ]]
        -- upvalues: v5 (copy)
        v5.WindowFocused = false;
        v5:TryReleaseFocus();
    end));
    table.insert(v5.Events, l_RunService_0.Stepped:Connect(function() --[[ Line: 51 ]]
        -- upvalues: v5 (copy)
        v5:TryCaptureFocus();
    end));
    return v5;
end;
v3.CreateTextBox = function(v7, v8) --[[ Line: 63 ]] --[[ Name: CreateTextBox ]]
    for _, v10 in v7.TextBoxEvents do
        v10:Disconnect();
    end;
    v7.TextBoxEvents = {};
    if v7.ScreenGui then
        v7.ScreenGui:Destroy();
    end;
    if v7.TextBox then
        v7.TextBox:Destroy();
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "EnigmaTextBoxInput";
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.Parent = v8;
    v7.ScreenGui = l_ScreenGui_0;
    local l_TextBox_0 = Instance.new("TextBox");
    l_TextBox_0.Name = "EnigmaTextBox";
    l_TextBox_0.BackgroundTransparency = 0.99;
    l_TextBox_0.BorderSizePixel = 0;
    l_TextBox_0.Size = UDim2.new(0, 1, 0, 1);
    l_TextBox_0.Selectable = false;
    l_TextBox_0.ClipsDescendants = true;
    l_TextBox_0.ClearTextOnFocus = true;
    l_TextBox_0.TextTransparency = 0.99;
    l_TextBox_0.Parent = l_ScreenGui_0;
    v7.TextBox = l_TextBox_0;
    table.insert(v7.TextBoxEvents, l_TextBox_0.AncestryChanged:Connect(function() --[[ Line: 96 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7:CreateTextBox(v8);
    end));
    for _, v14 in {
        "Enabled"
    } do
        local v15 = l_ScreenGui_0[v14];
        table.insert(v7.TextBoxEvents, l_ScreenGui_0:GetPropertyChangedSignal(v14):Connect(function() --[[ Line: 101 ]]
            -- upvalues: l_ScreenGui_0 (copy), v14 (copy), v15 (copy)
            l_ScreenGui_0[v14] = v15;
        end));
    end;
    for _, v17 in {
        "BackgroundTransparency", 
        "Size", 
        "ClipsDescendants", 
        "Visible", 
        "TextTransparency"
    } do
        local v18 = l_TextBox_0[v17];
        table.insert(v7.TextBoxEvents, l_TextBox_0:GetPropertyChangedSignal(v17):Connect(function() --[[ Line: 107 ]]
            -- upvalues: l_TextBox_0 (copy), v17 (copy), v18 (copy)
            l_TextBox_0[v17] = v18;
        end));
    end;
end;
v3.GetCurrentText = function(v19) --[[ Line: 117 ]] --[[ Name: GetCurrentText ]]
    if not v19.TextBox then
        return "";
    else
        return v19.TextBox.Text;
    end;
end;
v3.TryCaptureFocus = function(v20) --[[ Line: 125 ]] --[[ Name: TryCaptureFocus ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v20.WindowFocused or tick() - v20.LastHeartbeatTime > 0.5 then
        v20:TryReleaseFocus();
        return;
    elseif not v20.TextBox then
        return;
    elseif l_UserInputService_0:GetFocusedTextBox() == v20.TextBox then
        return;
    else
        v20.TextBox:CaptureFocus();
        return;
    end;
end;
v3.TryReleaseFocus = function(v21) --[[ Line: 141 ]] --[[ Name: TryReleaseFocus ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v21.TextBox then
        return;
    elseif l_UserInputService_0:GetFocusedTextBox() ~= v21.TextBox then
        return;
    else
        v21.TextBox:ReleaseFocus();
        return;
    end;
end;
v3.Destroy = function(v22) --[[ Line: 150 ]] --[[ Name: Destroy ]]
    for _, v24 in v22.Events do
        v24:Disconnect();
    end;
    v22.Events = {};
    for _, v26 in v22.TextBoxEvents do
        v26:Disconnect();
    end;
    v22.TextBoxEvents = {};
    if v22.ScreenGui then
        v22.ScreenGui:Destroy();
    end;
    v22.ScreenGui = nil;
    if v22.TextBox then
        v22.TextBox:Destroy();
    end;
    v22.TextBox = nil;
end;
return v3;