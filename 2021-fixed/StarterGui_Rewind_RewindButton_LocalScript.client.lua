-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local v2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
spawn(function() --[[ Line: 12 ]]
    l_Parent_0.TextTransparency = 0.8;
    local v3 = l_TweenService_0:Create(l_Parent_0, v2, {
        TextTransparency = 0
    });
    local v4 = l_TweenService_0:Create(l_Parent_0.UIStroke, v2, {
        Transparency = 0.9
    });
    v3:Play();
    v4:Play();
end);