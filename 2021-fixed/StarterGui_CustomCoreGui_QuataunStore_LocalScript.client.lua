-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v1, v5, v3):Play();
end;
script.Parent.Close.Activated:Connect(function() --[[ Line: 9 ]]
    script.Parent.Visible = false;
end);
script.Parent:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 13 ]]
    -- upvalues: l_TweenService_0 (copy)
    if script.Parent.Visible then
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
        local l_Blur_0 = game.Lighting.Blur;
        local v8 = {
            Size = 50
        };
        local v9 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_0, v9, v8):Play();
        l_Blur_0 = game.Lighting.ColorCorrection;
        v8 = {
            TintColor = Color3.fromRGB(38, 0, 113)
        };
        v9 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_0, v9, v8):Play();
        l_Blur_0 = script.Parent;
        v8 = {
            Position = UDim2.new(0, 0, 1, 15)
        };
        v9 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_0, v9, v8):Play();
        return;
    else
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
        local l_Blur_1 = game.Lighting.Blur;
        local v11 = {
            Size = 0
        };
        local v12 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_1, v12, v11):Play();
        l_Blur_1 = game.Lighting.ColorCorrection;
        v11 = {
            TintColor = Color3.fromRGB(255, 255, 255)
        };
        v12 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_1, v12, v11):Play();
        l_Blur_1 = script.Parent;
        v11 = {
            Position = UDim2.new(0, 0, 2, 0)
        };
        v12 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Blur_1, v12, v11):Play();
        return;
    end;
end);