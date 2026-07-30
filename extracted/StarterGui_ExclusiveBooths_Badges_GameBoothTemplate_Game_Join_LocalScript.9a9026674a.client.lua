local TeleportService = game:GetService("TeleportService")
local placeId = 8571687919

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)