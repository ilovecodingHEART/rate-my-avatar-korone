local TeleportService = game:GetService("TeleportService")
local placeId = 9872472334

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)