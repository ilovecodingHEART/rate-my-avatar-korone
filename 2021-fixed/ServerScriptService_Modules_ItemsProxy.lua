-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- << Services >> --

local _replicatedstorage = game:GetService("ReplicatedStorage")
local _players = game:GetService("Players")
local _serverstorage = game:GetService("ServerStorage")
local _serverscriptservice = game:GetService("ServerScriptService")
local _workspace = game:GetService("Workspace")
local _collectionservice = game:GetService("CollectionService")
local _marketplaceservice = game:GetService("MarketplaceService")
local _httpservice = game:GetService("HttpService")
local _datastoreservice = game:GetService("DataStoreService")

-- << Modules >> --

local _remotes = require(_replicatedstorage:WaitForChild("Remotes"))
local _numberhelpers = require(_replicatedstorage:WaitForChild("NumberHelpers"))

-- << Data >> --

local _key = "V1"
local _itemsstore = _datastoreservice:GetDataStore("Items" .. _key)
local _playeritems = {};
local _giftitems = {};
local PlayerGame = {};

local _localplayer = {};

-- << Module >> --

local Items = {}

local foundAnyAssets = false

-- << Functions >> --

local function fetchData(url)
	local success, response = pcall(function()
		return _httpservice:GetAsync(url)
	end)
	if success then
		return _httpservice:JSONDecode(response)
	end
	return nil
end

local function fetchAllGames(userId)
	local _allgames = {}
	local nextCursor
	repeat
		local url = string.format("https://games.RoProxy.com/v2/users/%s/games?accessFilter=Public&sortOrder=Asc&limit=10", userId)
		if nextCursor then
			url = url .. "&cursor=" .. nextCursor
		end
		local data = fetchData(url)
		if data and data.data then
			for _, gamess in ipairs(data.data) do
				table.insert(_allgames, gamess)
			end
			nextCursor = data.nextPageCursor
		else
			break
		end
	until not nextCursor
	return _allgames
end

-- << Functions >> --

function Items:GetPlayerItems(target)
	return _playeritems[target.UserId] or {}
end

local function fetchGamePasses(userId)
	local url = string.format("https://roblox-gamepasses.fcortez878.workers.dev/?userId=%s", userId)
	print(">> Fetching Gamepasses from:", url)

	local success, response = pcall(function()
		return _httpservice:GetAsync(url)
	end)

	print(">> Request success:", success)
	if not success then
		warn("!! HTTP request failed:", response)
		return {}
	end

	local ok, data = pcall(function()
		return _httpservice:JSONDecode(response)
	end)

	if not ok then
		warn("!! Failed to decode JSON:", data)
		return {}
	end

	print(">> Gamepasses fetched:", data)
	return data.gamePasses or {}
end




local function fetchAssets(userId)
	local url = string.format("https://fires-proxy.vercel.app/clothes/%s", userId)
	local data = fetchData(url)
	local assets = {}
	if data and data.items then
		for category, categoryData in pairs(data.items) do
			if categoryData.items and #categoryData.items > 0 then
				for _, asset in ipairs(categoryData.items) do
					local itemType = "Asset";
					if category == "tshirts" then
						itemType = "T-Shirt";
					elseif category == "shirts" then
						itemType = "Shirt";
					elseif category == "pants" then
						itemType = "Pants";
					end;
					if asset.price and type(asset.price) == "number" and asset.price >= 0 then
						assets[asset.id] = {
							ItemName = asset.name;
							ItemPrice = asset.price;
							ItemType = itemType;
							ItemId = asset.id;
							CreatorId = asset.creatorTargetId;
							ItemImage = string.format("rbxthumb://type=Asset&id=%s&w=150&h=150", asset.id);
						};
					end;
				end;
			end;
		end;
	end;
	return assets;
end;
function Items:LoadPlayerItems(target)
	local loadingComplete = false
	local playerItems = {}
	local passes = fetchGamePasses(target.UserId)
	local assets = fetchAssets(target.UserId)
	for _, item in ipairs(passes) do
		if item.id and item.price then
			playerItems[item.id] = {
				ItemName = item.name,
				ItemPrice = item.price,
				ItemType = "Gamepass",
				ItemId = item.id,
				CreatorId = target.UserId,
				ItemImage = string.format("rbxthumb://type=GamePass&id=%s&w=150&h=150", item.id),
			}
		end
	end

	for id, item in pairs(assets) do
		playerItems[id] = item
	end
	_playeritems[target.UserId] = playerItems
	loadingComplete = true
	return _playeritems[target.UserId];
end;

function getitems(arg1)
	return _playeritems[arg1.UserId] or {};
end
function Items:LoadPlayerItemsOnBooth(target, boothUI, customization, gifting)
	local _table = {};
	if gifting == true then
		_table = Items:LoadPlayerItems(target);
	else
		_table = getitems(target);
	end;
	print(getitems(target));
	for _, item in pairs(_table) do
		local itemTemplate
		if customization.buttonLayout == "Normal" then
			itemTemplate = script:WaitForChild("ItemTemplate"):Clone()
			itemTemplate.Text = string.format('\238\128\130%s', _numberhelpers.formatCommas(item.ItemPrice))
			itemTemplate.UIStroke.Color = customization.buttonStrokeColor;
		elseif customization.buttonLayout == "Image" then
			itemTemplate = script:WaitForChild("ImageTemplate"):Clone()
			itemTemplate.Price.Text = string.format('\238\128\130%s', _numberhelpers.formatCommas(item.ItemPrice))
			itemTemplate.ImageLabel.Image = item.ItemImage;
			itemTemplate.UIStroke.Color = customization.buttonStrokeColor;
		elseif customization.buttonLayout == "ImageFill" then
			itemTemplate = script:WaitForChild("ImageFillTemplate"):Clone()
			itemTemplate.ImageLabel.Price.Text = string.format('\238\128\130%s', _numberhelpers.formatCommas(item.ItemPrice))
			itemTemplate.ImageLabel.Image = item.ItemImage;
		else
			itemTemplate = script:WaitForChild("ItemTemplate"):Clone()
			itemTemplate.Text = string.format('\238\128\130%s', _numberhelpers.formatCommas(item.ItemPrice))
			itemTemplate.UIStroke.Color = customization.buttonStrokeColor;
		end
		itemTemplate.Name = item.ItemId
		itemTemplate.BackgroundColor3 = customization.buttonColor
		if itemTemplate:FindFirstChild("ImageLabel") then
			if itemTemplate.ImageLabel:FindFirstChild("Price") then
				itemTemplate.ImageLabel.Price.TextColor3 = customization.buttonTextColor
				itemTemplate.ImageLabel.Price.Font = customization.buttonTextFont
			else
				itemTemplate.Price.TextColor3 = customization.buttonTextColor
				itemTemplate.Price.Font = customization.buttonTextFont
			end
		else
			itemTemplate.TextColor3 = customization.buttonTextColor
			itemTemplate.Font = customization.buttonTextFont
		end
		itemTemplate:SetAttribute("AssetId", item.ItemId)
		itemTemplate:SetAttribute("AssetType", item.ItemType)
		itemTemplate:SetAttribute("AssetPrice", item.ItemPrice)
		itemTemplate:SetAttribute("AssetName", item.ItemName)
		itemTemplate:SetAttribute("AssetImage", item.ItemImage)
		itemTemplate:SetAttribute("CreatorId", item.CreatorId)
		itemTemplate:SetAttribute("IsOffline", gifting)
		itemTemplate:SetAttribute("IdleColor", customization.buttonColor)
		itemTemplate:SetAttribute("HoverColor", customization.buttonHoverColor)

		local promptRemote = Instance.new("RemoteEvent", itemTemplate)
		promptRemote.Name = "Prompt"

		local checkOwnedRemote = Instance.new("RemoteFunction", itemTemplate)
		checkOwnedRemote.Name = "CheckOwned"

		_collectionservice:AddTag(itemTemplate, "ItemFrame")
		_collectionservice:AddTag(promptRemote, "PromptEvent")
		itemTemplate.LayoutOrder = item.ItemPrice
		itemTemplate.Parent = boothUI
		boothUI.CanvasSize = UDim2.fromOffset(boothUI.UIListLayout.AbsoluteContentSize.X, 0)
	end
end
function Items:_unclaimedbooth(arg1)
	_playeritems[arg1.UserId] = nil;
end
function Items:CheckIfPlayerGotAnything(arg1)
	local playerItems = getitems(arg1);
	return playerItems
end;
function Items:FetchPlayerGame(arg1)
	return PlayerGame[arg1.UserId];
end;
return Items
