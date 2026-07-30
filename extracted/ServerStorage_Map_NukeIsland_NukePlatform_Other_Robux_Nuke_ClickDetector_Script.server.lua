local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)

	local Backpack = player:FindFirstChild("Backpack")

	if Backpack then

		if Backpack:FindFirstChild("NukePlushie") then

			return

		end

	end

	local NukePlushie = ServerStorage.NukePlushie:Clone()
	NukePlushie.Parent = Backpack

end)