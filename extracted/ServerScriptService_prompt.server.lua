-- << Services > -- 

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _players = game:GetService("Players");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _marketplaceservice = game:GetService("MarketplaceService");
local _gameepassesservice = game:GetService("GamePassService");
local _messagingservice = game:GetService("MessagingService");
local _httpservice = game:GetService("HttpService");
local _datastoreservice = game:GetService("DataStoreService");

-- << Modules > -- 

local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));
local _numbershelper = require(_replicatedstorge:WaitForChild('NumberHelpers'))
local _items = require(_serverscriptservice.Modules.Items);

-- << Data >> --

local _giftwrap = {};
local _vipplayer =  {};
local _anonymous = {};

-- << Remotes Runs >> --

local _cancelprompt = _remotes.Event("CancelPromptPurchase");
local _giftsent = _remotes.Event('GiftSentAlert');
local _chatalert = _remotes.Event("ChatDonationAlert");
local _newgiftbuxbalance = _remotes.Event("NewGiftbuxBalance");
local _newdonated = _remotes.Event('DonatedChanged');
local _giftrecieve = _remotes.Event("GiftReceived");

-- << Data >> --

local _customization = _datastoreservice:GetDataStore("CustomizationV1");
local _donationhistory = _datastoreservice:GetDataStore("DonationHistoryV1");
local _donatedata = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardV1");
local _donatedatadaily = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardDailyV1");
local _donatedataweekly = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardWeeklyV1");
local _donatedatamonthly = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardMonthlyV1");
local _raisedata = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardV1");
local _raisedatadaily = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardDailyV1");
local _raisedataweekly = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardWeeklyV1");
local _raisedatamonthly = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardMonthlyV1");
local _owneddonationsdata = _datastoreservice:GetDataStore("OwnedDonations");
local _boothcolorsdatastore = _datastoreservice:GetDataStore("BoothColorsV2");
local _lastgamepassclicked = _datastoreservice:GetDataStore("LastGamepassClicked");

-- << Tables >> -- 

local _giftstable = {};
local _currentdonation = {};
local _owneddonation = {};

-- << Events >> --

game.Players.PlayerAdded:Connect(function(p1)
	if _datastoreservice:GetDataStore("PlayerVIPV2"):GetAsync(p1.UserId) then
		_vipplayer[p1.UserId] = true;
	else
		_vipplayer[p1.UserId] = false;
	end
end);
function _pricegiftbux(arg1)
	return math.floor(math.sqrt(arg1) * 5);
end;
local function _questionsmarks(arg1)
	return string.rep("?", tostring(arg1):len());
end;
function _filtertext(arg1, arg2)
	local _data = 'failed to filter text';
	local IsSuccess, ErrorMessage = pcall(function()
		local Result = game:GetService("TextService"):FilterStringAsync(arg1, arg2, Enum.TextFilterContext.PublicChat);
		_data = Result:GetNonChatStringForUserAsync(arg2);
	end)
	if not IsSuccess or not _data then
		return 'Failed to filter the text please try again or report to staff.'
	end
	return _data;
end;
function _isfiltered(arg1, arg2)
	local _filtered = _filtertext(arg1, arg2);
	if _filtered == arg1 then
		return false;
	else
		return true;
	end;
end;
function _puplishgift(arg1, arg2)
	_messagingservice:PublishAsync("GiftingGlobal", {
		['Donator'] = {
			['UserId'] = arg1.UserId;
			['Name'] = arg1.Name;
			['DisplayName'] = arg1.DisplayName;
		};
		['target'] = arg2.Target;
		['price'] = arg2.AssetPrice;
		['msg'] = arg2.Message;
	});
end;
function _getuserinfo(arg1)
	local _succed, _result = pcall(function()
		return game:GetService("UserService"):GetUserInfosByUserIdsAsync({arg1});
	end);
	return table.unpack(_result);
end;
function _addgift(arg1, arg2, arg3, arg4)
	if _giftstable[arg1] then
		local _dataaa = _giftstable[arg1]
		table.insert(_dataaa, {
			['donatorUserId'] = {
				['Id'] = arg2.UserId,
				['Username'] = arg2.Name,
				['DisplayName'] = arg2.DisplayName
			},
			['message'] = arg4,
			['donatedRobux'] = arg3,
			['whenDonated'] = tonumber(DateTime.now().UnixTimestamp),
		});
		return;
	end;
	local _giftsdata = _datastoreservice:GetDataStore(arg1.. "PlayerGifts1");
	local _dataaa = _giftsdata:GetAsync('_Gifts_')
	if _dataaa == nil then
		_dataaa = {}
	end
	table.insert(_dataaa, {
		['donatorUserId'] = {
			['Id'] = arg2.UserId,
			['Username'] = arg2.Name,
			['DisplayName'] = arg2.DisplayName
		},
		['message'] = arg4,
		['donatedRobux'] = arg3,
		['whenDonated'] = tonumber(DateTime.now().UnixTimestamp),
	});
	_giftsdata:SetAsync('_Gifts_', _dataaa);
end;
function _colortorgb(arg1)
	return {arg1.R * 255, arg1.G * 255, arg1.B * 255};
end
function _rgbtocolor(arg1)
	if not arg1 then return print("failed") end 
	return Color3.fromRGB(arg1[1], arg1[2], arg1[3]);
end;
function _customizationdata(arg1)
	local _datacustomization = {};
	if _customization:GetAsync(arg1) then
		local _jsoned = game:GetService("HttpService"):JSONDecode(_customization:GetAsync(arg1));
		_datacustomization = {
			text = _jsoned.text or "your text here",
			textFont = Enum.Font[_jsoned.textFont],
			textColor = _rgbtocolor(_jsoned.textColor),
			strokeColor = _rgbtocolor(_jsoned.strokeColor),
			strokeOpacity = tonumber(_jsoned.strokeOpacity) or 0.5,
			richText = _jsoned.richText or true,
			buttonTextFont = Enum.Font[_jsoned.buttonTextFont],
			buttonTextColor = _rgbtocolor(_jsoned.buttonTextColor),
			buttonStrokeColor = _rgbtocolor(_jsoned.buttonStrokeColor),
			buttonHoverColor = _rgbtocolor(_jsoned.buttonHoverColor),
			buttonColor = _rgbtocolor(_jsoned.buttonColor),
			buttonLayout = tostring(_jsoned.buttonLayout) or "Normal";
		};
	else
		_datacustomization = {
			text = "your text here",
			textFont = Enum.Font.GothamBlack,
			textColor = Color3.fromRGB(255, 255, 255),
			strokeColor = Color3.fromRGB(0, 0, 0),
			strokeOpacity = 0.5,
			richText = true,
			buttonTextFont = Enum.Font.GothamBlack,
			buttonTextColor = Color3.fromRGB(0, 0, 0),
			buttonStrokeColor = Color3.fromRGB(0, 0, 0),
			buttonHoverColor = Color3.fromRGB(174, 254, 255),
			buttonColor = Color3.fromRGB(0, 255, 17),
			buttonLayout = "Normal";
		}
	end;
	return _datacustomization;
end;
function _ownedgamepassbyapi(arg1, arg2)
	local _response = _httpservice:GetAsync(("https://fires-apis.vercel.app/api/productinfo/%*"):format(arg1));
	local _data = _httpservice:JSONDecode(_response);
	if not _data or not _data.PriceInRobux then
		return false;
	end;
	print('// api got price');
	return _data.PriceInRobux == arg2;
end;
function _ownedassetbyapi(arg1, arg2)
	local _response = _httpservice:GetAsync(("https://economy.roproxy.com/v2/assets/%*/details"):format(arg1));
	local _data = _httpservice:JSONDecode(_response);
	if not _data or not _data.PriceInRobux then
		return false;
	end;
	print('// api got price');
	return _data.PriceInRobux == arg2;
end;
function _logdonation(arg1, arg2, arg3)
	local _success, _error = pcall(function()
		local _donationStore = _datastoreservice:GetOrderedDataStore(arg2 .. "SavedDonationsV3");
		local _currentdonation = _donationStore:GetAsync(arg1);
		if _currentdonation then
			_donationStore:SetAsync(arg1, _currentdonation + arg3)
		else
			_donationStore:SetAsync(arg1, arg3)
		end;
	end);
	if not _success then
		warn(("Failed to show donations %*"):format(_error));
	end;
end;
function _makelog(arg1, arg2, arg3, arg4, arg5)
	local _savedata = {
		['donatorUserId'] = arg2,
		['boothOwnerUserId'] = arg3,
		['donatedRobux'] = arg4,
		['whenDonated'] = {["UnixTimestamp"] = tonumber(DateTime.now().UnixTimestamp) or tonumber(DateTime.now())};
		['isGift'] = arg5 or false;
	};
	if _anonymous[arg2] then
		--lazy
	end;
	local _sometable = {};
	_sometable = _donationhistory:GetAsync(arg1) or {};
	if type(_sometable) ~= "table" then
		_sometable = {};
	end;
	table.insert(_sometable, 1, _savedata);
	_donationhistory:SetAsync(arg1, _sometable);
end;
function _getgamepass(arg1)
	local _succed, _info = pcall(function()
		return _marketplaceservice:GetProductInfo(arg1, Enum.InfoType.GamePass);
	end);
	if _succed and _info then
		return _info;
	else
		warn(("failed id %*"):format(arg1));
		return nil;
	end;
end;
function _getdisplayname(arg1)
	local _verified = {5502332040};
	local _display = arg1.DisplayName;
	if arg1.MembershipType == Enum.MembershipType.Premium or table.find(_verified, arg1.UserId) then
		_display = "\238\128\129" .. " " .. _display;
	end;
	if arg1.HasVerifiedBadge or table.find(_verified, arg1.UserId) then
		_display = "\238\128\128" .. _display;
	end
	return _display;
end;
local _ldbstats = {};
function _updateldbstats(arg1, arg2, arg3)
	if not _ldbstats[arg1.UserId] then
		_ldbstats[arg1.UserId] = {Raised = {}, Donated = {}};
	end;
	if not _ldbstats[arg1.UserId].Donated then 
		_ldbstats[arg1.UserId].Donated = {};
	end;
	if not _ldbstats[arg2.UserId] then
		_ldbstats[arg2.UserId] = {Raised = {}, Donated = {}};
	end;
	if not _ldbstats[arg2.UserId].Raised then 
		_ldbstats[arg2.UserId].Raised = {} ;
	end;
	for _, _period in ipairs({"Daily", "Weekly", "Monthly"}) do
		if not _ldbstats[arg1.UserId].Donated[_period] then
			_ldbstats[arg1.UserId].Donated[_period] = 0;
		end;
		if not _ldbstats[arg2.UserId].Raised[_period] then
			_ldbstats[arg2.UserId].Raised[_period] = 0;
		end;
	end;
	_ldbstats[arg1.UserId].Donated.Daily = _ldbstats[arg1.UserId].Donated.Daily + arg3;
	_ldbstats[arg1.UserId].Donated.Weekly = _ldbstats[arg1.UserId].Donated.Weekly + arg3;
	_ldbstats[arg1.UserId].Donated.Monthly = _ldbstats[arg1.UserId].Donated.Monthly + arg3;
	_ldbstats[arg2.UserId].Raised.Daily = _ldbstats[arg2.UserId].Raised.Daily + arg3;
	_ldbstats[arg2.UserId].Raised.Weekly = _ldbstats[arg2.UserId].Raised.Weekly + arg3;
	_ldbstats[arg2.UserId].Raised.Monthly = _ldbstats[arg2.UserId].Raised.Monthly + arg3;
end;
function _savePlayerStats(player, category)
	local data = _ldbstats[player.UserId]
	if data and data[category] then
		task.spawn(function()
			if category == "Raised" then
				wait(0.5);
				local _weekly = _raisedataweekly:GetAsync(player.UserId) or 0
				_raisedataweekly:SetAsync(player.UserId, _weekly + data.Raised.Weekly)
				wait(0.5);
				local _daily = _raisedatadaily:GetAsync(player.UserId) or 0
				_raisedatadaily:SetAsync(player.UserId, _daily + data.Raised.Daily)
				wait(0.5);
				local _monthly = _raisedatamonthly:GetAsync(player.UserId) or 0
				_raisedatamonthly:SetAsync(player.UserId, _monthly + data.Raised.Monthly)
			elseif category == "Donated" then
				wait(0.5);
				local _weeklyD = _donatedataweekly:GetAsync(player.UserId) or 0
				_donatedataweekly:SetAsync(player.UserId, _weeklyD + data.Donated.Weekly)
				wait(0.5);
				local _dailyD = _donatedatadaily:GetAsync(player.UserId) or 0
				_donatedatadaily:SetAsync(player.UserId, _dailyD + data.Donated.Daily)
				wait(0.5);
				local _monthlyD = _donatedatamonthly:GetAsync(player.UserId) or 0
				_donatedatamonthly:SetAsync(player.UserId, _monthlyD + data.Donated.Monthly)
			end
			_ldbstats[player.UserId][category] = nil;
		end);
	end;
end;
function _saveAllPlayerStats(arg1)
	_savePlayerStats(arg1, "Raised");
	_savePlayerStats(arg1, "Donated");
end;
function _purchasedasset(arg1, arg2, arg3)
	local _target = game.Players:GetPlayerByUserId(arg2.Target);
	spawn(function()
		if arg3 >= 100 then
			print("ok")
		end;
		if arg3 >= 1000 then
                      print("ok")			
		end;
	end);
	task.spawn(function()
		if arg2.IsOffline then
			print('// this gift is offline');
			local _offlinebooth = _replicatedstorge:WaitForChild('OfflineBooths'):FindFirstChild(string.format('%sGiftBooth', arg1.UserId))
			if _offlinebooth then	
				_offlinebooth:SetAttribute('Raised', tonumber(_offlinebooth:GetAttribute('Raised') + arg3));
				_offlinebooth.BoothUI.Details.Raised.Text = string.format('\238\128\130%s raised', _numbershelper.formatCommas(_offlinebooth:GetAttribute('Raised')))
			end;
			_giftsent:FireClient(arg1, arg2.Target);
			_puplishgift(arg1, arg2);
		else
			if arg2.IsOffline then return end;
			print('// this is a normal gift');
			task.spawn(function()
				spawn(function()
					if _target and arg1 then
						arg1:SetAttribute("DonatedNumber", arg1:GetAttribute("DonatedNumber") + arg3);
						arg1:SetAttribute("GiftBuxs", arg1:GetAttribute("GiftBuxs") + _pricegiftbux(arg3));
						_donatedata:IncrementAsync(arg1.UserId, arg3);
					end;
				end);
				if _target and arg1 then
					spawn(function()
						local _donatorname = _getdisplayname(arg1);
						local _raisername = _getdisplayname(_target);
						_target:SetAttribute("RaisedNumber", _target:GetAttribute("RaisedNumber") + arg3);
						_serverscriptservice.DonationFire:Fire(arg1, _target, arg3);
						_chatalert:FireAllClients(_donatorname, _raisername, arg3, '');
						_raisedata:IncrementAsync(arg2.Target, arg3);
						spawn(function()
							_updateldbstats(arg1, _target, arg3);
						end);
					end);
				else
					spawn(function()
						_puplishgift(arg1, arg2);
						_giftsent:FireClient(arg1, arg2.Target);
					end);
				end;
				spawn(function()
					if _target and arg1 then
						_makelog(arg1.UserId, arg1.UserId, arg2.Target, arg3, false);
						_makelog(arg2.Target, arg1.UserId, arg2.Target, arg3, false);
						_logdonation(arg1.UserId, arg2.Target, arg3);
					end;
				end);
			end);
		end;
	end);
end;
local _cooldown = {};
local _verifiedprice = {};
local _pending = {};
function _promptevent(arg1)
	local AssetId = arg1.Parent:GetAttribute('AssetId');
	local Target = arg1.Parent:GetAttribute('CreatorId');
	local AssetPrice = arg1.Parent:GetAttribute('AssetPrice');
	local AssetName = arg1.Parent:GetAttribute('AssetName');
	local AssetImage = arg1.Parent:GetAttribute('AssetImage');
	local IsOffline = arg1.Parent:GetAttribute('IsOffline');
	arg1.OnServerEvent:Connect(function(Player, Message, toggle, price)
		if _cooldown[Player.UserId] and (tick() - _cooldown[Player.UserId] < 1) then
			return;
		end;
		_cooldown[Player.UserId] = tick();
		if not _currentdonation[Player.UserId] then
			return;
		end;
		if Target == Player.UserId and not game:GetService("RunService"):IsStudio() then
			_cancelprompt:FireClient(Player, "already_owned");
			return;
		end;
		if toggle then
			if _vipplayer[Player.UserId] == true then
				_giftwrap[Player.UserId] = true;
			else
				Player:Kick("detected exploit");
			end;
		end;
		if _pending[Player.UserId] == true then
			return;
		end
		local _info = nil;
		if arg1.Parent:GetAttribute("AssetType") == "Shirt" or arg1.Parent:GetAttribute("AssetType") == "Pants" or arg1.Parent:GetAttribute("AssetType") == "T-Shirt" then
			_info = _marketplaceservice:GetProductInfo(AssetId, Enum.InfoType.Asset);
			if _marketplaceservice:PlayerOwnsAsset(Player, AssetId) then
				print("// asset owned");
				_owneddonation[Player.UserId]['Assets'] = _owneddonation[Player.UserId]['Assets'] or {}
				table.insert(_owneddonation[Player.UserId]['Assets'], AssetId);
				_marketplaceservice:PromptPurchase(Player, AssetId);
				task.wait(0.5);
				_cancelprompt:FireClient(Player, 'already_owned');
				return;
			else
				print("// asset purchase");
				_verifiedprice[Player.UserId] = {['AssetPrice'] = AssetPrice, ['GamepassPrice'] = _info.PriceInRobux};
				_datastoreservice:GetDataStore("VerifiedPrice"):SetAsync(Player.UserId, _verifiedprice[Player.UserId]);
				if AssetPrice ~= _info.PriceInRobux then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif AssetPrice ~= _verifiedprice[Player.UserId]['GamepassPrice'] then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif AssetPrice ~= _verifiedprice[Player.UserId]['AssetPrice']  then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif not _ownedassetbyapi(AssetId, AssetPrice) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				_marketplaceservice:PromptPurchase(Player, AssetId);
			end;
		else
			_info = _marketplaceservice:GetProductInfo(AssetId, Enum.InfoType.GamePass)
			if _marketplaceservice:UserOwnsGamePassAsync(Player.UserId, AssetId) then
				print("// gamepass owned");
				_owneddonation[Player.UserId]['Gamepasses'] = _owneddonation[Player.UserId]['Gamepasses'] or {}
				table.insert(_owneddonation[Player.UserId]['Gamepasses'], AssetId);
				_marketplaceservice:PromptGamePassPurchase(Player, AssetId);
				task.wait(0.5);
				_cancelprompt:FireClient(Player, 'already_owned');
				return;
			else
				_verifiedprice[Player.UserId] = {['AssetPrice'] = AssetPrice, ['GamepassPrice'] = _info.PriceInRobux};
				_datastoreservice:GetDataStore("VerifiedPrice"):SetAsync(Player.UserId, _verifiedprice[Player.UserId]);
				print("// gamepass purchase");
				if AssetPrice ~= _info.PriceInRobux then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif AssetPrice ~= _verifiedprice[Player.UserId]['GamepassPrice'] then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif AssetPrice ~= _verifiedprice[Player.UserId]['AssetPrice']  then
					task.wait(0.5);
					_cancelprompt:FireClient(Player, 'price_changed');
					return;
				elseif not _ownedgamepassbyapi(AssetId, AssetPrice) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				_marketplaceservice:PromptGamePassPurchase(Player, AssetId);
			end;
		end;
		print("// double check");
		_currentdonation[Player.UserId][AssetId] = {
			Target = Target,
			AssetId = AssetId,
			AssetPrice = AssetPrice,
			AssetName = AssetName,
			AssetImage = AssetImage,
			IsOffline = IsOffline,
			GamepassPrice = _verifiedprice[Player.UserId]['GamepassPrice'],
			Message = Message
		};
		_pending[Player.UserId] = true;
		_lastgamepassclicked:SetAsync(Player.UserId, _currentdonation[Player.UserId][AssetId]);
		print(_currentdonation[Player.UserId][AssetId]);
	end);
end;
_players.PlayerAdded:Connect(function(arg1)
	_currentdonation[arg1.UserId] = _lastgamepassclicked:GetAsync(arg1.UserId) or {};
	_verifiedprice[arg1.UserId] = _datastoreservice:GetDataStore("VerifiedPrice"):GetAsync(arg1.UserId) or {};
	_pending[arg1.UserId] = false;
	print(_verifiedprice[arg1.UserId]);
	print(_currentdonation[arg1.UserId])
	local _success, _data = pcall(function()
		return _owneddonationsdata:GetAsync(arg1.UserId);
	end);
	if _success and _data then
		_owneddonation[arg1.UserId] = _data;
	else
		_owneddonation[arg1.UserId] = {Assets = {}, Gamepasses = {}};
	end;
	for i = #(_owneddonation[arg1.UserId]['Assets'] or {}), 1, -1 do
		local assetId = _owneddonation[arg1.UserId]['Assets'][i];
		if not _marketplaceservice:PlayerOwnsAsset(arg1, assetId) then
			table.remove(_owneddonation[arg1.UserId]['Assets'], i);
		end;
	end;
	for i = #(_owneddonation[arg1.UserId]['Gamepasses'] or {}), 1, -1 do
		local assetId = _owneddonation[arg1.UserId]['Gamepasses'][i];
		if not _marketplaceservice:UserOwnsGamePassAsync(arg1.UserId, assetId) then
			table.remove(_owneddonation[arg1.UserId]['Gamepasses'], i);
		end;
	end;
	print(_owneddonation[arg1.UserId]);
end);
_players.PlayerRemoving:Connect(function(arg1)
	local _succed, _error = pcall(function()
		_owneddonationsdata:SetAsync(arg1.UserId, _owneddonation[arg1.UserId]);
	end);
	if not _succed then
		warn(("failed %*"):format(arg1.Name));
	end;
	_saveAllPlayerStats(arg1);
	_currentdonation[arg1.UserId] = nil;
	_owneddonation[arg1.UserId] = nil;
end);
_marketplaceservice.PromptGamePassPurchaseFinished:Connect(function(arg1, arg2, arg3)
	if arg3 then
		if _currentdonation[arg1.UserId] and _currentdonation[arg1.UserId][arg2] then
			local _productdata = _marketplaceservice:GetProductInfo(arg2, Enum.InfoType.GamePass);
			if _currentdonation[arg1.UserId][arg2]['AssetPrice'] ~= _productdata.PriceInRobux then
				return;
			end;
			if not _verifiedprice[arg1.UserId] then
				print('ue')
				return;
			end;
			if _productdata.PriceInRobux ~= _currentdonation[arg1.UserId][arg2]['AssetPrice'] then
				return;
			end;
			if table.find(_owneddonation[arg1.UserId]['Gamepasses'], arg2) then
				return;
			end;
			if not( _verifiedprice[arg1.UserId]['GamepassPrice'] == _productdata.PriceInRobux) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _currentdonation[arg1.UserId][arg2]['GamepassPrice']) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _productdata.PriceInRobux) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			if not(_verifiedprice[arg1.UserId]['AssetPrice'] ==  _verifiedprice[arg1.UserId]['GamepassPrice']) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			if not _ownedgamepassbyapi(arg2, _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
				task.wait(0.5);
				_cancelprompt:FireClient(arg1, 'price_changed');
				return;
			end;
			local _haspurchased = false
			if arg1:GetAttribute("Purchasing") ~= false then
				if not _productdata then
					print("[Prompts/ProcessPurchase] Caught error while purchasing: ", _productdata)
				end
				if not (_currentdonation[arg1.UserId][arg2]['AssetPrice'] == _productdata.PriceInRobux) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if not (_productdata.PriceInRobux == _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if not (_currentdonation[arg1.UserId][arg2]['GamepassPrice'] == _productdata.PriceInRobux) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if _productdata.Creator.CreatorTargetId == arg1.UserId then
					return;
				end;
				if _marketplaceservice:UserOwnsGamePassAsync(arg1.UserId, arg2) then
					table.insert(_owneddonation[arg1.UserId]['Gamepasses'], arg2);
				else
					return;
				end;
				if _verifiedprice[arg1.UserId]['AssetPrice'] > 1000000 then
					print("ok")
				end;
				task.spawn(function()
					_pending[arg1.UserId] = false;
					_purchasedasset(arg1, _currentdonation[arg1.UserId][arg2], _verifiedprice[arg1.UserId]['GamepassPrice']);
				end)
			end;
		end;
	else
		_pending[arg1.UserId] = false;
	end;
end);
_marketplaceservice.PromptPurchaseFinished:Connect(function(arg1, arg2, arg3)
	if arg3 then
		if _currentdonation[arg1.UserId] and _currentdonation[arg1.UserId][arg2] then
			local _productdata = _marketplaceservice:GetProductInfo(arg2, Enum.InfoType.Asset);
			if _currentdonation[arg1.UserId][arg2]['AssetPrice'] ~= _productdata.PriceInRobux then
				return;
			end;
			if not _verifiedprice[arg1.UserId] then
				print('ue')
				return;
			end;
			if _productdata.PriceInRobux ~= _currentdonation[arg1.UserId][arg2]['AssetPrice'] then
				return;
			end;
			if table.find(_owneddonation[arg1.UserId]['Assets'], arg2) then
				return;
			end;
			local _haspurchased = false
			if arg1:GetAttribute("Purchasing") ~= false then
				if not _productdata then
					print("[Prompts/ProcessPurchase] Caught error while purchasing: ", _productdata)
				end
				if not (_currentdonation[arg1.UserId][arg2]['AssetPrice'] == _productdata.PriceInRobux) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if not (_productdata.PriceInRobux == _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if not (_currentdonation[arg1.UserId][arg2]['GamepassPrice'] == _productdata.PriceInRobux) then
					_cancelprompt:FireClient(arg1, "price_changed")
					return;
				end;
				if not( _verifiedprice[arg1.UserId]['GamepassPrice'] == _productdata.PriceInRobux) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _currentdonation[arg1.UserId][arg2]['GamepassPrice']) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if not(_verifiedprice[arg1.UserId]['AssetPrice']  == _productdata.PriceInRobux) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if not(_verifiedprice[arg1.UserId]['AssetPrice'] ==  _verifiedprice[arg1.UserId]['GamepassPrice']) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if not _ownedassetbyapi(arg2, _currentdonation[arg1.UserId][arg2]['AssetPrice']) then
					task.wait(0.5);
					_cancelprompt:FireClient(arg1, 'price_changed');
					return;
				end;
				if _productdata.Creator.CreatorTargetId == arg1.UserId then
					return;
				end;
				if _marketplaceservice:PlayerOwnsAsset(arg1, arg2) then
					table.insert(_owneddonation[arg1.UserId]['Assets'], arg2);
				else
					return;
				end;
				if _verifiedprice[arg1.UserId]['AssetPrice'] > 1000000 then
					print("ok")
				end;
				task.spawn(function()
					_pending[arg1.UserId] = false;
					_purchasedasset(arg1, _currentdonation[arg1.UserId][arg2], _verifiedprice[arg1.UserId]['GamepassPrice']);
				end)
			end;
		end;
	else
		_pending[arg1.UserId] = false;
	end;
end);
_remotes.Function("DonationHistory").OnServerInvoke = function(arg1, arg2)
	local _translmao = {};
	_translmao = _donationhistory:GetAsync(arg1.UserId) or print('imagine noob🙏🏿🙏🏿') or {};
	local _filteredtrans = {};
	for _indexiwillneverusexd, _trans in ipairs(_translmao) do
		local _startincase = arg2.dtime.start;
		local _endincase = arg2.dtime['end']; -- why can't i do dtime.end 🥺
		if arg2.dtime == ("AllTime") or (type(_startincase) == ("number") and type(_endincase) == ("number") and 
			_trans.whenDonated.UnixTimestamp >= _startincase and _trans.whenDonated.UnixTimestamp <= _endincase) then
			if arg2.dtype == ("Donated") and _trans.donatorUserId == arg1.UserId then
				table.insert(_filteredtrans, _trans);
			elseif arg2.dtype == ("Received") and _trans.boothOwnerUserId == arg1.UserId then
				table.insert(_filteredtrans, _trans);
			elseif arg2.dtype == ("All") then
				table.insert(_filteredtrans, _trans);
			end;
		end;
	end;
	if arg2.order == ("Newest") then
		table.sort(_filteredtrans, function(arg1, arg2)
			return arg1.whenDonated.UnixTimestamp > arg2.whenDonated.UnixTimestamp;
		end);
	elseif arg2.order == ("Oldest") then
		table.sort(_filteredtrans, function(arg1, arg2)
			return arg1.whenDonated.UnixTimestamp < arg2.whenDonated.UnixTimestamp;
		end);
	elseif arg2.order == ("Price") then
		table.sort(_filteredtrans, function(arg1, arg2)
			return arg1.donatedRobux > arg2.donatedRobux;
		end);
	end;
	local _perpage = 10;
	local _info = {
		['perpage'] = 100;
		['total'] = #_filteredtrans;
		['pages'] = math.ceil(#_filteredtrans / _perpage);
		['page'] = arg2.page;
	};
	local _start = (_info.page) * _info.perpage + 1;
	local _end = math.min(_start + _info.perpage - 1, _info.total);
	local _pagestable = {};
	for _skibidiallpages = _start, _end do
		table.insert(_pagestable, _filteredtrans[_skibidiallpages]);
	end;
	return _pagestable;
end;
_remotes.Function("DonationHistoryTimes").OnServerInvoke = function(player)
	local _currenttime = os.time();
	return {
		{['id'] = "AllTime", ['name'] = "All Time"};
	};
end
_remotes.Function("GetOurTopDonated").OnServerInvoke = function(arg1)
	local _data = _datastoreservice:GetOrderedDataStore(arg1.UserId.. "SavedDonationsV3");
	local _stored = _data:GetSortedAsync(false, 100, 1, 10e15);
	local _page = _stored:GetCurrentPage();
	local _table = {};
	for Rank, Data in ipairs(_page) do
		rawset(_table, Rank, {
			['userId'] = tonumber(Data.key),
			['robux'] = Data.value,
		});
	end;
	return _table;
end;

-- << Events > --

_remotes.Function("UnclaimedDonations").OnServerInvoke = function(arg1, arg2)
	local _giftdata = _giftstable[arg1.UserId];
	if _giftdata == nil then
		_giftdata = {};
	end;
	local _giftsstored = {};
	for _, _properties in pairs(_giftdata) do
		if not _properties.message then
			_properties.message = ("");
		end;
		table.insert(_giftsstored, {
			['donatorUserId'] = _properties.donatorUserId,
			['message'] = _properties.message;
			['donatedRobux'] = _properties.donatedRobux;
			['whenDonated'] = DateTime.fromUnixTimestamp(_properties.whenDonated);
		});
	end;
	if _giftdata == nil then
		return {};
	else
		if arg2 == ('Robux') then
			table.sort(_giftsstored, function(a, b)
				return a.donatedRobux > b.donatedRobux;
			end);
		end;
		print(_giftsstored);
		return _giftsstored, _giftsstored, #_giftsstored;
	end;
end;
_remotes.Function("UnclaimedDonationCount").OnServerInvoke = function(arg1, arg2)
	local _giftsdata = _datastoreservice:GetDataStore(arg1.UserId.. "PlayerGifts1");
	local _giftdata = _giftsdata:GetAsync('_Gifts_');
	if _giftdata == nil then
		_giftdata = {};
	end;
	local _count = 0;
	for _, _ in pairs(_giftdata) do
		_count += 1;
	end;
	rawset(_giftstable, arg1.UserId, _giftdata);
	return _count;
end;
_remotes.Function("CheckWasFiltered").OnServerInvoke = function(p1, p2)
	return _isfiltered(p2, p1.UserId) --_filtertext(p2, p1.UserId);
end;
local _targetraised = {};
_messagingservice:SubscribeAsync("GiftingGlobal", function(arg1)
	local _data = arg1.Data;
	local _reciever = game.Players:GetPlayerByUserId(_data['target']);
	local _donator = game.Players:GetPlayerByUserId(_data['Donator'].UserId);
	local _message = '';
	local _price = 1;
	if _giftwrap[_data['Donator'].UserId] == true then
		_message = _data['msg'].."nJHGnbjsda43";
		_price = _questionsmarks(tonumber(_data['price']));
	else
		_message = _data['msg'];
		_price = _data['price'];
	end;
	_makelog(_data['Donator'].UserId, _data['Donator'].UserId, _data['target'], _data['price'], true);
	_makelog(_data['target'], _data['Donator'].UserId, _data['target'], _data['price'], true);
	if _reciever then
		print('// reciever in server donation');
		_reciever:SetAttribute("GiftBuxs", _reciever:GetAttribute("GiftBuxs") + _pricegiftbux(_data['price']));
		_reciever:SetAttribute("RaisedNumber", _reciever:GetAttribute("RaisedNumber") + _data['price']);
		_giftrecieve:FireClient(_reciever, {robux = _price, username = _data['Donator'].Name});
		_raisedata:SetAsync(_data['target'], _reciever:GetAttribute("RaisedNumber"));
		_addgift(_data['target'], _data['Donator'], tonumber(_data['price']), tostring(_message));
	else
		print('// offline donation');
		_raisedata:SetAsync(_data['target'], _raisedata:GetAsync(_data['target']) + _data['price']);
		_addgift(_data['target'], _data['Donator'], tonumber(_data['price']), tostring(_message));
	end;
	spawn(function()
		if _donator then
			print('// donator stats');
			_donator:SetAttribute("DonatedNumber", _donator:GetAttribute("DonatedNumber") + _data['price']);
			_donator:SetAttribute("GiftBuxs", _donator:GetAttribute("GiftBuxs") + _pricegiftbux(_data['price']));
			_donatedata:SetAsync(_donator.UserId, _donator:GetAttribute("DonatedNumber"));
		end;
	end);
end);
local _dataservice = require(_serverscriptservice.Modules.Data);
_remotes.Function("OfflinePlayerLookup").OnServerInvoke = function(p1, p2)
	if _replicatedstorge.OfflineBooths:FindFirstChild(string.format('%sGiftBooth', p1.UserId)) then
		_replicatedstorge.OfflineBooths[string.format('%sGiftBooth', p1.UserId)]:Destroy()
	end;
	local _raisedd = _raisedata:GetAsync(p2) or 0;
	_targetraised[p1.UserId] = _raisedd;
	local _targetedbooth = _dataservice:GetCurrentBooth(p2) or "BasicBooth"
	if not _serverstorage.BoothModels:FindFirstChild(_targetedbooth) then
		_targetedbooth = 'BasicBooth'
	end;
	local _datacustomization = _customizationdata(p2) or {}
	local _model = _serverstorage.BoothModels[_targetedbooth]:Clone()
	_model.Name = string.format('%sGiftBooth', p1.UserId)
	local _boothui = script:WaitForChild('BoothUI'):Clone()
	_boothui.Sign.TextLabel.Text = tostring(_datacustomization.text);
	_boothui.Sign.TextLabel.TextColor3 = _datacustomization.textColor
	_boothui.Sign.TextLabel.Font = _datacustomization.textFont
	_boothui.Sign.TextLabel.TextStrokeColor3 = _datacustomization.strokeColor
	_model.Parent = _replicatedstorge.OfflineBooths
	_boothui.Parent = _model
	_boothui.Details.Raised.Visible = true
	_boothui.Details.Raised.Text = string.format('\238\128\130%s raised', _numbershelper.formatCommas(_raisedd))
	if _targetedbooth == "ElevatorBooth" then
		_boothui.Details.Adornee = _model.Elevator:WaitForChild('Base')
		_boothui.Items.Adornee = _model.Elevator:WaitForChild('ItemsPart')
		_boothui.Sign.Adornee = _model.Elevator:WaitForChild('SignPart')
	elseif _targetedbooth == "CraneBooth" then
		_boothui.Details.Adornee = _model.ControlRoom:WaitForChild('Base')
		_boothui.Items.Adornee = _model.Sign:WaitForChild('ItemsPart')
		_boothui.Sign.Adornee = _model.Sign:WaitForChild('SignPart')
	else
		_boothui.Details.Adornee = _model:WaitForChild('Base')
		_boothui.Items.Adornee = _model:WaitForChild('ItemsPart')
		_boothui.Sign.Adornee = _model:WaitForChild('SignPart')
	end
	_boothui.Details.Owner.Text = string.format("%s's Stand", _getuserinfo(p2).DisplayName)
	_model:SetAttribute('Raised', _raisedd)
	local _savedcolors = {};
	local _succed, _data = pcall(function()
		return _boothcolorsdatastore:GetAsync(p2)
	end)
	local _boothmodel = _model;
	if _succed and _data then
		local _boothcolors = _data[_targetedbooth];
		if _boothcolors then
			_savedcolors = _boothcolors;
		end;
	end;
	if _boothmodel then
		for _, _parts in pairs(_boothmodel:GetDescendants()) do
			if _parts:IsA("BasePart") and _parts:GetAttribute("ColorId") then
				local _colorId = _parts:GetAttribute("ColorId");
				if _savedcolors[_colorId] then
					_parts.Color = Color3.fromHex(_savedcolors[_colorId]);
				end;
			end;
		end;
	else
		print('e');
	end;
	_items:LoadPlayerItemsOnBooth({UserId = p2, Name = _getuserinfo(p2).Username}, _boothui.Items.Frame, _datacustomization, true);
	return _model;
end;
-- testing fireonit
--_addgift(7619069605, {UserId = 5502332040, Name = 'IlIIllIIlIlIlIIII', DisplayName = 'hazem'}, 345534534, 'A Gift From quataunnJHGnbjsda43');

--_addgift(7619069605, {UserId = 5502332040, Name = 'IlIIllIIlIlIlIIII', DisplayName = 'hazem'}, 345534534, 'A Gift From quataunnJHGnbjsda43');
for _, _event in pairs(_collectionservice:GetTagged("PromptEvent")) do
	_promptevent(_event);
end;
_collectionservice:GetInstanceAddedSignal('PromptEvent'):Connect(_promptevent);
_players.PlayerRemoving:Connect(function(arg1)
	print('left')
	if _targetraised[arg1.UserId] then
		_targetraised[arg1.UserId] = nil;
	end;
	if _pending[arg1.UserId] then
		_pending[arg1.UserId] = nil;
	end;
	if _giftstable[arg1.UserId] then
		print('found');
		print(_giftstable[arg1.UserId]);
		local _giftsdata = _datastoreservice:GetDataStore(arg1.UserId.. "PlayerGifts1");
		local _succed, _error = pcall(function()
			_giftsdata:SetAsync('_Gifts_', _giftstable[arg1.UserId]);
		end);
		if not _succed then
			warn(("gifting error @%* | %*"):format(arg1.Name, _error));
		end;
	end;
end);
_collectionservice:GetInstanceAddedSignal('ClaimDonation'):Connect(function(arg1)
	arg1.OnServerInvoke = function(arg2, arg3)
		local _layoutforgift = table.unpack(arg3);
		print(_layoutforgift);
		if _giftstable[arg2.UserId] == nil then
			_giftstable[arg2.UserId] = {};
		end;
		table.remove(_giftstable[arg2.UserId], _layoutforgift);
	end;
end);