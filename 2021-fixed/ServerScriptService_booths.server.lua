-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x20, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find, color3_fromHex_2021
-- WARNING: 1 compound-assignment line(s) need manual rewriting (X op= Y -> X = X op Y).
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no Color3.fromHex on this client (2023 API); local equivalent
local function color3_fromHex_2021(vhex)
	vhex = vhex:gsub("#", "");
	if #vhex == 3 then vhex = vhex:gsub("(.)", "%1%1") end
	return Color3.fromRGB(tonumber(vhex:sub(1, 2), 16), tonumber(vhex:sub(3, 4), 16), tonumber(vhex:sub(5, 6), 16))
end
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- << Services > -- 

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _debris = game:GetService("Debris");
local _datastoreservice = game:GetService("DataStoreService");
local _httpsservice = game:GetService("HttpService");

-- << Modules > -- 

local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));
local _benchmarking = require(_replicatedstorge.Benchmarking);
local _items = require(_serverscriptservice.Modules.Items);
local _data = require(_serverscriptservice.Modules.Data);
local _numberhelper = require(_replicatedstorge.NumberHelpers);

-- << Remotes >> --

local _noassets = _remotes.Event("NoAssets");

-- << Stats >> --

local _donateddata = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardV1");
local _raisedata = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardV1");
local _boothcolors = _datastoreservice:GetDataStore("BoothColorsV1")

-- << Data >> --

local _cache = {};

local _letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
local SavedColors = {}
local DataStoreService = game:GetService("DataStoreService")
local BoothColorsDataStore = DataStoreService:GetDataStore("BoothColorsV2")

-- << Functions >> --


function _boothchangeffect(_booth)
	local _boothchangeffectvfx = _replicatedstorge.Templates.BoothChange:Clone();
	_boothchangeffectvfx.Parent = _booth;
	_boothchangeffectvfx.Position = Vector3.new(_booth.PrimaryPart.Position.X, _booth.PrimaryPart.Position.Y - _booth.PrimaryPart.Size.Y/2, _booth.PrimaryPart.Position.Z);
	for _, _sparks: _sparkles in pairs(_boothchangeffectvfx:GetDescendants()) do
		if _sparks:IsA("ParticleEmitter") then
			_sparks:Emit(_sparks:GetAttribute("EmitCount"));
		end;
	end;
	_debris:AddItem(_boothchangeffectvfx, 2)
end;
local _customization = _datastoreservice:GetDataStore("CustomizationV1");
local _setsigntext = _datastoreservice:GetDataStore("SignText");

-- << Events >> --
local _boothslotsave = {};
function _getclaimedbooth(arg1)
	for _, _booth in pairs(_workspace.BoothInteractions:GetChildren()) do
		if _booth:IsA("Part") and _booth:GetAttribute("BoothSlot") == arg1 then
			return _booth:FindFirstChild("BoothModel") and _booth.BoothModel.Value;
		end;
	end;
	return;
end;
function _getclaimedboothinteraction(arg1)
	for _, _booth in pairs(_workspace.BoothInteractions:GetChildren()) do
		if _booth:IsA("Part") and _booth:GetAttribute("BoothSlot") == arg1 then
			return _booth:FindFirstChild("BoothModel") and _booth;
		end;
	end;
	return;
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
function _setcustomizationbuttons(arg1, arg2, arg3, arg4, arg5)
	--[[if not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg4.UserId, 1419270497) then
		return;
	end;]]
	
	if arg2 == ("all") then
		_items:LoadPlayerItemsOnBooth(arg4, arg1 , arg3, false);
		_items:LoadPlayerItemsOnBooth(arg4, _donatesign(arg4).SignGui.Frame , arg3, false);
		--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg4, 1679943835) then
			_items:LoadPlayerItemsOnBooth(arg4, _hugedonatesign(arg4).DonateSign.SignGui.Frame , arg3, false);
		end]]
		for _index, _colorbuttons in pairs(arg1:GetChildren()) do
			if _colorbuttons:IsA("TextButton") then
				_colorbuttons.BackgroundColor3 = arg3.buttonColor;
				_colorbuttons:SetAttribute("IdleColor", arg3.buttonColor);
				_colorbuttons:SetAttribute('HoverColor', arg3.buttonHoverColor)
				if _colorbuttons:FindFirstChild("ImageLabel") then
					if _colorbuttons.ImageLabel:FindFirstChild("Price") then
						_colorbuttons.ImageLabel.Price.TextColor3 = arg3.buttonTextColor;
						_colorbuttons.ImageLabel.Price.Font = arg3.buttonTextFont;
					else
						_colorbuttons.Price.TextColor3 = arg3.buttonTextColor;
						_colorbuttons.Price.Font = arg3.buttonTextFont;
					end;
				else
					_colorbuttons.TextColor3 = arg3.buttonTextColor;
					_colorbuttons.Font = arg3.buttonTextFont;
				end;
			end;
		end;
		for _index, _colorbuttons in pairs(arg5:GetChildren()) do
			if _colorbuttons:IsA("TextButton") then
				_colorbuttons.BackgroundColor3 = arg3.buttonColor;
				_colorbuttons:SetAttribute("IdleColor", arg3.buttonColor);
				_colorbuttons:SetAttribute('HoverColor', arg3.buttonHoverColor)
				if _colorbuttons:FindFirstChild("ImageLabel") then
					if _colorbuttons.ImageLabel:FindFirstChild("Price") then
						_colorbuttons.ImageLabel.Price.TextColor3 = arg3.buttonTextColor;
						_colorbuttons.ImageLabel.Price.Font = arg3.buttonTextFont;
					else
						_colorbuttons.Price.TextColor3 = arg3.buttonTextColor;
						_colorbuttons.Price.Font = arg3.buttonTextFont;
					end;
				else
					_colorbuttons.TextColor3 = arg3.buttonTextColor;
					_colorbuttons.Font = arg3.buttonTextFont;
				end;
			end;
		end;
	end
	return;
end;
function _colortorgb(arg1)
	return {arg1.R * 255, arg1.G * 255, arg1.B * 255};
end
function _rgbtocolor(arg1)
	if not arg1 then return print("failed") end 
	return Color3.fromRGB(arg1[1], arg1[2], arg1[3]);
end;
function _boothname(arg1)
	local _name = '';
	if arg1 == "100KBooth" then
		return "100K Booth";
	elseif arg1 == "10KBooth" then
		return "10K Booth";
	end;
	for i = 1, #arg1 do
		local _letter = string.sub(arg1, i, i);
		if not __2021_find(_letters, _letter) or i == 1 then
			_name = _name .. _letter;
		else
			_name = ("%s %s"):format(_name, _letter);
		end;
	end;
	return _name;
end;
function _customizationdata(arg1)
	local _datacustomization = {};
	if _customization:GetAsync(arg1.UserId) then
		local _jsoned = game:GetService("HttpService"):JSONDecode(_customization:GetAsync(arg1.UserId));
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
		};
	end;
	return _datacustomization;
end;
function _donatesign(arg1)
	local character = arg1.Character
	local _sign = character:FindFirstChild('DonateSign');
	if not _sign then
		_sign = arg1.Backpack:WaitForChild('DonateSign');
	end;
	return _sign;
end;
--[[function _hugedonatesign(arg1)
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1679943835) then
		local character = arg1.Character
		local _sign = character:FindFirstChild('LargeDonateSign');
		if not _sign then
			repeat wait(0.25) until arg1.Backpack:WaitForChild('LargeDonateSign');
			_sign = arg1.Backpack:WaitForChild('LargeDonateSign');
		end;
		return _sign;
	end;
end;]]
function _getdisplayname(arg1)
	local _verified = {5502332040};
	local _display = ("%s's Stand"):format(arg1.DisplayName);
	if arg1.MembershipType == Enum.MembershipType.Premium or __2021_find(_verified, arg1.UserId) then
		_display = "\238\128\129" .. " ".. _display;
	end;
	if arg1.HasVerifiedBadge or __2021_find(_verified, arg1.UserId)  then
		_display = "\238\128\128" .. _display;
	end
	return _display;
end;
function _changebooth(arg1, arg2, arg3)
	local _booth = _serverstorage.BoothModels:FindFirstChild(arg2);
	local _interaction = _getclaimedboothinteraction(arg3);
	local _boothmodel = _getclaimedbooth(arg3);
	local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(arg3));
	if not _booth then
		_booth = _serverstorage.BoothModels:FindFirstChild("BasicBooth");
	end;
	local _cloned = _booth:Clone();
	_interaction.BoothModel.Value = _cloned;
	_cloned:SetAttribute("OwnerId", _interaction:GetAttribute("BoothOwner"));
	_cloned:SetPrimaryPartCFrame(_boothmodel.PrimaryPart.CFrame);
	if _cloned.Name == "ElevatorBooth" then
		_boothui.Details.Adornee = _cloned.Elevator:WaitForChild('Base');
		_boothui.Items.Adornee = _cloned.Elevator:WaitForChild('ItemsPart');
		_boothui.Sign.Adornee = _cloned.Elevator:WaitForChild('SignPart');
	elseif _cloned.Name == "CraneBooth" then
		_boothui.Details.Adornee = _cloned.ControlRoom:WaitForChild('Base');
		_boothui.Items.Adornee = _cloned.Sign:WaitForChild('ItemsPart');
		_boothui.Sign.Adornee = _cloned.Sign:WaitForChild('SignPart');
	else
		_boothui.Details.Adornee = _cloned:WaitForChild('Base');
		_boothui.Items.Adornee = _cloned:WaitForChild('ItemsPart');
		_boothui.Sign.Adornee = _cloned:WaitForChild('SignPart');
	end;
	_cloned.Parent = _workspace.BoothModels;
	_boothmodel:Destroy();
	return _cloned;
end;
local _currentbooth = {};
_remotes.Event("PreloadItems").OnServerEvent:Connect(function(p1)
	task.wait(0.015)
	_currentbooth[p1.UserId] = _data:GetCurrentBooth(p1.UserId);
	--_items:LoadPlayerItems(p1);
end);
_remotes.Function("GetCustomization").OnServerInvoke = function(p1)
	task.wait(0.015)
	local BoothData2 = _customization:GetAsync(p1.UserId)
	if not BoothData2 then
		return {
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
	else
		local _dataa = game:GetService("HttpService"):JSONDecode(BoothData2)
		return {
			text = _dataa.text or "your text here",
			textFont = Enum.Font[_dataa.textFont],
			textColor = _rgbtocolor(_dataa.textColor),
			strokeColor = _rgbtocolor(_dataa.strokeColor),
			strokeOpacity = 1 - _dataa.strokeOpacity or 0.5,
			richText = _dataa.richText or true,
			buttonTextFont = Enum.Font[_dataa.buttonTextFont],
			buttonTextColor = _rgbtocolor(_dataa.buttonTextColor),
			buttonStrokeColor = _rgbtocolor(_dataa.buttonStrokeColor),
			buttonHoverColor = _rgbtocolor(_dataa.buttonHoverColor),
			buttonColor = _rgbtocolor(_dataa.buttonColor),
			buttonLayout = _dataa.buttonLayout;
		}
	end
end;
_remotes.Function("RefreshItems").OnServerInvoke = function(p1)
	task.wait(0.015)
	_items:_unclaimedbooth(p1);
	repeat wait(0.25) until _items:LoadPlayerItems(p1);
	local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(_boothslotsave[p1.UserId]));
	local _datacustomization = _customizationdata(p1);
	for _index, _buttons in pairs(_boothui.Items.Frame:GetChildren()) do
		if _buttons:IsA("TextButton") then
			_buttons:Destroy()
		end;
	end;
	for _index, _buttons in pairs(_donatesign(p1).SignGui.Frame:GetChildren()) do
		if _buttons:IsA("TextButton") then
			_buttons:Destroy()
		end; 
	end;
	--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(p1.UserId, 1679943835) then
		for _index, _buttons in pairs(_hugedonatesign(p1).DonateSign.SignGui.Frame:GetChildren()) do
			if _buttons:IsA("TextButton") then
				_buttons:Destroy();
				_items:LoadPlayerItemsOnBooth(p1, _hugedonatesign(p1).DonateSign.SignGui.Frame , _datacustomization, false);
			end;
		end;
	end;]]
	_items:LoadPlayerItemsOnBooth(p1, _boothui.Items.Frame , _datacustomization, false);
	_items:LoadPlayerItemsOnBooth(p1, _donatesign(p1).SignGui.Frame , _datacustomization, false);
end;
_remotes.Function("SetSignText").OnServerInvoke = function(p1, p2)
	task.wait(0.015);
	local _text = _filtertext(tostring(p2), p1.UserId);
	if _donatesign(p1) then
		--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(p1.UserId, 1679943835) then
			if _hugedonatesign(p1) then
				_hugedonatesign(p1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_text);
			end;
		end;]]
		_donatesign(p1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_text);
		spawn(function()
			_setsigntext:SetAsync(p1.UserId, _text);
		end);
		return true, 'applied!';
	else
		return false, 'nvm';
	end;
end;
_remotes.Event("UnclaimBooth").OnServerEvent:Connect(function(p1)
	task.wait(0.015)
	_boothchangeffect(_changebooth(p1, "BasicBooth", _boothslotsave[p1.UserId]));
	local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(_boothslotsave[p1.UserId]));
	for _index, _buttons in pairs(_boothui.Items.Frame:GetChildren()) do
		if _buttons:IsA("TextButton") then
			_buttons:Destroy()
		end;
	end;
	local _boothclaimedinteraction = _getclaimedboothinteraction(_boothslotsave[p1.UserId]);
	local _boothclaimed = _getclaimedbooth(_boothslotsave[p1.UserId]);
	_boothui.Details.Owner.Text = ("%s"):format("unclaimed");
	_boothui.Sign.TextLabel.Text = ("%s"):format("your text here");
	_boothui.Sign.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
	_boothui.Sign.TextLabel.TextStrokeTransparency = 0.25;
	_boothui.Sign.TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	_boothui.Sign.TextLabel.Font = Enum.Font.GothamBlack;
	_boothui.Details.Raised.Visible = false;
	_boothui.Items.Frame.CanvasSize = UDim2.fromOffset(0, 0);
	_boothclaimedinteraction:SetAttribute("BoothOwner", nil);
	_boothclaimed:SetAttribute("OwnerId", nil);
	_cache[p1.UserId] = false;
	_currentbooth[p1.UserId] = nil;
	_boothslotsave[p1.UserId] = nil;
end);
_remotes.Function("CurrentBoothDetails").OnServerInvoke = function(p1)
	task.wait(0.015)
	local _booths = require(_serverstorage.Booths);
	local _ifnot = _currentbooth[p1.UserId];
	local _boothdetails = {};
	if _booths.Booths[_ifnot] then
		local boothInfo = _booths.Booths[_ifnot]
		_boothdetails.name = _boothname(_ifnot)
		_boothdetails.icon = {
			Image = boothInfo.icon.Image,
			ImageRectOffset = boothInfo.icon.ImageRectOffset,
			ImageRectSize = boothInfo.icon.ImageRectSize
		}
	else
		_boothdetails.name = _boothname(_ifnot)
		_boothdetails.icon = {
			Image = "rbxassetid://0",
			ImageRectOffset = Vector2.new(0,0),
			ImageRectSize = Vector2.new(0,0)
		}
	end
	return _boothdetails;
end;
local _cooldown = {};
_remotes.Function("ClaimBooth").OnServerInvoke = function(arg1, arg2)
	task.wait(0.003);
	local _interaction =  _getclaimedboothinteraction(arg2);
	if _cooldown[arg1.UserId] and (tick() - _cooldown[arg1.UserId] < 3) then
		return {error = "hit_rate_limit"};
	end;
	_cooldown[arg1.UserId] = tick();
	local _boothclaimedinteraction = _interaction;
	if not _cache[arg1.UserId] then
		_cache[arg1.UserId] = {};
	end;
	if _cache[arg1.UserId].Claimed then
		return {error = "already_have_booth"};
	end
	if _boothclaimedinteraction:GetAttribute("BoothOwner") then
		return;
	end;
	_boothclaimedinteraction:SetAttribute("BoothOwner", arg1.UserId);
	local _datacustomization = _customizationdata(arg1);
	_boothslotsave[arg1.UserId] = arg2;
	local _claimtime = _benchmarking.new();
	local _boothclaimed = _changebooth(arg1, _currentbooth[arg1.UserId], arg2);
	local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(arg2));
	_boothui.Details.Owner.Text = _getdisplayname(arg1);
	_boothui.Details.Raised.Visible = true;
	_boothui.Details.Raised.Text = ("%s raised"):format(_numberhelper.formatCommas(arg1:GetAttribute("RaisedNumber")));
	spawn(function()
		_items:LoadPlayerItemsOnBooth(arg1, _boothui.Items.Frame , _datacustomization, false);
		_boothui.Sign.TextLabel.Text = tostring(_datacustomization.text) or "your text here";
		_boothui.Sign.TextLabel.TextColor3 = _datacustomization.textColor;
		_boothui.Sign.TextLabel.Font = _datacustomization.textFont;
		_boothui.Sign.TextLabel.TextStrokeColor3 = _datacustomization.strokeColor;
		_donatesign(arg1).TextSign.SurfaceGui.TextLabel.Text = _setsigntext:GetAsync(arg1.UserId) or "your text here";
		_donatesign(arg1).TextSign.SurfaceGui.TextLabel.TextColor3 = _datacustomization.textColor;
		_donatesign(arg1).TextSign.SurfaceGui.TextLabel.Font = _datacustomization.textFont;
		_donatesign(arg1).TextSign.SurfaceGui.TextLabel.TextStrokeColor3 = _datacustomization.strokeColor;
		--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1679943835) then
			_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.Text = _setsigntext:GetAsync(arg1.UserId) or "your text here";
			_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.TextColor3 = _datacustomization.textColor;
			_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.Font = _datacustomization.textFont;
			_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.TextStrokeColor3 = _datacustomization.strokeColor;
		end]]
		local savedColors = {}
		local success, data = pcall(function()
			return BoothColorsDataStore:GetAsync(arg1.UserId)
		end)
		local booth = _getclaimedbooth(_boothslotsave[arg1.UserId])
		if success and data then
			local boothColors = data[booth.Name]
			if boothColors then
				savedColors = boothColors
			end
		end
		if booth then
			for _, part in pairs(booth:GetDescendants()) do
				if part:IsA("BasePart") and part:GetAttribute("ColorId") then
					local colorId = part:GetAttribute("ColorId")
					if savedColors[colorId] then
						part.Color = color3_fromHex_2021(savedColors[colorId])
					end
				end
			end
		else
			print('e')
		end
	end);
	spawn(function()
		wait(math.random(0.5, 1));
		if _items:CheckIfPlayerGotAnything(arg1) == {} then
			_noassets:FireClient(arg1);
		end;
	end);
	_cache[arg1.UserId].Claimed = true;
	_boothchangeffect(_boothclaimed);
	print(_claimtime());
	game:GetService("BadgeService"):AwardBadge(arg1.UserId, 0) -- claim a booth badge
	return {error = "claimed"};
end;
local _cooldown = {};
_remotes.Function('EditBoothModel').OnServerInvoke = function(p1, p2)
	task.wait(0.015);
	if _cooldown[p1.UserId] and (tick() - _cooldown[p1.UserId] < 0.2) then
		return {error = "hit_rate_limit"};
	end;
	_cooldown[p1.UserId] = tick();
	local _boothclaimed = _changebooth(p1, tostring(p2), _boothslotsave[p1.UserId]);
	spawn(function()
		local savedColors = {}
		local success, data = pcall(function()
			return BoothColorsDataStore:GetAsync(p1.UserId)
		end)
		local booth = _getclaimedbooth(_boothslotsave[p1.UserId])
		if success and data then
			local boothColors = data[booth.Name]
			if boothColors then
				savedColors = boothColors
			end
		end
		if booth then
			for _, part in pairs(booth:GetDescendants()) do
				if part:IsA("BasePart") and part:GetAttribute("ColorId") then
					local colorId = part:GetAttribute("ColorId")
					if savedColors[colorId] then
						part.Color = color3_fromHex_2021(savedColors[colorId])
					end
				end
			end
		else
			print('e')
		end
	end)
	_boothchangeffect(_boothclaimed);
	spawn(function()
		_data:SetCurrentBooth(p1.UserId, tostring(p2));
	end);
	return;
end;
_remotes.Event("SetCustomization").OnServerEvent:Connect(function(p1, p2, p3)
	task.wait(0.015);
	if not _boothslotsave[p1.UserId] then
		return;
	end;
	local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(_boothslotsave[p1.UserId]));
	if p3 == ("booth") then
		if not _boothui then
			return;
		end;
		for _index, _children in pairs(_boothui.Items.Frame:GetChildren()) do
			if _children:IsA("TextButton") then
				_children:Destroy();
			end;
		end;
		for _index, _buttons in pairs(_donatesign(p1).SignGui.Frame:GetChildren()) do
			if _buttons:IsA("TextButton") then
				_buttons:Destroy()
			end;
		end;
		--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(p1.UserId, 1679943835) then
			for _index, _buttons in pairs(_hugedonatesign(p1).DonateSign.SignGui.Frame:GetChildren()) do
				if _buttons:IsA("TextButton") then
					_buttons:Destroy();
				end;
			end;
		end;]]
		_boothui.Sign.TextLabel.Text = _filtertext(p2.text, p1.UserId);
		_boothui.Sign.TextLabel.Font = p2.textFont;
		_boothui.Sign.TextLabel.TextColor3 = p2.textColor;
		_boothui.Sign.TextLabel.TextStrokeColor3 = p2.strokeColor;
		_boothui.Sign.TextLabel.TextStrokeTransparency = 1 - p2.strokeOpacity ;
		_boothui.Sign.TextLabel.RichText = p2.richText;
		_setcustomizationbuttons(_boothui.Items.Frame, "all", p2, p1, _donatesign(p1).SignGui.Frame);
	end;
	_customization:SetAsync(p1.UserId, _httpsservice:JSONEncode({
		text = _filtertext(p2.text, p1.UserId) or "your text here";
		textFont = p2.textFont.Name;
		textColor = _colortorgb(p2.textColor);
		strokeColor = _colortorgb(p2.strokeColor) or Color3.fromRGB(0, 0, 0);
		strokeOpacity = tonumber(p2.strokeOpacity) or 0.5;
		richText = p2.richText or true;
		buttonTextFont = p2.buttonTextFont.Name;
		buttonTextColor = _colortorgb(p2.buttonTextColor) or Color3.fromRGB(0, 0, 0);
		buttonStrokeColor = _colortorgb(p2.buttonStrokeColor) or Color3.fromRGB(0, 0, 0);
		buttonHoverColor = _colortorgb(p2.buttonHoverColor) or Color3.fromRGB(174, 254, 255);
		buttonColor = _colortorgb(p2.buttonColor) or Color3.fromRGB(0, 0, 0);
		buttonLayout = p2.buttonLayout or "Normal";
	}));
end);
_remotes.Function('ExclusiveBooths').OnServerInvoke = function(Player)
	task.wait(0.015)
	return {
		VIPBooth = {
			name = 'VIP Booth',
			icon = {
				Image = "rbxassetid://15524352931",
				ImageRectOffset = Vector2.new(0,723),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = "rbxassetid://15524352931",
				ImageRectOffset = Vector2.new(241,482),
				ImageRectSize = Vector2.new(240, 240)
			},
		},
		QuataunBooth = {
			name = 'Quataun Booth',
			icon = {
				Image = "rbxassetid://15524352931",
				ImageRectOffset = Vector2.new(241, 0),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = "rbxassetid://15524352931",
				ImageRectOffset = Vector2.new(0,0),
				ImageRectSize = Vector2.new(240, 240)
			},
		},
		PremiumBooth = {
			name = 'Premium Booth',
			icon = {
				Image = "rbxassetid://15524352541",
				ImageRectOffset = Vector2.new(723,723),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = "rbxassetid://15524352541",
				ImageRectOffset = Vector2.new(482, 723),
				ImageRectSize = Vector2.new(240, 240)
			},
		};
		StaffBooth = {
			name = _boothname('StaffBooth'),
			id = 'StaffBooth',
			price = -0;
			icon = {
				Image = 'rbxassetid://13759750433',
				ImageRectOffset = Vector2.new(0, 482),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = 'rbxassetid://13759750433',
				ImageRectOffset = Vector2.new(241, 241),
				ImageRectSize = Vector2.new(240, 240)
			},
		},
		['CraneBooth'] = require(_serverstorage.Booths).Booths['CraneBooth'];
		['RocketBooth'] = require(_serverstorage.Booths).Booths['RocketBooth'];
		ElevatorBooth = {
			name = _boothname('ElevatorBooth'),
			id = 'ElevatorBooth',
			price = -0;
			icon = {
				Image = 'rbxassetid://17718014247',
				ImageRectOffset = Vector2.new(482, 241),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = 'rbxassetid://17718014247',
				ImageRectOffset = Vector2.new(723, 0),
				ImageRectSize = Vector2.new(240, 240)
			},
		},
		RobotBooth = {
			name = _boothname('RobotBooth'),
			id = 'RobotBooth',
			price = -0;
			icon = {
				Image = nil,
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(0, 0)
			},
			hoverIcon = {
				Image = nil,
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(0, 0)
			},
		};
		RDC24Booth = {
			name = _boothname('RDC24Booth'),
			id = 'RDC24Booth',
			price = -0;
			icon = {
				Image = 'rbxassetid://78314297057197',
				ImageRectOffset = Vector2.new(397, 0),
				ImageRectSize = Vector2.new(396, 396)
			},
			hoverIcon = {
				Image = 'rbxassetid://78314297057197',
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(396, 396)
			},
		};
		HugeSkyscraperBooth = {
			name = 'HugeSkyscraperBooth',
			price = "inf",
			icon = {
				Image = 'rbxassetid://17718014379',
				ImageRectOffset = Vector2.new(241, 0),
				ImageRectSize = Vector2.new(240, 240)
			},
			hoverIcon = {
				Image = 'rbxassetid://17718014379',
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(240, 240)
			},
		},
	};
end
_remotes.Function('ClassicBoothsCustom').OnServerInvoke = function(arg1)
	task.wait(0.015)
	return {
		['BasicBooth'] = require(_serverstorage.Booths).Booths['BasicBooth'];
		['DiamondBooth'] = require(_serverstorage.Booths).Booths['DiamondBooth'];
		['GoldBooth'] = require(_serverstorage.Booths).Booths['GoldBooth'];
		['VoidBooth'] = require(_serverstorage.Booths).Booths['VoidBooth'];
		['10KBooth'] = require(_serverstorage.Booths).Booths['10KBooth'];
		['100KBooth'] = require(_serverstorage.Booths).Booths['100KBooth'];
	};
end;
_remotes.Function("GetDonated").OnServerInvoke = function(p1)
	task.wait(0.015)
	if not p1:GetAttribute("DonatedNumber") then repeat wait(0.25) until p1:GetAttribute("DonatedNumber") end;
	return p1:GetAttribute("DonatedNumber");
end;
_remotes.Function('PurchasedBooths').OnServerInvoke = function(Player)
	local _booths = {};
	for _, _dataa in pairs(_data:GetPlayerBooths(Player.UserId, 'PurchasedBooths')) do
		local BoothInfo = nil
		if require(_serverstorage.Booths).Booths[_dataa['BoothId']] then
			BoothInfo = require(_serverstorage.Booths).Booths[_dataa.BoothId];
		else
			BoothInfo = require(_serverstorage.Booths).Booths[_dataa];
		end;
		if BoothInfo then
			local _time = _data:GetBoothTimePurchased(Player.UserId, BoothInfo.name) or DateTime.now().UnixTimestampMillis;
			rawset(_booths, _dataa, {
				['name'] = _boothname(BoothInfo.name),
				['id'] = BoothInfo.name,
				['price'] = BoothInfo.price,
				['whenPurchased'] = DateTime.fromUnixTimestampMillis(_time),
				['icon'] = {
					['Image'] = BoothInfo.icon.Image,
					['ImageRectOffset'] = BoothInfo.icon.ImageRectOffset,
					['ImageRectSize'] = BoothInfo.icon.ImageRectSize
				},
				['hoverIcon'] = {
					['Image'] = BoothInfo.hoverIcon.Image,
					['ImageRectOffset'] = BoothInfo.hoverIcon.ImageRectOffset,
					['ImageRectSize'] = BoothInfo.hoverIcon.ImageRectSize
				};
			});
		else
			print('gm')
		end;
	end;
	return _booths;
end;
_remotes.Function("CurrentBooth").OnServerInvoke = function(p1)
	task.wait(0.015)
	return _data:GetCurrentBooth(p1.UserId) or "BasicBooth";
end;
_remotes.Function("LoadBoothColors").OnServerInvoke = function(player)
	task.wait(0.015);
	local playerId = player.UserId
	local boothId = require(_serverscriptservice.Modules.Data):GetCurrentBooth(playerId)
	local formattedColors = {}
	local savedColors = SavedColors[playerId]
	if not savedColors then
		local success, data = pcall(function()
			return BoothColorsDataStore:GetAsync(playerId)
		end)
		if success and data then
			SavedColors[playerId] = data
			savedColors = data
		else
			return {}
		end
	end
	for booth, colors in pairs(savedColors) do
		for colorId, colorValue in pairs(colors) do
			formattedColors[booth .. " " .. colorId] = colorValue
		end
	end
	return formattedColors
end

_remotes.Function("GetColors").OnServerInvoke = function(player, boothId)
	task.wait(0.015);
	local booth = _getclaimedbooth(_boothslotsave[player.UserId])

	local colorsData = {}
	local partsByColorId = {}

	for _, part in pairs(booth:GetDescendants()) do
		if part:IsA("BasePart") and part:GetAttribute("ColorId") then
			local colorId = part:GetAttribute("ColorId")
			local defaultColor = part:GetAttribute("DefaultColor")

			if not partsByColorId[colorId] then
				partsByColorId[colorId] = {default = defaultColor, partCount = 0}
			end
			partsByColorId[colorId].partCount += 1
		end
	end

	for colorId, data in pairs(partsByColorId) do
		table.insert(colorsData, {
			id = colorId,
			default = data.default,
			partCount = data.partCount
		})
	end

	return colorsData

end
_remotes.Function("ChangeBoothColor").OnServerInvoke = function(player, boothId, colorId, newColor)
	task.wait(0.015);
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, 1680481811) or player.Name == "IlIIllIIlIlIlIIII" then
		local booth = _getclaimedbooth(_boothslotsave[player.UserId])

		for _, part in pairs(booth:GetDescendants()) do
			if part:IsA("BasePart") and part:GetAttribute("ColorId") == colorId then
				part.Color = newColor
			end
		end
		SavedColors[player.UserId] = SavedColors[player.UserId] or {}
		SavedColors[player.UserId][boothId] = SavedColors[player.UserId][boothId] or {}
		SavedColors[player.UserId][boothId][colorId] = newColor:ToHex()
		pcall(function()
			BoothColorsDataStore:SetAsync(player.UserId, SavedColors[player.UserId])
		end)
	else
		player:Kick("I like my cheese drippy brah")
	end;
end;
_remotes.Function("ResetBoothColors").OnServerInvoke = function(player)
	task.wait(0.015);
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, 1680481811) or player.Name == "IlIIllIIlIlIlIIII" then
		local booth = _getclaimedbooth(_boothslotsave[player.UserId])
		local boothid = _currentbooth[player.UserId];
		for _, part in pairs(booth:GetDescendants()) do
			if part:IsA("BasePart") and part:GetAttribute("ColorId") then
				local colorId = part:GetAttribute("ColorId")
				local defaultColor = part:GetAttribute("DefaultColor") 
				part.Color = defaultColor
				SavedColors[player.UserId] = SavedColors[player.UserId] or {}
				SavedColors[player.UserId][boothid] = SavedColors[player.UserId][boothid] or {}
				SavedColors[player.UserId][boothid][colorId] = defaultColor:ToHex()
			end
		end
		pcall(function()
			BoothColorsDataStore:SetAsync(player.UserId, SavedColors[player.UserId])
		end)
	else
		player:Kick("I like my cheese moldy bruh")
	end
end
_remotes.Function("DoIHaveGamepass").OnServerInvoke = function(player, id)
	if not id then return end;
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, id) then
		return true;
	else
		return false;
	end;
end;
_remotes.Function("HasBooth").OnServerInvoke = function(_, plr, booth)
	if _data:IsPlayerOwningBooth(plr.UserId, booth) then
		return true;
	else
		return false;
	end;
end;
_remotes.Function("SomeSecretBooths").OnServerInvoke = function(player)
	return {
		JackInTheBoxBooth = {
			name = 'JackInTheBoxBooth',
			icon = {
				Image = nil,
				ImageRectOffset = Vector2.new(0,0),
				ImageRectSize = Vector2.new(0, 0)
			},
			hoverIcon = {
				Image = nil,
				ImageRectOffset = Vector2.new(0,0),
				ImageRectSize = Vector2.new(0, 0)
			},
		},
	};
end;
for _, _booths in pairs(_serverstorage.BoothModels:GetChildren()) do
	if _booths:IsA("Model") then
		for _, _parts in pairs(_booths:GetDescendants()) do
			if _parts:IsA("MeshPart") then
				_parts:SetAttribute("DefaultColor", _parts.Color);
				_parts:SetAttribute("ColorId", _parts:GetAttribute("ColorId") or _parts.Color:ToHex());
			end
		end
	end
end
game.Players.PlayerRemoving:Connect(function(p1)
	task.wait(0.015)
	if _boothslotsave[p1.UserId] then
		local _boothui = _workspace.MapUI.BoothUI:WaitForChild(("BoothUI%s"):format(_boothslotsave[p1.UserId]));
		for _index, _buttons in pairs(_boothui.Items.Frame:GetChildren()) do
			if _buttons:IsA("TextButton") then
				_buttons:Destroy()
			end;
		end;
		local _boothclaimedinteraction = _getclaimedboothinteraction(_boothslotsave[p1.UserId]);
		local _boothclaimed = _getclaimedbooth(_boothslotsave[p1.UserId]);
		_boothui.Details.Owner.Text = ("%s"):format("unclaimed");
		_boothui.Sign.TextLabel.Text = ("%s"):format("your text here");
		_boothui.Sign.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
		_boothui.Sign.TextLabel.TextStrokeTransparency = 0.25;
		_boothui.Sign.TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		_boothui.Sign.TextLabel.Font = Enum.Font.GothamBlack;
		_boothui.Details.Raised.Visible = false;
		_boothui.Items.Frame.CanvasSize = UDim2.fromOffset(0, 0);
		_boothclaimedinteraction:SetAttribute("BoothOwner", nil);
		_boothclaimed:SetAttribute("OwnerId", nil);
		_boothchangeffect(_changebooth(p1, "BasicBooth", _boothslotsave[p1.UserId]));
		_boothslotsave[p1.UserId] = nil;
		_cache[p1.UserId] = false;
	end;
end);
game.Players.PlayerAdded:Connect(function(arg1)
	arg1.CharacterAdded:Connect(function(plr)
		local _again = true;
		if _again == true then
			_again = false;
			spawn(function()
				_items:LoadPlayerItems(arg1);
			end);
			task.wait(5);
			_items:LoadPlayerItemsOnBooth(arg1, _donatesign(arg1).SignGui.Frame , _customizationdata(arg1), false);
			_donatesign(arg1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_setsigntext:GetAsync(arg1.UserId) or "your text here");
			--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1679943835) then
				_items:LoadPlayerItemsOnBooth(arg1, _hugedonatesign(arg1).DonateSign.SignGui.Frame , _customizationdata(arg1), false);
				_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_setsigntext:GetAsync(arg1.UserId) or "your text here");
				local _sign2 = _hugedonatesign(arg1);
				local _signui2 = _sign2.DonateSign.SignGui;
				_sign2.Equipped:Connect(function()
					_signui2.Parent = workspace.MapUI;
				end);
				_sign2.Unequipped:Connect(function()
					_signui2.Parent = _sign2;
				end);
			end;]]
			local _sign = _donatesign(arg1)
			local _signui = _sign.SignGui;
			_sign.Equipped:Connect(function()
				_signui.Parent = workspace.MapUI;
			end);
			_sign.Unequipped:Connect(function()
				_signui.Parent = _sign;
			end);
		else
			task.wait(1);
			_items:LoadPlayerItemsOnBooth(arg1, _donatesign(arg1).SignGui.Frame , _customizationdata(arg1), false);
			_donatesign(arg1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_setsigntext:GetAsync(arg1.UserId) or "your text here");
			--[[if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(arg1.UserId, 1679943835) then
				_items:LoadPlayerItemsOnBooth(arg1, _hugedonatesign(arg1).DonateSign.SignGui.Frame , _customizationdata(arg1), false);
				_hugedonatesign(arg1).TextSign.SurfaceGui.TextLabel.Text =  ("%s"):format(_setsigntext:GetAsync(arg1.UserId) or "your text here");
				local _sign2 = _hugedonatesign(arg1);
				local _signui2 = _sign2.DonateSign.SignGui;
				_sign2.Equipped:Connect(function()
					_signui2.Parent = workspace.MapUI;
				end);
				_sign2.Unequipped:Connect(function()
					_signui2.Parent = _sign2;
				end);
			end;]]
			local _sign = _donatesign(arg1)
			local _signui = _sign.SignGui;
			_sign.Equipped:Connect(function()
				_signui.Parent = workspace.MapUI;
			end);
			_sign.Unequipped:Connect(function()
				_signui.Parent = _sign;
			end);
		end;
	end);
end);
game.Players.PlayerRemoving:Connect(function(arg1)
	_items:_unclaimedbooth(arg1);
end);