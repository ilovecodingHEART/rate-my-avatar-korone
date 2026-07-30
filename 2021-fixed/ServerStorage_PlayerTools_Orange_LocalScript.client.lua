-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local animation = nil;
local sound = nil;
script.Parent.Equipped:Connect(function()
	print('sigma')
	sound = script.Parent.Song;
	sound:Play();
	animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation);
	animation:Play()
end)
script.Parent.Unequipped:Connect(function()
	print('sigma');
	animation:Stop();
	sound:Stop();
end)