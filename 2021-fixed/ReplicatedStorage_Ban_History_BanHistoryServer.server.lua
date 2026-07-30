-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- im lazy t ocode this so ima use banhistoryserver from my friends file

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local QuataunBanStore = DataStoreService:GetDataStore("QuataunBans")

local function QuataunAdminCheck(player)
	if player.UserId == 5824393709 then return true end
	if player:GetRankInGroup(125814458) >= 200 then return true end
	return false
end

Remotes.Function("AmIAdmin").OnServerInvoke = function(player)
	return QuataunAdminCheck(player)
end

Remotes.Function("BanHistory").OnServerInvoke = function(player, QuataunTargetId)
	if not QuataunAdminCheck(player) then
		return {}
	end

	if typeof(QuataunTargetId) ~= "number" or QuataunTargetId <= 0 then
		return {}
	end

	local QuataunSuccess, QuataunHistory = pcall(function()
		local QuataunKey = "User_" .. QuataunTargetId
		local QuataunData = QuataunBanStore:GetAsync(QuataunKey)

		if typeof(QuataunData) == "table" then
			if QuataunData[1] then
				return QuataunData
			else
				local QuataunArray = {}
				for _, QuataunEntry in pairs(QuataunData) --[[ 2021 ]] do
					table.insert(QuataunArray, QuataunEntry)
				end
				return QuataunArray
			end
		end

		return {}
	end)

	if not QuataunSuccess then
		return {}
	end

	return QuataunHistory or {}
end

Players.PlayerAdded:Connect(function(QuataunPlayer)
	local QuataunSuccess, QuataunData = pcall(QuataunBanStore.GetAsync, QuataunBanStore, "User_" .. QuataunPlayer.UserId)
	if QuataunSuccess and QuataunData then
		for _, QuataunBan in pairs(QuataunData) --[[ 2021 ]] do
			if QuataunBan.Ban == true then
				local QuataunNow = os.time()
				local QuataunEnd = QuataunBan.StartTime + (QuataunBan.Duration or 0)

				if QuataunBan.Duration == "Permanent" or QuataunEnd > QuataunNow then
					QuataunPlayer:Kick("you are banned.\nReason: " .. (QuataunBan.DisplayReason or "no reason given"))
					return
				end
			end
		end
	end
end)