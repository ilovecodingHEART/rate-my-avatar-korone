local TeleportService = game:GetService("TeleportService")
local placeId = 6516141723

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)