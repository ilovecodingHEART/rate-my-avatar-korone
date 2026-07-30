-- wow

local l_Parent_0 = script.Parent.Parent;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Fusion);
return function(v4) --[[ Line: 8 ]] --[[ Name: BoothButton ]]
	local l_text_0 = v4.text;
	local l_details_0 = v4.details;
	local l_onActivated_0 = v4.onActivated;
	local v8 = script.BoothButton:Clone();
	local v9 = v3.State("None");
	v8.Name = l_text_0;
	v8.LayoutOrder = v4.layoutOrder;
	if l_details_0 == nil then
		warn((("Booth details for %* booth is nil, make sure it's added to ExclusiveBooths in the Booths script"):format(l_text_0)));
		v8.Text = l_text_0 .. " (error details not found)";
		v8.TextColor3 = Color3.new(0, 0, 0);
		v8.TextTransparency = 0.5;
		v8.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	else
		v3.New("ImageButton")({
			BackgroundTransparency = 1, 
			Image = l_details_0.icon.Image or "rbxassetid://15842040263", 
			ImageRectSize = l_details_0.icon.ImageRectSize, 
			ImageRectOffset = l_details_0.icon.ImageRectOffset, 
			Size = UDim2.fromScale(1, 1), 
			[v3.OnEvent("InputBegan")] = function(v10) --[[ Line: 136 ]]
				if v10.UserInputType == Enum.UserInputType.MouseMovement and v10.UserInputState == Enum.UserInputState.Change then
					v9:set("Hovering");
				end;
				if v10.UserInputType == Enum.UserInputType.MouseButton1 and v10.UserInputState == Enum.UserInputState.Begin then
					v9:set("Pressing");
				end;
				if v10.UserInputType == Enum.UserInputType.Touch and v10.UserInputState == Enum.UserInputState.Begin then
					v9:set("Pressing");
				end;
			end, 
			[v3.OnEvent("InputEnded")] = function(v11) --[[ Line: 150 ]]
				if v11.UserInputType == Enum.UserInputType.MouseMovement and v11.UserInputState == Enum.UserInputState.Change then
					v9:set("None");
				end;
				if v11.UserInputType == Enum.UserInputType.MouseButton1 and v11.UserInputState == Enum.UserInputState.End and v9:get() == "Pressing" then
					v9:set("Hovering");
				end;
				if v11.UserInputType == Enum.UserInputType.Touch and v11.UserInputState == Enum.UserInputState.End then
					v9:set("None");
				end;
				if v11.UserInputType == Enum.UserInputType.Touch and v11.UserInputState == Enum.UserInputState.Change then
					v9:set("None");
				end;
			end, 
			[v3.OnEvent("Activated")] = l_onActivated_0, 
			[v3.Children] = {
				v8.UICorner:Clone(), 
				if l_details_0.hoverIcon then v3.New("ImageLabel")({
					Name = "Hover", 
					BackgroundTransparency = 1, 
					ImageTransparency = v3.Spring(v3.Computed(function() --[[ Line: 178 ]]
						if v9:get() == "Hovering" then
							return 0;
							else
							return 1;
						end;
					end), 25, 0.5), 
					Image = l_details_0.hoverIcon.Image, 
					ImageRectSize = l_details_0.hoverIcon.ImageRectSize, 
					ImageRectOffset = l_details_0.hoverIcon.ImageRectOffset, 
					Size = UDim2.fromScale(1, 1), 
					[v3.Children] = {
						v8.UICorner:Clone()
					}
				}) else nil
	}
	}).Parent = v8;
	if l_details_0.icon then
	v8.UIPadding:Destroy();
	v8.BackgroundTransparency = 1;
end;
v8.Text = l_details_0.name or "Unnamed Booth: " .. l_text_0;
v8.TextColor3 = Color3.new(1, 1, 1);
v8.TextTransparency = 0;
v8.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
end;
v3.Compat(v9):onChange(function() --[[ Line: 205 ]]
	if v9:get() == "Hovering" then
		task.defer(function() --[[ Line: 207 ]]
			l_Parent_0.BoothInfo.BoothName.Text = l_details_0.name or "Unnamed Booth: " .. l_text_0;
			if v8:FindFirstChild("EditBoothColors") then
				v8.EditBoothColors.Visible = true;
			end;
			if l_details_0.price then
				l_Parent_0.BoothInfo.Giftbux.TextLabel.Text = l_details_0.price;
				l_Parent_0.BoothInfo.Giftbux.Visible = true;
			else
				l_Parent_0.BoothInfo.Giftbux.Visible = false;
			end;
			if l_details_0.whenPurchased then
				local v12 = l_details_0.whenPurchased:FormatLocalTime("ll", game.Players.LocalPlayer.LocaleId);
				l_Parent_0.BoothInfo.WhenPurchased.Text = "BOUGHT " .. v12;
				l_Parent_0.BoothInfo.WhenPurchased.Visible = true;
			else
				l_Parent_0.BoothInfo.WhenPurchased.Visible = false;
			end;
			l_Parent_0.BoothInfo.Visible = true;
		end);
		return;
	else
		l_Parent_0.BoothInfo.Visible = false;
		if not l_UserInputService_0.TouchEnabled and l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.MouseEnabled and v8:FindFirstChild("EditBoothColors") then
			v8.EditBoothColors.Visible = false;
		end;
		return;
	end;
end);
v8.UIStroke:Destroy();
local _ = v3.New("UIStroke")({
	Parent = v8, 
	ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
	Color = Color3.fromRGB(0, 153, 255), 
	Thickness = 2, 
	Enabled = v4.isSelected
});
v8.Activated:Connect(l_onActivated_0);
return v8;
end;