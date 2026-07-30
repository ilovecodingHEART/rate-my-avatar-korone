-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("SoundService");
local _ = game:GetService("StarterGui");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local _ = game:GetService("CollectionService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local _ = l_LocalPlayer_0:GetMouse();
local _ = workspace.CurrentCamera;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local _ = l_PlayerGui_0:WaitForChild("LoadingGui");
local l_CustomCoreGui_0 = l_PlayerGui_0:WaitForChild("CustomCoreGui");
local _ = game:GetService("StarterGui"):WaitForChild("UITemplates");
local _ = l_ReplicatedStorage_0.Templates;
local function _(v17, v18, v19, v20) --[[ Line: 24 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	local v21 = TweenInfo.new(v18, v20 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(v17, v21, v19):Play();
end;
local function v37() --[[ Line: 29 ]] --[[ Name: scale ]]
	-- upvalues: l_ScreenGui_0 (copy), l_TweenService_0 (copy), l_CustomCoreGui_0 (copy)
	for _, v24 in ipairs(l_ScreenGui_0:GetChildren()) do
		if v24:FindFirstChild("UIScale") and v24.Name ~= "Diamonds" then
			local l_UIScale_0 = v24.UIScale;
			local v26 = math.min(l_ScreenGui_0.AbsoluteSize.X, l_ScreenGui_0.AbsoluteSize.Y);
			local v27 = {
				Scale = (if v26 < 800 then v26 / 300 else v26 / 500) / 1.5
			};
			local v28 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_UIScale_0, v28, v27):Play();
		end;
	end;
	if l_ScreenGui_0.AbsoluteSize.X < 1300 then
		game.TextChatService.ChatWindowConfiguration.TextSize = 14;
		game.TextChatService.ChatInputBarConfiguration.TextSize = 14;
		game.TextChatService.ChannelTabsConfiguration.TextSize = 16;
		game.TextChatService.ChatWindowConfiguration.HeightScale = 1;
		game.TextChatService.ChatWindowConfiguration.WidthScale = 1;
		l_CustomCoreGui_0.Toolbar.Size = UDim2.new(1, 0, 0, 35);
		l_CustomCoreGui_0.Toolbar.UIListLayout.Padding = UDim.new(0, 6);
		l_CustomCoreGui_0.Toolbar.LocalScript.Slot.UIStroke.Thickness = 1.8;
		for _, v30 in l_CustomCoreGui_0.Toolbar:GetChildren() do
			if v30:IsA("TextButton") then
				v30.UIStroke.Thickness = 1.8;
			end;
		end;
		for _, v32 in l_ScreenGui_0.NavigationButtons:GetChildren() do
			if v32:IsA("ImageButton") then
				v32.Size = UDim2.new(0, 35, 0, 35);
			end;
		end;
		l_ScreenGui_0.Giftbux.Visible = false;
		l_ScreenGui_0.Giftbux.GroupTransparency = 1;
		l_ScreenGui_0.GiftbuxMobile.Visible = true;
		l_ScreenGui_0.GiftbuxMobile.GroupTransparency = 0;
		return;
	else
		game.TextChatService.ChatWindowConfiguration.TextSize = 16;
		game.TextChatService.ChatInputBarConfiguration.TextSize = 16;
		game.TextChatService.ChannelTabsConfiguration.TextSize = 18;
		game.TextChatService.ChatWindowConfiguration.HeightScale = 0.9;
		game.TextChatService.ChatWindowConfiguration.WidthScale = 0.7;
		l_CustomCoreGui_0.Toolbar.Size = UDim2.new(1, 0, 0, 50);
		l_CustomCoreGui_0.Toolbar.UIListLayout.Padding = UDim.new(0, 14);
		l_CustomCoreGui_0.Toolbar.LocalScript.Slot.UIStroke.Thickness = 3;
		for _, v34 in l_CustomCoreGui_0.Toolbar:GetChildren() do
			if v34:IsA("TextButton") then
				v34.UIStroke.Thickness = 3;
			end;
		end;
		for _, v36 in l_ScreenGui_0.NavigationButtons:GetChildren() do
			if v36:IsA("ImageButton") then
				v36.Size = UDim2.new(0, 50, 0, 50);
			end;
		end;
		l_ScreenGui_0.Giftbux.Visible = true;
		l_ScreenGui_0.Giftbux.GroupTransparency = 0;
		l_ScreenGui_0.GiftbuxMobile.Visible = false;
		l_ScreenGui_0.GiftbuxMobile.GroupTransparency = 1;
		return;
	end;
end;
l_ScreenGui_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 94 ]]
	-- upvalues: v37 (copy)
	v37();
end);
v37();