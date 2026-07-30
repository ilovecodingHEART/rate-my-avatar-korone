-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x1, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_SoundService_0 = game:GetService("SoundService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = workspace:WaitForChild("Camera");
local l_Templates_0 = l_ReplicatedStorage_0.Templates;
local v11 = require(l_ReplicatedStorage_0.Remotes);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui", 15);
local l_UITemplates_0 = l_StarterGui_0:WaitForChild("UITemplates", 15);
local v16 = nil;
local function _(v21, v22) --[[ Line: 29 ]] --[[ Name: popup ]]
    spawn(function() --[[ Line: 30 ]]
        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
            l_SoundService_0.SFX.BellRing:Play();
            local v23 = l_UITemplates_0[v21 .. "Popup"];
            if not v23 then
                print("NOPE");
                return;
            else
                local v24 = v23:Clone();
                v24.Message.Text = v22;
                v24.Transparency = 1;
                v24.UIScale.Scale = 0;
                v24.Parent = l_ScreenGui_0.Popups;
                local v25 = {
                    Transparency = 0
                };
                l_TweenService_0:Create(v24, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v25):Play();
                v25 = v24.UIScale;
                local v26 = {
                    Scale = 1
                };
                local l_Back_0 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v25, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v26):Play();
                v25 = v24.Message;
                v26 = {
                    MaxVisibleGraphemes = #v22
                };
                l_TweenService_0:Create(v25, TweenInfo.new(1, Enum.EasingStyle.Quint), v26):Play();
                wait(4);
                v25 = {
                    Transparency = 1
                };
                l_TweenService_0:Create(v24, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v25):Play();
                v25 = v24.UIScale;
                v26 = {
                    Scale = 0
                };
                l_Back_0 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v25, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v26):Play();
                wait(0.5);
                v24:Destroy();
            end;
        end;
    end);
end;
local function v33(v29, v30) --[[ Line: 57 ]] --[[ Name: popupFrame ]]
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Continue.Text = v29;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.TextLabel.Text = v30;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Visible = true;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Position = UDim2.new(0.5, 0, 0.55, 0);
    local l_PopupAlert_0 = l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert;
    local v32 = {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    };
    l_TweenService_0:Create(l_PopupAlert_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v32):Play();
    l_PopupAlert_0 = workspace.Camera;
    v32 = {
        FieldOfView = 60
    };
    l_TweenService_0:Create(l_PopupAlert_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v32):Play();
    l_PopupAlert_0 = l_Lighting_0.Blur;
    v32 = {
        Size = 10
    };
    l_TweenService_0:Create(l_PopupAlert_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v32):Play();
end;
local v34 = require(l_ReplicatedStorage_0.popupError);
displayToggle = function(v35, v36) --[[ Line: 69 ]] --[[ Name: displayToggle ]]
    if v36 then
        local l_Toggle_0 = v35.Toggle;
        local v38 = {
            BackgroundColor3 = Color3.fromRGB(32, 206, 145)
        };
        local _ = Enum.EasingStyle.Back;
        l_TweenService_0:Create(l_Toggle_0, TweenInfo.new(0.35, Enum.EasingStyle.Quint), v38):Play();
        l_Toggle_0 = v35.Toggle.Circle;
        v38 = {
            Position = UDim2.new(0.7, 0, 0.5, 0)
        };
        l_TweenService_0:Create(l_Toggle_0, TweenInfo.new(0.35, Enum.EasingStyle.Quint), v38):Play();
        v35:SetAttribute("Value", true);
        return;
    else
        local l_Toggle_1 = v35.Toggle;
        local v41 = {
            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        };
        l_TweenService_0:Create(l_Toggle_1, TweenInfo.new(0.35, Enum.EasingStyle.Quint), v41):Play();
        l_Toggle_1 = v35.Toggle.Circle;
        v41 = {
            Position = UDim2.new(0.3, 0, 0.5, 0)
        };
        local _ = Enum.EasingStyle.Back;
        l_TweenService_0:Create(l_Toggle_1, TweenInfo.new(0.35, Enum.EasingStyle.Quint), v41):Play();
        v35:SetAttribute("Value", false);
        return;
    end;
end;
local function v44() --[[ Line: 81 ]] --[[ Name: loadCustomizationBooth ]]
    local v43 = v11.Function("CurrentBoothDetails"):InvokeServer();
    l_ScreenGui_0.EditBooth.Frame.BoothSetting.Info.Text = v43.name:upper();
    if v43.icon.Image == nil then
        l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.Image = "rbxassetid://15842040263";
		warn((("Booth icon for %s is nil"):format(v43.name)));
        return;
    else
        l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.Image = v43.icon.Image;
        l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.ImageRectSize = v43.icon.ImageRectSize;
        l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.ImageRectOffset = v43.icon.ImageRectOffset;
        return;
    end;
end;
local function v46() --[[ Line: 94 ]] --[[ Name: loadCustomization ]]
    local v45 = v11.Function("GetCustomization"):InvokeServer();
    l_ScreenGui_0.EditBoothText.Frame.TextBox.Text = v45.text;
    l_ScreenGui_0.EditBooth.Frame.TextSetting.Info.Text = v45.text;
    l_ScreenGui_0.EditBooth.Frame.TextSetting:SetAttribute("Value", v45.text);
    print("Customization from server", v45);
    l_ScreenGui_0.EditBooth.Frame.TextFontSetting.Info.Text = v45.textFont.Name;
    l_ScreenGui_0.EditBooth.Frame.TextFontSetting.Info.Font = v45.textFont;
    l_ScreenGui_0.EditBooth.Frame.TextFontSetting:SetAttribute("Value", v45.textFont.Name);
    l_ScreenGui_0.EditBooth.Frame.TextColorSetting.Color.BackgroundColor3 = v45.textColor;
    l_ScreenGui_0.EditBooth.Frame.TextColorSetting:SetAttribute("Value", v45.textColor);
    l_ScreenGui_0.EditBooth.Frame.StrokeColorSetting.Color.BackgroundColor3 = v45.strokeColor;
    l_ScreenGui_0.EditBooth.Frame.StrokeColorSetting:SetAttribute("Value", v45.strokeColor);
    l_ScreenGui_0.EditBooth.Frame.StrokeOpacitySetting.SliderFrame.TextBox.Text = v45.strokeOpacity;
    l_ScreenGui_0.EditBooth.Frame.StrokeOpacitySetting:SetAttribute("Value", v45.strokeOpacity);
    displayToggle(l_ScreenGui_0.EditBooth.Frame.RichTextSetting, v45.richText);
    l_ScreenGui_0.EditBooth.Frame.RichTextSetting:SetAttribute("Value", v45.richText);
    l_ScreenGui_0.EditBooth.Frame.ButtonLayoutSetting.Info.Text = v45.buttonLayout or "Normal";
    l_ScreenGui_0.EditBooth.Frame.ButtonLayoutSetting:SetAttribute("Value", v45.buttonLayout);
    if v45.boothTextFont then
        l_ScreenGui_0.EditBooth.Frame.ButtonTextFontSetting.Info.Text = v45.buttonTextFont.Name;
        l_ScreenGui_0.EditBooth.Frame.ButtonTextFontSetting.Info.Font = v45.buttonTextFont;
        l_ScreenGui_0.EditBooth.Frame.ButtonTextFontSetting:SetAttribute("Value", v45.buttonTextFont.Name);
    end;
    if v45.buttonColor then
        l_ScreenGui_0.EditBooth.Frame.ButtonBackColorSetting.Color.BackgroundColor3 = v45.buttonColor;
        l_ScreenGui_0.EditBooth.Frame.ButtonBackColorSetting:SetAttribute("Value", v45.buttonColor);
    end;
    if v45.buttonTextColor then
        l_ScreenGui_0.EditBooth.Frame.ButtonTextColorSetting.Color.BackgroundColor3 = v45.buttonTextColor;
        l_ScreenGui_0.EditBooth.Frame.ButtonTextColorSetting:SetAttribute("Value", v45.buttonTextColor);
    end;
    if v45.buttonStrokeColor then
        l_ScreenGui_0.EditBooth.Frame.ButtonStrokeColorSetting.Color.BackgroundColor3 = v45.buttonStrokeColor;
        l_ScreenGui_0.EditBooth.Frame.ButtonStrokeColorSetting:SetAttribute("Value", v45.buttonStrokeColor);
    end;
    if v45.buttonHoverColor then
        l_ScreenGui_0.EditBooth.Frame.ButtonHoverColorSetting.Color.BackgroundColor3 = v45.buttonHoverColor;
        l_ScreenGui_0.EditBooth.Frame.ButtonHoverColorSetting:SetAttribute("Value", v45.buttonHoverColor);
    end;
end;
local v47 = true;
local function v56() --[[ Line: 151 ]] --[[ Name: onBoothClaimed ]]
    if v47 then
        v47 = false;
        task.spawn(v44);
        task.spawn(v46);
    end;
    l_SoundService_0.SFX.ClaimStand:Play();
    local l_spawn_0 = spawn;
    local v49 = "success";
    local v50 = "claimed booth!";
    l_spawn_0(function() --[[ Line: 30 ]]
        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
            l_SoundService_0.SFX.BellRing:Play();
            local v51 = l_UITemplates_0[v49 .. "Popup"];
            if not v51 then
                print("NOPE");
                return;
            else
                local v52 = v51:Clone();
                v52.Message.Text = v50;
                v52.Transparency = 1;
                v52.UIScale.Scale = 0;
                v52.Parent = l_ScreenGui_0.Popups;
                local v53 = {
                    Transparency = 0
                };
                l_TweenService_0:Create(v52, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v53):Play();
                v53 = v52.UIScale;
                local v54 = {
                    Scale = 1
                };
                local l_Back_3 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v53, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v54):Play();
                v53 = v52.Message;
                v54 = {
                    MaxVisibleGraphemes = #v50
                };
                l_TweenService_0:Create(v53, TweenInfo.new(1, Enum.EasingStyle.Quint), v54):Play();
                wait(4);
                v53 = {
                    Transparency = 1
                };
                l_TweenService_0:Create(v52, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v53):Play();
                v53 = v52.UIScale;
                v54 = {
                    Scale = 0
                };
                l_Back_3 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v53, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v54):Play();
                wait(0.5);
                v52:Destroy();
            end;
        end;
    end);
	local nav = l_ScreenGui_0:WaitForChild("NavigationButtons")
	local edit = nav:WaitForChild("EditBooth")

	edit.Visible = true
end;
local function v60() --[[ Line: 168 ]] --[[ Name: handleNoAssets ]]
    l_ScreenGui_0.TutorialA.Visible = true;
    local l_v16_Attribute_0 = v16:GetAttribute("BoothSlot");
    local v58 = l_PlayerGui_0.MapUIContainer.MapUI.BoothUI["BoothUI" .. l_v16_Attribute_0];
    local v59 = l_Templates_0.AddItem:Clone();
    v59.Parent = v58.Items.Frame;
    v59.Activated:Connect(function() --[[ Line: 175 ]]
        l_ScreenGui_0.TutorialA.Visible = true;
    end);
    v33("OKAY, GOT IT!", "You have no items on sale. For buttons to appear on your booth, put clothing or a gamepass on sale and refresh! Click on the plus button on your booth for a quick tutorial!");
end;
v11.OnClientEvent("NoAssets"):Connect(v60);
local function v70() --[[ Line: 201 ]] --[[ Name: onBoothEdit ]]
    l_ScreenGui_0:WaitForChild("EditBooth").Visible = true;
end;
local function v72(v71) --[[ Line: 205 ]] --[[ Name: updateYourBooth ]]
    l_LocalPlayer_0.PlayerGui.YourBooth.Adornee = v71;
end;
local function v118(v73) --[[ Line: 209 ]] --[[ Name: forBoothInteraction ]]
    local l_v73_Attribute_0 = v73:GetAttribute("BoothSlot");
    local l_Claim_0 = v73:WaitForChild("Claim");
    local l_Edit_0 = v73:WaitForChild("Edit");
    local l_ViewItems_0 = v73:WaitForChild("ViewItems");
    l_Claim_0.PromptButtonHoldBegan:Connect(function() --[[ Line: 214 ]]
        v11.Event("PreloadItems"):FireServer();
    end);
    l_Claim_0.Triggered:Connect(function() --[[ Line: 217 ]]
        if v16 ~= nil then
            l_SoundService_0.SFX.Fail:Play();
            local l_spawn_2 = spawn;
            local v79 = "warn";
            local v80 = "you already claimed a booth!";
            l_spawn_2(function() --[[ Line: 30 ]]
                if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
                    l_SoundService_0.SFX.BellRing:Play();
                    local v81 = l_UITemplates_0[v79 .. "Popup"];
                    if not v81 then
                        print("NOPE");
                        return;
                    else
                        local v82 = v81:Clone();
                        v82.Message.Text = v80;
                        v82.Transparency = 1;
                        v82.UIScale.Scale = 0;
                        v82.Parent = l_ScreenGui_0.Popups;
                        local v83 = {
                            Transparency = 0
                        };
                        l_TweenService_0:Create(v82, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v83):Play();
                        v83 = v82.UIScale;
                        local v84 = {
                            Scale = 1
                        };
                        local l_Back_5 = Enum.EasingStyle.Back;
                        l_TweenService_0:Create(v83, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v84):Play();
                        v83 = v82.Message;
                        v84 = {
                            MaxVisibleGraphemes = #v80
                        };
                        l_TweenService_0:Create(v83, TweenInfo.new(1, Enum.EasingStyle.Quint), v84):Play();
                        wait(4);
                        v83 = {
                            Transparency = 1
                        };
                        l_TweenService_0:Create(v82, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v83):Play();
                        v83 = v82.UIScale;
                        v84 = {
                            Scale = 0
                        };
                        l_Back_5 = Enum.EasingStyle.Back;
                        l_TweenService_0:Create(v83, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v84):Play();
                        wait(0.5);
                        v82:Destroy();
                    end;
                end;
            end);
            return;
        else
            xpcall(function() --[[ Line: 222 ]]
                local _ = os.clock();
                local v87 = v11.Function("ClaimBooth"):InvokeServer(l_v73_Attribute_0);
                if v87.error == "already_have_booth" then
                    l_SoundService_0.SFX.Fail:Play();
                    local l_spawn_3 = spawn;
                    local v89 = "warn";
                    local v90 = "you already claimed a booth!";
                    l_spawn_3(function() --[[ Line: 30 ]]
                        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
                            l_SoundService_0.SFX.BellRing:Play();
                            local v91 = l_UITemplates_0[v89 .. "Popup"];
                            if not v91 then
                                print("NOPE");
                                return;
                            else
                                local v92 = v91:Clone();
                                v92.Message.Text = v90;
                                v92.Transparency = 1;
                                v92.UIScale.Scale = 0;
                                v92.Parent = l_ScreenGui_0.Popups;
                                local v93 = {
                                    Transparency = 0
                                };
                                l_TweenService_0:Create(v92, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v93):Play();
                                v93 = v92.UIScale;
                                local v94 = {
                                    Scale = 1
                                };
                                local l_Back_6 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v93, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v94):Play();
                                v93 = v92.Message;
                                v94 = {
                                    MaxVisibleGraphemes = #v90
                                };
                                l_TweenService_0:Create(v93, TweenInfo.new(1, Enum.EasingStyle.Quint), v94):Play();
                                wait(4);
                                v93 = {
                                    Transparency = 1
                                };
                                l_TweenService_0:Create(v92, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v93):Play();
                                v93 = v92.UIScale;
                                v94 = {
                                    Scale = 0
                                };
                                l_Back_6 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v93, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v94):Play();
                                wait(0.5);
                                v92:Destroy();
                            end;
                        end;
                    end);
                    return;
                elseif v87.error == "hit_rate_limit" then
                    l_SoundService_0.Fail:Play();
                    local l_spawn_4 = spawn;
                    local v97 = "danger";
                    local v98 = "claimed booth too recently, try again later";
                    l_spawn_4(function() --[[ Line: 30 ]]
                        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
                            l_SoundService_0.SFX.BellRing:Play();
                            local v99 = l_UITemplates_0[v97 .. "Popup"];
                            if not v99 then
                                print("NOPE");
                                return;
                            else
                                local v100 = v99:Clone();
                                v100.Message.Text = v98;
                                v100.Transparency = 1;
                                v100.UIScale.Scale = 0;
                                v100.Parent = l_ScreenGui_0.Popups;
                                local v101 = {
                                    Transparency = 0
                                };
                                l_TweenService_0:Create(v100, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v101):Play();
                                v101 = v100.UIScale;
                                local v102 = {
                                    Scale = 1
                                };
                                local l_Back_7 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v101, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v102):Play();
                                v101 = v100.Message;
                                v102 = {
                                    MaxVisibleGraphemes = #v98
                                };
                                l_TweenService_0:Create(v101, TweenInfo.new(1, Enum.EasingStyle.Quint), v102):Play();
                                wait(4);
                                v101 = {
                                    Transparency = 1
                                };
                                l_TweenService_0:Create(v100, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v101):Play();
                                v101 = v100.UIScale;
                                v102 = {
                                    Scale = 0
                                };
                                l_Back_7 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v101, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v102):Play();
                                wait(0.5);
                                v100:Destroy();
                            end;
                        end;
                    end);
                    return;
                else
					if v87.error == "claimed" then
                        v56();
                        v16 = v73;
                        task.spawn(v72, v73);
                    end;
                    return;
                end;
            end, function(v104) --[[ Line: 235 ]]
                warn("Caught error when claiming booth: " .. v104);
                v34({
                    title = "Failed to claim booth, please report this!", 
                    errorMessage = v104
                });
                task.delay(1, function() --[[ Line: 241 ]]
                    local l_spawn_5 = spawn;
                    local v106 = "warn";
                    local v107 = "nvm!";
                    l_spawn_5(function() --[[ Line: 30 ]]
                        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
                            l_SoundService_0.SFX.BellRing:Play();
                            local v108 = l_UITemplates_0[v106 .. "Popup"];
                            if not v108 then
                                print("NOPE");
                                return;
                            else
                                local v109 = v108:Clone();
                                v109.Message.Text = v107;
                                v109.Transparency = 1;
                                v109.UIScale.Scale = 0;
                                v109.Parent = l_ScreenGui_0.Popups;
                                local v110 = {
                                    Transparency = 0
                                };
                                l_TweenService_0:Create(v109, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v110):Play();
                                v110 = v109.UIScale;
                                local v111 = {
                                    Scale = 1
                                };
                                local l_Back_8 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v110, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v111):Play();
                                v110 = v109.Message;
                                v111 = {
                                    MaxVisibleGraphemes = #v107
                                };
                                l_TweenService_0:Create(v110, TweenInfo.new(1, Enum.EasingStyle.Quint), v111):Play();
                                wait(4);
                                v110 = {
                                    Transparency = 1
                                };
                                l_TweenService_0:Create(v109, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v110):Play();
                                v110 = v109.UIScale;
                                v111 = {
                                    Scale = 0
                                };
                                l_Back_8 = Enum.EasingStyle.Back;
                                l_TweenService_0:Create(v110, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v111):Play();
                                wait(0.5);
                                v109:Destroy();
                            end;
                        end;
                    end);
                end);
            end);
            return;
        end;
    end);
    l_Edit_0.Triggered:Connect(v70);
    l_ViewItems_0.Triggered:Connect(function() --[[ Line: 247 ]]
        local _ = l_LocalPlayer_0.PlayerGui.MapUIContainer.MapUI.BoothUI["BoothUI" .. l_v73_Attribute_0];
    end);
    local function v117(_) --[[ Line: 250 ]] --[[ Name: updateProximityPrompts ]]
        local v115 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1;
        local l_v73_Attribute_1 = v73:GetAttribute("BoothOwner");
        if v73 == v16 and l_v73_Attribute_1 == nil then
            l_LocalPlayer_0.PlayerGui.YourBooth.Adornee = nil;
            v16 = nil;
        end;
        if l_v73_Attribute_1 == nil then
            l_Claim_0.Enabled = true;
            l_Edit_0.Enabled = false;
            l_ViewItems_0.Enabled = false;
            return;
        elseif l_v73_Attribute_1 == l_LocalPlayer_0.UserId then
            l_Claim_0.Enabled = false;
            l_Edit_0.Enabled = true;
            l_ViewItems_0.Enabled = false;
            return;
        else
            l_Claim_0.Enabled = false;
            l_Edit_0.Enabled = false;
            l_ViewItems_0.Enabled = v115;
            return;
        end;
    end;
    v73:GetAttributeChangedSignal("BoothOwner"):Connect(v117);
    l_UserInputService_0.LastInputTypeChanged:Connect(v117);
    v117();
end;
for _, v120 in pairs(l_CollectionService_0:GetTagged("BoothInteraction")) do
    v118(v120);
end;
l_CollectionService_0:GetInstanceAddedSignal("BoothInteraction"):Connect(v118);