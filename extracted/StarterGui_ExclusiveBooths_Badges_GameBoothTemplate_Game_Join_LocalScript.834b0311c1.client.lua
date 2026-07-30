local TeleportService = game:GetService("TeleportService")
local placeId = 7041939546

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)