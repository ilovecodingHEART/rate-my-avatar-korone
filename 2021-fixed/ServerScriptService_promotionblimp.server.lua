-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x6, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
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
local _items = require(_serverscriptservice:WaitForChild("Modules"):WaitForChild("Items"));
local _boothdata = require(_serverscriptservice.Modules.Data);

-- << Remotes Runs >> --

local _cancelprompt = _remotes.Event("CancelPromptPurchase");
local _giftsent = _remotes.Event('GiftSentAlert');
local _chatalert = _remotes.Event("ChatDonationAlert");
local _chatalertannoucement = _remotes.Event("ChatAlert");
local _newgiftbuxbalance = _remotes.Event("NewGiftbuxBalance");
local _newdonated = _remotes.Event('DonatedChanged');
local _purchaseboothstarted = _remotes.Event("PurchaseBoothStarted");
local _alreadyowned = _remotes.Event("AlreadyOwned");
local _newpurchasedbooth = _remotes.Event('NewPurchasedBooths');
local _notifydonation = _remotes.Event("NotifyDonationParticipants");
local _donationsound = _remotes.Event("PlayDonationSound");
local _nogiftbux = _remotes.Event("InsufficientGiftbux");
local _purchasepopup = _remotes.Event("PurchasePopup");
local _sendinchat = _remotes.Event("JustPostSomethingInChatPleaseOkThanksYourTheBest");

-- << Datastores >> --

local _customization = _datastoreservice:GetDataStore("CustomizationV1");
local _carouselboothdata = _datastoreservice:GetDataStore("CarouselBoothV1");

-- << Functions >> -- 

function _colortorgb(arg1)
	return {arg1.R * 255, arg1.G * 255, arg1.B * 255};
end
function _rgbtocolor(arg1)
	if not arg1 then return print("failed") end 
	return Color3.fromRGB(arg1[1], arg1[2], arg1[3]);
end;
function _customizationdata(arg1: target)
	local _datacustomization = {};
	if _customization:GetAsync(arg1) then
		local _jsoned = game:GetService("HttpService"):JSONDecode(_customization:GetAsync(arg1));
		_datacustomization = {
			text = tostring(_jsoned.text) or "your text here",
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
function _spawnblimp(arg1)
	local _customization = _customizationdata(arg1._plr.id);
	local _promotionblimpmodel = _serverstorage:WaitForChild("PromotionBlimpBlue", 5):Clone();
	_collectionservice:AddTag(_promotionblimpmodel.A, "BlimpDonationUI");
	_collectionservice:AddTag(_promotionblimpmodel.B, "BlimpDonationUI");
	_promotionblimpmodel.A.Frame.BoothOwner.Username.Text = ("@%s"):format(arg1._plr.username);
	_promotionblimpmodel.B.Frame.BoothOwner.Username.Text = ("@%s"):format(arg1._plr.username);
	_promotionblimpmodel.A.Frame.Message.Text = ("%s"):format(_customization.text);
	_promotionblimpmodel.B.Frame.Message.Text = ("%s"):format(_customization.text);
	_promotionblimpmodel.A.Frame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150"):format(arg1._plr.id);
	_promotionblimpmodel.B.Frame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150"):format(arg1._plr.id);
	spawn(function()
		_promotionblimpmodel.A.Frame.Message.Font = _customization.textFont;
		_promotionblimpmodel.B.Frame.Message.Font = _customization.textFont;
		_promotionblimpmodel.A.Frame.Message.TextColor3 = _customization.textColor;
		_promotionblimpmodel.B.Frame.Message.TextColor3 = _customization.textColor;
		_promotionblimpmodel.A.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.B.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.A.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.B.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
	end);
	_items:LoadPlayerItemsOnBooth({UserId = arg1._plr.id, Name = arg1._plr.username}, _promotionblimpmodel.A.Frame.Frame , _customization, true);
	_items:LoadPlayerItemsOnBooth({UserId = arg1._plr.id, Name = arg1._plr.username}, _promotionblimpmodel.B.Frame.Frame, _customization, true);
	_promotionblimpmodel.Parent = _workspace;
	local _Color = "251, 94, 202"
	local _TextYourColorOrFindYourColorHere = Color3.fromRGB(251, 94, 202)
	_sendinchat:FireAllClients(string.format('<font color="rgb('.._Color..')" size="18"><b>[GLOBAL]: %s</b> just purchased a Promotion Blimp! Check the skies and donate if you wish!</font>', "@"..arg1._plr.username))
end;
function _makeglobalblimp(arg1, arg2)
	_messagingservice:PublishAsync("PromotionBlimp", {
		['_plr'] = {
			['id'] = arg1.UserId;
			['username'] = arg1.Name;
			['displayname'] = arg1.DisplayName;
		};
		['price'] = arg2;
	});
end;
_messagingservice:SubscribeAsync("PromotionBlimp", function(arg1)
	local _promotiondata = arg1.Data;
	_spawnblimp(_promotiondata);
end);
local _countdown = {};
_remotes.Event("PromotionBlimpGiftbux").OnServerEvent:Connect(function(p1)
	task.wait(math.random(0.001, 0.003));
	if p1:GetAttribute("GiftBuxs") < 2500 then
		return _nogiftbux:FireClient(p1);
	else
		if _countdown[p1.UserId] and (tick() - _countdown[p1.UserId] < 35) then
			return {error = "hit_rate_limit"};
		end;
		_countdown[p1.UserId] = tick();
		p1:SetAttribute("GiftBuxs", p1:GetAttribute("GiftBuxs") - 1);
		_purchasepopup:FireClient(p1, "promotion blimp");
		_makeglobalblimp(p1);
		return;
	end;
end);
local _product = {};
_product[3532195651] = function(arg1, arg2)
	if arg1 then
		_makeglobalblimp(arg1)
		return true;
	else
		return false;
	end;
end;
_product[3234682223] = function(arg1, arg2)
	if arg1 then
		local _cybrsigma = _datastoreservice:GetDataStore("CybrSigma");
		if _cybrsigma:GetAsync(arg1.UserId) then
			return
		else
			_cybrsigma:SetAsync(arg1.UserId, true);
			if not arg1.Backpack:FindFirstChild("SigmaTool") then
				game.ServerStorage.PlayerTools:WaitForChild('SigmaTool'):Clone().Parent = arg1.Backpack;
			end
		end
		return true;
	else
		return false;
	end;
end;

_product[2683770880] = function(arg1, arg2)
	if arg1 then
		_carouselboothdata:SetAsync(arg1.UserId, true);
		print('sigma')
		if not _carouselboothdata:GetAsync(arg1.UserId) then
			return
		else
			local _booths = require(_serverstorage.Booths);
			local _table = {
				['price'] = _booths.Booths["CarouselBooth"].price;
				['name'] = _booths.Booths["CarouselBooth"].name;
				['id'] = _booths.Booths["CarouselBooth"].name;
				['icon'] = {
					['Image'] = _booths.Booths["CarouselBooth"].icon.Image;
					['ImageRectOffset'] = _booths.Booths["CarouselBooth"].icon.ImageRectOffset;
					['ImageRectSize'] = _booths.Booths["CarouselBooth"].icon.ImageRectSize;
				};
				['hoverIcon'] = {
					['Image'] = _booths.Booths["CarouselBooth"].hoverIcon.Image;
					['ImageRectOffset'] = _booths.Booths["CarouselBooth"].hoverIcon.ImageRectOffset;
					['ImageRectSize'] = _booths.Booths["CarouselBooth"].hoverIcon.ImageRectSize;
				};
			};
			require(_serverscriptservice.Modules.Data):PurcharseBooth(arg1.UserId, "CarouselBooth");
			_newpurchasedbooth:FireClient(arg1, _table);
		end;
		return true;
	else
		return false;
	end;
end;
_marketplaceservice.ProcessReceipt = function(arg1)
	local _info = {["plrid"] = arg1.PlayerId,["productid"] = arg1.ProductId};
	local _player = game.Players:GetPlayerByUserId(_info.plrid);
	if _product[_info.productid] then
		if _product[_info.productid](_player, _info.productid) then
			return Enum.ProductPurchaseDecision.PurchaseGranted;
		else
			return Enum.ProductPurchaseDecision.NotProcessedYet;
		end;
	else
		return Enum.ProductPurchaseDecision.NotProcessedYet;
	end;
end;
local MarketPlaceService = game:GetService("MarketplaceService");
local Targeted = {};
local MarketplaceService = game:GetService("MarketplaceService");
local Players = game:GetService("Players");
local BundleOwned = _datastoreservice:GetDataStore("ExclusiveBoothPack");
_remotes.Function("GiftBundle").OnServerInvoke = function(player, target)
	task.wait(0.015);
	if not target then
		return;
	end;
	if BundleOwned:GetAsync(target) then
		return;
	end;
	Targeted[player.UserId] = target;
	MarketplaceService:PromptProductPurchase(player, 3532202023);
	return target;
end;
_product[3532202023] = function(player, _)
	if player then
		local targetUserId = Targeted[player.UserId];
		if not targetUserId then return false end;
		local TargetPlayer = Players:GetPlayerByUserId(targetUserId)
		if not TargetPlayer then return false end;
		local _booths = require(_serverstorage.Booths);
		local boothTypes = {"", "RocketshipBooth", ""};
		local BoothTable = {};
		for _, name in ipairs(boothTypes) do
			local booth = _booths.Booths[name]
			BoothTable[name] = {
				['price'] = booth.price,
				['name'] = booth.name,
				['id'] = booth.name,
				['icon'] = {
					['Image'] = booth.icon.Image,
					['ImageRectOffset'] = booth.icon.ImageRectOffset,
					['ImageRectSize'] = booth.icon.ImageRectSize
				},
				['hoverIcon'] = {
					['Image'] = booth.hoverIcon.Image,
					['ImageRectOffset'] = booth.hoverIcon.ImageRectOffset,
					['ImageRectSize'] = booth.hoverIcon.ImageRectSize
				}
			}
			if _boothdata:IsPlayerOwningBooth(targetUserId, name) then
				return;
			end;
			_boothdata:PurcharseBooth(targetUserId, name);
		end
		if TargetPlayer then
			for _, name in ipairs(boothTypes) do
				task.wait(0.3);
				_newpurchasedbooth:FireClient(TargetPlayer, BoothTable[name])
			end;
			_chatalertannoucement:FireClient(TargetPlayer, ("<b>%s</b> gifted <b>Rocketship Booth</b> to you!"):format(player.Name), "giftpass", "");
		end;
		_sendinchat:FireAllClients(string.format('<font size="18" color="rgb(0, 255, 234)"><font color="rgb(123, 134, 228)" size="18"><b>[PRODUCT GIFT]:</b> <b>@%s</b> gifted <b>Rocketship Booth</b> to <b>@%s! </b></font></font>',player.Name,TargetPlayer.Name))
		return true
	else
		return false
	end
end
