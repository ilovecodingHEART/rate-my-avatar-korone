local TeleportService = game:GetService("TeleportService")
local placeId = 8737899170

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)