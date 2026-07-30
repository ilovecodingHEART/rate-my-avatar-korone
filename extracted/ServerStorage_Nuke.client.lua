
local v1 = game:GetService("ReplicatedStorage")
local _ = game.Players.LocalPlayer
game:GetService("Debris")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("PhysicsService")
local v_u_4 = require(script.CameraShaker)
local function u5(p5, p6) -- line: 8
	p5.Speed = NumberRange.new(p5.Speed.Min * p6, p5.Speed.Max * p6)
	p5.Acceleration = p5.Acceleration * p6
	local v7 = p5.Size.Keypoints
	local v8 = {}
	for v9 = 1, #v7 do
		local v10 = NumberSequenceKeypoint.new
		local v11 = v7[v9].Time
		local v12 = v7[v9].Value * p6
		local v13 = v7[v9].Envelope * p6
		table.insert(v8, v10(v11, v12, v13))
	end
	p5.Size = NumberSequence.new(v8)
end
local v_u_14 = game:GetService("RunService")
local function u7(p15, p16, p17, p18) -- line: 19
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) u5, (copy) v_u_14, (copy) v_u_2
	local v_u_19 = p15:Clone()
	v_u_3:SetPartCollisionGroup(v_u_19, "Nuke")
	local v_u_20 = v_u_19.NukeValues.NukeCFrame
	local v21 = v_u_19.BillboardGuiAnimation.Frame
	v21.TextLabels.TopText.Visible = true
	v21.TextLabels.BottomText.Visible = true
	local v22 = v_u_19.CenterEmitPoint
	local v23 = v_u_19.ThrustEmitPoint
	local v24 = Instance.new("BloomEffect")
	v24.Enabled = true
	v24.Name = "NukeBloom"
	v24.Size = 15
	v24.Threshold = 0.25
	v24.Intensity = -1
	v24.Parent = game.Lighting
	local v25 = v_u_19.Objects
	local v26 = v25.ConfettiBox:Clone()
	v25.ConfettiBox:Destroy()
	v25:Destroy()
	local v28 = v_u_4.new(Enum.RenderPriority.Camera.Value, function(p27)
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p27
	end)
	v28:Start()
	v_u_19.Position = Vector3.new(166.436, 6.485, 307.589)
	u5(v23.Flame, 5)
	u5(v23.Shockwave, 15)
	u5(v23.BigShockwave, 50)
	u5(v23.Flame2, 5)
	u5(v23.Flame3, 5)
	u5(v23.Flame4, 5)
	u5(v23.Flame5, 10)
	u5(v23.Smoke, 1.5)
	u5(v23.SmokePreLaunch, 3)
	u5(v23.SmokeLaunch, 4)
	u5(v23.SmokeRing, 4)
	u5(v_u_19.Sparkles, 2.5)
	u5(v_u_19.Sparks, 3)
	u5(v22.Rays1, 25)
	u5(v22.Rays2, 25)
	u5(v22.Rays3, 25)
	u5(v22.SmoothRaysBig, 7.5)
	u5(v22.RaysBig, 8)
	u5(v22.SparkleExplosion, 4)
	u5(v22.Spark3, 25)
	v_u_19.CFrame = workspace.Map.NukeIsland.Nuke.CFrame
	v_u_19.AlignPosition.Position = v_u_19.Position
	v_u_19.AlignOrientation.CFrame = v_u_19.CFrame
	v_u_20.Value = v_u_19.CFrame
	v_u_19.Anchored = false
	v_u_19.Parent = workspace
	local v29 = v_u_14.Heartbeat:Connect(function(_)
		-- upvalues: (copy) v_u_19, (copy) v_u_20
		v_u_19.AlignPosition.Position = v_u_20.Value.Position
		v_u_19.AlignOrientation.CFrame = v_u_20.Value
	end)
	wait(1)
	v_u_19.Sparkles.Enabled = false
	v_u_19.ThrustEmitPoint.SmokePreLaunch.Enabled = true
	v_u_19.ThrustEmitPoint.SmokePreLaunch.Rate = 0
	v_u_19.PreThruster:Play()
	v_u_19.PreThruster.Volume = 0
	v_u_19.PreThruster.PlaybackSpeed = 0.1
	v_u_2:Create(v_u_19.PreThruster, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Volume"] = 1,
		["PlaybackSpeed"] = 0.5
	}):Play()
	v_u_2:Create(v_u_19.ThrustEmitPoint.SmokePreLaunch, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Rate"] = 100
	}):Play()
	wait(5)
	v28:ShakeSustain(v_u_4.Presets.Earthquake)
	v_u_19.Sparkles.Enabled = true
	v_u_19.ThrustEmitPoint.SmokePreLaunch.Enabled = false
	v23.SmokeLaunch:Emit(50)
	v_u_19.AlignPosition.Responsiveness = 25
	v_u_19.AlignOrientation.Responsiveness = 25
	v_u_19.PreLaunch:Play()
	v_u_19.Thruster2:Play()
	v_u_2:Create(v_u_19.Thruster2, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
		["PlaybackSpeed"] = 1.5,
		["Volume"] = 3
	}):Play()
	v_u_2:Create(v_u_19.PreThruster, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Volume"] = 1,
		["PlaybackSpeed"] = 1
	}):Play()
	for _, v30 in pairs(v23:GetChildren()) do
		if string.find(v30.Name, "Flame") == nil then
			v30.Enabled = true
		end
	end
	v23.SmokeRing.Enabled = false
	v23.SmokeLaunch.Enabled = false
	v23.Shockwave.Enabled = false
	v23.BigShockwave.Enabled = false
	v23.Flare.Enabled = false
	v22.Rays1.Enabled = true
	v22.Rays2.Enabled = true
	v22.Rays3.Enabled = true
	for v31 = 1, 10 do
		v_u_20.Value = v_u_20.Value:ToWorldSpace(CFrame.Angles(0.17453292519943295, 0, 0))
		v_u_20.Value = v_u_20.Value:ToWorldSpace(CFrame.new(0, 50, 0))
		wait(v31 * 0.0125)
	end
	v_u_19.AlignPosition.Responsiveness = 10
	v_u_19.AlignOrientation.Responsiveness = 10
	v_u_20.Value = CFrame.new(v_u_20.Value.Position, Vector3.new(166.436, 6.485, 307.589)):ToWorldSpace(CFrame.Angles(-1.5707963267948966, 0, 0))
	wait(0.5)
	v24.Intensity = 1
	v24.Size = 20
	v_u_2:Create(v24, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, 0, false, 0), {
		["Intensity"] = -1,
		["Size"] = 10
	}):Play()
	v_u_19.AlignPosition.Responsiveness = 50
	v_u_19.AlignOrientation.Responsiveness = 50
	v23.SmokeRing:Emit(50)
	v23.Flame:Emit(25)
	v23.Flame2:Emit(25)
	v23.Flame3:Emit(25)
	v23.Flame4:Emit(25)
	v23.Flame5:Emit(25)
	v23.Shockwave.Enabled = true
	v23.BigShockwave:Emit(1)
	v_u_19.Launch:Play()
	v_u_19.Thruster:Play()
	for _, v32 in pairs(v23:GetChildren()) do
		v32.Enabled = true
	end
	v23.SmokeRing.Enabled = false
	v23.SmokeLaunch.Enabled = false
	v23.BigShockwave.Enabled = false
	v23.Flare:Emit(10)
	v_u_2:Create(v_u_20, TweenInfo.new(2.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0), {
		["Value"] = CFrame.new(Vector3.new(166.436, 6.485, 307.589) + Vector3.new(0, -1, 0), Vector3.new(166.436, 6.485, 307.589)):ToWorldSpace(CFrame.Angles(1.5707963267948966, 0, 0))
	}):Play()
	wait(2.6)
	v28:StopSustained(0)
	v28:ShakeOnce(4, 6, 0.25, 4)
	v24.Intensity = 1
	v24.Size = 30
	v_u_2:Create(v24, TweenInfo.new(5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, 0, false, 0), {
		["Intensity"] = -1,
		["Size"] = 10
	}):Play()
	v_u_19.Anchored = true
	v_u_19.Transparency = 1
	v_u_19.Size = Vector3.new(0, 0, 0)
	v_u_19.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	v_u_19.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	v_u_19.CFrame = v_u_20.Value
	v_u_19.PreThruster:Stop()
	v_u_19.Thruster:Stop()
	v_u_19.Thruster2:Stop()
	v_u_19.Explosion.TimePosition = 0.75
	v_u_19.Explosion:Play()
	v_u_19.ChimeLoop:Play()
	v_u_19.ApplauseLoop:Play()
	v_u_19.CoinsLoop:Play()
	v21.TextLabels.TopText.Text = string.upper(p16) .. " DONATED"
	v21.TextLabels.MiddleText.Text = tostring(p18):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
	v21.TextLabels.BottomText.Text = "TO " .. string.upper(p17)
	v21.RobuxLogo.Size = UDim2.fromScale(0, 0)
	v21.RobuxLogo.Rotation = -180
	v21.Star.Size = UDim2.fromScale(0, 0)
	v21.TextLabels.BottomText.Size = UDim2.fromScale(0, 0)
	v21.TextLabels.BottomText.Position = UDim2.fromScale(0.5, 0.5)
	v21.TextLabels.MiddleText.Size = UDim2.fromScale(0, 0)
	v21.TextLabels.TopText.Position = UDim2.fromScale(0.5, 0.5)
	v21.TextLabels.TopText.Size = UDim2.fromScale(0, 0)
	v21.Parent.Enabled = true
	v_u_2:Create(v_u_19, TweenInfo.new(20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Position"] = Vector3.new(166.436, 6.485, 307.589) + Vector3.new(0, 250, 0)
	}):Play()
	v_u_2:Create(v21.RobuxLogo, TweenInfo.new(10, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
		["Size"] = UDim2.fromScale(1, 1)
	}):Play()
	v_u_2:Create(v21.RobuxLogo, TweenInfo.new(15, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
		["Rotation"] = 0
	}):Play()
	v_u_2:Create(v21.Star, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
		["Size"] = UDim2.fromScale(1.5, 1.5)
	}):Play()
	v_u_2:Create(v21.Star, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Rotation"] = 360
	}):Play()
	v_u_2:Create(v21.Star, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 5), {
		["ImageTransparency"] = 1,
		["ImageColor3"] = Color3.fromRGB(255, 255, 0)
	}):Play()
	for _, v33 in pairs(v23:GetChildren()) do
		v33.Enabled = false
	end
	v_u_19.Sparkles.Enabled = false
	for _, v34 in pairs(v22:GetChildren()) do
		v34.Enabled = false
	end
	v22.SparkleExplosion:Emit(100)
	v22.Shockwave:Emit(15)
	v22.FractalBurst:Emit(3)
	v22.RaysBig:Emit(20)
	v22.Spark1:Emit(100)
	v22.Spark2:Emit(100)
	v22.Spark3:Emit(50)
	local v_u_35 = v26:Clone()
	v_u_35.Position = Vector3.new(166.436, 6.485, 307.589) + Vector3.new(0, 250, 0)
	v_u_35.Parent = workspace
	v_u_2:Create(v_u_35, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Size"] = Vector3.new(1000, 100, 1000)
	}):Play()
	spawn(function()
		-- upvalues: (copy) v_u_35, (ref) v_u_2
		local v36 = v_u_35:GetChildren()
		for _, v37 in pairs(v36) do
			if v37:IsA("ParticleEmitter") then
				v37.Enabled = true
			end
		end
		wait(60)
		for _, v38 in pairs(v36) do
			if v38:IsA("ParticleEmitter") then
				v_u_2:Create(v38, TweenInfo.new(60, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					["Rate"] = 0
				}):Play()
			end
		end
		wait(60)
		v_u_35.Size = Vector3.new(0, 0, 0)
		wait(30)
		v_u_35:Destroy()
	end)
	script.Scripts.SpawnFireworks.Enabled = true
	v_u_19.Sparks.Enabled = true
	v22.SparkleExplosion.Enabled = true
	v_u_2:Create(v_u_19.Sparks, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
		["Rate"] = 0
	}):Play()
	v_u_2:Create(v22.SparkleExplosion, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
		["Rate"] = 0
	}):Play()
	v_u_2:Create(v_u_19.ChimeLoop, TweenInfo.new(55, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
		["Volume"] = 0,
		["PlaybackSpeed"] = 0.75
	}):Play()
	v_u_2:Create(v_u_19.ApplauseLoop, TweenInfo.new(60, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
		["Volume"] = 0
	}):Play()
	v_u_2:Create(v_u_19.CoinsLoop, TweenInfo.new(50, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
		["Volume"] = 0,
		["PlaybackSpeed"] = 1
	}):Play()
	wait(30)
	v_u_2:Create(v21.UIScale, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
		["Scale"] = 0
	}):Play()
	wait(15)
	v21.Parent.Enabled = false
	wait(30)
	v28:Stop()
	v24:Destroy()
	v29:Disconnect()
	v_u_19:Destroy()
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.Settings.Frame.GlobalEffectsSetting:GetAttribute("Value") == true then
	task.defer(function()
		script.Parent = nil;
	end)
	v1.EepDoop:Fire(function()
		u7(script.RobuxNuke, script:GetAttribute("Donator"), script:GetAttribute("Raiser"), script:GetAttribute("Amount"))
		script:Destroy()
	end)
else
	wait(0.1);
	script:Destroy();
end;