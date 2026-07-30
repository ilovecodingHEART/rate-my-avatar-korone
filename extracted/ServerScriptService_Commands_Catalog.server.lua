-- by 22Slipz

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local CatalogAvatarCreator = 7041939546
local group = 125814458

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if message:lower() == "/catalog" then
			if player:IsInGroup(group) then
				TeleportService:Teleport(CatalogAvatarCreator, player)
			end
		end
	end)
end)