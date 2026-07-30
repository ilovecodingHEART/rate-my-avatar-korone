-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x1
-- WARNING: 1 compound-assignment line(s) need manual rewriting (X op= Y -> X = X op Y).
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local DatastoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local ServerScriptService = game:GetService("ServerScriptService")

local Remotes = require(ReplicatedStorage.Remotes)
local RobaseService = require(ServerScriptService.Player.Player.RobaseService)
local Datastore = RobaseService.new('https://boothpaintspdd-default-rtdb.firebaseio.com/', 'dhTLF3nJeqQhLZuTBKKveOJ4G1eAt5Lp248zRfoN'):GetRobase()

local Serializer = require(ServerScriptService.Serializer)
local Settings = {
	Version = "v4 ",
	SaveDelay = 0.5,
	AutoSaveInterval = 300, 
}

local ColourCache = {}
local BoothColours = {}
local Cache = {}

local function colourToString(color)
	return `{color.R},{color.G},{color.B}`
end

local function convertStringToColor3(str)
	return Color3.new(table.unpack(str:split(",")))
end

function saveColours(player, boothName, partName, colour)
	if not ColourCache[player.UserId] then 
		ColourCache[player.UserId] = {} 
	end

	if not ColourCache[player.UserId][boothName] then 
		ColourCache[player.UserId][boothName] = {} 
	end

	ColourCache[player.UserId][boothName][partName] = colour
end

function saveColoursAsync(player)
	if not ColourCache[player.UserId] then return end

	local success, errorMsg

	for attempt = 1, 3 do
		success, errorMsg = pcall(function()
			Datastore:SetAsync(string.format("%d_%s", player.UserId, Settings.Version), 
				Serializer.serialize(ColourCache[player.UserId]), 'PUT')
		end)

		if success then
			break
		else
			warn(string.format("Failed to save booth colours for %s (Attempt %d/3): %s", 
				player.Name, attempt, errorMsg))
			task.wait(Settings.SaveDelay * attempt)
		end
	end

	return success
end

function BoothColours.getBoothColours(player)
	if ColourCache[player.UserId] then
		return ColourCache[player.UserId]
	end
	local key = string.format("%d_%s", player.UserId, Settings.Version)
	local success, result = Datastore:GetAsync(tostring(key), 'GET')

	if not success then
		warn(string.format("Failed to load booth colours for %s: %s", player.Name, result))
		for attempt = 1, 3 do
			task.wait(Settings.SaveDelay * attempt)
			success, result = Datastore:GetAsync(tostring(key), 'GET')

			if success then
				break
			else
				warn(string.format("Retry %d/3 failed: %s", attempt, result))
			end
		end
	end

	if success and result then
		local deserializedData = Serializer.deserialize(result)
		ColourCache[player.UserId] = deserializedData
		return deserializedData
	end

	ColourCache[player.UserId] = {}
	return {}
end

function BoothColours.getBoothColour(player, boothName)
	if ColourCache[player.UserId] and ColourCache[player.UserId][boothName] then
		local cache = ColourCache[player.UserId][boothName]
		return cache, true
	end

	local booth = ServerStorage:WaitForChild("BoothModels"):FindFirstChild(boothName)
	if not booth then 
		return {} 
	end

	local boothColours = {}
	local partCache = {}

	for _, part in pairs(booth:GetDescendants()) do
		if part:IsA('MeshPart') or part:IsA('BasePart') then
			local colorKey = colourToString(part.Color)

			if not partCache[colorKey] then
				partCache[colorKey] = {
					parts = {},
					count = 0
				}
			end

			table.insert(partCache[colorKey].parts, part.Name)
			partCache[colorKey].count += 1
		end
	end

	local counter = 1
	for colour, data in pairs(partCache) do
		table.insert(boothColours, {
			id = counter,
			default = convertStringToColor3(colour),
			partCount = data.count,
			parts = data.parts 
		})
		counter = counter + (1); --[[ 2021: was compound assignment ]]
	end

	if not ColourCache[player.UserId] then
		ColourCache[player.UserId] = {}
	end
	ColourCache[player.UserId][boothName] = boothColours

	return boothColours, false
end

function BoothColours.applyColour(player, boothName, partId, colour)
	local boothData = BoothColours.getBoothColour(player, boothName)
	if not boothData then return false end

	local playerBooth = nil;

	for _, booth in pairs(workspace:WaitForChild("BoothModels"):GetChildren()) do
		if booth:GetAttribute("OwnerId") == player.UserId then
			playerBooth = booth
		end
	end

	if not playerBooth then return end 

	for _, data in pairs(boothData) do

		if data.id == partId then
			for _, part in pairs(data.parts) do

				local boothPart = playerBooth:FindFirstChild(part)

				if boothPart then
					if boothPart:IsA("BasePart") or boothPart:IsA('MeshPart') then
						local modifiedData = data
						modifiedData.default = colour
						boothPart.Color = colour
						saveColours(player, boothName, part, modifiedData)
					end
				end

			end
		end

	end
end

function BoothColours.reset(player)
	local PlayerBooth

	for _, Booth in pairs(workspace.BoothModels:GetChildren()) do
		if Booth:GetAttribute('OwnerId') == player.UserId then
			PlayerBooth = Booth
		end
	end
	if PlayerBooth then
		ColourCache[player.UserId][PlayerBooth.Name] = nil
	end
	for _, Data in BoothColours.getBoothColour(player, PlayerBooth.Name) do
		BoothColours.applyColour(player, PlayerBooth.Name, Data.id, Data.default)
	end
end

local function startAutoSave()
	while true do
		task.wait(Settings.AutoSaveInterval)

		for _, player in pairs(Players:GetPlayers()) do
			task.spawn(function()
				if ColourCache[player.UserId] then
					saveColoursAsync(player)
				end
			end)
		end
	end
end

function playerAdded(player)
	ColourCache[player.UserId] = BoothColours.getBoothColours(player) or {}
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(saveColoursAsync)

for _, player in pairs(Players:GetPlayers()) do
	task.spawn(function()
		playerAdded(player)
	end)
end

task.spawn(startAutoSave)

game:BindToClose(function()
	for _, player in pairs(Players:GetPlayers()) do
		saveColoursAsync(player)
	end
end)

return BoothColours