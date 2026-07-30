local TeleportService = game:GetService("TeleportService")
local placeId = 7232779505

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)