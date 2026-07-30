-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: tween ]]
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v1, v5, v3):Play();
end;
while wait(math.random(90, 150) / 30) do
    spawn(function() --[[ Line: 10 ]]
        local v7 = script.Sparkle:Clone();
        v7.Parent = script.Parent;
        v7.Position = UDim2.new(math.random(20, 80) / 100, 0, math.random(20, 80) / 100, 0);
        local l_UIScale_0 = v7.UIScale;
        local v9 = {
            Scale = math.random(8, 18) / 15
        };
        local l_Back_0 = Enum.EasingStyle.Back;
        local v11 = TweenInfo.new(0.3, l_Back_0 or Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_0, v11, v9):Play();
        wait(0.3);
        l_UIScale_0 = v7.UIScale;
        v9 = {
            Scale = 0
        };
        l_Back_0 = TweenInfo.new(2, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_0, l_Back_0, v9):Play();
        wait(1.8);
        v7:Destroy();
    end);
end;