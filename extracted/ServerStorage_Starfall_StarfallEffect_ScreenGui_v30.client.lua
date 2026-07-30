local u2 = true;
local u3 = {};
while wait(0.1) do 
	local v27 = math.random(1, 4);
	local v28 = script.Parent.Parent.TheVoidBlock:Clone();
	v28.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Ground.WorldModel
	v28.Name = "Blocks";
	if v27 == 1 then
		v28.Position = Vector3.new(-3925.674, -851.571, math.random(-3675, 3864));
	elseif v27 == 2 then
		v28.Position = Vector3.new(math.random(-3685, 3874), -851.571, 3584.024);
	elseif v27 == 3 then
		v28.Position = Vector3.new(3954.326, -851.571, math.random(-3715, 2854));
	else
		v28.Position = Vector3.new(math.random(-3725, 3854), -851.571, -3895.976);
	end;

	local v29 = math.random(950,1000);
	v28.Size = Vector3.new(v29, v29, v29);
	v28.Transparency = 1
	game.TweenService:Create(v28,TweenInfo.new(0.35,Enum.EasingStyle.Linear),{
		Transparency = 0
	}):Play()
	game.TweenService:Create(v28, TweenInfo.new(math.random(2, 5), Enum.EasingStyle.Linear), {
		Position = v28.Position + Vector3.new(0, math.random(3500, 7500), 0), 
		Rotation = Vector3.new(math.random(50, 100), math.random(50, 100), math.random(50, 100)), 
		Size = Vector3.new(0, 0, 0), 
		Transparency = 1
	}):Play();

	local tween = game.TweenService:Create(v28, TweenInfo.new(math.random(2, 5), Enum.EasingStyle.Linear), {
		Color = Color3.fromRGB(87, 0, 111),
	})
	tween:Play()
	tween.Completed:Connect(function()
		v28:Destroy()
	end)
	table.insert(u3, v28);
end
