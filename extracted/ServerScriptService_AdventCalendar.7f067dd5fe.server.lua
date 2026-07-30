-- << Services >> --
local _replicatedstorage = game:GetService("ReplicatedStorage");
local _players = game:GetService("Players");
local _datastoreservice = game:GetService("DataStoreService");

-- << Modules >> --
local _remotes = require(_replicatedstorage:WaitForChild("Remotes"));
local _numberhelpers = require(_replicatedstorage:WaitForChild("NumberHelpers"));

-- << DataStore Setup >> --

local _opendedgifts = _datastoreservice:GetDataStore("OpenedGiftsV3");
local _cache = {};

local _cancelprompt = _remotes.Event("CancelPromptPurchase");
local _giftsent = _remotes.Event('GiftSentAlert');
local _chatalert = _remotes.Event("ChatDonationAlert");
local _newgiftbuxbalance = _remotes.Event("NewGiftbuxBalance");
local _newdonated = _remotes.Event('DonatedChanged');
local _purchaseboothstarted = _remotes.Event("PurchaseBoothStarted");
local _alreadyowned = _remotes.Event("AlreadyOwned");
local _newpurchasedbooth = _remotes.Event('NewPurchasedBooths');

-- << Functions >> --

function _fetchplayerdata(arg1)
	local _succed, _data = pcall(function()
		return _opendedgifts:GetAsync(arg1.UserId) or {};
	end)
	if _succed then
		_cache[arg1.UserId] = _data;
		return _data;
	else
		warn(("failed for player @%*"):format(arg1.Name));
		return {};
	end;
end;
function _savedata(arg1)
	if not _cache[arg1.UserId] then return end
	local success, err = pcall(function()
		_opendedgifts:SetAsync(arg1.UserId, _cache[arg1.UserId])
	end)
	if not success then
		warn(("failed for player @%*"):format(arg1.Name));
	end;
end;

-- << Player Management >> --
_players.PlayerAdded:Connect(function(arg1)
	_fetchplayerdata(arg1);
end);
_players.PlayerRemoving:Connect(function(arg1)
	_savedata(arg1);
	_cache[arg1.UserId] = nil;
end);

-- << Handlers >> --

local _waittime = {};
_remotes.Function("GetOpenedCalendarGifts").OnServerInvoke = function(arg1)
	return _cache[arg1.UserId] or {};
end;
_remotes.Event("OpenCalendarGift").OnServerEvent:Connect(function(arg1, arg2)
	if _waittime[arg1.UserId] and (tick() - _waittime[arg1.UserId] < 0.7) then
		return 	_remotes.Event("OpenCalendarGift"):FireClient(arg1, "danger", "slow down!");
	end;
	_waittime[arg1.UserId] = tick();
	if type(arg2) ~= "number" then
		warn(("invalid %*"):format(arg2));
		return;
	end;
	local _data = _cache[arg1.UserId];
	if not _data then
		warn("failed to fetch");
		return;
	end;
	for _, _allopendedgiftsyesplease in ipairs(_data) do
		if _allopendedgiftsyesplease.layout == arg2 then
			_remotes.Event("OpenCalendarGift"):FireClient(arg1, "danger", "you already claimed this gift!")
			return;
		end;
	end;
	table.insert(_data, {
		['layout'] = arg2
	});
	_remotes.Event("OpenCalendarGift"):FireClient(arg1, "success", "claimed!");
	if arg2 == 1 then
		print('Giftbux');
		local _amount = 50
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 2 then
		print('Giftbux');
		local _amount = 100
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 3 then
		print('Giftbux');
		local _amount = 150;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 4 then
		print('Booth');
		local _booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = _booths.Booths["MushroomBooth"].price;
			['name'] = _booths.Booths["MushroomBooth"].name;
			['id'] = _booths.Booths["MushroomBooth"].name;
			['icon'] = {
				['Image'] = _booths.Booths["MushroomBooth"].icon.Image;
				['ImageRectOffset'] = _booths.Booths["ToasterBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["ToasterBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = _booths.Booths["MushroomBooth"].hoverIcon.Image;
				['ImageRectOffset'] = _booths.Booths["MushroomBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["MushroomBooth"].hoverIcon.ImageRectSize;
			};
		};
		_newpurchasedbooth:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, _booths.Booths['MushroomBooth'].name);
	elseif arg2 == 5 then
		print('Giftbux');
		local _amount = 250;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 6 then
		print('Giftbux');
		local _amount = 250;
		if not arg1.Backpack:FindFirstChild("DarkBlueHammer") then
			game.ServerStorage.PlayerTools:WaitForChild('DarkBlueHammer'):Clone().Parent = arg1.Backpack;
		end
		_datastoreservice:GetDataStore("BlueDarkHammer"):SetAsync(arg1.UserId, true);
	elseif arg2 == 7 then
		print('Giftbux');
		local _amount = 350;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 8 then
		print('Giftbux');
		local _amount = 400;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		_newgiftbuxbalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 9 then
		print('Booth');
		local _booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = _booths.Booths["ToasterBooth"].price;
			['name'] = _booths.Booths["ToasterBooth"].name;
			['id'] = _booths.Booths["ToasterBooth"].name;
			['icon'] = {
				['Image'] = _booths.Booths["ToasterBooth"].icon.Image;
				['ImageRectOffset'] = _booths.Booths["ToasterBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["ToasterBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = _booths.Booths["ToasterBooth"].hoverIcon.Image;
				['ImageRectOffset'] = _booths.Booths["ToasterBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["ToasterBooth"].hoverIcon.ImageRectSize;
			};
		};
		_newpurchasedbooth:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, _booths.Booths['ToasterBooth'].name);
	elseif arg2 == 10 then
		print('Booth');
		local _booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = _booths.Booths["CakeBooth"].price;
			['name'] = _booths.Booths["CakeBooth"].name;
			['id'] = _booths.Booths["CakeBooth"].name;
			['icon'] = {
				['Image'] = _booths.Booths["CakeBooth"].icon.Image;
				['ImageRectOffset'] = _booths.Booths["CakeBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["CakeBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = _booths.Booths["CakeBooth"].hoverIcon.Image;
				['ImageRectOffset'] = _booths.Booths["CakeBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = _booths.Booths["CakeBooth"].hoverIcon.ImageRectSize;
			};
		};
		_newpurchasedbooth:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, _booths.Booths['CakeBooth'].name);
	end;
	_savedata(arg1);
	
end);