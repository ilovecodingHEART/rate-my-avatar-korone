local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)

	local Backpack = player:FindFirstChild("Backpack")

	if Backpack then

		if Backpack:FindFirstChild("Ball") then

			return

		end

	end

	local Ball = ServerStorage.Ball:Clone()
	Ball.Parent = Backpack

end) 

