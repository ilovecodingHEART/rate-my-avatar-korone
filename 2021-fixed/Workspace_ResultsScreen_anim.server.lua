-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = 0;
local l_Pivot_0 = script.Parent:GetPivot();
local v2 = l_Pivot_0:ToObjectSpace(script.Parent.Propeller.CFrame);
game:GetService("RunService").RenderStepped:Connect(function(v3) --[[ Line: 5 ]]
    v0 = v0 + v3;
    local v4 = l_Pivot_0 * CFrame.new(0, math.sin(v0 * 2), 0);
    script.Parent:PivotTo(v4);
    script.Parent.Propeller.CFrame = v4:ToWorldSpace(v2) * CFrame.Angles(0, math.rad(v0 * 90), 0);
end);