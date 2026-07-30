-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Decompiled with the Synapse X Luau decompiler.

game["Run Service"].RenderStepped:Connect(function()
	script.Parent.Position = UDim2.fromScale(1 + math.random(-20, 20) / 100, 0.5 + math.random(-100, 100) / 100);
end);
