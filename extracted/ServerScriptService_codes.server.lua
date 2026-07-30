local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"))
local RedeemedCodesDS = DataStoreService:GetDataStore("RedeemedCodes")

--TODO
-- fix monkey code in here

local RemoteEvents = {
	RedeemCode = Remotes.Event("RedeemCode"),
	NewPurchasedBooths = Remotes.Event("NewPurchasedBooths"),
	AlreadyOwned = Remotes.Event("AlreadyOwned"),
	NewGiftbuxBalance = Remotes.Event("NewGiftbuxBalance")
}

local DataModule = require(ServerScriptService.Modules.Data)
local BoothsModule = require(ServerStorage.Booths)

local ct = 5
local rd = {1, 1.25} -- rd = delay

local codes = {
	["Glass"] = {
		["type"] = "Booth",
		["reward"] = "GlassAnimalsBooth",
		["available"] = true,
	},
	["Eagle_15"] = {
		["type"] = "Giftbux",
		["reward"] = 15,
		["available"] = true,
	},
	["Forehead"] = {
		["type"] = "Booth",
		["reward"] = "KSIBooth",
		["available"] = true,
	},
	["Olix!15"] = {
		["type"] = "Giftbux",
		["reward"] = 15,
		["available"] = true,
	},
	["ppyth0n-15"] = {
		["type"] = "Giftbux",
		["reward"] = 15,
		["available"] = true,
	},
	["👅"] = {
		["type"] = "Booth",
		["reward"] = "FreakyBooth",
		["available"] = true,
	},
	["quataun"] = {
		["type"] = "Giftbux",
		["reward"] = 50,
		["available"] = true,
	},
	["hazem"] = {
		["type"] = "Giftbux",
		["reward"] = 50,
		["available"] = true,
	},
	["plsdonate2"] = {
		["type"] = "Giftbux",
		["reward"] = 20,
		["available"] = true,
	},
	["Valentines69"] = {
		["type"] = "Giftbux",
		["reward"] = 100,
		["available"] = true,
	},
	["Valentines25"] = {
		["type"] = "Booth",
		["reward"] = "Valentines2025Booth",
		["available"] = true,
	},
	["BOOTH-KF90-J4HN"] = {
		["type"] = "Booth",
		["reward"] = "XmasDinnerBooth",
		["available"] = true,
	},
	["BOOTH-KF90-J4HM"] = {
		["type"] = "Booth",
		["reward"] = "XmasLightsBooth",
		["available"] = true,
	},
	["BOOTH-E3FSF-34SDT"] = {
		["type"] = "Booth",
		["reward"] = "NukeBooth",
		["available"] = true,
	},
	["TWCH-35JD-6SLK"] = {
		["type"] = "Booth",
		["reward"] = "TwitchBooth",
		["available"] = true,
	},
	["BOOTH-34DF-345MN"] = {
		["type"] = "Booth",
		["reward"] = "EvadeBooth",
		["available"] = true,
	},
	["BOOTH-34DF-345N"] = {
		["type"] = "Booth",
		["reward"] = "PicnicBooth",
		["available"] = true,
	},
	["BOOTH-345F-345N"] = {
		["type"] = "Booth",
		["reward"] = "SandCastleBooth",
		["available"] = true,
	},
	["BOOTH-345F-34fdN"] = {
		["type"] = "Booth",
		["reward"] = "PollBooth",
		["available"] = true,
	},
	["BOOTH-345F-34fdM"] = {
		["type"] = "Booth",
		["reward"] = "DoodleBooth",
		["available"] = true,
	},
}

local playerCooldowns = {}

RemoteEvents.RedeemCode.OnServerEvent:Connect(function(player, codeInput)
	if typeof(codeInput) ~= "string" then return end

	local currentTime = os.clock()
	if playerCooldowns[player.UserId] and (currentTime - playerCooldowns[player.UserId] < ct) then
		return RemoteEvents.RedeemCode:FireClient(player, "ratelimit")
	end
	playerCooldowns[player.UserId] = currentTime

	task.wait(math.random(rd[1], rd[2]))

	local codeData = codes[codeInput]

	if not codeData then
		return RemoteEvents.RedeemCode:FireClient(player, "invalid")
	end

	if not codeData.available then
		return RemoteEvents.RedeemCode:FireClient(player, "expired")
	end

	local success, redeemedList = pcall(function()
		return RedeemedCodesDS:GetAsync(tostring(player.UserId)) or {}
	end)

	if not success then
		return RemoteEvents.RedeemCode:FireClient(player, "error")
	end

	if redeemedList[codeInput] then
		return RemoteEvents.RedeemCode:FireClient(player, "used")
	end

	if codeData.type == "Giftbux" then
		local currentBux = player:GetAttribute("GiftBuxs") or 0
		local newBalance = currentBux + codeData.reward
		player:SetAttribute("GiftBuxs", newBalance)
		RemoteEvents.NewGiftbuxBalance:FireClient(player, newBalance)

	elseif codeData.type == "Booth" then
		local boothName = codeData.reward

		if DataModule:IsPlayerOwningBooth(player.UserId, boothName) then
			return RemoteEvents.AlreadyOwned:FireClient(player)
		end

		local boothInfo = BoothsModule.Booths[boothName]
		if not boothInfo then
			return RemoteEvents.RedeemCode:FireClient(player, "error")
		end

		local clientBoothData = {
			["price"] = boothInfo.price,
			["name"] = boothInfo.name,
			["id"] = boothInfo.name,
			["icon"] = boothInfo.icon,
			["hoverIcon"] = boothInfo.hoverIcon
		}

		RemoteEvents.NewPurchasedBooths:FireClient(player, clientBoothData)
		DataModule:PurcharseBooth(player.UserId, boothName)
	end

	redeemedList[codeInput] = true
	local saveSuccess, saveError = pcall(function()
		RedeemedCodesDS:SetAsync(tostring(player.UserId), redeemedList)
	end)

	if saveSuccess then
		local successMsg = string.format("%s %s", tostring(codeData.reward), codeData.type)
		RemoteEvents.RedeemCode:FireClient(player, "success", successMsg)
	else
		RemoteEvents.RedeemCode:FireClient(player, "error")
	end
end)