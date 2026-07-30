local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _marketplaceservice = game:GetService("MarketplaceService");

-- << Modules > -- 

local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));
local _numbershelper = require(_replicatedstorge:WaitForChild('NumberHelpers'))

local _tokyo = game:GetService("DataStoreService"):GetDataStore("TokyoEmote");
local _eagle = game:GetService("DataStoreService"):GetDataStore("EagleEmote");
local _doop = game:GetService("DataStoreService"):GetDataStore("DoopEmote");
local _orange = game:GetService("DataStoreService"):GetDataStore("OrangeEmote");

local _newpurchasedbooth = _remotes.Event('NewPurchasedBooths');

_remotes.Event("InvokeLoginRewards").OnServerEvent:Connect(function(p1)
	return
end);
_remotes.Function("PurchaseEmote").OnServerInvoke = function(arg1, arg2)
	if true then return end
	if arg2 == "eagle" then
		if arg1:GetAttribute("GiftBuxs") < 800 then
			_eagle:SetAsync(arg1.UserId, true);
		end;
	end;
	if arg2 == "doop" then
		if arg1:GetAttribute("GiftBuxs") < 500 then
			_doop:SetAsync(arg1.UserId, true);
		end;
	end;
	if arg2 == "orange" then
		if arg1:GetAttribute("GiftBuxs") < 700 then
			_orange:SetAsync(arg1.UserId, true);
		end;
	end;
	if arg2 == "tokyo" then
		if arg1:GetAttribute("GiftBuxs") < 500 then
			_tokyo:SetAsync(arg1.UserId, true);
		else
			print('sigma')
		end;
	end;
end;

-- Streak

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
function SetStreak(id, days)
	return StreakData:SetAsync(id, {Days = days, LastClaimed = os.time()});
end

game.Players.PlayerAdded:Connect(function(plr)
	spawn(function()	
		local LastRewardData = GetStreak(plr.UserId);
		local CurrentTime = os.time();
		local Streak = LastRewardData.Days;
		local LastOnline = LastRewardData.LastClaimed;
		local TimeDifference;
		if LastOnline then	
			TimeDifference = CurrentTime - LastOnline;
		end;
		if table.find({5502332040, 1, 2, 3}, plr.UserId) then
			return SetStreak(plr.UserId, tonumber("inf"));
		end;
		if not TimeDifference then
			Streak = 0;
			SetStreak(plr.UserId, Streak);
		elseif TimeDifference <= -172800 then
			Streak = 1;
			SetStreak(plr.UserId, Streak);
		elseif TimeDifference >= 24*60*60 then
			Streak += 1;
			SetStreak(plr.UserId, Streak);
		elseif TimeDifference >= -172800 and TimeDifference <= 0 then
			Streak += 1;
			SetStreak(plr.UserId, Streak);
		end;
	end);
	local Players = game:GetService("Players")
	local targetYear = 2025;
	local targetMonth = 3;
	local targetDay = 2; 
	local targetHour = 0;
	local targetMinute = 0 ;
	local targetSecond = 0;
	Players.PlayerAdded:Connect(function(player)
		local now = os.date("!*t");
		if now.year == targetYear and now.month == targetMonth and now.day == targetDay and
			now.hour == targetHour and now.min == targetMinute and now.sec == targetSecond then
			if require(game.ServerScriptService.Modules.Data):IsPlayerOwningBooth(player.UserId, "CraneBooth") then
				return;
			end;
			local _booths = require(game.ServerStorage.Booths);
			local _table = {
				['price'] = _booths.Booths["CraneBooth"].price;
				['name'] = _booths.Booths["CraneBooth"].name;
				['id'] = _booths.Booths["CraneBooth"].name;
				['icon'] = {
					['Image'] = _booths.Booths["CraneBooth"].icon.Image;
					['ImageRectOffset'] = _booths.Booths["CraneBooth"].icon.ImageRectOffset;
					['ImageRectSize'] = _booths.Booths["CraneBooth"].icon.ImageRectSize;
				};
				['hoverIcon'] = {
					['Image'] = _booths.Booths["CraneBooth"].hoverIcon.Image;
					['ImageRectOffset'] = _booths.Booths["CraneBooth"].hoverIcon.ImageRectOffset;
					['ImageRectSize'] = _booths.Booths["CraneBooth"].hoverIcon.ImageRectSize;
				};
			};
			require(game.ServerScriptService.Modules.Data):PurcharseBooth(player.UserId, "CraneBooth");
			_newpurchasedbooth:FireClient(player, _table);
		end
	end);
end);

-- feature soon
_remotes.Event("AdReward").OnServerEvent:Connect(function(player)
	return "";
end);

local groupId = 12121240
function quataunAlert(Player, Message)
	local avatar = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync(string.format('https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds=%s&size=420x420&format=Png&isCircular=false', Player.UserId)))
	print(avatar.data[1].imageUrl)
	local EncodedMessage = game:GetService("HttpService"):JSONEncode({ ['content'] = Message, ['avatar_url'] = avatar.data[1].imageUrl, ['username'] = string.format('@%s', Player.Name) })
	game:GetService("HttpService"):PostAsync('', EncodedMessage)
end
game.Players.PlayerAdded:Connect(function(Player)
	if Player:GetRankInGroup(groupId) > 1 then
		local profileLink = ('https://roblox.com/users/%*/profile'):format(Player.UserId)
		quataunAlert(Player, ('@everyone - A High Rank in Quataun **[@%*](<%*>) (%*)** has joined the game (Role Name: %*, Rank: %*)'):format(Player.Name, profileLink, Player.DisplayName, Player:GetRoleInGroup(groupId), Player:GetRankInGroup(groupId)))
	end
end)
game.Players.PlayerRemoving:Connect(function(Player)
	if Player:GetRankInGroup(groupId) > 1 then
		local profileLink = ('https://roblox.com/users/%*/profile'):format(Player.UserId)
		quataunAlert(Player, ('**[@%*](<%*>) (%*)** has LEFT the game (Role Name: %*, Rank: %*)'):format(Player.Name, profileLink, Player.DisplayName, Player:GetRoleInGroup(groupId), Player:GetRankInGroup(groupId)))
	end
end)