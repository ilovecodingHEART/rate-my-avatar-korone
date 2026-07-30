-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- advCalender by Nirox
-- Fixed by 22Slipz

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local Datastoresee = game:GetService("DataStoreService");
local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"));
local ClaimedGifts = Datastoresee:GetDataStore("OpenedGiftsV3");
local NewGiftbuxBalance = Remotes.Event("NewGiftbuxBalance");
local NewPurchasedBooths = Remotes.Event('NewPurchasedBooths');

local Cache = {};
--  Functions  --

function FetchPlayerData(arg1)
	local _succed, _data = pcall(function()
		return ClaimedGifts:GetAsync(arg1.UserId) or {}
	end)

	if _succed then
		Cache[arg1.UserId] = _data
		return _data
	else
		warn(("failed for player @%s"):format(arg1.Name))
		return {}
	end
end
function dataa(arg1)
	if not Cache[arg1.UserId] then return end
	local success, err = pcall(function()
		ClaimedGifts:SetAsync(arg1.UserId, Cache[arg1.UserId])
	end)
	if not success then
		warn(("failed for player @%s"):format(arg1.Name));
	end;
end;

Players.PlayerAdded:Connect(function(arg1)
	FetchPlayerData(arg1);
end);
Players.PlayerRemoving:Connect(function(arg1)
	dataa(arg1);
	Cache[arg1.UserId] = nil;
end);

local WaitTime = {};
Remotes.Function("GetOpenedCalendarGifts").OnServerInvoke = function(arg1)
	return Cache[arg1.UserId] or {};
end;
Remotes.Event("OpenCalendarGift").OnServerEvent:Connect(function(arg1, arg2)
	if WaitTime[arg1.UserId] and (tick() - WaitTime[arg1.UserId] < 0.7) then
		return 	Remotes.Event("OpenCalendarGift"):FireClient(arg1, "danger", "slow down!");
	end;
	WaitTime[arg1.UserId] = tick();
	if type(arg2) ~= "number" then
		warn(("invalid %s"):format(arg2));
		return;
	end;
	local _data = Cache[arg1.UserId];
	if not _data then
		warn("failed to fetch");
		return;
	end;
	for _, _allopendedgiftsyesplease in ipairs(_data) do
		if _allopendedgiftsyesplease.layout == arg2 then
			Remotes.Event("OpenCalendarGift"):FireClient(arg1, "danger", "you already claimed this gift!")
			return;
		end;
	end;
	table.insert(_data, {
		['layout'] = arg2
	});
	Remotes.Event("OpenCalendarGift"):FireClient(arg1, "success", "claimed!");
	if arg2 == 1 then
		print('Giftbux');
		local _amount = 50
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 2 then
		print('Giftbux');
		local _amount = 100
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 3 then
		print('Giftbux');
		local _amount = 150;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 4 then
		print('Booth');
		local Booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = Booths.Booths["MushroomBooth"].price;
			['name'] = Booths.Booths["MushroomBooth"].name;
			['id'] = Booths.Booths["MushroomBooth"].name;
			['icon'] = {
				['Image'] = Booths.Booths["MushroomBooth"].icon.Image;
				['ImageRectOffset'] = Booths.Booths["ToasterBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["ToasterBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = Booths.Booths["MushroomBooth"].hoverIcon.Image;
				['ImageRectOffset'] = Booths.Booths["MushroomBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["MushroomBooth"].hoverIcon.ImageRectSize;
			};
		};
		NewPurchasedBooths:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, Booths.Booths['MushroomBooth'].name);
	elseif arg2 == 5 then
		print('Giftbux');
		local _amount = 250;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 6 then
		print('Giftbux');
		local _amount = 250;
		if not arg1.Backpack:FindFirstChild("DarkBlueHammer") then
			game.ServerStorage.PlayerTools:WaitForChild('DarkBlueHammer'):Clone().Parent = arg1.Backpack;
		end
		Datastoresee:GetDataStore("BlueDarkHammer"):SetAsync(arg1.UserId, true);
	elseif arg2 == 7 then
		print('Giftbux');
		local _amount = 350;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 8 then
		print('Giftbux');
		local _amount = 400;
		arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _amount);
		--_giftbux:SetAsync(arg1.UserId, arg1:GetAttribute("GiftBuxs"));
		NewGiftbuxBalance:FireClient(arg1, arg1:GetAttribute('GiftBuxs'));
	elseif arg2 == 9 then
		print('Booth');
		local Booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = Booths.Booths["ToasterBooth"].price;
			['name'] = Booths.Booths["ToasterBooth"].name;
			['id'] = Booths.Booths["ToasterBooth"].name;
			['icon'] = {
				['Image'] = Booths.Booths["ToasterBooth"].icon.Image;
				['ImageRectOffset'] = Booths.Booths["ToasterBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["ToasterBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = Booths.Booths["ToasterBooth"].hoverIcon.Image;
				['ImageRectOffset'] = Booths.Booths["ToasterBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["ToasterBooth"].hoverIcon.ImageRectSize;
			};
		};
		NewPurchasedBooths:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, Booths.Booths['ToasterBooth'].name);
	elseif arg2 == 10 then
		print('Booth');
		local Booths = require(game.ServerStorage.Booths);
		local _table = {
			['price'] = Booths.Booths["CakeBooth"].price;
			['name'] = Booths.Booths["CakeBooth"].name;
			['id'] = Booths.Booths["CakeBooth"].name;
			['icon'] = {
				['Image'] = Booths.Booths["CakeBooth"].icon.Image;
				['ImageRectOffset'] = Booths.Booths["CakeBooth"].icon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["CakeBooth"].icon.ImageRectSize;
			};
			['hoverIcon'] = {
				['Image'] = Booths.Booths["CakeBooth"].hoverIcon.Image;
				['ImageRectOffset'] = Booths.Booths["CakeBooth"].hoverIcon.ImageRectOffset;
				['ImageRectSize'] = Booths.Booths["CakeBooth"].hoverIcon.ImageRectSize;
			};
		};
		NewPurchasedBooths:FireClient(arg1, _table);
		_data:PurcharseBooth(arg1.UserId, Booths.Booths['CakeBooth'].name);
	end;
	dataa(arg1);
	
end);