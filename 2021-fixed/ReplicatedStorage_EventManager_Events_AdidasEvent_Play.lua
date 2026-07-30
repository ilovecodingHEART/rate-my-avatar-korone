-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
local v_u_1 = game:GetService("Players").LocalPlayer
game:GetService("PhysicsService")
game:GetService("ContentProvider")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Lighting")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("Debris")
local v_u_6 = require(script.Parent.Parent.Parent)
local v7 = script.Parent
local v_u_8 = require(v7.Parent)
local v_u_9 = v7:WaitForChild("Assets")
v7:WaitForChild("Events")
local v_u_10 = workspace.CurrentCamera
local v_u_11 = Random.new()
local function v_u_16(p14)
	for _, v15 in pairs(p14:GetChildren()) do
		if v15:IsA("ParticleEmitter") then
			v15:Emit(v15:GetAttribute("EmitCount"))
		elseif v15:IsA("Sound") then
			v15:Play()
		end
	end
end
local function v_u_20(p17, p18)
	for _, v19 in pairs(p17:GetChildren()) do
		if v19:IsA("ParticleEmitter") or (v19:IsA("Trail") or v19:IsA("Beam")) then
			v19.Enabled = p18
		elseif v19:IsA("Sound") then
			if p18 then
				v19:Play()
			else
				v19:Stop()
			end
		end
	end
end
local function v_u_27(p21, p22, p_u_23)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v_u_24 = Instance.new("NumberValue")
	local v_u_25 = v_u_4:Create(v_u_24, p22, {
		["Value"] = p21
	})
	v_u_25:Play()
	local v_u_26 = v_u_2.RenderStepped:Connect(function()
		-- upvalues: (copy) p_u_23, (copy) v_u_24
		p_u_23(v_u_24.Value)
	end)
	v_u_25.Completed:Once(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_25, (copy) v_u_24
		v_u_26:Disconnect()
		v_u_25:Destroy()
		v_u_24:Destroy()
	end)
end
local function v_u_44(p_u_28, p_u_29)
	-- upvalues: (copy) v_u_4, (copy) v_u_11
	local v_u_30 = {}
	for _, v31 in pairs(p_u_29) do
		v_u_30[v31] = v31.CFrame
	end
	local v_u_32 = false
	task.spawn(function()
		-- upvalues: (ref) v_u_32, (copy) p_u_29, (ref) v_u_4, (copy) v_u_30, (ref) v_u_11, (copy) p_u_28
		while not v_u_32 do
			for _, v33 in ipairs(p_u_29) do
				local v34 = v_u_4
				local v35 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				local v36 = {}
				local v37 = v_u_30[v33] * CFrame.new(v_u_11:NextNumber(-1, 1) * p_u_28, v_u_11:NextNumber(-1, 1) * p_u_28, v_u_11:NextNumber(-1, 1) * p_u_28)
				local v38 = CFrame.Angles
				local v39 = v_u_11:NextNumber(-1, 1)
				local v40 = math.rad(v39)
				local v41 = v_u_11:NextNumber(-1, 1)
				local v42 = math.rad(v41)
				local v43 = v_u_11:NextNumber(-1, 1)
				v36.CFrame = v37 * v38(v40, v42, (math.rad(v43)))
				v34:Create(v33, v35, v36):Play()
			end
			task.wait(0.2)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_32
		v_u_32 = true
	end
end
local function v_u_50(p45, p46, p47, p_u_48)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v_u_49 = Instance.new("BloomEffect")
	v_u_49.Parent = v_u_3
	v_u_49.Size = p45
	v_u_49.Threshold = p47
	v_u_4:Create(v_u_49, TweenInfo.new(p_u_48 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		["Intensity"] = p46
	}):Play()
	task.delay(p_u_48 / 2, function()
		-- upvalues: (ref) v_u_4, (copy) v_u_49, (copy) p_u_48, (ref) v_u_5
		v_u_4:Create(v_u_49, TweenInfo.new(p_u_48 * 1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			["Intensity"] = 0,
			["Threshold"] = 4
		}):Play()
		v_u_5:AddItem(v_u_49, p_u_48 * 1.5)
	end)
end
local function v_u_55(p_u_51, p_u_52)
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	v_u_10.CameraType = Enum.CameraType.Custom
	local v_u_54 = v_u_2.RenderStepped:Connect(function(p53)
		-- upvalues: (ref) v_u_10, (copy) p_u_51, (copy) p_u_52
		v_u_10.CFrame = v_u_10.CFrame:Lerp(CFrame.lookAt(v_u_10.CFrame.Position, p_u_51.Position), p53 / p_u_52)
	end)
	return function()
		-- upvalues: (ref) v_u_10, (copy) v_u_54
		v_u_10.CameraType = Enum.CameraType.Custom
		v_u_54:Disconnect()
	end
end
local function v_u_61(p56, p_u_57, p58)
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_20
	local v_u_59 = p56:Clone()
	v_u_59.Parent = p58
	local v_u_60 = v_u_2.RenderStepped:Connect(function(_)
		-- upvalues: (ref) v_u_59, (ref) v_u_10, (copy) p_u_57
		v_u_59.CFrame = v_u_10.CFrame * p_u_57
	end)
	v_u_20(v_u_59, true)
	return function()
		-- upvalues: (copy) v_u_60, (ref) v_u_59
		v_u_60:Disconnect()
		v_u_59:Destroy()
	end, v_u_59
end
local function v_u_69(p62, p63, p64)
	-- upvalues: (copy) v_u_9, (copy) v_u_27
	local v_u_65 = v_u_9.Models.DirtPile:Clone()
	v_u_65:ScaleTo(0.05)
	v_u_65.Parent = p64
	v_u_65:PivotTo(p62)
	v_u_27(p63, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(p66)
		-- upvalues: (copy) v_u_65
		local v67 = v_u_65
		local v68 = 0.05 + p66
		v67:ScaleTo((math.clamp(v68, 0.01, (1 / 0))))
	end)
end
local function v_u_89(p_u_70, p_u_71, p_u_72, p_u_73)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_20, (copy) v_u_16, (copy) v_u_5, (copy) v_u_69, (copy) v_u_10
	local v_u_74 = v_u_9.Models.SmallerObject:Clone()
	v_u_74.Parent = p_u_71
	local v75 = p_u_72.bezierModule.new(p_u_70["0"].WorldCFrame.Position, p_u_70["1"].WorldCFrame.Position, p_u_70["2"].WorldCFrame.Position, p_u_70["3"].WorldCFrame.Position, p_u_70["4"].WorldCFrame.Position):CreateCFrameTween(v_u_74.PrimaryPart, { "CFrame" }, TweenInfo.new(v_u_11:NextNumber(6, 11), Enum.EasingStyle.Linear, Enum.EasingDirection.In))
	v75:Play()
	local v76 = "ObjectLoop" .. math.random(1, 3)
	local v77 = v_u_9.Sound[v76]
	local v78 = v_u_74.Root
	local v_u_79 = v77:Clone()
	v_u_79.Parent = v78
	v_u_79.Volume = 2
	v_u_79:Play()
	task.delay(60, function()
		-- upvalues: (copy) v_u_79
		if v_u_79.Parent then
			v_u_79:Destroy()
		end
	end)
	local v_u_80 = p_u_72.ForceModule:Force(v_u_74.PrimaryPart.Effects.Main.Particles)
	v75.Completed:Once(function()
		-- upvalues: (copy) v_u_79, (copy) v_u_80, (ref) v_u_20, (copy) v_u_74, (ref) v_u_9, (copy) p_u_71, (copy) p_u_70, (ref) v_u_16, (ref) v_u_5, (ref) v_u_69, (ref) v_u_10, (copy) p_u_72, (copy) p_u_73
		v_u_79:Pause()
		v_u_80()
		v_u_20(v_u_74.PrimaryPart.Effects.Beam1, false)
		v_u_20(v_u_74.PrimaryPart.Effects.Beam2, false)
		v_u_20(v_u_74.PrimaryPart.Effects.Beam3, false)
		v_u_20(v_u_74.PrimaryPart.Effects.Beam4, false)
		v_u_20(v_u_74.PrimaryPart.Effects.Main, false)
		local v81 = v_u_9.Particles.smallMeteorExplosion:Clone()
		v81.Parent = p_u_71
		v81.CFrame = p_u_70["4"].WorldCFrame
		v_u_16(v81.Main)
		v_u_5:AddItem(v81, 5)
		v_u_69(p_u_70["4"].WorldCFrame * CFrame.new(0, -19, 0), 5, p_u_71)
		if (v_u_74.PrimaryPart.Position - v_u_10.CFrame.Position).Magnitude >= 75 then
			p_u_72.CameraShaker.inst:Shake(p_u_72.CameraShaker.mod.Presets.SmallMeteorStrike)
			local v82 = "SmallExplosion" .. math.random(1, 2)
			local v83 = v_u_9.Sound[v82]
			local v84 = v_u_74.Root
			local v_u_85 = v83:Clone()
			v_u_85.Parent = v84
			v_u_85.Volume = 5
			v_u_85:Play()
			task.delay(60, function()
				-- upvalues: (copy) v_u_85
				if v_u_85.Parent then
					v_u_85:Destroy()
				end
			end)
		else
			local v86 = v_u_9.Sound.DistantSmallExplosion3
			local v87 = v_u_74.Root
			local v_u_88 = v86:Clone()
			v_u_88.Parent = v87
			v_u_88.Volume = 3
			v_u_88:Play()
			task.delay(60, function()
				-- upvalues: (copy) v_u_88
				if v_u_88.Parent then
					v_u_88:Destroy()
				end
			end)
		end
		table.remove(p_u_73, __2021_find(p_u_73, v_u_74))
	end)
	v_u_20(v_u_74.PrimaryPart.Effects.Beam1, true)
	v_u_20(v_u_74.PrimaryPart.Effects.Beam2, true)
	v_u_20(v_u_74.PrimaryPart.Effects.Beam3, true)
	v_u_20(v_u_74.PrimaryPart.Effects.Beam4, true)
	v_u_20(v_u_74.PrimaryPart.Effects.Main, true)
	return v_u_74
end
local v_u_146 = {
	["Intro"] = function(_, _, _)
		task.delay(5, function()
			v_u_146 = true
		end)
	end,
	["PlayEffect"] = function(_, p_u_92, _)
		-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_146, (copy) v_u_9, (copy) v_u_1, (copy) v_u_20, (copy) v_u_89, (copy) v_u_2, (copy) v_u_55, (copy) v_u_10, (copy) v_u_16, (copy) v_u_50, (copy) v_u_69, (copy) v_u_5, (copy) v_u_61, (copy) v_u_27, (copy) v_u_44
		if v_u_8[p_u_92.EventName] then
			local v_u_93 = Instance.new("Folder")
			v_u_93.Parent = workspace
			v_u_93.Name = "Debris " .. p_u_92.EventName
			local v_u_94 = v_u_6.Utils.CameraShaker
			local v_u_95 = v_u_6.Utils.ForceEnable
			local v_u_96 = v_u_6.Utils.Transitions
			local v97 = v_u_6.Utils.Bezier
			local v98 = v_u_6.Utils.Rift
			v_u_4:Create(v_u_3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["ClockTime"] = 0
			}):Play()
			--v_u_146:Intro()
			task.wait(1)
			local v99 = v_u_1
			local v_u_100 = v_u_9.Sound.Intro:Clone()
			v_u_100.Parent = v99
			v_u_100.Volume = 1
			v_u_100:Play()
			task.delay(60, function()
				-- upvalues: (copy) v_u_100
				if v_u_100.Parent then
					v_u_100:Destroy()
				end
			end)
			local v_u_101 = v98:Rift(p_u_92.MapPositions.RiftPositions.start.WorldCFrame, 5, false, {})
			task.delay(6, function()
				-- upvalues: (copy) v_u_101
				v_u_101()
			end)
			local v_u_102 = v_u_9.Models.Object:Clone()
			v_u_102.Parent = v_u_93
			v_u_102:PivotTo(CFrame.new(p_u_92.MapPositions.MeteorPositions.start.WorldCFrame.Position, p_u_92.MapPositions.MeteorPositions["end"].WorldCFrame.Position))
			local v103 = v_u_4:Create(v_u_102.PrimaryPart, TweenInfo.new(15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				["CFrame"] = p_u_92.MapPositions.MeteorPositions["end"].WorldCFrame * v_u_102:GetPivot().Rotation
			})
			v103:Play()
			v_u_20(v_u_102.PrimaryPart.Effects.Beam1, true)
			v_u_20(v_u_102.PrimaryPart.Effects.Beam2, true)
			v_u_20(v_u_102.PrimaryPart.Effects.Beam3, true)
			v_u_20(v_u_102.PrimaryPart.Effects.Beam4, true)
			v_u_20(v_u_102.PrimaryPart.Effects.Main, true)
			local v_u_104 = true
			local v_u_105 = { v_u_102 }
			local v106 = {
				["bezierModule"] = v97,
				["ForceModule"] = v_u_95,
				["CameraShaker"] = v_u_94
			}
			local v107 = v_u_89(p_u_92.MapPositions.SmallMeteor1, v_u_93, v106, v_u_105)
			table.insert(v_u_105, v107)
			local v108 = v_u_89(p_u_92.MapPositions.SmallMeteor2, v_u_93, v106, v_u_105)
			table.insert(v_u_105, v108)
			local v109 = v_u_89(p_u_92.MapPositions.SmallMeteor3, v_u_93, v106, v_u_105)
			table.insert(v_u_105, v109)
			local v110 = v_u_89(p_u_92.MapPositions.SmallMeteor4, v_u_93, v106, v_u_105)
			table.insert(v_u_105, v110)
			local v111 = v_u_89(p_u_92.MapPositions.SmallMeteor5, v_u_93, v106, v_u_105)
			table.insert(v_u_105, v111)
			task.spawn(function()
				-- upvalues: (ref) v_u_104, (copy) v_u_105, (ref) v_u_2
				while v_u_104 do
					for _, v112 in pairs(v_u_105) do
						local v113 = v112.Root.Ball
						v113.C1 = v113.C1 * CFrame.Angles(0.05235987755982989, 0.03490658503988659, 0)
					end
					v_u_2.RenderStepped:Wait()
				end
			end)
			local v_u_114 = v_u_95:Force(v_u_102.PrimaryPart.Effects.Main.Particles)
			local v_u_115 = v_u_55(v_u_102.Camera, 2)
			v_u_94.inst:ShakeSustain(v_u_94.mod.Presets.Vibration)
			task.delay(1, function()
				-- upvalues: (copy) v_u_115, (copy) v_u_102, (ref) v_u_2, (ref) v_u_10, (ref) v_u_4, (ref) v_u_16
				v_u_115()
				local v_u_116 = v_u_102.Root
				local v_u_117 = v_u_2.RenderStepped:Connect(function(_)
					-- upvalues: (ref) v_u_10, (copy) v_u_116
					v_u_10.CFrame = CFrame.lookAt(v_u_10.CFrame.Position, v_u_116.Position) * CFrame.new(0, 0, -125)
				end)
				local function v_u_118()
					-- upvalues: (ref) v_u_10, (copy) v_u_117
					v_u_10.CameraType = Enum.CameraType.Custom
					v_u_117:Disconnect()
				end
				v_u_4:Create(v_u_10, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					["FieldOfView"] = 20
				}):Play()
				v_u_16(v_u_102.PrimaryPart.Effects.Target)
				task.delay(3, function()
					-- upvalues: (copy) v_u_118, (ref) v_u_4, (ref) v_u_10
					v_u_118()
					v_u_4:Create(v_u_10, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						["FieldOfView"] = 70
					}):Play()
				end)
			end)
			v103.Completed:Once(function()
				-- upvalues: (ref) v_u_104, (ref) v_u_9, (copy) v_u_93, (copy) p_u_92, (ref) v_u_16, (ref) v_u_50, (copy) v_u_94, (ref) v_u_69, (ref) v_u_5, (ref) v_u_20, (copy) v_u_102, (copy) v_u_114, (ref) v_u_4, (ref) v_u_6, (ref) v_u_61, (ref) v_u_3, (ref) v_u_27, (ref) v_u_44, (copy) v_u_95, (ref) v_u_1, (copy) v_u_96
				v_u_104 = false
				local v119 = v_u_9.Particles.MeteorExplosion:Clone()
				v119.Parent = v_u_93
				v119.CFrame = p_u_92.MapPositions.MeteorPositions.meteorExplosion.WorldCFrame
				v_u_16(v119.Core)
				v_u_50(45, 0.6, 3, 1)
				v_u_94.inst:Shake(v_u_94.mod.Presets.MeteorStrike)
				v_u_69(p_u_92.MapPositions.MeteorPositions.meteorExplosion.WorldCFrame * CFrame.new(0, -30, 0), 10, v_u_93)
				v_u_5:AddItem(v119, 9)
				v_u_20(v_u_102.PrimaryPart.Effects.Beam1, false)
				v_u_20(v_u_102.PrimaryPart.Effects.Beam2, false)
				v_u_20(v_u_102.PrimaryPart.Effects.Beam3, false)
				v_u_20(v_u_102.PrimaryPart.Effects.Beam4, false)
				v_u_20(v_u_102.PrimaryPart.Effects.Main, false)
				v_u_114()
				v_u_94.inst:StopSustained(0.2)
				v_u_94.inst:ShakeSustain(v_u_94.mod.Presets.TsunamiWave)
				pcall(function()
					-- upvalues: (ref) v_u_4, (ref) v_u_6
					v_u_4:Create(v_u_6.Ocean[1], TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
						["CFrame"] = v_u_6.Ocean[2] * CFrame.new(0, -4, 0)
					}):Play()
				end)
				local v_u_120 = nil
				local v_u_121 = nil
				task.delay(2, function()
					-- upvalues: (ref) v_u_120, (ref) v_u_121, (ref) v_u_61, (ref) v_u_9, (ref) v_u_93, (ref) v_u_4
					local v122, v123 = v_u_61(v_u_9.Particles.RainCamera, CFrame.new(0, 7, -3.5), v_u_93)
					v_u_120 = v122
					v_u_121 = v123
					for _, v124 in pairs(v_u_121:GetDescendants()) do
						if v124:IsA("ParticleEmitter") then
							local v125 = v124.Rate
							v124.Rate = 0
							v_u_4:Create(v124, TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								["Rate"] = v125,
								["TimeScale"] = 1
							}):Play()
						end
					end
				end)
				task.delay(1, function()
					-- upvalues: (ref) v_u_4, (ref) v_u_3
					v_u_4:Create(v_u_3.Atmosphere, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						["Density"] = 0.25,
						["Color"] = Color3.fromRGB(49, 94, 104),
						["Decay"] = Color3.fromRGB(192, 254, 255),
						["Glare"] = 1.18,
						["Haze"] = 3.2
					}):Play()
				end)
				task.delay(1.5, function()
					-- upvalues: (ref) v_u_9, (ref) v_u_93, (ref) p_u_92, (ref) v_u_27, (ref) v_u_44, (ref) v_u_95, (ref) v_u_4, (ref) v_u_94, (ref) v_u_1, (ref) v_u_96, (ref) v_u_3, (ref) v_u_102, (ref) v_u_6, (ref) v_u_121, (ref) v_u_120
					local v_u_126 = v_u_9.Models.Tsunami:Clone()
					v_u_126.Parent = v_u_93
					v_u_126:PivotTo(p_u_92.MapPositions.MeteorPositions.tsunamiWave.WorldCFrame)
					v_u_126:ScaleTo(0.1)
					v_u_27(0.7, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(p127)
						-- upvalues: (copy) v_u_126
						v_u_126:ScaleTo(p127)
					end)
					local v_u_128 = {}
					local v_u_129 = nil
					for _, v130 in pairs(v_u_126.PrimaryPart.Bone:GetDescendants()) do
						if v130:IsA("Bone") then
							table.insert(v_u_128, v130)
						end
					end
					task.delay(1.6, function()
						-- upvalues: (ref) v_u_129, (ref) v_u_44, (copy) v_u_128
						v_u_129 = v_u_44(15, v_u_128)
					end)
					local v_u_131 = v_u_95:Force(v_u_126.TsunamiWave.High)
					local v_u_132 = v_u_95:Force(v_u_126.TsunamiWave.Low)
					local v133 = v_u_4:Create(v_u_126.PrimaryPart, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						["CFrame"] = p_u_92.MapPositions.MeteorPositions.tsunamiWaveEnd.WorldCFrame
					})
					v133:Play()
					v133.Completed:Once(function()
						-- upvalues: (copy) v_u_131, (copy) v_u_132, (ref) v_u_129
						v_u_131()
						v_u_132()
						v_u_129()
					end)
					local v_u_134 = nil
					task.delay(2, function()
						-- upvalues: (ref) v_u_94, (ref) v_u_1, (ref) p_u_92, (ref) v_u_134, (ref) v_u_96, (ref) v_u_4, (ref) v_u_3, (ref) v_u_102, (copy) v_u_126, (ref) v_u_6, (ref) v_u_121, (ref) v_u_120, (ref) v_u_93
						v_u_94.inst:ShakeSustain(v_u_94.mod.Presets.TsunamiWaveIncoming)
						local v135 = v_u_1.Character:GetPivot().Position
						local v136 = p_u_92.MapPositions.MeteorPositions.tsunamiWave.WorldPosition
						local v137 = p_u_92.MapPositions.MeteorPositions.tsunamiWaveEnd.WorldPosition
						local v138 = (v135 - v136).Magnitude / (v137 - v136).Magnitude
						local v139 = math.clamp(v138, 0, 1) * 2.9 + 0.1
						v_u_134 = v_u_96:White(v139)
						v_u_4:Create(v_u_3, TweenInfo.new(v139, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["ExposureCompensation"] = 2
						}):Play()
						local function v_u_145()
							-- upvalues: (ref) v_u_94, (ref) v_u_102, (ref) v_u_126, (ref) v_u_6, (ref) v_u_3, (ref) v_u_121, (ref) v_u_4, (ref) v_u_120, (ref) v_u_93, (ref) v_u_134
							v_u_94.inst:StopSustained()
							v_u_102:Destroy()
							v_u_126:Destroy()
							for v140, v141 in pairs(v_u_6.DefaultLighting.lighting) do
								v_u_3[v140] = v141
							end
							for v142, v143 in pairs(v_u_6.DefaultLighting.atmosphere) do
								v_u_3.Atmosphere[v142] = v143
							end
							v_u_121.Parent = workspace
							for _, v144 in pairs(v_u_121:GetDescendants()) do
								if v144:IsA("ParticleEmitter") then
									local _ = v144.Rate
									v144.TimeScale = 0.7
									v_u_4:Create(v144, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
										["Rate"] = 0,
										["TimeScale"] = 0.5
									}):Play()
								end
							end
							task.delay(2, function()
								-- upvalues: (ref) v_u_120
								v_u_120()
							end)
							v_u_93:Destroy()
							v_u_134(3)
						end
						task.delay(v139 + 5.75, function()
							-- upvalues: (copy) v_u_145
							v_u_145()
						end)
					end)
				end)
			end)
		end
	end
}
return v_u_146