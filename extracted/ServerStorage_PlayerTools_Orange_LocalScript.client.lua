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