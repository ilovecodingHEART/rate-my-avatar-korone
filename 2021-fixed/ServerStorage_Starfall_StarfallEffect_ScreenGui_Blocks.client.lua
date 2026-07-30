-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local u2 = true
local u3 = {}

while wait(0.001) do
	local v27 = math.random(1, 4)
	local v28 = script.Parent.Parent.TheVoidBlock:Clone()
	local newworldmodel = Instance.new("WorldModel", game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Ground)
	v28.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Ground.WorldModel
	v28.Anchored = true
	v28.CanCollide = false
	v28.Name = "TheVoidBlock"
	if v27 == 1 then
		v28.Position = Vector3.new(-3925.674, -851.5711, math.random(-3925.674, -851.5714))
	elseif v27 == 2 then
		v28.Position = Vector3.new(math.random(-3685, 3874), -851.571, 3584.024)
	elseif v27 == 3 then
		v28.Position = Vector3.new(3954.326, -851.571, math.random(-3715, 2854))
	else
		v28.Position = Vector3.new(math.random(-3725, 3854), -851.571, -3895.976)
	end

	local v29 = math.random(500, 900)
	v28.Size = Vector3.new(v29, v29, v29)
	game.TweenService:Create(v28, TweenInfo.new(math.random(2, 5), Enum.EasingStyle.Linear), {
		Position = v28.Position + Vector3.new(0, math.random(3500, 7500), 0),
		Rotation = Vector3.new(math.random(50, 100), math.random(50, 100), math.random(50, 100)),
		Size = Vector3.new(0, 0, 0),
		Color = Color3.fromRGB(84, 22, 117),
	}):Play()

	table.insert(u3, v28)
end