local TeleportService = game:GetService("TeleportService")
local placeId = 7606564092

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)