--LOCOOfficial = 2124913139,
--RaiseaYippe = 2127599917,
--IdioticInvesting = 2128042990,
--MakeaWish = 2128171365,
--PetSim99 = 2153913164,
--Doors = 2133601671,
--CatalogAvatarCreator = 2124780104,
--TypeRace = 2124852486,
--ShrimpGame = 1682512863415402,
--Evade = 1348860657518069,

local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"))
local DataModule = require(ServerScriptService.Modules.Data)
local BoothsModule = require(ServerStorage.Booths)

local RemoteEvents = {
	NewPurchasedBooths = Remotes.Event("NewPurchasedBooths")
}

local BadgeRewards = {
	[2124780104] = "CatalogAvatarCreatorBooth",
}

local function GiveBooth(player, boothName)
	if DataModule:IsPlayerOwningBooth(player.UserId, boothName) then
		return
	end
	
	local boothInfo = BoothsModule.Booths[boothName]
	if not boothInfo then
		return
	end
	
	local clientBoothData = {
		price = boothInfo.price,
		name = boothInfo.name,
		id = boothInfo.name,
		icon = boothInfo.icon,
		hoverIcon = boothInfo.hoverIco
	}
	
	RemoteEvents.NewPurchasedBooths:FireClient(player, clientBoothData)
	DataModule:PurcharseBooth(player.UserId, boothName)
end

local function CheckBadge(player)
	for badgeId, boothName in pairs(BadgeRewards) do
		local success, hasBadge = pcall(function()
			return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
		end)
		
		if success and hasBadge then
			GiveBooth(player, boothName)
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	task.wait(2)
	CheckBadge(player)
end)