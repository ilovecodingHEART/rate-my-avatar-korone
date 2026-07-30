local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)
	local Backpack = player:FindFirstChild("Backpack")
	local Character = player.Character

	if not Backpack or not Character then
		return
	end

	if Backpack:FindFirstChild("Anon") or Character:FindFirstChild("Anon") then
		return
	end

	local Ball = ServerStorage:FindFirstChild("Anon")
	if Ball then
		local ClonedBall = Ball:Clone()
		ClonedBall.Parent = Backpack

		local humanoid = Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:EquipTool(ClonedBall)
		end
	end
end)