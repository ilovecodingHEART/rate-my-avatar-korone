-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local l_PlayerGui_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
newtween = function(v5, v6, v7) --[[ Line: 11 ]] --[[ Name: newtween ]]
    l_TweenService_0:Create(v5, TweenInfo.new(v6), v7):Play();
end;
local v8 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png", 
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png", 
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png", 
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png", 
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png", 
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png", 
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png", 
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png", 
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
};
local v9 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local v10 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v11 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12"
};
local function _() --[[ Line: 65 ]] --[[ Name: getScreenGui ]]
    local l_ProximityPrompts_0 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = l_PlayerGui_0;
    end;
    return l_ProximityPrompts_0;
end;
local function _(v14) --[[ Line: 76 ]] --[[ Name: setUpCircularProgressBar ]]
    local l_UIGradient_0 = v14.LeftGradient.ProgressBarImage.UIGradient;
    local l_UIGradient_1 = v14.RightGradient.ProgressBarImage.UIGradient;
    v14.Progress.Changed:Connect(function(v17) --[[ Line: 81 ]]
        local v18 = math.clamp(v17 * 360, 0, 360);
        l_UIGradient_0.Rotation = math.clamp(v18, 180, 360);
        l_UIGradient_1.Rotation = math.clamp(v18, 0, 180);
    end);
end;
local function v128(v20, v21, v22) --[[ Line: 88 ]] --[[ Name: createPrompt ]]
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = TweenInfo.new(v20.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v29 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v30 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v31 = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v32 = nil;
    local l_v20_Attribute_0 = v20:GetAttribute("Theme");
    if l_v20_Attribute_0 then
        local l_script_FirstChild_0 = script:FindFirstChild(l_v20_Attribute_0);
        if l_script_FirstChild_0 then
            v32 = l_script_FirstChild_0:Clone();
        end;
    end;
    if v32 == nil then
        v32 = script.Default:Clone();
    end;
    v32.Enabled = true;
    local l_PromptFrame_0 = v32.PromptFrame;
    local l_InputFrame_0 = l_PromptFrame_0.InputFrame;
    local l_ActionText_0 = l_PromptFrame_0.ActionText;
    local l_ObjectText_0 = l_PromptFrame_0.ObjectText;
    local l_BackgroundTransparency_0 = l_PromptFrame_0.BackgroundTransparency;
    local l_ImageTransparency_0 = l_PromptFrame_0.ImageTransparency;
    l_PromptFrame_0.BackgroundTransparency = 1;
    l_PromptFrame_0.ImageTransparency = 1;
    table.insert(v23, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v24, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    table.insert(v25, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v26, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    local function v43(v41) --[[ Line: 131 ]] --[[ Name: setupUIStrokeTweens ]]
        local l_Transparency_0 = v41.Transparency;
        v41.Transparency = 1;
        table.insert(v23, l_TweenService_0:Create(v41, v29, {
            Transparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v41, v29, {
            Transparency = l_Transparency_0
        }));
        table.insert(v25, l_TweenService_0:Create(v41, v29, {
            Transparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v41, v29, {
            Transparency = l_Transparency_0
        }));
    end;
    local function v46(v44) --[[ Line: 140 ]] --[[ Name: setupGUIObjectTweens ]]
        local l_BackgroundTransparency_1 = v44.BackgroundTransparency;
        v44.BackgroundTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
        table.insert(v25, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
    end;
    local function v50(v47) --[[ Line: 149 ]] --[[ Name: setupTextLabelTweens ]]
        local l_TextTransparency_0 = v47.TextTransparency;
        local l_TextStrokeTransparency_0 = v47.TextStrokeTransparency;
        v47.TextTransparency = 1;
        v47.TextStrokeTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v47, v29, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v47, v29, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
        table.insert(v25, l_TweenService_0:Create(v47, v29, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v47, v29, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
    end;
    local function v53(v51) --[[ Line: 160 ]] --[[ Name: setupImageLabelTweens ]]
        local l_ImageTransparency_1 = v51.ImageTransparency;
        v51.ImageTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = l_ImageTransparency_1
        }));
        table.insert(v25, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = l_ImageTransparency_1
        }));
    end;
    local function v54(v55) --[[ Line: 169 ]] --[[ Name: setupUnexpectedChildTweens ]]
        if v55:IsA("UIStroke") then
            v43(v55);
        elseif not v55:IsA("UIGradient") and v55:IsA("GuiObject") then
            v46(v55);
            if v55:IsA("TextLabel") then
                v50(v55);
            elseif v55:IsA("ImageLabel") then
                v53(v55);
            end;
        end;
        for _, v57 in pairs(v55:GetChildren()) do
            v54(v57);
        end;
    end;
    local v58 = {
        [l_InputFrame_0] = false, 
        [l_ActionText_0] = true, 
        [l_ObjectText_0] = true
    };
    for _, v60 in pairs(l_PromptFrame_0:GetChildren()) do
        if v58[v60] == nil then
            v54(v60);
        elseif v58[v60] == true then
            for _, v62 in pairs(v60:GetChildren()) do
                v54(v62);
            end;
        end;
    end;
    local l_Frame_0 = l_InputFrame_0.Frame;
    local l_UIScale_0 = l_Frame_0.UIScale;
    local v65 = v21 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v23, l_TweenService_0:Create(l_UIScale_0, v29, {
        Scale = v65
    }));
    table.insert(v24, l_TweenService_0:Create(l_UIScale_0, v29, {
        Scale = 1
    }));
    v50(l_ActionText_0);
    v50(l_ObjectText_0);
    local l_ButtonFrame_0 = l_Frame_0.ButtonFrame;
    (function() --[[ Line: 216 ]] --[[ Name: setupButtonFrameTweens ]]
        local l_BackgroundTransparency_2 = l_ButtonFrame_0.BackgroundTransparency;
        local l_ImageTransparency_2 = l_ButtonFrame_0.ImageTransparency;
        table.insert(v25, l_TweenService_0:Create(l_ButtonFrame_0, v30, {
            BackgroundTransparency = 1, 
            ImageTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonFrame_0, v30, {
            BackgroundTransparency = l_BackgroundTransparency_2, 
            ImageTransparency = l_ImageTransparency_2
        }));
        for _, v70 in pairs(l_ButtonFrame_0:getChildren()) do
            if v70:IsA("UIStroke") then
                local l_Transparency_1 = v70.Transparency;
                table.insert(v25, l_TweenService_0:Create(v70, v30, {
                    Transparency = 1
                }));
                table.insert(v26, l_TweenService_0:Create(v70, v30, {
                    Transparency = l_Transparency_1
                }));
            end;
        end;
    end)();
    local l_ButtonImage_0 = l_Frame_0.ButtonImage;
    local l_ButtonText_0 = l_Frame_0.ButtonText;
    local l_ButtonTextImage_0 = l_Frame_0.ButtonTextImage;
    local function v81() --[[ Line: 238 ]] --[[ Name: setupButtonTextTweens ]]
        local l_TextTransparency_1 = l_ButtonText_0.TextTransparency;
        local l_TextStrokeTransparency_1 = l_ButtonText_0.TextStrokeTransparency;
        local l_BackgroundTransparency_3 = l_ButtonText_0.BackgroundTransparency;
        l_ButtonText_0.BackgroundTransparency = 1;
        l_ButtonText_0.TextStrokeTransparency = 1;
        l_ButtonText_0.TextTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonText_0, v30, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonText_0, v30, {
            TextTransparency = l_TextTransparency_1, 
            TextStrokeTransparency = l_TextStrokeTransparency_1, 
            BackgroundTransparency = l_BackgroundTransparency_3
        }));
        for _, v79 in pairs(l_ButtonText_0:getChildren()) do
            if v79:IsA("UIStroke") then
                local l_Transparency_2 = v79.Transparency;
                table.insert(v25, l_TweenService_0:Create(v79, v30, {
                    Transparency = 1
                }));
                table.insert(v26, l_TweenService_0:Create(v79, v30, {
                    Transparency = l_Transparency_2
                }));
            end;
        end;
    end;
    local function v84() --[[ Line: 258 ]] --[[ Name: setupButtonImageTweens ]]
        local l_ImageTransparency_3 = l_ButtonImage_0.ImageTransparency;
        local l_BackgroundTransparency_4 = l_ButtonImage_0.BackgroundTransparency;
        l_ButtonImage_0.BackgroundTransparency = 1;
        l_ButtonImage_0.ImageTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonImage_0, v30, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonImage_0, v30, {
            ImageTransparency = l_ImageTransparency_3, 
            BackgroundTransparency = l_BackgroundTransparency_4
        }));
    end;
    local function v87() --[[ Line: 267 ]] --[[ Name: setupIconTweens ]]
        local l_BackgroundTransparency_5 = l_ButtonTextImage_0.BackgroundTransparency;
        local l_ImageTransparency_4 = l_ButtonTextImage_0.ImageTransparency;
        l_ButtonTextImage_0.BackgroundTransparency = 1;
        l_ButtonTextImage_0.ImageTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonTextImage_0, v30, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonTextImage_0, v30, {
            ImageTransparency = l_ImageTransparency_4, 
            BackgroundTransparency = l_BackgroundTransparency_5
        }));
    end;
    if v21 == Enum.ProximityPromptInputType.Gamepad then
        if v8[v20.GamepadKeyCode] then
            v87();
            l_ButtonTextImage_0.Image = v8[v20.GamepadKeyCode];
            l_ButtonText_0.Visible = false;
            l_ButtonImage_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        end;
    elseif v21 == Enum.ProximityPromptInputType.Touch then
        v84();
        l_ButtonImage_0.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ButtonText_0.Visible = false;
        l_ButtonTextImage_0.Visible = false;
        l_ButtonImage_0.Visible = true;
    else
        v84();
        l_ButtonImage_0.Visible = false;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v20.KeyboardKeyCode);
        local v89 = v9[v20.KeyboardKeyCode];
        if v89 == nil then
            v89 = v10[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v89 == nil then
            local v90 = v11[v20.KeyboardKeyCode];
            if v90 then
                l_l_UserInputService_0_StringForKeyCode_0 = v90;
            end;
        end;
        if v89 then
            v87();
            l_ButtonTextImage_0.Image = v89;
            l_ButtonText_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            if string.len(l_l_UserInputService_0_StringForKeyCode_0) > 2 then
                l_ButtonText_0.TextSize = math.round(l_ButtonText_0.TextSize * 6 / 7);
            end;
            v81();
            l_ButtonText_0.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_ButtonTextImage_0.Visible = false;
            l_ButtonText_0.Visible = true;
        else
            error("ProximityPrompt '" .. v20.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v20.KeyboardKeyCode));
        end;
    end;
    if v21 == Enum.ProximityPromptInputType.Touch or v20.ClickablePrompt then
        local l_TextButton_0 = v32.TextButton;
        local v92 = false;
        do
            local l_v92_0 = v92;
            l_TextButton_0.InputBegan:Connect(function(v94) --[[ Line: 341 ]]
                if (v94.UserInputType == Enum.UserInputType.Touch or v94.UserInputType == Enum.UserInputType.MouseButton1) and v94.UserInputState ~= Enum.UserInputState.Change then
                    v20:InputHoldBegin();
                    l_v92_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v95) --[[ Line: 348 ]]
                if (v95.UserInputType == Enum.UserInputType.Touch or v95.UserInputType == Enum.UserInputType.MouseButton1) and l_v92_0 then
                    l_v92_0 = false;
                    v20:InputHoldEnd();
                end;
            end);
            v32.Active = true;
        end;
    end;
    if v20.HoldDuration > 0 then
        local l_ProgressBar_0 = l_Frame_0.ProgressBar;
        local l_UIGradient_2 = l_ProgressBar_0.LeftGradient.ProgressBarImage.UIGradient;
        local l_UIGradient_3 = l_ProgressBar_0.RightGradient.ProgressBarImage.UIGradient;
        local l_l_UIGradient_2_0 = l_UIGradient_2 --[[ copy: 38 -> 49 ]];
        local l_l_UIGradient_3_0 = l_UIGradient_3 --[[ copy: 39 -> 50 ]];
        l_ProgressBar_0.Progress.Changed:Connect(function(v101) --[[ Line: 81 ]]
            local v102 = math.clamp(v101 * 360, 0, 360);
            l_l_UIGradient_2_0.Rotation = math.clamp(v102, 180, 360);
            l_l_UIGradient_3_0.Rotation = math.clamp(v102, 0, 180);
        end);
        table.insert(v23, l_TweenService_0:Create(l_ProgressBar_0.Progress, v27, {
            Value = 1
        }));
        table.insert(v24, l_TweenService_0:Create(l_ProgressBar_0.Progress, v31, {
            Value = 0
        }));
    end;
    local v103 = nil;
    local v104 = nil;
    local v105 = nil;
    local v106 = nil;
    if v20.HoldDuration > 0 then
        v103 = v20.PromptButtonHoldBegan:Connect(function() --[[ Line: 373 ]]
            for _, v108 in ipairs(v23) do
                v108:Play();
            end;
        end);
        v104 = v20.PromptButtonHoldEnded:Connect(function() --[[ Line: 379 ]]
            for _, v110 in ipairs(v24) do
                v110:Play();
            end;
        end);
    end;
    v105 = v20.Triggered:Connect(function() --[[ Line: 386 ]]
        for _, v112 in ipairs(v25) do
            v112:Play();
        end;
    end);
    v106 = v20.TriggerEnded:Connect(function() --[[ Line: 392 ]]
        for _, v114 in ipairs(v26) do
            v114:Play();
        end;
    end);
    local function v120() --[[ Line: 398 ]] --[[ Name: updateUIFromPrompt ]]
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v20.ActionText, l_ActionText_0.TextSize, l_ActionText_0.Font, Vector2.new(1000, 1000));
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v20.ObjectText, l_ObjectText_0.TextSize, l_ObjectText_0.Font, Vector2.new(1000, 1000));
        local v117 = math.max(l_l_TextService_0_TextSize_0.X, l_l_TextService_0_TextSize_1.X);
        local v118 = 72;
        if v20.ActionText ~= nil and v20.ActionText ~= "" or v20.ObjectText ~= nil and v20.ObjectText ~= "" then
            v118 = v117 + 72 + 24;
        end;
        local v119 = 0;
        if v20.ObjectText ~= nil and v20.ObjectText ~= "" then
            v119 = 9;
        end;
        l_ActionText_0.Position = UDim2.new(0.5, 72 - v118 / 2, 0, v119);
        l_ObjectText_0.Position = UDim2.new(0.5, 72 - v118 / 2, 0, -10);
        l_ActionText_0.Text = v20.ActionText;
        l_ObjectText_0.Text = v20.ObjectText;
        l_ActionText_0.AutoLocalize = v20.AutoLocalize;
        l_ActionText_0.RootLocalizationTable = v20.RootLocalizationTable;
        l_ObjectText_0.AutoLocalize = v20.AutoLocalize;
        l_ObjectText_0.RootLocalizationTable = v20.RootLocalizationTable;
        v32.Size = UDim2.fromOffset(v118, 72);
        v32.SizeOffset = Vector2.new(v20.UIOffset.X / v32.Size.Width.Offset, v20.UIOffset.Y / v32.Size.Height.Offset);
    end;
    local v121 = v20.Changed:Connect(v120);
    v120();
    local l_Parent_0 = v20.Parent;
    v32.Adornee = l_Parent_0;
    v32.Parent = v22;
    for _, v124 in ipairs(v26) do
        v124:Play();
        script.Highlight.OutlineTransparency = 1;
        newtween(script.Highlight, 0.25, {
            OutlineTransparency = 0
        });
        local l_Parent_1 = v20.Parent;
        if v20.Parent.Parent.ClassName == "Model" then
            l_Parent_1 = v20.Parent.Parent;
        end;
        if v20.Parent:IsA("Seat") then
            l_Parent_1 = v20.Parent.Parent.Parent;
        end;
        if v20.Parent.Name == "BoothInteraction" then
            l_Parent_1 = v20.Parent.BoothModel.Value;
        end;
        script.Highlight.Adornee = l_Parent_1;
    end;
    return function() --[[ Line: 454 ]] --[[ Name: cleanup ]]
        if v103 then
            v103:Disconnect();
        end;
        if v104 then
            v104:Disconnect();
        end;
        v105:Disconnect();
        v106:Disconnect();
        v121:Disconnect();
        for _, v127 in ipairs(v25) do
            v127:Play();
            newtween(script.Highlight, 1, {
                OutlineTransparency = 1
            });
        end;
        wait(0.2);
        v32.Parent = nil;
    end;
end;
local function _() --[[ Line: 480 ]] --[[ Name: onLoad ]]
    l_ProximityPromptService_0.PromptShown:Connect(function(v129, v130) --[[ Line: 481 ]]
        if v129.Style == Enum.ProximityPromptStyle.Default then
            return;
        else
            local l_ProximityPrompts_1 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = l_PlayerGui_0;
            end;
            l_ProximityPrompts_1 = v128(v129, v130, l_ProximityPrompts_1);
            v129.PromptHidden:Wait();
            l_ProximityPrompts_1();
            return;
        end;
    end);
end;
l_ProximityPromptService_0.PromptShown:Connect(function(v133, v134) --[[ Line: 481 ]]
    if v133.Style == Enum.ProximityPromptStyle.Default then
        return;
    else
        local l_ProximityPrompts_2 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
        if l_ProximityPrompts_2 == nil then
            l_ProximityPrompts_2 = Instance.new("ScreenGui");
            l_ProximityPrompts_2.Name = "ProximityPrompts";
            l_ProximityPrompts_2.ResetOnSpawn = false;
            l_ProximityPrompts_2.Parent = l_PlayerGui_0;
        end;
        l_ProximityPrompts_2 = v128(v133, v134, l_ProximityPrompts_2);
        v133.PromptHidden:Wait();
        l_ProximityPrompts_2();
        return;
    end;
end);