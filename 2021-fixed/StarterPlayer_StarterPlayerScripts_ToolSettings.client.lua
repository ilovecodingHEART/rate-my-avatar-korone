-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_SoundService_0 = game:GetService("SoundService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Frame_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):WaitForChild("Settings"):WaitForChild("Frame");
local l_Settings_0 = require(l_ReplicatedStorage_0:WaitForChild("Settings"));
local l_ToolSFXGroup_0 = l_SoundService_0:FindFirstChild("ToolSFXGroup");
local function _(v8, v9, v10, v11) --[[ Line: 17 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    l_TweenService_0:Create(v8, TweenInfo.new(v9, v11 or Enum.EasingStyle.Back), v10):Play();
end;
local l_ToolVFXSetting_0 = l_Frame_0:WaitForChild("ToolVFXSetting");
local function v22(v14, v15) --[[ Line: 26 ]] --[[ Name: displayToggle ]]
    -- upvalues: l_TweenService_0 (copy)
    if v15 then
        local l_Toggle_0 = v14.Toggle;
        local v17 = {
            BackgroundColor3 = Color3.fromRGB(32, 206, 145)
        };
        local l_Back_0 = Enum.EasingStyle.Back;
        l_TweenService_0:Create(l_Toggle_0, TweenInfo.new(0.35, l_Back_0 or Enum.EasingStyle.Back), v17):Play();
        l_Toggle_0 = v14.Toggle.Circle;
        v17 = {
            Position = UDim2.new(0.7, 0, 0.5, 0)
        };
        l_TweenService_0:Create(l_Toggle_0, TweenInfo.new(0.35, Enum.EasingStyle.Back), v17):Play();
        v14:SetAttribute("Value", true);
        return;
    else
        local l_Toggle_1 = v14.Toggle;
        local v20 = {
            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        };
        l_TweenService_0:Create(l_Toggle_1, TweenInfo.new(0.35, Enum.EasingStyle.Back), v20):Play();
        l_Toggle_1 = v14.Toggle.Circle;
        v20 = {
            Position = UDim2.new(0.3, 0, 0.5, 0)
        };
        local l_Back_1 = Enum.EasingStyle.Back;
        l_TweenService_0:Create(l_Toggle_1, TweenInfo.new(0.35, l_Back_1 or Enum.EasingStyle.Back), v20):Play();
        v14:SetAttribute("Value", false);
        return;
    end;
end;
local l_ToolVFX_0 = l_Settings_0.ToolVFX;
if l_ToolVFX_0 == nil then
    l_ToolVFX_0 = true;
end;
l_LocalPlayer_0:SetAttribute("ToolVFX", l_ToolVFX_0);
v22(l_ToolVFXSetting_0, l_ToolVFX_0);
l_ToolVFXSetting_0:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 45 ]]
    -- upvalues: l_ToolVFXSetting_0 (copy), l_Settings_0 (copy), l_LocalPlayer_0 (copy)
    local v24 = l_ToolVFXSetting_0:GetAttribute("Value") == true;
    l_Settings_0.ToolVFX = v24;
    l_LocalPlayer_0:SetAttribute("ToolVFX", v24);
end);
local l_ToolSFXVolumeSetting_0 = l_Frame_0:WaitForChild("ToolSFXVolumeSetting");
local l_ToolSFXVolume_0 = l_Settings_0.ToolSFXVolume;
if l_ToolSFXVolume_0 == nil then
    l_ToolSFXVolume_0 = 0.15;
end;
l_ToolSFXVolume_0 = math.clamp(l_ToolSFXVolume_0, 0, 1);
if l_ToolSFXGroup_0 then
    l_ToolSFXGroup_0.Volume = l_ToolSFXVolume_0;
end;
l_ToolSFXVolumeSetting_0.SliderFrame.TextBox.Text = l_ToolSFXVolume_0;
l_ToolSFXVolumeSetting_0:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 68 ]]
    -- upvalues: l_ToolSFXVolumeSetting_0 (copy), l_Settings_0 (copy), l_ToolSFXGroup_0 (copy)
    local l_l_ToolSFXVolumeSetting_0_Attribute_0 = l_ToolSFXVolumeSetting_0:GetAttribute("Value");
    if typeof(l_l_ToolSFXVolumeSetting_0_Attribute_0) == "number" then
        l_l_ToolSFXVolumeSetting_0_Attribute_0 = math.clamp(l_l_ToolSFXVolumeSetting_0_Attribute_0, 0, 1);
        l_Settings_0.ToolSFXVolume = l_l_ToolSFXVolumeSetting_0_Attribute_0;
        if l_ToolSFXGroup_0 then
            l_ToolSFXGroup_0.Volume = l_l_ToolSFXVolumeSetting_0_Attribute_0;
        end;
    end;
end);