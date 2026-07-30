-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local _ = game:GetService("StarterGui");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local _ = l_LocalPlayer_0:GetMouse();
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local _ = l_PlayerGui_0:WaitForChild("LoadingGui");
local l_CustomCoreGui_0 = l_PlayerGui_0:WaitForChild("CustomCoreGui");
local _ = game:GetService("StarterGui"):WaitForChild("UITemplates");
local _ = l_ReplicatedStorage_0.Templates;
local l_NavigationButtons_0 = l_ScreenGui_0:WaitForChild("NavigationButtons");
local v18 = nil;
local v19 = {
	l_ScreenGui_0:WaitForChild("EditBooth"), 
	l_ScreenGui_0:WaitForChild("Shop"), 
	l_ScreenGui_0:WaitForChild("Gift"), 
	l_ScreenGui_0:WaitForChild("Redeem"), 
	l_ScreenGui_0:WaitForChild("Settings"), 
	l_ScreenGui_0:WaitForChild("EditBooth")
};
local v20 = {
	{
		idle = "rbxassetid://14760965202", 
		hover = "rbxassetid://14760965284", 
		clicked = "rbxassetid://14760965088"
	}, 
	{
		idle = "rbxassetid://14760963686", 
		hover = "rbxassetid://14760963778", 
		clicked = "rbxassetid://14760963515"
	}, 
	{
		idle = "rbxassetid://14760964755", 
		hover = "rbxassetid://14760964938", 
		clicked = "rbxassetid://14760964636"
	}, 
	{
		idle = "rbxassetid://14760964360", 
		hover = "rbxassetid://14760964519", 
		clicked = "rbxassetid://14760964216"
	}, 
	{
		idle = "rbxassetid://14760963964", 
		hover = "rbxassetid://14760964079", 
		clicked = "rbxassetid://14760963882"
	}, 
	{
		idle = "rbxassetid://14760965539", 
		hover = "rbxassetid://14760965685", 
		clicked = "rbxassetid://14760965410"
	}
};
local function _(v21, v22, v23, v24) --[[ Line: 45 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	local v25 = TweenInfo.new(v22, v24 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(v21, v25, v23):Play();
end;
local function _(v27, v28, v29, v30) --[[ Line: 50 ]] --[[ Name: updateButton ]]
	-- upvalues: l_TweenService_0 (copy)
	local l_UIScale_0 = v27.UIScale;
	local v32 = {
		Scale = v28
	};
	local l_Back_0 = Enum.EasingStyle.Back;
	local v34 = TweenInfo.new(v30, l_Back_0 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(l_UIScale_0, v34, v32):Play();
	v27.Image = v29;
end;
local function v42(v36, v37) --[[ Line: 55 ]] --[[ Name: updateHint ]]
	-- upvalues: l_ScreenGui_0 (copy), l_TweenService_0 (copy)
	l_ScreenGui_0.HintInfo.UIScale.Scale = 0;
	local l_UIScale_1 = l_ScreenGui_0.HintInfo.UIScale;
	local v39 = {
		Scale = 1
	};
	local l_Back_1 = Enum.EasingStyle.Back;
	local v41 = TweenInfo.new(0.15, l_Back_1 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(l_UIScale_1, v41, v39):Play();
	l_ScreenGui_0.HintInfo.Visible = v36;
	l_ScreenGui_0.HintInfo.TextLabel.Text = v37;
end;
local v43 = {
	l_ScreenGui_0.ColorPicker, 
	l_ScreenGui_0.Exit, 
	l_ScreenGui_0.ExitObby, 
	l_ScreenGui_0.BoothInfo, 
	l_ScreenGui_0.ButtonInfo, 
	l_ScreenGui_0.Shade, 
	l_ScreenGui_0.Popups, 
	l_ScreenGui_0.FontPicker, 
	l_ScreenGui_0.Giftbux, 
	l_ScreenGui_0.GiftbuxMobile, 
	l_ScreenGui_0.TransactionInfo, 
	l_ScreenGui_0.Loading, 
	l_ScreenGui_0.EditSign, 
	l_ScreenGui_0.DisabledItem, 
	l_ScreenGui_0.Diamonds, 
	l_ScreenGui_0.HintInfo, 
	l_ScreenGui_0.Countdown
};
for _, v45 in l_ScreenGui_0:GetChildren() do
	if v45:IsA("CanvasGroup") or v45:IsA("VideoFrame") then
		v45:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 84 ]]
			-- upvalues: v43 (copy), v45 (copy), l_NavigationButtons_0 (copy), v20 (copy), l_ScreenGui_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), v18 (ref), l_CustomCoreGui_0 (copy)
			if table.find(v43, v45) then
				return;
			else
				local v46 = l_NavigationButtons_0:FindFirstChild(v45.Name) or nil;
				local _ = nil;
				local v48 = nil;
				if v46 then
					v48 = v20[v46.LayoutOrder];
				end;
				if v45.Visible then
					for _, v50 in l_ScreenGui_0:GetChildren() do
						if v50 ~= v45 and v50:IsA("CanvasGroup") and not table.find(v43, v50) then
							v50.Visible = false;
						end;
					end;
					local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
					local v52 = {
						FieldOfView = 60
					};
					local v53 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = l_Lighting_0.Blur;
					v52 = {
						Size = 15
					};
					v53 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = l_Lighting_0.ColorCorrection;
					v52 = {
						TintColor = Color3.fromRGB(200, 200, 200)
					};
					v53 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = l_ScreenGui_0.Shade;
					v52 = {
						GroupTransparency = 0
					};
					v53 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = l_ScreenGui_0.Shade.Background;
					v52 = {
						BackgroundColor3 = v45.TopFrame.BackgroundColor3
					};
					v53 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					if v45:FindFirstChild("Frame") then
						l_l_CurrentCamera_0_0 = v45.Frame.UIPadding.PaddingLeft;
						v45.TopFrame.UIPadding.PaddingLeft = UDim.new(0, 100);
						v45.Frame.UIPadding.PaddingLeft = UDim.new(0, 100);
						v52 = v45.TopFrame.UIPadding;
						v53 = {
							PaddingLeft = UDim.new(0, 30)
						};
						local v54 = TweenInfo.new(0.6, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v52, v54, v53):Play();
						v52 = v45.Frame.UIPadding;
						v53 = {
							PaddingLeft = l_l_CurrentCamera_0_0
						};
						v54 = TweenInfo.new(0.6, Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v52, v54, v53):Play();
					end;
					v45.Rotation = math.random(-5, 5);
					v45.Position = UDim2.new(0.5, 0, 0.55, 0);
					v45.Transparency = 1;
					l_l_CurrentCamera_0_0 = v45;
					v52 = {
						Rotation = 0
					};
					v53 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = v45;
					v52 = {
						Transparency = 0
					};
					v53 = TweenInfo.new(0.35, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v53, v52):Play();
					l_l_CurrentCamera_0_0 = v45;
					v52 = {
						Position = UDim2.new(0.5, 0, 0.5, 0)
					};
					v53 = Enum.EasingStyle.Back;
					local v55 = TweenInfo.new(0.5, v53 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_0, v55, v52):Play();
					if v46 ~= nil then
						l_l_CurrentCamera_0_0 = v48.clicked;
						v52 = v46.UIScale;
						v53 = {
							Scale = 1.25
						};
						v55 = Enum.EasingStyle.Back;
						local v56 = TweenInfo.new(0.4, v55 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v52, v56, v53):Play();
						v46.Image = l_l_CurrentCamera_0_0;
					end;
					v18 = v46;
					if l_ScreenGui_0.AbsoluteSize.X < 1200 then
						l_ScreenGui_0.GiftbuxMobile.Visible = false;
					else
						l_ScreenGui_0.Giftbux.Visible = false;
					end;
					l_CustomCoreGui_0.Toolbar.Visible = false;
					return;
				else
					local l_l_CurrentCamera_0_1 = l_CurrentCamera_0;
					local v58 = {
						FieldOfView = 70
					};
					local v59 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_1, v59, v58):Play();
					l_l_CurrentCamera_0_1 = l_Lighting_0.Blur;
					v58 = {
						Size = 0
					};
					v59 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_1, v59, v58):Play();
					l_l_CurrentCamera_0_1 = l_Lighting_0.ColorCorrection;
					v58 = {
						TintColor = Color3.fromRGB(255, 255, 255)
					};
					v59 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_1, v59, v58):Play();
					l_l_CurrentCamera_0_1 = l_ScreenGui_0.Shade;
					v58 = {
						GroupTransparency = 1
					};
					v59 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_1, v59, v58):Play();
					l_l_CurrentCamera_0_1 = l_ScreenGui_0.Shade.Background;
					v58 = {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					};
					v59 = TweenInfo.new(1, Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_l_CurrentCamera_0_1, v59, v58):Play();
					if v46 ~= nil then
						l_l_CurrentCamera_0_1 = v48.idle;
						v58 = v46.UIScale;
						v59 = {
							Scale = 1.1
						};
						local l_Back_2 = Enum.EasingStyle.Back;
						local v61 = TweenInfo.new(0.4, l_Back_2 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(v58, v61, v59):Play();
						v46.Image = l_l_CurrentCamera_0_1;
					end;
					v18 = nil;
					if l_ScreenGui_0.AbsoluteSize.X < 1200 then
						l_ScreenGui_0.GiftbuxMobile.Visible = true;
					else
						l_ScreenGui_0.Giftbux.Visible = true;
					end;
					l_CustomCoreGui_0.Toolbar.Visible = true;
					return;
				end;
			end;
		end);
	end;
end;
for _, v63 in ipairs(l_NavigationButtons_0:GetChildren()) do
	if v63:IsA("ImageButton") then
		local v64 = v20[v63.LayoutOrder];
		v63.MouseEnter:Connect(function() --[[ Line: 207 ]]
			-- upvalues: l_SoundService_0 (copy), v63 (copy), l_TweenService_0 (copy), v18 (ref), v64 (copy)
			l_SoundService_0.SFX.Hover:Play();
			local l_Label_0 = v63.Label;
			local v66 = {
				TextTransparency = 0
			};
			local v67 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_Label_0, v67, v66):Play();
			if v63 ~= v18 then
				l_Label_0 = v63;
				v66 = v64.idle;
				v67 = l_Label_0.UIScale;
				local v68 = {
					Scale = 1.1
				};
				local l_Back_3 = Enum.EasingStyle.Back;
				local v70 = TweenInfo.new(0.3, l_Back_3 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v67, v70, v68):Play();
				l_Label_0.Image = v66;
			end;
		end);
		v63.MouseLeave:Connect(function() --[[ Line: 216 ]]
			-- upvalues: v63 (copy), l_TweenService_0 (copy), v18 (ref), v64 (copy)
			local l_Label_1 = v63.Label;
			local v72 = {
				TextTransparency = 1
			};
			local v73 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_Label_1, v73, v72):Play();
			if v63 ~= v18 then
				l_Label_1 = v63;
				v72 = v64.idle;
				v73 = l_Label_1.UIScale;
				local v74 = {
					Scale = 1
				};
				local l_Back_4 = Enum.EasingStyle.Back;
				local v76 = TweenInfo.new(0.3, l_Back_4 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(v73, v76, v74):Play();
				l_Label_1.Image = v72;
			end;
		end);
		v63.Activated:Connect(function() --[[ Line: 224 ]]
			-- upvalues: l_SoundService_0 (copy), v63 (copy), v18 (ref), v64 (copy), l_TweenService_0 (copy), v19 (copy), v20 (copy)
			l_SoundService_0.SFX.Click:Play();
			if v63 == v18 then
				local l_v63_0 = v63;
				local l_idle_0 = v64.idle;
				local l_UIScale_2 = l_v63_0.UIScale;
				local v80 = {
					Scale = 1.1
				};
				local l_Back_5 = Enum.EasingStyle.Back;
				local v82 = TweenInfo.new(0.4, l_Back_5 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_UIScale_2, v82, v80):Play();
				l_v63_0.Image = l_idle_0;
				if v63.Name ~= "Admin" then
					v19[v18.LayoutOrder].Visible = false;
				end;
				v18 = nil;
				return;
			else
				if v18 then
					local l_v18_0 = v18;
					local l_idle_1 = v20[v18.LayoutOrder].idle;
					local l_UIScale_3 = l_v18_0.UIScale;
					local v86 = {
						Scale = 1
					};
					local l_Back_6 = Enum.EasingStyle.Back;
					local v88 = TweenInfo.new(0.3, l_Back_6 or Enum.EasingStyle.Quint);
					l_TweenService_0:Create(l_UIScale_3, v88, v86):Play();
					l_v18_0.Image = l_idle_1;
				end;
				v18 = v63;
				local l_v63_1 = v63;
				local l_clicked_0 = v64.clicked;
				local l_UIScale_4 = l_v63_1.UIScale;
				local v92 = {
					Scale = 1.25
				};
				local l_Back_7 = Enum.EasingStyle.Back;
				local v94 = TweenInfo.new(0.4, l_Back_7 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_UIScale_4, v94, v92):Play();
				l_v63_1.Image = l_clicked_0;
				if v63.Name ~= "Admin" then
					v19[v18.LayoutOrder].Visible = true;
				end;
				return;
			end;
		end);
	end;
end;
for _, v96 in pairs(l_CollectionService_0:GetTagged("Expand")) do
	local v97 = false;
	local l_Parent_0 = v96.Parent.Parent.Parent;
	local l_Size_0 = l_Parent_0.Size;
	v96.MouseEnter:Connect(function() --[[ Line: 254 ]]
		-- upvalues: l_SoundService_0 (copy), v96 (copy), l_TweenService_0 (copy), v42 (copy)
		l_SoundService_0.SFX.Hover:Play();
		if v96:IsA("ImageButton") then
			local l_v96_0 = v96;
			local v101 = {
				ImageTransparency = 0.25
			};
			local v102 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v96_0, v102, v101):Play();
			v42(true, v96.Name);
		end;
	end);
	v96.MouseLeave:Connect(function() --[[ Line: 262 ]]
		-- upvalues: v96 (copy), l_TweenService_0 (copy), v42 (copy)
		if v96:IsA("ImageButton") then
			local l_v96_1 = v96;
			local v104 = {
				ImageTransparency = 0
			};
			local v105 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v96_1, v105, v104):Play();
		end;
		v42(false, v96.Name);
	end);
	do
		local l_v97_0 = v97;
		v96.Activated:Connect(function() --[[ Line: 269 ]]
			-- upvalues: l_v97_0 (ref), l_Parent_0 (copy), l_Size_0 (copy), l_TweenService_0 (copy)
			if l_v97_0 then
				local l_l_Parent_0_0 = l_Parent_0;
				local v108 = {
					Size = l_Size_0
				};
				local v109 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_l_Parent_0_0, v109, v108):Play();
				l_v97_0 = false;
				return;
			else
				local l_l_Parent_0_1 = l_Parent_0;
				local v111 = {
					Size = UDim2.new(l_Size_0.X.Scale, l_Size_0.X.Offset, 0.5, 0)
				};
				local v112 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_l_Parent_0_1, v112, v111):Play();
				l_v97_0 = true;
				return;
			end;
		end);
	end;
end;
for _, v114 in l_CollectionService_0:GetTagged("Navigate") do
	v114.MouseEnter:Connect(function() --[[ Line: 281 ]]
		-- upvalues: l_SoundService_0 (copy), v114 (copy), l_TweenService_0 (copy), v42 (copy), l_ScreenGui_0 (copy)
		l_SoundService_0.SFX.Hover:Play();
		if v114:IsA("ImageButton") then
			local l_v114_0 = v114;
			local v116 = {
				ImageTransparency = 0.25
			};
			local v117 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v114_0, v117, v116):Play();
			v42(true, v114.Name);
		end;
		if v114.Name == "Add" and v114.Parent.Name == "Giftbux" and l_ScreenGui_0.GiftbuxEarn.Frame.Ads.WatchAd.Active == true then
			v42(true, "Watch Ad for free Giftbux!");
		end;
	end);
	v114.MouseLeave:Connect(function() --[[ Line: 295 ]]
		-- upvalues: v114 (copy), l_TweenService_0 (copy), v42 (copy)
		if v114:IsA("ImageButton") then
			local l_v114_1 = v114;
			local v119 = {
				ImageTransparency = 0
			};
			local v120 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_v114_1, v120, v119):Play();
		end;
		v42(false, v114.Name);
	end);
	v114.Activated:Connect(function() --[[ Line: 302 ]]
		-- upvalues: v114 (copy), l_SoundService_0 (copy), l_NavigationButtons_0 (copy), v20 (copy), v18 (ref), l_TweenService_0 (copy)
		if v114:FindFirstChild("Target") then
			l_SoundService_0.SFX.Click:Play();
			v114.Target.Value.Visible = true;
			if v114.Parent.Parent.Parent.Visible == false then
				for _, v122 in l_NavigationButtons_0:GetChildren() do
					if v122:IsA("ImageButton") then
						local v123 = v20[v122.LayoutOrder];
						v18 = nil;
						local l_idle_2 = v123.idle;
						local l_UIScale_5 = v122.UIScale;
						local v126 = {
							Scale = 1
						};
						local l_Back_8 = Enum.EasingStyle.Back;
						local v128 = TweenInfo.new(0.3, l_Back_8 or Enum.EasingStyle.Quint);
						l_TweenService_0:Create(l_UIScale_5, v128, v126):Play();
						v122.Image = l_idle_2;
					end;
				end;
				return;
			end;
		else
			l_SoundService_0.SFX.Apply:Play();
			v114.Parent.Parent.Parent.Visible = false;
		end;
	end);
end;
task.wait(2);
for _, v130 in l_CollectionService_0:GetTagged("Hint") do
	v130.MouseEnter:Connect(function() --[[ Line: 328 ]]
		-- upvalues: v42 (copy), v130 (copy)
		v42(true, v130:GetAttribute("Hint"));
	end);
	v130.MouseLeave:Connect(function() --[[ Line: 332 ]]
		-- upvalues: v42 (copy), v130 (copy)
		v42(false, v130.Name);
	end);
end;