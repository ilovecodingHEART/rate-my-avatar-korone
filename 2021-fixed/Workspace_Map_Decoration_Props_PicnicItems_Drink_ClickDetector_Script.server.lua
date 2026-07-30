-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)
	local Backpack = player:FindFirstChild("Backpack")
	local Character = player.Character

	if not Backpack or not Character then
		return
	end

	if Backpack:FindFirstChild("Drink1") or Character:FindFirstChild("Drink1") then
		return
	end

	local Ball = ServerStorage:FindFirstChild("Drink1")
	if Ball then
		local ClonedBall = Ball:Clone()
		ClonedBall.Parent = Backpack

		local humanoid = Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:EquipTool(ClonedBall)
		end
	end
end)