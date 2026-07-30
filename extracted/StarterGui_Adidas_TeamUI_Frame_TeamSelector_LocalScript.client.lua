-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Lighting_0 = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("GroupService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_AdidasTeams_0 = require(l_ReplicatedStorage_0:WaitForChild("AdidasTeams"));
local l_ApplyTeamOutfit_0 = l_ReplicatedStorage_0:WaitForChild("ApplyTeamOutfit");
local v12 = require(script.Transition);
local v13 = workspace:WaitForChild("Adidas") or l_ReplicatedStorage_0:WaitForChild("Adidas");
local l_TeamSelectionPart_0 = v13:WaitForChild("TeamSelectionPart");
local l_Parent_0 = script.Parent;
local l_Select_0 = script.Parent.Parent.Select;
local l_Parent_1 = script.Parent.Parent.Parent;
local l_Team_0 = script:WaitForChild("Team");
local l_Dialog_0 = script.Parent.Parent:WaitForChild("Dialog");
local v20 = nil;
local function _(v21, v22, v23, v24) --[[ Line: 44 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v25 = TweenInfo.new(v22, v24 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v21, v25, v23):Play();
end;
local v27 = {};
local v28 = {};
for _, v30 in ipairs(l_AdidasTeams_0) do
    if typeof(v30) == "table" and typeof(v30.Name) == "string" then
        v27[v30.Name] = v30;
        if typeof(v30.LogoId) == "number" and v30.LogoId > 0 then
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Image = "rbxassetid://" .. tostring(v30.LogoId);
            l_ImageLabel_0.Size = UDim2.fromOffset(0, 0);
            l_ImageLabel_0.Visible = false;
            l_ImageLabel_0.Parent = script;
            table.insert(v28, l_ImageLabel_0);
        end;
    end;
end;
l_ContentProvider_0:PreloadAsync(v28);
local function v43(v32) --[[ Line: 71 ]] --[[ Name: applyStadiumColors ]]
    -- upvalues: l_CollectionService_0 (copy), l_TweenService_0 (copy)
    local l_PrimaryColor_0 = v32.PrimaryColor;
    local l_SecondaryColor_0 = v32.SecondaryColor;
    if not l_PrimaryColor_0 or not l_SecondaryColor_0 then
        return;
    else
        for _, v36 in ipairs(l_CollectionService_0:GetTagged("PrimaryColor")) do
            if v36 and v36.Parent and v36:IsA("BasePart") then
                local v37 = {
                    Color = l_PrimaryColor_0
                };
                local v38 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v36, v38, v37):Play();
            end;
        end;
        for _, v40 in ipairs(l_CollectionService_0:GetTagged("SecondaryColor")) do
            if v40 and v40.Parent and v40:IsA("BasePart") then
                local v41 = {
                    Color = l_SecondaryColor_0
                };
                local v42 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v40, v42, v41):Play();
            end;
        end;
        return;
    end;
end;
local function v50(v44) --[[ Line: 89 ]] --[[ Name: applyClubLogos ]]
    -- upvalues: l_CollectionService_0 (copy)
    local l_LogoId_0 = v44.LogoId;
    if typeof(l_LogoId_0) ~= "number" or l_LogoId_0 <= 0 then
        return;
    else
        local v46 = "rbxassetid://" .. tostring(l_LogoId_0);
        for _, v48 in ipairs(l_CollectionService_0:GetTagged("ClubLogo")) do
            if v48:IsA("Decal") then
                v48.Texture = v46;
            elseif v48:IsA("SurfaceGui") then
                local l_v48_FirstChildWhichIsA_0 = v48:FindFirstChildWhichIsA("ImageLabel", true);
                if l_v48_FirstChildWhichIsA_0 then
                    l_v48_FirstChildWhichIsA_0.Image = v46;
                end;
            end;
        end;
        return;
    end;
end;
local function v56(v51) --[[ Line: 106 ]] --[[ Name: setSelected ]]
    -- upvalues: v20 (ref), l_Parent_0 (copy)
    v20 = v51;
    for _, v53 in ipairs(l_Parent_0:GetChildren()) do
        if v53:IsA("Frame") then
            local l_GuiButton_0 = v53:FindFirstChildWhichIsA("GuiButton");
            if l_GuiButton_0 then
                local l_l_GuiButton_0_FirstChildOfClass_0 = l_GuiButton_0:FindFirstChildOfClass("UIStroke", true);
                if l_l_GuiButton_0_FirstChildOfClass_0 then
                    l_l_GuiButton_0_FirstChildOfClass_0.Enabled = l_GuiButton_0 == v51;
                end;
            end;
        end;
    end;
end;
local function _(v57) --[[ Line: 120 ]] --[[ Name: ensureButtonScale ]]
    local l_UIScale_0 = v57:FindFirstChildOfClass("UIScale");
    if not l_UIScale_0 then
        l_UIScale_0 = Instance.new("UIScale");
        l_UIScale_0.Parent = v57;
    end;
    return l_UIScale_0;
end;
local function v64() --[[ Line: 129 ]] --[[ Name: getAllTeamButtons ]]
    -- upvalues: l_Parent_0 (copy)
    local v60 = {};
    for _, v62 in ipairs(l_Parent_0:GetChildren()) do
        if v62:IsA("Frame") then
            local l_GuiButton_1 = v62:FindFirstChildWhichIsA("GuiButton");
            if l_GuiButton_1 then
                table.insert(v60, l_GuiButton_1);
            end;
        end;
    end;
    return v60;
end;
local _ = function(v65) --[[ Line: 142 ]] --[[ Name: resetAllButtonScales ]]
    -- upvalues: v64 (copy)
    for _, v67 in ipairs((v64())) do
        local l_UIScale_1 = v67:FindFirstChildOfClass("UIScale");
        if not l_UIScale_1 then
            l_UIScale_1 = Instance.new("UIScale");
            l_UIScale_1.Parent = v67;
        end;
        l_UIScale_1.Scale = v65;
    end;
end;
for _, v71 in ipairs(l_Parent_0:GetChildren()) do
    if v71:IsA("Frame") and v71.Name:match("_Slot$") then
        v71:Destroy();
    end;
end;
local l_l_LocalPlayer_0_RankInGroupAsync_0 = l_LocalPlayer_0:GetRankInGroupAsync(33382339);
local v73 = l_LocalizationService_0:GetCountryRegionForPlayerAsync(l_LocalPlayer_0) == "IL";
for v74, v75 in ipairs(l_AdidasTeams_0) do
    if typeof(v75) == "table" and typeof(v75.Name) == "string" and (l_l_LocalPlayer_0_RankInGroupAsync_0 >= 2 or v73 or v75.Name ~= "Maccabi FC") then
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = v75.Name .. "_Slot";
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.Size = l_Team_0.Size;
        l_Frame_0.AutomaticSize = Enum.AutomaticSize.None;
        l_Frame_0.LayoutOrder = v74;
        l_Frame_0.Parent = l_Parent_0;
        local v77 = l_Team_0:Clone();
        v77.Name = v75.Name;
        v77.Parent = l_Frame_0;
        v77.AnchorPoint = Vector2.new(0.5, 0.5);
        v77.Position = UDim2.fromScale(0.5, 0.5);
        v77.Size = UDim2.fromScale(1, 1);
        v77.AutomaticSize = Enum.AutomaticSize.None;
        v77.LayoutOrder = v74;
        local l_v77_FirstChild_0 = v77:FindFirstChild("TeamLogo", true);
        if l_v77_FirstChild_0 and typeof(v75.LogoId) == "number" and v75.LogoId > 0 then
            l_v77_FirstChild_0.Image = "rbxassetid://" .. tostring(v75.LogoId);
        end;
        local l_v77_FirstChildOfClass_0 = v77:FindFirstChildOfClass("UIStroke", true);
        if l_v77_FirstChildOfClass_0 then
            l_v77_FirstChildOfClass_0.Enabled = false;
        end;
        local l_UIScale_2 = v77:FindFirstChildOfClass("UIScale");
        if not l_UIScale_2 then
            l_UIScale_2 = Instance.new("UIScale");
            l_UIScale_2.Parent = v77;
        end;
        local l_l_UIScale_2_0 = l_UIScale_2;
        l_l_UIScale_2_0.Scale = 1;
        v77.Activated:Connect(function() --[[ Line: 194 ]]
            -- upvalues: v56 (copy), v77 (copy), l_l_UIScale_2_0 (copy), l_TweenService_0 (copy)
            v56(v77);
            l_l_UIScale_2_0.Scale = 0.92;
            local l_l_l_UIScale_2_0_0 = l_l_UIScale_2_0;
            local v83 = {
                Scale = 1
            };
            local l_Back_0 = Enum.EasingStyle.Back;
            local v85 = TweenInfo.new(0.45, l_Back_0 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_l_l_UIScale_2_0_0, v85, v83):Play();
            script.Click:Play();
        end);
        v77.MouseEnter:Connect(function() --[[ Line: 201 ]]
            -- upvalues: v77 (copy), l_TweenService_0 (copy)
            local l_v77_0 = v77;
            local v87 = {
                BackgroundTransparency = 0.3
            };
            local v88 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_v77_0, v88, v87):Play();
        end);
        v77.MouseLeave:Connect(function() --[[ Line: 205 ]]
            -- upvalues: v77 (copy), l_TweenService_0 (copy)
            local l_v77_1 = v77;
            local v90 = {
                BackgroundTransparency = 0.5
            };
            local v91 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_v77_1, v91, v90):Play();
        end);
    end;
end;
l_Select_0.Activated:Connect(function() --[[ Line: 210 ]]
    -- upvalues: v20 (ref), l_LocalPlayer_0 (copy), l_Parent_1 (copy), v27 (copy), v43 (copy), v50 (copy), v12 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_ApplyTeamOutfit_0 (copy)
    if not v20 then
        return;
    else
        local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("SelectedClubTeam");
        local v93 = false;
        if typeof(l_l_LocalPlayer_0_Attribute_0) == "string" then
            v93 = l_l_LocalPlayer_0_Attribute_0 ~= "";
        end;
        if v93 then
            l_Parent_1.Visible = false;
            return;
        else
            local v94 = v27[v20.Name];
            if not v94 then
                return;
            else
                v43(v94);
                v50(v94);
                local l_Transition_0 = script.Parent.Parent.Parent.Parent:FindFirstChild("Transition");
                if l_Transition_0 then
                    v12.Play(l_Transition_0);
                end;
                l_Parent_1.Visible = false;
                local l_Blur_0 = l_Lighting_0:FindFirstChild("Blur");
                if l_Blur_0 and l_Blur_0:IsA("BlurEffect") then
                    l_Blur_0.Size = 20;
                    local v97 = {
                        Size = 0
                    };
                    local v98 = TweenInfo.new(2, Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_Blur_0, v98, v97):Play();
                end;
                print("Applying team outfit color", v94.Name);
                l_ApplyTeamOutfit_0:FireServer(v94.Name);
                script.Select:Play();
                return;
            end;
        end;
    end;
end);
for _, v100 in ipairs(v13:GetDescendants()) do
    if v100.Name == "ClubLogo" then
        l_CollectionService_0:AddTag(v100, "ClubLogo");
    end;
    if v100:IsA("BasePart") then
        if v100.Color == Color3.fromRGB(140, 161, 179) then
            l_CollectionService_0:AddTag(v100, "PrimaryColor");
        elseif v100.Color == Color3.fromRGB(113, 137, 159) then
            l_CollectionService_0:AddTag(v100, "SecondaryColor");
        end;
    end;
end;
l_Parent_1.Visible = false;
local l_Blur_1 = l_Lighting_0:FindFirstChild("Blur");
if l_Blur_1 and l_Blur_1:IsA("BlurEffect") then
    l_Blur_1.Size = 0;
end;
local v102 = {};
(function(v103) --[[ Line: 272 ]] --[[ Name: cacheOriginals ]]
    -- upvalues: v102 (copy)
    for _, v105 in ipairs(v103:GetDescendants()) do
        local v106 = {};
        if v105:IsA("GuiObject") then
            v106.BackgroundTransparency = v105.BackgroundTransparency;
        end;
        if v105:IsA("TextLabel") or v105:IsA("TextButton") or v105:IsA("TextBox") then
            v106.TextTransparency = v105.TextTransparency;
            v106.TextStrokeTransparency = v105.TextStrokeTransparency;
        end;
        if v105:IsA("ImageLabel") or v105:IsA("ImageButton") then
            v106.ImageTransparency = v105.ImageTransparency;
        end;
        if v105:IsA("UIStroke") then
            v106.Transparency = v105.Transparency;
        end;
        if next(v106) ~= nil then
            v102[v105] = v106;
        end;
    end;
    if v103:IsA("GuiObject") then
        v102[v103] = v102[v103] or {};
        v102[v103].BackgroundTransparency = v103.BackgroundTransparency;
    end;
end)(l_Parent_1);
local l_NumberValue_0 = Instance.new("NumberValue");
l_NumberValue_0.Value = 1;
local function _(v108, v109, v110) --[[ Line: 306 ]] --[[ Name: lerp ]]
    return v108 + (v109 - v108) * v110;
end;
local function v117(v112) --[[ Line: 310 ]] --[[ Name: applyAlpha ]]
    -- upvalues: v102 (copy)
    for v113, v114 in pairs(v102) do
        if v113.Parent ~= nil then
            for v115, v116 in pairs(v114) do
                v113[v115] = v116 + (1 - v116) * v112;
            end;
        end;
    end;
end;
v117(1);
l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 322 ]]
    -- upvalues: v117 (copy), l_NumberValue_0 (copy)
    v117(l_NumberValue_0.Value);
end);
l_Dialog_0.MaxVisibleGraphemes = 0;
local v118 = nil;
local function _() --[[ Line: 331 ]] --[[ Name: playTypewriter ]]
    -- upvalues: v118 (ref), l_Dialog_0 (copy)
    if v118 then
        task.cancel(v118);
    end;
    v118 = task.spawn(function() --[[ Line: 333 ]]
        -- upvalues: l_Dialog_0 (ref)
        l_Dialog_0.MaxVisibleGraphemes = 0;
        local v119 = utf8.len(l_Dialog_0.Text) or #l_Dialog_0.Text;
        for v120 = 1, v119 do
            l_Dialog_0.MaxVisibleGraphemes = v120;
            task.wait(0.005);
        end;
    end);
end;
local function _() --[[ Line: 343 ]] --[[ Name: resetTypewriter ]]
    -- upvalues: v118 (ref), l_Dialog_0 (copy)
    if v118 then
        task.cancel(v118);
    end;
    v118 = nil;
    l_Dialog_0.MaxVisibleGraphemes = 0;
end;
local v123 = nil;
local v124 = false;
local _ = function() --[[ Line: 353 ]] --[[ Name: playStaggerButtons ]]
    -- upvalues: v123 (ref), l_RunService_0 (copy), v64 (copy), v124 (ref), l_TweenService_0 (copy)
    if v123 then
        task.cancel(v123);
        v123 = nil;
    end;
    v123 = task.spawn(function() --[[ Line: 359 ]]
        -- upvalues: l_RunService_0 (ref), v64 (ref), v124 (ref), l_TweenService_0 (ref)
        l_RunService_0.Heartbeat:Wait();
        l_RunService_0.Heartbeat:Wait();
        local v125 = v64();
        table.sort(v125, function(v126, v127) --[[ Line: 366 ]]
            local v128 = v126.LayoutOrder or 0;
            local v129 = v127.LayoutOrder or 0;
            if v128 ~= v129 then
                return v128 < v129;
            else
                local l_AbsolutePosition_0 = v126.AbsolutePosition;
                local l_AbsolutePosition_1 = v127.AbsolutePosition;
                if l_AbsolutePosition_0.Y ~= l_AbsolutePosition_1.Y then
                    return l_AbsolutePosition_0.Y < l_AbsolutePosition_1.Y;
                else
                    return l_AbsolutePosition_0.X < l_AbsolutePosition_1.X;
                end;
            end;
        end);
        for _, v133 in ipairs(v125) do
            if not v124 then
                return;
            else
                local l_UIScale_3 = v133:FindFirstChildOfClass("UIScale");
                if not l_UIScale_3 then
                    l_UIScale_3 = Instance.new("UIScale");
                    l_UIScale_3.Parent = v133;
                end;
                local l_l_UIScale_3_0 = l_UIScale_3;
                l_UIScale_3 = {
                    Scale = 1
                };
                local l_Back_1 = Enum.EasingStyle.Back;
                local v137 = TweenInfo.new(0.5, l_Back_1 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_l_UIScale_3_0, v137, l_UIScale_3):Play();
                task.wait(0.01);
            end;
        end;
    end);
end;
local function _() --[[ Line: 392 ]] --[[ Name: stopStaggerButtons ]]
    -- upvalues: v123 (ref)
    if v123 then
        task.cancel(v123);
        v123 = nil;
    end;
end;
local v140 = nil;
local v141 = nil;
local function v164(v142) --[[ Line: 403 ]] --[[ Name: playFade ]]
    -- upvalues: v124 (ref), v140 (ref), v141 (ref), l_NumberValue_0 (copy), v117 (copy), v64 (copy), l_Parent_1 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_Blur_1 (copy), v118 (ref), l_Dialog_0 (copy), v123 (ref)
    if v124 == v142 then
        return;
    else
        v124 = v142;
        if v140 then
            v140:Cancel();
        end;
        if v141 then
            v141:Cancel();
        end;
        if v142 then
            l_NumberValue_0.Value = 1;
            v117(1);
            for _, v144 in ipairs((v64())) do
                local l_UIScale_4 = v144:FindFirstChildOfClass("UIScale");
                if not l_UIScale_4 then
                    l_UIScale_4 = Instance.new("UIScale");
                    l_UIScale_4.Parent = v144;
                end;
                l_UIScale_4.Scale = 0;
            end;
            l_Parent_1.Visible = true;
            l_RunService_0.Heartbeat:Wait();
            l_RunService_0.Heartbeat:Wait();
            v140 = l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                Value = 0
            });
            v140:Play();
            if l_Blur_1 and l_Blur_1:IsA("BlurEffect") then
                l_Blur_1.Size = 0;
                v141 = l_TweenService_0:Create(l_Blur_1, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
                    Size = 20
                });
                v141:Play();
            end;
            if v118 then
                task.cancel(v118);
            end;
            v118 = task.spawn(function() --[[ Line: 333 ]]
                -- upvalues: l_Dialog_0 (ref)
                l_Dialog_0.MaxVisibleGraphemes = 0;
                local v146 = utf8.len(l_Dialog_0.Text) or #l_Dialog_0.Text;
                for v147 = 1, v146 do
                    l_Dialog_0.MaxVisibleGraphemes = v147;
                    task.wait(0.005);
                end;
            end);
            if v123 then
                task.cancel(v123);
                v123 = nil;
            end;
            v123 = task.spawn(function() --[[ Line: 359 ]]
                -- upvalues: l_RunService_0 (ref), v64 (ref), v124 (ref), l_TweenService_0 (ref)
                l_RunService_0.Heartbeat:Wait();
                l_RunService_0.Heartbeat:Wait();
                local v148 = v64();
                table.sort(v148, function(v149, v150) --[[ Line: 366 ]]
                    local v151 = v149.LayoutOrder or 0;
                    local v152 = v150.LayoutOrder or 0;
                    if v151 ~= v152 then
                        return v151 < v152;
                    else
                        local l_AbsolutePosition_2 = v149.AbsolutePosition;
                        local l_AbsolutePosition_3 = v150.AbsolutePosition;
                        if l_AbsolutePosition_2.Y ~= l_AbsolutePosition_3.Y then
                            return l_AbsolutePosition_2.Y < l_AbsolutePosition_3.Y;
                        else
                            return l_AbsolutePosition_2.X < l_AbsolutePosition_3.X;
                        end;
                    end;
                end);
                for _, v156 in ipairs(v148) do
                    if not v124 then
                        return;
                    else
                        local l_UIScale_5 = v156:FindFirstChildOfClass("UIScale");
                        if not l_UIScale_5 then
                            l_UIScale_5 = Instance.new("UIScale");
                            l_UIScale_5.Parent = v156;
                        end;
                        local l_l_UIScale_5_0 = l_UIScale_5;
                        l_UIScale_5 = {
                            Scale = 1
                        };
                        local l_Back_2 = Enum.EasingStyle.Back;
                        local v160 = TweenInfo.new(0.5, l_Back_2 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_l_UIScale_5_0, v160, l_UIScale_5):Play();
                        task.wait(0.01);
                    end;
                end;
            end);
            return;
        else
            if v123 then
                task.cancel(v123);
                v123 = nil;
            end;
            if v118 then
                task.cancel(v118);
            end;
            v118 = nil;
            l_Dialog_0.MaxVisibleGraphemes = 0;
            for _, v162 in ipairs((v64())) do
                local l_UIScale_6 = v162:FindFirstChildOfClass("UIScale");
                if not l_UIScale_6 then
                    l_UIScale_6 = Instance.new("UIScale");
                    l_UIScale_6.Parent = v162;
                end;
                l_UIScale_6.Scale = 1;
            end;
            v140 = l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                Value = 1
            });
            v140:Play();
            if l_Blur_1 and l_Blur_1:IsA("BlurEffect") then
                v141 = l_TweenService_0:Create(l_Blur_1, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
                    Size = 0
                });
                v141:Play();
            end;
            task.delay(0.25, function() --[[ Line: 453 ]]
                -- upvalues: v124 (ref), l_Parent_1 (ref)
                if not v124 then
                    l_Parent_1.Visible = false;
                end;
            end);
            return;
        end;
    end;
end;
task.spawn(function() --[[ Line: 463 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v164 (copy), l_TeamSelectionPart_0 (copy)
    while true do
        task.wait(0.15);
        local l_Character_0 = l_LocalPlayer_0.Character;
        local v166 = l_Character_0 and l_Character_0:FindFirstChild("HumanoidRootPart");
        if not v166 then
            v164(false);
        else
            local l_l_LocalPlayer_0_Attribute_1 = l_LocalPlayer_0:GetAttribute("SelectedClubTeam");
            local v168 = false;
            if typeof(l_l_LocalPlayer_0_Attribute_1) == "string" then
                v168 = l_l_LocalPlayer_0_Attribute_1 ~= "";
            end;
            local v169 = (v166.Position - l_TeamSelectionPart_0.Position).Magnitude <= 35;
            v164(not v168 and v169);
        end;
    end;
end);
local function v172() --[[ Line: 482 ]] --[[ Name: applyStadiumForSavedTeam ]]
    -- upvalues: l_LocalPlayer_0 (copy), v27 (copy), v164 (copy), l_Parent_1 (copy), v43 (copy), v50 (copy)
    local l_l_LocalPlayer_0_Attribute_2 = l_LocalPlayer_0:GetAttribute("SelectedClubTeam");
    if typeof(l_l_LocalPlayer_0_Attribute_2) ~= "string" or l_l_LocalPlayer_0_Attribute_2 == "" then
        return;
    else
        local v171 = v27[l_l_LocalPlayer_0_Attribute_2];
        if not v171 then
            warn("[TeamSelection] Saved team not found in AdidasTeams:", l_l_LocalPlayer_0_Attribute_2);
            return;
        else
            v164(false);
            l_Parent_1.Visible = false;
            v43(v171);
            v50(v171);
            return;
        end;
    end;
end;
v172();
l_LocalPlayer_0:GetAttributeChangedSignal("SelectedClubTeam"):Connect(function() --[[ Line: 507 ]]
    -- upvalues: v172 (copy), v164 (copy)
    v172();
    v164(false);
end);
l_Dialog_0:GetPropertyChangedSignal("MaxVisibleGraphemes"):Connect(function() --[[ Line: 513 ]]
    script.Speech:Play();
end);
l_Dialog_0.Text = "Hey <b>" .. l_LocalPlayer_0.DisplayName .. "</b>! Welcome to the adidas Football Festival \226\128\148 choose a team to support and start scoring points!";