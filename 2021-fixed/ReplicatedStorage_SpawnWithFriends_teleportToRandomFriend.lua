-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")
local TeleportModule = require(script.Parent.TeleportToPlayer)
local ConfigModule = require(script.Parent.SpawnWithFriendsConfiguration)

local function log(...)
	if ConfigModule.getValues().showLogs then
		print(...)
	end
end

return function(playerToTeleport)
	local config = ConfigModule.getValues()
	log(string.format("Attempting to teleport %s to a random friend...", playerToTeleport.Name))

	local candidates = {}
	local rng = Random.new()

	for _, otherPlayer in ipairs(Players:GetChildren()) do
		if otherPlayer ~= playerToTeleport then
			pcall(function()
				local isFriend = config.bypassFriendshipCheck or otherPlayer:IsFriendsWith(playerToTeleport.UserId)
				local hrp = otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart")
				if isFriend and hrp then
					table.insert(candidates, otherPlayer)
				end
			end)
		end
	end

	if #candidates == 0 then
		log(string.format("Couldn't teleport %s: no suitable friend/player found in the server", playerToTeleport.Name))
		return false
	end

	for i = #candidates, 2, -1 do
		local j = rng:NextInteger(1, i)
		candidates[i], candidates[j] = candidates[j], candidates[i]
	end

	for _, targetPlayer in ipairs(candidates) do
		local success = pcall(function()
			return TeleportModule.teleport(playerToTeleport, targetPlayer, config.teleportDistance)
		end)

		if success then
			log(string.format("Successfully teleported %s to %s", playerToTeleport.Name, targetPlayer.Name))
			return true
		else
			log(string.format("Failed to teleport %s to %s", playerToTeleport.Name, targetPlayer.Name))
		end
	end

	log(string.format("Couldn't teleport %s: all teleport attempts failed", playerToTeleport.Name))
	return false
end