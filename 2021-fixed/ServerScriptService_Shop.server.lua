-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- !! MANUAL FIX REQUIRED: 2 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- recoded by 22slipz

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _datastoreservice = game:GetService("DataStoreService");
local _messagingservice = game:GetService("MessagingService");

-- << Modules >> -- 

local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));
local _data = require(_serverscriptservice.Modules.Data);
local _booths = require(_serverstorage.Booths);

local _letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
local _ids = {};
local _spawnedbooths = {};
local _spawnedboothspurchase = {};

-- << Booth Name Formatting >> --

function _boothname(arg1)
	local _name = '';
	for i = 1, #arg1 do
		local _letter = string.sub(arg1, i, i);
		if not __2021_find(_letters, _letter) or i == 1 then
			_name = _name .. _letter;
		else
			_name = _name .. ' ' .. _letter;
		end;
	end;
	return _name;
end;

-- << Get Random Booths >> --

function _getrandombooths()
	local _boothlist = {};
	local _excluded = {
		"CarouselBooth", "TankBooth", "GlassAnimalsBooth", "FerrisWheelBooth", "CraneBooth", "ToasterBooth",
		"MushRoomBooth", "CakeBooth", "Valentines2025Booth", "ValentinesChocolateBooth", "ValentinesGateBooth",
		"LoveLettersBooth", "BillboardBooth", "JackInTheBoxBooth", "ElevatorBooth", "StaffBooth", "RDC24Booth", "BasicBooth", "PollBooth",
		"10KBooth","GoldBooth", "100KBooth", "VoidBooth", "DiamondBooth", "RocketBooth", "RDC25Booth", "KSIBooth", "EvadeBooth", "AdidasBooth", "TwitchBooth",
		"NukeBooth", "RoBotBooth", "RDC25Booth", "GymBooth", "TDSBooth", "VIPBooth", "RocketBooth", "ElevatorBooth", "LLSBooth", "TheHuntBooth",
		"PixelPlaygroundBooth", "CatalogAvatarCreatorBooth", "DoorsBooth", "MakeAWishBooth", "YippeeBooth", "IdioticInvestingBooth", "PetSimXBooth", "TypeRaceBooth"
	}; 
	for _, _allbooths in pairs(require(_serverstorage.Booths).Booths) do
		if not __2021_find(_excluded, _allbooths.name) then
			table.insert(_boothlist, _allbooths.name);
		end;
	end;
	local _selectedbooths = {};
	for i = 1, math.min(10, #_boothlist) do
		local _random = table.remove(_boothlist, math.random(1, #_boothlist));
		table.insert(_selectedbooths, _random);
	end;
	return _selectedbooths;
end;

-- << Booth Setup >> --

function _purchasetrigger(arg1)
	arg1.RequestPurchase.OnServerEvent:Connect(function(p1)
		local _price = arg1:GetAttribute('Price')
		local _boothId = arg1:GetAttribute('BoothId')

		if tonumber(p1:GetAttribute('GiftBuxs') or 0) >= _price then
			if _data:IsPlayerOwningBooth(p1.UserId, _boothId) then
				_remotes.Event("AlreadyOwned"):FireClient(p1)
			else
				p1:SetAttribute('GiftBuxs', p1:GetAttribute('GiftBuxs') - _price)
				_data:PurcharseBooth(p1.UserId, _boothId)
				local _table = {
					['price'] = _booths.Booths[_boothId].price,
					['name'] = _boothname(_boothId),
					['id'] = _boothId,
					['icon'] = _booths.Booths[_boothId].icon,
					['hoverIcon'] = _booths.Booths[_boothId].hoverIcon
				};
				_remotes.Event('NewPurchasedBooths'):FireClient(p1, _table)
			end
		else
			_remotes.Event('InsufficientGiftbux'):FireClient(p1)
		end;
	end);
end;
function _setbooths(_boothselection)
	for _, booth in pairs(_spawnedbooths) do
		if booth and booth.Parent then
			booth:Destroy();
		end;
	end;
	for _, booth in pairs(_spawnedboothspurchase) do
		if booth then
			booth:Destroy();
		end;
	end;
	_spawnedbooths = {};
	_spawnedboothspurchase = {};
	for _index, _boothslots in pairs(_workspace.Map.Buildings.Shop.BoothSlots:GetChildren()) do
		if _boothslots:IsA("Part") then
			local _random = _boothselection[_index] or _boothselection[math.random(1, #_boothselection)]
			local boothModel = _serverstorage.BoothModels:FindFirstChild(_random)

			if not boothModel then
				warn("booth model missing:", _random)
				continue -- << MANUAL FIX: continue (2021 cannot compile this) >>
			end

			local _clonebooth = boothModel:Clone()

			if not _clonebooth then
				warn(("failed to find booth %s"):format(_random))
				continue -- << MANUAL FIX: continue (2021 cannot compile this) >>
			end

			_clonebooth = _clonebooth:Clone()
			local _boothui = script.BoothUI:Clone()
			_boothui.Items.Adornee = _clonebooth.ItemsPart
			_boothui.Sign.Adornee = _clonebooth.SignPart
			_boothui.Details.Adornee = _clonebooth.Base
			_boothui.Parent = _clonebooth
			_clonebooth:SetPrimaryPartCFrame(_boothslots.CFrame)
			_clonebooth.Parent = _workspace
			table.insert(_spawnedbooths, _clonebooth);
			local _event = Instance.new("RemoteEvent", _boothslots.ProximityPart.PurchaseBoothTrigger);
			_event.Name = "RequestPurchase";
			table.insert(_spawnedboothspurchase, _event);
			_boothslots.ProximityPart.PurchaseBoothTrigger.ObjectText = _boothname(_random)
			_boothslots.PriceGui.TextLabel.Text = tostring(require(_serverstorage.Booths).Booths[_random].price)
			_boothslots.ProximityPart.PurchaseBoothTrigger:SetAttribute('Price', require(_serverstorage.Booths).Booths[_random].price)
			_boothslots.ProximityPart.PurchaseBoothTrigger:SetAttribute('BoothId', require(_serverstorage.Booths).Booths[_random].name)
			_collectionservice:AddTag(_boothslots.ProximityPart.PurchaseBoothTrigger, 'PurchaseBoothTrigger');
			_purchasetrigger(_event.Parent);
		end
	end
end
local function _timer(arg1)
	local days = math.floor(arg1 / 86400);
	local hours = math.floor(arg1 % 86400 / 3600);
	local minutes = math.floor(arg1 % 3600 / 60);
	local secs = arg1 % 60;
	return string.format("%dD %dH %dM %dS", days, hours, minutes, secs);
end;
spawn(function()
	local timel = os.time() + 1800

	local currentBooths = _getrandombooths()
	_setbooths(currentBooths)

	while true do
		local remainingTime = timel - os.time()

		if remainingTime > 0 then

			workspace.MapUI.ShopCountdown.Text = _timer(remainingTime)
			workspace.MapUI.ShopCountdown.Date.Text = string.upper(os.date("%B %d, %Y", timel))
			task.wait(1)
		else
			local newBooths = _getrandombooths()

			pcall(function()
				_setbooths(newBooths)

			end)
			timel = os.time() + 1800
		end
	end
end);