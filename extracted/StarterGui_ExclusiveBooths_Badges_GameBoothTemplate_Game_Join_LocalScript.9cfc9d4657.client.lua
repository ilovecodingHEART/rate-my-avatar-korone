local TeleportService = game:GetService("TeleportService")
local placeId = 9742783208

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)