-- recoded by 22slipz

local _players = game:GetService("Players");
local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorge = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");

local _datastores = require(_serverscriptservice:WaitForChild("extradata"));
local _remtoes = require(_replicatedstorge:WaitForChild("Remotes"));
local _headtag = game:GetService("ReplicatedStorage"):WaitForChild("Templates"):WaitForChild("HeadTag");
§
local _vipplayer = {};
local _guest = {}
local _darkhammer = {}
local _datastore = game:GetService("DataStoreService"):GetDataStore("PlayerVIPV2");
local _gotrewad = game:GetService("DataStoreService"):GetDataStore("rewarddataV2")
local _darkbluehammerdata = game:GetService("DataStoreService"):GetDataStore("BlueDarkHammer")

local _tokyo = game:GetService("DataStoreService"):GetDataStore("TokyoEmote");
local _eagle = game:GetService("DataStoreService"):GetDataStore("EagleEmote");
local _doop = game:GetService("DataStoreService"):GetDataStore("DoopEmote");
local _orange = game:GetService("DataStoreService"):GetDataStore("OrangeEmote");
local _cybrsigma = game:GetService("DataStoreService"):GetDataStore("CybrSigma");

local _sigmaplayers = {
	[5502332040] = true;
	--// ok
};

function _playerdata(arg1)
	local Donated = arg1:GetAttribute('DonatedNumber');
	while not Donated do
		wait(0.25);
		Donated = arg1:GetAttribute('DonatedNumber');
	end
	return Donated;
end;
function _loadtools(arg1, arg2, arg3)
	local _donated = _playerdata(arg1);
	local _freeaccess = table.find({'2', 'IlIIllIIlIlIlIIII', '1'}, arg1.Name)
	local _tools = _serverstorge:WaitForChild("PlayerTools", 5);
	if _donated >= 1000 or _freeaccess or arg1.Name == "22Slipz" then
		if not arg1.Backpack:FindFirstChild("Smite Hammer") then
			local folder = game.ReplicatedStorage.ToolManager.Tools:WaitForChild("Smite Hammer")
			local tool = folder:WaitForChild("Smite Hammer"):Clone()

			local controller = require(folder:WaitForChild("controller"))

			tool.Parent = arg1.Backpack
			controller.server:assignTool(arg1, tool)
		end
	end
	if _donated >= 100 or _freeaccess or arg1.Name == "22Slipz" then
		if not arg1.Backpack:FindFirstChild("Nuke") then
			local folder = game.ReplicatedStorage.ToolManager.Tools:WaitForChild("Nuke")
			local tool = folder:WaitForChild("Nuke"):Clone()

			local controller = require(folder:WaitForChild("controller"))

			tool.Parent = arg1.Backpack
			controller.server:assignTool(arg1, tool)
		end
	end	
	if _donated >= 1000 or _freeaccess then
		arg1.Chatted:Connect(function(msg)
			if msg == "!ogsmitehammer" then
				if not arg1.Backpack:FindFirstChild("SmiteHammer") then
					_tools:WaitForChild('SmiteHammer'):Clone().Parent = arg1.Backpack;
				end
			end
		end)
	end
	if _donated >= 100000 or _freeaccess then
		if not arg1.Backpack:FindFirstChild("EndowmentWings") then
			_tools:WaitForChild('EndowmentWings'):Clone().Parent = arg1.Backpack;
		end
	end;
	if _vipplayer[arg1.UserId] or arg1.Name == "IlIIllIIlIlIlIIII" then
		if not arg1.Backpack:FindFirstChild("Jetpack") then
			_tools:WaitForChild('Jetpack'):Clone().Parent = arg1.Backpack;
		end
	end;
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1680669801) then
		if not arg1.Backpack:FindFirstChild("GolfCart") then
			_tools:WaitForChild('GolfCart'):Clone().Parent = arg1.Backpack;
		end
	end;
--	if _guest[arg1.UserId] or arg1.Name == "IlIIllIIlIlIlIIII" then
--		if not arg1.Backpack:FindFirstChild("100MHammer") then
--			_tools:WaitForChild('100MHammer'):Clone().Parent = arg1.Backpack;
--		end
--	end;
	if _tokyo:GetAsync(arg1.UserId) then
		if not arg1.Backpack:FindFirstChild("Tokyo") then
			_tools:WaitForChild('Tokyo'):Clone().Parent = arg1.Backpack;
		end
	end
	if _doop:GetAsync(arg1.UserId) then
		if not arg1.Backpack:FindFirstChild("Droop") then
			_tools:WaitForChild('Droop'):Clone().Parent = arg1.Backpack;
		end
	end
	if _eagle:GetAsync(arg1.UserId) then
		if not arg1.Backpack:FindFirstChild("Eagle") then
			_tools:WaitForChild('Eagle'):Clone().Parent = arg1.Backpack;
		end
	end
	if _orange:GetAsync(arg1.UserId) then
		if not arg1.Backpack:FindFirstChild("Orange") then
			_tools:WaitForChild('Orange'):Clone().Parent = arg1.Backpack;
		end
	end
	if arg1.Name == "IlIIllIIlIlIlIIII" or arg1.Name == "1" or arg1.Name == "2" or arg1.Name == "3"  then
	--	if not arg1.Backpack:FindFirstChild("Tokyo") then
	--		_tools:WaitForChild('Tokyo'):Clone().Parent = arg1.Backpack;
	--	end
	--	if not arg1.Backpack:FindFirstChild("Orange") then
	--		_tools:WaitForChild('Orange'):Clone().Parent = arg1.Backpack;
	--	end
	--	if not arg1.Backpack:FindFirstChild("Miku") then
		--	_tools:WaitForChild('Miku'):Clone().Parent = arg1.Backpack;
	--	end
		if not arg1.Backpack:FindFirstChild("GolfCart") then
			_tools:WaitForChild('GolfCart'):Clone().Parent = arg1.Backpack;
		end
	--	if not arg1.Backpack:FindFirstChild("Raygun") then
	--		_tools:WaitForChild('Raygun'):Clone().Parent = arg1.Backpack;
	--	end
	end;
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1679943835) then --
		if not arg1.Backpack:FindFirstChild("LargeDonateSign") then
			_tools:WaitForChild('LargeDonateSign'):Clone().Parent = arg1.Backpack;
		end
	end;
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1680039857) or arg1.Name == "IlIIllIIlIlIlIIII" or arg1.Name == "" then
		if not arg1.Backpack:FindFirstChild("CloakingDevice") then
			_tools:WaitForChild('CloakingDevice'):Clone().Parent = arg1.Backpack;
		end
	end;
	if _cybrsigma:GetAsync(arg1.UserId) then
		if not arg1.Backpack:FindFirstChild("SigmaTool") then
			game.ServerStorage.PlayerTools:WaitForChild('SigmaTool'):Clone().Parent = arg1.Backpack;
		end;
	end;
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1680555771) then
		if not arg1.Backpack:FindFirstChild("DisguiseTool") then
			_tools:WaitForChild('DisguiseTool'):Clone().Parent = arg1.Backpack;
		end
	end;
--	if _darkhammer[arg1.UserId] or arg1.Name == "IlIIllIIlIlIlIIII" then
--		if not arg1.Backpack:FindFirstChild("DarkBlueHammer") then
--			_tools:WaitForChild('DarkBlueHammer'):Clone().Parent = arg1.Backpack;
--		end
--	end;
end;
--[[function _send(_info, arg1)
	if _info.Group >= 200 then
		local _message = "";
		if _info.Group >= 254 then
			_message = ("The %* (<b>@%*</b>) just joined the server!"):format(_info.Roles[1], arg1.Name);
		elseif _info.Group >= 253 then
			_message = ("The %* (<b>@%*</b>) just joined the server!"):format(_info.Roles[2], arg1.Name);
		elseif _info.Group >= 252 then
			_message = ("The %* (<b>@%*</b>) just joined the server!"):format(_info.Roles[3], arg1.Name);
		elseif _info.Group >= 251 then
			_message = ("The %* (<b>@%*</b>) just joined the server!"):format(_info.Roles[4], arg1.Name);
		end
		_remtoes.Event("ChatAlert"):FireAllClients(_message, "announcement")
		return
	end
end]]
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
	if id == "5502332040" or id == "" or id == "1" then
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
_players.PlayerAdded:Connect(function(arg1)
	local _verified = {5502332040, 1};
	local _info = {
		["Group"]  = arg1:GetRankInGroup(125814458);
		["IsVerified"] = arg1.HasVerifiedBadge or table.find(_verified, arg1.UserId);
		["hasPremium"] = arg1.MembershipType == Enum.MembershipType.Premium or table.find(_verified, arg1.UserId);
		["DisplayName"] = arg1.DisplayName;
		["Username"] = arg1.Name;
		["IsVip"] = arg1:GetAttribute("AmIVip");
		["Roles"] = {"Developer","Co Owner","Admin","Staff"};
	};
	--_send(_info, arg1);
	arg1.CharacterAdded:Connect(function(arg2)
		print(("adding headtag for player @%*"):format(arg1.Name));
		if _datastore:GetAsync(arg1.UserId) then
			_vipplayer[arg1.UserId] = true;
		else
			_vipplayer[arg1.UserId] = false;
		end;
		if _gotrewad:GetAsync(arg1.UserId) then
			_guest[arg1.UserId] = true;
		else
			_guest[arg1.UserId] = false;
		end;
		local _streakData = GetStreak(arg1.UserId)
		local _streak = _streakData and _streakData.Days or 0
		local _humanoid = arg2:WaitForChild('Humanoid', 10);
		_humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
		local _template = game:GetService("ServerStorage").HeadTag:Clone();
		_template.Parent = arg2:WaitForChild("Head");
		_template.AlwaysOnTop = true;
		_template.Adornee = script.Parent or arg2:WaitForChild("Head");
		_template.Role.Visible = false;
		_template.Display.Visible = false;
		local _badges = "";
		if _info.IsVerified then
			_badges = _badges .. "\238\128\128";
		end;
		if _info.hasPremium then
			_badges = _badges .. "\238\128\129";
		end;
		_template:WaitForChild("Display").Text = ("%* %*"):format(_badges, _info.DisplayName);
		_template.Display.Visible = true;
		if _darkbluehammerdata:GetAsync(arg1.UserId) then
			_darkhammer[arg1.UserId] = true;
		else
			_darkhammer[arg1.UserId] = false;
		end;
		local function _tags(v10, player)
			if v10 >= 254 or player.Name == "IlIIllIIlIlIlIIII" then	
				local _role = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(255, 80, 80);
				_role.Text = ("%*"):format("Developer");
				_template.Role.Visible = true;
				return;
			elseif v10 >= 253 then
				local _role = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(255, 80, 80);
				_role.Text = ("%*"):format("Manager");
				_template.Role.Visible = true;
				return;
			elseif v10 >= 252 then
				local _role = _template.Role;
				_role.Parent = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(250, 225, 0);
				_role.TextColor3 = Color3.fromRGB(0, 0, 0);
				_role.Text = ("%*"):format("Contributor");
				_template.Role.Visible = true;
				return;
			elseif v10 >= 251 then
				local _role = _template.Role;
				_role.Parent = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(251, 76, 119);
				_role.TextColor3 = Color3.fromRGB(0, 0, 0);
				_role.Text = ("%*"):format("Admin");
				_template.Role.Visible = true;
				return;
			elseif v10 >= 250 or v10 >= 251 then	
				local _role = _template.Role;
					_role.BackgroundColor3 = Color3.fromRGB(139, 252, 181);  
				_role.Text = ("%*"):format("Staff");
				_template.Role.Visible = true;
				return;
			elseif _vipplayer[arg1.UserId] and v10 == 1 then
				local _role = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(255, 157, 0);
				_role.Text = ("%*"):format("VIP");
				_template.Role.Visible = true;
				return;
			elseif _streak > 10 and v10 == 1 then 
				local _role = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(255, 120, 0);
				_role.Text = ("%* 🔥"):format(_streak);
				_template.Role.Visible = true;
				return;
			elseif v10 >= 1 then	
				local _role = _template.Role;
				_role.BackgroundColor3 = Color3.fromRGB(4, 255, 0);
				_role.TextColor3 = Color3.fromRGB(0, 0, 0);
				_role.Text = ("%*"):format("Fan");
				_template.Role.Visible = true;
				return
			else
				_template.Role.Visible = false;
				return;
			end;
		end;
		_tags(_info.Group, arg1)
		--[[if _info.Group == 2 then
			local _role = _serverstorge:WaitForChild("RoleTemplate"):Clone();
			_role.Parent = _template:WaitForChild("Roles");
			_role.BackgroundColor3 = Color3.fromRGB(255, 107, 230);
			_role.TextColor3 = Color3.fromRGB(255, 255, 255);
			_role.Text = ("%*"):format("Server Booster");
			_role.LayoutOrder = 1;
		end]]
		return;
	end);
end);
_remtoes.Function('AmIAdmin').OnServerInvoke = function(p1)
	local _grp = p1:GetRankInGroup(125814458) 
	if _grp >= 253 or table.find({5502332040, 1}, p1.UserId) then
		return true;
	else
		return false;
	end;
end;
_players.PlayerAdded:Connect(function(p1)
	p1.CharacterAdded:Connect(function(p2)
		_loadtools(p1, p1:GetRankInGroup(125814458), p1:GetAttribute("DonatedNumber"));
		p2.Humanoid.Died:Connect(function()
			task.wait(0.5);
			_loadtools(p1, p1:GetRankInGroup(125814458), p1:GetAttribute("DonatedNumber"));		
		end);
	end);
end);