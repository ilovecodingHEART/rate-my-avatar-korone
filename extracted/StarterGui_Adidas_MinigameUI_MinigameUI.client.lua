-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

task.wait(1);
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v4 = require(script.Transition);
local v5 = require(game.ReplicatedStorage.Client.Controllers.GameplayController);
local l_Parent_0 = script.Parent;
local l_Play_0 = l_Parent_0.PlayUI.Play;
local l_Quit_0 = l_Parent_0.Quit;
local l_PitchLines_0 = workspace:WaitForChild("Adidas", 1e999).Structures.Stadium.Model.Misc.Pitch:WaitForChild("PitchLines");
local l_PlayUI_0 = l_Parent_0:WaitForChild("PlayUI");
local v11 = nil;
local v12 = false;
local v13 = false;
local v14 = nil;
local function v17(v15) --[[ Line: 29 ]] --[[ Name: hookCharacter ]]
    -- upvalues: v11 (ref)
    local v16 = v15:WaitForChild("HumanoidRootPart", 10);
    if v16 and v16:IsA("BasePart") then
        v11 = v16;
    end;
end;
if l_LocalPlayer_0.Character then
    local v18 = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart", 10);
    if v18 and v18:IsA("BasePart") then
        v11 = v18;
    end;
end;
l_LocalPlayer_0.CharacterAdded:Connect(v17);
local function _(v19, v20, v21, v22) --[[ Line: 41 ]] --[[ Name: tween ]]
    -- upvalues: v13 (ref), l_TweenService_0 (copy)
    if v13 then
        return;
    else
        l_TweenService_0:Create(v19, TweenInfo.new(v20, v22 or Enum.EasingStyle.Quint), v21):Play();
        return;
    end;
end;
local function _() --[[ Line: 49 ]] --[[ Name: forceHideVisuals ]]
    -- upvalues: l_PlayUI_0 (copy), l_Parent_0 (copy)
    l_PlayUI_0.Visible = false;
    l_Parent_0.BackgroundTransparency = 1;
end;
local function _() --[[ Line: 58 ]] --[[ Name: stopEnforce ]]
    -- upvalues: v14 (ref)
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
end;
local function _() --[[ Line: 65 ]] --[[ Name: startEnforce ]]
    -- upvalues: v14 (ref), l_RunService_0 (copy), v12 (ref), l_PlayUI_0 (copy), l_Parent_0 (copy)
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    v14 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 67 ]]
        -- upvalues: v12 (ref), l_PlayUI_0 (ref), l_Parent_0 (ref)
        if v12 then
            l_PlayUI_0.Visible = false;
            l_Parent_0.BackgroundTransparency = 1;
        end;
    end);
end;
local function v30(v27) --[[ Line: 75 ]] --[[ Name: setVisible ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), l_PlayUI_0 (copy), l_Parent_0 (copy), l_TweenService_0 (copy)
    if v13 then
        return;
    else
        if v27 then
            if not l_LocalPlayer_0:GetAttribute("SelectedClubTeam") then
                return;
            else
                l_LocalPlayer_0.PlayerGui.CustomCoreGui.Enabled = false;
            end;
        else
            l_LocalPlayer_0.PlayerGui.CustomCoreGui.Enabled = true;
        end;
        l_PlayUI_0.Visible = v27;
        local l_l_Parent_0_0 = l_Parent_0;
        local v29 = {
            BackgroundTransparency = v27 and 0 or 1
        };
        if not v13 then
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
        end;
        l_l_Parent_0_0 = l_PlayUI_0.Title;
        v29 = {
            TextTransparency = v27 and 0 or 1
        };
        if not v13 then
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
        end;
        l_l_Parent_0_0 = l_PlayUI_0.Desc;
        v29 = {
            TextTransparency = v27 and 0 or 1
        };
        if not v13 then
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
        end;
        l_l_Parent_0_0 = l_PlayUI_0.ImageLabel;
        v29 = {
            ImageTransparency = v27 and 0 or 1
        };
        if not v13 then
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
        end;
        l_l_Parent_0_0 = l_PlayUI_0.Play;
        v29 = {
            BackgroundTransparency = v27 and 0 or 1
        };
        if not v13 then
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
        end;
        l_l_Parent_0_0 = l_PlayUI_0.Play;
        v29 = {
            TextTransparency = v27 and 0 or 1
        };
        if v13 then
            return;
        else
            l_TweenService_0:Create(l_l_Parent_0_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v29):Play();
            return;
        end;
    end;
end;
local function v38() --[[ Line: 103 ]] --[[ Name: dialogIsOpen ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_DialogFrame_0 = script.Parent.Parent:FindFirstChild("DialogFrame");
    local v32 = false;
    if l_DialogFrame_0 ~= nil then
        v32 = l_DialogFrame_0:IsA("Frame") and l_DialogFrame_0.BackgroundTransparency ~= 1;
    end;
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChild("PlayerGui");
    local v34 = false;
    if l_PlayerGui_0 then
		local l_ScreenGui_0 = l_PlayerGui_0:FindFirstChild("ScreenGui");
		if l_ScreenGui_0 then
            local l_Adidas_0 = l_ScreenGui_0:FindFirstChild("Adidas");
            v34 = l_Adidas_0 ~= nil and (l_Adidas_0:IsA("GuiObject") and l_Adidas_0.Visible or false);
        end;
    end;
    local v37 = true;
    if v32 ~= true then
        v37 = v34 == true;
    end;
    return v37;
end;
l_Play_0.Activated:Connect(function() --[[ Line: 126 ]]
    -- upvalues: v38 (copy), l_LocalPlayer_0 (copy), v12 (ref), v13 (ref), l_Quit_0 (copy), l_PlayUI_0 (copy), l_Parent_0 (copy), v14 (ref), l_RunService_0 (copy), v4 (copy), v5 (copy)
    if v38() then
        return;
    else
        l_LocalPlayer_0.PlayerGui.CustomCoreGui.Enabled = false;
        v12 = true;
        v13 = true;
        l_Quit_0.Visible = true;
        l_PlayUI_0.Visible = false;
        l_Parent_0.BackgroundTransparency = 1;
        if v14 then
            v14:Disconnect();
            v14 = nil;
        end;
        v14 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 67 ]]
            -- upvalues: v12 (ref), l_PlayUI_0 (ref), l_Parent_0 (ref)
            if v12 then
                l_PlayUI_0.Visible = false;
                l_Parent_0.BackgroundTransparency = 1;
            end;
        end);
        v4.Play(script.Parent.Parent.Transition);
        v5:StartPenalty();
        return;
    end;
end);
l_Quit_0.Activated:Connect(function() --[[ Line: 146 ]]
    -- upvalues: v4 (copy), l_LocalPlayer_0 (copy), v5 (copy), v12 (ref), v13 (ref), v14 (ref), l_Quit_0 (copy), l_PlayUI_0 (copy), v11 (ref), l_PitchLines_0 (copy), v30 (copy)
    v4.Play(script.Parent.Parent.Transition);
    l_LocalPlayer_0.PlayerGui.CustomCoreGui.Enabled = true;
    v5:EndPenalty();
    v12 = false;
    v13 = false;
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    l_Quit_0.Visible = false;
    l_PlayUI_0.Visible = true;
    if v11 then
        local l_Magnitude_0 = (v11.Position - l_PitchLines_0.Position).Magnitude;
        v30(l_Magnitude_0 < 50);
        return;
    else
        v30(true);
        return;
    end;
end);
task.spawn(function() --[[ Line: 170 ]]
    -- upvalues: v12 (ref), v13 (ref), v38 (copy), l_PlayUI_0 (copy), l_Parent_0 (copy), v11 (ref), l_PitchLines_0 (copy), v30 (copy)
    while task.wait(0.2) do
        if not v12 and not v13 then
            if v38() then
                l_PlayUI_0.Visible = false;
                l_Parent_0.BackgroundTransparency = 1;
            elseif v11 then
                local l_Magnitude_1 = (v11.Position - l_PitchLines_0.Position).Magnitude;
                v30(l_Magnitude_1 < 50);
            end;
        end;
    end;
end);