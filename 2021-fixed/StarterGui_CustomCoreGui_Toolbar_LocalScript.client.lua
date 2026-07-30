-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = game:GetService("Players")
local v2 = game:GetService("StarterGui")
local v3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v1.LocalPlayer
local v_u_6 = script.Parent
local v_u_7 = 1
local v_u_8 = 0
v2:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local v_u_9 = false
local function v_u_14()
	-- upvalues: (copy) v_u_5, (ref) v_u_9, (copy) v_u_6
	local v10 = workspace:FindFirstChild("HalloweenObbies") ~= nil
	local v11 = v_u_5.Character
	local v12
	if v11 then
		v12 = v11:FindFirstChild("HumanoidRootPart")
	else
		v12 = v11
	end
	if v12 then
		v12 = v12.Position.Y > 500
	end
	local v13 = v10 and v12 and v12 or false
	if v13 ~= v_u_9 then
		v_u_9 = v13
		v_u_6.Visible = not v13
		if v13 then
			if v11 then
				v11 = v11:FindFirstChildOfClass("Humanoid")
			end
			if v11 then
				v11:UnequipTools()
			end
		end
	end
end
v_u_14()
workspace.ChildAdded:Connect(function()
	-- upvalues: (copy) v_u_14
	v_u_14()
end)
workspace.ChildRemoved:Connect(function()
	-- upvalues: (copy) v_u_14
	v_u_14()
end)
v_u_5.CharacterAdded:Connect(function(p_u_15)
	-- upvalues: (copy) v_u_14
	task.spawn(function()
		-- upvalues: (copy) p_u_15, (ref) v_u_14
		local v16 = p_u_15:WaitForChild("HumanoidRootPart", 5)
		if v16 then
			v16:GetPropertyChangedSignal("Position"):Connect(v_u_14)
			v_u_14()
		end
	end)
end)
if v_u_5.Character and v_u_5.Character:FindFirstChild("HumanoidRootPart") then
	v_u_5.Character.HumanoidRootPart:GetPropertyChangedSignal("Position"):Connect(v_u_14)
end
local function v_u_22()
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	for _, v17 in ipairs(v_u_6:GetChildren()) do
		if v17:IsA("TextButton") then
			v_u_4:Create(v17.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
				["Scale"] = 1
			}):Play()
			local v18 = v17.UIStroke
			local v19 = {
				["Color"] = Color3.fromRGB(255, 255, 255)
			}
			v_u_4:Create(v18, TweenInfo.new(0.25), v19):Play()
			local v20 = v17.Keybind
			local v21 = {
				["BackgroundColor3"] = Color3.fromRGB(10, 202, 255)
			}
			v_u_4:Create(v20, TweenInfo.new(0.25), v21):Play()
		end
	end
	if v_u_5.Character and v_u_5.Character:FindFirstChildOfClass("Humanoid") then
		v_u_5.Character.Humanoid:UnequipTools()
	end
end
local function v_u_29(p23)
	-- upvalues: (ref) v_u_9, (copy) v_u_22, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	if v_u_9 then
		v_u_22()
	else
		local v24 = v_u_6:FindFirstChild(p23.Name)
		if v24 then
			v_u_22()
			v_u_4:Create(v24.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
				["Scale"] = 1.3
			}):Play()
			local v25 = v24.UIStroke
			local v26 = {
				["Color"] = Color3.fromRGB(10, 202, 255)
			}
			v_u_4:Create(v25, TweenInfo.new(0.25), v26):Play()
			local v27 = v24.Keybind
			local v28 = {
				["BackgroundColor3"] = Color3.fromRGB(10, 202, 255)
			}
			v_u_4:Create(v27, TweenInfo.new(0.25), v28):Play()
			if v_u_5.Character and v_u_5.Character:FindFirstChildOfClass("Humanoid") then
				v_u_5.Character.Humanoid:EquipTool(p23)
				return
			end
		elseif v_u_5.Character and v_u_5.Character:FindFirstChild(p23.Name) then
			v_u_22()
		end
	end
end
local function v_u_32(p30)
	-- upvalues: (ref) v_u_9, (copy) v_u_22, (copy) v_u_6, (copy) v_u_5, (copy) v_u_29
	if v_u_9 then
		v_u_22()
	else
		for _, v31 in ipairs(v_u_6:GetChildren()) do
			if v31:IsA("TextButton") and v31.LayoutOrder == p30 then
				if v_u_5.Backpack:FindFirstChild(v31.Name) then
					v_u_29(v_u_5.Backpack:FindFirstChild(v31.Name))
				else
					v_u_22()
				end
			end
		end
	end
end
local function v_u_41(p33)
	-- upvalues: (copy) v_u_6, (ref) v_u_7, (ref) v_u_9, (copy) v_u_22, (copy) v_u_5, (copy) v_u_29, (copy) v_u_4
	if not v_u_6:FindFirstChild(p33.Name) then
		local v_u_34 = script:WaitForChild("Slot"):Clone()
		v_u_34.Name = p33.Name
		v_u_34.Keybind.Text = v_u_7
		v_u_34.LayoutOrder = v_u_7
		v_u_34.Icon.Image = p33.TextureId
		v_u_34.Parent = script.Parent
		v_u_7 = v_u_7 + 1
		p33.Destroying:Connect(function()
			-- upvalues: (ref) v_u_34, (ref) v_u_7, (ref) v_u_6
			v_u_34:Destroy()
			v_u_7 = v_u_7 - 1
			local v35 = {}
			for _, v36 in pairs(v_u_6:GetChildren()) do
				if v36:IsA("TextButton") then
					table.insert(v35, v36)
				end
			end
			table.sort(v35, function(p37, p38)
				return p37.LayoutOrder < p38.LayoutOrder
			end)
			for v39, v40 in ipairs(v35) do
				v40.LayoutOrder = v39
				v40.Keybind.Text = tostring(v39)
			end
		end)
		if v_u_34:IsA("TextButton") then
			v_u_34.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_22, (ref) v_u_5, (ref) v_u_34, (ref) v_u_29
				if v_u_9 then
					v_u_22()
					return
				elseif v_u_5.Backpack:FindFirstChild(v_u_34.Name) then
					v_u_29(v_u_5.Backpack:FindFirstChild(v_u_34.Name))
				else
					v_u_22()
				end
			end)
			v_u_34.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_34, (ref) v_u_4
				v_u_4:Create(v_u_34, TweenInfo.new(0.25), {
					["BackgroundTransparency"] = 0.2
				}):Play()
			end)
			v_u_34.MouseLeave:Connect(function()
				-- upvalues: (ref) v_u_34, (ref) v_u_4
				v_u_4:Create(v_u_34, TweenInfo.new(0.25), {
					["BackgroundTransparency"] = 0.5
				}):Play()
			end)
		end
	end
end
local function v_u_45(p42)
	-- upvalues: (copy) v_u_41
	for _, v43 in ipairs(p42:GetChildren()) do
		if v43:IsA("Tool") then
			v_u_41(v43)
		end
	end
	p42.ChildAdded:Connect(function(p44)
		-- upvalues: (ref) v_u_41
		if p44:IsA("Tool") then
			v_u_41(p44)
		end
	end)
end
if v_u_5.Backpack then
	v_u_45(v_u_5.Backpack)
end
v_u_5.ChildAdded:Connect(function(p46)
	-- upvalues: (copy) v_u_45
	if p46:IsA("Backpack") then
		v_u_45(p46)
	end
end)
v3.InputBegan:Connect(function(p47, p48)
	-- upvalues: (ref) v_u_9, (copy) v_u_22, (copy) v_u_6, (copy) v_u_5, (copy) v_u_29, (ref) v_u_8, (copy) v_u_32
	if p48 then
		return
	elseif v_u_9 then
		v_u_22()
		return
	elseif p47.UserInputType == Enum.UserInputType.Keyboard then
		local v49 = p47.KeyCode == Enum.KeyCode.One and 1 or (p47.KeyCode == Enum.KeyCode.Two and 2 or (p47.KeyCode == Enum.KeyCode.Three and 3 or (p47.KeyCode == Enum.KeyCode.Four and 4 or (p47.KeyCode == Enum.KeyCode.Five and 5 or (p47.KeyCode == Enum.KeyCode.Six and 6 or (p47.KeyCode == Enum.KeyCode.Seven and 7 or (p47.KeyCode == Enum.KeyCode.Eight and 8 or (p47.KeyCode == Enum.KeyCode.Nine and 9 or "ur mom"))))))))
		for _, v50 in ipairs(v_u_6:GetChildren()) do
			if v50:IsA("TextButton") and v50.LayoutOrder == tonumber(v49) then
				if v_u_5.Backpack:FindFirstChild(v50.Name) then
					v_u_29(v_u_5.Backpack:FindFirstChild(v50.Name))
				else
					warn((("Failed to equip %s: Couldn\'t find tool %s in player\'s backpack"):format(v50.Name, v50.Name)))
					v_u_22()
				end
			end
		end
	elseif p47.UserInputType == Enum.UserInputType.Gamepad1 then
		if p47.KeyCode == Enum.KeyCode.ButtonR1 then
			v_u_8 = v_u_8 + 1
			if v_u_8 > #v_u_6:GetChildren() then
				v_u_8 = 0
				v_u_22()
			else
				v_u_32(v_u_8)
			end
		end
		if p47.KeyCode == Enum.KeyCode.ButtonL1 then
			v_u_8 = v_u_8 - 1
			if v_u_8 < 1 then
				v_u_8 = #v_u_6:GetChildren()
				v_u_22()
				return
			end
			v_u_32(v_u_8)
		end
	end
end)
v_u_5.CharacterAppearanceLoaded:Connect(function()
	-- upvalues: (copy) v_u_5, (ref) v_u_9, (copy) v_u_6
	if v_u_5.Character and v_u_5.Character:FindFirstChildOfClass("Humanoid") then
		v_u_5.Character.Humanoid:UnequipTools()
	end
	if v_u_9 then
		v_u_6.Visible = false
	end
end)
