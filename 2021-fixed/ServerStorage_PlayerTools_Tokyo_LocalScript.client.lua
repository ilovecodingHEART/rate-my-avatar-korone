-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local animation = nil
local animation2 = nil
local sound = nil
local skip = false
local isEquipping = false -- Debounce variable to prevent spamming

script.Parent.Equipped:Connect(function()
	if isEquipping then
		return
	end
	isEquipping = true
	print('sigma')
	sound = script.Parent.Song
	animation2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation2)
	animation2:Play()
	script.Parent.Emote_Crosswalk_Music_Intro:Play()
	task.wait(0.75)
	skip = true
	if not skip then
		isEquipping = false 
		return
	end
	sound:Play()
	animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
	animation:Play()
	isEquipping = false -- Reset debounce after successful execution
end)

script.Parent.Unequipped:Connect(function()
	print('sigma')
	if animation then
		animation:Stop()
	end
	if sound then
		sound:Stop()
	end
	skip = false
end)
