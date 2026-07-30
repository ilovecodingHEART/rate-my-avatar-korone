-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

task.wait(3)
local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = v1.LocalPlayer
local v_u_6 = script.Parent
local function v_u_10(p7, p8, p9)
	return p7:Lerp(p8, p9)
end
local v_u_11 = {
	["t1"] = nil,
	["t2"] = nil
}
local v_u_12 = {
	["AcidDeath"] = script:FindFirstChild("AcidDeath"),
	["LavaDeath"] = script:FindFirstChild("LavaDeath"),
	["Crusher"] = script:FindFirstChild("Crusher"),
	["ObbyCompleted"] = script:FindFirstChild("ObbyCompleted"),
	["Plank"] = script:FindFirstChild("Plank"),
	["Checkpoint"] = script:FindFirstChild("Checkpoint"),
	["DeathSound"] = script:FindFirstChild("DeathSound")
}
local v_u_13 = Color3.fromRGB(255, 152, 0)
local v_u_14 = Color3.fromRGB(0, 255, 130)
local function v_u_21(p15, p16)
	-- upvalues: (copy) v_u_4
	local v17 = Instance.new("Part")
	v17.Anchored = true
	v17.CanCollide = false
	v17.CanQuery = false
	v17.Transparency = 1
	v17.Size = Vector3.new(0.2, 0.2, 0.2)
	v17.CFrame = CFrame.new(p15)
	v17.Name = "DeathFXAnchor"
	v17.Parent = workspace
	local v18 = Instance.new("Attachment")
	v18.Name = "DeathFX"
	v18.Parent = v17
	local v_u_19 = Instance.new("ParticleEmitter")
	v_u_19.Brightness = 3
	v_u_19.Rate = 0
	v_u_19.EmissionDirection = Enum.NormalId.Top
	v_u_19.SpreadAngle = Vector2.new(35, 35)
	v_u_19.Lifetime = NumberRange.new(0.6, 1.2)
	v_u_19.Speed = NumberRange.new(12, 24)
	v_u_19.Drag = 3
	local v20 = -workspace.Gravity * 0.6
	v_u_19.Acceleration = Vector3.new(0, v20, 0)
	v_u_19.Color = ColorSequence.new(p16)
	v_u_19.RotSpeed = NumberRange.new(-120, 120)
	v_u_19.Rotation = NumberRange.new(0, 360)
	v_u_19.LockedToPart = false
	v_u_19.Texture = "rbxassetid://117719281775410" or v_u_19.Texture
	v_u_19.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(0.15, 0.6), NumberSequenceKeypoint.new(1, 0.1) })
	v_u_19.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.05), NumberSequenceKeypoint.new(0.75, 0.2), NumberSequenceKeypoint.new(1, 1) })
	v_u_19.Parent = v18
	v_u_19:Emit(15)
	task.delay(0.05, function()
		-- upvalues: (copy) v_u_19
		if v_u_19.Parent then
			v_u_19:Emit(10)
		end
	end)
	v_u_4:AddItem(v17, 3)
end
local function v_u_24()
	-- upvalues: (copy) v_u_5
	local v22 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
	if v22 then
		local v23 = v22:FindFirstChild("DamageHighlight")
		if not v23 then
			v23 = Instance.new("Highlight")
			v23.Name = "DamageHighlight"
			v23.Adornee = v22
			v23.DepthMode = Enum.HighlightDepthMode.Occluded
			v23.FillColor = Color3.fromRGB(255, 65, 65)
			v23.OutlineColor = Color3.fromRGB(141, 12, 12)
			v23.FillTransparency = 1
			v23.OutlineTransparency = 1
			v23.Parent = v22
		end
		return v23
	end
end
local function v_u_26()
	-- upvalues: (copy) v_u_24, (copy) v_u_11, (copy) v_u_3
	local v25 = v_u_24()
	if v25 then
		if v_u_11.t1 then
			v_u_11.t1:Cancel()
		end
		if v_u_11.t2 then
			v_u_11.t2:Cancel()
		end
		v25.FillTransparency = 1
		v25.OutlineTransparency = 1
		v_u_11.t1 = v_u_3:Create(v25, TweenInfo.new(0.09, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["FillTransparency"] = 0.25,
			["OutlineTransparency"] = 0.15
		})
		v_u_11.t2 = v_u_3:Create(v25, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 0.9
		})
		v_u_11.t1:Play()
		v_u_11.t1.Completed:Wait()
		v_u_11.t2:Play()
	end
end
local function v31(p27)
	-- upvalues: (copy) v_u_26
	local v28 = p27:WaitForChild("Humanoid")
	local v_u_29 = v28.Health
	v28.HealthChanged:Connect(function(p30)
		-- upvalues: (ref) v_u_29, (ref) v_u_26
		if p30 < v_u_29 then
			v_u_26()
		end
		v_u_29 = p30
	end)
end
if v_u_5.Character then
	local v32 = v_u_5.Character:WaitForChild("Humanoid")
	local v_u_33 = v32.Health
	v32.HealthChanged:Connect(function(p34)
		-- upvalues: (ref) v_u_33, (copy) v_u_26
		if p34 < v_u_33 then
			v_u_26()
		end
		v_u_33 = p34
	end)
end
v_u_5.CharacterAdded:Connect(v31)
local function v_u_38(p35)
	local v36 = {}
	if p35:IsA("BasePart") then
		table.insert(v36, p35)
	end
	for _, v37 in ipairs(p35:GetDescendants()) do
		if v37:IsA("BasePart") then
			table.insert(v36, v37)
		end
	end
	return v36
end
local function v_u_39()
	-- upvalues: (copy) v_u_38
	-- failed to decompile
end
local function v_u_41(p40)
	-- upvalues: (copy) v_u_39, (copy) v_u_38
	if p40 then
		if p40:IsA("BasePart") then
			return p40
		elseif p40:IsA("Model") then
			return v_u_39(p40) or v_u_38(p40)[1]
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_42 = { "FirstObby", "SecondObby", "ThirdObby" }
local v_u_43 = {}
local v_u_44 = {}
local function v_u_49(p45, p46)
	-- upvalues: (copy) v_u_41, (copy) v_u_4
	if p46 then
		local v47 = v_u_41(p45)
		if v47 then
			local v48 = p46:Clone()
			v48.Parent = v47
			v48:Play()
			v_u_4:AddItem(v48, v48.TimeLength > 0 and v48.TimeLength + 0.25 or 5)
		end
	else
		return
	end
end
local v_u_50 = {}
local function v_u_52(p51)
	-- upvalues: (copy) v_u_6
	while p51 and p51 ~= v_u_6 do
		if p51.Parent == v_u_6 and p51:IsA("Folder") then
			return p51
		end
		p51 = p51.Parent
	end
	return nil
end
for v53, v54 in ipairs(v_u_42) do
	v_u_43[v54] = v53
end
local function v_u_60(p55)
	-- upvalues: (copy) v_u_50, (copy) v_u_44, (copy) v_u_5
	if p55 then
		local v56 = p55:FindFirstChild("Checkpoints")
		if v56 then
			v56 = v56:FindFirstChild("Start")
		end
		if v56 and v56:IsA("BasePart") then
			local v57 = v56.CFrame * CFrame.new(0, v56.Size.Y / 2 + 4, 0)
			v_u_50[p55] = v57
			v_u_44[v56] = true
			local v_u_58 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
			local v59
			if v_u_58 then
				v59 = v_u_58:FindFirstChild("HumanoidRootPart")
			else
				v59 = v_u_58
			end
			if v_u_58 then
				v_u_58 = v_u_58:FindFirstChildOfClass("Humanoid")
			end
			if v59 and v_u_58 then
				v_u_58:ChangeState(Enum.HumanoidStateType.Physics)
				v59.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				v59.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				v59.CFrame = v57
				task.delay(0.05, function()
					-- upvalues: (copy) v_u_58
					if v_u_58.Health <= 0 then
						v_u_58.Health = v_u_58.MaxHealth
					end
					v_u_58:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end
		end
	else
		return
	end
end
local function v_u_68(p61)
	-- upvalues: (copy) v_u_52, (copy) v_u_50, (copy) v_u_44, (copy) v_u_5
	local v62 = v_u_52(p61)
	local v63
	if v62 then
		v63 = v_u_50[v62]
	else
		v63 = v62
	end
	if not v63 and v62 then
		local v64 = v62:FindFirstChild("Checkpoints")
		if v64 then
			v64 = v64:FindFirstChild("Start")
		end
		if v64 and v64:IsA("BasePart") then
			v63 = v64.CFrame * CFrame.new(0, v64.Size.Y / 2 + 4, 0)
			v_u_50[v62] = v63
			v_u_44[v64] = true
		end
	end
	if v63 then
		local v65 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
		local v66 = v65:FindFirstChild("HumanoidRootPart")
		local v_u_67 = v65:FindFirstChildOfClass("Humanoid")
		if v66 and v_u_67 then
			v_u_67:ChangeState(Enum.HumanoidStateType.Physics)
			v66.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			v66.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			v66.CFrame = v63
			task.delay(0.05, function()
				-- upvalues: (copy) v_u_67
				if v_u_67 and v_u_67.Health <= 0 then
					v_u_67.Health = v_u_67.MaxHealth
				end
				v_u_67:ChangeState(Enum.HumanoidStateType.Running)
			end)
		end
	end
end
local function v_u_87(p_u_69, p70)
	-- upvalues: (copy) v_u_39
	if p_u_69:IsA("Model") then
		local v71 = v_u_39(p_u_69)
		if v71 then
			local v72 = p_u_69:GetPivot()
			local v73 = v72.XVector
			local v74 = v72.YVector
			local v75 = v72.ZVector
			local v76 = v72:ToObjectSpace(v71.CFrame):Inverse()
			local function v82(p77)
				-- upvalues: (copy) p_u_69
				local v78 = p_u_69:GetAttribute(p77)
				if typeof(v78) == "Vector3" then
					return v78 + Vector3.new(0, 1000, 0)
				end
				local v79 = p_u_69:GetAttribute(p77 .. "Name")
				if type(v79) == "string" then
					local v80 = p_u_69:FindFirstChild(v79, true)
					if v80 and v80:IsA("BasePart") then
						return v80.Position
					end
				end
				local v81 = p_u_69:FindFirstChild(p77, true)
				if v81 and v81:IsA("BasePart") then
					return v81.Position
				end
			end
			local v83 = v82("P0")
			local v84 = v82("P1")
			if v83 and v84 then
				local v85 = CFrame.fromMatrix(v83, v73, v74, v75)
				local v86 = CFrame.fromMatrix(v84, v73, v74, v75)
				return v85 * v76, v86 * v76, tonumber(p_u_69:GetAttribute("Speed")) or (p70 or 12)
			end
		end
	else
		return
	end
end
local function v_u_107(p88, p89, p90, p91)
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_49, (copy) v_u_12
	local v92 = tonumber(p88:GetAttribute("OutMult")) or 2
	local v93 = tonumber(p88:GetAttribute("InMult")) or 0.6
	local v94 = tonumber(p88:GetAttribute("PauseIn")) or 0.05
	local v95 = tonumber(p88:GetAttribute("PauseOut")) or 0.04
	local v96 = (p89.Position - p90.Position).Magnitude
	local v97 = v96 / (p91 * v92)
	local v98 = math.max(v97, 0.03)
	local v99 = v96 / (p91 * v93)
	local v100 = math.max(v99, 0.05)
	while true do
		if v94 > 0 then
			task.wait(v94)
		end
		local v101 = p88:GetPivot()
		local v102 = os.clock()
		while os.clock() - v102 < v98 do
			local v103 = (os.clock() - v102) / v98
			p88:PivotTo(v_u_10(v101, p90, v103 * v103))
			v_u_2.Heartbeat:Wait()
		end
		p88:PivotTo(p90)
		v_u_49(p88, v_u_12.Pusher)
		if v95 > 0 then
			task.wait(v95)
		end
		local v104 = p88:GetPivot()
		local v105 = os.clock()
		while os.clock() - v105 < v100 do
			local v106 = (os.clock() - v105) / v100
			p88:PivotTo(v_u_10(v104, p89, 1 - (1 - v106) * (1 - v106)))
			v_u_2.Heartbeat:Wait()
		end
		p88:PivotTo(p89)
	end
end
local function v_u_118(p108, p109, p110, p111)
	-- upvalues: (copy) v_u_2
	local v112 = (p109.Position - p110.Position).Magnitude / (p111 or 12)
	local v113 = math.max(v112, 0.05)
	while true do
		local v114 = p108:GetPivot()
		local v115 = os.clock()
		while os.clock() - v115 < v113 do
			p108:PivotTo(v114:Lerp(p110, (os.clock() - v115) / v113))
			v_u_2.Heartbeat:Wait()
		end
		p108:PivotTo(p110)
		local v116 = p108:GetPivot()
		local v117 = os.clock()
		while os.clock() - v117 < v113 do
			p108:PivotTo(v116:Lerp(p109, (os.clock() - v117) / v113))
			v_u_2.Heartbeat:Wait()
		end
		p108:PivotTo(p109)
	end
end
local function v_u_125(p119)
	-- upvalues: (copy) v_u_87, (copy) v_u_118
	for _, v121 in ipairs(p119:GetChildren()) do
		if v121:IsA("BasePart") then
			local v121 = v121.Parent
		end
		if v121 and v121:IsA("Model") then
			local v122, v123, v124 = v_u_87(v121, 5)
			if v122 and v123 then
				task.spawn(v_u_118, v121, v122, v123, v124)
			end
		end
	end
end
local function v_u_155(p126)
	local v127 = p126:GetAttribute("BoundsMin")
	local v128 = p126:GetAttribute("BoundsMax")
	if typeof(v127) == "Vector3" and typeof(v128) == "Vector3" then
		local v129 = (v127 + v128) * 0.5
		local v130 = (v128 - v127) * 0.5
		local v131 = v130.X
		local v132 = math.max(v131, 0.1)
		local v133 = v130.Y
		local v134 = math.max(v133, 0.1)
		local v135 = v130.Z
		local v136 = math.max(v135, 0.1)
		return v129, Vector3.new(v132, v134, v136)
	end
	local v137 = p126:GetAttribute("BoundsCenter")
	local v138 = p126:GetAttribute("BoundsSize")
	if typeof(v137) == "Vector3" and typeof(v138) == "Vector3" then
		local v139 = v138.X * 0.5
		local v140 = math.max(v139, 0.1)
		local v141 = v138.Y * 0.5
		local v142 = math.max(v141, 0.1)
		local v143 = v138.Z * 0.5
		local v144 = math.max(v143, 0.1)
		return v137, Vector3.new(v140, v142, v144)
	end
	local v145 = p126:FindFirstChild("Bounds", true)
	if not (v145 and v145:IsA("BasePart")) then
		local v146 = p126:GetPivot().Position
		local v147 = tonumber(p126:GetAttribute("Radius")) or 12
		return v146, Vector3.new(v147, 0.1, v147)
	end
	local v148 = v145.Position
	local v149 = v145.Size.X * 0.5
	local v150 = math.max(v149, 0.1)
	local v151 = v145.Size.Y * 0.5
	local v152 = math.max(v151, 0.1)
	local v153 = v145.Size.Z * 0.5
	local v154 = math.max(v153, 0.1)
	return v148, Vector3.new(v150, v152, v154)
end
local function v_u_182(p156)
	-- upvalues: (copy) v_u_39, (copy) v_u_155, (copy) v_u_2
	if p156:IsA("Model") then
		local v157 = v_u_39(p156)
		if v157 then
			local v158, v159 = v_u_155(p156)
			local v160 = tonumber(p156:GetAttribute("Speed")) or 5
			local v161 = tonumber(p156:GetAttribute("PauseMin")) or 0
			local v162 = tonumber(p156:GetAttribute("PauseMax")) or 0.25
			local v163 = p156:GetPivot()
			local v164 = v163.XVector
			local v165 = v163.YVector
			local v166 = v163.ZVector
			local v167 = v163:ToObjectSpace(v157.CFrame):Inverse()
			while true do
				local v168 = v158.X + (math.random() * 2 - 1) * v159.X
				local v169 = v158.Z + (math.random() * 2 - 1) * v159.Z
				local v170 = v158.Y
				local v171 = Vector3.new(v168, v170, v169)
				local v172 = v157.Position.Y
				local v173 = v171.X
				local v174 = v171.Z
				local v175 = Vector3.new(v173, v172, v174)
				local v176 = CFrame.fromMatrix(v175, v164, v165, v166) * v167
				local v177 = p156:GetPivot()
				local v178 = (v177.Position - v176.Position).Magnitude / v160
				local v179 = math.max(v178, 0.05)
				local v180 = os.clock()
				while os.clock() - v180 < v179 do
					p156:PivotTo(v177:Lerp(v176, (os.clock() - v180) / v179))
					v_u_2.Heartbeat:Wait()
				end
				p156:PivotTo(v176)
				local v181 = v162 > 0 and v161 < v162 and (math.random() * (v162 - v161) + v161 or 0) or 0
				if v181 > 0 then
					task.wait(v181)
				end
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_186(p183)
	-- upvalues: (copy) v_u_182
	for _, v185 in ipairs(p183:GetChildren()) do
		if v185:IsA("BasePart") then
			local v185 = v185.Parent
		end
		if v185 and v185:IsA("Model") then
			task.spawn(v_u_182, v185)
		end
	end
end
local function v_u_199(p187, p188)
	-- upvalues: (copy) v_u_49, (copy) v_u_12, (copy) v_u_21, (copy) v_u_14, (copy) v_u_13
	local v189 = p187.Color
	local v190, v191, v192 = Color3.toHSV(v189)
	local v193
	if v191 > 0.15 and (v192 > 0.12 and (v190 >= 0.25 and v190 <= 0.45)) then
		v193 = true
	elseif v189.G > v189.R * 1.15 then
		v193 = v189.G > v189.B * 1.15
	else
		v193 = false
	end
	local v194 = p187.Color
	local v195, v196, v197 = Color3.toHSV(v194)
	local v198
	if v195 >= 0.03 and (v195 <= 0.125 and (v196 > 0.25 and v197 > 0.12)) then
		v198 = true
	elseif v195 >= 0.05 and (v195 <= 0.14 and v196 >= 0.15) then
		v198 = v197 > 0.2
	else
		v198 = false
	end
	if v193 then
		v_u_49(p187, v_u_12.AcidDeath)
		v_u_21(p188 or p187.Position, v_u_14)
		return
	elseif v198 then
		v_u_49(p187, v_u_12.LavaDeath)
		v_u_21(p188 or p187.Position, v_u_13)
	else
		v_u_49(p187, v_u_12.DeathSound)
		v_u_21(p188 or p187.Position, v_u_13)
	end
end
local function v_u_219(p200)
	-- upvalues: (copy) v_u_5, (copy) v_u_199, (copy) v_u_26, (copy) v_u_3, (copy) v_u_68
	for _, v_u_201 in ipairs(p200:GetDescendants()) do
		if v_u_201:IsA("BasePart") then
			v_u_201.Touched:Connect(function(p202)
				-- upvalues: (ref) v_u_5, (ref) v_u_199, (copy) v_u_201, (ref) v_u_26, (ref) v_u_3, (ref) v_u_68
				local v203 = p202 and p202.Parent
				if v203 then
					v203 = p202.Parent:FindFirstChildOfClass("Humanoid")
				end
				local v204 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
				if v203 and (v204 and v203.Parent == v204) then
					local v205 = v204:FindFirstChild("HumanoidRootPart")
					if v205 then
						local v206 = os.clock()
						local v207 = v204:GetAttribute("DeathCooldownUntil")
						if not v204:GetAttribute("DeathBusy") and (typeof(v207) ~= "number" or v206 >= v207) then
							v204:SetAttribute("DeathBusy", true)
							v204:SetAttribute("DeathCooldownUntil", v206 + 0.5)
							v_u_199(v_u_201, v205.Position)
							v_u_26()
							v203:ChangeState(Enum.HumanoidStateType.Physics)
							v205.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
							v205.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
							local v208 = {}
							for _, v209 in ipairs(v204:GetDescendants()) do
								if v209:IsA("BasePart") or v209:IsA("Decal") then
									v208[v209] = v209.Transparency or 0
								end
							end
							local v210 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
							local v211 = nil
							for v212, _ in pairs(v208) do
								if v212 and v212.Parent then
									v211 = v_u_3:Create(v212, v210, {
										["Transparency"] = 1
									})
									v211:Play()
								end
							end
							if v211 then
								v211.Completed:Wait()
							end
							v_u_68(v_u_201)
							local v213 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
							local v214 = nil
							for v215, v216 in pairs(v208) do
								if v215 and v215.Parent then
									v214 = v_u_3:Create(v215, v213, {
										["Transparency"] = math.clamp(v216 or 0, 0, 1)
									})
									v214:Play()
								end
							end
							if v214 then
								v214.Completed:Wait()
							end
							for v217, v218 in pairs(v208) do
								if v217 and v217.Parent then
									v217.Transparency = math.clamp(v218 or 0, 0, 1)
								end
							end
							v203:ChangeState(Enum.HumanoidStateType.Running)
							v204:SetAttribute("DeathBusy", false)
						end
					else
						return
					end
				else
					return
				end
			end)
		end
	end
end
local function v_u_239(p220, p221, p222, p223)
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_49, (copy) v_u_12
	local v224 = tonumber(p220:GetAttribute("DownMult")) or 2.2
	local v225 = tonumber(p220:GetAttribute("UpMult")) or 0.55
	local v226 = tonumber(p220:GetAttribute("PauseTop")) or 0.08
	local v227 = tonumber(p220:GetAttribute("PauseBot")) or 0.04
	local v228 = (p221.Position - p222.Position).Magnitude
	local v229 = v228 / (p223 * v224)
	local v230 = math.max(v229, 0.03)
	local v231 = v228 / (p223 * v225)
	local v232 = math.max(v231, 0.05)
	while true do
		if v226 > 0 then
			task.wait(v226)
		end
		local v233 = p220:GetPivot()
		local v234 = os.clock()
		while os.clock() - v234 < v230 do
			local v235 = (os.clock() - v234) / v230
			p220:PivotTo(v_u_10(v233, p222, v235 * v235))
			v_u_2.Heartbeat:Wait()
		end
		p220:PivotTo(p222)
		v_u_49(p220, v_u_12.Crusher)
		if v227 > 0 then
			task.wait(v227)
		end
		local v236 = p220:GetPivot()
		local v237 = os.clock()
		while os.clock() - v237 < v232 do
			local v238 = (os.clock() - v237) / v232
			p220:PivotTo(v_u_10(v236, p221, 1 - (1 - v238) * (1 - v238)))
			v_u_2.Heartbeat:Wait()
		end
		p220:PivotTo(p221)
	end
end
local function v_u_264(p240)
	-- upvalues: (copy) v_u_38, (copy) v_u_5, (copy) v_u_199, (copy) v_u_26, (copy) v_u_3, (copy) v_u_68, (copy) v_u_87, (copy) v_u_239
	for _, v242 in ipairs(p240:GetChildren()) do
		if v242:IsA("BasePart") then
			local v242 = v242.Parent
		end
		if v242 and v242:IsA("Model") then
			for _, v_u_243 in ipairs((v_u_38(v242))) do
				v_u_243.Touched:Connect(function(p244)
					-- upvalues: (ref) v_u_5, (ref) v_u_199, (copy) v_u_243, (ref) v_u_26, (ref) v_u_3, (ref) v_u_68
					local v245 = p244 and p244.Parent
					if v245 then
						v245 = p244.Parent:FindFirstChildOfClass("Humanoid")
					end
					local v246 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
					if v245 and (v246 and v245.Parent == v246) then
						local v247 = v246:FindFirstChild("HumanoidRootPart")
						if v247 then
							local v248 = os.clock()
							local v249 = v246:GetAttribute("DeathCooldownUntil")
							if not v246:GetAttribute("DeathBusy") and (typeof(v249) ~= "number" or v248 >= v249) then
								v246:SetAttribute("DeathBusy", true)
								v246:SetAttribute("DeathCooldownUntil", v248 + 0.5)
								v_u_199(v_u_243, v247.Position)
								v_u_26()
								v245:ChangeState(Enum.HumanoidStateType.Physics)
								v247.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
								v247.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
								local v250 = {}
								for _, v251 in ipairs(v246:GetDescendants()) do
									if v251:IsA("BasePart") or v251:IsA("Decal") then
										v250[v251] = v251.Transparency or 0
									end
								end
								local v252 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
								local v253 = nil
								for v254, _ in pairs(v250) do
									if v254 and v254.Parent then
										v253 = v_u_3:Create(v254, v252, {
											["Transparency"] = 1
										})
										v253:Play()
									end
								end
								if v253 then
									v253.Completed:Wait()
								end
								v_u_68(v_u_243)
								local v255 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
								local v256 = nil
								for v257, v258 in pairs(v250) do
									if v257 and v257.Parent then
										v256 = v_u_3:Create(v257, v255, {
											["Transparency"] = math.clamp(v258 or 0, 0, 1)
										})
										v256:Play()
									end
								end
								if v256 then
									v256.Completed:Wait()
								end
								for v259, v260 in pairs(v250) do
									if v259 and v259.Parent then
										v259.Transparency = math.clamp(v260 or 0, 0, 1)
									end
								end
								v245:ChangeState(Enum.HumanoidStateType.Running)
								v246:SetAttribute("DeathBusy", false)
							end
						else
							return
						end
					else
						return
					end
				end)
			end
			local v261, v262, v263 = v_u_87(v242, 8)
			if v261 and v262 then
				task.spawn(v_u_239, v242, v261, v262, v263)
			end
		end
	end
end
local v_u_265 = {}
local function v_u_269(p266)
	if p266:IsA("BasePart") then
		return { p266 }
	end
	local v267 = {}
	for _, v268 in ipairs(p266:GetDescendants()) do
		if v268:IsA("BasePart") then
			table.insert(v267, v268)
		end
	end
	return v267
end
local function v_u_281(p_u_270, p_u_271, p_u_272, p273, p274, p275)
	-- upvalues: (copy) v_u_3
	local v276 = Instance.new("NumberValue")
	local v277 = TweenInfo.new(p273, p274 or Enum.EasingStyle.Quad, p275 or Enum.EasingDirection.Out)
	local v279 = v276.Changed:Connect(function(p278)
		-- upvalues: (copy) p_u_270, (copy) p_u_271, (copy) p_u_272
		p_u_270:PivotTo(p_u_271:Lerp(p_u_272, p278))
	end)
	v276.Value = 0
	local v280 = v_u_3:Create(v276, v277, {
		["Value"] = 1
	})
	v280:Play()
	v280.Completed:Wait()
	v279:Disconnect()
	v276:Destroy()
end
local function v_u_288(p282, p283, p284)
	-- upvalues: (copy) v_u_3
	local v285 = TweenInfo.new(p284, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v286 = nil
	for _, v287 in ipairs(p282) do
		v286 = v_u_3:Create(v287, v285, {
			["Transparency"] = p283
		})
		v286:Play()
	end
	if v286 then
		v286.Completed:Wait()
	end
end
local function v_u_323(p289)
	-- upvalues: (copy) v_u_265, (copy) v_u_269, (copy) v_u_49, (copy) v_u_12, (copy) v_u_281, (copy) v_u_3, (copy) v_u_288
	local v290 = v_u_265[p289]
	if not v290 then
		local v291 = p289:IsA("Model") and p289:GetPivot() or p289.CFrame
		local v292 = v_u_269(p289)
		local v293 = {}
		for _, v294 in ipairs(v292) do
			v293[v294] = {
				["t"] = v294.Transparency,
				["c"] = v294.CanCollide
			}
		end
		v290 = {
			["origCF"] = v291,
			["busy"] = false,
			["nextAt"] = 0,
			["props"] = v293
		}
		v_u_265[p289] = v290
	end
	if not v290.busy and os.clock() >= v290.nextAt then
		v290.busy = true
		v_u_49(p289, v_u_12.Plank)
		local v295 = tonumber(p289:GetAttribute("FallDepth")) or 8
		local v296 = tonumber(p289:GetAttribute("FallTime")) or 0.25
		local v297 = tonumber(p289:GetAttribute("StayTime")) or 0.1
		local v298 = tonumber(p289:GetAttribute("Cooldown")) or 0.6
		local v299 = tonumber(p289:GetAttribute("ShakeTime")) or 0.9
		local v300 = tonumber(p289:GetAttribute("ShakeRadius")) or 0.3
		local v301 = tonumber(p289:GetAttribute("ShakeStep")) or 0.08
		local v302 = tonumber(p289:GetAttribute("FadeOutTime")) or 0.15
		local v303 = tonumber(p289:GetAttribute("RespawnDelay")) or 0.6
		local v304 = tonumber(p289:GetAttribute("FadeInTime")) or 0.25
		local v305 = v290.origCF
		local v306 = v305 * CFrame.new(0, -v295, 0)
		local v307 = v305
		local v308 = 0
		while v308 < v299 do
			local v309 = (math.random() * 2 - 1) * v300
			local v310 = (math.random() * 2 - 1) * v300
			local v311 = Vector3.new(v309, 0, v310)
			local v312 = v305 * CFrame.new(v311)
			if p289:IsA("Model") then
				v_u_281(p289, v307, v312, v301, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			else
				v_u_3:Create(p289, TweenInfo.new(v301, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					["CFrame"] = v312
				}):Play()
				task.wait(v301)
			end
			v308 = v308 + v301
			v307 = v312
		end
		if p289:IsA("Model") then
			p289:PivotTo(v305)
		else
			p289.CFrame = v305
		end
		if p289:IsA("Model") then
			v_u_281(p289, v305, v306, v296, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		else
			v_u_3:Create(p289, TweenInfo.new(v296, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["CFrame"] = v306
			}):Play()
			task.wait(v296)
		end
		task.wait(v297)
		local v313 = v_u_269(p289)
		for _, v314 in ipairs(v313) do
			v314.CanCollide = false
		end
		v_u_288(v313, 1, v302)
		task.wait(v303)
		if p289:IsA("Model") then
			p289:PivotTo(v305)
		else
			p289.CFrame = v305
		end
		for _, v315 in ipairs(v313) do
			v315.Transparency = 1
		end
		local v316 = {}
		for v317, v318 in pairs(v290.props) do
			v316[v317] = v318.t
		end
		local v319 = TweenInfo.new(v304, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local v320 = nil
		for v321, v322 in pairs(v290.props) do
			v320 = v_u_3:Create(v321, v319, {
				["Transparency"] = v322.t or 0
			})
			v321.CanCollide = v322.c
			v320:Play()
		end
		if v320 then
			v320.Completed:Wait()
		end
		v290.nextAt = os.clock() + v298
		v290.busy = false
	end
end
local function v_u_332(p324)
	-- upvalues: (copy) v_u_269, (copy) v_u_5, (copy) v_u_323
	for _, v325 in ipairs(p324:GetChildren()) do
		local v_u_326 = v325:IsA("BasePart") and v325 and v325 or (v325:IsA("Model") and v325 and v325 or nil)
		if v_u_326 then
			local v327 = v_u_269(v_u_326)
			for _, v328 in ipairs(v327) do
				v328.Touched:Connect(function(p329)
					-- upvalues: (ref) v_u_5, (ref) v_u_323, (copy) v_u_326
					local v330 = p329 and p329.Parent
					if v330 then
						v330 = p329.Parent:FindFirstChildOfClass("Humanoid")
					end
					local v331 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
					if v330 and (v331 and v330.Parent == v331) then
						v_u_323(v_u_326)
					end
				end)
			end
		end
	end
end
local function v_u_340(p333)
	-- upvalues: (copy) v_u_38, (copy) v_u_87, (copy) v_u_107
	for _, v335 in ipairs(p333:GetChildren()) do
		if v335:IsA("BasePart") then
			local v335 = v335.Parent
		end
		if v335 and v335:IsA("Model") then
			for _, v336 in ipairs((v_u_38(v335))) do
				v336.CanCollide = true
			end
			local v337, v338, v339 = v_u_87(v335, 20)
			if v337 and v338 then
				task.spawn(v_u_107, v335, v337, v338, v339)
			end
		end
	end
end
local v_u_341 = {}
local function v_u_352(p342)
	-- upvalues: (copy) v_u_341, (copy) v_u_3
	if p342 and p342:IsA("BasePart") then
		local v343 = v_u_341[p342]
		if not v343 then
			v343 = {
				["originalCF"] = p342.CFrame,
				["busy"] = false,
				["cooldownUntil"] = 0
			}
			v_u_341[p342] = v343
		end
		local v344 = os.clock()
		local v345 = tonumber(p342:GetAttribute("PressCooldown")) or 0.25
		if not v343.busy and v344 >= v343.cooldownUntil then
			v343.busy = true
			local v346 = tonumber(p342:GetAttribute("PressDepth")) or 0.4
			local v347 = tonumber(p342:GetAttribute("PressDuration")) or 0.12
			local v348 = v343.originalCF
			local v349 = {
				["CFrame"] = v348 * CFrame.new(0, -v346, 0)
			}
			local v350 = v_u_3:Create(p342, TweenInfo.new(v347, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v349)
			local v351 = v_u_3:Create(p342, TweenInfo.new(v347, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				["CFrame"] = v348
			})
			v350:Play()
			v350.Completed:Wait()
			v351:Play()
			v351.Completed:Wait()
			p342.CFrame = v348
			v343.cooldownUntil = os.clock() + v345
			v343.busy = false
		end
	else
		return
	end
end
local v_u_353 = require(game.ReplicatedStorage.popup)
local v_u_354 = 0
local v_u_355 = setmetatable({}, {
	["__mode"] = "k"
})
local function v_u_379(p_u_356)
	-- upvalues: (copy) v_u_50, (copy) v_u_44, (copy) v_u_5, (copy) v_u_355, (copy) v_u_43, (copy) v_u_42, (copy) v_u_6, (ref) v_u_354, (copy) v_u_353, (copy) v_u_60, (copy) v_u_352
	local v357 = p_u_356:FindFirstChild("Checkpoints")
	if v357 then
		local v358 = v357:FindFirstChild("Start")
		if v358 and v358:IsA("BasePart") then
			v_u_50[p_u_356] = v358.CFrame * CFrame.new(0, v358.Size.Y / 2 + 4, 0)
			v_u_44[v358] = true
		end
		for _, v_u_359 in ipairs(v357:GetChildren()) do
			if v_u_359:IsA("BasePart") then
				if v_u_359:IsA("BasePart") then
					local v_u_360 = false
					v_u_359.Touched:Connect(function(p361)
						-- upvalues: (ref) v_u_5, (ref) v_u_360, (ref) v_u_355, (copy) p_u_356, (copy) v_u_359, (ref) v_u_43, (ref) v_u_42, (ref) v_u_6, (ref) v_u_354, (ref) v_u_353, (ref) v_u_60, (ref) v_u_44, (ref) v_u_50, (ref) v_u_352
						local v362 = p361 and p361.Parent
						if v362 then
							v362 = p361.Parent:FindFirstChildOfClass("Humanoid")
						end
						local v363 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
						if v362 and (v363 and v362.Parent == v363) then
							if v_u_360 then
								return
							else
								v_u_360 = true
								if v_u_355[p_u_356] then
									task.delay(1, function()
										-- upvalues: (ref) v_u_360
										v_u_360 = false
									end)
									return
								elseif v_u_359.Name == "Finish" then
									v_u_355[p_u_356] = true
									script.ObbyCompleted:Play()
									local v364 = p_u_356
									local v365
									if v364 and v364.Name then
										local v366 = v_u_43[v364.Name]
										if v366 then
											local v367 = v_u_42[v366 + 1]
											v365 = v367 and v_u_6:FindFirstChild(v367) or nil
										else
											v365 = nil
										end
									else
										v365 = nil
									end
									if v365 then
										if (nil or 1.5) <= os.clock() - v_u_354 then
											v_u_354 = os.clock()
											v_u_353("success", "level completed!")
										end
										v_u_60(v365)
									elseif (nil or 1.5) <= os.clock() - v_u_354 then
										v_u_354 = os.clock()
										v_u_353("success", "congrats! you completed the haunted house!")
									end
									task.delay(2, function()
										-- upvalues: (ref) v_u_360
										v_u_360 = false
									end)
								else
									if not v_u_44[v_u_359] then
										v_u_44[v_u_359] = true
										local v368 = v_u_359
										v_u_50[p_u_356] = v368.CFrame * CFrame.new(0, v368.Size.Y / 2 + 4, 0)
										script.Checkpoint:Play()
										script:SetAttribute("CheckpointCFrame", v_u_359.CFrame)
										task.spawn(v_u_352, v_u_359)
										if (nil or 1.5) <= os.clock() - v_u_354 then
											v_u_354 = os.clock()
											v_u_353("info", "checkpoint!")
										end
									end
									task.delay(0.6, function()
										-- upvalues: (ref) v_u_360
										v_u_360 = false
									end)
								end
							end
						else
							return
						end
					end)
				end
			end
		end
		v357.ChildAdded:Connect(function(p_u_369)
			-- upvalues: (ref) v_u_5, (ref) v_u_355, (copy) p_u_356, (ref) v_u_43, (ref) v_u_42, (ref) v_u_6, (ref) v_u_354, (ref) v_u_353, (ref) v_u_60, (ref) v_u_44, (ref) v_u_50, (ref) v_u_352
			if p_u_369:IsA("BasePart") then
				if not p_u_369:IsA("BasePart") then
					return
				end
				local v_u_370 = false
				p_u_369.Touched:Connect(function(p371)
					-- upvalues: (ref) v_u_5, (ref) v_u_370, (ref) v_u_355, (ref) p_u_356, (copy) p_u_369, (ref) v_u_43, (ref) v_u_42, (ref) v_u_6, (ref) v_u_354, (ref) v_u_353, (ref) v_u_60, (ref) v_u_44, (ref) v_u_50, (ref) v_u_352
					local v372 = p371 and p371.Parent
					if v372 then
						v372 = p371.Parent:FindFirstChildOfClass("Humanoid")
					end
					local v373 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
					if v372 and (v373 and v372.Parent == v373) then
						if v_u_370 then
							return
						else
							v_u_370 = true
							if v_u_355[p_u_356] then
								task.delay(1, function()
									-- upvalues: (ref) v_u_370
									v_u_370 = false
								end)
								return
							elseif p_u_369.Name == "Finish" then
								v_u_355[p_u_356] = true
								script.ObbyCompleted:Play()
								local v374 = p_u_356
								local v375
								if v374 and v374.Name then
									local v376 = v_u_43[v374.Name]
									if v376 then
										local v377 = v_u_42[v376 + 1]
										v375 = v377 and v_u_6:FindFirstChild(v377) or nil
									else
										v375 = nil
									end
								else
									v375 = nil
								end
								if v375 then
									if (nil or 1.5) <= os.clock() - v_u_354 then
										v_u_354 = os.clock()
										v_u_353("success", "level completed!")
									end
									v_u_60(v375)
								elseif (nil or 1.5) <= os.clock() - v_u_354 then
									v_u_354 = os.clock()
									v_u_353("success", "congrats! you completed the haunted house!")
								end
								task.delay(2, function()
									-- upvalues: (ref) v_u_370
									v_u_370 = false
								end)
							else
								if not v_u_44[p_u_369] then
									v_u_44[p_u_369] = true
									local v378 = p_u_369
									v_u_50[p_u_356] = v378.CFrame * CFrame.new(0, v378.Size.Y / 2 + 4, 0)
									script.Checkpoint:Play()
									script:SetAttribute("CheckpointCFrame", p_u_369.CFrame)
									task.spawn(v_u_352, p_u_369)
									if (nil or 1.5) <= os.clock() - v_u_354 then
										v_u_354 = os.clock()
										v_u_353("info", "checkpoint!")
									end
								end
								task.delay(0.6, function()
									-- upvalues: (ref) v_u_370
									v_u_370 = false
								end)
							end
						end
					else
						return
					end
				end)
			end
		end)
	end
end
local function v_u_387(p380)
	-- upvalues: (copy) v_u_125, (copy) v_u_186, (copy) v_u_219, (copy) v_u_332, (copy) v_u_264, (copy) v_u_340
	if p380 then
		local v381 = p380:FindFirstChild("MovingPlatforms")
		if v381 then
			v_u_125(v381)
		end
		local v382 = p380:FindFirstChild("GhostPlatforms")
		if v382 then
			v_u_186(v382)
		end
		local v383 = p380:FindFirstChild("KillParts")
		if v383 then
			v_u_219(v383)
		end
		local v384 = p380:FindFirstChild("FallingPlanks")
		if v384 then
			v_u_332(v384)
		end
		local v385 = p380:FindFirstChild("Crushers")
		if v385 then
			v_u_264(v385)
		end
		local v386 = p380:FindFirstChild("PushWalls")
		if v386 then
			v_u_340(v386)
		end
	end
end
local function v_u_390(p388)
	-- upvalues: (copy) v_u_379, (copy) v_u_387
	local v389 = p388:FindFirstChild("Obstacles") or p388:FindFirstChild("Obsticles")
	v_u_379(p388)
	v_u_387(v389)
end
for _, v391 in ipairs(v_u_6:GetChildren()) do
	if v391:IsA("Folder") then
		local v392 = v391:FindFirstChild("Obstacles") or v391:FindFirstChild("Obsticles")
		v_u_379(v391)
		v_u_387(v392)
	end
end
v_u_6.ChildAdded:Connect(function(p393)
	-- upvalues: (copy) v_u_390
	if p393:IsA("Folder") then
		task.defer(v_u_390, p393)
	end
end)
