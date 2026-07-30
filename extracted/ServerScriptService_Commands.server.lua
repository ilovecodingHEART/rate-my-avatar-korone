local _players = game:GetService("Players");
local _teleportservice = game:GetService("TeleportService");
local _datastoreservice = game:GetService("DataStoreService");
local _userservice = game:GetService("UserService");
local _statsdata = _datastoreservice:GetDataStore("PlayerStatsV1");
local _donateddata = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardV1");
local _raiseddata = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardV1");
local _characterapp = {};
local _cache = {};
local _info = {
	['group'] = 125814458,
	['prefix'] = "/",
	['permissions'] = {5502332040, };
	['developercommands'] = {5502332040, };
};
function _getuserinfo(arg1)
	local _succed, _result = pcall(function()
		return game:GetService("UserService"):GetUserInfosByUserIdsAsync({arg1});
	end);
	return table.unpack(_result);
end;
function _getcharacter(arg1)
	if _characterapp[arg1] then
		return _characterapp[arg1];
	end;
	local _desc
	local _succed, _erorr = pcall(function()
		_desc = _players:GetHumanoidDescriptionFromUserId(arg1);
	end);
	if not _succed then
		warn(_erorr);
		while not _succed do
			wait(3);
			_succed, _erorr = pcall(function()
				_desc = _players:GetHumanoidDescriptionFromUserId(arg1);
			end);
		end;
	end;
	_characterapp[arg1] = _desc;
	return _desc;
end;
local function _getUserIdFromUsername(arg1)
	if _cache[arg1] then
		return _cache[arg1]
	end;
	local _player = _players:FindFirstChild(arg1)
	if _player then
		_cache[arg1] = _player.UserId;
		return _player.UserId;
	end;
	local arg2;
	local success, err = pcall(function()
		arg2 = _players:GetUserIdFromNameAsync(arg1)
	end);
	if success then
		_cache[arg1] = arg2
		return arg2;
	else
		warn('failed');
		return nil;
	end;
end;
local function _updateDonated(arg1, arg2)
	local _succed, _error = pcall(function()
		local currentDonated = _donateddata:GetAsync(arg1) or 0;
		_donateddata:SetAsync(arg1, currentDonated + arg2);
	end);
	if not _succed then
		warn(_error);
	end;
end;
local function _updateRaised(arg1, arg2)
	local _succed, _error = pcall(function()
		local currentRaised = _raiseddata:GetAsync(arg1) or 0;
		_raiseddata:SetAsync(arg1, currentRaised + arg2);
	end);
	if not _succed then
		warn(_error);
	end;
end;
local function _updateGiftbux(arg1, arg2)
	local _succed, _eror = pcall(function()
		local _stats = _statsdata:GetAsync(arg1) or {};
		_stats.Giftbux = (_stats.Giftbux or 0) + arg2;
		_statsdata:SetAsync(arg1, _stats);
	end);
	if not _succed then
		warn(_eror);
	end;
end;
local function _resetstats(arg1)
	local _succed, _error = pcall(function()
		_raiseddata:SetAsync(arg1, 0);
		_donateddata:SetAsync(arg1, 0);
	end);
	if not _succed then
		warn(_error);
	end;
end;
_players.PlayerAdded:Connect(function(arg1)
	if table.find(_info.permissions, arg1.UserId) or arg1:GetRankInGroup(_info.group) >= 253 then
		arg1.Chatted:Connect(function(arg2)
			local function _howtouse(arg1)
				print(("Right way to use this command is : %*"):format(arg1));
			end;
			if arg2:sub(1, 2) == ("%sb"):format(_info.prefix) then
				local _args = arg2:sub(4):split(" ")
				local _userid = tonumber(_args[1])
				local _days = tonumber(_args[2])
				if _userid and _days then
					if _userid == arg1.UserId then
						print("You cannot ban yourself.")
						return
					end
					local _target = _players:GetPlayerByUserId(_userid)
					_players:BanAsync({
						['UserIds'] = {_userid},
						['Duration'] = (_days * 24 * 60 * 60),
						['DisplayReason'] = ("You have been banned for %s day(s)."):format(_days),
						['PrivateReason'] = ("Banned by admin %s"):format(arg1.Name),
						['ExcludeAltAccounts'] = false,
						['ApplyToUniverse'] = true
					})
					print(string.format("UserId %s has been banned for %s days by %s.", _userid, _days, arg1.Name))
				else
					_howtouse("/ban (UserId) (Time in days)")
				end
			end
			if arg2:sub(1, 2) == ("%sk"):format(_info.prefix) then
				local _args = arg2:sub(4):split(" ");
				local _name = table.concat(_args, " "):gsub("^%s*(.-)%s*$", "%1");
				if _name and _name ~= "" then
					if _name == arg1.Name then
						print("You cannot kick yourself.");
						return;
					end;
					local _player = _players:FindFirstChild(_name);
					if _player then
						_player:Kick("You have been kicked from the game!");
					else
						print("Player not found: " .. _name);
					end;
				else
					_howtouse("/kick (PlayerName)");
				end;
			end;
			if arg2:sub(1, 3) == ("%sunb"):format(_info.prefix) then
				local _args = arg2:sub(5):split(" ")
				local _userid = tonumber(_args[1])
				if _userid == arg1.UserId then
					print("You cannot unban yourself.")
					return
				end
				if _userid then
					_players:UnbanAsync({
						['UserIds'] = {_userid},
						['ApplyToUniverse'] = true
					})
					print(string.format("UserId %s has been unbanned by %s.", _userid, arg1.Name))
				else
					_howtouse("/unb [USERID]")
				end
			end
			if arg2:sub(1, 3) == ("%sbr"):format(_info.prefix) then
				local _args = arg2:sub(5):split(" ")
				local _name = table.concat(_args, " ")
				local _targetPlayer = _players:FindFirstChild(_name)
				if _targetPlayer and _targetPlayer.Character then
					_targetPlayer.Character:MoveTo(arg1.Character:GetPrimaryPartCFrame().Position)
					print(string.format("Bringing player %s to %s.", _name, arg1.Name))
				else
					print("Player not found:", _name)
				end
			end
		
			if arg2:sub(1, 2) == ("%sc"):format(_info.prefix) then
				local _name = arg2:sub(4):gsub("^%s*(.-)%s*$", "%1");
				local _succed = true;
				if _succed then
					local _userid = _getUserIdFromUsername(_name);
					local _character = arg1.Character;
					if _character then
						local _humanoid = _character:FindFirstChild("Humanoid");
						local _head = _character:FindFirstChild("Head");
						if _humanoid and _head then
							local _headtag = _head:FindFirstChild("HeadTag");
							local _preservedTag;
							if _headtag then
								_preservedTag = _headtag:Clone();
							end;
							local _desc = _getcharacter(_userid);
							if _desc then
								_humanoid:ApplyDescription(_desc);
								if _preservedTag then
									local _newHead = _character:FindFirstChild("Head");
									if _newHead then
										_preservedTag.Parent = _newHead;
										_preservedTag.Display.Text = _name
									end;
								end;
								print(arg1.Name .. " has mimicked the appearance of " .. _name);
							else
								print("Failed to retrieve character appearance for " .. _name);
							end;
						else
							print("Humanoid or Head not found for " .. arg1.Name);
						end;
					else
						print("Character not found for " .. arg1.Name);
					end;
				else
					print(arg1.Name .. " is not authorized to use this command.");
				end;
			end;
			if arg2:sub(1, 4) == ("%svip"):format(_info.prefix) then
				local _args = arg2:sub(6):split(" ")
				local _userid = tonumber(_args[1])
				if _userid then
					local _succed, _data = pcall(function()
						return _teleportservice:GetPlayerPlaceInstanceAsync(_userid);
					end);
					if _succed then
						if _data and _data.PlaceId and _data.InstanceId then
							_teleportservice:TeleportToPrivateServer(_data.PlaceId, _data.InstanceId, {arg1})
						else
							print("No valid server found for the UserId:", _userid);
						end;
					else
						print("Error in GetPlayerPlaceInstanceAsync:", _data);
					end;
				else
					_howtouse("/vip [UserId]");
				end;
			end;
		end);
	end;
end);
_players.PlayerAdded:Connect(function(arg1)
	if table.find(_info.developercommands, arg1.UserId) then
		arg1.Chatted:Connect(function(arg2)
			local function _howtouse(arg1)
				print(("Right way to use this command is : %*" ):format(arg1))
			end
			if arg2:sub(1, 8) == ("%sdonated"):format(_info.prefix) then
				print('tested')
				local _args = arg2:sub(10):split(" ")
				local _userid = tonumber(_args[1])
				local _amount = tonumber(_args[2])
				if _userid and _amount then
					_updateDonated(_userid, _amount);
					print(string.format("UserId %s has had their donated amount increased by %s.", _userid, _amount))
				else
					_howtouse("/donated (UserId) (Amount)")
				end
			elseif arg2:sub(1, 7) == ("%sraised"):format(_info.prefix) then
				local _args = arg2:sub(9):split(" ")
				local _userid = tonumber(_args[1])
				local _amount = tonumber(_args[2])
				if _userid and _amount then
					_updateRaised(_userid, _amount);
					print(string.format("UserId %s has had their raised amount increased by %s.", _userid, _amount))
				else
					_howtouse("/raised (UserId) (Amount)")
				end

			elseif arg2:sub(1, 8) == ("%sgiftbux"):format(_info.prefix) then
				local _args = arg2:sub(10):split(" ")
				local _userid = tonumber(_args[1])
				local _amount = tonumber(_args[2])
				if _userid and _amount then
					_updateGiftbux(_userid, _amount)
					print(string.format("UserId %s has had their Giftbux increased by %s.", _userid, _amount))
				else
					_howtouse("/giftbux (UserId) (Amount)")
				end;
			elseif arg2:sub(1, 6) == ("%sreset"):format(_info.prefix) then
				local _args = arg2:sub(8):split(" ")
				local _userid = tonumber(_args[1])
				if _userid then
					_resetstats(_userid)
					print(string.format("Reset stats for user ID: %d", _userid)) -- Fixed format specifier
				else
					_howtouse("/reset (UserId) (Amount)")
				end
			elseif arg2 == ("%*stp"):format(_info.prefix) then
				local _character  = arg1.Character;
				local _humanoid = _character:WaitForChild("HumanoidRootPart");
				_humanoid.CFrame = workspace.Map.SecretIsland.GiftIsland.PrimaryPart.CFrame;
			elseif arg2:sub(1, 3) == ("%sgv"):format(_info.prefix) then
				local _gabs = arg2:sub(5):gsub("^%s*(.-)%s*$", "%1");
				local _plrname, _toolname = _gabs:match("^(%S+)%s+(%S+)$");
				if _plrname and _toolname then
					local _userid = _getUserIdFromUsername(_plrname);
					if _userid then
						local _chrct = _getcharacter(_userid);
						if _chrct then
							local _plr = _players:FindFirstChild(_plrname);
							if _plr and not _plr.Backpack:FindFirstChild(_toolname) then
								local tool = game.ServerStorage.PlayerTools:FindFirstChild(_toolname);
								if tool then
									tool:Clone().Parent = _plr.Backpack;
								else
									warn("i can't find the wings right now, Try again.");
								end;
							else
								warn("Player not found or tool already in backpack")
							end;
						else
							warn("didn't find character");
						end;
					end;
				end;
			end;
		end);
	end;
end);
game.ServerScriptService.GlobalAnnoucement.Event:Connect(function(arg1, arg2, arg3)
	game:GetService('MessagingService'):PublishAsync("GlobalAnnouncement", {
		['message'] = arg1;
		['popuptype'] = "announcement" or arg2;
		['time'] = arg3;
	});
end);
game:GetService('MessagingService'):SubscribeAsync("GlobalAnnouncement", function(arg1)
	local _data = arg1.Data;
	if _data.time > 500 then
		return;
	end;
	require(game.ReplicatedStorage.Remotes).Event("ChatAlert"):FireAllClients(_data.message, _data.popuptype, _data.time);
end);