-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(50, Enum.EasingStyle.Linear), {
    Position = UDim2.new(0, 0, -1)
});
while true do
    script.Parent.Position = UDim2.new(-1);
    v0:Play();
    v0.Completed:Wait();
end;