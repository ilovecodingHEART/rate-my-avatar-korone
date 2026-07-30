local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Chat");
local l_GuiService_0 = game:GetService("GuiService");
local l_BadgeService_0 = game:GetService("BadgeService");
local _ = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_HapticService_0 = game:GetService("HapticService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SocialService_0 = game:GetService("SocialService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserService_0 = game:GetService("UserService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Debris_0 = game:GetService("Debris");
local v22 = require(l_ReplicatedStorage_0.Roact);
local v23 = require(l_ReplicatedStorage_0.Packages.Promise);
local v24 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v25 = require(l_ReplicatedStorage_0.GiftInboxUI.Gift);
local v26 = require(l_ReplicatedStorage_0.NumberHelpers);
local v27 = require(l_ReplicatedStorage_0.FeaturePlaces);
local v28 = require(l_ReplicatedStorage_0.LoadOfflinePlayer);
local v29 = require(game.ReplicatedStorage.npcall);
local v30 = require(l_ReplicatedStorage_0.Remotes);
local v31 = require(l_ReplicatedStorage_0.Benchmarking).new();
local v32 = require(script.Confetti);
local v33 = require(script.BoothButton);
local v34 = require(script.Leaderboard);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local _ = workspace:WaitForChild("Camera");
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local _ = l_PlayerGui_0:WaitForChild("LoadingGui");
local _ = l_PlayerGui_0:WaitForChild("CustomCoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UITemplates_0 = l_StarterGui_0:WaitForChild("UITemplates");
local l_Templates_0 = l_ReplicatedStorage_0.Templates;
local v45 = 0;
local l_format_0 = v26.format;
local v47 = nil;
task.spawn(function() --[[ Line: 63 ]]
	v47 = l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId) or l_LocalPlayer_0.UserId == 151848836;
end);
local v48 = {
	"rbxassetid://16875407974", 
	"rbxassetid://16875459455", 
	"rbxassetid://16875475594", 
	"rbxassetid://16875487200"
};
local v49 = {
	"You can purchase booths in the shop using giftbux!", 
	"Did you know you can earn giftbux by donating?", 
	"You can customize your booth buttons with VIP perks, did you know?", 
	"You can donate to players, even when they're offline, using the gift button!", 
	"You can score a complimentary booth by joining Quataun Roblox group!", 
	"Learn how to create a gamepass by typing !tutorial in chat!", 
	"Did you know PLS DONATE's core was crafted in just 3 days?", 
	"You can unlock free booths by completing quests in games outside PLS DONATE!", 
	"Subscribe to VIP for a Jetpack, Button Customization, and more cool features!", 
	"You can play games such as Tic Tac Toe and Football on the minigame island!", 
	"Be careful, anyone 'doubling' donations is likely to be a scammer!", 
	"Beware of bots! Verify the player's identity before donating!", 
	"You can press CTRL to sprint! (for PC)"
};
local v50 = v48[math.random(1, #v48)];
local v51 = v49[math.random(1, #v49)];
l_ReplicatedStorage_0.CustomTeleportGui.Display.Image = v50;
l_ReplicatedStorage_0.CustomTeleportGui.Tip.Text = v51;
l_TeleportService_0:SetTeleportGui(l_ReplicatedStorage_0.CustomTeleportGui);
local function _(v52, v53, v54, v55) --[[ Line: 92 ]] --[[ Name: tween ]]
	local v56 = TweenInfo.new(v53, v55 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(v52, v56, v54):Play();
end;
local function _(v58, v59, v60) --[[ Line: 97 ]] --[[ Name: popup ]]
	spawn(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v58 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v61 = l_UITemplates_0[v58 .. "Popup"];
			if not v61 then
				print("NOPE");
				return;
			else
				local v62 = v61:Clone();
				v62.Message.Text = v59;
				v62.Transparency = 1;
				v62.UIScale.Scale = 0;
				v62.Parent = l_ScreenGui_0.Popups;
				local v63 = {
					Transparency = 0
				};
				local v64 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v62, v64, v63):Play();
				v63 = v62.UIScale;
				v64 = {
					Scale = 1
				};
				local l_Back_0 = Enum.EasingStyle.Back;
				local v66 = TweenInfo.new(0.3, l_Back_0 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v63, v66, v64):Play();
				v63 = v62.Message;
				v64 = {
					MaxVisibleGraphemes = #v59
				};
				l_Back_0 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v63, l_Back_0, v64):Play();
				wait(v60 or 4);
				v63 = {
					Transparency = 1
				};
				v64 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v62, v64, v63):Play();
				v63 = v62.UIScale;
				v64 = {
					Scale = 0
				};
				l_Back_0 = Enum.EasingStyle.Back;
				v66 = TweenInfo.new(0.5, l_Back_0 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v63, v66, v64):Play();
				wait(0.5);
				v62:Destroy();
			end;
		end;
	end);
end;
l_ScreenGui_0.Loading.Visible = true;
l_ScreenGui_0.Shade.Visible = true;
local function v78(v71) --[[ Line: 134 ]] --[[ Name: toggleLoading ]]
	if v71 == true then
		local l_Camera_1 = workspace.Camera;
		local v73 = {
			FieldOfView = 50
		};
		local v74 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_1, v74, v73):Play();
		l_Camera_1 = l_ScreenGui_0.Loading;
		v73 = {
			GroupTransparency = 0
		};
		v74 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_1, v74, v73):Play();
		return;
	else
		local l_Camera_2 = workspace.Camera;
		local v76 = {
			FieldOfView = 70
		};
		local v77 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_2, v77, v76):Play();
		l_Camera_2 = l_ScreenGui_0.Loading;
		v76 = {
			GroupTransparency = 1
		};
		v77 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_2, v77, v76):Play();
		return;
	end;
end;
local function v80(v79) --[[ Line: 144 ]] --[[ Name: getColorByAmount ]]
	if v79 >= 100000 then
		return Color3.fromRGB(255, 16, 60);
	elseif v79 >= 10000 then
		return Color3.fromRGB(255, 16, 60);
	elseif v79 >= 1000 then
		return Color3.fromRGB(255, 0, 100);
	elseif v79 >= 100 then
		return Color3.fromRGB(255, 0, 230);
	elseif v79 >= 10 then
		return Color3.fromRGB(0, 200, 255);
	elseif v79 >= 5 then
		return Color3.fromRGB(255, 170, 0);
	else
		return Color3.fromRGB(0, 206, 31);
	end;
end;
local function v83(v81) --[[ Line: 160 ]] --[[ Name: naturalTime ]]
	local v82 = DateTime.now().UnixTimestamp - v81.UnixTimestamp;
	if v82 < 10 then
		return "Just now";
	elseif v82 < 60 then
		return string.format("%i seconds ago", v82);
	elseif v82 < 120 then
		return "a minute ago";
	elseif v82 < 3600 then
		return string.format("%i minutes ago", v82 / 60);
	elseif v82 < 7200 then
		return "an hour ago";
	elseif v82 < 86400 then
		return string.format("%i hours ago", v82 / 3600);
	else
		return DateTime.fromUnixTimestamp(v81.UnixTimestamp):FormatLocalTime("LLL", l_LocalPlayer_0.LocaleId);
	end;
end;
local v90 = {};
local v95 = v23.try(function() --[[ Line: 220 ]]
	return v30.Function("FetchLaunchData"):InvokeServer();
end);
local v96 = nil;
local function v99() --[[ Line: 226 ]] --[[ Name: updateGiftCountLabels ]]
	l_ScreenGui_0.NavigationButtons.Gift.Count.Text = l_format_0(v96);
	l_ScreenGui_0.NavigationButtons.Gift.Count.Visible = v96 > 0;
	l_ScreenGui_0.NavigationButtons.Gift.Circle.Visible = v96 > 0;
	l_ScreenGui_0.Gift.TopFrame.Buttons.Inbox.Circle.Visible = v96 > 0;
	for _, v98 in pairs(l_CollectionService_0:GetTagged("MailBox")) do
		v98.BillboardGui.Count.TextLabel.Text = l_format_0(v96);
		v98.BillboardGui.Count.Visible = v96 > 0;
		v98.Door.ProximityPrompt.Enabled = v96 > 0;
	end;
end;
l_CollectionService_0:GetInstanceAddedSignal("MailBox"):Connect(function(v100) --[[ Line: 238 ]]
	if not v96 then
		return;
	else
		v100:WaitForChild("BillboardGui");
		v100:WaitForChild("Door");
		v100.BillboardGui.Count.TextLabel.Text = l_format_0(v96);
		v100.BillboardGui.Count.Visible = v96 > 0;
		v100.Door.ProximityPrompt.Enabled = v96 > 0;
		return;
	end;
end);
local function _() --[[ Line: 249 ]] --[[ Name: subtractGiftCount ]]
	v96 = v96 - 1;
	v99();
end;
local l_Loading_0 = l_ScreenGui_0.Gifts.Frame.Loading;
local l_Error_0 = l_ScreenGui_0.Gifts.Frame.Error;
local v104 = {};
local v105 = "Latest";
local function v106() --[[ Line: 261 ]]

end;
local function v120() --[[ Line: 262 ]] --[[ Name: updateUnclaimedDonationInbox ]]
	pcall(v106);
	l_Loading_0.Visible = true;
	l_Error_0.Visible = false;
	local v107, v108, v109 = v30.Function("UnclaimedDonations"):InvokeServer(v105);
	pcall(v106);
	l_Loading_0.Visible = false;
	l_Error_0.Visible = false;
	if v107 == nil then
		l_Error_0.Visible = true;
		error("Requesting unclaimed donations too fast");
	end;
	local v110 = nil;
	v110 = if #v107 < v109 then string.format("Showing %s %i out of %i gifts", v105 == "Latest" and "latest" or "top donated", #v107, v109) else #v107 == 1 and "Showing 1 gift" or string.format("Showing %i gifts", #v107);
	l_ScreenGui_0.Gifts.Frame.Info.Visible = true;
	l_ScreenGui_0.Gifts.Frame.Info.Text = v110;
	local v111 = {};
	for v112, v113 in pairs(v107) do
		local v117 = v25({
			donor = v113.donatorUserId, 
			message = v113.message, 
			robux = v113.donatedRobux, 
			whenDonated = v113.whenDonated, 
			layoutOrder = v112, 
			onClaimed = function() --[[ Line: 309 ]] --[[ Name: onClaimed ]]
				v96 = v96 - 1;
				v99();
				local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
				l_SoundService_0.SFX.GiftClaim:Play();
				v32(UDim2.new(0, l_l_UserInputService_0_MouseLocation_0.X, 0, l_l_UserInputService_0_MouseLocation_0.Y));
				table.insert(v104, v112);
				local l_ClaimDonation_0 = l_LocalPlayer_0:FindFirstChild("ClaimDonation");
				if #v104 == 1 then
					print('claimed donation')
					task.delay(0.5, function() --[[ Line: 318 ]]
						l_ClaimDonation_0:InvokeServer(v104);
						table.clear(v104);
					end);
				end;
			end
		});
		v117.Parent = l_ScreenGui_0.Gifts.Frame;
		table.insert(v111, v117);
	end;
	v106 = function() --[[ Line: 329 ]]
		l_ScreenGui_0.Gifts.Frame.Info.Visible = false;
		for _, v119 in pairs(v111) do
			if v119.Name ~= "Error" and v119.Name ~= "Info" then
				v119:Destroy();
			end;
		end;
	end;
end;
l_ScreenGui_0.Gifts.TopFrame.Buttons.Sort.Image = "rbxassetid://15045677186";
l_ScreenGui_0.Gifts.TopFrame.Buttons.Sort.Activated:Connect(function() --[[ Line: 340 ]]
	if v105 == "Latest" then
		v105 = "Robux";
		l_ScreenGui_0.Gifts.TopFrame.Buttons.Sort.Image = "rbxassetid://15045675045";
	else
		v105 = "Latest";
		l_ScreenGui_0.Gifts.TopFrame.Buttons.Sort.Image = "rbxassetid://15045677186";
	end;
	l_SoundService_0.SFX.Click:Play();
	v120();
end);
l_ScreenGui_0.Gifts.TopFrame.Buttons.Refresh.Activated:Connect(function() --[[ Line: 352 ]]
	l_SoundService_0.SFX.Click:Play();
	l_SoundService_0.SFX.Refresh:Play();
	v120();
end);
task.spawn(function() --[[ Line: 359 ]]
	v96 = v30.Function("UnclaimedDonationCount"):InvokeServer() or 0;
	l_ScreenGui_0.Gifts:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 371 ]]
		if l_ScreenGui_0.Gifts.Visible then
			v120();
		end;
	end);
	while true do
		v99();
		local v121 = v30.Event("GiftReceived").OnClientEvent:Wait();
		v96 = v96 + 1;
		if v121 then
			local v122 = ("you received a \238\128\130%* gift from @%*!"):format(v121.robux, v121.username);
			local l_spawn_0 = spawn;
			local v124 = "gift";
			local v125 = nil;
			local l_v122_0 = v122 --[[ copy: 1 -> 6 ]];
			l_spawn_0(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v124 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v127 = l_UITemplates_0[v124 .. "Popup"];
					if not v127 then
						print("NOPE");
						return;
					else
						local v128 = v127:Clone();
						v128.Message.Text = l_v122_0;
						v128.Transparency = 1;
						v128.UIScale.Scale = 0;
						v128.Parent = l_ScreenGui_0.Popups;
						local v129 = {
							Transparency = 0
						};
						local v130 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v128, v130, v129):Play();
						v129 = v128.UIScale;
						v130 = {
							Scale = 1
						};
						local l_Back_1 = Enum.EasingStyle.Back;
						local v132 = TweenInfo.new(0.3, l_Back_1 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v129, v132, v130):Play();
						v129 = v128.Message;
						v130 = {
							MaxVisibleGraphemes = #l_v122_0
						};
						l_Back_1 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v129, l_Back_1, v130):Play();
						wait(v125 or 4);
						v129 = {
							Transparency = 1
						};
						v130 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v128, v130, v129):Play();
						v129 = v128.UIScale;
						v130 = {
							Scale = 0
						};
						l_Back_1 = Enum.EasingStyle.Back;
						v132 = TweenInfo.new(0.5, l_Back_1 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v129, v132, v130):Play();
						wait(0.5);
						v128:Destroy();
					end;
				end;
			end);
			l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage((("<font color= \"rgb(255, 30, 131)\">you received a \238\128\130%* gift from @%*!</font>"):format(v121.robux, v121.username)));
		else
			local l_spawn_1 = spawn;
			local v134 = "gift";
			local v135 = "you received a gift!";
			local v136 = nil;
			l_spawn_1(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v134 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v137 = l_UITemplates_0[v134 .. "Popup"];
					if not v137 then
						print("NOPE");
						return;
					else
						local v138 = v137:Clone();
						v138.Message.Text = v135;
						v138.Transparency = 1;
						v138.UIScale.Scale = 0;
						v138.Parent = l_ScreenGui_0.Popups;
						local v139 = {
							Transparency = 0
						};
						local v140 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v138, v140, v139):Play();
						v139 = v138.UIScale;
						v140 = {
							Scale = 1
						};
						local l_Back_2 = Enum.EasingStyle.Back;
						local v142 = TweenInfo.new(0.3, l_Back_2 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v139, v142, v140):Play();
						v139 = v138.Message;
						v140 = {
							MaxVisibleGraphemes = #v135
						};
						l_Back_2 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v139, l_Back_2, v140):Play();
						wait(v136 or 4);
						v139 = {
							Transparency = 1
						};
						v140 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v138, v140, v139):Play();
						v139 = v138.UIScale;
						v140 = {
							Scale = 0
						};
						l_Back_2 = Enum.EasingStyle.Back;
						v142 = TweenInfo.new(0.5, l_Back_2 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v139, v142, v140):Play();
						wait(0.5);
						v138:Destroy();
					end;
				end;
			end);
		end;
		local v143 = l_SoundService_0.SFX.GiftReceived:Clone();
		v143.Parent = l_SoundService_0;
		v143.PlayOnRemove = true;
		v143:Destroy();
	end;
end);
displayToggle = function(v144, v145) --[[ Line: 396 ]] --[[ Name: displayToggle ]]
	if v145 then
		local l_Toggle_0 = v144.Toggle;
		local v147 = {
			BackgroundColor3 = Color3.fromRGB(32, 206, 145)
		};
		local l_Back_3 = Enum.EasingStyle.Back;
		local v149 = TweenInfo.new(0.35, l_Back_3 or Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Toggle_0, v149, v147):Play();
		l_Toggle_0 = v144.Toggle.Circle;
		v147 = {
			Position = UDim2.new(0.7, 0, 0.5, 0)
		};
		l_Back_3 = TweenInfo.new(0.35, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Toggle_0, l_Back_3, v147):Play();
		v144:SetAttribute("Value", true);
		return;
	else
		local l_Toggle_1 = v144.Toggle;
		local v151 = {
			BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		};
		local v152 = TweenInfo.new(0.35, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Toggle_1, v152, v151):Play();
		l_Toggle_1 = v144.Toggle.Circle;
		v151 = {
			Position = UDim2.new(0.3, 0, 0.5, 0)
		};
		v152 = Enum.EasingStyle.Back;
		local v153 = TweenInfo.new(0.35, v152 or Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Toggle_1, v153, v151):Play();
		v144:SetAttribute("Value", false);
		return;
	end;
end;
task.spawn(function() --[[ Line: 409 ]]
	if v30.Function("AmIVip"):InvokeServer() then
		l_ScreenGui_0.Shop.Frame.Featured.Subscription.Subscribe.Subscribe.Text = "SUBSCRIBED";
	end;
	for _, v156 in pairs(l_CollectionService_0:GetTagged("Buy")) do
		if v30.Function("DoIHaveGamepass"):InvokeServer(v156:GetAttribute("Id")) then
			v156.Text = "OWNED";
		end;
	end;
end);
local v157 = false;
local function v163() --[[ Line: 428 ]] --[[ Name: initsettings ]]
	local v158 = require(l_ReplicatedStorage_0.Settings);
	local l_Frame_0 = l_ScreenGui_0.Settings.Frame;
	workspace:SetAttribute("GlobalEffectsDisabled", v158.GlobalEffectsDisabled == true);
	l_SoundService_0.SFXGroup.Volume = v158.SFXVolume or 1;
	l_SoundService_0.DonationSFXGroup.Volume = v158.DonationSFXVolume or 1;
	l_SoundService_0.MusicGroup.Volume = v158.MusicVolume or 1;
	l_SoundService_0.BoomboxGroup.Volume = v158.BoomboxVolume or 1;
	l_Lighting_0.ClockTime = v158.Time or 11.8;
	print((("Anonymous setting is %*"):format(v158.Anonymous == true)));
	l_Frame_0.SFXVolumeSetting.SliderFrame.TextBox.Text = v158.SFXVolume or 1;
	l_Frame_0.DonationSFXVolumeSetting.SliderFrame.TextBox.Text = v158.DonationSFXVolume or 1;
	l_Frame_0.BoomboxVolumeSetting.SliderFrame.TextBox.Text = v158.BoomboxVolume or 1;
	l_Frame_0.MusicVolumeSetting.SliderFrame.TextBox.Text = v158.MusicVolume or 1;
	l_Frame_0.TimeSetting.SliderFrame.TextBox.Text = v158.Time or 11.8;
	displayToggle(l_Frame_0.GlobalEffectsSetting, not v158.GlobalEffectsDisabled);
	displayToggle(l_Frame_0.AnonymousSetting, v158.Anonymous == true);
	displayToggle(l_Frame_0.PopupsSetting, not v158.PopupsDisabled);
	displayToggle(l_Frame_0.HoverInfoSetting, not v158.HoverInfoDisabled);
	displayToggle(l_Frame_0.ConvertUSDSetting, v158.ConvertUSD);
	displayToggle(l_Frame_0.HighlightDonatedSetting, v158.HighlightDonated == true);
	displayToggle(l_Frame_0.ClipDonationsSetting, v158.ClipDonations == true)
	l_ScreenGui_0.Popups:SetAttribute("Enabled", not v158.PopupsDisabled);
	workspace:SetAttribute("ConvertUSD", v158.ConvertUSD);
	--workspace:SetAttribute("ConvertUSD", v158.HighlightDonated == true);
	v157 = v158.HoverInfoDisabled;
	l_Frame_0.MusicVolumeSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 469 ]]
		v158.MusicVolume = l_Frame_0.MusicVolumeSetting:GetAttribute("Value");
		l_SoundService_0.MusicGroup.Volume = v158.MusicVolume or 1;
	end);
	l_Frame_0.BoomboxVolumeSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 474 ]]
		v158.BoomboxVolume = l_Frame_0.BoomboxVolumeSetting:GetAttribute("Value");
		l_SoundService_0.BoomboxGroup.Volume = v158.BoomboxVolume or 1;
	end);
	l_Frame_0.DonationSFXVolumeSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 479 ]]
		v158.DonationSFXVolume = l_Frame_0.DonationSFXVolumeSetting:GetAttribute("Value");
		l_SoundService_0.DonationSFXGroup.Volume = v158.DonationSFXVolume or 1;
	end);
	l_Frame_0.SFXVolumeSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 484 ]]
		v158.SFXVolume = l_Frame_0.SFXVolumeSetting:GetAttribute("Value");
		l_SoundService_0.SFXGroup.Volume = v158.SFXVolume or 1;
	end);
	l_Frame_0.TimeSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 489 ]]
		v158.Time = l_Frame_0.TimeSetting:GetAttribute("Value");
		l_Lighting_0.ClockTime = v158.Time or 11.8;
	end);
	l_Frame_0.GlobalEffectsSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 494 ]]
		v158.GlobalEffectsDisabled = not l_Frame_0.GlobalEffectsSetting:GetAttribute("Value");
		workspace:SetAttribute("GlobalEffectsDisabled", v158.GlobalEffectsDisabled == true);
	end);
	l_Frame_0.AnonymousSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 499 ]]
		local l_Attribute_0 = l_Frame_0.AnonymousSetting:GetAttribute("Value");
		v158.Anonymous = l_Attribute_0;
		v30.Event("SetAnonymousLive"):FireServer(l_Attribute_0);
	end);
	l_Frame_0.PopupsSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 503 ]]
		v158.PopupsDisabled = not l_Frame_0.PopupsSetting:GetAttribute("Value");
		l_ScreenGui_0.Popups:SetAttribute("Enabled", not v158.PopupsDisabled);
	end);
	l_Frame_0.HoverInfoSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 508 ]]
		v158.HoverInfoDisabled = not l_Frame_0.HoverInfoSetting:GetAttribute("Value");
		v157 = v158.HoverInfoDisabled or false;
	end);
	l_Frame_0.ConvertUSDSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 513 ]]
		v158.ConvertUSD = l_Frame_0.ConvertUSDSetting:GetAttribute("Value");
		workspace:SetAttribute("ConvertUSD", v158.ConvertUSD or false);
	end);
	l_Frame_0.HighlightDonatedSetting:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 518 ]]
		v158.HighlightDonated = l_Frame_0.HighlightDonatedSetting:GetAttribute("Value");
		workspace:SetAttribute("HighlightDonated", v158.HighlightDonated == true);
	end);
end;
task.defer(v163);
l_ScreenGui_0.PromotionBlimpConfirmation.Frame.Options.Buy.Activated:Connect(function() --[[ Line: 530 ]]
	l_ScreenGui_0.PromotionBlimpConfirmation.Visible = false;
	l_ScreenGui_0.Shop.Visible = false;
	v78(true);
	v30.Event("PromotionBlimpGiftbux"):FireServer();
	v78(false);
end);
local l_SharingHistory_0 = l_ScreenGui_0.SharingGiftbuxHistory;
local v164 = {
	l_SharingHistory_0.Frame.Sort.Time, 
	l_SharingHistory_0.Frame.Sort.Type, 
	l_SharingHistory_0.Frame.Sort.Order
};
local v165 = nil;
local v166 = "AllTime";
local v167 = "All";
local v168 = "Newest";
local v169 = 0;
task.spawn(function()
	v165 = v30.Function("SharingHistoryTimes"):InvokeServer();
	for v170, v171 in v165 do
		l_SharingHistory_0.Frame.Sort.Time:SetAttribute(v170, v171.name);
	end;
end);
local function v174()
	v169 = 0;
	l_SharingHistory_0.Frame.History.LoadMore.Visible = false;
	for _, v173 in pairs(l_SharingHistory_0.Frame.History:GetChildren()) do
		if v173.Name == "TransactionFrame2" then
			v173:Destroy();
		end;
	end;
end;
local v175 = {};
local function v193(v176, v177, v178, v179)
	print("PARAMS:", v176, v177, v178, v179);
	l_SharingHistory_0.Frame.History.Loading.Visible = true;
	local v180 = v30.Function("SharingHistory"):InvokeServer({
		dtime = v176, 
		dtype = v177, 
		order = v178, 
		page = v179
	});
	local v181 = {};
	for _, v183 in v180 do
		if v183.donatorUserId ~= nil and v175[v183.donatorUserId] == nil and table.find(v181, v183.donatorUserId) == nil then
			table.insert(v181, v183.donatorUserId);
		end;
		if v175[v183.boothOwnerUserId] == nil and table.find(v181, v183.boothOwnerUserId) == nil then
			table.insert(v181, v183.boothOwnerUserId);
		end;
	end;
	if #v181 > 0 then
		for _, v185 in (l_UserService_0:GetUserInfosByUserIdsAsync(v181)) do
			v175[v185.Id] = v185;
		end;
	end;
	l_SharingHistory_0.Frame.History.Loading.Visible = false;
	for _, v187 in v180 do
		local v188 = l_UITemplates_0.TransactionFrame2:Clone();
		v188.Parent = l_SharingHistory_0.Frame.History;
		if v187.donatorUserId then
			local v189 = v175[v187.donatorUserId] or {};
			v188.Player1.Info.Username.Text = ("@%*"):format(v189.Username or "?");
			v188.Player1.Info.DisplayName.Text = v189.DisplayName or "?";
			v188.Player1.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v189.Id or 1);
		else
			v188.Player1.Info.Username.Text = "Anonymous";
			v188.Player1.Info.DisplayName.Text = "Anonymous";
			v188.Player1.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150";
		end;
		local v190 = v175[v187.boothOwnerUserId] or {};
		v188.Player2.Info.Username.Text = ("@%*"):format(v190.Username or "?");
		v188.Player2.Info.DisplayName.Text = v190.DisplayName or "?";
		v188.Player2.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v190.Id or 1);
		v188.Context.price.Amount.Text = ("%*"):format((v26.formatCommas(v187.donatedGiftbux)));
		v188.MouseButton2Click:Connect(function()
			if v187.donatorUserId then
				local v191 = v175[v187.donatorUserId] or {};
				l_ScreenGui_0.TransactionInfo2.Info.Donator.Value.Text = ("@%*"):format(v191.Username or "?");
			else
				l_ScreenGui_0.TransactionInfo2.Info.Donator.Value.Text = "Anonymous";
			end;
			local v192 = v175[v187.boothOwnerUserId] or {};
			l_ScreenGui_0.TransactionInfo2.Info.Reciever.Value.Text = ("@%*"):format(v192.Username) or "?";
			l_ScreenGui_0.TransactionInfo2.Info.Amount.price.Value.Text = ("%*"):format((v26.formatCommas(v187.donatedGiftbux)));
			l_ScreenGui_0.TransactionInfo2.Info.Date.Value.Text = v83(v187.whenDonated);
			v192 = l_UserInputService_0:GetMouseLocation();
			l_ScreenGui_0.TransactionInfo2.Position = UDim2.new(0, v192.X, 0, v192.Y);
			l_ScreenGui_0.TransactionInfo2.Visible = true;
		end);
		v188.MouseButton1Click:Connect(function()
			l_ScreenGui_0.TransactionInfo2.Visible = false;
		end);
	end;
	l_SharingHistory_0.Frame.History.LoadMore.Visible = true;
end;
for _, v195 in ipairs(v164) do
	v195:GetPropertyChangedSignal("Text"):Connect(function()
		for _, v197 in v165 do
			if v195.Text == v197.name then
				v166 = v197.id;
			end;
		end;
		v167 = l_SharingHistory_0.Frame.Sort.Type.Text;
		v168 = l_SharingHistory_0.Frame.Sort.Order.Text;
		v174();
		v193(v166, v167, v168, v169);
	end);
end;
l_SharingHistory_0.Frame.History.LoadMore.Activated:Connect(function()
	v169 = v169 + 1;
	v193(v166, v167, v168, v169);
end);
l_SharingHistory_0.TopFrame.Buttons.Refresh.Activated:Connect(function()
	for _, v199 in v165 do
		if l_SharingHistory_0.Frame.Sort.Time.Text == v199.name then
			v166 = v199.id;
		end;
	end;
	v167 = l_SharingHistory_0.Frame.Sort.Type.Text;
	v168 = l_SharingHistory_0.Frame.Sort.Order.Text;
	v174();
	v193(v166, v167, v168, v169);
end);
task.spawn(function()
	l_SharingHistory_0:GetPropertyChangedSignal("Visible"):Wait();
	v193(v166, v167, v168, v169);
end);
local l_DonationHistory_0 = l_ScreenGui_0.DonationHistory;
local v165 = {
	l_DonationHistory_0.Frame.Sort.Time, 
	l_DonationHistory_0.Frame.Sort.Type, 
	l_DonationHistory_0.Frame.Sort.Order
};
local v166 = nil;
local v167 = "AllTime";
local v168 = "All";
local v169 = "Newest";
local v170 = 0;
task.spawn(function() --[[ Line: 554 ]]
	v166 = v30.Function("DonationHistoryTimes"):InvokeServer();
	for v171, v172 in v166 do
		l_DonationHistory_0.Frame.Sort.Time:SetAttribute(v171, v172.name);
	end;
end);
local function v175() --[[ Line: 561 ]] --[[ Name: clearDonations ]]
	v170 = 0;
	l_DonationHistory_0.Frame.History.LoadMore.Visible = false;
	for _, v174 in pairs(l_DonationHistory_0.Frame.History:GetChildren()) do
		if v174.Name == "TransactionFrame" then
			v174:Destroy();
		end;
	end;
end;
local v176 = {};
local function v194(v177, v178, v179, v180) --[[ Line: 573 ]] --[[ Name: loadDonations ]]
	print("PARAMS:", v177, v178, v179, v180);
	l_DonationHistory_0.Frame.History.Loading.Visible = true;
	local v181 = v30.Function("DonationHistory"):InvokeServer({
		dtime = v177, 
		dtype = v178, 
		order = v179, 
		page = v180
	});
	local v182 = {};
	for _, v184 in v181 do
		if v184.donatorUserId ~= nil and v176[v184.donatorUserId] == nil and table.find(v182, v184.donatorUserId) == nil then
			table.insert(v182, v184.donatorUserId);
		end;
		if v176[v184.boothOwnerUserId] == nil and table.find(v182, v184.boothOwnerUserId) == nil then
			table.insert(v182, v184.boothOwnerUserId);
		end;
	end;
	if #v182 > 0 then
		for _, v186 in (l_UserService_0:GetUserInfosByUserIdsAsync(v182)) do
			v176[v186.Id] = v186;
		end;
	end;
	l_DonationHistory_0.Frame.History.Loading.Visible = false;
	for _, v188 in v181 do
		local v189 = l_UITemplates_0.TransactionFrame:Clone();
		v189.Parent = l_DonationHistory_0.Frame.History;
		if v188.donatorUserId then
			local v190 = v176[v188.donatorUserId] or {};
			v189.Player1.Info.Username.Text = ("@%*"):format(v190.Username or "?");
			v189.Player1.Info.DisplayName.Text = v190.DisplayName or "?";
			v189.Player1.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v190.Id or 1);
		else
			v189.Player1.Info.Username.Text = "Anonymous";
			v189.Player1.Info.DisplayName.Text = "Anonymous";
			v189.Player1.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150";
		end;
		local v191 = v176[v188.boothOwnerUserId] or {};
		v189.Player2.Info.Username.Text = ("@%*"):format(v191.Username or "?");
		v189.Player2.Info.DisplayName.Text = v191.DisplayName or "?";
		v189.Player2.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v191.Id or 1);
		v189.Context.Amount.Text = ("\238\128\130%*"):format((v26.formatCommas(v188.donatedRobux)));
		v189.Context.Amount.TextColor3 = v80(v188.donatedRobux);
		if v188.isGift then
			v189.Gift.Visible = true;
		end;
		v189.MouseButton2Click:Connect(function() --[[ Line: 638 ]]
			if v188.donatorUserId then
				local v192 = v176[v188.donatorUserId] or {};
				l_ScreenGui_0.TransactionInfo.Info.Donator.Value.Text = ("@%*"):format(v192.Username or "?");
			else
				l_ScreenGui_0.TransactionInfo.Info.Donator.Value.Text = "Anonymous";
			end;
			local v193 = v176[v188.boothOwnerUserId] or {};
			l_ScreenGui_0.TransactionInfo.Info.Reciever.Value.Text = ("@%*"):format(v193.Username) or "?";
			l_ScreenGui_0.TransactionInfo.Info.Amount.Value.Text = ("\238\128\130%*"):format((v26.formatCommas(v188.donatedRobux)));
			l_ScreenGui_0.TransactionInfo.Info.Date.Value.Text = v83(v188.whenDonated);
			if v188.isGift then
				l_ScreenGui_0.TransactionInfo.Info.IsGift.Value.Text = "Yes";
			else
				l_ScreenGui_0.TransactionInfo.Info.IsGift.Value.Text = "No";
			end;
			v193 = l_UserInputService_0:GetMouseLocation();
			l_ScreenGui_0.TransactionInfo.Position = UDim2.new(0, v193.X, 0, v193.Y);
			l_ScreenGui_0.TransactionInfo.Visible = true;
		end);
		v189.MouseButton1Click:Connect(function() --[[ Line: 662 ]]
			l_ScreenGui_0.TransactionInfo.Visible = false;
		end);
	end;
	l_DonationHistory_0.Frame.History.LoadMore.Visible = true;
end;
for _, v196 in ipairs(v165) do
	v196:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 670 ]]
		for _, v198 in v166 do
			if v196.Text == v198.name then
				v167 = v198.id;
			end;
		end;
		v168 = l_DonationHistory_0.Frame.Sort.Type.Text;
		v169 = l_DonationHistory_0.Frame.Sort.Order.Text;
		v175();
		v194(v167, v168, v169, v170);
	end);
end;
l_DonationHistory_0.Frame.History.LoadMore.Activated:Connect(function() --[[ Line: 683 ]]
	v170 = v170 + 1;
	v194(v167, v168, v169, v170);
end);
l_DonationHistory_0.TopFrame.Buttons.Refresh.Activated:Connect(function() --[[ Line: 688 ]]
	for _, v200 in v166 do
		if l_DonationHistory_0.Frame.Sort.Time.Text == v200.name then
			v167 = v200.id;
		end;
	end;
	v168 = l_DonationHistory_0.Frame.Sort.Type.Text;
	v169 = l_DonationHistory_0.Frame.Sort.Order.Text;
	v175();
	v194(v167, v168, v169, v170);
end);
task.spawn(function() --[[ Line: 701 ]]
	l_DonationHistory_0:GetPropertyChangedSignal("Visible"):Wait();
	v194(v167, v168, v169, v170);
end);
local l_ServerSelector_0 = l_ScreenGui_0.ServerSelector;
local v202 = nil;
local function v221() --[[ Line: 711 ]] --[[ Name: loadServers ]]
	l_ServerSelector_0.Frame.Loading.Visible = true;
	v202 = v30.Function("VoiceChatServers"):InvokeServer();
	for _, v204 in l_ServerSelector_0.Frame:GetChildren() do
		if v204.Name == "ServerFrame" or v204.Name == "DeluxeServerFrame" then
			v204:Destroy();
		end;
	end;
	l_ServerSelector_0.Frame.Loading.Visible = false;
	l_ServerSelector_0.Frame.NoServers.Visible = #v202 == 0;
	for _, v206 in v202 do
		local v207 = nil;
		v207 = if v206.isDeluxe then l_UITemplates_0.DeluxeServerFrame:Clone() else l_UITemplates_0.ServerFrame:Clone();
		v207.Info.Title.Text = v206.serverName;
		v207.Info.Region.Text = v206.language:upper();
		v207.Avatars.PlayerCount.Text = ("%*/%*"):format(v206.playerCount, v206.maxPlayers);
		v207.LayoutOrder = -v206.playerCount;
		v207.Parent = l_ServerSelector_0.Frame;
		for v208, v209 in v206.userIds do
			if v208 < 10 then
				local v210 = l_UITemplates_0.Avatar:Clone();
				v210.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v209);
				v210.ZIndex = v208;
				v210.Parent = v207.Avatars;
				if v209 == l_LocalPlayer_0.UserId then
					v210.LayoutOrder = -1;
					v210.Size = UDim2.new(0, 35, 0, 35);
					v210.BackgroundColor3 = Color3.fromRGB(0, 145, 255);
				end;
			end;
		end;
		v207.Join.Activated:Connect(function() --[[ Line: 751 ]]
			if not v47 then
				local l_spawn_2 = spawn;
				local v212 = "danger";
				local v213 = "you must have voice chat enabled to join!";
				local v214 = nil;
				l_spawn_2(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v212 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v215 = l_UITemplates_0[v212 .. "Popup"];
						if not v215 then
							print("NOPE");
							return;
						else
							local v216 = v215:Clone();
							v216.Message.Text = v213;
							v216.Transparency = 1;
							v216.UIScale.Scale = 0;
							v216.Parent = l_ScreenGui_0.Popups;
							local v217 = {
								Transparency = 0
							};
							local v218 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v216, v218, v217):Play();
							v217 = v216.UIScale;
							v218 = {
								Scale = 1
							};
							local l_Back_4 = Enum.EasingStyle.Back;
							local v220 = TweenInfo.new(0.3, l_Back_4 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v217, v220, v218):Play();
							v217 = v216.Message;
							v218 = {
								MaxVisibleGraphemes = #v213
							};
							l_Back_4 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v217, l_Back_4, v218):Play();
							wait(v214 or 4);
							v217 = {
								Transparency = 1
							};
							v218 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v216, v218, v217):Play();
							v217 = v216.UIScale;
							v218 = {
								Scale = 0
							};
							l_Back_4 = Enum.EasingStyle.Back;
							v220 = TweenInfo.new(0.5, l_Back_4 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v217, v220, v218):Play();
							wait(0.5);
							v216:Destroy();
						end;
					end;
				end);
				return;
			else
				v30.Function("JoinVoiceChatServer"):InvokeServer(v206.id, v206.isDeluxe);
				return;
			end;
		end);
	end;
end;
if v27.IsVoiceChatOnly then
	l_ServerSelector_0.Frame.SpecificServer.Title.Text = "NORMAL SERVERS";
end;
l_ServerSelector_0.Frame.SpecificServer.Join.Activated:Connect(function() --[[ Line: 765 ]]
	if v27.IsVoiceChatOnly then
		l_ServerSelector_0.Frame.SpecificServer.Join.Activated:Connect(function() --[[ Line: 767 ]]
			l_TeleportService_0:Teleport(v27.LivePlaceId, l_LocalPlayer_0);
		end);
		return;
	elseif not v47 then
		local l_spawn_3 = spawn;
		local v223 = "danger";
		local v224 = "you must have voice chat enabled to join!";
		local v225 = nil;
		l_spawn_3(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v223 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v226 = l_UITemplates_0[v223 .. "Popup"];
				if not v226 then
					print("NOPE");
					return;
				else
					local v227 = v226:Clone();
					v227.Message.Text = v224;
					v227.Transparency = 1;
					v227.UIScale.Scale = 0;
					v227.Parent = l_ScreenGui_0.Popups;
					local v228 = {
						Transparency = 0
					};
					local v229 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v227, v229, v228):Play();
					v228 = v227.UIScale;
					v229 = {
						Scale = 1
					};
					local l_Back_5 = Enum.EasingStyle.Back;
					local v231 = TweenInfo.new(0.3, l_Back_5 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v228, v231, v229):Play();
					v228 = v227.Message;
					v229 = {
						MaxVisibleGraphemes = #v224
					};
					l_Back_5 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v228, l_Back_5, v229):Play();
					wait(v225 or 4);
					v228 = {
						Transparency = 1
					};
					v229 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v227, v229, v228):Play();
					v228 = v227.UIScale;
					v229 = {
						Scale = 0
					};
					l_Back_5 = Enum.EasingStyle.Back;
					v231 = TweenInfo.new(0.5, l_Back_5 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v228, v231, v229):Play();
					wait(0.5);
					v227:Destroy();
				end;
			end;
		end);
		return;
	else
		l_ServerSelector_0.Frame.SpecificServer.Join.Activated:Connect(function() --[[ Line: 775 ]]
			l_TeleportService_0:Teleport(v27.VoiceChatOnlyPlaceId, l_LocalPlayer_0);
		end);
		return;
	end;
end);
l_ServerSelector_0.Frame.VIPServer.Join.Activated:Connect(function() --[[ Line: 781 ]]
	if v30.Function("AmIVip"):InvokeServer() then
		if not v47 then
			local l_spawn_4 = spawn;
			local v233 = "danger";
			local v234 = "you must have voice chat enabled to join!";
			local v235 = nil;
			l_spawn_4(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v233 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v236 = l_UITemplates_0[v233 .. "Popup"];
					if not v236 then
						print("NOPE");
						return;
					else
						local v237 = v236:Clone();
						v237.Message.Text = v234;
						v237.Transparency = 1;
						v237.UIScale.Scale = 0;
						v237.Parent = l_ScreenGui_0.Popups;
						local v238 = {
							Transparency = 0
						};
						local v239 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v237, v239, v238):Play();
						v238 = v237.UIScale;
						v239 = {
							Scale = 1
						};
						local l_Back_6 = Enum.EasingStyle.Back;
						local v241 = TweenInfo.new(0.3, l_Back_6 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v238, v241, v239):Play();
						v238 = v237.Message;
						v239 = {
							MaxVisibleGraphemes = #v234
						};
						l_Back_6 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v238, l_Back_6, v239):Play();
						wait(v235 or 4);
						v238 = {
							Transparency = 1
						};
						v239 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v237, v239, v238):Play();
						v238 = v237.UIScale;
						v239 = {
							Scale = 0
						};
						l_Back_6 = Enum.EasingStyle.Back;
						v241 = TweenInfo.new(0.5, l_Back_6 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v238, v241, v239):Play();
						wait(0.5);
						v237:Destroy();
					end;
				end;
			end);
			return;
		else
			l_TeleportService_0:Teleport(v27.DeluxeVoiceChatOnlyPlaceId, l_LocalPlayer_0);
			return;
		end;
	else
		local l_spawn_5 = spawn;
		local v243 = "danger";
		local v244 = "you need to subscribe to VIP to unlock this!";
		local v245 = nil;
		l_spawn_5(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v243 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v246 = l_UITemplates_0[v243 .. "Popup"];
				if not v246 then
					print("NOPE");
					return;
				else
					local v247 = v246:Clone();
					v247.Message.Text = v244;
					v247.Transparency = 1;
					v247.UIScale.Scale = 0;
					v247.Parent = l_ScreenGui_0.Popups;
					local v248 = {
						Transparency = 0
					};
					local v249 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v247, v249, v248):Play();
					v248 = v247.UIScale;
					v249 = {
						Scale = 1
					};
					local l_Back_7 = Enum.EasingStyle.Back;
					local v251 = TweenInfo.new(0.3, l_Back_7 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v248, v251, v249):Play();
					v248 = v247.Message;
					v249 = {
						MaxVisibleGraphemes = #v244
					};
					l_Back_7 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v248, l_Back_7, v249):Play();
					wait(v245 or 4);
					v248 = {
						Transparency = 1
					};
					v249 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v247, v249, v248):Play();
					v248 = v247.UIScale;
					v249 = {
						Scale = 0
					};
					l_Back_7 = Enum.EasingStyle.Back;
					v251 = TweenInfo.new(0.5, l_Back_7 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v248, v251, v249):Play();
					wait(0.5);
					v247:Destroy();
				end;
			end;
		end);
		return;
	end;
end);
l_ServerSelector_0.Frame.LegacyServer.Join.Activated:Connect(function() --[[ Line: 795 ]]
	l_TeleportService_0:Teleport(v27.LegacyMapPlaceId, l_LocalPlayer_0);
end);
l_ServerSelector_0.Frame.SeventeenServer.Join.Activated:Connect(function() --[[ Line: 799 ]]
	l_TeleportService_0:Teleport(0, l_LocalPlayer_0);
end);
l_ServerSelector_0.TopFrame.Buttons.Refresh.Activated:Connect(function() --[[ Line: 803 ]]
	v221();
end);
task.spawn(function() --[[ Line: 807 ]]
	l_ServerSelector_0:GetPropertyChangedSignal("Visible"):Wait();
	v221();
end);
local l_SurfaceGui_0 = Instance.new("SurfaceGui");
l_SurfaceGui_0.ResetOnSpawn = false;
l_SurfaceGui_0.Name = "MapUIContainer";
task.defer(function() --[[ Line: 818 ]]
	workspace.MapUI.Parent = l_SurfaceGui_0;
	l_SurfaceGui_0.Parent = l_PlayerGui_0;
end);
local function v257(v253, v254) --[[ Line: 823 ]] --[[ Name: findCurrentlyHoveredItemFrame ]]
	if v253 then
		if l_GuiService_0.SelectedObject and l_CollectionService_0:HasTag(l_GuiService_0.SelectedObject, "ItemFrame") then
			return l_GuiService_0.SelectedObject;
		end;
	elseif v254 == nil then
		return;
	else
		for _, v256 in l_PlayerGui_0:GetGuiObjectsAtPosition(v254.X, v254.Y) do
			if l_CollectionService_0:HasTag(v256, "ItemFrame") then
				return v256;
			end;
		end;
	end;
end;
local v258 = v24.State();
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 845 ]]
	local v259 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1;
	local l_l_UserInputService_0_MouseLocation_1 = l_LocalPlayer_0:GetMouse();
	local v261 = v257(v259, l_l_UserInputService_0_MouseLocation_1);
	v258:set(v261);
	if v259 then
		l_ScreenGui_0.ButtonInfo.Position = UDim2.new(0.5, -script.Parent.ButtonInfo.AbsoluteSize.X / 2, 0.6, -script.Parent.ButtonInfo.AbsoluteSize.Y / 2);
		l_ScreenGui_0.BoothInfo.Position = UDim2.new(0.5, -script.Parent.BoothInfo.AbsoluteSize.X / 2, 0.6, -script.Parent.BoothInfo.AbsoluteSize.Y / 2);
		l_ScreenGui_0.HintInfo.Position = UDim2.new(0.5, -script.Parent.BoothInfo.AbsoluteSize.X / 2, 0.6, -script.Parent.BoothInfo.AbsoluteSize.Y / 2)
		return;
	else
		local l_l_UserInputService_0_MouseLocation_2 = l_UserInputService_0:GetMouseLocation();
		l_ScreenGui_0.ButtonInfo.Position = UDim2.new(0, l_l_UserInputService_0_MouseLocation_2.X, 0, l_l_UserInputService_0_MouseLocation_2.Y);
		l_ScreenGui_0.BoothInfo.Position = UDim2.new(0, l_l_UserInputService_0_MouseLocation_2.X, 0, l_l_UserInputService_0_MouseLocation_2.Y);
		l_ScreenGui_0.HintInfo.Position = UDim2.new(0, l_l_UserInputService_0_MouseLocation_2.X + 10, 0, l_l_UserInputService_0_MouseLocation_2.Y + 10)
		return;
	end;
end);
local function _(v263, v264) --[[ Line: 863 ]] --[[ Name: checkOwned ]]
	if v264 == "Gamepass" then
		return l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, v263);
	else
		return l_MarketplaceService_0:PlayerOwnsAsset(l_LocalPlayer_0, v263);
	end;
end;
local v266 = nil;
local function _() --[[ Line: 874 ]] --[[ Name: currentHoveredItemFrame ]]
	if v266 and v266:IsDescendantOf(game) then
		return v266;
	else
		return nil;
	end;
end;
local v268 = v23.resolve();
v24.Compat(v258):onChange(function() --[[ Line: 882 ]]
	v268:cancel();
	local v269 = v258:get();
	if v266 and v266:IsDescendantOf(game) then
		local l_v266_0 = v266;
		local v271 = {
			BackgroundColor3 = v266:GetAttribute("IdleColor")
		};
		local v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_v266_0, v272, v271):Play();
		l_v266_0 = v266.UIScale;
		v271 = {
			Scale = 1
		};
		v272 = Enum.EasingStyle.Back;
		local v273 = TweenInfo.new(0.25, v272 or Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_v266_0, v273, v271):Play();
		if v266:FindFirstChild("ImageLabel") then
			if v266.ImageLabel:FindFirstChild("Price") then
				l_v266_0 = v266.ImageLabel.Price;
				v271 = {
					Size = UDim2.new(0.8, 0, 0.25, 0)
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
				l_v266_0 = v266.ImageLabel.Price;
				v271 = {
					TextTransparency = 0
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
				l_v266_0 = v266.UIStroke;
				v271 = {
					Transparency = 0
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
				l_v266_0 = v266;
				v271 = {
					BackgroundTransparency = 0.9
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
			else
				l_v266_0 = v266.ImageLabel;
				v271 = {
					Size = UDim2.new(0.7, 0, 0.7, 0)
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
				l_v266_0 = v266.Price;
				v271 = {
					Size = UDim2.new(0.8, 0, 0.25, 0)
				};
				v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v266_0, v272, v271):Play();
			end;
		end;
		if v266:GetAttribute("MeshId") and v266.Parent.Parent.Adornee.Parent:FindFirstChild("MeshDisplay") then
			l_v266_0 = v266.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh;
			v271 = {
				Scale = Vector3.new(0, 0, 0, 0)
			};
			v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v266_0, v272, v271):Play();
			l_v266_0 = v266.Parent.Parent.Adornee.Parent.MeshDisplay;
			v271 = {
				Transparency = 1
			};
			v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v266_0, v272, v271):Play();
			v266.Parent.Parent.Adornee.Parent.MeshDisplay.Beam.Enabled = false;
		end;
	end;
	if v269 then
		local v274 = {
			BackgroundColor3 = v269:GetAttribute("HoverColor")
		};
		local v275 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v269, v275, v274):Play();
		v274 = v269.UIScale;
		v275 = {
			Scale = 1.2
		};
		local l_Back_8 = Enum.EasingStyle.Back;
		local v277 = TweenInfo.new(0.25, l_Back_8 or Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v274, v277, v275):Play();
		if v269:FindFirstChild("ImageLabel") then
			if v269.ImageLabel:FindFirstChild("Price") then
				v274 = v269.ImageLabel.Price;
				v275 = {
					Size = UDim2.new(0.8, 0, 0, 0)
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v274 = v269.ImageLabel.Price;
				v275 = {
					TextTransparency = 1
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v274 = v269.UIStroke;
				v275 = {
					Transparency = 1
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v274 = {
					BackgroundTransparency = 1
				};
				v275 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v269, v275, v274):Play();
			else
				v274 = v269.ImageLabel;
				v275 = {
					Size = UDim2.new(0.9, 0, 0.9, 0)
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v274 = v269.Price;
				v275 = {
					Size = UDim2.new(0, 0, 0, 0)
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
			end;
		end;
		if v269:GetAttribute("MeshId") then
			if v269.Parent.Parent.Adornee.Parent:FindFirstChild("MeshDisplay") then
				v274 = v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh;
				v275 = {
					Scale = Vector3.new(1, 1, 1, 0)
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v274 = v269.Parent.Parent.Adornee.Parent.MeshDisplay;
				v275 = {
					Transparency = 0.1
				};
				l_Back_8 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v274, l_Back_8, v275):Play();
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.Beam.Enabled = true;
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh.MeshId = v269:GetAttribute("MeshId");
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh.TextureId = v269:GetAttribute("TextureId");
				print(v269:GetAttribute("MeshId"), v269:GetAttribute("TextureId"));
			elseif v269.Parent.Parent.Adornee.Parent:FindFirstChild("SignPart") then
				v274 = l_Templates_0.MeshDisplay:Clone();
				v274.CFrame = v269.Parent.Parent.Adornee.Parent.PrimaryPart.CFrame * CFrame.new((Vector3.new(0, 5, -5, 0)));
				v274.Parent = v269.Parent.Parent.Adornee.Parent;
				l_CollectionService_0:AddTag(v274, "Bobbing");
				v275 = v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh;
				l_Back_8 = {
					Scale = Vector3.new(1, 1, 1, 0)
				};
				v277 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v275, v277, l_Back_8):Play();
				v275 = v269.Parent.Parent.Adornee.Parent.MeshDisplay;
				l_Back_8 = {
					Transparency = 0.1
				};
				v277 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v275, v277, l_Back_8):Play();
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.Beam.Enabled = true;
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh.MeshId = v269:GetAttribute("MeshId");
				v269.Parent.Parent.Adornee.Parent.MeshDisplay.SpecialMesh.TextureId = v269:GetAttribute("TextureId");
				print(v269:GetAttribute("MeshId"), v269:GetAttribute("TextureId"));
			end;
		end;
	end;
	v266 = v269;
	task.spawn(function() --[[ Line: 953 ]]
		if l_UserInputService_0:IsKeyDown(Enum.KeyCode.G) then
			return;
		elseif v269 then
			local l_v269_Attribute_0 = v269:GetAttribute("AssetId");
			local l_v269_Attribute_1 = v269:GetAttribute("AssetType");
			local l_v269_Attribute_2 = v269:GetAttribute("AssetPrice");
			local l_v269_Attribute_3 = v269:GetAttribute("AssetImage");
			local l_v269_Attribute_4 = v269:GetAttribute("AssetName");
			local l_v269_Attribute_5 = v269:GetAttribute("CreatorId");
			script.Activity.Value = ("Hovering on %* Robux button"):format(l_v269_Attribute_2);
			l_ScreenGui_0.ButtonInfo.Icon.Owned.Visible = false;
			l_ScreenGui_0.ButtonInfo.Giftbux.Visible = not v269:GetAttribute("IsOffline");
			if l_LocalPlayer_0.UserId ~= l_v269_Attribute_5 then
				v268 = v23.delay(0.5):andThen(function() --[[ Line: 970 ]]
					local l_l_v269_Attribute_0_0 = l_v269_Attribute_0;
					if if l_v269_Attribute_1 == "Gamepass" then l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, l_l_v269_Attribute_0_0) else l_MarketplaceService_0:PlayerOwnsAsset(l_LocalPlayer_0, l_l_v269_Attribute_0_0) then
						l_ScreenGui_0.ButtonInfo.Icon.Owned.Visible = true;
					end;
				end);
			else
				l_ScreenGui_0.ButtonInfo.Giftbux.Visible = false;
			end;
			l_ScreenGui_0.ButtonInfo.UIListLayout.Padding = UDim.new(0, 20);
			local l_UIListLayout_0 = l_ScreenGui_0.ButtonInfo.UIListLayout;
			local v286 = {
				Padding = UDim.new(0, 4)
			};
			local v287 = TweenInfo.new(0.3, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_UIListLayout_0, v287, v286):Play();
			l_ScreenGui_0.ButtonInfo.GroupTransparency = 1;
			l_UIListLayout_0 = l_ScreenGui_0.ButtonInfo;
			v286 = {
				GroupTransparency = 0
			};
			v287 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_UIListLayout_0, v287, v286):Play();
			l_ScreenGui_0.ButtonInfo.Icon.ImageLabel.Image = l_v269_Attribute_3;
			l_ScreenGui_0.ButtonInfo.ItemName.Text = l_v269_Attribute_4;
			l_ScreenGui_0.ButtonInfo.Tags.Type.Text = l_v269_Attribute_1 or "Unknown Type";
			l_ScreenGui_0.ButtonInfo.Price.TextLabel.Text = v26.formatCommas(l_v269_Attribute_2);
			l_ScreenGui_0.ButtonInfo.Giftbux.TextLabel.Text = math.floor(math.sqrt(l_v269_Attribute_2) * 5);
			l_l_LocalPlayer_0_Mouse_0.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png";
			if not v157 then
				l_ScreenGui_0.ButtonInfo.Visible = true;
			end;
			l_SoundService_0.SFX.Hover:Play();
			return;
		else
			l_l_LocalPlayer_0_Mouse_0.Icon = "";
			l_ScreenGui_0.ButtonInfo.Visible = false;
			script.Activity.Value = "In Lobby";
			return;
		end;
	end);
end);
l_UserInputService_0.InputBegan:Connect(function(v288, v289) --[[ Line: 1020 ]]
	local v290 = if v266 and v266:IsDescendantOf(game) then v266 else nil;
	if v290 then
		if not v289 and v288.KeyCode == Enum.KeyCode.G and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
			local l_v290_Attribute_0 = v290:GetAttribute("AssetType");
			local l_v290_Attribute_1 = v290:GetAttribute("AssetId");
			if l_v290_Attribute_0 == "Gamepass" then
				local v293 = ("https://www.roblox.com/game-pass/%*/"):format(l_v290_Attribute_1);
				l_ScreenGui_0.Prompt.TopFrame.Title.Text = "CONTINUE";
				l_ScreenGui_0.Prompt.Frame.Message.Text = v293;
				l_ScreenGui_0.Prompt.Visible = true;
			else
				local v294 = ("https://www.roblox.com/catalog/%*/"):format(l_v290_Attribute_1);
				l_ScreenGui_0.Prompt.TopFrame.Title.Text = "CONTINUE";
				l_ScreenGui_0.Prompt.Frame.Message.Text = v294;
				l_ScreenGui_0.Prompt.Visible = true;
			end;
		end;
		if v288.UserInputType == Enum.UserInputType.MouseButton1 then
			local l_UIScale_0 = v290.UIScale;
			local v296 = {
				Scale = 1.5
			};
			local v297 = TweenInfo.new(0.1, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_UIScale_0, v297, v296):Play();
		end;
	end;
end);
l_UserInputService_0.InputEnded:Connect(function(v298, _) --[[ Line: 1038 ]]
	local v300 = if v266 and v266:IsDescendantOf(game) then v266 else nil;
	if v300 and v298.UserInputType == Enum.UserInputType.MouseButton1 then
		local l_UIScale_1 = v300.UIScale;
		local v302 = {
			Scale = 1.3
		};
		local v303 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_UIScale_1, v303, v302):Play();
	end;
end);
local function _() --[[ Line: 1047 ]] --[[ Name: getGiftMessage ]]
	local v304 = l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:GetAttribute("Value") == true;
	return l_ScreenGui_0.Gift.Frame.Message.Text, v304;
end;
local function v310(v306) --[[ Line: 1052 ]] --[[ Name: forItemFrame ]]
	v306.Activated:Connect(function(_) --[[ Line: 1053 ]]
		l_SoundService_0.SFX.Click:Play();
		local v308 = l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:GetAttribute("Value") == true;
		local l_Text_0 = l_ScreenGui_0.Gift.Frame.Message.Text;
		v306.Prompt:FireServer(l_Text_0, v308, v306:GetAttribute("AssetPrice"));
	end);
end;
for _, v312 in pairs(l_CollectionService_0:GetTagged("ItemFrame")) do
	v312.Activated:Connect(function(_) --[[ Line: 1053 ]]
		l_SoundService_0.SFX.Click:Play();
		local v314 = l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:GetAttribute("Value") == true;
		local l_Text_1 = l_ScreenGui_0.Gift.Frame.Message.Text;
		v312.Prompt:FireServer(l_Text_1, v314, v312:GetAttribute("AssetPrice"));
	end);
end;
l_CollectionService_0:GetInstanceAddedSignal("ItemFrame"):Connect(v310);
if v27.IsLegacyMap then
	workspace.Map.FakeSign.TextSign.ProximityPrompt.Triggered:Connect(function() --[[ Line: 1066 ]]
		l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 1679943835);
	end);
end;
local v316 = v30.Event("RedeemCode");
local v317 = false;
l_ScreenGui_0.Redeem.Frame.Redeem.Activated:Connect(function() --[[ Line: 1074 ]]
	if v317 == false then
		v317 = true;
		v78(true);
		v316:FireServer(l_ScreenGui_0.Redeem.Frame.TextBox.Text);
	end;
end);
local function v343() --[[ Line: 1100 ]] --[[ Name: applyCustomization ]]
	local l_Attribute_1 = l_ScreenGui_0.EditBooth.Frame.TextSetting:GetAttribute("Value");
	local v321 = Enum.Font[l_ScreenGui_0.EditBooth.Frame.TextFontSetting:GetAttribute("Value")];
	local l_Attribute_2 = l_ScreenGui_0.EditBooth.Frame.TextColorSetting:GetAttribute("Value");
	local l_Attribute_3 = l_ScreenGui_0.EditBooth.Frame.StrokeColorSetting:GetAttribute("Value");
	local l_Attribute_4 = l_ScreenGui_0.EditBooth.Frame.StrokeOpacitySetting:GetAttribute("Value");
	local l_Attribute_5 = l_ScreenGui_0.EditBooth.Frame.RichTextSetting:GetAttribute("Value");
	local v326 = Enum.Font[l_ScreenGui_0.EditBooth.Frame.ButtonTextFontSetting:GetAttribute("Value")];
	local l_Attribute_6 = l_ScreenGui_0.EditBooth.Frame.ButtonTextColorSetting:GetAttribute("Value");
	local l_Attribute_7 = l_ScreenGui_0.EditBooth.Frame.ButtonStrokeColorSetting:GetAttribute("Value");
	local l_Attribute_8 = l_ScreenGui_0.EditBooth.Frame.ButtonBackColorSetting:GetAttribute("Value");
	local l_Attribute_9 = l_ScreenGui_0.EditBooth.Frame.ButtonHoverColorSetting:GetAttribute("Value");
	local l_Attribute_10 = l_ScreenGui_0.EditBooth.Frame.ButtonLayoutSetting:GetAttribute("Value");
	local v332 = {
		text = l_Attribute_1, 
		textFont = v321, 
		textColor = l_Attribute_2, 
		strokeColor = l_Attribute_3, 
		strokeOpacity = l_Attribute_4, 
		richText = l_Attribute_5, 
		buttonTextFont = v326, 
		buttonTextColor = l_Attribute_6, 
		buttonStrokeColor = l_Attribute_7, 
		buttonHoverColor = l_Attribute_9, 
		buttonColor = l_Attribute_8, 
		buttonLayout = l_Attribute_10
	};
	v30.Event("SetCustomization"):FireServer(v332, "booth");
	l_ScreenGui_0.Debug.Text = ("%* \n %* \n %* \n %* \n %* \n %*"):format(l_Attribute_1, v321, l_Attribute_2, l_Attribute_3, l_Attribute_4, l_Attribute_5);
	local l_spawn_6 = spawn;
	local v334 = "success";
	local v335 = "applied!";
	local v336 = nil;
	l_spawn_6(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v334 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v337 = l_UITemplates_0[v334 .. "Popup"];
			if not v337 then
				print("NOPE");
				return;
			else
				local v338 = v337:Clone();
				v338.Message.Text = v335;
				v338.Transparency = 1;
				v338.UIScale.Scale = 0;
				v338.Parent = l_ScreenGui_0.Popups;
				local v339 = {
					Transparency = 0
				};
				local v340 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v338, v340, v339):Play();
				v339 = v338.UIScale;
				v340 = {
					Scale = 1
				};
				local l_Back_9 = Enum.EasingStyle.Back;
				local v342 = TweenInfo.new(0.3, l_Back_9 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v339, v342, v340):Play();
				v339 = v338.Message;
				v340 = {
					MaxVisibleGraphemes = #v335
				};
				l_Back_9 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v339, l_Back_9, v340):Play();
				wait(v336 or 4);
				v339 = {
					Transparency = 1
				};
				v340 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v338, v340, v339):Play();
				v339 = v338.UIScale;
				v340 = {
					Scale = 0
				};
				l_Back_9 = Enum.EasingStyle.Back;
				v342 = TweenInfo.new(0.5, l_Back_9 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v339, v342, v340):Play();
				wait(0.5);
				v338:Destroy();
			end;
		end;
	end);
end;
for _, v345 in pairs(l_ScreenGui_0.EditBooth.Frame:GetChildren()) do
	if v345:IsA("TextButton") then
		v345:GetAttributeChangedSignal("ValueChanged"):Connect(function() --[[ Line: 1136 ]]
			v343();
		end);
	end;
end;
task.spawn(function() --[[ Line: 1147 ]]
	displayToggle(l_ScreenGui_0.Gift.Frame.GiftWrappingSetting, false);
	l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:SetAttribute("Value", false);
	if not v30.Function("AmIVip"):InvokeServer() then
		l_ScreenGui_0.EditBooth.Frame.ButtonLayoutSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.EditBooth.Frame.ButtonTextFontSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.EditBooth.Frame.ButtonTextColorSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.EditBooth.Frame.ButtonBackColorSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.EditBooth.Frame.ButtonStrokeColorSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.EditBooth.Frame.ButtonHoverColorSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
		l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:SetAttribute("Locked", "you have to subscribe to VIP to unlock this!");
	end;
end);
l_ScreenGui_0.EditBooth.TopFrame.Buttons.Refresh.Activated:Connect(function() --[[ Line: 1164 ]]
	l_SoundService_0.SFX.Click:Play();
	local l_Camera_3 = workspace.Camera;
	local v347 = {
		FieldOfView = 70
	};
	local v348 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
	l_TweenService_0:Create(l_Camera_3, v348, v347):Play();
	l_Camera_3 = l_Lighting_0.Blur;
	v347 = {
		Size = 0
	};
	v348 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
	l_TweenService_0:Create(l_Camera_3, v348, v347):Play();
	xpcall(function() --[[ Line: 1168 ]]
		local v349 = os.clock();
		v30.Function("RefreshItems"):InvokeServer();
		print(string.format("Refreshed items in %i ms", (os.clock() - v349) * 1000));
		local l_spawn_7 = spawn;
		local v351 = "success";
		local v352 = "refreshed!";
		local v353 = nil;
		l_spawn_7(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v351 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v354 = l_UITemplates_0[v351 .. "Popup"];
				if not v354 then
					print("NOPE");
					return;
				else
					local v355 = v354:Clone();
					v355.Message.Text = v352;
					v355.Transparency = 1;
					v355.UIScale.Scale = 0;
					v355.Parent = l_ScreenGui_0.Popups;
					local v356 = {
						Transparency = 0
					};
					local v357 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v355, v357, v356):Play();
					v356 = v355.UIScale;
					v357 = {
						Scale = 1
					};
					local l_Back_10 = Enum.EasingStyle.Back;
					local v359 = TweenInfo.new(0.3, l_Back_10 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v356, v359, v357):Play();
					v356 = v355.Message;
					v357 = {
						MaxVisibleGraphemes = #v352
					};
					l_Back_10 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v356, l_Back_10, v357):Play();
					wait(v353 or 4);
					v356 = {
						Transparency = 1
					};
					v357 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v355, v357, v356):Play();
					v356 = v355.UIScale;
					v357 = {
						Scale = 0
					};
					l_Back_10 = Enum.EasingStyle.Back;
					v359 = TweenInfo.new(0.5, l_Back_10 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v356, v359, v357):Play();
					wait(0.5);
					v355:Destroy();
				end;
			end;
		end);
		l_SoundService_0.SFX.Refresh:Play();
	end, function(v360) --[[ Line: 1174 ]]
		warn("Caught error when refreshing items: " .. v360);
		local l_spawn_8 = spawn;
		local v362 = "danger";
		local v363 = "Failed to refresh items!";
		local v364 = nil;
		l_spawn_8(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v362 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v365 = l_UITemplates_0[v362 .. "Popup"];
				if not v365 then
					print("NOPE");
					return;
				else
					local v366 = v365:Clone();
					v366.Message.Text = v363;
					v366.Transparency = 1;
					v366.UIScale.Scale = 0;
					v366.Parent = l_ScreenGui_0.Popups;
					local v367 = {
						Transparency = 0
					};
					local v368 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v366, v368, v367):Play();
					v367 = v366.UIScale;
					v368 = {
						Scale = 1
					};
					local l_Back_11 = Enum.EasingStyle.Back;
					local v370 = TweenInfo.new(0.3, l_Back_11 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v367, v370, v368):Play();
					v367 = v366.Message;
					v368 = {
						MaxVisibleGraphemes = #v363
					};
					l_Back_11 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v367, l_Back_11, v368):Play();
					wait(v364 or 4);
					v367 = {
						Transparency = 1
					};
					v368 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v366, v368, v367):Play();
					v367 = v366.UIScale;
					v368 = {
						Scale = 0
					};
					l_Back_11 = Enum.EasingStyle.Back;
					v370 = TweenInfo.new(0.5, l_Back_11 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v367, v370, v368):Play();
					wait(0.5);
					v366:Destroy();
				end;
			end;
		end);
	end);
end);
l_ScreenGui_0.EditBoothText.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 1180 ]]
	local l_Text_2 = l_ScreenGui_0.EditBoothText.Frame.TextBox.Text;
	local v372 = v30.Function("GetDonated"):InvokeServer();
	local v373 = v372 >= 1000 and 650 or v372 >= 500 and 500 or v372 >= 250 and 400 or v372 >= 100 and 350 or v372 >= 50 and 300 or 250;
	if v373 < string.len(l_Text_2) then
		l_SoundService_0.SFX.Fail:Play();
		local v374 = ("exceeded character limit %*"):format(v373);
		local l_spawn_9 = spawn;
		local v376 = "danger";
		local v377 = nil;
		l_spawn_9(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v376 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v378 = l_UITemplates_0[v376 .. "Popup"];
				if not v378 then
					print("NOPE");
					return;
				else
					local v379 = v378:Clone();
					v379.Message.Text = v374;
					v379.Transparency = 1;
					v379.UIScale.Scale = 0;
					v379.Parent = l_ScreenGui_0.Popups;
					local v380 = {
						Transparency = 0
					};
					local v381 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v379, v381, v380):Play();
					v380 = v379.UIScale;
					v381 = {
						Scale = 1
					};
					local l_Back_12 = Enum.EasingStyle.Back;
					local v383 = TweenInfo.new(0.3, l_Back_12 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v380, v383, v381):Play();
					v380 = v379.Message;
					v381 = {
						MaxVisibleGraphemes = #v374
					};
					l_Back_12 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v380, l_Back_12, v381):Play();
					wait(v377 or 4);
					v380 = {
						Transparency = 1
					};
					v381 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v379, v381, v380):Play();
					v380 = v379.UIScale;
					v381 = {
						Scale = 0
					};
					l_Back_12 = Enum.EasingStyle.Back;
					v383 = TweenInfo.new(0.5, l_Back_12 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v380, v383, v381):Play();
					wait(0.5);
					v379:Destroy();
				end;
			end;
		end);
		return;
	else
		l_SoundService_0.SFX.Success:Play();
		l_ScreenGui_0.EditBooth.Frame.TextSetting.Info.Text = l_Text_2;
		l_ScreenGui_0.EditBooth.Frame.TextSetting:SetAttribute("Value", l_Text_2);
		l_ScreenGui_0.EditBooth.Frame.TextSetting:SetAttribute("ValueChanged", l_Text_2);
		return;
	end;
end);
l_ScreenGui_0.EditSignText.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 1197 ]]
	local l_Text_3 = l_ScreenGui_0.EditSignText.Frame.TextBox.Text;
	local v385, v386 = v30.Function("SetSignText"):InvokeServer(l_Text_3);
	if not v385 then
		local l_spawn_10 = spawn;
		local v388 = "danger";
		local v389 = nil;
		l_spawn_10(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v388 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v390 = l_UITemplates_0[v388 .. "Popup"];
				if not v390 then
					print("NOPE");
					return;
				else
					local v391 = v390:Clone();
					v391.Message.Text = v386;
					v391.Transparency = 1;
					v391.UIScale.Scale = 0;
					v391.Parent = l_ScreenGui_0.Popups;
					local v392 = {
						Transparency = 0
					};
					local v393 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v391, v393, v392):Play();
					v392 = v391.UIScale;
					v393 = {
						Scale = 1
					};
					local l_Back_13 = Enum.EasingStyle.Back;
					local v395 = TweenInfo.new(0.3, l_Back_13 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v392, v395, v393):Play();
					v392 = v391.Message;
					v393 = {
						MaxVisibleGraphemes = #v386
					};
					l_Back_13 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v392, l_Back_13, v393):Play();
					wait(v389 or 4);
					v392 = {
						Transparency = 1
					};
					v393 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v391, v393, v392):Play();
					v392 = v391.UIScale;
					v393 = {
						Scale = 0
					};
					l_Back_13 = Enum.EasingStyle.Back;
					v395 = TweenInfo.new(0.5, l_Back_13 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v392, v395, v393):Play();
					wait(0.5);
					v391:Destroy();
				end;
			end;
		end);
		return;
	else
		local l_spawn_11 = spawn;
		local v397 = "success";
		local v398 = nil;
		l_spawn_11(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v397 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v399 = l_UITemplates_0[v397 .. "Popup"];
				if not v399 then
					print("NOPE");
					return;
				else
					local v400 = v399:Clone();
					v400.Message.Text = v386;
					v400.Transparency = 1;
					v400.UIScale.Scale = 0;
					v400.Parent = l_ScreenGui_0.Popups;
					local v401 = {
						Transparency = 0
					};
					local v402 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v400, v402, v401):Play();
					v401 = v400.UIScale;
					v402 = {
						Scale = 1
					};
					local l_Back_14 = Enum.EasingStyle.Back;
					local v404 = TweenInfo.new(0.3, l_Back_14 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v401, v404, v402):Play();
					v401 = v400.Message;
					v402 = {
						MaxVisibleGraphemes = #v386
					};
					l_Back_14 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v401, l_Back_14, v402):Play();
					wait(v398 or 4);
					v401 = {
						Transparency = 1
					};
					v402 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v400, v402, v401):Play();
					v401 = v400.UIScale;
					v402 = {
						Scale = 0
					};
					l_Back_14 = Enum.EasingStyle.Back;
					v404 = TweenInfo.new(0.5, l_Back_14 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v401, v404, v402):Play();
					wait(0.5);
					v400:Destroy();
				end;
			end;
		end);
		return;
	end;
end);
local function v406(v405) --[[ Line: 1207 ]] --[[ Name: boobmox ]]
	v405:WaitForChild("Box");
	v405.Box.ProximityPrompt.Triggered:Connect(function() --[[ Line: 1209 ]]
		if l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, 1683109606) then
			l_ScreenGui_0.EditBoomboxId.Boombox.Value = v405;
			l_ScreenGui_0.EditBoomboxId.Visible = true;
			return;
		else
			l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 1683109606);
			return;
		end;
	end);
end;
for _, v408 in pairs(l_CollectionService_0:GetTagged("Boombox")) do
	v408:WaitForChild("Box");
	v408.Box.ProximityPrompt.Triggered:Connect(function() --[[ Line: 1209 ]]
		if l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, 1683109606) then
			l_ScreenGui_0.EditBoomboxId.Boombox.Value = v408;
			l_ScreenGui_0.EditBoomboxId.Visible = true;
			return;
		else
			l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 1683109606);
			return;
		end;
	end);
end;
l_CollectionService_0:GetInstanceAddedSignal("Boombox"):Connect(v406);
l_ScreenGui_0.EditBoomboxId.Frame.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1224 ]]
	l_ScreenGui_0.EditBoomboxId.Frame.TextBox.Text = l_ScreenGui_0.EditBoomboxId.Frame.TextBox.Text:gsub("%D+", "");
end);
l_ScreenGui_0.EditBoomboxId.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 1228 ]]
	local l_Text_4 = l_ScreenGui_0.EditBoomboxId.Frame.TextBox.Text;
	v30.Event("ChangeMusic"):FireServer(l_Text_4, l_ScreenGui_0.EditBoomboxId.Boombox.Value);
	local v410 = ("set sound id to %*!"):format(l_Text_4);
	local l_spawn_12 = spawn;
	local v412 = "success";
	local v413 = nil;
	l_spawn_12(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v412 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v414 = l_UITemplates_0[v412 .. "Popup"];
			if not v414 then
				print("NOPE");
				return;
			else
				local v415 = v414:Clone();
				v415.Message.Text = v410;
				v415.Transparency = 1;
				v415.UIScale.Scale = 0;
				v415.Parent = l_ScreenGui_0.Popups;
				local v416 = {
					Transparency = 0
				};
				local v417 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v415, v417, v416):Play();
				v416 = v415.UIScale;
				v417 = {
					Scale = 1
				};
				local l_Back_15 = Enum.EasingStyle.Back;
				local v419 = TweenInfo.new(0.3, l_Back_15 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v416, v419, v417):Play();
				v416 = v415.Message;
				v417 = {
					MaxVisibleGraphemes = #v410
				};
				l_Back_15 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v416, l_Back_15, v417):Play();
				wait(v413 or 4);
				v416 = {
					Transparency = 1
				};
				v417 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v415, v417, v416):Play();
				v416 = v415.UIScale;
				v417 = {
					Scale = 0
				};
				l_Back_15 = Enum.EasingStyle.Back;
				v419 = TweenInfo.new(0.5, l_Back_15 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v416, v419, v417):Play();
				wait(0.5);
				v415:Destroy();
			end;
		end;
	end);
end);
local v420 = v22.mount(v22.createElement(v34, {
	leaderboard = {}
}), l_PlayerGui_0.ScreenGui.DonationLeaderboard.Frame.History);
l_ScreenGui_0.DonationLeaderboard:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1238 ]]
	local v421 = os.clock();
	local v422 = v30.Function("GetOurTopDonated"):InvokeServer();
	print(v422);
	print(string.format("Got top donated to us in %i ms", (os.clock() - v421) * 1000));
	v22.update(v420, v22.createElement(v34, {
		leaderboard = v422
	}));
end);
local v436 = 0;
l_ScreenGui_0.GiftBundle:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1278 ]]
	-- upvalues: l_ScreenGui_0 (copy), l_Players_0 (copy), l_UITemplates_0 (copy), l_TweenService_0 (copy), v436 (ref)
	if l_ScreenGui_0.GiftBundle.Visible then
		for _, v438 in l_ScreenGui_0.GiftBundle.Frame.Main.Players:GetChildren() do
			if v438:IsA("TextButton") then
				v438:Destroy();
			end;
		end;
		for _, v440 in l_Players_0:GetPlayers() do
			local v441 = l_UITemplates_0.UserGiftTemplate:Clone();
			v441.Frame.Username.Text = v440.Name;
			v441.Frame.Display.Text = v440.DisplayName;
			v441.Icon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v440.UserId .. "&w=420&h=420";
			v441.MouseEnter:Connect(function() --[[ Line: 1294 ]]
				-- upvalues: v441 (copy), l_TweenService_0 (ref)
				local l_v441_0 = v441;
				local v443 = {
					BackgroundTransparency = 0.25
				};
				local v444 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v441_0, v444, v443):Play();
			end);
			v441.MouseLeave:Connect(function() --[[ Line: 1298 ]]
				-- upvalues: v441 (copy), l_TweenService_0 (ref)
				local l_v441_1 = v441;
				local v446 = {
					BackgroundTransparency = 0
				};
				local v447 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_v441_1, v447, v446):Play();
			end);
			v441.Activated:Connect(function() --[[ Line: 1302 ]]
				-- upvalues: v436 (ref), v440 (copy), v441 (copy), l_TweenService_0 (ref), l_ScreenGui_0 (ref)
				if v436 == v440.UserId then
					v436 = nil;
					local l_v441_2 = v441;
					local v449 = {
						BackgroundColor3 = Color3.fromRGB(245, 245, 245)
					};
					local v450 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_2, v450, v449):Play();
					l_v441_2 = v441.Frame.Display;
					v449 = {
						TextColor3 = Color3.fromRGB(0, 0, 0)
					};
					v450 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_2, v450, v449):Play();
					l_v441_2 = v441.Frame.Username;
					v449 = {
						TextColor3 = Color3.fromRGB(0, 0, 0)
					};
					v450 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_2, v450, v449):Play();
					return;
				else
					v436 = v440.UserId;
					local l_v441_3 = v441;
					local v452 = {
						BackgroundColor3 = Color3.fromRGB(0, 195, 255)
					};
					local v453 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_3, v453, v452):Play();
					l_v441_3 = v441.Frame.Display;
					v452 = {
						TextColor3 = Color3.fromRGB(255, 255, 255)
					};
					v453 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_3, v453, v452):Play();
					l_v441_3 = v441.Frame.Username;
					v452 = {
						TextColor3 = Color3.fromRGB(255, 255, 255)
					};
					v453 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_v441_3, v453, v452):Play();
					for _, v455 in l_ScreenGui_0.GiftBundle.Frame.Main.Players:GetChildren() do
						if v455:IsA("TextButton") and v455 ~= v441 then
							local v456 = {
								BackgroundColor3 = Color3.fromRGB(245, 245, 245)
							};
							local v457 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v455, v457, v456):Play();
							v456 = v455.Frame.Display;
							v457 = {
								TextColor3 = Color3.fromRGB(0, 0, 0)
							};
							local v458 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v456, v458, v457):Play();
							v456 = v455.Frame.Username;
							v457 = {
								TextColor3 = Color3.fromRGB(0, 0, 0)
							};
							v458 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v456, v458, v457):Play();
						end;
					end;
					return;
				end;
			end);
			v441.Parent = l_ScreenGui_0.GiftBundle.Frame.Main.Players;
		end;
	end;
end);
local v459 = false;
l_ScreenGui_0.GiftBundle.Frame.Gift.Activated:Connect(function() --[[ Line: 1330 ]]
	if v459 == true then
		local l_spawn_13 = spawn;
		local v461 = "warn";
		local v462 = "you're on cooldown!";
		local v463 = nil;
		l_spawn_13(function()
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v461 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v464 = l_UITemplates_0[v461 .. "Popup"];
				if not v464 then
					print("NOPE");
					return;
				else
					local v465 = v464:Clone();
					v465.Message.Text = v462;
					v465.Transparency = 1;
					v465.UIScale.Scale = 0;
					v465.Parent = l_ScreenGui_0.Popups;
					local v466 = {
						Transparency = 0
					};
					local v467 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v465, v467, v466):Play();
					v466 = v465.UIScale;
					v467 = {
						Scale = 1
					};
					local l_Back_17 = Enum.EasingStyle.Back;
					local v469 = TweenInfo.new(0.3, l_Back_17 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v466, v469, v467):Play();
					v466 = v465.Message;
					v467 = {
						MaxVisibleGraphemes = #v462
					};
					l_Back_17 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v466, l_Back_17, v467):Play();
					wait(v463 or 4);
					v466 = {
						Transparency = 1
					};
					v467 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v465, v467, v466):Play();
					v466 = v465.UIScale;
					v467 = {
						Scale = 0
					};
					l_Back_17 = Enum.EasingStyle.Back;
					v469 = TweenInfo.new(0.5, l_Back_17 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v466, v469, v467):Play();
					wait(0.5);
					v465:Destroy();
				end;
			end;
		end);
		return;
	else
		v459 = true;
		spawn(function()
			task.wait(4);
			v459 = false;
		end);
		if v436 == nil then
			local l_spawn_14 = spawn;
			local v471 = "danger";
			local v472 = "select a player to gift!";
			local v473 = nil;
			l_spawn_14(function()
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v471 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v474 = l_UITemplates_0[v471 .. "Popup"];
					if not v474 then
						print("NOPE");
						return;
					else
						local v475 = v474:Clone();
						v475.Message.Text = v472;
						v475.Transparency = 1;
						v475.UIScale.Scale = 0;
						v475.Parent = l_ScreenGui_0.Popups;
						local v476 = {
							Transparency = 0
						};
						local v477 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v475, v477, v476):Play();
						v476 = v475.UIScale;
						v477 = {
							Scale = 1
						};
						local l_Back_18 = Enum.EasingStyle.Back;
						local v479 = TweenInfo.new(0.3, l_Back_18 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v476, v479, v477):Play();
						v476 = v475.Message;
						v477 = {
							MaxVisibleGraphemes = #v472
						};
						l_Back_18 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v476, l_Back_18, v477):Play();
						wait(v473 or 4);
						v476 = {
							Transparency = 1
						};
						v477 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v475, v477, v476):Play();
						v476 = v475.UIScale;
						v477 = {
							Scale = 0
						};
						l_Back_18 = Enum.EasingStyle.Back;
						v479 = TweenInfo.new(0.5, l_Back_18 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v476, v479, v477):Play();
						wait(0.5);
						v475:Destroy();
					end;
				end;
			end);
			return;
		else
			local l_PlayerByUserId_0 = game.Players:GetPlayerByUserId(v436);
			if not l_PlayerByUserId_0 then
				local l_spawn_15 = spawn;
				local v482 = "danger";
				local v483 = "Recipient is no longer in the server!";
				local v484 = nil;
				l_spawn_15(function() --[[ Line: 99 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v482 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v485 = l_UITemplates_0[v482 .. "Popup"];
						if not v485 then
							print("NOPE");
							return;
						else
							local v486 = v485:Clone();
							v486.Message.Text = v483;
							v486.Transparency = 1;
							v486.UIScale.Scale = 0;
							v486.Parent = l_ScreenGui_0.Popups;
							local v487 = {
								Transparency = 0
							};
							local v488 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v486, v488, v487):Play();
							v487 = v486.UIScale;
							v488 = {
								Scale = 1
							};
							local l_Back_19 = Enum.EasingStyle.Back;
							local v490 = TweenInfo.new(0.3, l_Back_19 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v487, v490, v488):Play();
							v487 = v486.Message;
							v488 = {
								MaxVisibleGraphemes = #v483
							};
							l_Back_19 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v487, l_Back_19, v488):Play();
							wait(v484 or 4);
							v487 = {
								Transparency = 1
							};
							v488 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v486, v488, v487):Play();
							v487 = v486.UIScale;
							v488 = {
								Scale = 0
							};
							l_Back_19 = Enum.EasingStyle.Back;
							v490 = TweenInfo.new(0.5, l_Back_19 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v487, v490, v488):Play();
							wait(0.5);
							v486:Destroy();
						end;
					end;
				end);
				return;
			else
				local _ = nil;
				if v30.Function("HasBooth"):InvokeServer(l_PlayerByUserId_0, "CarouselBooth") then
					local l_spawn_16 = spawn;
					local v493 = "danger";
					local v494 = "Recipient already has this bundle & is taken, try gifting someone else!";
					local v495 = nil;
					l_spawn_16(function() --[[ Line: 99 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v493 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v496 = l_UITemplates_0[v493 .. "Popup"];
							if not v496 then
								print("NOPE");
								return;
							else
								local v497 = v496:Clone();
								v497.Message.Text = v494;
								v497.Transparency = 1;
								v497.UIScale.Scale = 0;
								v497.Parent = l_ScreenGui_0.Popups;
								local v498 = {
									Transparency = 0
								};
								local v499 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v497, v499, v498):Play();
								v498 = v497.UIScale;
								v499 = {
									Scale = 1
								};
								local l_Back_20 = Enum.EasingStyle.Back;
								local v501 = TweenInfo.new(0.3, l_Back_20 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v498, v501, v499):Play();
								v498 = v497.Message;
								v499 = {
									MaxVisibleGraphemes = #v494
								};
								l_Back_20 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v498, l_Back_20, v499):Play();
								wait(v495 or 4);
								v498 = {
									Transparency = 1
								};
								v499 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v497, v499, v498):Play();
								v498 = v497.UIScale;
								v499 = {
									Scale = 0
								};
								l_Back_20 = Enum.EasingStyle.Back;
								v501 = TweenInfo.new(0.5, l_Back_20 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v498, v501, v499):Play();
								wait(0.5);
								v497:Destroy();
							end;
						end;
					end);
					return;
				else
					local v502 = v30.Function("GiftBundle"):InvokeServer(v436);
					print(v502);
					return;
				end;
			end;
		end;
	end;
end);

v30.OnClientEvent("AdReward"):Connect(function(v516, v517) --[[ Line: 1423 ]]
	if v516 == "available" then
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Text = "WATCH AD";
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.BackgroundColor3 = Color3.fromRGB(255, 0, 132);
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.AutoButtonColor = true;
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Target.Value = v517;
		return;
	elseif v516 == "unavailable" then
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Text = "CURRENTLY UNAVAILABLE";
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.BackgroundColor3 = Color3.fromRGB(161, 161, 161);
		l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.AutoButtonColor = false;
		return;
	else
		if v516 == "awarded" then
			local l_spawn_16 = spawn;
			local v519 = "success";
			local v520 = "you were rewarded 5 giftbux!";
			local v521 = nil;
			l_spawn_16(function() --[[ Line: 99 ]]
				-- upvalues: l_ScreenGui_0 (ref), v519 (copy), l_SoundService_0 (ref), l_UITemplates_0 (ref), v520 (copy), l_TweenService_0 (ref), v521 (copy)
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v519 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v522 = l_UITemplates_0[v519 .. "Popup"];
					if not v522 then
						print("NOPE");
						return;
					else
						local v523 = v522:Clone();
						v523.Message.Text = v520;
						v523.Transparency = 1;
						v523.UIScale.Scale = 0;
						v523.Parent = l_ScreenGui_0.Popups;
						local v524 = {
							Transparency = 0
						};
						local v525 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v523, v525, v524):Play();
						v524 = v523.UIScale;
						v525 = {
							Scale = 1
						};
						local l_Back_20 = Enum.EasingStyle.Back;
						local v527 = TweenInfo.new(0.3, l_Back_20 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v524, v527, v525):Play();
						v524 = v523.Message;
						v525 = {
							MaxVisibleGraphemes = #v520
						};
						l_Back_20 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v524, l_Back_20, v525):Play();
						wait(v521 or 4);
						v524 = {
							Transparency = 1
						};
						v525 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v523, v525, v524):Play();
						v524 = v523.UIScale;
						v525 = {
							Scale = 0
						};
						l_Back_20 = Enum.EasingStyle.Back;
						v527 = TweenInfo.new(0.5, l_Back_20 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v524, v527, v525):Play();
						wait(0.5);
						v523:Destroy();
					end;
				end;
			end);
		end;
		return;
	end;
end);
l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Activated:Connect(function() --[[ Line: 1438 ]]
	if l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.AutoButtonColor == true then
		local l_Value_0 = l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Target.Value;
		l_Players_0.LocalPlayer.Character:MoveTo(l_Value_0.Parent);
		local l_spawn_17 = spawn;
		local v530 = "success";
		local v531 = "teleported to ad!";
		local v532 = nil;
		l_spawn_17(function() --[[ Line: 99 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v530 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v533 = l_UITemplates_0[v530 .. "Popup"];
				if not v533 then
					print("NOPE");
					return;
				else
					local v534 = v533:Clone();
					v534.Message.Text = v531;
					v534.Transparency = 1;
					v534.UIScale.Scale = 0;
					v534.Parent = l_ScreenGui_0.Popups;
					local v535 = {
						Transparency = 0
					};
					local v536 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v534, v536, v535):Play();
					v535 = v534.UIScale;
					v536 = {
						Scale = 1
					};
					local l_Back_21 = Enum.EasingStyle.Back;
					local v538 = TweenInfo.new(0.3, l_Back_21 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v535, v538, v536):Play();
					v535 = v534.Message;
					v536 = {
						MaxVisibleGraphemes = #v531
					};
					l_Back_21 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v535, l_Back_21, v536):Play();
					wait(v532 or 4);
					v535 = {
						Transparency = 1
					};
					v536 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v534, v536, v535):Play();
					v535 = v534.UIScale;
					v536 = {
						Scale = 0
					};
					l_Back_21 = Enum.EasingStyle.Back;
					v538 = TweenInfo.new(0.5, l_Back_21 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v535, v538, v536):Play();
					wait(0.5);
					v534:Destroy();
				end;
			end;
		end);
		l_ScreenGui_0.GiftbuxEarn.Visible = false;
		return;
	else
		local l_spawn_18 = spawn;
		local v540 = "danger";
		local v541 = "no rewardable ads available!";
		local v542 = nil;
		l_spawn_18(function() --[[ Line: 99 ]]
			-- upvalues: l_ScreenGui_0 (ref), v540 (copy), l_SoundService_0 (ref), l_UITemplates_0 (ref), v541 (copy), l_TweenService_0 (ref), v542 (copy)
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v540 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v543 = l_UITemplates_0[v540 .. "Popup"];
				if not v543 then
					print("NOPE");
					return;
				else
					local v544 = v543:Clone();
					v544.Message.Text = v541;
					v544.Transparency = 1;
					v544.UIScale.Scale = 0;
					v544.Parent = l_ScreenGui_0.Popups;
					local v545 = {
						Transparency = 0
					};
					local v546 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v544, v546, v545):Play();
					v545 = v544.UIScale;
					v546 = {
						Scale = 1
					};
					local l_Back_22 = Enum.EasingStyle.Back;
					local v548 = TweenInfo.new(0.3, l_Back_22 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v545, v548, v546):Play();
					v545 = v544.Message;
					v546 = {
						MaxVisibleGraphemes = #v541
					};
					l_Back_22 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v545, l_Back_22, v546):Play();
					wait(v542 or 4);
					v545 = {
						Transparency = 1
					};
					v546 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v544, v546, v545):Play();
					v545 = v544.UIScale;
					v546 = {
						Scale = 0
					};
					l_Back_22 = Enum.EasingStyle.Back;
					v548 = TweenInfo.new(0.5, l_Back_22 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v545, v548, v546):Play();
					wait(0.5);
					v544:Destroy();
				end;
			end;
		end);
		return;
	end;
end);
l_LocalPlayer_0.CharacterAdded:Connect(function(v423) --[[ Line: 1251 ]] --[[ Name: forCharacter ]]
	v423.ChildAdded:Connect(function(v424) --[[ Line: 1252 ]]
		if v424.Name == "DonateSign" then
			v424.Equipped:Connect(function() --[[ Line: 1254 ]]
				l_ScreenGui_0.EditSign.Visible = true;
			end);
			v424.Unequipped:Connect(function() --[[ Line: 1257 ]]
				l_ScreenGui_0.EditSign.Visible = false;
			end);
		end;
		if v424.Name == "LargeDonateSign" then
			v424.Equipped:Connect(function() --[[ Line: 1262 ]]
				l_ScreenGui_0.EditSign.Visible = true;
			end);
			v424.Unequipped:Connect(function() --[[ Line: 1265 ]]
				l_ScreenGui_0.EditSign.Visible = false;
			end);
		end;
		if v424.Name == "WheelSign" then
			v424.Equipped:Connect(function() --[[ Line: 1270 ]]
				l_ScreenGui_0.DisabledItem.Visible = true;
			end);
			v424.Unequipped:Connect(function() --[[ Line: 1273 ]]
				l_ScreenGui_0.DisabledItem.Visible = false;
			end);
		end;
	end);
end);
if l_LocalPlayer_0.Character then
	l_LocalPlayer_0.Character.ChildAdded:Connect(function(v425) --[[ Line: 1252 ]]
		if v425.Name == "DonateSign" then
			v425.Equipped:Connect(function() --[[ Line: 1254 ]]
				l_ScreenGui_0.EditSign.Visible = true;
			end);
			v425.Unequipped:Connect(function() --[[ Line: 1257 ]]
				l_ScreenGui_0.EditSign.Visible = false;
			end);
		end;
		if v425.Name == "LargeDonateSign" then
			v425.Equipped:Connect(function() --[[ Line: 1262 ]]
				l_ScreenGui_0.EditSign.Visible = true;
			end);
			v425.Unequipped:Connect(function() --[[ Line: 1265 ]]
				l_ScreenGui_0.EditSign.Visible = false;
			end);
		end;
		if v425.Name == "WheelSign" then
			v425.Equipped:Connect(function() --[[ Line: 1270 ]]
				l_ScreenGui_0.DisabledItem.Visible = true;
			end);
			v425.Unequipped:Connect(function() --[[ Line: 1273 ]]
				l_ScreenGui_0.DisabledItem.Visible = false;
			end);
		end;
	end);
end;
local function _(v426) --[[ Line: 1285 ]] --[[ Name: getUserInfoFromUsername ]]
	local l_UserIdFromNameAsync_0 = game.Players:GetUserIdFromNameAsync(v426);
	return l_UserService_0:GetUserInfosByUserIdsAsync({
		l_UserIdFromNameAsync_0
	})[1];
end;
l_ScreenGui_0.Gift.Frame.Gift.Activated:Connect(function() --[[ Line: 1292 ]] --[[ Name: startGifting ]]
	local v429 = l_ScreenGui_0.Gift.Frame.GiftWrappingSetting:GetAttribute("Value") == true;
	local l_Text_5 = l_ScreenGui_0.Gift.Frame.Message.Text;
	local _ = v429;
	if #l_Text_5 > 100 then
		v429 = spawn;
		local v432 = "warn";
		local v433 = "message too long!";
		local v434 = nil;
		v429(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v432 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v435 = l_UITemplates_0[v432 .. "Popup"];
				if not v435 then
					print("NOPE");
					return;
				else
					local v436 = v435:Clone();
					v436.Message.Text = v433;
					v436.Transparency = 1;
					v436.UIScale.Scale = 0;
					v436.Parent = l_ScreenGui_0.Popups;
					local v437 = {
						Transparency = 0
					};
					local v438 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v436, v438, v437):Play();
					v437 = v436.UIScale;
					v438 = {
						Scale = 1
					};
					local l_Back_16 = Enum.EasingStyle.Back;
					local v440 = TweenInfo.new(0.3, l_Back_16 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v437, v440, v438):Play();
					v437 = v436.Message;
					v438 = {
						MaxVisibleGraphemes = #v433
					};
					l_Back_16 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v437, l_Back_16, v438):Play();
					wait(v434 or 4);
					v437 = {
						Transparency = 1
					};
					v438 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v436, v438, v437):Play();
					v437 = v436.UIScale;
					v438 = {
						Scale = 0
					};
					l_Back_16 = Enum.EasingStyle.Back;
					v440 = TweenInfo.new(0.5, l_Back_16 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v437, v440, v438):Play();
					wait(0.5);
					v436:Destroy();
				end;
			end;
		end);
		return;
	else
		v429 = l_ScreenGui_0.Gift.Frame.Username.Text;
		local l_UserIdFromNameAsync_1 = game.Players:GetUserIdFromNameAsync(v429);
		local v442 = l_UserService_0:GetUserInfosByUserIdsAsync({
			l_UserIdFromNameAsync_1
		})[1];
		if #l_Text_5 == 0 then
			if v442 then
				v28(v442);
				return;
			else
				l_SoundService_0.SFX.Fail:Play();
				l_UserIdFromNameAsync_1 = spawn;
				local v443 = "warn";
				local v444 = "invalid user!";
				local v445 = nil;
				l_UserIdFromNameAsync_1(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v443 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v446 = l_UITemplates_0[v443 .. "Popup"];
						if not v446 then
							print("NOPE");
							return;
						else
							local v447 = v446:Clone();
							v447.Message.Text = v444;
							v447.Transparency = 1;
							v447.UIScale.Scale = 0;
							v447.Parent = l_ScreenGui_0.Popups;
							local v448 = {
								Transparency = 0
							};
							local v449 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v447, v449, v448):Play();
							v448 = v447.UIScale;
							v449 = {
								Scale = 1
							};
							local l_Back_17 = Enum.EasingStyle.Back;
							local v451 = TweenInfo.new(0.3, l_Back_17 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v448, v451, v449):Play();
							v448 = v447.Message;
							v449 = {
								MaxVisibleGraphemes = #v444
							};
							l_Back_17 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v448, l_Back_17, v449):Play();
							wait(v445 or 4);
							v448 = {
								Transparency = 1
							};
							v449 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v447, v449, v448):Play();
							v448 = v447.UIScale;
							v449 = {
								Scale = 0
							};
							l_Back_17 = Enum.EasingStyle.Back;
							v451 = TweenInfo.new(0.5, l_Back_17 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v448, v451, v449):Play();
							wait(0.5);
							v447:Destroy();
						end;
					end;
				end);
				v78(false);
				return;
			end;
		elseif v30.Function("CheckWasFiltered"):InvokeServer(l_Text_5) then
			l_UserIdFromNameAsync_1 = spawn;
			local v452 = "warn";
			local v453 = "message was filtered!";
			local v454 = nil;
			l_UserIdFromNameAsync_1(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v452 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v455 = l_UITemplates_0[v452 .. "Popup"];
					if not v455 then
						print("NOPE");
						return;
					else
						local v456 = v455:Clone();
						v456.Message.Text = v453;
						v456.Transparency = 1;
						v456.UIScale.Scale = 0;
						v456.Parent = l_ScreenGui_0.Popups;
						local v457 = {
							Transparency = 0
						};
						local v458 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v456, v458, v457):Play();
						v457 = v456.UIScale;
						v458 = {
							Scale = 1
						};
						local l_Back_18 = Enum.EasingStyle.Back;
						local v460 = TweenInfo.new(0.3, l_Back_18 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v457, v460, v458):Play();
						v457 = v456.Message;
						v458 = {
							MaxVisibleGraphemes = #v453
						};
						l_Back_18 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v457, l_Back_18, v458):Play();
						wait(v454 or 4);
						v457 = {
							Transparency = 1
						};
						v458 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v456, v458, v457):Play();
						v457 = v456.UIScale;
						v458 = {
							Scale = 0
						};
						l_Back_18 = Enum.EasingStyle.Back;
						v460 = TweenInfo.new(0.5, l_Back_18 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v457, v460, v458):Play();
						wait(0.5);
						v456:Destroy();
					end;
				end;
			end);
			v78(false);
			return;
		elseif v442 then
			v28(v442);
			return;
		else
			l_SoundService_0.SFX.Fail:Play();
			l_UserIdFromNameAsync_1 = spawn;
			local v461 = "warn";
			local v462 = "invalid user!";
			local v463 = nil;
			l_UserIdFromNameAsync_1(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v461 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v464 = l_UITemplates_0[v461 .. "Popup"];
					if not v464 then
						print("NOPE");
						return;
					else
						local v465 = v464:Clone();
						v465.Message.Text = v462;
						v465.Transparency = 1;
						v465.UIScale.Scale = 0;
						v465.Parent = l_ScreenGui_0.Popups;
						local v466 = {
							Transparency = 0
						};
						local v467 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v465, v467, v466):Play();
						v466 = v465.UIScale;
						v467 = {
							Scale = 1
						};
						local l_Back_19 = Enum.EasingStyle.Back;
						local v469 = TweenInfo.new(0.3, l_Back_19 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v466, v469, v467):Play();
						v466 = v465.Message;
						v467 = {
							MaxVisibleGraphemes = #v462
						};
						l_Back_19 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v466, l_Back_19, v467):Play();
						wait(v463 or 4);
						v466 = {
							Transparency = 1
						};
						v467 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v465, v467, v466):Play();
						v466 = v465.UIScale;
						v467 = {
							Scale = 0
						};
						l_Back_19 = Enum.EasingStyle.Back;
						v469 = TweenInfo.new(0.5, l_Back_19 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v466, v469, v467):Play();
						wait(0.5);
						v465:Destroy();
					end;
				end;
			end);
			v78(false);
			return;
		end;
	end;
end);
v95:andThen(function(v470) --[[ Line: 1333 ]]
	if v470 and v470 ~= "" then
		local v471 = v470:match("{\"?giftTarget\"?:%s?\"?([_%w]+)\"?}");
		if v471 ~= nil then
			l_ScreenGui_0.Gift.Visible = true;
			l_ScreenGui_0.Gift.Frame.Username.Text = v471;
			return;
		else
			local v472 = v470:match("{\"?promoCode\"?:%s?\"?([$_%w]+)\"?}");
			if v472 ~= nil then
				l_ScreenGui_0.Redeem.Visible = true;
				l_ScreenGui_0.Redeem.Frame.TextBox.Text = v472;
				return;
			end;
		end;
	end;
end);
local v473 = nil;
local function v474() --[[ Line: 1358 ]] --[[ Name: loadBoothColors ]]
	if v473 == nil then
		wait(2)
		v473 = v30.Function("LoadBoothColors"):InvokeServer();
	end;
end;
task.delay(1, v474);
task.defer(function() --[[ Line: 1365 ]] --[[ Name: updateOwnedBoothsMenu ]]
	task.wait();
	local v475 = v24.State("BasicBooth");
	local v476 = nil;
	local v477 = nil;
	local v478 = nil;
	local v479 = nil;
	local v480 = nil;
	local v481 = nil;
	local v482 = nil;
	local v483 = nil;
	local v484 = nil;
	local v485 = nil;
	local v486 = nil;
	local v487 = nil;
	local v488 = nil;
	local v489 = nil;
	local v490 = nil;
	local v491 = nil;
	local v492 = nil;
	local v493 = nil;
	local v494 = nil;
	local v495 = nil;
	local v496 = nil;
	local v9000 = nil;
	local v2001 = nil;
	v23.allSettled({
		v23.try(function() --[[ Line: 1394 ]]
			if l_RunService_0:IsStudio() then
				v476 = 1e999;
				return;
			else
				v476 = v30.Function("GetDonated"):InvokeServer();
				v30.OnClientEvent("DonatedChanged"):Connect(function(v497) --[[ Line: 1399 ]]
					v476 = v497;
				end);
				return;
			end;
		end), 
		v23.try(function() --[[ Line: 1404 ]]
			v475:set(v30.Function("CurrentBooth"):InvokeServer());
		end), 
		v23.try(function() --[[ Line: 1407 ]]
			--  v482 = v30.Function("CorrectWorldCupVote"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1410 ]]
			v477 = v30.Function("PurchasedBooths"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1413 ]]
			v478 = v30.Function("ExclusiveBooths"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1413 ]]
			v2001 = v30.Function("SomeSecretBooths"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1413 ]]
			v9000 = v30.Function("ClassicBoothsCustom"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1416 ]]
			v479 = l_LocalPlayer_0:IsInGroup(125814458);
		end), 
		v23.try(function() --[[ Line: 1419 ]]
			v481 = v30.Function("AmIVip"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1422 ]]
			v480 = v30.Function("AmIAdmin"):InvokeServer();
		end), 
		v23.try(function() --[[ Line: 1425 ]]
			v483 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2137167023);
		end), 
		v23.try(function() --[[ Line: 1429 ]]
			v484 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2143310084);
		end), 
		v23.try(function() --[[ Line: 1433 ]]
			v485 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 889236865477003);
		end), 
		v23.try(function() --[[ Line: 1437 ]]
			v486 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 1052929021736324);
		end), 
		v23.try(function() --[[ Line: 1442 ]]
			v487 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 1.247754136887661E15);
		end), 
		v23.try(function() --[[ Line: 1446 ]]
			v488 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2126113220);
		end), 
		v23.try(function() --[[ Line: 1450 ]]
			v489 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2127599917);
		end), 
		v23.try(function() --[[ Line: 1454 ]]
			v490 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2128042990);
		end), 
		v23.try(function() --[[ Line: 1458 ]]
			v491 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2128171365);
		end), 
		v23.try(function() --[[ Line: 1462 ]]
			v492 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2124710886);
		end), 
		v23.try(function() --[[ Line: 1466 ]]
			v493 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2124793144);
		end), 
		v23.try(function() --[[ Line: 1470 ]]
			v494 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2133601671);
		end), 
		v23.try(function() --[[ Line: 1474 ]]
			v495 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2124780104);
		end), 
		v23.try(function() --[[ Line: 1478 ]]
			v496 = l_RunService_0:IsStudio() or l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, 2124852486);
		end)
	}):expect();
	local v498 = l_LocalPlayer_0.MembershipType == Enum.MembershipType.Premium;
	local v499 = 0;
	local function v648(v500, v501) --[[ Line: 1487 ]] --[[ Name: addNewBoothButton ]]
		v499 = v499 + 1;
		local v502 = v24.Computed(function() --[[ Line: 1490 ]]
			return v475:get() == v500;
		end);
		local v503 = nil;
		local v504 = nil;
		local function v609() --[[ Line: 1497 ]] --[[ Name: onActivated ]]
			if v504 then
				v504.EditBoothColors.Visible = false;
			end;
			v503.EditBoothColors.Visible = true;
			v504 = v503;
			if v500 == "GoldBooth" then
				if v476 < 100 then
					local l_spawn_13 = spawn;
					local v506 = "warn";
					local v507 = "you need \238\128\130100 donated!";
					local v508 = nil;
					l_spawn_13(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v506 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v509 = l_UITemplates_0[v506 .. "Popup"];
							if not v509 then
								print("NOPE");
								return;
							else
								local v510 = v509:Clone();
								v510.Message.Text = v507;
								v510.Transparency = 1;
								v510.UIScale.Scale = 0;
								v510.Parent = l_ScreenGui_0.Popups;
								local v511 = {
									Transparency = 0
								};
								local v512 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v510, v512, v511):Play();
								v511 = v510.UIScale;
								v512 = {
									Scale = 1
								};
								local l_Back_20 = Enum.EasingStyle.Back;
								local v514 = TweenInfo.new(0.3, l_Back_20 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v511, v514, v512):Play();
								v511 = v510.Message;
								v512 = {
									MaxVisibleGraphemes = #v507
								};
								l_Back_20 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v511, l_Back_20, v512):Play();
								wait(v508 or 4);
								v511 = {
									Transparency = 1
								};
								v512 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v510, v512, v511):Play();
								v511 = v510.UIScale;
								v512 = {
									Scale = 0
								};
								l_Back_20 = Enum.EasingStyle.Back;
								v514 = TweenInfo.new(0.5, l_Back_20 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v511, v514, v512):Play();
								wait(0.5);
								v510:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "DiamondBooth" then
				if v476 < 1000 then
					local l_spawn_14 = spawn;
					local v516 = "warn";
					local v517 = "you need \238\128\1301K donated!";
					local v518 = nil;
					l_spawn_14(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v516 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v519 = l_UITemplates_0[v516 .. "Popup"];
							if not v519 then
								print("NOPE");
								return;
							else
								local v520 = v519:Clone();
								v520.Message.Text = v517;
								v520.Transparency = 1;
								v520.UIScale.Scale = 0;
								v520.Parent = l_ScreenGui_0.Popups;
								local v521 = {
									Transparency = 0
								};
								local v522 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v520, v522, v521):Play();
								v521 = v520.UIScale;
								v522 = {
									Scale = 1
								};
								local l_Back_21 = Enum.EasingStyle.Back;
								local v524 = TweenInfo.new(0.3, l_Back_21 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v521, v524, v522):Play();
								v521 = v520.Message;
								v522 = {
									MaxVisibleGraphemes = #v517
								};
								l_Back_21 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v521, l_Back_21, v522):Play();
								wait(v518 or 4);
								v521 = {
									Transparency = 1
								};
								v522 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v520, v522, v521):Play();
								v521 = v520.UIScale;
								v522 = {
									Scale = 0
								};
								l_Back_21 = Enum.EasingStyle.Back;
								v524 = TweenInfo.new(0.5, l_Back_21 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v521, v524, v522):Play();
								wait(0.5);
								v520:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "VoidBooth" then
				if v476 < 10000 then
					local l_spawn_15 = spawn;
					local v526 = "warn";
					local v527 = "you need \238\128\13010K donated!";
					local v528 = nil;
					l_spawn_15(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v526 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v529 = l_UITemplates_0[v526 .. "Popup"];
							if not v529 then
								print("NOPE");
								return;
							else
								local v530 = v529:Clone();
								v530.Message.Text = v527;
								v530.Transparency = 1;
								v530.UIScale.Scale = 0;
								v530.Parent = l_ScreenGui_0.Popups;
								local v531 = {
									Transparency = 0
								};
								local v532 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v530, v532, v531):Play();
								v531 = v530.UIScale;
								v532 = {
									Scale = 1
								};
								local l_Back_22 = Enum.EasingStyle.Back;
								local v534 = TweenInfo.new(0.3, l_Back_22 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v531, v534, v532):Play();
								v531 = v530.Message;
								v532 = {
									MaxVisibleGraphemes = #v527
								};
								l_Back_22 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v531, l_Back_22, v532):Play();
								wait(v528 or 4);
								v531 = {
									Transparency = 1
								};
								v532 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v530, v532, v531):Play();
								v531 = v530.UIScale;
								v532 = {
									Scale = 0
								};
								l_Back_22 = Enum.EasingStyle.Back;
								v534 = TweenInfo.new(0.5, l_Back_22 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v531, v534, v532):Play();
								wait(0.5);
								v530:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "10KBooth" then
				if v476 < 50000 then
					local l_spawn_16 = spawn;
					local v536 = "warn";
					local v537 = "you need \238\128\13010K donated!";
					local v538 = nil;
					l_spawn_16(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v536 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v539 = l_UITemplates_0[v536 .. "Popup"];
							if not v539 then
								print("NOPE");
								return;
							else
								local v540 = v539:Clone();
								v540.Message.Text = v537;
								v540.Transparency = 1;
								v540.UIScale.Scale = 0;
								v540.Parent = l_ScreenGui_0.Popups;
								local v541 = {
									Transparency = 0
								};
								local v542 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v540, v542, v541):Play();
								v541 = v540.UIScale;
								v542 = {
									Scale = 1
								};
								local l_Back_23 = Enum.EasingStyle.Back;
								local v544 = TweenInfo.new(0.3, l_Back_23 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v541, v544, v542):Play();
								v541 = v540.Message;
								v542 = {
									MaxVisibleGraphemes = #v537
								};
								l_Back_23 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v541, l_Back_23, v542):Play();
								wait(v538 or 4);
								v541 = {
									Transparency = 1
								};
								v542 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v540, v542, v541):Play();
								v541 = v540.UIScale;
								v542 = {
									Scale = 0
								};
								l_Back_23 = Enum.EasingStyle.Back;
								v544 = TweenInfo.new(0.5, l_Back_23 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v541, v544, v542):Play();
								wait(0.5);
								v540:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "100KBooth" then
				if v476 < 100000 then
					local l_spawn_17 = spawn;
					local v546 = "warn";
					local v547 = "you need \238\128\130100K donated!";
					local v548 = nil;
					l_spawn_17(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v546 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v549 = l_UITemplates_0[v546 .. "Popup"];
							if not v549 then
								print("NOPE");
								return;
							else
								local v550 = v549:Clone();
								v550.Message.Text = v547;
								v550.Transparency = 1;
								v550.UIScale.Scale = 0;
								v550.Parent = l_ScreenGui_0.Popups;
								local v551 = {
									Transparency = 0
								};
								local v552 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v550, v552, v551):Play();
								v551 = v550.UIScale;
								v552 = {
									Scale = 1
								};
								local l_Back_24 = Enum.EasingStyle.Back;
								local v554 = TweenInfo.new(0.3, l_Back_24 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v551, v554, v552):Play();
								v551 = v550.Message;
								v552 = {
									MaxVisibleGraphemes = #v547
								};
								l_Back_24 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v551, l_Back_24, v552):Play();
								wait(v548 or 4);
								v551 = {
									Transparency = 1
								};
								v552 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v550, v552, v551):Play();
								v551 = v550.UIScale;
								v552 = {
									Scale = 0
								};
								l_Back_24 = Enum.EasingStyle.Back;
								v554 = TweenInfo.new(0.5, l_Back_24 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v551, v554, v552):Play();
								wait(0.5);
								v550:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "QuataunBooth" then
				if not v479 then
					local l_spawn_18 = spawn;
					local v556 = "warn";
					local v557 = "you must join the quataun group!";
					local v558 = nil;
					l_spawn_18(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v556 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v559 = l_UITemplates_0[v556 .. "Popup"];
							if not v559 then
								print("NOPE");
								return;
							else
								local v560 = v559:Clone();
								v560.Message.Text = v557;
								v560.Transparency = 1;
								v560.UIScale.Scale = 0;
								v560.Parent = l_ScreenGui_0.Popups;
								local v561 = {
									Transparency = 0
								};
								local v562 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v560, v562, v561):Play();
								v561 = v560.UIScale;
								v562 = {
									Scale = 1
								};
								local l_Back_25 = Enum.EasingStyle.Back;
								local v564 = TweenInfo.new(0.3, l_Back_25 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v561, v564, v562):Play();
								v561 = v560.Message;
								v562 = {
									MaxVisibleGraphemes = #v557
								};
								l_Back_25 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v561, l_Back_25, v562):Play();
								wait(v558 or 4);
								v561 = {
									Transparency = 1
								};
								v562 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v560, v562, v561):Play();
								v561 = v560.UIScale;
								v562 = {
									Scale = 0
								};
								l_Back_25 = Enum.EasingStyle.Back;
								v564 = TweenInfo.new(0.5, l_Back_25 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v561, v564, v562):Play();
								wait(0.5);
								v560:Destroy();
							end;
						end;
					end);
					l_SoundService_0.Fail:Play();
					return;
				elseif v503:FindFirstChild("Locked") then
					v503.Locked.Visible = false;
				end;
			elseif v500 == "StaffBooth" and not v480 then
				local l_spawn_19 = spawn;
				local v566 = "warn";
				local v567 = "you must be a staff!";
				local v568 = nil;
				l_spawn_19(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v566 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v569 = l_UITemplates_0[v566 .. "Popup"];
						if not v569 then
							print("NOPE");
							return;
						else
							local v570 = v569:Clone();
							v570.Message.Text = v567;
							v570.Transparency = 1;
							v570.UIScale.Scale = 0;
							v570.Parent = l_ScreenGui_0.Popups;
							local v571 = {
								Transparency = 0
							};
							local v572 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v570, v572, v571):Play();
							v571 = v570.UIScale;
							v572 = {
								Scale = 1
							};
							local l_Back_26 = Enum.EasingStyle.Back;
							local v574 = TweenInfo.new(0.3, l_Back_26 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v571, v574, v572):Play();
							v571 = v570.Message;
							v572 = {
								MaxVisibleGraphemes = #v567
							};
							l_Back_26 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v571, l_Back_26, v572):Play();
							wait(v568 or 4);
							v571 = {
								Transparency = 1
							};
							v572 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v570, v572, v571):Play();
							v571 = v570.UIScale;
							v572 = {
								Scale = 0
							};
							l_Back_26 = Enum.EasingStyle.Back;
							v574 = TweenInfo.new(0.5, l_Back_26 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v571, v574, v572):Play();
							wait(0.5);
							v570:Destroy();
						end;
					end;
				end);
				l_SoundService_0.Fail:Play();
				return;
			end;
			local v598 = v29(function() --[[ Line: 1549 ]]
				if v475:get() == v500 then
					local l_spawn_20 = spawn;
					local v576 = "warn";
					local v577 = "already equipped!";
					local v578 = nil;
					local l_v577_0 = v577 --[[ copy: 3 -> 6 ]];
					local l_v578_0 = v578 --[[ copy: 4 -> 7 ]];
					l_spawn_20(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v576 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v581 = l_UITemplates_0[v576 .. "Popup"];
							if not v581 then
								print("NOPE");
								return;
							else
								local v582 = v581:Clone();
								v582.Message.Text = l_v577_0;
								v582.Transparency = 1;
								v582.UIScale.Scale = 0;
								v582.Parent = l_ScreenGui_0.Popups;
								local v583 = {
									Transparency = 0
								};
								local v584 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v582, v584, v583):Play();
								v583 = v582.UIScale;
								v584 = {
									Scale = 1
								};
								local l_Back_27 = Enum.EasingStyle.Back;
								local v586 = TweenInfo.new(0.3, l_Back_27 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v583, v586, v584):Play();
								v583 = v582.Message;
								v584 = {
									MaxVisibleGraphemes = #l_v577_0
								};
								l_Back_27 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v583, l_Back_27, v584):Play();
								wait(l_v578_0 or 4);
								v583 = {
									Transparency = 1
								};
								v584 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v582, v584, v583):Play();
								v583 = v582.UIScale;
								v584 = {
									Scale = 0
								};
								l_Back_27 = Enum.EasingStyle.Back;
								v586 = TweenInfo.new(0.5, l_Back_27 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v583, v586, v584):Play();
								wait(0.5);
								v582:Destroy();
							end;
						end;
					end);
				end;
				local v587 = v30.Function("EditBoothModel"):InvokeServer(v500);
				if v587 and v587.error == "hit_rate_limit" then
					local l_spawn_21 = spawn;
					local v589 = "danger";
					local v590 = "slow down";
					local v591 = nil;
					l_spawn_21(function() --[[ Line: 98 ]]
						if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v589 == "announcement" then
							l_SoundService_0.SFX.BellRing:Play();
							local v592 = l_UITemplates_0[v589 .. "Popup"];
							if not v592 then
								print("NOPE");
								return;
							else
								local v593 = v592:Clone();
								v593.Message.Text = v590;
								v593.Transparency = 1;
								v593.UIScale.Scale = 0;
								v593.Parent = l_ScreenGui_0.Popups;
								local v594 = {
									Transparency = 0
								};
								local v595 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v593, v595, v594):Play();
								v594 = v593.UIScale;
								v595 = {
									Scale = 1
								};
								local l_Back_28 = Enum.EasingStyle.Back;
								local v597 = TweenInfo.new(0.3, l_Back_28 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v594, v597, v595):Play();
								v594 = v593.Message;
								v595 = {
									MaxVisibleGraphemes = #v590
								};
								l_Back_28 = TweenInfo.new(1, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v594, l_Back_28, v595):Play();
								wait(v591 or 4);
								v594 = {
									Transparency = 1
								};
								v595 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v593, v595, v594):Play();
								v594 = v593.UIScale;
								v595 = {
									Scale = 0
								};
								l_Back_28 = Enum.EasingStyle.Back;
								v597 = TweenInfo.new(0.5, l_Back_28 or Enum.EasingStyle.Quint);
								l_TweenService_0:Create(v594, v597, v595):Play();
								wait(0.5);
								v593:Destroy();
							end;
						end;
					end);
				end;
				l_SoundService_0.SFX.Success:Play();
				v475:set(v500);
				l_ScreenGui_0.EditBooth.Frame.BoothSetting.Info.Text = v501.name:upper();
				if v501.icon.Image == nil then
					l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.Image = "rbxassetid://15842040263";
					warn((("Booth icon for %* is nil"):format(v501.name)));
					return;
				else
					l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.Image = v501.icon.Image;
					l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.ImageRectSize = v501.icon.ImageRectSize;
					l_ScreenGui_0.EditBooth.Frame.BoothSetting.BoothImage.ImageRectOffset = v501.icon.ImageRectOffset;
					return;
				end;
			end);
			if v598 then
				local l_spawn_22 = spawn;
				local v600 = "danger";
				local v601 = "An error occured while setting booth model";
				local v602 = nil;
				l_spawn_22(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v600 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v603 = l_UITemplates_0[v600 .. "Popup"];
						if not v603 then
							print("NOPE");
							return;
						else
							local v604 = v603:Clone();
							v604.Message.Text = v601;
							v604.Transparency = 1;
							v604.UIScale.Scale = 0;
							v604.Parent = l_ScreenGui_0.Popups;
							local v605 = {
								Transparency = 0
							};
							local v606 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v604, v606, v605):Play();
							v605 = v604.UIScale;
							v606 = {
								Scale = 1
							};
							local l_Back_29 = Enum.EasingStyle.Back;
							local v608 = TweenInfo.new(0.3, l_Back_29 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v605, v608, v606):Play();
							v605 = v604.Message;
							v606 = {
								MaxVisibleGraphemes = #v601
							};
							l_Back_29 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v605, l_Back_29, v606):Play();
							wait(v602 or 4);
							v605 = {
								Transparency = 1
							};
							v606 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v604, v606, v605):Play();
							v605 = v604.UIScale;
							v606 = {
								Scale = 0
							};
							l_Back_29 = Enum.EasingStyle.Back;
							v608 = TweenInfo.new(0.5, l_Back_29 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v605, v608, v606):Play();
							wait(0.5);
							v604:Destroy();
						end;
					end;
				end);
				error((("Error occured while setting booth model: %*"):format(v598)));
			end;
		end;
		v503 = v33({
			text = v500, 
			details = v501, 
			onActivated = v609, 
			isSelected = v502, 
			layoutOrder = v499
		});
		v503.Parent = l_ScreenGui_0.Inventory.Frame.Booths;
		v503.Name = v500;
		local v610 = l_StarterGui_0.UITemplates.EditBoothColors:Clone();
		v610.Parent = v503;
		if v500 == "GoldBooth" then
			if v436 < 100 then
				local v723 = script.BoothButton.Locked:Clone();
				v723.Parent = v503;
				v723.Requirement.Text = "Donate <b>\238\128\130100+</b> robux to unlock!"; -- you need \238\128\130100 donated!
			end;
		elseif v500 == "DiamondBooth" then
			if v436 < 1000 then
				local v724 = script.BoothButton.Locked:Clone();
				v724.Parent = v503;
				v724.Requirement.Text = "Donate <b>\238\128\1301,000+</b> robux to unlock!"; -- you need \238\128\1301K donated!
			end;
		elseif v500 == "VoidBooth" then
			if v436 < 10000 then
				local v725 = script.BoothButton.Locked:Clone();
				v725.Parent = v503;
				v725.Requirement.Text = "Donate <b>\238\128\1305,000+</b> robux to unlock!"; -- you need \238\128\13010K donated!
			end;
		elseif v500 == "10KBooth" then
			if v436 < 50000 then
				local v726 = script.BoothButton.Locked:Clone();
				v726.Parent = v503;
				v726.Requirement.Text = "Donate <b>\238\128\13010,000+</b> robux to unlock!"; -- you need \238\128\13010K donated!
			end;
		elseif v500 == "100KBooth" then
			if v436 < 100000 then
				local v727 = script.BoothButton.Locked:Clone();
				v727.Parent = v503;
				v727.Requirement.Text = "Donate <b>\238\128\130100,000+</b> robux to unlock!"; -- you need \238\128\130100K donated!
			end;
		elseif v500 == "QuataunBooth" and not v479 then
			local v728 = script.BoothButton.Locked:Clone();
			v728.Parent = v503;
			v728.JoinGroup.Visible = true;
			v728.JoinGroup.Activated:Connect(function() --[[ Line: 1969 ]]
				game:GetService("GroupService"):PromptJoinAsync(125814458);
			end);
		end
		v610.Activated:Connect(function() --[[ Line: 1590 ]]
			if not l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, 1680481811) and l_LocalPlayer_0.UserId ~= 7619069605 then
				local l_spawn_23 = spawn;
				local v612 = "warn";
				local v613 = "you must buy the Booth Painter gamepass & rejoin to access this feature!";
				local v614 = nil;
				l_spawn_23(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v612 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v615 = l_UITemplates_0[v612 .. "Popup"];
						if not v615 then
							print("NOPE");
							return;
						else
							local v616 = v615:Clone();
							v616.Message.Text = v613;
							v616.Transparency = 1;
							v616.UIScale.Scale = 0;
							v616.Parent = l_ScreenGui_0.Popups;
							local v617 = {
								Transparency = 0
							};
							local v618 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v616, v618, v617):Play();
							v617 = v616.UIScale;
							v618 = {
								Scale = 1
							};
							local l_Back_30 = Enum.EasingStyle.Back;
							local v620 = TweenInfo.new(0.3, l_Back_30 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v617, v620, v618):Play();
							v617 = v616.Message;
							v618 = {
								MaxVisibleGraphemes = #v613
							};
							l_Back_30 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v617, l_Back_30, v618):Play();
							wait(v614 or 4);
							v617 = {
								Transparency = 1
							};
							v618 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v616, v618, v617):Play();
							v617 = v616.UIScale;
							v618 = {
								Scale = 0
							};
							l_Back_30 = Enum.EasingStyle.Back;
							v620 = TweenInfo.new(0.5, l_Back_30 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v617, v620, v618):Play();
							wait(0.5);
							v616:Destroy();
						end;
					end;
				end);
				l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 1680481811);
				return;
			elseif v475:get() ~= v500 then
				local l_spawn_24 = spawn;
				local v622 = "warn";
				local v623 = "booth isn't equipped!";
				local v624 = nil;
				l_spawn_24(function() --[[ Line: 98 ]]
					if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v622 == "announcement" then
						l_SoundService_0.SFX.BellRing:Play();
						local v625 = l_UITemplates_0[v622 .. "Popup"];
						if not v625 then
							print("NOPE");
							return;
						else
							local v626 = v625:Clone();
							v626.Message.Text = v623;
							v626.Transparency = 1;
							v626.UIScale.Scale = 0;
							v626.Parent = l_ScreenGui_0.Popups;
							local v627 = {
								Transparency = 0
							};
							local v628 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v626, v628, v627):Play();
							v627 = v626.UIScale;
							v628 = {
								Scale = 1
							};
							local l_Back_31 = Enum.EasingStyle.Back;
							local v630 = TweenInfo.new(0.3, l_Back_31 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v627, v630, v628):Play();
							v627 = v626.Message;
							v628 = {
								MaxVisibleGraphemes = #v623
							};
							l_Back_31 = TweenInfo.new(1, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v627, l_Back_31, v628):Play();
							wait(v624 or 4);
							v627 = {
								Transparency = 1
							};
							v628 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v626, v628, v627):Play();
							v627 = v626.UIScale;
							v628 = {
								Scale = 0
							};
							l_Back_31 = Enum.EasingStyle.Back;
							v630 = TweenInfo.new(0.5, l_Back_31 or Enum.EasingStyle.Quint);
							l_TweenService_0:Create(v627, v630, v628):Play();
							wait(0.5);
							v626:Destroy();
						end;
					end;
				end);
				return;
			else
				l_ScreenGui_0.EditBoothColors.Visible = true;
				local v631 = v30.Function("GetColors"):InvokeServer(v500);
				for _, v633 in l_ScreenGui_0.EditBoothColors.Frame:GetChildren() do
					if v633:IsA("TextButton") then
						v633:Destroy();
					end;
				end;
				table.sort(v631, function(v634, v635) --[[ Line: 1619 ]]
					return v634.partCount > v635.partCount;
				end);
				for v636, v637 in v631 do
					local v638 = l_UITemplates_0.BoothColorTemplate:Clone();
					local v639 = v500 .. " " .. v637.id;
					local l_default_0 = v637.default;
					v638.ResetColor.Visible = false;
					do
						local l_l_default_0_0 = l_default_0;
						pcall(function() --[[ Line: 1627 ]]
							if v473[v639] then
								v638.ResetColor.Visible = true;
								l_l_default_0_0 = Color3.fromHex(v473[v639]);
							end;
						end);
						v638.Color.BackgroundColor3 = l_l_default_0_0
						v638.Title.Text = "Color #" .. v636;
						v638.Title.PartCount.Text = v637.partCount;
						v638.LayoutOrder = v636;
						v638:SetAttribute("ColorId", v637.id);
						v638:SetAttribute("Default", v637.default);
						v638.Parent = l_ScreenGui_0.EditBoothColors.Frame;
						v638:GetAttributeChangedSignal("Value"):Connect(function() --[[ Line: 1642 ]]
							v473[v639] = v638:GetAttribute("Value"):ToHex();
							v30.Function("ChangeBoothColor"):InvokeServer(v500, v637.id, v638:GetAttribute("Value"));
							pcall(function() --[[ Line: 1646 ]]
								if v473[v639] then
									v638.ResetColor.Visible = true;
									l_l_default_0_0 = Color3.fromHex(v473[v639]);
								end;
							end);
						end);
						v638.ResetColor.Activated:Connect(function() --[[ Line: 1654 ]]
							v638.Color.BackgroundColor3 = v637.default;
							v638:SetAttribute("Value", v637.default);
						end);
						v638.MouseEnter:Connect(function() --[[ Line: 1659 ]]
							local v642 = nil;
							if not workspace:FindFirstChild("ColorHighlights") then
								Instance.new("Folder", workspace).Name = "ColorHighlights";
							end;
							for _, v644 in workspace.BoothModels:GetChildren() do
								if v644:GetAttribute("OwnerId") == l_LocalPlayer_0.UserId then
									v642 = v644;
								end;
							end;
							for _, v646 in v642:GetDescendants() do
								if v646:IsA("BasePart") and v646.Color == v638:GetAttribute("Value") then
									local v647 = Instance.new("Highlight", workspace.ColorHighlights);
									v647.FillTransparency = 1;
									v647.Adornee = v646;
								end;
							end;
						end);
						v638.MouseLeave:Connect(function() --[[ Line: 1682 ]]
							if workspace:FindFirstChild("ColorHighlights") then
								workspace.ColorHighlights:Destroy();
							end;
						end);
					end;
				end;
				return;
			end;
		end);
	end;
	for _, v584 in {
		"BasicBooth", 
		"GoldBooth", 
		"DiamondBooth", 
		"VoidBooth"
		} do
		v648(v584, v9000[v584]);
	end;
	if not v27.IsLegacyMap then
		v648("10KBooth", v9000["10KBooth"]);
		v648("100KBooth", v9000["100KBooth"]);
		v648("QuataunBooth", v478.QuataunBooth);
		if v480 then
			v648("StaffBooth", v478.StaffBooth);
			v648("RobotBooth", v478.RobotBooth);
			v648("RDC24Booth", v478.RDC24Booth);
			v648("ElevatorBooth", v478.ElevatorBooth);
			if l_LocalPlayer_0.UserId == 0 or l_LocalPlayer_0.UserId == 5502332040 then
				v648("CraneBooth", v478.CraneBooth);
				v648("RocketBooth", v478.RocketBooth);
			end;
		end;
		if v481 then
			v648("VIPBooth", v478.VIPBooth);
		end;
		if l_LocalPlayer_0.Name == "IlIIllIIlIlIlIIII" or l_LocalPlayer_0.Name == "" then
			--v648("BillboardBooth", v2001.BillboardBooth);
		end;
		if v498 then
			v648("PremiumBooth", v478.PremiumBooth);
		end;
		if v488 then
			-- v648("UNOfficialBooth", v478.UNOfficialBooth);
		end;
		if v489 then
			--   v648("YippeeBooth", v478.YippeeBooth);
		end;
		if v490 then
			-- v648("IdioticInvestingBooth", v478.IdioticInvestingBooth);
		end;
		if v487 then
			--  v648("TDSBooth", v478.TDSBooth);
		end;
		if v491 then
			-- v648("MakeAWishBooth", v478.MakeAWishBooth);
		end;
		if v492 then
			--   v648("LindonBooth", v478.LindonBooth);
		end;
		if v493 then
			-- v648("PetSimXBooth", v478.PetSimXBooth);
		end;
		if v494 then
			--  v648("DoorsBooth", v478.DoorsBooth);
		end;
		if v495 then
			-- v648("CatalogAvatarCreatorBooth", v478.CatalogAvatarCreatorBooth);
		end;
		if v496 then
			--  v648("TypeRaceBooth", v478.TypeRaceBooth);
		end;
		if v482 then
			--  v648("WorldCupBooth", v478.WorldCupBooth);
		end;
		if v483 then
			--  v648("AnniversaryBooth", v478.AnniversaryBooth);
		end;
		if v484 then
			--  v648("DonationMadnessBooth", v478.DonationMadnessBooth);
		end;
		if v485 then
			--  v648("UFOBooth", v478.UFOBooth);
		end;
		if v486 then
			--  v648("TheHuntBooth", v478.TheHuntBooth);
		end;
		local v651 = {};
		for _, v653 in pairs(v477) do
			if v653.icon then
				table.insert(v651, v653.icon.Image);
			else
				warn(v653[1], "doesn't have a booth hover icon, I hope this is intentional");
			end;
			if v653.hoverIcon then
				table.insert(v651, v653.hoverIcon.Image);
			else
				warn(v653[1], "doesn't have a booth hover icon, I hope this is intentional");
			end;
			v648(v653.id, v653);
		end;
		task.defer(function()
			l_ContentProvider_0:PreloadAsync(v651);
		end);
		v30.OnClientEvent("NewPurchasedBooths"):Connect(function(v654) --[[ Line: 1763 ]]
			v648(v654.id, v654);
			task.defer(function() --[[ Line: 1765 ]]
				local v655 = {};
				if v654.icon then
					table.insert(v655, v654.icon.Image);
				else
					warn(v654.id, "doesn't have a booth hover icon, I hope this is intentional");
				end;
				if v654.hoverIcon then
					table.insert(v655, v654.hoverIcon.Image);
				else
					warn(v654.id, "doesn't have a booth hover icon, I hope this is intentional");
				end;
				l_ContentProvider_0:PreloadAsync(v655);
			end);
			v78(false);
			local l_spawn_25 = spawn;
			local v657 = "success";
			local v658 = "purchased booth!";
			local v659 = nil;
			l_spawn_25(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v657 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v660 = l_UITemplates_0[v657 .. "Popup"];
					if not v660 then
						print("NOPE");
						return;
					else
						local v661 = v660:Clone();
						v661.Message.Text = v658;
						v661.Transparency = 1;
						v661.UIScale.Scale = 0;
						v661.Parent = l_ScreenGui_0.Popups;
						local v662 = {
							Transparency = 0
						};
						local v663 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v661, v663, v662):Play();
						v662 = v661.UIScale;
						v663 = {
							Scale = 1
						};
						local l_Back_32 = Enum.EasingStyle.Back;
						local v665 = TweenInfo.new(0.3, l_Back_32 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v662, v665, v663):Play();
						v662 = v661.Message;
						v663 = {
							MaxVisibleGraphemes = #v658
						};
						l_Back_32 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v662, l_Back_32, v663):Play();
						wait(v659 or 4);
						v662 = {
							Transparency = 1
						};
						v663 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v661, v663, v662):Play();
						v662 = v661.UIScale;
						v663 = {
							Scale = 0
						};
						l_Back_32 = Enum.EasingStyle.Back;
						v665 = TweenInfo.new(0.5, l_Back_32 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v662, v665, v663):Play();
						wait(0.5);
						v661:Destroy();
					end;
				end;
			end);
			l_SoundService_0.SFX.ItemPurchase:Play();
		end);
	end;
end);
l_ScreenGui_0.EditBoothColors.TopFrame.Buttons.ResetColors.Activated:Connect(function() --[[ Line: 1804 ]]
	v30.Function("ResetBoothColors"):InvokeServer();
	v473 = {};
	for _, v668 in l_ScreenGui_0.EditBoothColors.Frame:GetChildren() do
		if v668:GetAttribute("ColorId") then
			local l_v668_Attribute_0 = v668:GetAttribute("ColorId");
			v668.Color.BackgroundColor3 = v473[l_v668_Attribute_0] or v668:GetAttribute("Default");
			v668.ResetColor.Visible = false;
		end;
	end;
	print("ResetColors");
end);
l_ScreenGui_0.Inventory.TopFrame.Search:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1818 ]]
	for _, v671 in ipairs(l_ScreenGui_0.Inventory.Frame.Booths:GetChildren()) do
		if v671:IsA("TextButton") or v671:IsA("ImageButton") then
			v671.Visible = string.find(string.lower(v671.Name), string.lower(l_ScreenGui_0.Inventory.TopFrame.Search.Text), 1, true) ~= nil;
		end;
	end;
end);
l_ScreenGui_0.Gifts.TopFrame.Search:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1828 ]]
	for _, v673 in ipairs(l_ScreenGui_0.Gifts.Frame:GetChildren()) do
		if v673:IsA("Frame") and v673.Name == "Gift" then
			local v674 = string.find(string.lower(v673.Main.Info.Avatar.DisplayName.Text), string.lower(l_ScreenGui_0.Gifts.TopFrame.Search.Text), 1, true) ~= nil;
			local v675 = string.find(string.lower(v673.Main.Amount.Text), string.lower(l_ScreenGui_0.Gifts.TopFrame.Search.Text), 1, true) ~= nil;
			local v676 = string.find(string.lower(v673.Main.Message.Text), string.lower(l_ScreenGui_0.Gifts.TopFrame.Search.Text), 1, true) ~= nil;
			local _ = string.find(string.lower(v673.Main.Info.Date.Text), string.lower(l_ScreenGui_0.Gifts.TopFrame.Search.Text), 1, true) ~= nil;
			v673.Visible = v674 or v675 or v676;
		end;
	end;
end);
l_ScreenGui_0.EditBooth.Frame.Unclaim.Activated:Connect(function() --[[ Line: 1856 ]]
	l_SoundService_0.SFX.UnclaimStand:Play();
	v30.Event("UnclaimBooth"):FireServer();
	l_ScreenGui_0.EditBooth.Visible = false;
	l_ScreenGui_0.NavigationButtons.EditBooth.Visible = false;
end);
v30.OnClientEvent("GiftSentAlert"):Connect(function(v678, _) --[[ Line: 2067 ]]
	local l_ExperienceInviteOptions_0 = Instance.new("ExperienceInviteOptions");
	l_ExperienceInviteOptions_0.InviteUser = v678;
	l_ExperienceInviteOptions_0.PromptMessage = "Let them know you sent them a gift!";
	l_ExperienceInviteOptions_0.InviteMessageId = "99cde9f1-9c69-5645-9abb-549af45c016f";
	l_SocialService_0:PromptGameInvite(l_LocalPlayer_0, l_ExperienceInviteOptions_0);
	print(v678);
	local l_spawn_26 = spawn;
	local v682 = "gift";
	local v683 = "sent gift!";
	local v684 = nil;
	l_spawn_26(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v682 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v685 = l_UITemplates_0[v682 .. "Popup"];
			if not v685 then
				print("NOPE");
				return;
			else
				local v686 = v685:Clone();
				v686.Message.Text = v683;
				v686.Transparency = 1;
				v686.UIScale.Scale = 0;
				v686.Parent = l_ScreenGui_0.Popups;
				local v687 = {
					Transparency = 0
				};
				local v688 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v686, v688, v687):Play();
				v687 = v686.UIScale;
				v688 = {
					Scale = 1
				};
				local l_Back_33 = Enum.EasingStyle.Back;
				local v690 = TweenInfo.new(0.3, l_Back_33 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v687, v690, v688):Play();
				v687 = v686.Message;
				v688 = {
					MaxVisibleGraphemes = #v683
				};
				l_Back_33 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v687, l_Back_33, v688):Play();
				wait(v684 or 4);
				v687 = {
					Transparency = 1
				};
				v688 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v686, v688, v687):Play();
				v687 = v686.UIScale;
				v688 = {
					Scale = 0
				};
				l_Back_33 = Enum.EasingStyle.Back;
				v690 = TweenInfo.new(0.5, l_Back_33 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v687, v690, v688):Play();
				wait(0.5);
				v686:Destroy();
			end;
		end;
	end);
	l_SoundService_0.SFX.GiftSent:Play();
end);
v30.OnClientEvent("InsufficientGiftbux"):Connect(function() --[[ Line: 2083 ]]
	v78(false);
	local l_spawn_27 = spawn;
	local v692 = "warn";
	local v693 = "insufficient giftbux!";
	local v694 = nil;
	l_spawn_27(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v692 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v695 = l_UITemplates_0[v692 .. "Popup"];
			if not v695 then
				print("NOPE");
				return;
			else
				local v696 = v695:Clone();
				v696.Message.Text = v693;
				v696.Transparency = 1;
				v696.UIScale.Scale = 0;
				v696.Parent = l_ScreenGui_0.Popups;
				local v697 = {
					Transparency = 0
				};
				local v698 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v696, v698, v697):Play();
				v697 = v696.UIScale;
				v698 = {
					Scale = 1
				};
				local l_Back_34 = Enum.EasingStyle.Back;
				local v700 = TweenInfo.new(0.3, l_Back_34 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v697, v700, v698):Play();
				v697 = v696.Message;
				v698 = {
					MaxVisibleGraphemes = #v693
				};
				l_Back_34 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v697, l_Back_34, v698):Play();
				wait(v694 or 4);
				v697 = {
					Transparency = 1
				};
				v698 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v696, v698, v697):Play();
				v697 = v696.UIScale;
				v698 = {
					Scale = 0
				};
				l_Back_34 = Enum.EasingStyle.Back;
				v700 = TweenInfo.new(0.5, l_Back_34 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v697, v700, v698):Play();
				wait(0.5);
				v696:Destroy();
			end;
		end;
	end);
	l_SoundService_0.SFX.Fail:Play();
end);
v30.OnClientEvent("PurchasePopup"):Connect(function(v701) --[[ Line: 2089 ]]
	v78(false);
	local v702 = ("purchased %*!"):format(v701);
	local l_spawn_28 = spawn;
	local v704 = "success";
	local v705 = nil;
	l_spawn_28(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v704 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v706 = l_UITemplates_0[v704 .. "Popup"];
			if not v706 then
				print("NOPE");
				return;
			else
				local v707 = v706:Clone();
				v707.Message.Text = v702;
				v707.Transparency = 1;
				v707.UIScale.Scale = 0;
				v707.Parent = l_ScreenGui_0.Popups;
				local v708 = {
					Transparency = 0
				};
				local v709 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v707, v709, v708):Play();
				v708 = v707.UIScale;
				v709 = {
					Scale = 1
				};
				local l_Back_35 = Enum.EasingStyle.Back;
				local v711 = TweenInfo.new(0.3, l_Back_35 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v708, v711, v709):Play();
				v708 = v707.Message;
				v709 = {
					MaxVisibleGraphemes = #v702
				};
				l_Back_35 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v708, l_Back_35, v709):Play();
				wait(v705 or 4);
				v708 = {
					Transparency = 1
				};
				v709 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v707, v709, v708):Play();
				v708 = v707.UIScale;
				v709 = {
					Scale = 0
				};
				l_Back_35 = Enum.EasingStyle.Back;
				v711 = TweenInfo.new(0.5, l_Back_35 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v708, v711, v709):Play();
				wait(0.5);
				v707:Destroy();
			end;
		end;
	end);
	l_SoundService_0.SFX.ItemPurchase:Play();
end);
v30.OnClientEvent("PurchaseBoothStarted"):Connect(function() --[[ Line: 2095 ]]
	v78(true);
end);
v30.OnClientEvent("AlreadyOwned"):Connect(function() --[[ Line: 2100 ]]
	v78(false);
	local l_spawn_29 = spawn;
	local v713 = "danger";
	local v714 = "already owned!";
	local v715 = nil;
	l_spawn_29(function() --[[ Line: 98 ]]
		if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v713 == "announcement" then
			l_SoundService_0.SFX.BellRing:Play();
			local v716 = l_UITemplates_0[v713 .. "Popup"];
			if not v716 then
				print("NOPE");
				return;
			else
				local v717 = v716:Clone();
				v717.Message.Text = v714;
				v717.Transparency = 1;
				v717.UIScale.Scale = 0;
				v717.Parent = l_ScreenGui_0.Popups;
				local v718 = {
					Transparency = 0
				};
				local v719 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v717, v719, v718):Play();
				v718 = v717.UIScale;
				v719 = {
					Scale = 1
				};
				local l_Back_36 = Enum.EasingStyle.Back;
				local v721 = TweenInfo.new(0.3, l_Back_36 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v718, v721, v719):Play();
				v718 = v717.Message;
				v719 = {
					MaxVisibleGraphemes = #v714
				};
				l_Back_36 = TweenInfo.new(1, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v718, l_Back_36, v719):Play();
				wait(v715 or 4);
				v718 = {
					Transparency = 1
				};
				v719 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v717, v719, v718):Play();
				v718 = v717.UIScale;
				v719 = {
					Scale = 0
				};
				l_Back_36 = Enum.EasingStyle.Back;
				v721 = TweenInfo.new(0.5, l_Back_36 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v718, v721, v719):Play();
				wait(0.5);
				v717:Destroy();
			end;
		end;
	end);
	l_SoundService_0.SFX.Fail:Play();
end);
v30.OnClientEvent("RedeemCode"):Connect(function(v722, v723) --[[ Line: 2106 ]]
	v317 = false;
	v78(false);
	if v722 == "success" then
		l_SoundService_0.SFX.Success:Play();
		l_SoundService_0.SFX.ItemPurchase:Play();
		local v724 = ("redeemed %*!"):format(v723);
		local l_spawn_30 = spawn;
		local v726 = "success";
		local v727 = nil;
		l_spawn_30(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v726 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v728 = l_UITemplates_0[v726 .. "Popup"];
				if not v728 then
					print("NOPE");
					return;
				else
					local v729 = v728:Clone();
					v729.Message.Text = v724;
					v729.Transparency = 1;
					v729.UIScale.Scale = 0;
					v729.Parent = l_ScreenGui_0.Popups;
					local v730 = {
						Transparency = 0
					};
					local v731 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v729, v731, v730):Play();
					v730 = v729.UIScale;
					v731 = {
						Scale = 1
					};
					local l_Back_37 = Enum.EasingStyle.Back;
					local v733 = TweenInfo.new(0.3, l_Back_37 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v730, v733, v731):Play();
					v730 = v729.Message;
					v731 = {
						MaxVisibleGraphemes = #v724
					};
					l_Back_37 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v730, l_Back_37, v731):Play();
					wait(v727 or 4);
					v730 = {
						Transparency = 1
					};
					v731 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v729, v731, v730):Play();
					v730 = v729.UIScale;
					v731 = {
						Scale = 0
					};
					l_Back_37 = Enum.EasingStyle.Back;
					v733 = TweenInfo.new(0.5, l_Back_37 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v730, v733, v731):Play();
					wait(0.5);
					v729:Destroy();
				end;
			end;
		end);
		return;
	elseif v722 == "invalid" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_31 = spawn;
		local v735 = "danger";
		local v736 = "invalid code!";
		local v737 = nil;
		l_spawn_31(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v735 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v738 = l_UITemplates_0[v735 .. "Popup"];
				if not v738 then
					print("NOPE");
					return;
				else
					local v739 = v738:Clone();
					v739.Message.Text = v736;
					v739.Transparency = 1;
					v739.UIScale.Scale = 0;
					v739.Parent = l_ScreenGui_0.Popups;
					local v740 = {
						Transparency = 0
					};
					local v741 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v739, v741, v740):Play();
					v740 = v739.UIScale;
					v741 = {
						Scale = 1
					};
					local l_Back_38 = Enum.EasingStyle.Back;
					local v743 = TweenInfo.new(0.3, l_Back_38 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v740, v743, v741):Play();
					v740 = v739.Message;
					v741 = {
						MaxVisibleGraphemes = #v736
					};
					l_Back_38 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v740, l_Back_38, v741):Play();
					wait(v737 or 4);
					v740 = {
						Transparency = 1
					};
					v741 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v739, v741, v740):Play();
					v740 = v739.UIScale;
					v741 = {
						Scale = 0
					};
					l_Back_38 = Enum.EasingStyle.Back;
					v743 = TweenInfo.new(0.5, l_Back_38 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v740, v743, v741):Play();
					wait(0.5);
					v739:Destroy();
				end;
			end;
		end);
		return;
	elseif v722 == "used" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_32 = spawn;
		local v745 = "danger";
		local v746 = "already redeemed!";
		local v747 = nil;
		l_spawn_32(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v745 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v748 = l_UITemplates_0[v745 .. "Popup"];
				if not v748 then
					print("NOPE");
					return;
				else
					local v749 = v748:Clone();
					v749.Message.Text = v746;
					v749.Transparency = 1;
					v749.UIScale.Scale = 0;
					v749.Parent = l_ScreenGui_0.Popups;
					local v750 = {
						Transparency = 0
					};
					local v751 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v749, v751, v750):Play();
					v750 = v749.UIScale;
					v751 = {
						Scale = 1
					};
					local l_Back_39 = Enum.EasingStyle.Back;
					local v753 = TweenInfo.new(0.3, l_Back_39 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v750, v753, v751):Play();
					v750 = v749.Message;
					v751 = {
						MaxVisibleGraphemes = #v746
					};
					l_Back_39 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v750, l_Back_39, v751):Play();
					wait(v747 or 4);
					v750 = {
						Transparency = 1
					};
					v751 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v749, v751, v750):Play();
					v750 = v749.UIScale;
					v751 = {
						Scale = 0
					};
					l_Back_39 = Enum.EasingStyle.Back;
					v753 = TweenInfo.new(0.5, l_Back_39 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v750, v753, v751):Play();
					wait(0.5);
					v749:Destroy();
				end;
			end;
		end);
		return;
	elseif v722 == "expired" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_33 = spawn;
		local v755 = "danger";
		local v756 = "expired code!";
		local v757 = nil;
		l_spawn_33(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v755 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v758 = l_UITemplates_0[v755 .. "Popup"];
				if not v758 then
					print("NOPE");
					return;
				else
					local v759 = v758:Clone();
					v759.Message.Text = v756;
					v759.Transparency = 1;
					v759.UIScale.Scale = 0;
					v759.Parent = l_ScreenGui_0.Popups;
					local v760 = {
						Transparency = 0
					};
					local v761 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v759, v761, v760):Play();
					v760 = v759.UIScale;
					v761 = {
						Scale = 1
					};
					local l_Back_40 = Enum.EasingStyle.Back;
					local v763 = TweenInfo.new(0.3, l_Back_40 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v760, v763, v761):Play();
					v760 = v759.Message;
					v761 = {
						MaxVisibleGraphemes = #v756
					};
					l_Back_40 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v760, l_Back_40, v761):Play();
					wait(v757 or 4);
					v760 = {
						Transparency = 1
					};
					v761 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v759, v761, v760):Play();
					v760 = v759.UIScale;
					v761 = {
						Scale = 0
					};
					l_Back_40 = Enum.EasingStyle.Back;
					v763 = TweenInfo.new(0.5, l_Back_40 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v760, v763, v761):Play();
					wait(0.5);
					v759:Destroy();
				end;
			end;
		end);
		return;
	elseif v722 == "ratelimit" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_34 = spawn;
		local v765 = "danger";
		local v766 = "too fast!";
		local v767 = nil;
		l_spawn_34(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v765 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v768 = l_UITemplates_0[v765 .. "Popup"];
				if not v768 then
					print("NOPE");
					return;
				else
					local v769 = v768:Clone();
					v769.Message.Text = v766;
					v769.Transparency = 1;
					v769.UIScale.Scale = 0;
					v769.Parent = l_ScreenGui_0.Popups;
					local v770 = {
						Transparency = 0
					};
					local v771 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v769, v771, v770):Play();
					v770 = v769.UIScale;
					v771 = {
						Scale = 1
					};
					local l_Back_41 = Enum.EasingStyle.Back;
					local v773 = TweenInfo.new(0.3, l_Back_41 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v770, v773, v771):Play();
					v770 = v769.Message;
					v771 = {
						MaxVisibleGraphemes = #v766
					};
					l_Back_41 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v770, l_Back_41, v771):Play();
					wait(v767 or 4);
					v770 = {
						Transparency = 1
					};
					v771 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v769, v771, v770):Play();
					v770 = v769.UIScale;
					v771 = {
						Scale = 0
					};
					l_Back_41 = Enum.EasingStyle.Back;
					v773 = TweenInfo.new(0.5, l_Back_41 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v770, v773, v771):Play();
					wait(0.5);
					v769:Destroy();
				end;
			end;
		end);
		return;
	elseif v722 == "error" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_35 = spawn;
		local v775 = "danger";
		local v776 = "error";
		local v777 = nil;
		l_spawn_35(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v775 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v778 = l_UITemplates_0[v775 .. "Popup"];
				if not v778 then
					print("NOPE");
					return;
				else
					local v779 = v778:Clone();
					v779.Message.Text = v776;
					v779.Transparency = 1;
					v779.UIScale.Scale = 0;
					v779.Parent = l_ScreenGui_0.Popups;
					local v780 = {
						Transparency = 0
					};
					local v781 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v779, v781, v780):Play();
					v780 = v779.UIScale;
					v781 = {
						Scale = 1
					};
					local l_Back_42 = Enum.EasingStyle.Back;
					local v783 = TweenInfo.new(0.3, l_Back_42 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v780, v783, v781):Play();
					v780 = v779.Message;
					v781 = {
						MaxVisibleGraphemes = #v776
					};
					l_Back_42 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v780, l_Back_42, v781):Play();
					wait(v777 or 4);
					v780 = {
						Transparency = 1
					};
					v781 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v779, v781, v780):Play();
					v780 = v779.UIScale;
					v781 = {
						Scale = 0
					};
					l_Back_42 = Enum.EasingStyle.Back;
					v783 = TweenInfo.new(0.5, l_Back_42 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v780, v783, v781):Play();
					wait(0.5);
					v779:Destroy();
				end;
			end;
		end);
		return;
	else
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_36 = spawn;
		local v785 = "success";
		local v786 = nil;
		l_spawn_36(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v785 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v787 = l_UITemplates_0[v785 .. "Popup"];
				if not v787 then
					print("NOPE");
					return;
				else
					local v788 = v787:Clone();
					v788.Message.Text = v723;
					v788.Transparency = 1;
					v788.UIScale.Scale = 0;
					v788.Parent = l_ScreenGui_0.Popups;
					local v789 = {
						Transparency = 0
					};
					local v790 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v788, v790, v789):Play();
					v789 = v788.UIScale;
					v790 = {
						Scale = 1
					};
					local l_Back_43 = Enum.EasingStyle.Back;
					local v792 = TweenInfo.new(0.3, l_Back_43 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v789, v792, v790):Play();
					v789 = v788.Message;
					v790 = {
						MaxVisibleGraphemes = #v723
					};
					l_Back_43 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v789, l_Back_43, v790):Play();
					wait(v786 or 4);
					v789 = {
						Transparency = 1
					};
					v790 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v788, v790, v789):Play();
					v789 = v788.UIScale;
					v790 = {
						Scale = 0
					};
					l_Back_43 = Enum.EasingStyle.Back;
					v792 = TweenInfo.new(0.5, l_Back_43 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v789, v792, v790):Play();
					wait(0.5);
					v788:Destroy();
				end;
			end;
		end);
		return;
	end;
end);
v30.OnClientEvent("ChatDonationAlert"):Connect(function(v794, v795, v796, v797) --[[ Line: 2135 ]]
	local v798 = "";
	local v799 = Color3.fromRGB(255, 255, 255);
	local v800 = nil;
	if v797 == "global" then
		v798 = "<b>[GLOBAL]: </b>";
	elseif v797 == "admin" then
		v799 = Color3.fromRGB(255, 100, 72);
	end;
	local v801 = v26.formatCommas(v796);
	print(v798 .. string.format("\240\159\146\176 %s tipped \238\128\130\238\128\130%s to %s", v794, v801, v795));
	if v797 == "admin" then
		l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage((("<font color= \"rgb(255, 100, 72)\">%*</font"):format(v796)));
		return;
	else
		if v796 >= 100000 then
			v800 = "<b>%s</b> donated <font color= \"rgb(255, 16, 60)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		elseif v796 >= 1000 then
			v800 = "<b>%s</b> donated <font color= \"rgb(255, 0, 100)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		elseif v796 >= 100 then
			v799 = Color3.fromRGB(255, 0, 230);
			v800 = "<b>%s</b> donated <font color= \"rgb(255, 0, 230)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		elseif v796 >= 10 then
			v799 = Color3.fromRGB(0, 230, 255);
			v800 = "<b>%s</b> donated <font color= \"rgb(0, 230, 255)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		elseif v796 >= 5 then
			v799 = Color3.fromRGB(255, 210, 0);
			v800 = "<b>%s</b> donated <font color= \"rgb(255, 210, 0)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		elseif v796 >= 1 then
			v799 = Color3.fromRGB(26, 255, 0);
			v800 = "<b>%s</b> donated <font color= \"rgb(8, 255, 36)\"><b>\238\128\130%s</b></font> to <b>%s</b>";
		end;
		l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage(v798 .. string.format(("<font size=\"18\">%*</font>"):format(v800), v794, v801, v795));
		return;
	end;
end);
v30.OnClientEvent("ChatAlert"):Connect(function(v916, v917, v918) --[[ Line: 2482 ]]
	if v917 == "announcement" then
		local l_spawn_44 = spawn;
		local v920 = "announcement";
		l_spawn_44(function()
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v920 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v921 = l_UITemplates_0[v920 .. "Popup"];
				if not v921 then
					print("NOPE");
					return;
				else
					local v922 = v921:Clone();
					v922.Message.Text = v916;
					v922.Transparency = 1;
					v922.UIScale.Scale = 0;
					v922.Parent = l_ScreenGui_0.Popups;
					local v923 = {
						Transparency = 0
					};
					local v924 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v922, v924, v923):Play();
					v923 = v922.UIScale;
					v924 = {
						Scale = 1
					};
					local l_Back_52 = Enum.EasingStyle.Back;
					local v926 = TweenInfo.new(0.3, l_Back_52 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v923, v926, v924):Play();
					v923 = v922.Message;
					v924 = {
						MaxVisibleGraphemes = #v916
					};
					l_Back_52 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v923, l_Back_52, v924):Play();
					wait(v918 or 4);
					v923 = {
						Transparency = 1
					};
					v924 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v922, v924, v923):Play();
					v923 = v922.UIScale;
					v924 = {
						Scale = 0
					};
					l_Back_52 = Enum.EasingStyle.Back;
					v926 = TweenInfo.new(0.5, l_Back_52 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v923, v926, v924):Play();
					wait(0.5);
					v922:Destroy();
				end;
			end;
		end);
		l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage((("<font size=\"21\">%*</font>"):format(v916)));
		return;
	elseif v917 == "giftpass" then
		local l_spawn_45 = spawn;
		local v928 = "giftPass";
		local v929 = nil;
		l_spawn_45(function() --[[ Line: 99 ]]
			-- upvalues: l_ScreenGui_0 (ref), v928 (copy), l_SoundService_0 (ref), l_UITemplates_0 (ref), v916 (copy), l_TweenService_0 (ref), v929 (copy)
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v928 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v930 = l_UITemplates_0[v928 .. "Popup"];
				if not v930 then
					print("NOPE");
					return;
				else
					local v931 = v930:Clone();
					v931.Message.Text = v916;
					v931.Transparency = 1;
					v931.UIScale.Scale = 0;
					v931.Parent = l_ScreenGui_0.Popups;
					local v932 = {
						Transparency = 0
					};
					local v933 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v931, v933, v932):Play();
					v932 = v931.UIScale;
					v933 = {
						Scale = 1
					};
					local l_Back_53 = Enum.EasingStyle.Back;
					local v935 = TweenInfo.new(0.3, l_Back_53 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v932, v935, v933):Play();
					v932 = v931.Message;
					v933 = {
						MaxVisibleGraphemes = #v916
					};
					l_Back_53 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v932, l_Back_53, v933):Play();
					wait(v929 or 4);
					v932 = {
						Transparency = 1
					};
					v933 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v931, v933, v932):Play();
					v932 = v931.UIScale;
					v933 = {
						Scale = 0
					};
					l_Back_53 = Enum.EasingStyle.Back;
					v935 = TweenInfo.new(0.5, l_Back_53 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v932, v935, v933):Play();
					wait(0.5);
					v931:Destroy();
				end;
			end;
		end);
		l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage((("<font size=\"18\" color= \"rgb(0, 255, 234)\">%*</font>"):format(v916)));
		return;
	else
		l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage((("<font size=\"18\" color= \"rgb(0, 255, 234)\">%*</font>"):format(v916)));
		return;
	end;
end);
v30.OnClientEvent("PlayDonationSound"):Connect(function(v813, v814) --[[ Line: 2191 ]]
	local v815 = l_SoundService_0.SFX.DonationLevels["DonationLevel" .. v813]:Clone();
	l_Debris_0:AddItem(v815, 60);
	v815.Parent = v814;
	v815:Play();
	local v816 = l_SoundService_0.SFX.DonationLevels.FallingCoins:Clone();
	l_Debris_0:AddItem(v816, 60);
	v816.PlaybackSpeed = 1 + (v813 - 1) * 0.1;
	v816.RollOffMaxDistance = v815.RollOffMaxDistance;
	v816.RollOffMinDistance = v815.RollOffMinDistance;
	v816.Volume = v815.Volume * 0.5;
	v816.Parent = v814;
	v816:Play();
	if v813 == 6 then
		local v817 = {
			Volume = 0
		};
		local v818 = TweenInfo.new(2, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v816, v818, v817):Play();
		return;
	elseif v813 == 5 then
		local v819 = {
			Volume = 0
		};
		local v820 = TweenInfo.new(2.25, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v816, v820, v819):Play();
		return;
	elseif v813 == 4 then
		local v821 = {
			Volume = 0
		};
		local v822 = TweenInfo.new(3.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v816, v822, v821):Play();
		return;
	elseif v813 == 3 then
		local v823 = {
			Volume = 0
		};
		local v824 = TweenInfo.new(10, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v816, v824, v823):Play();
		return;
	elseif v813 == 2 then
		local v823 = {
			Volume = 0
		};
		local v824 = TweenInfo.new(10, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v816, v824, v823):Play();
		return;
	else
		if v813 == 1 then
			local v825 = {
				Volume = 0
			};
			local v826 = TweenInfo.new(25, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(v816, v826, v825):Play();
		end;
		return;
	end;
end);
v30.OnClientEvent("GlobalDonationsDown"):Connect(function(v827) --[[ Line: 2219 ]]
	local v828 = nil;
	if v827 then
		v828 = "<font color= \"rgb(255, 150, 10)\"><b>[GLOBAL]:</b> Global donations have been temporarily disabled, we will try to get them enabled ASAP. </font>";
		local l_spawn_38 = spawn;
		local v830 = "warn";
		local v831 = "Global donations have been temporarily disabled!";
		local v832 = nil;
		l_spawn_38(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v830 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v833 = l_UITemplates_0[v830 .. "Popup"];
				if not v833 then
					print("NOPE");
					return;
				else
					local v834 = v833:Clone();
					v834.Message.Text = v831;
					v834.Transparency = 1;
					v834.UIScale.Scale = 0;
					v834.Parent = l_ScreenGui_0.Popups;
					local v835 = {
						Transparency = 0
					};
					local v836 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v834, v836, v835):Play();
					v835 = v834.UIScale;
					v836 = {
						Scale = 1
					};
					local l_Back_45 = Enum.EasingStyle.Back;
					local v838 = TweenInfo.new(0.3, l_Back_45 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v835, v838, v836):Play();
					v835 = v834.Message;
					v836 = {
						MaxVisibleGraphemes = #v831
					};
					l_Back_45 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v835, l_Back_45, v836):Play();
					wait(v832 or 4);
					v835 = {
						Transparency = 1
					};
					v836 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v834, v836, v835):Play();
					v835 = v834.UIScale;
					v836 = {
						Scale = 0
					};
					l_Back_45 = Enum.EasingStyle.Back;
					v838 = TweenInfo.new(0.5, l_Back_45 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v835, v838, v836):Play();
					wait(0.5);
					v834:Destroy();
				end;
			end;
		end);
	else
		v828 = "<font color= \"rgb(80, 255, 80)\"><b>[GLOBAL]:</b> Global donations are back up! </font>";
		local l_spawn_39 = spawn;
		local v840 = "success";
		local v841 = "Global donations are back up!";
		local v842 = nil;
		l_spawn_39(function() --[[ Line: 98 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v840 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v843 = l_UITemplates_0[v840 .. "Popup"];
				if not v843 then
					print("NOPE");
					return;
				else
					local v844 = v843:Clone();
					v844.Message.Text = v841;
					v844.Transparency = 1;
					v844.UIScale.Scale = 0;
					v844.Parent = l_ScreenGui_0.Popups;
					local v845 = {
						Transparency = 0
					};
					local v846 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v844, v846, v845):Play();
					v845 = v844.UIScale;
					v846 = {
						Scale = 1
					};
					local l_Back_46 = Enum.EasingStyle.Back;
					local v848 = TweenInfo.new(0.3, l_Back_46 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v845, v848, v846):Play();
					v845 = v844.Message;
					v846 = {
						MaxVisibleGraphemes = #v841
					};
					l_Back_46 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v845, l_Back_46, v846):Play();
					wait(v842 or 4);
					v845 = {
						Transparency = 1
					};
					v846 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v844, v846, v845):Play();
					v845 = v844.UIScale;
					v846 = {
						Scale = 0
					};
					l_Back_46 = Enum.EasingStyle.Back;
					v848 = TweenInfo.new(0.5, l_Back_46 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v845, v848, v846):Play();
					wait(0.5);
					v844:Destroy();
				end;
			end;
		end);
	end;
	l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage(v828);
end);
v30.OnClientEvent("AdminCommandResponse"):Connect(function(v849)
	local v850 = "[RESPONSE] " .. v849;
	l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage(("<font color=\"rgb(34, 255, 255)\">%s</font>"):format(v850));
end);
v30.OnClientEvent("JustPostSomethingInChatPleaseOkThanksYourTheBest"):Connect(function(v852) --[[ Line: 2239 ]]
	l_TextChatService_0.TextChannels.RBXGeneral:DisplaySystemMessage(v852);
end);
v30.OnClientEvent("NotifyDonationParticipants"):Connect(function(v977, v978, v979) 
	local v980 = v26.formatCommas(v979);
	if v977 == l_LocalPlayer_0 then
		l_SoundService_0.SFX.DonationSent:Play();
		local v981, v982 = string.format("you donated \238\128\130%s to @%s", v980, v978.Name);
		local l_spawn_48 = spawn;
		local v984 = "donation";
		local l_v984_0 = v984
		local l_v981_0 = v981 
		local l_v982_0 = v982
		l_spawn_48(function()
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or l_v984_0 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v988 = l_UITemplates_0[l_v984_0 .. "Popup"];
				if not v988 then
					print("NOPE");
					return;
				else
					local v989 = v988:Clone();
					v989.Message.Text = l_v981_0;
					v989.Transparency = 1;
					v989.UIScale.Scale = 0;
					v989.Parent = l_ScreenGui_0.Popups;
					local v990 = {
						Transparency = 0
					};
					local v991 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v989, v991, v990):Play();
					v990 = v989.UIScale;
					v991 = {
						Scale = 1
					};
					local l_Back_56 = Enum.EasingStyle.Back;
					local v993 = TweenInfo.new(0.3, l_Back_56 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v990, v993, v991):Play();
					v990 = v989.Message;
					v991 = {
						MaxVisibleGraphemes = #l_v981_0
					};
					l_Back_56 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v990, l_Back_56, v991):Play();
					wait(l_v982_0 or 4);
					v990 = {
						Transparency = 1
					};
					v991 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v989, v991, v990):Play();
					v990 = v989.UIScale;
					v991 = {
						Scale = 0
					};
					l_Back_56 = Enum.EasingStyle.Back;
					v993 = TweenInfo.new(0.5, l_Back_56 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v990, v993, v991):Play();
					wait(0.5);
					v989:Destroy();
				end;
			end;
		end);
	end;
	if v978 == l_LocalPlayer_0 then
		l_SoundService_0.SFX.DonationReceived:Play();
		v32();
		local v994, v995 = string.format("%s DONATED \238\128\130%s TO YOU!", v977.DisplayName:upper(), v980);
		local l_spawn_49 = spawn;
		local v997 = "donation";
		l_spawn_49(function() --[[ Line: 99 ]]
			if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v997 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v998 = l_UITemplates_0[v997 .. "Popup"];
				if not v998 then
					print("NOPE");
					return;
				else
					local v999 = v998:Clone();
					v999.Message.Text = v994;
					v999.Transparency = 1;
					v999.UIScale.Scale = 0;
					v999.Parent = l_ScreenGui_0.Popups;
					local v1000 = {
						Transparency = 0
					};
					local v1001 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v999, v1001, v1000):Play();
					v1000 = v999.UIScale;
					v1001 = {
						Scale = 1
					};
					local l_Back_57 = Enum.EasingStyle.Back;
					local v1003 = TweenInfo.new(0.3, l_Back_57 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v1000, v1003, v1001):Play();
					v1000 = v999.Message;
					v1001 = {
						MaxVisibleGraphemes = #v994
					};
					l_Back_57 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v1000, l_Back_57, v1001):Play();
					wait(v995 or 4);
					v1000 = {
						Transparency = 1
					};
					v1001 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v999, v1001, v1000):Play();
					v1000 = v999.UIScale;
					v1001 = {
						Scale = 0
					};
					l_Back_57 = Enum.EasingStyle.Back;
					v1003 = TweenInfo.new(0.5, l_Back_57 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v1000, v1003, v1001):Play();
					wait(0.5);
					v999:Destroy();
				end;
			end;
		end);
		l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 1);
		task.wait(0.5);
		l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0);
	end;
end);
local function v897(v880, v881) --[[ Line: 2274 ]] --[[ Name: displayNotification ]]
	if v881 ~= " " then
		local v882 = l_Templates_0.GlobalMessage:Clone();
		v882.BackgroundTransparency = 1;
		v882.TextLabel.TextTransparency = 1;
		v882.Icon.ImageTransparency = 1;
		v882.UIListLayout.Padding = UDim.new(0, 40);
		if v880 == "warning" then
			v882.BackgroundColor3 = Color3.fromRGB(255, 149, 0);
			v882.TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0);
			v882.Icon.ImageColor3 = Color3.fromRGB(0, 0, 0);
			v882.Icon.Image = "rbxassetid://12259549639";
		elseif v880 == "danger" then
			v882.BackgroundColor3 = Color3.fromRGB(255, 70, 46);
			v882.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
			v882.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
			v882.Icon.Image = "rbxassetid://12259549639";
		end;
		v882.TextLabel.Text = v881;
		v882.Parent = l_ScreenGui_0.Notifications;
		local v883 = {
			BackgroundTransparency = 0
		};
		local v884 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v882, v884, v883):Play();
		v883 = v882.UIListLayout;
		v884 = {
			Padding = UDim.new(0, 15)
		};
		local v885 = TweenInfo.new(1, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v883, v885, v884):Play();
		v883 = v882.TextLabel;
		v884 = {
			TextTransparency = 0
		};
		v885 = TweenInfo.new(1, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v883, v885, v884):Play();
		v883 = v882.Icon;
		v884 = {
			ImageTransparency = 0
		};
		v885 = TweenInfo.new(1, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(v883, v885, v884):Play();
		return;
	else
		for _, v887 in pairs(l_ScreenGui_0.Notifications:GetChildren()) do
			if v887.ClassName == "Frame" then
				if v880 == "info" and v887.BackgroundColor3 == Color3.fromRGB(0, 0, 0) then
					spawn(function() --[[ Line: 2305 ]]
						local l_v887_0 = v887;
						local v889 = {
							BackgroundTransparency = 1
						};
						local v890 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_0, v890, v889):Play();
						l_v887_0 = v887.UIListLayout;
						v889 = {
							Padding = UDim.new(0, 40)
						};
						v890 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_0, v890, v889):Play();
						l_v887_0 = v887.TextLabel;
						v889 = {
							TextTransparency = 1
						};
						v890 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_0, v890, v889):Play();
						l_v887_0 = v887.Icon;
						v889 = {
							ImageTransparency = 1
						};
						v890 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_0, v890, v889):Play();
						wait(1);
						v887:Destroy();
					end);
				elseif v880 == "warning" and v887.BackgroundColor3 == Color3.fromRGB(255, 149, 0) then
					spawn(function() --[[ Line: 2314 ]]
						local l_v887_1 = v887;
						local v892 = {
							BackgroundTransparency = 1
						};
						local v893 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_1, v893, v892):Play();
						l_v887_1 = v887.UIListLayout;
						v892 = {
							Padding = UDim.new(0, 40)
						};
						v893 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_1, v893, v892):Play();
						l_v887_1 = v887.TextLabel;
						v892 = {
							TextTransparency = 1
						};
						v893 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_1, v893, v892):Play();
						l_v887_1 = v887.Icon;
						v892 = {
							ImageTransparency = 1
						};
						v893 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_1, v893, v892):Play();
						wait(1);
						v887:Destroy();
					end);
				elseif v880 == "danger" and v887.BackgroundColor3 == Color3.fromRGB(255, 70, 46) then
					spawn(function() --[[ Line: 2323 ]]
						local l_v887_2 = v887;
						local v895 = {
							BackgroundTransparency = 1
						};
						local v896 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_2, v896, v895):Play();
						l_v887_2 = v887.UIListLayout;
						v895 = {
							Padding = UDim.new(0, 40)
						};
						v896 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_2, v896, v895):Play();
						l_v887_2 = v887.TextLabel;
						v895 = {
							TextTransparency = 1
						};
						v896 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_2, v896, v895):Play();
						l_v887_2 = v887.Icon;
						v895 = {
							ImageTransparency = 1
						};
						v896 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_v887_2, v896, v895):Play();
						wait(1);
						v887:Destroy();
					end);
				end;
			end;
		end;
		return;
	end;
end;
l_ReplicatedStorage_0.InfoText:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2338 ]]
	v897("info", l_ReplicatedStorage_0.InfoText.Value);
end);
l_ReplicatedStorage_0.WarningText:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2342 ]]
	v897("warning", l_ReplicatedStorage_0.WarningText.Value);
end);
l_ReplicatedStorage_0.DangerText:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2346 ]]
	v897("danger", l_ReplicatedStorage_0.DangerText.Value);
end);
if l_ReplicatedStorage_0.InfoText.Value ~= "" then
	v897("info", l_ReplicatedStorage_0.InfoText.Value);
elseif l_ReplicatedStorage_0.WarningText.Value ~= "" then
	v897("warning", l_ReplicatedStorage_0.WarningText.Value);
elseif l_ReplicatedStorage_0.DangerText.Value ~= "" then
	v897("danger", l_ReplicatedStorage_0.DangerText.Value);
end;
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 2359 ]]
	if workspace:FindFirstChild("FakeRobuxNuke") then
		local v898 = workspace:FindFirstChild("RobuxNuke") ~= nil;
		local _ = workspace:FindFirstChild("RobuxHammerGiant") ~= nil;
		if v898 and workspace.FakeRobuxNuke.CanCollide then
			local l_Nuke_0 = workspace.Map.NukeIsland.Nuke;
			local v901 = {
				Transparency = 1
			};
			local v902 = TweenInfo.new(1, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_Nuke_0, v902, v901):Play();
			workspace.FakeRobuxNuke.CanCollide = false;
			return;
		elseif not v898 and not workspace.FakeRobuxNuke.CanCollide then
			local l_FakeRobuxNuke_0 = workspace.FakeRobuxNuke;
			local v904 = {
				Transparency = 0
			};
			local v905 = TweenInfo.new(1, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_FakeRobuxNuke_0, v905, v904):Play();
			workspace.FakeRobuxNuke.CanCollide = true;
		end;
	end;
end);
l_ScreenGui_0.Exit.Close.Activated:Connect(function() --[[ Line: 2407 ]] --[[ Name: stopViewingItems ]]
	l_ScreenGui_0.Exit.Visible = false;
end);
task.spawn(function() --[[ Line: 2414 ]]
	task.wait();
	v45 = v30.Function("GiftbuxBalance"):InvokeServer();
	l_ScreenGui_0.Giftbux.Balance.Text = v26.formatCommas(v45);
	v30.OnClientEvent("NewGiftbuxBalance"):Connect(function(v906) --[[ Line: 2418 ]]
		v45 = v906;
		l_ScreenGui_0.Giftbux.Balance.Text = v26.formatCommas(v45);
	end);
end);
task.spawn(function() --[[ Line: 2424 ]]
	l_LocalPlayer_0.Character:WaitForChild("Humanoid").Died:Connect(function() --[[ Line: 2425 ]]
		workspace.Camera.CameraType = Enum.CameraType.Custom;
	end);
end);
task.delay(1, function() --[[ Line: 2430 ]]
	v30.Event("InvokeLoginRewards"):FireServer();
end);
task.delay(1, function() --[[ Line: 2434 ]]
	if l_LocalPlayer_0:GetAttribute("Raised") == 0 and l_LocalPlayer_0:GetAttribute("Donated") == 0 then
		l_ScreenGui_0.TutorialA.Visible = true;
	end;
end);
local function v918(v907) --[[ Line: 2440 ]] --[[ Name: forPurchaseBoothTrigger ]]
	v907.Triggered:Connect(function() --[[ Line: 2441 ]]
		if v45 < v907:GetAttribute("Price") then
			local l_spawn_42 = spawn;
			local v909 = "warn";
			local v910 = "insufficent giftbux!";
			local v911 = nil;
			l_spawn_42(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v909 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v912 = l_UITemplates_0[v909 .. "Popup"];
					if not v912 then
						print("NOPE");
						return;
					else
						local v913 = v912:Clone();
						v913.Message.Text = v910;
						v913.Transparency = 1;
						v913.UIScale.Scale = 0;
						v913.Parent = l_ScreenGui_0.Popups;
						local v914 = {
							Transparency = 0
						};
						local v915 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v913, v915, v914):Play();
						v914 = v913.UIScale;
						v915 = {
							Scale = 1
						};
						local l_Back_49 = Enum.EasingStyle.Back;
						local v917 = TweenInfo.new(0.3, l_Back_49 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v914, v917, v915):Play();
						v914 = v913.Message;
						v915 = {
							MaxVisibleGraphemes = #v910
						};
						l_Back_49 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v914, l_Back_49, v915):Play();
						wait(v911 or 4);
						v914 = {
							Transparency = 1
						};
						v915 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v913, v915, v914):Play();
						v914 = v913.UIScale;
						v915 = {
							Scale = 0
						};
						l_Back_49 = Enum.EasingStyle.Back;
						v917 = TweenInfo.new(0.5, l_Back_49 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v914, v917, v915):Play();
						wait(0.5);
						v913:Destroy();
					end;
				end;
			end);
			return;
		else
			v907:FindFirstChild("RequestPurchase"):FireServer();
			return;
		end;
	end);
end;
for _, v920 in l_CollectionService_0:GetTagged("PurchaseBoothTrigger") do
	v920.Triggered:Connect(function() --[[ Line: 2441 ]]
		if v45 < v920:GetAttribute("Price") then
			local l_spawn_43 = spawn;
			local v922 = "warn";
			local v923 = "insufficent giftbux!";
			local v924 = nil;
			l_spawn_43(function() --[[ Line: 98 ]]
				if l_ScreenGui_0.Popups:GetAttribute("Enabled") or v922 == "announcement" then
					l_SoundService_0.SFX.BellRing:Play();
					local v925 = l_UITemplates_0[v922 .. "Popup"];
					if not v925 then
						print("NOPE");
						return;
					else
						local v926 = v925:Clone();
						v926.Message.Text = v923;
						v926.Transparency = 1;
						v926.UIScale.Scale = 0;
						v926.Parent = l_ScreenGui_0.Popups;
						local v927 = {
							Transparency = 0
						};
						local v928 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v926, v928, v927):Play();
						v927 = v926.UIScale;
						v928 = {
							Scale = 1
						};
						local l_Back_50 = Enum.EasingStyle.Back;
						local v930 = TweenInfo.new(0.3, l_Back_50 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v927, v930, v928):Play();
						v927 = v926.Message;
						v928 = {
							MaxVisibleGraphemes = #v923
						};
						l_Back_50 = TweenInfo.new(1, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v927, l_Back_50, v928):Play();
						wait(v924 or 4);
						v927 = {
							Transparency = 1
						};
						v928 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v926, v928, v927):Play();
						v927 = v926.UIScale;
						v928 = {
							Scale = 0
						};
						l_Back_50 = Enum.EasingStyle.Back;
						v930 = TweenInfo.new(0.5, l_Back_50 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v927, v930, v928):Play();
						wait(0.5);
						v926:Destroy();
					end;
				end;
			end);
			return;
		else
			v920:FindFirstChild("RequestPurchase"):FireServer();
			return;
		end;
	end);
end;
l_CollectionService_0:GetInstanceAddedSignal("PurchaseBoothTrigger"):Connect(v918);
l_CollectionService_0:GetInstanceAddedSignal("BlimpDonationUI"):Connect(function(v931) --[[ Line: 2458 ]]
	task.wait();
	v931.Parent = l_LocalPlayer_0.PlayerGui;
end);
task.defer(function()
	if l_LocalPlayer_0:IsInGroup(125814458) and workspace.Map:FindFirstChild("BoothShopSlots") then
		for _, v933 in workspace.Map.BoothShopSlots:GetChildren() do
			local l_Text_6 = v933.BillboardGui.TextLabel.Text;
			v933.BillboardGui.TextLabel.Text = "<font transparency=\"0.5\"><s>" .. l_Text_6 .. "</s></font> " .. l_Text_6 - 20;
		end;
		for _, v936 in workspace.Map.BoothShopSlots:GetChildren() do
			v936.BillboardGui.TextLabel:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 2476 ]]
				local l_Text_7 = v936.BillboardGui.TextLabel.Text;
				v936.BillboardGui.TextLabel.Text = "<font transparency=\"0.5\"><s>" .. l_Text_7 .. "</s></font>" .. l_Text_7 - 20;
			end);
		end;
	end;
end);
print(v31());