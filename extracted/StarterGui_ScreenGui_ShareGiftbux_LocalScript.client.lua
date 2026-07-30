local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local l_Lighting_0 = game:GetService("Lighting");
local l_GuiService_0 = game:GetService("GuiService");
local l_BadgeService_0 = game:GetService("BadgeService");
local l_RunService_0 = game:GetService("RunService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SocialService_0 = game:GetService("SocialService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserService_0 = game:GetService("UserService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v30 = require(l_ReplicatedStorage_0.Remotes);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local upval32 = script.Parent.Parent;
local upval33 = game.StarterGui:WaitForChild("UITemplates", 5)
local l_UITemplates_0 = upval33;
local upval2 = l_SoundService_0
local upval13 = l_TweenService_0
local _shareui = l_PlayerGui_0.ScreenGui:WaitForChild("ShareGiftbux")
local numberhelper = require(l_ReplicatedStorage_0.NumberHelpers)
local AnimatorModule = require(game.ReplicatedStorage.AnimationModule);

local function fun1(arg1, arg2, arg3)
	spawn(function()
		if upval32.Popups:GetAttribute("Enabled") or arg1 == "announcement" then
			upval2.SFX.BellRing:Play()
			local var0 = upval33[arg1 .. "Popup"]
			if not var0 then
				print("NOPE")
				return 
			end
			local var1 = var0:Clone()
			var1.Message.Text = arg2
			var1.Transparency = 1
			var1.UIScale.Scale = 0
			var1.Parent = upval32.Popups
			local var245 = {}
			var245.Transparency = 0
			upval13:Create(var1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), var245):Play()
			local var258 = {}
			var258.Scale = 1
			local var263 = Enum.EasingStyle.Back
			while not var263 do
				print("NOPE")
				return 
			end
			upval13:Create(var1.UIScale, TweenInfo.new(0.3, var263), var258):Play()
			local var272 = {}
			var272.MaxVisibleGraphemes = tonumber(arg2)
			upval13:Create(var1.Message, TweenInfo.new(1, Enum.EasingStyle.Quint), var272):Play()
			wait(arg3 or 4)
			local var286 = {}
			var286.Transparency = 1
			upval13:Create(var1, TweenInfo.new(0.25, Enum.EasingStyle.Quint), var286):Play()
			local var299 = {}
			var299.Scale = 0
			local var304 = Enum.EasingStyle.Back
			while not var304 do
				print("NOPE")
				return 
			end
			upval13:Create(var1.UIScale, TweenInfo.new(0.5, var304), var299):Play()
			wait(0.5)
			var1:Destroy()
		end
	end)
end
local _allowed = true
local _max = 1000000

local _selectedPlayer = nil  
local _playerTemplates = {};
local _stroke = nil;
local function v69(v68)
	if v68 == true then
		local l_Camera_1 = workspace.Camera;
		local v73 = {
			FieldOfView = 50
		};
		local v74 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_1, v74, v73):Play();
		l_Camera_1 = l_PlayerGui_0.ScreenGui.Loading;
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
		l_Camera_2 = l_PlayerGui_0.ScreenGui.Loading;
		v76 = {
			GroupTransparency = 1
		};
		v77 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Camera_2, v77, v76):Play();
		return;
	end;
end;
local function addPlayer(plr)

	local userId = plr.UserId
	local templateName = ("User%d"):format(userId)

	if _playerTemplates[userId] then
		_playerTemplates[userId]:Destroy()
	end;

	local template = game.StarterGui.UITemplates.PlayerTemplate:Clone()
	template.Name = templateName
	template.Parent = _shareui.Frame.Main.Players
	template.Frame.Display.Text = plr.DisplayName
	template.Frame.Username.Text = "@" .. plr.Name
	template.Icon.Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=48&h=48"):format(plr.UserId)

	_playerTemplates[userId] = template

	template.MouseEnter:Connect(function()
		local _color = {}
		local uiStroke = template:FindFirstChild("UIStroke")
		_stroke = uiStroke
		l_SoundService_0.SFX.Hover:Play();
		local l_v444_0 = template;
		local v446 = {
			BackgroundTransparency = 0.25
		};
		local v447 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_v444_0, v447, v446):Play();
	end)

	template.MouseLeave:Connect(function()
		local l_v444_1 = template;
		local v449 = {
			BackgroundTransparency = 0
		};
		local v450 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_v444_1, v450, v449):Play();
	end)

	template.Activated:Connect(function()
		if _selectedPlayer == plr.UserId then
			l_SoundService_0.SFX.Click:Play();
			_selectedPlayer = nil;
			local l_v444_2 = template;
			local v452 = {
				BackgroundColor3 = Color3.fromRGB(245, 245, 245)
			};
			local v453 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_2, v453, v452):Play();
			l_v444_2 = template.Frame.Display;
			v452 = {
				TextColor3 = Color3.fromRGB(0, 0, 0)
			};
			v453 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_2, v453, v452):Play();
			l_v444_2 = template.Frame.Username;
			v452 = {
				TextColor3 = Color3.fromRGB(0, 0, 0)
			};
			v453 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_2, v453, v452):Play();
			return;
		else
			
			_selectedPlayer = plr.UserId;
			l_SoundService_0.SFX.Click:Play();
			local l_v444_3 = template;
			local v455 = {
				BackgroundColor3 = Color3.fromRGB(0, 195, 255)
			};
			local v456 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_3, v456, v455):Play();
			--l_TweenService_0:Create(l_v444_3.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play();
			l_v444_3 = template.Frame.Display;
			v455 = {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			};
			v456 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_3, v456, v455):Play();
			l_v444_3 = template.Frame.Username;
			v455 = {
				TextColor3 = Color3.fromRGB(255, 255, 255)
			};
			v456 = TweenInfo.new(0.4, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v444_3, v456, v455):Play();
			for _, v458 in l_PlayerGui_0.ScreenGui.ShareGiftbux.Frame.Main.Players:GetChildren() do
				if v458:IsA("TextButton") and v458 ~= template then
					local v459 = {
						BackgroundColor3 = Color3.fromRGB(245, 245, 245)
					};
					local v460 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v458, v460, v459):Play();
					v459 = v458.Frame.Display;
					v460 = {
						TextColor3 = Color3.fromRGB(0, 0, 0)
					};
					local v461 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v459, v461, v460):Play();
					v459 = v458.Frame.Username;
					v460 = {
						TextColor3 = Color3.fromRGB(0, 0, 0)
					};
					v461 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(v459, v461, v460):Play();
				end;
			end;
		end
	end)
end

local _sharebutton = _shareui.Frame.Share
_sharebutton.Activated:Connect(function()
	if _selectedPlayer == nil then
		fun1("danger", "select a player & giftbuxs!")
		return
	end
	if _selectedPlayer == l_LocalPlayer_0.UserId then
		fun1("danger", "you cannot share to yourself!");
		return
	end

	if _allowed then
		local _selectedby = game.Players.LocalPlayer
		local _amountText = _shareui.Frame.Amount.Text

		if not tonumber(_amountText) then
			fun1("danger", "Must be a number!");
			return
		end

		local _amount = tonumber(_amountText)

		if _amount then
			if _amount < 0 then
				fun1("danger", "No negative numbers!")
				return
			elseif _amount > _max then
				fun1("success", "Max price is 1,000,000")
				return
			end
			print(_selectedPlayer)
			v30.Event("ShareGiftbux"):FireServer(_selectedPlayer, _amount)
		else
			print("Invalid amount")
		end
	else
		fun1("danger", "too fast!")
	end
end)

l_Players_0.PlayerRemoving:Connect(function(plr)
	if _playerTemplates[plr.UserId] then
		_playerTemplates[plr.UserId]:Destroy()  
		_playerTemplates[plr.UserId] = nil  
	end
end)

for _, player in pairs(l_Players_0:GetPlayers()) do
	addPlayer(player)
end
l_Players_0.PlayerAdded:Connect(function(plr)
	addPlayer(plr)
end)

v30.OnClientEvent("ShareGiftbux"):Connect(function(v643, v644, v6455)
	v69(false);
	if v643 == "shared" then
		l_SoundService_0.SFX.Success:Play();
		l_SoundService_0.SFX.ItemPurchase:Play();
		local v645 = ("You just shared %s giftbux with @%s"):format(v6455, v644);
		local l_spawn_35 = spawn;
		local v647 = "share";
		local v648 = nil;
		l_spawn_35(function()
			if l_PlayerGui_0.ScreenGui.Popups:GetAttribute("Enabled") or v647 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v649 = l_UITemplates_0[v647 .. "Popup"];
				if not v649 then
					print("NOPE");
					return ;
				else
					local v650 = v649:Clone();
					v650.Message.Text = v645;
					v650.Transparency = 1;
					v650.UIScale.Scale = 0;
					v650.Parent = l_PlayerGui_0.ScreenGui.Popups;
					l_TweenService_0:Create(v650, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
						Transparency = 0
					}):Play();
					l_TweenService_0:Create(v650.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 1
					}):Play();
					local l_Message_37 = v650.Message;
					local v652 = {
						MaxVisibleGraphemes = #v645
					};
					l_TweenService_0:Create(l_Message_37, TweenInfo.new(1, Enum.EasingStyle.Quint), v652):Play();
					wait(v648 or 4);
					l_TweenService_0:Create(v650, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Transparency = 1
					}):Play();
					l_TweenService_0:Create(v650.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 0
					}):Play();
					wait(0.5);
					v650:Destroy();
				end;
			end;
		end);

		return ;
	elseif v643 == "recieved" then
		l_SoundService_0.SFX.GiftReceived:Play();
		local l_spawn_36 = spawn;
		local v654 = "share";
		local v655 = ("You just got shared %s giftbux by @%s"):format(v6455, v644);
		local v656 = nil;
		l_spawn_36(function()
			if l_PlayerGui_0.ScreenGui.Popups:GetAttribute("Enabled") or v654 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v657 = l_UITemplates_0[v654 .. "Popup"];
				if not v657 then
					print("NOPE");
					return ;
				else
					local v658 = v657:Clone();
					v658.Message.Text = v655;
					v658.Transparency = 1;
					v658.UIScale.Scale = 0;
					v658.Parent = l_PlayerGui_0.ScreenGui.Popups;
					l_TweenService_0:Create(v658, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
						Transparency = 0
					}):Play();
					l_TweenService_0:Create(v658.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 1
					}):Play();
					local l_Message_38 = v658.Message;
					local v660 = {
						MaxVisibleGraphemes = #v655
					};
					l_TweenService_0:Create(l_Message_38, TweenInfo.new(1, Enum.EasingStyle.Quint), v660):Play();
					wait(v656 or 4);
					l_TweenService_0:Create(v658, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Transparency = 1
					}):Play();
					l_TweenService_0:Create(v658.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 0
					}):Play();
					wait(0.5);
					v658:Destroy();
				end;
			end;
		end);
		game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage((("<font color= \"rgb(255, 102, 222)\">you received %* giftbux from @%*!</font>"):format(v6455, v644)));
		return ;
	elseif v643 == "failed" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_37 = spawn;
		local v662 = "danger";
		local v663 = "failed to share giftbux, Make sure the player is on the server!";
		local v664 = nil;
		l_spawn_37(function()
			if l_PlayerGui_0.ScreenGui.Popups:GetAttribute("Enabled") or v662 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v665 = l_UITemplates_0[v662 .. "Popup"];
				if not v665 then
					print("NOPE");
					return ;
				else
					local v666 = v665:Clone();
					v666.Message.Text = v663;
					v666.Transparency = 1;
					v666.UIScale.Scale = 0;
					v666.Parent = l_PlayerGui_0.ScreenGui.Popups;
					l_TweenService_0:Create(v666, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
						Transparency = 0
					}):Play();
					l_TweenService_0:Create(v666.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 1
					}):Play();
					local l_Message_39 = v666.Message;
					local v668 = {
						MaxVisibleGraphemes = #v663
					};
					l_TweenService_0:Create(l_Message_39, TweenInfo.new(1, Enum.EasingStyle.Quint), v668):Play();
					wait(v664 or 4);
					l_TweenService_0:Create(v666, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Transparency = 1
					}):Play();
					l_TweenService_0:Create(v666.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 0
					}):Play();
					wait(0.5);
					v666:Destroy();
				end;
			end;
		end);
		return ;
	elseif v643 == "ratelimit" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_39 = spawn;
		local v678 = "danger";
		local v679 = "too fast!";
		local v680 = nil;
		l_spawn_39(function()
			if l_PlayerGui_0.ScreenGui.Popups:GetAttribute("Enabled") or v678 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v681 = l_UITemplates_0[v678 .. "Popup"];
				if not v681 then
					print("NOPE");
					return ;
				else
					local v682 = v681:Clone();
					v682.Message.Text = v679;
					v682.Transparency = 1;
					v682.UIScale.Scale = 0;
					v682.Parent = l_PlayerGui_0.ScreenGui.Popups;
					l_TweenService_0:Create(v682, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
						Transparency = 0
					}):Play();
					l_TweenService_0:Create(v682.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 1
					}):Play();
					local l_Message_41 = v682.Message;
					local v684 = {
						MaxVisibleGraphemes = #v679
					};
					l_TweenService_0:Create(l_Message_41, TweenInfo.new(1, Enum.EasingStyle.Quint), v684):Play();
					wait(v680 or 4);
					l_TweenService_0:Create(v682, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Transparency = 1
					}):Play();
					l_TweenService_0:Create(v682.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 0
					}):Play();
					wait(0.5);
					v682:Destroy();
				end;
			end;
		end);
		return ;
	elseif v643 == "error" then
		l_SoundService_0.SFX.Fail:Play();
		local l_spawn_40 = spawn;
		local v686 = "danger";
		local v687 = "error"
		local v688 = nil;
		l_spawn_40(function()
			if l_PlayerGui_0.ScreenGui.Popups:GetAttribute("Enabled") or v686 == "announcement" then
				l_SoundService_0.SFX.BellRing:Play();
				local v689 = l_UITemplates_0[v686 .. "Popup"];
				if not v689 then
					print("NOPE");
					return ;
				else
					local v690 = v689:Clone();
					v690.Message.Text = v687;
					v690.Transparency = 1;
					v690.UIScale.Scale = 0;
					v690.Parent = l_PlayerGui_0.ScreenGui.Popups;
					l_TweenService_0:Create(v690, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
						Transparency = 0
					}):Play();
					l_TweenService_0:Create(v690.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 1
					}):Play();
					local l_Message_42 = v690.Message;
					local v692 = {
						MaxVisibleGraphemes = #v687
					};
					l_TweenService_0:Create(l_Message_42, TweenInfo.new(1, Enum.EasingStyle.Quint), v692):Play();
					wait(v688 or 4);
					l_TweenService_0:Create(v690, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Transparency = 1
					}):Play();
					l_TweenService_0:Create(v690.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back or Enum.EasingStyle.Quint), {
						Scale = 0
					}):Play();
					wait(0.5);
					v690:Destroy();
				end;
			end;
		end);
		return ;
	end;
end);
task.spawn(function()
	local v456 = 0;
	local l_IntValue_0 = Instance.new("IntValue");
	v456 = v30.Function("GiftbuxBalance"):InvokeServer();
	if v456 then
		l_PlayerGui_0.ScreenGui.ShareGiftbux.TopFrame.Buttons.Giftbux.Balance.Text = "0";
		AnimatorModule.stop(l_IntValue_0);
		AnimatorModule.target(l_IntValue_0, 1, 2, {
			Value = v456
		});
	end;
	v30.OnClientEvent("NewGiftbuxBalance"):Connect(function(v459)
		v456 = v459;
		AnimatorModule.stop(l_IntValue_0);
		AnimatorModule.target(l_IntValue_0, 1, 2, {
			Value = v456
		});
	end);
	l_IntValue_0.Changed:Connect(function()
		l_PlayerGui_0.ScreenGui.ShareGiftbux.TopFrame.Buttons.Giftbux.Balance.Text = numberhelper.formatCommas(l_IntValue_0.Value);
	end);
end);
l_PlayerGui_0.ScreenGui.ShareGiftbux.TopFrame.Search:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1828 ]]
	for _, v673 in ipairs(l_PlayerGui_0.ScreenGui.ShareGiftbux.Frame.Main.Players:GetChildren()) do
		if v673:IsA("TextButton") then
			local v674 = string.find(string.lower(v673.Frame.Display.Text), string.lower(l_PlayerGui_0.ScreenGui.ShareGiftbux.TopFrame.Search.Text), 1, true) ~= nil;
			local v675 = string.find(string.lower(v673.Frame.Username.Text), string.lower(l_PlayerGui_0.ScreenGui.ShareGiftbux.TopFrame.Search.Text), 1, true) ~= nil;
			v673.Visible = v674 or v675
		end;
	end;
end);
if not l_UserInputService_0.TouchEnabled then
	l_PlayerGui_0.ScreenGui.Giftbux.MouseEnter:Connect(function()
		l_PlayerGui_0.ScreenGui.Giftbux.Share.Visible = true;
	end)
	l_PlayerGui_0.ScreenGui.Giftbux.MouseLeave:Connect(function()
		l_PlayerGui_0.ScreenGui.Giftbux.Share.Visible = false;
	end)
else
	l_PlayerGui_0.ScreenGui.Giftbux.Share.Visible = true;
end