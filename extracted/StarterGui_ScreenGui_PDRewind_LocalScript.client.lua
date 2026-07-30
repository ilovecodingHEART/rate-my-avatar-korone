-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_CustomText_0 = l_Players_0.LocalPlayer.PlayerGui.ScreenGui.PDRewind.Frame.CustomText;
local v3 = require(script.TextHandler);
local function _(v4, v5, v6, v7) --[[ Line: 10 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v8 = TweenInfo.new(v5, v7 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v4, v8, v6):Play();
end;
script.Parent.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 15 ]]
    -- upvalues: l_CustomText_0 (copy)
    l_CustomText_0:SetAttribute("Text", script.Parent.Frame.TextBox.Text);
end);
l_CustomText_0:GetAttributeChangedSignal("Text"):Connect(function() --[[ Line: 19 ]]
    -- upvalues: l_CustomText_0 (copy), v3 (copy)
    local l_l_CustomText_0_Attribute_0 = l_CustomText_0:GetAttribute("Text");
    v3.display(l_l_CustomText_0_Attribute_0);
end);