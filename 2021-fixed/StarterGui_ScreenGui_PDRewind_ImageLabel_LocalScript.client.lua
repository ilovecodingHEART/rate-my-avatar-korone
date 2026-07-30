-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Linear);
    l_TweenService_0:Create(v1, v5, v3):Play();
end;
while task.wait(5.5) do
    local l_Parent_0 = script.Parent;
    local v8 = {
        Rotation = script.Parent.Rotation + 10
    };
    l_TweenService_0:Create(l_Parent_0, TweenInfo.new(5, Enum.EasingStyle.Linear), v8):Play();
end;