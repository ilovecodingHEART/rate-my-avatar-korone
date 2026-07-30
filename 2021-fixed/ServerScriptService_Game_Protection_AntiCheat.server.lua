-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x1, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local DataStoreService = game:GetService("DataStoreService")
local GameAnalyticsRemoteConfigs = ReplicatedStorage:FindFirstChild("GameAnalyticsRemoteConfigs")
local DetectionsDS = DataStoreService:GetDataStore("Detections")
local function GenerateUUID(min, max)
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
	local randomName = ""
	for i = 1, math.random(min or 10, max or 20) do
		local randIndex = math.random(1, #chars)
		randomName = randomName .. chars:sub(randIndex, randIndex)
	end
	return randomName
end

local AntiCheatService = {
	Methods = {
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x215F",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x86F1",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0xC0BD0",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x10F00",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x60DC3",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x90F5D",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x19999",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x1D14AC",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x786C64",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0x1D948C",
		"[GLOBE.22SLIPZ]: Proxy metaMethod 0xBE931",
		"[GLOBE.22SLIPZ]: Disallowed Services Detected",
		"[GLOBE.22SLIPZ]: Disallowed Services Finding Error",
		"[GLOBE.22SLIPZ]: Tamper Protection Hook Check",
		"[GLOBE.22SLIPZ]: Dex Explorer Detected",
	},
	PlayersDetected = {},
	Detections = {},
}
local WebhookURL = ""
local GameplayDetections = {
	Speed = {}
}

task.spawn(function()
	for _, method in pairs({"indexInstance", "newindexInstance", "namecallInstance", "indexEnum", "namecallEnum", "eqEnum"}) do
		table.insert(AntiCheatService.Methods, (("[GLOBE.22SLIPZ]: %s detector detected"):format(method)))
	end
end)

local function onPlayerAdded(player: Player)
	local PlayerGui = player:WaitForChild("PlayerGui")

	local Folder = Instance.new("Folder", PlayerGui)
	Folder.Name = GenerateUUID()

	local script = script["Anti Cheat"]:Clone()
	script.Name = GenerateUUID()
	script.Parent = Folder

	task.spawn(pcall, function()
		local success, result = pcall(function()
			return DetectionsDS:UpdateAsync(player.UserId, function(oldValue)
				if oldValue then
					return oldValue;
				else
					return 0;
				end
			end)
		end)

		if success and result and typeof(result) == "number" then
			AntiCheatService.Detections[player.UserId] = {
				Detections = tonumber(result),
				DetectionsOnStart = tonumber(result),
			};
		else
			AntiCheatService.Detections[player.UserId] = {
				Detections = 0,
				DetectionsOnStart = 0,
			};
		end
	end)
end
Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

Players.PlayerRemoving:Connect(function(player)
	local detections = AntiCheatService.Detections[player.UserId]
	if detections and detections.Detections >= 0 and detections.Detections ~= detections.DetectionsOnStart then
		pcall(function()
			DetectionsDS:UpdateAsync(player.UserId, function(oldValue)
				return tonumber(detections.Detections)
			end)
		end)
	end

	for _, table in pairs(AntiCheatService) do
		if typeof(table) == "table" and table[player.UserId] then
			table[player.UserId] = nil;
		end
	end
	if GameplayDetections["Speed"][player.UserId] then
		GameplayDetections["Speed"][player.UserId] = nil;
	end
end)

GameAnalyticsRemoteConfigs.OnServerEvent:Connect(function(player: Player, detection: string, type: "kick" | "crash", message: string)
	if detection == "Detected" then

		if not (type == "kick" or type == "crash") then player:Kick("[GLOBE.22SLIPZ]: Nice try...") GameAnalyticsRemoteConfigs:FireClient(player, "crash", message) end
		if not __2021_find(AntiCheatService.Methods, tostring(message)) then player:Kick("[GLOBE.22SLIPZ]: Nice try...") GameAnalyticsRemoteConfigs:FireClient(player, "crash", message) end
		AntiCheatService.Detections[player.UserId] = AntiCheatService.Detections[player.UserId] or {
			Detections = 0,
			DetectionsOnStart = 0
		}

		AntiCheatService.Detections[player.UserId].Detections = (AntiCheatService.Detections[player.UserId].Detections or 0) + 1
		local Detections = AntiCheatService.Detections[player.UserId] and AntiCheatService.Detections[player.UserId].Detections or 0;

		if not AntiCheatService.PlayersDetected[player.UserId] then
			local Profile = string.format("<https://roblox.com/users/%s/profile>", player.UserId)
			local success = pcall(function()
				return HttpService:PostAsync(WebhookURL, HttpService:JSONEncode({
					content = `Anti Cheat Detection\nPlayer: [@{player.Name}]({Profile}) got detected for reason: {message}\nTotal Detections: {Detections}`
				}))
			end)

			if success then
				AntiCheatService.PlayersDetected[player.UserId] = true
			end
		end

		if type == "kick" then
			player:Kick(message)
			return nil

		elseif type == "crash" then
			player:Kick(message)
			GameAnalyticsRemoteConfigs:FireClient(player, "crash", message)
		end
	end
end)

Players.PlayerRemoving:Connect(function(player)
	local det = AntiCheatService.Detections[player.UserId]
	if det then
		pcall(function()
			DetectionsDS:UpdateAsync(player.UserId, function(old)
				return det.Detections
			end)
		end)
	end
	AntiCheatService.Detections[player.UserId] = nil
	AntiCheatService.PlayersDetected[player.UserId] = nil
end)