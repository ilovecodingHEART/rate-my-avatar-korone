-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Parent_0 = script.Parent;
game:GetService("TweenService"):Create(l_Parent_0, TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    CFrame = CFrame.new(l_Parent_0.Position) * l_Parent_0.CFrame.Rotation * CFrame.new(0, -1, 0)
}):Play();