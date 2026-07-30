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
local _adminresponse = _remotes.Event("AdminResponse");
local _nogiftbux = _remotes.Event("InsufficientGiftbux");
local _norobux = _remotes.Event("InsufficientRobux");
local _updateitemcount = _remotes.Event("ChangeItemCountThing");
local _purchasepopup = _remotes.Event("PurchasePopup");
local _sendinchat = _remotes.Event("JustPostSomethingInChatPleaseOkThanksYourTheBest");
local _confetti = _remotes.Event("ConfettiCannon");
local _urlwebhook = 'https://discord.com/api/webhooks/'
local _product = {};

-- << Datastores >> --

local _customization = _datastoreservice:GetDataStore("BoothCustomization");
local _carouselboothdata = _datastoreservice:GetDataStore("CarouselBoothV1");
local _vipdatastore = _datastoreservice:GetDataStore("PlayerVIPV2");

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
			
			raisedStrokeColor = _rgbtocolor(_jsoned.raisedStrokeColor),
			raisedTextColor = _rgbtocolor(_jsoned.raisedTextColor),
			raisedTextFont = Enum.Font[_jsoned.raisedTextFont],
			
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
			raisedStrokeColor = Color3.fromRGB(0, 0, 0),
			raisedTextColor = Color3.fromRGB(8, 255, 36),
			raisedTextFont = Enum.Font.GothamBlack,
			buttonHoverColor = Color3.fromRGB(174, 254, 255),
			buttonColor = Color3.fromRGB(0, 255, 17),
			buttonLayout = "Normal";
		}
	end;
	return _datacustomization;
end;
local _blimpmodels = {
	_serverstorage:WaitForChild("PromotionBlimpBlue"),
	_serverstorage:WaitForChild("PromotionBlimpGreen"),
	_serverstorage:WaitForChild("PromotionBlimpYellow"),
};
function _spawnblimp(arg1)
	local _customization = _customizationdata(arg1._plr.id);
	
	local _chosenModel = _blimpmodels[math.random(1, #_blimpmodels)]
	local _promotionblimpmodel = _chosenModel:Clone()
	
	_collectionservice:AddTag(_promotionblimpmodel.LeftDisplay, "BlimpDonationUI");
	_collectionservice:AddTag(_promotionblimpmodel.RightDisplay, "BlimpDonationUI");
	_promotionblimpmodel.LeftBlimp.Enabled = false;
	_promotionblimpmodel.RightBlimp.Enabled = false;
	
	_promotionblimpmodel.LeftDisplay.Enabled = true;
	_promotionblimpmodel.RightDisplay.Enabled = true;
	_promotionblimpmodel.LeftDisplay.Frame.BoothOwner.Username.Text = ("@%*"):format(arg1._plr.username);
	_promotionblimpmodel.RightDisplay.Frame.BoothOwner.Username.Text = ("@%*"):format(arg1._plr.username);
	_promotionblimpmodel.LeftDisplay.Frame.Message.Text = ("%*"):format(_customization.text);
	_promotionblimpmodel.RightDisplay.Frame.Message.Text = ("%*"):format(_customization.text);
	_promotionblimpmodel.LeftDisplay.Frame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(arg1._plr.id);
	_promotionblimpmodel.RightDisplay.Frame.BoothOwner.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(arg1._plr.id);
	spawn(function()
		_promotionblimpmodel.LeftDisplay.Frame.Message.Font = _customization.textFont;
		_promotionblimpmodel.RightDisplay.Frame.Message.Font = _customization.textFont;
		_promotionblimpmodel.LeftDisplay.Frame.Message.TextColor3 = _customization.textColor;
		_promotionblimpmodel.RightDisplay.Frame.Message.TextColor3 = _customization.textColor;
		_promotionblimpmodel.LeftDisplay.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.RightDisplay.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.LeftDisplay.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
		_promotionblimpmodel.RightDisplay.Frame.Message.UIStroke.Transparency = _customization.strokeOpacity;
	end);
	_items:LoadPlayerItemsOnBooth({UserId = arg1._plr.id, Name = arg1._plr.username}, _promotionblimpmodel.RightDisplay.Frame.Frame , _customization, true);
	_items:LoadPlayerItemsOnBooth({UserId = arg1._plr.id, Name = arg1._plr.username}, _promotionblimpmodel.LeftDisplay.Frame.Frame, _customization, true);
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