-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
local TeleportService = game:GetService("TeleportService")
local MessagingService = game:GetService("MessagingService")
local LocalizationService = game:GetService("LocalizationService")
local DataStoreService = game:GetService("DataStoreService")
local Remotes = require(game.ReplicatedStorage.Remotes)

local targetplace = 101734645330187
local trac = {101734645330187}

local servers = {}
local vipDataStore = DataStoreService:GetDataStore("PlayerVIPV2")

local Characters = {
	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
	'q','r','s','t','u','v','w','x','y','z',
	'A','B','C','D','E','F','G','H','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
}

local function generateId()
	local newId = ''
	for _ = 1, 8 do
		if math.random(1, 2) == 1 then
			newId = newId .. Characters[math.random(1, #Characters)]
		else
			newId = newId .. tostring(math.random(1, 8))
		end
	end
	return newId
end

local function updateServerData()
	if game.PrivateServerId == "" then
		local currentLanguage = LocalizationService.RobloxLocaleId

		local data = {
			placeId = targetplace,
			serverId = game.JobId,
			serverName = "Server " .. generateId(),
			isDeluxe = false,
			id = game.JobId,
			language = currentLanguage,
			playerCount = #game.Players:GetPlayers(),
			maxPlayers = game.Players.MaxPlayers,
			userIds = {}
		}

		for _, player in ipairs(game.Players:GetPlayers()) do
			table.insert(data.userIds, player.UserId)
		end

		MessagingService:PublishAsync("GlobalServerList", data)
	end
end

game.Players.PlayerAdded:Connect(updateServerData)
game.Players.PlayerRemoving:Connect(updateServerData)

MessagingService:SubscribeAsync("GlobalServerList", function(message)
	local data = message.Data
	if __2021_find(trac, data.placeId) then
		servers[data.serverId] = data
	end
end)

Remotes.Function("VoiceChatServers").OnServerInvoke = function()
	local serverList = {}
	for _, serverData in pairs(servers) do
		table.insert(serverList, serverData)
	end
	return serverList
end

Remotes.Function("JoinVoiceChatServer").OnServerInvoke = function(player, targetServerId, _)
	local serverData = servers[targetServerId]
	if serverData then
		TeleportService:TeleportToPlaceInstance(targetplace, targetServerId, player)
	else
		print("ok")
	end
end

while task.wait(10) do
	updateServerData()
end