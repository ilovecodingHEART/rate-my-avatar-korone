local TeleportService = game:GetService("TeleportService")
local placeId = 10179229656

script.Parent.MouseButton1Click:Connect(function(player)
	TeleportService:Teleport(placeId, player)
end)