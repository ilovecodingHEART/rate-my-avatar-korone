-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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