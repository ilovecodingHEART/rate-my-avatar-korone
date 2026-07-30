local animation = nil
local animation2 = nil
local sound = nil
local skip = false
local isEquipping = false
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
	task.wait(0.65)
	skip = true
	if not skip then
		isEquipping = false 
		return
	end
	sound:Play()
	animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
	animation:Play()
	isEquipping = false
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
