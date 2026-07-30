local part = script.Parent
local ClickDet = part:WaitForChild("ClickDetector")

local ServerStorage = game:GetService("ServerStorage")
local accessory = ServerStorage
	:WaitForChild("CatalogAvatarCreatorBoothItems")
	:WaitForChild("Shutter ShadesPink")

-- sdimple 
--s1mple csgo

ClickDet.MouseClick:Connect(function(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local existing = character:FindFirstChild(accessory.Name)

	if existing then
		existing:Destroy()
	else
		local clone = accessory:Clone()
		humanoid:AddAccessory(clone)
	end
end)