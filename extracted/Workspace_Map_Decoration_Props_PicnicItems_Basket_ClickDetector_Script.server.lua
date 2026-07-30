local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)
	local Backpack = player:FindFirstChild("Backpack")
	local Character = player.Character

	if not Backpack or not Character then
		return
	end

	if Backpack:FindFirstChild("Basket") or Character:FindFirstChild("Basket") then
		return
	end

	local Basket = ServerStorage:FindFirstChild("Basket")
	if Basket then
		local ClonedBasket = Basket:Clone()
		ClonedBasket.Parent = Backpack

		local humanoid = Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:EquipTool(ClonedBasket)
		end
	end
end)