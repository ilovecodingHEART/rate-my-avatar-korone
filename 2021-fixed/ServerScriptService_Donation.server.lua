-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x21, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x4
-- no manual fixes needed; paste as-is.
-- ============================================================
-- << Services > -- 

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _marketplaceservice = game:GetService("MarketplaceService");
local _gameepassesservice = game:GetService("GamePassService");
local _httpservice = game:GetService("HttpService");
local _messagingservice = game:GetService("MessagingService");
local _badgeservice = game:GetService("BadgeService");
local _datastoreservice = game:GetService("DataStoreService");

-- << Modules > --

local _numberhelper = require(_replicatedstorge:FindFirstChild("NumberHelpers"));
local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));

-- << Remotes Runs >> --

local _cancelprompt = _remotes.Event("CancelPromptPurchase");
local _giftsent = _remotes.Event('GiftSentAlert');
local _chatalert = _remotes.Event("ChatDonationAlert");
local _newgiftbuxbalance = _remotes.Event("NewGiftbuxBalance");
local _newdonated = _remotes.Event('DonatedChanged');
local _purchaseboothstarted = _remotes.Event("PurchaseBoothStarted");
local _alreadyowned = _remotes.Event("AlreadyOwned");
local _newpurchasedbooth = _remotes.Event('NewPurchasedBooths');
local _notifydonation = _remotes.Event("NotifyDonationParticipants");
local _donationsound = _remotes.Event("PlayDonationSound");
local _anonymoussetremote = _remotes.Event("SetAnonymousLive");

-- << Tables >> -- 

local _anonymous_cache = {};

-- << Datastores >> -- 

local _anonymousdatatoggle = _datastoreservice:GetDataStore("PlayerAnonymousToggleV1");
--local _anonymousdata = _datastoreservice:GetDataStore("PlayerAnonymousToggleV1");
local _anonymousdata = _datastoreservice:GetDataStore("AnonymousNames");

-- << Functions >> -- 

game.Players.PlayerAdded:Connect(function(p)
	_badgeservice:AwardBadge(p.UserId, 3257884827919911)
end)

function _getclaimedbooth(arg1)
	for _, _booth in pairs(_workspace.BoothInteractions:GetChildren()) do
		if _booth:IsA("Part") and _booth:GetAttribute("BoothOwner") == arg1.UserId then
			local _model = _booth:FindFirstChild("BoothModel")
			if _model and _model:IsA("ObjectValue") then
				return _model.Value;
			else
				return false;
			end;
		end;
	end;
end;
function _getboothslot(arg1)
	for _, _booth in pairs(_workspace.BoothInteractions:GetChildren()) do
		if _booth:IsA("Part") and _booth:GetAttribute("BoothOwner") == arg1.UserId then
			return _booth:GetAttribute("BoothSlot")
		end
	end
	return nil;
end;
function _fireworks(arg1, arg2)
	if arg1 == 12 then
		for i = 1, arg1 do
			local X = arg2.Position.X - math.random(-10, -10);
			local Z = arg2.Position.Z + math.random(-10, 10);
			local _firework = _serverstorage.Firework:Clone();
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1);
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new(_firework.Color);
			_firework.EmitPoint.Sparks.Color = ColorSequence.new(_firework.Color);
			_firework.EmitPoint.Stars.Color = ColorSequence.new(_firework.Color);
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.BangSound.PlaybackSpeed = math.random(90, 110) / 100;
			wait(math.random(40, 65) / 110);
			_firework.Parent = workspace;
			_firework.Position = Vector3.new(X, 4, Z);
			_firework.Animate.Disabled = false;
		end;
	end;
	if arg1 == 37 then
		for i = 1, arg1 do
			local X;
			local Y;
			local Z;
			if arg2.Name == "EmitPoint" or arg2.Name == "Base" then
				X = arg2.Position.X - math.random(-10, -10);
				Y = arg2.Position.Y + 5;
				Z = arg2.Position.Z + math.random(-30, 30);
			else
				X = arg2.Position.X - math.random(-10, -10);
				Y = 4;
				Z = arg2.Position.Z + math.random(-10, 10);
			end;
			local _firework = _serverstorage.Firework:Clone();
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1);
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new(_firework.Color);
			_firework.EmitPoint.Sparks.Color = ColorSequence.new(_firework.Color);
			_firework.EmitPoint.Stars.Color = ColorSequence.new(_firework.Color);
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.BangSound.PlaybackSpeed = math.random(90, 110) / 100;
			wait(math.random(30, 50) / 110);
			_firework.Parent = workspace;
			_firework.Position = Vector3.new(X, Y, Z);
			_firework.Animate.Disabled = false;
		end;
	end;
	if arg1 == 55 then
		for i = 1, arg1 do
			local X;
			local Y;
			local Z;
			if arg2.Name == "EmitPoint" or arg2.Name == "Base" then
				X = arg2.Position.X - math.random(-10, -10);
				Y = arg2.Position.Y + 7;
				Z = arg2.Position.Z + math.random(-35, 35);
			else
				X = arg2.Position.X - math.random(-10, -10);
				Y = 4;
				Z = arg2.Position.Z + math.random(-10, 10);
			end;
			local _firework = _serverstorage.Firework:Clone()
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color
			_firework.EmitPoint.Flash.Color = ColorSequence.new(_firework.Color)
			_firework.EmitPoint.Sparks.Color = ColorSequence.new(_firework.Color)
			_firework.EmitPoint.Stars.Color = ColorSequence.new(_firework.Color)
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.BangSound.PlaybackSpeed = math.random(90, 110) / 100
			wait(math.random(30, 42.5) / 110)
			_firework.Parent = workspace;
			_firework.Position = Vector3.new(X, Y, Z);
			_firework.Animate.Disabled = false;
		end;
	end;
	if arg1 == 70 then
		for i = 1, arg1 do
			local X
			local Z
			local Y
			if arg2.Name == "EmitPoint" or arg2.Name == "Base" then
				X = arg2.Position.X - math.random(-10, -10)
				Y = arg2.Position.Y + 20
				Z = arg2.Position.Z + math.random(-40, 40)
			else
				X = arg2.Position.X - math.random(-10, -10)
				Y = 4
				Z = arg2.Position.Z + math.random(-10, 10)
			end
			local _firework = _serverstorage.Firework:Clone()
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color
			_firework.EmitPoint.Flash.Color = ColorSequence.new(_firework.Color)
			_firework.EmitPoint.Sparks.Color = ColorSequence.new(_firework.Color)
			_firework.EmitPoint.Stars.Color = ColorSequence.new(_firework.Color)
			_firework.Color = Color3.fromHSV(math.random(0, 100) / 100, math.random(75, 100) / 100, 1)
			_firework.PointLight.Color = _firework.Color;
			_firework.EmitPoint.Flash.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.EmitPoint.Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, _firework.Color), ColorSequenceKeypoint.new(1, _firework.Color)});
			_firework.BangSound.PlaybackSpeed = math.random(90, 110) / 100
			wait(math.random(27.5, 35) / 110)
			_firework.Parent = workspace;
			_firework.Position = Vector3.new(X, Y, Z);
			_firework.Animate.Disabled = false;
		end;
	end;
end;
local _cooldown = {};
local function _anonymousfun(player, anonymousEnabled)
	_anonymous_cache[player.UserId] = anonymousEnabled
	if anonymousEnabled then
		local success, savedData = pcall(function()
			return _anonymousdata:GetAsync(player.UserId .. "_AnonData")
		end)
		if success and savedData then

		else
			local _anomnames = {"Anonym", "Anonymous", "Anoob", "Anonam", "Anonette", "Anony", "Anomous", "Amigo", "Anonyma", "Anonymice", "Anon user", "Anon", "Anonymoose", "Anonee", "Among", "Athony", "Anonymo"}
			local randomName = _anomnames[math.random(1, #_anomnames)]
			local randomNumber = math.random(100, 9999)

			player:SetAttribute("AnonymousName", randomName)
			player:SetAttribute("AnonymousNumber", randomNumber)
			pcall(function()
				_anonymousdata:SetAsync(player.UserId .. "_AnonData", {Name = randomName, Number = randomNumber, together = randomName.." "..randomNumber});
			end)
		end
		player:SetAttribute("Donated", nil);
	else
		player:SetAttribute("Donated", "" .. _numberhelper.format(player:GetAttribute("DonatedNumber")));
	end;
end;
game.Players.PlayerAdded:Connect(function(player)
	local success, savedState = pcall(function()
		return _anonymousdata:GetAsync(player.UserId .. "_AnonState")
	end)
	local Donated = player:GetAttribute('DonatedNumber');
	while not Donated do
		wait(0.25);
		Donated = player:GetAttribute('DonatedNumber');
	end
	wait(0.5)
	local anonymousEnabled = success and savedState or false
	_anonymousfun(player, anonymousEnabled)
end);
_remotes.Event("SetAnonymousLive").OnServerEvent:Connect(function(player, anonymousEnabled)
	pcall(function()
		_anonymousdata:SetAsync(player.UserId .. "_AnonState", anonymousEnabled)
	end)
	_anonymousfun(player, anonymousEnabled)
end);
local _extra = 0;
local _normal = 0;
function _layout(arg1)
	if arg1 == 'extra' then
		for _index, _children in pairs(workspace.MapUI.LiveDonations.Leaderboard:WaitForChild('Extra'):GetChildren()) do
			if _children:IsA('Frame') then
				_children.LayoutOrder = _children.LayoutOrder - (1); --[[ 2021: was compound assignment ]]
			end
			_extra = _index;
		end
		_extra = _extra + (1); --[[ 2021: was compound assignment ]]
	else
		for _, _children in pairs(workspace.MapUI.LiveDonations.Leaderboard:WaitForChild('Normal'):GetChildren()) do
			if _children:IsA('Frame') then
				_children.LayoutOrder = _children.LayoutOrder + (1); --[[ 2021: was compound assignment ]]
			end;
		end;
		_normal = _normal + (1); --[[ 2021: was compound assignment ]]
	end;
end;
function _getlevel(arg1)
	if arg1 >= 100000 then
		return 7;
	elseif arg1 >= 10000 then
		return 6;
	elseif arg1 >= 1000 then
		return 5;
	elseif arg1 >= 100 then
		return 4;
	elseif arg1 >= 10 then
		return 3;
	elseif arg1 >= 5 then
		return 2;
	elseif arg1 >= 1 then
		return 1;
	end;
end;

_serverscriptservice.DonationFire.Event:Connect(function(arg1, arg2, arg3)
	if arg3 > 100000000 then
		return arg1:Kick("AYO CHECK OUT MY NIKIE SHOES");
	end;
	_notifydonation:FireAllClients(arg1, arg2, arg3)
	local _booth = _getclaimedbooth(arg2)
	local _slot = _getboothslot(arg2)
	local _userid = arg1.UserId;
	local _username = "@" .. tostring(arg1.Name);
	
	--local giftbux = math.floor(arg3 * 0.1)
	
	--local current = arg1:GetAttribute("Giftbux") or 0
	--arg1:SetAttribute("Giftbux", current + giftbux)
	
	--_newgiftbuxbalance:FireClient(arg1, current + giftbux)

	if _booth then
		local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(_slot)) or false;
		local _vfx = _serverstorage.SFXLevels['Level' .. _getlevel(arg3)]:Clone();
		_vfx.Parent = _serverstorage;
		_serverscriptservice.DonationVFX:Fire(_vfx, _booth.Base or arg2.Character.Head, _getlevel(arg3));
		_donationsound:FireAllClients(_getlevel(arg3), _booth.Base);
		game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveCurrency", _booth.Base.Position, arg2.Character, arg3);
		-- Maybe
		--game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveGiftbux", _booth.Base.Position, arg1.Character, arg3);
		--
		_boothui.Details.Raised.Text = string.format('\238\128\130%s raised', _numberhelper.format(arg2:GetAttribute('RaisedNumber')));
		spawn(function()
			if _getlevel(arg3) == 3 then
				_fireworks(math.floor(12), _booth.Base);
			end;
		end);
		spawn(function()
			if _getlevel(arg3) == 4 then
				_fireworks(math.floor(37), _booth.Base);
			end;
		end);
		spawn(function()
			if _getlevel(arg3) == 5 then
				_fireworks(math.floor(55), _booth.Base);
			end;
		end);
		spawn(function()
			if _getlevel(arg3) == 6 then
				_fireworks(math.floor(70), _booth.Base);
			end;
		end);
		spawn(function()
			if _getlevel(arg3) == 7 then
				_fireworks(math.floor(70), _booth.Base);
			end;
		end);
	else
		if arg2 then
			local _vfx = _serverstorage.SFXLevels['Level' .. _getlevel(arg3)]:Clone();
			_vfx.Parent = _serverstorage;
			_serverscriptservice.DonationVFX:Fire(_vfx, arg2.Character.Head, _getlevel(arg3));
			_donationsound:FireAllClients(_getlevel(arg3), arg2.Character.Head);
		end;
	end;
	if _anonymous_cache[arg1.UserId] == true then
		_userid = 1;
		_username = ("%s"):format(_anonymousdata:GetAsync(arg1.UserId .. "_AnonData").together);
	end
	local _yellowname = false;
	if arg1:GetRankInGroup(958418035) >= 253 or arg1.Name == "IlIIllIIlIlIlIIII" then
		_yellowname = true;
	end;
	_badgeservice:AwardBadge(_userid, 1998562342407510)
	_messagingservice:PublishAsync("ReceiveLiveDonation", {
		['Donator'] = {Id = _userid, Username = _username};
		['Raiser'] = {Id = arg2.UserId, Username = "@" .. tostring(arg2.Name)};
		['price'] = arg3;
		['yellow'] = _yellowname;
		['level'] = _getlevel(arg3);
	});
end);
_serverscriptservice.FakeDonationFire.Event:Connect(function(arg1, arg2, arg3)
	_notifydonation:FireAllClients(arg1, arg2, arg3)
	local _booth = _getclaimedbooth(arg2)
	local _userid = arg1.UserId;
	local _username = "@" .. tostring(arg1.Name);
	_chatalert:FireAllClients(arg1.DisplayName, arg2.DisplayName, arg3, '')
	if _booth then
		local _vfx = _serverstorage.SFXLevels['Level' .. _getlevel(arg3)]:Clone();
		_vfx.Parent = _serverstorage;
		_serverscriptservice.DonationVFX:Fire(_vfx, _booth.Base or arg2.Character.Head, _getlevel(arg3));
		_donationsound:FireAllClients(_getlevel(arg3), _booth.Base);
		game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveCurrency", _booth.Base.Position, arg2.Character, arg3);
	else
		print('ok sigma');
	end
	local _yellowname = false;
	if arg1:GetRankInGroup(958418035) >= 253 then
		_yellowname = true;
	end;
	_messagingservice:PublishAsync("ReceiveLiveDonation", {
		['Donator'] = {Id = _userid, Username = _username};
		['Raiser'] = {Id = arg2.UserId, Username = "@" .. tostring(arg2.Name)};
		['price'] = arg3;
		['yellow'] = _yellowname;
		['level'] = _getlevel(arg3);
	});
end)
local _waittime = {
	[7] = 1060,
	[6] = 800,
	[5] = 450,
	[4] = 300,
	[3] = 150,
	[2] = 40,
	[1] = 0,
};
local _levelcolors = {
	[7] = Color3.fromRGB(255, 16, 60),
	[6] = Color3.fromRGB(255, 0, 0),
	[5] = Color3.fromRGB(255, 0, 100),
	[4] = Color3.fromRGB(255, 64, 172),
	[3] = Color3.fromRGB(0, 200, 255),
	[2] = Color3.fromRGB(255, 179, 0),
	[1] = Color3.fromRGB(62, 255, 48),
};
function _awardbadges(id)
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		_badgeservice:AwardBadge(v.UserId, id)
	end
end
function _createglobalframe(arg1, arg2, arg3, arg4, arg5, arg6)
	if arg5 == "extra" then
		local Frame = script.ExtraDonation:Clone()
		local Color = _levelcolors[arg4]
		local WaitTime = _waittime[arg4]
		Frame.LayoutOrder = -arg3
		Frame.Donator.Avatar.Border.Color = Color
		Frame.Donator.Avatar.BackgroundColor3 = Color
		Frame.Donator.Username.Text = arg1.Username  -- skibidi
		Frame.Donator.Avatar.Image = game.Players:GetUserThumbnailAsync(arg1.Id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150"
		Frame.Raiser.Avatar.Border.Color = Color
		Frame.Raiser.Avatar.BackgroundColor3 = Color
		Frame.Raiser.Username.Text = arg2.Username
		Frame.Raiser.Avatar.Image = game.Players:GetUserThumbnailAsync(arg2.Id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		Frame.AmountFrame.Main.Amount.TextColor3 = Color
		Frame.AmountFrame.Main.Amount.Text = "".._numberhelper.format(arg3)
		Frame.Bar.Main.BackgroundColor3 = Color
		Frame.Parent = _workspace.MapUI.LiveDonations.Leaderboard:WaitForChild('Extra');
		local BarTween = game.TweenService:Create(Frame.Bar, TweenInfo.new(WaitTime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, 0,0, 5)
		})
		local raiserName = arg2.Username:gsub("^@", "");
		local donatorName = arg1.Username:gsub("^@", "");
		if donatorName == "IlIIllIIlIlIlIIII"or donatorName == "4" or donatorName == "1232" or donatorName == "5" or donatorName == "6" then
			Frame.Donator.Username.TextColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Donator.Avatar.BackgroundColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Donator.Avatar.Border.Color = Color3.fromRGB(255, 206, 107);
		end;
		if raiserName == "IlIIllIIlIlIlIIII"or raiserName == "3" or raiserName == "1" or raiserName == "5"or raiserName == "65" then
			Frame.Raiser.Username.TextColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Raiser.Avatar.BackgroundColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Raiser.Avatar.Border.Color = Color3.fromRGB(255, 206, 107);
		end;
		BarTween:Play()
		BarTween.Completed:Connect(function()
			game.Debris:AddItem(Frame, 10)
			Frame.LayoutOrder = 1;
			_layout('normal');
			Frame.Parent = _workspace.MapUI.LiveDonations.Leaderboard:WaitForChild('Normal');
		end);
	else
		local Frame = script.ExtraDonation:Clone()
		local Color = _levelcolors[arg4]
		local WaitTime = _waittime[arg4]
		Frame.LayoutOrder = -arg3
		Frame.Donator.Avatar.Border.Color = Color
		Frame.Donator.Avatar.BackgroundColor3 = Color
		Frame.Donator.Username.Text = arg1.Username  -- skibidi
		Frame.Donator.Avatar.Image = game.Players:GetUserThumbnailAsync(arg1.Id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150"
		Frame.Raiser.Avatar.Border.Color = Color
		Frame.Raiser.Avatar.BackgroundColor3 = Color
		Frame.Raiser.Username.Text = arg2.Username
		Frame.Raiser.Avatar.Image = game.Players:GetUserThumbnailAsync(arg2.Id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		Frame.AmountFrame.Main.Amount.TextColor3 = Color
		Frame.AmountFrame.Main.Amount.Text = "".._numberhelper.format(arg3)
		Frame.Bar.Main.BackgroundColor3 = Color
		Frame.Parent = _workspace.MapUI.LiveDonations.Leaderboard:WaitForChild('Normal');
		Frame.Bar.Visible = false;
		local raiserName = arg2.Username:gsub("^@", "");
		local donatorName = arg1.Username:gsub("^@", "");
		if donatorName == "IlIIllIIlIlIlIIII"or donatorName == "1" or donatorName == "2" or donatorName == "4" then
			Frame.Donator.Username.TextColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Donator.Avatar.BackgroundColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Donator.Avatar.Border.Color = Color3.fromRGB(255, 206, 107);
		end;
		if raiserName == "IlIIllIIlIlIlIIII"or raiserName == "1" or raiserName == "3" or raiserName == "4" then
			Frame.Raiser.Username.TextColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Raiser.Avatar.BackgroundColor3 = Color3.fromRGB(255, 206, 107);
			Frame.Raiser.Avatar.Border.Color = Color3.fromRGB(255, 206, 107);
		end;
		game.Debris:AddItem(Frame, 10);
	end;
end;
_messagingservice:SubscribeAsync("ReceiveLiveDonation", function(arg1)
	local _data = arg1.Data;
	local _donator = _data.Donator;
	local _raiser = _data.Raiser;
	local _price = _data.price;
	local _yellow = _data.yellow;
	local _level = _data.level;
	if _price >= 5 then
		_createglobalframe(_donator, _raiser, _price, _getlevel(_price), "extra", _yellow);
		if _price >= 10 then
			_remotes.Event("ChatDonationAlert"):FireAllClients(("%s"):format(_donator.Username), ("%s"):format(_raiser.Username), _price, 'global');
		end;
	else
		_createglobalframe(_donator, _raiser, _price, _getlevel(_price), "", _yellow);
	end;
	local _vfx = _serverstorage.SFXLevels['Level' .. _getlevel(_price)]:Clone();
	_vfx.Parent = _serverstorage;
	_donationsound:FireAllClients(_getlevel(_price), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
	_serverscriptservice.DonationVFX:Fire(_vfx, _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint, _level);
	spawn(function()
		if _getlevel(_price) == 3 then
			_fireworks(math.floor(12), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
		end;
	end);
	spawn(function()
		if _getlevel(_price) == 4 then
			_fireworks(math.floor(37), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
		end;
	end);
	spawn(function()
		if _getlevel(_price) == 5 then
			_fireworks(math.floor(55), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
		end;
	end);
	spawn(function()
		if _getlevel(_price) == 6 then
			_fireworks(math.floor(70), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
		end;
	end);
	spawn(function()
		if _getlevel(_price) == 7 then
			_fireworks(math.floor(70), _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint);
		end;
	end);
	if _price >= 100000 then
		_awardbadges(951061233035427)		
		for _index, _pairs in pairs(game.Players:GetPlayers()) do
			local _starman = game.ServerStorage.WingedEndowmentPlayer:Clone();
			_starman.Parent = _replicatedstorge;
			local _star = game.ServerStorage:WaitForChild("Starfall", 100):Clone();
			_star:SetAttribute("Donator", ("%s"):format(_donator.Username));
			_star:SetAttribute("Raiser", ("%s"):format(_raiser.Username));
			_star:SetAttribute("Amount", _price)
			_star:SetAttribute("DonatorId", _donator.Id)
			_star.Parent = _pairs.PlayerGui.ScreenGui
		end
		return;
	elseif _price >= 10000 then
		_awardbadges(951061233035427)		
		for _index, _pairs in pairs(game.Players:GetPlayers()) do
			local _starman = game.ServerStorage.WingedEndowmentPlayer:Clone();
			_starman.Parent = _replicatedstorge;
			local _star = game.ServerStorage:WaitForChild("Starfall", 100):Clone();
			_star:SetAttribute("Donator", ("%s"):format(_donator.Username));
			_star:SetAttribute("Raiser", ("%s"):format(_raiser.Username));
			_star:SetAttribute("Amount", _price)
			_star:SetAttribute("DonatorId", _donator.Id)
			_star.Parent = _pairs.PlayerGui.ScreenGui
		end
		return
	elseif _price >= 1000 then
		_awardbadges(2906002493098375)		
		local _smiteman = game.ServerStorage.RobuxHammerGiant:Clone();
		_smiteman.Parent = _replicatedstorge.Templates;
		local _smite = game.ServerStorage.Smite:Clone();
		_smite:SetAttribute("Donator", ("%s"):format(_donator.Username));
		_smite:SetAttribute("Raiser", ("%s"):format(_raiser.Username));
		_smite:SetAttribute("Amount", _price)
		_smite:SetAttribute("DonatorId", _donator.Id)
		for _index, _pairs in pairs(game.Players:GetPlayers()) do
			_smite.Parent = _pairs.PlayerGui.ScreenGui;
		end
		return
	elseif _price >= 100 then
		_awardbadges(4014970457158523)
		local _nuke = game.ServerStorage.Nuke:Clone();
		_nuke:SetAttribute("Donator", ("%s"):format(_donator.Username));
		_nuke:SetAttribute("Raiser", ("%s"):format(_raiser.Username));
		_nuke:SetAttribute("Amount", _price)
		for _index, _pairs in pairs(game.Players:GetPlayers()) do
			_nuke.Parent = _pairs.PlayerGui.ScreenGui;
		end
		return
	elseif _price >= 10 then
		print("blimp")
		local _blimp = _serverstorage:WaitForChild("Blimp", 5):Clone();
		local _board1 = _blimp:WaitForChild("A");
		local _board2 = _blimp:WaitForChild("B");
		_board1.DonationFrame.Donator.Username.Text = ("%s"):format(_donator.Username);
		_board2.DonationFrame.Donator.Username.Text = ("%s"):format(_donator.Username);
		_board1.DonationFrame.Donator.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150*"):format(_donator.Id);
		_board2.DonationFrame.Donator.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150*"):format(_donator.Id);
		_board1.DonationFrame.BoothOwner.Username.Text = ("%s"):format(_raiser.Username);
		_board2.DonationFrame.BoothOwner.Username.Text = ("%s"):format(_raiser.Username);
		_board1.DonationFrame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150*"):format(_raiser.Id);
		_board2.DonationFrame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150*"):format(_raiser.Id);
		_board2.DonationFrame.Robux.Price.Text = (" %s"):format(_numberhelper.formatCommas(_price));
		_board1.DonationFrame.Robux.Price.Text = (" %s"):format(_numberhelper.formatCommas(_price));
		_blimp.Parent = _workspace;
		return;
	end;
end);
