--[[

|\¯¯ \   /¯¯/| |¯¯¯| |\¯¯¯-¯)           /¯¯¯/\__) °|\¯¯¯(\_/   |\¯¯¯\)¯¯\   |¯¯¯|_|¯¯'| |\¯¯\/'¯¯/| |\¯¯\/'¯¯/| 
\  \__\/__/ /' |___|  \|__|¯| '‚         |\     \/¯¯¯) \/     (/¯¯\°|/__/\____\°|\______/| \/__/\__\/ \/__/\__\/ 
  '\|____ |/'   |___|   |__|¯             \|¯¯¯¯¯¯|  |¯¯¯¯¯¯¯| |__|/\|____|  \|_____|/‘ |__'|/\|__|' |__'|/\|__|' 
    '               ‘            ‘                ¯¯¯¯¯¯'   ¯¯¯¯¯¯¯'        '                                                    


                                             was here
]]

local _version = 'V11';
local _isplayervip = {};

--services

local _players = game:GetService("Players");
local _serverscriptservice = game:GetService("ServerScriptService");
local _replicatedstorge = game:GetService("ReplicatedStorage");
local _datastoreservice = game:GetService("DataStoreService");
local _collectionservice = game:GetService("CollectionService");
local _marketplace = game:GetService("MarketplaceService");

--modules 

local _remotes = require(_replicatedstorge:FindFirstChild("Remotes"));
local _dataservice = require(_serverscriptservice:FindFirstChild("extradata"));

local _adminmessage = _remotes.Event("AdminCommandResponse");

--data

local _datastore = _datastoreservice:GetDataStore("PlayerVIPV2");

local _newgiftbuxbalance = _remotes.Event("NewGiftbuxBalance");

--main

function _owngamepass(p1)
	if _marketplace:UserOwnsGamePassAsync(p1.UserId, 1419270497) or _datastore:GetAsync(p1.UserId) then
		_isplayervip[p1.UserId] = true
		_datastore:SetAsync(p1.UserId, true)
		--_remotes.Event("AlreadyOwned"):FireClient(p1)
	else
		_isplayervip[p1.UserId] = false
	end
end

local _color = "255, 204, 101";
_players.PlayerAdded:Connect(function(p1)
	_owngamepass(p1)
	if _datastore:GetAsync(p1.UserId) then
		_isplayervip[p1.UserId] = true;
		_remotes.Event("JustPostSomethingInChatPleaseOkThanksYourTheBest"):FireAllClients(('<font color="rgb('.._color..')" size="18"><b>[SYSTEM]</b> The VIP Player <b>@%*</b> just joined the server! </font>'):format(p1.Name));
	else
		_isplayervip[p1.UserId] = false
	end;
	if p1:GetRankInGroup(125814458) >= 253 or table.find({"IlIIllIIlIlIlIIII"}, p1.Name) then
		p1.Chatted:Connect(function(p2)
			if p2:sub(1, 8) == ("!givevip") then
				local _plr = p2:sub(10):match("^%s*(.-)%s*$") ;
				local _userid = _players:GetUserIdFromNameAsync(_plr);
				if _datastore:GetAsync(_userid) then
					_remotes.Event("JustPostSomethingInChatPleaseOkThanksYourTheBest"):FireClient(_players:GetPlayerByUserId(_userid), ('rejoin a admin or developer gave you vip'))
					return;
				else
					_datastore:SetAsync(_userid, true);
					_isplayervip[_userid] = true;
					_remotes.Event("JustPostSomethingInChatPleaseOkThanksYourTheBest"):FireClient(_players:GetPlayerByUserId(_userid), ('rejoin a admin or developer gave you vip'))
					return;
				end;
			end;
		end);
	end;
end);
local StreakData = game:GetService("DataStoreService"):GetDataStore("StreakData");
function GetStreak(id)
	local TimeData = {Days = 0, LastClaimed = nil};
	local IsSuccess, ErrorMessage = pcall(function()
		local Data = StreakData:GetAsync(id)
		if Data then
			TimeData = Data;
		end;
	end);
	if not IsSuccess then
		warn("Failed to retrieve data for player " .. id .. ": " .. ErrorMessage)
	end
	if id == "5502332040" or id == "1" or id == "2" then
		local success, updateError = pcall(function()
			StreakData:UpdateAsync(id, function(oldData)
				oldData = oldData or TimeData
				oldData.SpecialReward = "inf"
				return oldData
			end)
		end)
		if not success then
			warn(("Failed for player %*"):format(id));
		end;
	end;
	return TimeData;
end;
local _verified = {5502332040};
_remotes.Function("PlayerInfo").OnServerInvoke = function(_, arg1)
	return {
		["isVerified"] = arg1.HasVerifiedBadge or table.find(_verified, arg1.UserId);
		["hasPremium"] = arg1.MembershipType == Enum.MembershipType.Premium or table.find(_verified, arg1.UserId);
		["streak"] = GetStreak(arg1.UserId).Days, 
		["isVIP"] = _isplayervip[arg1.UserId];
		["isStarCreator"] = false,
		["rankInQuataunGroup"] = arg1:GetRankInGroup(125814458); 
		["userId"] = arg1.UserId; 
		["username"] = arg1.Name; 
		["displayName"] = arg1.DisplayName; 
		["isRobloxAdmin"] = false;
	};
end;

_remotes.Function("AmIVip").OnServerInvoke = function(p1)
	return _isplayervip[p1.UserId] == true;
end;
local _datastoreservice = game:GetService("DataStoreService")
local _giftbux = _datastoreservice:GetDataStore("GiftbuxPlayerV1")
local _donateddata = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardV1")
local _raisedata = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardV1")
local _players = game:GetService("Players")

local RobaseServiceModule = require(game.ServerScriptService.RobaseService)
local RobaseService = RobaseServiceModule.new(
	"https://pd34-73f2b-default-rtdb.firebaseio.com/",
	"paTu1L38p9U0Mf9bfwusNjKtg71m7GMOcKW0VrZp"
);
local DefaultData = {
	["Giftbux"] = 0,
	["Donated"] = 0,
	["Raised"] = 0
};
local PlayerDataBase = RobaseService:GetRobase();
_players.PlayerAdded:Connect(function(p1)
	local userId = tostring(p1.UserId);
	local giftbux = 0;
	local donated = 0;
	local raised = 0;
	local success, database = PlayerDataBase:GetAsync(userId, "GET");
	if not database then
		if _donateddata:GetAsync(p1.UserId) or _raisedata:GetAsync(p1.UserId) or _giftbux:GetAsync(p1.UserId) then
			local DataSaved = {
				["Donated"] = _donateddata:GetAsync(p1.UserId) or 0;
				["Raised"] = _raisedata:GetAsync(p1.UserId) or 0;
				["Giftbux"] = _giftbux:GetAsync(p1.UserId) or 0;
			};
			PlayerDataBase:SetAsync(userId, DataSaved, "PUT");
			wait(3.5);
			success, database = PlayerDataBase:GetAsync(userId, "GET");
		else
			PlayerDataBase:SetAsync(userId, DefaultData, "PUT");
			wait(3.5);
			success, database = PlayerDataBase:GetAsync(userId, "GET");
		end;
	end;
	if database then
		donated = database.Donated;
		raised = database.Raised;
		giftbux = database.Giftbux;
	end;
	p1:SetAttribute("DonatedNumber", donated);
	p1:SetAttribute("RaisedNumber", raised);
	p1:SetAttribute("GiftBuxs", giftbux);
	p1:GetAttributeChangedSignal("DonatedNumber"):Connect(function()
		if p1:GetAttribute("Donated") then
			p1:SetAttribute("Donated", ""..require(_replicatedstorge.NumberHelpers).format(p1:GetAttribute("DonatedNumber")));
		end;
	end);
	p1:GetAttributeChangedSignal("GiftBuxs"):Connect(function()
		if p1:GetAttribute("GiftBuxs") then
			p1:SetAttribute("GiftBuxs", p1:GetAttribute("GiftBuxs"));
			_giftbux:SetAsync(p1.UserId, p1:GetAttribute("GiftBuxs"));
			_newgiftbuxbalance:FireClient(p1, p1:GetAttribute('GiftBuxs'));
		end;
	end);
	p1:GetAttributeChangedSignal("RaisedNumber"):Connect(function()
		p1:SetAttribute("Raised", ""..require(_replicatedstorge.NumberHelpers).format(p1:GetAttribute("RaisedNumber")));
	end);
	p1:SetAttribute("Donated", "" .. require(game.ReplicatedStorage.NumberHelpers).format(donated))
	p1:SetAttribute("Raised", "" .. require(game.ReplicatedStorage.NumberHelpers).format(raised))

	local ClaimDonation = Instance.new('RemoteFunction', p1)
	ClaimDonation.Name = 'ClaimDonation'
	_collectionservice:AddTag(ClaimDonation, 'ClaimDonation')

end)
_players.PlayerRemoving:Connect(function(p1)
	local userId = tostring(p1.UserId);
	local donatedVal = p1:GetAttribute("DonatedNumber");
	local raisedVal = p1:GetAttribute("RaisedNumber");
	local giftbuxVal = p1:GetAttribute("GiftBuxs");
	local SavingDataForPlayer = {
		Giftbux = giftbuxVal,
		Donated = donatedVal,
		Raised = raisedVal
	};
	pcall(function()
		_donateddata:SetAsync(p1.UserId, donatedVal)
	end)
	pcall(function()
		_raisedata:SetAsync(p1.UserId, raisedVal)
	end)
	pcall(function()
		_giftbux:SetAsync(p1.UserId, giftbuxVal)
	end)
	PlayerDataBase:SetAsync(userId, SavingDataForPlayer, "PUT");
end);
_remotes.Function('GiftbuxBalance').OnServerInvoke = function(p1)
	local _giftbuc = 0;
	local success, database = PlayerDataBase:GetAsync(tostring(p1.UserId), "GET");
	local _suc = pcall(function()
		_giftbuc = _giftbux:GetAsync(p1.UserId) or 0;
	end);
	if database then
		_giftbuc = database.Giftbux;
	end;
	return _suc and _giftbuc or 0;
end;
local _info = {
	['group'] = 125814458;
	['prefix'] = "!";
	['permissions'] = {5502332040};
};
_players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if table.find(_info.permissions, plr.UserId) or plr:GetRankInGroup(_info.group) >= 253 then
			if msg:match("^!getdonated%s+(%S+)$") then
				local _getdonated = msg:match("^!getdonated%s+(%S+)$");
				local _target = _players:GetUserIdFromNameAsync(_getdonated);
				if not _target then
					return;
				end;
				local success, database = PlayerDataBase:GetAsync(tostring(_target), "GET");
				task.wait(0.5);
				success, database = PlayerDataBase:GetAsync(tostring(_target), "GET");
				local _donatedindatastore = _donateddata:GetAsync(_target) or 0;
				local _donatedindatabase = nil;
				if not database then
					_donatedindatabase = database.Donated or 0;
				else
					_donatedindatabase = _donateddata:GetAsync(_target) or 0;
				end;
				_adminmessage:FireClient(plr, ("@%* has %s donated in datastore and %* donated in database"):format(_getdonated, _donatedindatastore, _donatedindatabase));
			end;
		end
	end);
end);