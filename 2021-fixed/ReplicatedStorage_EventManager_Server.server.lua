-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--[[

 █████   ██████ ██ ██████  
██   ██ ██      ██ ██   ██ 
███████ ██      ██ ██   ██ 
██   ██ ██      ██ ██   ██ 
██   ██  ██████ ██ ██████  

SOS! PLS DONT TOUCH ANYTHING HERE!

]]

-- << Services >> -- 

local RunService = game:GetService("RunService")
if RunService:IsClient() then
	error("Ok")
end;

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DatastoreService = game:GetService("DataStoreService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local MessagingService = game:GetService("MessagingService")
local SoundService = game:GetService("SoundService")

-- << Modules >> -- 

local EventManager = require(ReplicatedStorage:WaitForChild("EventManager"))
local LiveEventInfo = require(ReplicatedStorage:WaitForChild("LiveEventInfo"))

-- << DataStore >> -- 

local DatastoreForMapChange = DatastoreService:GetDataStore("MapChangeDataStore")

-- << Setting >> -- 

local ValidMaps = {
	["Christmas"] = true
};

-- << Main >> --

local MapAlreadyChanged = false
local EventAlreadyPlayed = false
local EventRunning = false
local CurrentStatus = nil

local function ApplyLightingFolder(folder)
	if not folder or not folder:IsA("Folder") then return end
	for _, obj in ipairs(Lighting:GetChildren()) do
		if obj:IsA("Sky") or obj:IsA("Atmosphere")
			or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") then
			obj:Destroy()
		end
	end
	for _, obj in ipairs(folder:GetChildren()) do
		if obj:IsA("Sky") or obj:IsA("Atmosphere")
			or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") then
			obj:Clone().Parent = Lighting
		end
	end
end

local function ChangeMap(newMap, oldMap, lightingFolder)
	if MapAlreadyChanged then return end
	MapAlreadyChanged = true

	local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
	if not atmosphere then
		atmosphere = Instance.new("Atmosphere")
		atmosphere.Parent = Lighting
	end

	atmosphere.Density = 0.8
	atmosphere.Haze = 3

	task.wait(0.25)

	if oldMap and oldMap:IsDescendantOf(workspace) then
		oldMap:Destroy()
	end

	newMap.Name = "Map"
	newMap.Parent = workspace

	Lighting.Ambient = Color3.fromRGB(252, 202, 255)
	Lighting.GeographicLatitude = 15

	local music = SoundService:FindFirstChild("Music")
		and SoundService.Music:FindFirstChild("DaytimeTrack")
	if music then
		music.SoundId = "rbxassetid://85824934438719"
	end

	ApplyLightingFolder(lightingFolder)

	atmosphere.Density = 0.35
	atmosphere.Haze = 1

	local testPlane = workspace:FindFirstChild("TestPlane")
	if testPlane and testPlane:FindFirstChild("Plane") then
		testPlane.Plane.Transparency = 1
	end

	local lb = newMap:FindFirstChild("Functional") and newMap.Functional:FindFirstChild("Leaderboards")
	if lb and workspace:FindFirstChild("MapUI") then
		workspace.MapUI.LiveDonations.Adornee = lb.LiveDonations.Leaderboard
		workspace.MapUI.TopDonated.Adornee = lb.TopRaised.Leaderboard
		workspace.MapUI.TopRaised.Adornee = lb.TopDonated.Leaderboard
		workspace.MapUI.LiveDonationsTitle.Adornee = lb.LiveDonations.TitleBoard
		workspace.MapUI.TopDonatedTitle.Adornee = lb.TopRaised.TitleBoard
		workspace.MapUI.TopRaisedTitle.Adornee = lb.TopDonated.TitleBoard
	end
end

EventManager.LoadOnJoin()
task.spawn(function()
	local success, mapState = pcall(function()
		return DatastoreForMapChange:GetAsync("Map")
	end)
	if success then
		CurrentStatus = mapState
	end
	if success and ValidMaps[mapState] then
		local xmasMap = game.ServerStorage:WaitForChild("xmasmap"):Clone()
		local xmasLighting = game.ServerStorage:WaitForChild("xmaslightning"):Clone()
		ChangeMap(xmasMap, workspace:FindFirstChild("Map"), xmasLighting)
	end
	task.spawn(function()
		while DateTime.now().UnixTimestamp < LiveEventInfo.start do
			task.wait(0.5)
		end
		if CurrentStatus ~= nil then return end
		local ChristmasEvent = EventManager.CreateEvent("Christmas25")
		table.insert(ChristmasEvent.FinishedBinds, function()
			EventRunning = false
		end)
		table.insert(ChristmasEvent.FinishedBinds, function()
			if MapAlreadyChanged then return end
			local xmasMap = game.ServerStorage:WaitForChild("xmasmap"):Clone()
			local xmasLighting = game.ServerStorage:WaitForChild("xmaslightning"):Clone()
			ChangeMap(xmasMap, workspace:FindFirstChild("Map"), xmasLighting)
			pcall(function()
				DatastoreForMapChange:SetAsync("Map", "Christmas")
			end)
		end)
		if not ChristmasEvent.IsPlaying and not EventAlreadyPlayed then
			EventAlreadyPlayed = true
			EventRunning = true
			ChristmasEvent:Play();
		end
	end)
end)

-- GLOBAL EVENTS --

local EventTimer = ReplicatedStorage:WaitForChild("GlobalEventTimer")
MessagingService:SubscribeAsync("StartGlobalEvent", function(arg)
	local Data = arg.Data
	if EventRunning then return end
	local eventToPlay = EventManager.CreateEvent(Data.eventName)
	if eventToPlay.IsPlaying then return end
	EventRunning = true
	table.insert(eventToPlay.FinishedBinds, function()
		EventRunning = false
	end)
	if Data.eventName == "DiscoEvent" then
		local duration = ReplicatedStorage.EventManager.Events.DiscoEvent.Assets.Sounds.Music[Data.musicName].TimeLength
		eventToPlay.Play(eventToPlay, {
			MusicName = Data.musicName,
			CanHighJump = true,
			RunTime = duration
		})
		EventTimer:FireAllClients("DiscoEvent", nil, duration);
	elseif Data.eventName == "Christmas25" then
		if Data.startEvent then
			eventToPlay:Play();
		end;
	elseif Data.eventName == "AdidasEvent" then
		if Data.startEvent then
			eventToPlay:Play();
		end;
	end;
end);