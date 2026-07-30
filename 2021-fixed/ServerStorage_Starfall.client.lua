-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local function _start()
	local _succed, _err = pcall(function()
		local ServerScriptService = game:GetService("StarterPlayer")
		local ServerScriptService2 = game:GetService("ServerStorage")
		local StarterGui = game:GetService("StarterGui")
		local TweenService = game:GetService("TweenService")
		local cameradisconnect = false;
		local u1 = script.StarfallEffect:Clone()
		u1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 500)
		local v2 = u1:GetChildren()
		local ChargeAppearance = u1.ChargeAppearance:Clone()
		local u3 = game.Workspace.CurrentCamera
		local u4 = Instance.new("Camera")
		local u4_1 = Vector3.new(0.43, -1100.521, 0)
		local u477 = Vector3.new(0, 0.583, 0);
		u4.Parent = u1
		local Needed = 3
		local US = UserSettings()
		local UGS = US:GetService("UserGameSettings")
		local Camera = require(script.CameraShaker)
		local SpawnPosition = Vector3.new(166.153, 0.583, 307.092)
		local v22 = Instance.new("ColorCorrectionEffect")
		local v23 = Instance.new("BloomEffect")
		TweenService:Create(game.Lighting, TweenInfo.new(5), {
			ClockTime = 0
		}):Play()
		v22.Name = "EndownmentColorCorrection"
		v22.Enabled = false
		v22.Parent = game:GetService("Lighting")
		v23.Name = "EndownmentBloom"
		v23.Enabled = false
		v23.Size = 30
		v23.Threshold = 0.35
		v23.Intensity = -0.875
		v23.Parent = game:GetService("Lighting")
		local function Check()
			return UGS.SavedQualityLevel.Value
		end
		local function u2(p1, p2)
			p1.Speed = NumberRange.new(p1.Speed.Min * p2, p1.Speed.Max * p2);
			p1.Acceleration = p1.Acceleration * p2;
			local l__Keypoints__5 = p1.Size.Keypoints;
			local v6 = {};
			for v7 = 1, #l__Keypoints__5 do
				table.insert(v6, NumberSequenceKeypoint.new(l__Keypoints__5[v7].Time, l__Keypoints__5[v7].Value * p2, l__Keypoints__5[v7].Envelope * p2));
			end;
			p1.Size = NumberSequence.new(v6);
		end;
		local u5 = Instance.new("Part")
		u5.Name = "CamPart"
		u5.Anchored = true
		u5.Transparency = 1
		u5.CanCollide = false
		u5.CanQuery = false
		u5.CanTouch = false
		u5.Parent = workspace
		local function _loadplr(p3, p4)
			local v8 = game.Players:GetHumanoidDescriptionFromUserId(p3);
			v8.DepthScale = v8.DepthScale * 35;
			v8.HeadScale = v8.HeadScale * 35
			v8.HeightScale = v8.HeightScale * 35;
			v8.WidthScale = v8.WidthScale * 35;
			p4.Humanoid:ApplyDescription(v8);
		end;
		local function DuplicatePart(Part, Colorwing)
			coroutine.wrap(function()
				wait(0.15)
				local NewPart = Part:Clone()
				NewPart.Color = Color3.fromRGB(255, 34, 237)
				NewPart.Anchored = true
				NewPart.Size = Vector3.new(Part.Size.X * 1.0, Part.Size.Y * 1.0, Part.Size.Z * 1.0)
				NewPart.Transparency = 0
				NewPart.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_PlayerInside.WorldModel
				NewPart.Material = Enum.Material.Neon
				NewPart:ClearAllChildren() -- remove
				local TI = TweenInfo.new(.55, Enum.EasingStyle.Linear)
				wait(.025)
				game.TweenService:Create(NewPart, TI, {Transparency = 1}):Play() -- .25
				if Colorwing == true then
					game.TweenService:Create(NewPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Color = Color3.fromRGB(255, 255, 255)}):Play()
				end
				wait(TI.Time) -- .3
				NewPart:Destroy()
			end)()
		end
		local function DuplicateHand(Part)
			DuplicatePart(Part, false)
		end
		local function DuplicateAcc(Part)
			DuplicatePart(Part, false)
		end
		local BlackThingy
		local CurrentWingedGiant
		local CurrentWingedGiant2
		local Wings	
		local Arms
		coroutine.wrap(function()
			while wait(0.1) do
				if CurrentWingedGiant then
					if CurrentWingedGiant then
						DuplicatePart(CurrentWingedGiant.LeftFoot)
						DuplicatePart(CurrentWingedGiant.RightFoot)
						DuplicatePart(CurrentWingedGiant.RightLowerLeg)
						DuplicatePart(CurrentWingedGiant.LeftLowerLeg)
						DuplicatePart(CurrentWingedGiant.LeftUpperLeg)
						DuplicatePart(CurrentWingedGiant.RightUpperLeg)
						DuplicatePart(CurrentWingedGiant.LowerTorso)
						DuplicatePart(CurrentWingedGiant.UpperTorso)
						DuplicatePart(CurrentWingedGiant.LeftHand)
						DuplicatePart(CurrentWingedGiant.RightHand)
						DuplicatePart(CurrentWingedGiant.RightLowerArm)
						DuplicatePart(CurrentWingedGiant.LeftLowerArm)
						DuplicatePart(CurrentWingedGiant.LeftUpperArm)
						DuplicatePart(CurrentWingedGiant.RightUpperArm)
						--DuplicatePart(CurrentWingedGiant.Head)
						--[[for i,v in ipairs(CurrentWingedGiant:GetChildren()) do
							if v:IsA("Accessory") then
								for i,mesh in ipairs(v:GetChildren()) do
									if mesh:IsA("MeshPart") then
										DuplicateAcc(mesh)
									end
								end
							end
						end]]
					end
				else
					wait()
					--if workspace:FindFirstChild("BodyParts") then
					--workspace.BodyParts:ClearAllChildren()
					--end
				end
			end
		end)()
		coroutine.wrap(function()
			while wait(0.1) do
				if CurrentWingedGiant2 then
					if CurrentWingedGiant2 then
						DuplicatePart(CurrentWingedGiant2.LeftFoot)
						DuplicatePart(CurrentWingedGiant2.RightFoot)
						DuplicatePart(CurrentWingedGiant2.RightLowerLeg)
						DuplicatePart(CurrentWingedGiant2.LeftLowerLeg)
						DuplicatePart(CurrentWingedGiant2.LeftUpperLeg)
						DuplicatePart(CurrentWingedGiant2.RightUpperLeg)
						DuplicatePart(CurrentWingedGiant2.LowerTorso)
						DuplicatePart(CurrentWingedGiant2.UpperTorso)
						DuplicatePart(CurrentWingedGiant2.LeftHand)
						DuplicatePart(CurrentWingedGiant2.RightHand)
						DuplicatePart(CurrentWingedGiant2.RightLowerArm)
						DuplicatePart(CurrentWingedGiant2.LeftLowerArm)
						DuplicatePart(CurrentWingedGiant2.LeftUpperArm)
						DuplicatePart(CurrentWingedGiant2.RightUpperArm)
						--DuplicatePart(CurrentWingedGiant.Head)
					end
				else
					wait()
					--if workspace:FindFirstChild("BodyParts") then
					--workspace.BodyParts:ClearAllChildren()
					--end
				end
			end
		end)()
		u1.BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
		game.TweenService:Create(u1.BackgroundOverlay,TweenInfo.new(5),{BackgroundTransparency = 0}):Play()
		game.TweenService:Create(u1.ViewportFrame_Background,TweenInfo.new(3,Enum.EasingStyle.Linear),{ImageTransparency = 0.3}):Play()
		for v6 = 1, #v2 do
			if v2[v6]:IsA("ViewportFrame") then
				local connection
				connection = game["Run Service"].RenderStepped:Connect(function()
					local s = Check()
					v2[v6].CurrentCamera = u4
					u5.CFrame = u3.CFrame * CFrame.new(0, 0, -1500)
					u4.CFrame = CFrame.new(u3.CFrame.RightVector, u3.CFrame.LookVector + u3.CFrame.RightVector)
					u4.FieldOfView = u3.FieldOfView
				end)
				u1.Size = UDim2.new(0, u3.ViewportSize.X, 0, u3.ViewportSize.Y)
				local function updateSize()
					u1.Size = UDim2.new(0, u3.ViewportSize.X, 0, u3.ViewportSize.Y)
				end
				u3:GetPropertyChangedSignal("ViewportSize"):Connect(updateSize)
				local u7 = false
				game:GetService("RunService").Heartbeat:Connect(function()
					if u7 then
						connection:Disconnect()
						u5:Destroy()
						u1:Destroy()
					end
				end)
			end
		end
		u1.Ambiance:Play()
		u1.Enabled = true
		u1.Adornee = u5
		local _speedlines = u1.SpeedlinesUI:Clone()
		_speedlines.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 100);
		local _speedlines2 = u1.SpeedlinesUI2:Clone()
		_speedlines2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 100);
		local _lines1 = u1.ConcentrationLines:Clone()
		_lines1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 100);
		local _lines2 = u1.ConcentrationLines2:Clone()
		_lines2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 100);
		local _lines3 = u1.ConcentrationLines23:Clone()
		_lines3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui", 100);
		local _dis1 = u1.Dis1:Clone()
		_dis1.Parent = workspace;
		local _dis2 = u1.Dis2:Clone()
		_dis2.Parent = workspace;
		local u69 =  game.ReplicatedStorage.WingedEndowmentPlayer:Clone()
		u69.Parent = u1.ViewportFrame_Player.WorldModel
		local allplyto = u69
		local v17 = u1.ImpactVisuals:Clone()
		local v15 = u1.Blackhole:Clone()	
		local v16 = u1.FloorAmbiance:Clone()
		local anim = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.Humanoid:LoadAnimation(script.Animation)
		local anim2 = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.EndowmentWings.AnimationController:LoadAnimation(script.Animation2)
		local v24 = Camera.new(Enum.RenderPriority.Camera.Value, function(p9)
			workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p9
		end)
		TweenService:Create(u1.ViewportFrame_Background.WorldModel.Wind1,TweenInfo.new(70,Enum.EasingStyle.Linear,Enum.EasingDirection.In,100000000000,false,0),{Orientation = u1.ViewportFrame_Background.WorldModel.Wind1.Orientation + Vector3.new(0, -360, 0)}):Play()
		TweenService:Create(u1.ViewportFrame_Background.WorldModel.Wind2,TweenInfo.new(200,Enum.EasingStyle.Linear,Enum.EasingDirection.In,100000000000,false,0),{Orientation = u1.ViewportFrame_Background.WorldModel.Wind2.Orientation + Vector3.new(0, 360, 0)}):Play()
		TweenService:Create(u1.ViewportFrame_Background.WorldModel.Wind3,TweenInfo.new(70,Enum.EasingStyle.Linear,Enum.EasingDirection.In,100000000000,false,0),{Orientation = u1.ViewportFrame_Background.WorldModel.Wind3.Orientation + Vector3.new(0, 360, 0)}):Play()
		TweenService:Create(u1.ViewportFrame_Background.WorldModel.Wind4,TweenInfo.new(70,Enum.EasingStyle.Linear,Enum.EasingDirection.In,100000000000,false,0),{Orientation = u1.ViewportFrame_Background.WorldModel.Wind4.Orientation + Vector3.new(0, -360, 0)}):Play()
		v24:Start()
		wait(1)
		script.Summon:Play()
		TweenService:Create(u1.ViewportFrame_Background, TweenInfo.new(10), {ImageTransparency = 0}):Play()
		local v28, v29 = pcall(function()
			_loadplr(script:GetAttribute("DonatorId"), allplyto);
			u69.Humanoid.BodyDepthScale.Value = 50;
			u69.Humanoid.HeadScale.Value = 50;
			u69.Humanoid.BodyHeightScale.Value = 50;
			u69.Humanoid.BodyWidthScale.Value = 50;
		end);
		if v28 == false then
			warn("Unable to set giant's apperance to donator (" .. script:GetAttribute("Donator") .. ")  (" .. v29 .. ")");
		end;
		wait(2)
		u1.RiseBeamStart:Play()
		local Circle = u1.Circle:Clone()
		local Star1 = u1.Star1:Clone()
		local Star2 = u1.Star2:Clone()
		Circle.Position = u69.StarPosition.Position
		Star1.Position = u69.StarPosition.Position
		Star2.Position = u69.StarPosition.Position
		Circle.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Star.WorldModel
		Star1.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Star.WorldModel
		Star2.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_Star.WorldModel
		Star1.Size = Vector3.new(1, 2, 3)
		Star2.Size = Vector3.new(1, 2, 3)
		Circle.Size = Vector3.new(0,0,0)
		Circle.Transparency = 0
		local Chargepart = u1.Speedlines2:Clone()

		game.TweenService:Create(Circle,TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),{Transparency = 0.6}):Play()
		game.TweenService:Create(Star1,TweenInfo.new(1,Enum.EasingStyle.Sine),{Orientation = Star1.Orientation + Vector3.new(90, 0, 0)}):Play()
		game.TweenService:Create(Circle,TweenInfo.new(2, Enum.EasingStyle.Quart),{Size = Vector3.new(1252.486, 0.612, 1252.486)}):Play() 
		game.TweenService:Create(Star2,TweenInfo.new(1,Enum.EasingStyle.Sine),{Orientation = Star2.Orientation + Vector3.new(90, 0, 0)}):Play()
		game.TweenService:Create(Star1,TweenInfo.new(1.3),{Size = Vector3.new(30.578, 1252.486, 733.879)}):Play()
		game.TweenService:Create(Star2,TweenInfo.new(1.3),{Size = Vector3.new(30.578, 1252.486, 733.879)}):Play()
		wait(0.5)
		game.TweenService:Create(Star1,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 668, 0)}):Play()
		game.TweenService:Create(Star2,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 668, 0)}):Play()
		--game.TweenService:Create(Star1,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0.2),{Transparency = 1}):Play()
		--game.TweenService:Create(Star2,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0.2),{Transparency = 1}):Play()
		game.TweenService:Create(Circle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0.5),{Transparency = 1}):Play() 
		wait(0.5)
		u1.RiseBeamLoop:Play()
		Star1.Transparency = 1
		Star2.Transparency = 1
		game.TweenService:Create(game.Lighting.EndownmentColorCorrection, TweenInfo.new(0.5), {
			Brightness = 0
		}):Play();
		v24:ShakeOnce(0.5, 15, 0, 2);
		u1.RiseBeamOpen1:Play()
		u1.RiseBeamOpen2:Play()
		local playertransparencytween = TweenService:Create(u1.ViewportFrame_Player, TweenInfo.new(1),{ImageTransparency = 0})
		playertransparencytween:Play()
		playertransparencytween.Completed:Connect(function() 
			CurrentWingedGiant = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer
		end)
		u1.ScreenGui.Blocks.Enabled = true
		u1.ScreenGui.v29.Enabled = true
		u1.ScreenGui.v30.Enabled = true
		u1.ViewportFrame_Player.Ambient = Color3.fromRGB(0,0,0)
		u1.ViewportFrame_Player.LightDirection = Vector3.new(0,1,0)
		anim:Play()
		anim2:Play()

		local Beams =  script.RiseBeamEffects:Clone()

		Beams.Parent = u1.ViewportFrame_RiseBeamEffects.WorldModel
		local Beam1 = u1.Beam1
		local Beam2 = u1.Beam2
		local Beam3 = u1.Beam3
		local Beam4 = u1.Beam4
		local c1 = Beams.c1
		local c2 = Beams.c2
		Beam1.Position = u69.PortalPosition.Position
		Beam2.Position = u69.PortalPosition.Position
		Beam3.Position = u69.PortalPosition.Position
		Beam4.Position = u69.PortalPosition.Position
		Beam1.Parent = u1.ViewportFrame_RiseBeam1.WorldModel
		Beam2.Parent = u1.ViewportFrame_RiseBeam2.WorldModel
		Beam3.Parent = u1.ViewportFrame_RiseBeam3.WorldModel
		Beam4.Parent = u1.ViewportFrame_RiseBeam4.WorldModel
		Beam1.Orientation = u69.PortalPosition.Orientation
		Beam2.Orientation = u69.PortalPosition.Orientation
		Beam3.Orientation = u69.PortalPosition.Orientation
		Beam4.Orientation = u69.PortalPosition.Orientation

		c1.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.c1.Position
		c2.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.c2.Position

		c1.Orientation = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.c1.Orientation
		c2.Orientation = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.c2.Orientation
		local HandParticlesOut
		local pinkthingy
		local _stopthat = true
		coroutine.wrap(function()
			while _stopthat == true do
				wait(.0010)
				if BlackThingy then
					task.wait(u1.Speedlines.Value)
					if BlackThingy then
						local Beams = u1.ViewportFrame_RiseBeamEffects.WorldModel
						local Position1 = Beams.c1.Position
						local Position2 = Beams.c2.Position
						local numberOfSpheres = 5
						for i = 1, numberOfSpheres do
							local Part1 = u1.BlackSphere1:Clone()
							local RandomSize = {
								Vector3.new(math.random(2, 9) * 0.85, math.random(460, 710) * 0.85, math.random(0, 1)),
								Vector3.new(math.random(2, 8) * 0.85, math.random(60, 180) * 0.85, math.random(0, 1))
							}
							Part1.Size = RandomSize[math.random(1, #RandomSize)]
							Part1.Parent = u1.ViewportFrame_RiseBeamEffects.WorldModel
							local minX = math.min(Position1.X, Position2.X)
							local maxX = math.max(Position1.X, Position2.X)
							local randomX = math.random(minX, maxX)
							local minZ = math.min(Position1.Z, Position2.Z)
							local maxZ = math.max(Position1.Z, Position2.Z)
							local randomZ = math.random(minZ, maxZ)
							Part1.Position = Vector3.new(randomX, -250, randomZ)
							local tween = game.TweenService:Create(Part1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential,Enum.EasingDirection.In,0,false,0), {Position = Part1.Position + Vector3.new(0, 2500, 0)})
							tween:Play()
							--game.TweenService:Create(Part1, TweenInfo.new(0.2, Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0.3), {Size = Vector3.new(0,0,0)}):Play()
							tween.Completed:Connect(function()
								Part1:Destroy()
							end)
						end
					end
				else
					task.wait()
				end
			end
		end)()

		coroutine.wrap(function()
			while _stopthat == true do
				wait(.005)
				if pinkthingy then
					task.wait(u1.Speedlines.Value)
					if pinkthingy then
						local Beams = u1.ViewportFrame_RiseBeamEffects.WorldModel
						local Position1 = Beams.c1.Position
						local Position2 = Beams.c2.Position
						local numberOfSpheres = 2
						for i = 1, numberOfSpheres do
							local Part1 = u1.PinkSphere1:Clone()
							local RandomSize = {
								Vector3.new(math.random(2, 9) * 0.85, math.random(460, 710) * 0.85, math.random(0, 1)),
								Vector3.new(math.random(2, 8) * 0.85, math.random(60, 180) * 0.85, math.random(0, 1))
							}
							Part1.Size = RandomSize[math.random(1, #RandomSize)]
							Part1.Parent = u1.ViewportFrame_RiseBeamEffects.WorldModel
							local minX = math.min(Position1.X, Position2.X)
							local maxX = math.max(Position1.X, Position2.X)
							local randomX = math.random(minX, maxX)
							local minZ = math.min(Position1.Z, Position2.Z)
							local maxZ = math.max(Position1.Z, Position2.Z)
							local randomZ = math.random(minZ, maxZ)
							Part1.Position = Vector3.new(randomX, -250, randomZ)
							local tween = game.TweenService:Create(Part1, TweenInfo.new(0.3, Enum.EasingStyle.Exponential,Enum.EasingDirection.In,0,false,0), {Position = Part1.Position + Vector3.new(0, 2500, 0)})
							tween:Play()
							--game.TweenService:Create(Part1, TweenInfo.new(0.2, Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0.3), {Size = Vector3.new(0,0,0)}):Play()
							tween.Completed:Connect(function()
								Part1:Destroy()
							end)
						end
					end
				else
					wait()
				end
			end
		end)()
		local HandVFX = true;
		coroutine.wrap(function()
			while wait(0.005) and HandVFX == true do
				if HandParticlesOut then
					if HandParticlesOut then
						local randomPosition2 = Vector3.new(
							math.random(-75, 75),
							math.random(-75, 75),
							math.random(-75, 75)
						)
						local particles = u1.HandParticlesOut:Clone()
						local particles2 = u1.HandParticlesOut:Clone()
						local particlesin = u1.HandParticlesIn:Clone()
						local particlesin2 = u1.HandParticlesIn:Clone()
						particles.Parent = u1.ViewportFrame_PlayerEffects.WorldModel 
						particles.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.Position
						particlesin.Parent = u1.ViewportFrame_PlayerEffects.WorldModel
						particlesin.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.Position
						particlesin2.Parent = u1.ViewportFrame_PlayerEffects.WorldModel
						particlesin2.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.RightHand.Position
						particles2.Parent = u1.ViewportFrame_PlayerEffects.WorldModel
						particles2.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.RightHand.Position
						local particlestween = 	game.TweenService:Create(particles,TweenInfo.new(0.75),{Size = Vector3.new(0,0,0)})
						particlestween:Play()
						particlestween.Completed:Connect(function()
							particles:Destroy()
						end)

						game.TweenService:Create(particles,TweenInfo.new(10),{Position = randomPosition2}):Play()

						local particles2tween = game.TweenService:Create(particles2,TweenInfo.new(0.75),{Size = Vector3.new(0,0,0)})
						particles2tween:Play()
						particles2tween.Completed:Connect(function()
							particles2:Destroy()
						end)
						game.TweenService:Create(particles2,TweenInfo.new(10),{Position = randomPosition2}):Play()

						local particlesintween = game.TweenService:Create(particlesin,TweenInfo.new(0.75),{Size = Vector3.new(0,0,0)})
						particlesintween:Play()
						particlesintween.Completed:Connect(function()
							particlesin:Destroy()
						end)
						game.TweenService:Create(particlesin,TweenInfo.new(4),{Position = randomPosition2}):Play()

						local particlesin2tween = game.TweenService:Create(particlesin2,TweenInfo.new(0.75),{Size = Vector3.new(0,0,0)})
						game.TweenService:Create(particlesin2,TweenInfo.new(4),{Position = randomPosition2}):Play()

						particlesin2tween:Play()
						particlesin2tween.Completed:Connect(function()
							particlesin2:Destroy()
						end)
					end
				else
					wait()
				end
			end
		end)()	
		Beam1.Mesh.Scale = Vector3.new(0,1000000,0)
		Beam2.Mesh.Scale = Vector3.new(0,1000000,0)
		Beam3.Mesh.Scale = Vector3.new(0,1000000,0)
		Beam4.Mesh.Scale = Vector3.new(0,1000000,0)
		TweenService:Create(Beam1.Mesh,TweenInfo.new(2,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0),{Scale = Vector3.new(85, 50000, 20)}):Play()
		TweenService:Create(Beam2.Mesh,TweenInfo.new(2,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0.05),{Scale = Vector3.new(100, 50000, 20)}):Play()
		TweenService:Create(Beam3.Mesh,TweenInfo.new(2,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0.1),{Scale = Vector3.new(120, 50000, 10)}):Play()
		TweenService:Create(Beam4.Mesh,TweenInfo.new(2,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0.15),{Scale = Vector3.new(135, 50000, 5)}):Play()
		v16.Position = SpawnPosition + Vector3.new(0, -0.5, 0);
		v16.Parent = workspace;
		game.TweenService:Create(u1, TweenInfo.new(1, Enum.EasingStyle.Sine), {
			Brightness = 2.66
		}):Play()
		TweenService:Create(v16, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
			Size = Vector3.new(2048, 1, 2048)
		}):Play();
		game:GetService("TweenService"):Create(u1.Speedlines, TweenInfo.new(0), {Value = 0}):Play()
		coroutine.wrap(function()
			pinkthingy = u1.ViewportFrame_RiseBeamEffects.WorldModel
			wait(0.2)
			pinkthingy = nil
			BlackThingy = u1.ViewportFrame_RiseBeamEffects.WorldModel
		end)()
		u1.BackgroundOverlay.BackgroundTransparency = 0
		u1.BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
		game.TweenService:Create(u1.BackgroundOverlay,TweenInfo.new(1.5,Enum.EasingStyle.Linear),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()

		game.TweenService:Create(u1.ViewportFrame_Background.WorldModel.Wind2, TweenInfo.new(1), {
			Color = Color3.fromRGB(47, 27, 47),
			Transparency = 0.5
		}):Play()
		anim:GetMarkerReachedSignal("ChargeApperance"):Connect(function()
			if not cameradisconnect then
				local cameraconnection
				cameraconnection = game:GetService("RunService").RenderStepped:Connect(function()
					local camera = game.Workspace.CurrentCamera
					if camera and u1 and u1.ViewportFrame_Player and u1.ViewportFrame_Player.WorldModel and u1.ViewportFrame_Player.WorldModel:FindFirstChild("WingedEndowmentPlayer") then
						local playerModel = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer
						if playerModel:FindFirstChild("HumanoidRootPart") then
							Chargepart.CFrame = CFrame.new(u3.CFrame.Position, playerModel.HumanoidRootPart.Position * 1500)
						else
							cameraconnection:Disconnect()
						end
					else
						cameraconnection:Disconnect()
					end
				end)
				Chargepart.Parent = game.Workspace
				if cameradisconnect then
					cameraconnection:Disconnect()
				end
			end
			Wings = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.EndowmentWings
			u1.ApperanceCharge:Play()
			u1.ScreenGui.Vignette.ImageTransparency = 1;
			u1.ScreenGui.Enabled = true;
			TweenService:Create(u1.ScreenGui.Vignette, TweenInfo.new(1.7), {
				ImageTransparency = 0
			}):Play();
		end)
		anim:GetMarkerReachedSignal("Reveal"):Connect(function()
			cameradisconnect = true
			u1.BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(255, 128, 253)
			u1.BackgroundOverlay.BackgroundTransparency = 0
			game.TweenService:Create(u1.BackgroundOverlay,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,1.5),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
			game.TweenService:Create(u1, TweenInfo.new(.35, Enum.EasingStyle.Sine), {
				Brightness = 1.5
			}):Play()

			for v40, v41 in pairs(v16:GetChildren()) do
				if v41:IsA("ParticleEmitter") then
					u2(v41, 2.5);
					v41.Enabled = true;
				end;
			end;
			Chargepart:Destroy()
			v22.Enabled = true
			v23.Enabled = true
			BlackThingy = nil
			for i,v in ipairs(u1.ViewportFrame_RiseBeamEffects.WorldModel:GetChildren()) do
				v:Destroy()
			end
			local Layer1 = u1.Layer1:Clone()
			local Layer2 = u1.Layer2:Clone()
			local Layer3 = u1.Layer3:Clone()
			local Layer4 = u1.Layer4:Clone()
			local Flash = u1.Flash:Clone()
			Layer1.Parent = u1.ViewportFrame_Effects
			Layer2.Parent = u1.ViewportFrame_Effects
			Layer3.Parent = u1.ViewportFrame_Effects
			Layer4.Parent = u1.ViewportFrame_Effects
			Flash.Parent = u1.ViewportFrame_Effects
			Layer1.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.HumanoidRootPart.CFrame
			Layer2.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.HumanoidRootPart.CFrame
			Layer3.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.HumanoidRootPart.CFrame
			Layer4.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.HumanoidRootPart.CFrame
			Flash.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.HumanoidRootPart.CFrame
			coroutine.wrap(function()
				local name = game.Players.LocalPlayer.Name
				if game.Players[name].PlayerGui:FindFirstChild("ConcentrationLines2") then
					local scale1 = game.Players[name].PlayerGui.ConcentrationLines2:GetAttribute("Transparency")
					game.Players.LocalPlayer.PlayerGui.ConcentrationLines2.Enabled = true
					for i = scale1, 1, 0.01 do
						game.Players[name].PlayerGui.ConcentrationLines2:SetAttribute("Transparency", i)
						wait(0.01)
						if i >= 0.99 then
							game.Players[name].PlayerGui.ConcentrationLines2.Enabled = false
							break
						end
					end
				end
			end)()
			Wings = nil
			CurrentWingedGiant = nil
			u1.ScreenGui.Enabled = true;
			u1.ScreenGui.Vignette.ImageColor3 = Color3.fromRGB(255, 0, 255);
			TweenService:Create(u1.ScreenGui.Vignette, TweenInfo.new(7), {
				ImageTransparency = 1
			}):Play();
			v24:ShakeOnce(3, 15, 0.5, 3);
			game.TweenService:Create(u1.RiseBeamLoop, TweenInfo.new(2, Enum.EasingStyle.Linear), {
				Volume = 0
			}):Play();
			u1.ViewportFrame_Player.LightDirection = Vector3.new(0,1,0)
			game.TweenService:Create(u1.ViewportFrame_Player,TweenInfo.new(1),{Ambient = Color3.fromRGB(255,255,255)}):Play()

			u1.ApperanceCharge:Stop()
			u1.PlayerAppear1:Play()
			u1.PlayerAppear2:Play()
			u1.PlayerAppear3:Play()
			for i, v in pairs(u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.EndowmentWings:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Material = Enum.Material.Neon
				end
			end

			TweenService:Create(Beam1.Mesh,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0),{Scale = Vector3.new(0, 1000000, 0)}):Play()
			TweenService:Create(Beam2.Mesh,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0.05),{Scale = Vector3.new(0, 1000000, 0)}):Play()
			TweenService:Create(Beam3.Mesh,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0.1),{Scale = Vector3.new(0, 1000000, 0)}):Play()
			TweenService:Create(Beam4.Mesh,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0.1),{Scale = Vector3.new(0, 1000000, 0)}):Play()
			wait(.05)
			TweenService:Create(Layer1,TweenInfo.new(0.7,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(267.538, 266.545, 275.725)}):Play()
			TweenService:Create(Layer1,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.5),{Transparency = 1}):Play()
			wait(.1)
			TweenService:Create(Layer3,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.3),{Size = Vector3.new(298.67, 204.664, 207.532)}):Play()
			TweenService:Create(Layer3,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.6),{Transparency = 1}):Play()
			wait(.05)
			TweenService:Create(Layer2,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.2),{Size = Vector3.new(225.223, 231.701, 236.488)}):Play()
			TweenService:Create(Layer2,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.5),{Transparency = 1}):Play()

			TweenService:Create(Layer4,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.4),{Size = Vector3.new(279.361, 187.842, 190.109)}):Play()
			TweenService:Create(Layer4,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.7),{Transparency = 1}):Play()
			wait(1)
			_stopthat = false;
		end)
		local _allowed = true;
		local handstarflash = u1.HandStarFlash:Clone()
		local handstarflash2 = u1.HandStarFlash2:Clone()
		anim:GetMarkerReachedSignal("PingSound"):Connect(function()
			coroutine.wrap(function()
				while _allowed == true do
					wait(0.005)
					if Arms then
						if Arms then
							DuplicateHand(Arms.LeftHand)
							DuplicateHand(Arms.RightHand)
						end
					else
						wait()
					end
				end
			end)()

			local handstarflash = u1.HandStarFlash:Clone()
			local handstarflash2 = u1.HandStarFlash2:Clone()
			handstarflash.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_HandStar.WorldModel
			handstarflash:SetPrimaryPartCFrame(CFrame.new(u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.RightHand.Position)*CFrame.Angles(-10, math.rad(-10), 0))        
			handstarflash2.Parent = game.Players.LocalPlayer.PlayerGui.StarfallEffect.ViewportFrame_HandStar.WorldModel
			handstarflash2:SetPrimaryPartCFrame(CFrame.new(u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.Position)*CFrame.Angles(-10, math.rad(10), 0))
			Arms = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer
			u1.ViewportFrame_PlayerInside.ZIndex = 13
			u1.Ping:Play()
			u1.HandsSwing:Play()
			for _,v in ipairs(handstarflash:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Size = Vector3.new(0,0,0)
				end
			end
			for _,v in ipairs(handstarflash2:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Size = Vector3.new(0,0,0)
				end
			end	
			game.TweenService:Create(handstarflash.Star1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(80, 130, 10)}):Play()
			game.TweenService:Create(handstarflash.Star2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(80, 130, 10)}):Play()
			game.TweenService:Create(handstarflash.StarShard1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(45, 105, 9)}):Play()
			game.TweenService:Create(handstarflash.StarShard2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(45, 105, 9)}):Play()
			game.TweenService:Create(handstarflash.Ring, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(105, 8, 105)}):Play()
			game.TweenService:Create(handstarflash.RingShard, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(85, 5, 85)}):Play()
			game.TweenService:Create(handstarflash.Star1, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {CFrame = handstarflash.CFrames.Star1.CFrame}):Play()
			game.TweenService:Create(handstarflash.Star2, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {CFrame = handstarflash.CFrames.Star2.CFrame}):Play()
			game.TweenService:Create(handstarflash.StarShard1, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {CFrame = handstarflash.CFrames.StarShard1.CFrame}):Play()
			game.TweenService:Create(handstarflash.StarShard2, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {CFrame = handstarflash.CFrames.StarShard2.CFrame}):Play()
			game.TweenService:Create(handstarflash.RingShard, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
			game.TweenService:Create(handstarflash2.Star1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(80, 130, 10)}):Play()
			game.TweenService:Create(handstarflash2.Star2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(80, 130, 10)}):Play()
			game.TweenService:Create(handstarflash2.StarShard1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(45, 105, 9)}):Play()
			game.TweenService:Create(handstarflash2.StarShard2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(45, 105, 9)}):Play()
			game.TweenService:Create(handstarflash2.Ring, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(105, 8, 105)}):Play()
			game.TweenService:Create(handstarflash2.RingShard, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(85, 5, 85)}):Play()
			game.TweenService:Create(handstarflash2.Star1, TweenInfo.new(1, Enum.EasingStyle.Quad), {CFrame = handstarflash2.CFrames.Star1.CFrame}):Play()
			game.TweenService:Create(handstarflash2.Star2, TweenInfo.new(1, Enum.EasingStyle.Quad), {CFrame = handstarflash2.CFrames.Star2.CFrame}):Play()
			game.TweenService:Create(handstarflash2.StarShard1, TweenInfo.new(1, Enum.EasingStyle.Quad), {CFrame = handstarflash2.CFrames.StarShard1.CFrame}):Play()
			game.TweenService:Create(handstarflash2.StarShard2, TweenInfo.new(1, Enum.EasingStyle.Quad), {CFrame = handstarflash2.CFrames.StarShard2.CFrame}):Play()
			game.TweenService:Create(handstarflash2.RingShard, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
			wait(0.3)
			game.TweenService:Create(handstarflash.Star1, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(0, 105, 0)}):Play()
			game.TweenService:Create(handstarflash.Star2, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(0, 105, 0)}):Play()
			game.TweenService:Create(handstarflash.RingShard, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash.StarShard1, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(25, 60, 4)}):Play()
			game.TweenService:Create(handstarflash.StarShard2, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(25, 60, 4)}):Play()
			game.TweenService:Create(handstarflash.StarShard1, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash.StarShard2, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash.Ring, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash2.Star1, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(0, 105, 0)}):Play()
			game.TweenService:Create(handstarflash2.Star2, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(0, 105, 0)}):Play()
			game.TweenService:Create(handstarflash2.RingShard, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash2.StarShard1, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(25, 60, 4)}):Play()
			game.TweenService:Create(handstarflash2.StarShard2, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = Vector3.new(25, 60, 4)}):Play()
			game.TweenService:Create(handstarflash2.StarShard1, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash2.StarShard2, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
			game.TweenService:Create(handstarflash2.Ring, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
		end)
		local crement
		anim:GetMarkerReachedSignal("Clap"):Connect(function()
			u1.ViewportFrame_Effects.ZIndex = 11
			u1.ViewportFrame_PlayerInside.ZIndex = 5
			HandParticlesOut = u1.ViewportFrame_PlayerEffects.WorldModel
			u1.EnergyLoop:Play()
			local Layer1 = u1.Layer1:Clone()
			local Layer2 = u1.Layer2:Clone()
			local Layer3 = u1.Layer3:Clone()
			local Layer4 = u1.Layer4:Clone()
			local Flash = u1.Flash:Clone()
			Layer1.Parent = u1.ViewportFrame_Effects.WorldModel
			Layer2.Parent = u1.ViewportFrame_Effects.WorldModel
			Layer3.Parent = u1.ViewportFrame_Effects.WorldModel
			Layer4.Parent = u1.ViewportFrame_Effects.WorldModel
			Flash.Parent = u1.ViewportFrame_EffectsOverlay.WorldModel
			Layer1.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.CFrame
			Layer2.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.CFrame
			Layer3.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.CFrame
			Layer4.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.CFrame
			Flash.CFrame = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.LeftHand.CFrame
			v24:ShakeOnce(0.75, 8, 0.1, 6);
			Arms = nil
			v15.Parent = workspace;
			u1.Crack.Enabled = true
			u1.EnergyLoop:Play();
			TweenService:Create(v15.Fill, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
				Position = Vector3.new(166.436, 210.377, 307.589)
			}):Play();
			TweenService:Create(v15.Core, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
				Position = Vector3.new(166.436, 210.377, 307.589)
			}):Play();
			TweenService:Create(v15.Model.Outline, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
				Position = Vector3.new(166.436, 210.377, 307.589)
			}):Play();
			TweenService:Create(v15.FormationParticles, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
				Position = Vector3.new(166.436, 210.377, 307.589)
			}):Play();
			v15.Rift:Remove()
			game.TweenService:Create(v15.Fill, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Position = Vector3.new(166.436, 210.377, 307.589) }):Play()
			game.TweenService:Create(v15.Core, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Position = Vector3.new(166.436, 210.377, 307.589) }):Play()
			game.TweenService:Create(v15.FormationParticles, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Position = Vector3.new(166.436, 210.377, 307.589) }):Play()
			game.TweenService:Create(v15.Model.Outline, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Position = Vector3.new(166.436, 210.377, 307.589) }):Play()
			TweenService:Create(Flash.Mesh,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Scale = Vector3.new(1,1,1)}):Play()
			TweenService:Create(Flash,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.1),{Transparency = 1}):Play()
			wait(0.1)
			TweenService:Create(Layer1,TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(167.538, 266.545, 275.725)}):Play()
			TweenService:Create(Layer1,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.35),{Transparency = 1}):Play()
			wait(0.05)
			TweenService:Create(Layer2,TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(125.223, 231.701, 236.488)}):Play()
			TweenService:Create(Layer2,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.35),{Transparency = 1}):Play()
			wait(0.1)
			TweenService:Create(Layer3,TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(198.67, 204.664, 207.532)}):Play()
			TweenService:Create(Layer3,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.35),{Transparency = 1}):Play()
			wait(0.1)
			TweenService:Create(Layer4,TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(179.361, 187.842, 190.109)}):Play()
			TweenService:Create(Layer4,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0.35),{Transparency = 1}):Play()
			local TweenService = game:GetService("TweenService")
			_allowed = false;
			anim:GetMarkerReachedSignal("OrbFormation"):Connect(function()
				CurrentWingedGiant2 = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer
				u1.ViewportFrame_PlayerInside.ZIndex = 4
				v15.Core.EnergyLoop1.Volume = 0
				v15.Core.EnergyLoop2.Volume = 0
				v15.Core.EnergyLoop3.Volume = 0
				v15.Core.EnergyLoop1:Play()
				v15.Core.EnergyLoop2:Play()
				v15.Core.EnergyLoop3:Play()
				u1.OrbChargeLoop:Play()
				u1.OrbChargeLoop.Volume = 0
				TweenService:Create(v15.FormationParticles.Streaks, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.FormationParticles.Center.CoreCharge, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.FormationParticles.Center.BigDots, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.FormationParticles.Center.Dots, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.FormationParticles.Center.StarDots, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.FormationParticles.Center.Streaks, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TimeScale = 1, Rate = 500 }):Play()
				TweenService:Create(v15.Core.EnergyLoop1, TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Volume = 1.25 }):Play()
				TweenService:Create(v15.Core.EnergyLoop2, TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Volume = 1.25 }):Play()
				TweenService:Create(v15.Core.EnergyLoop3, TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { Volume = 1.25 }):Play()
				TweenService:Create(u1.OrbChargeLoop, TweenInfo.new(6.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Volume = 1, PlaybackSpeed = 1.25 }):Play()
				wait(1)
				crement = true
				local increment = 0.1
				while wait(0.05) do	
					if v15:FindFirstChild("FormationParticles") then
						increment = increment + 6
						v15.FormationParticles.Center.CoreCharge.Size = NumberSequence.new(increment, 0)
					end
				end
			end)
			local Orb1 = game.Workspace:FindFirstChild("Blackhole").Core
			local Orb2 = game.Workspace:FindFirstChild("Blackhole").Fill
			local Orb3 = game.Workspace:FindFirstChild("Blackhole").Model.Outline
			anim:GetMarkerReachedSignal("OrbRise"):Connect(function()
				wait(0.35)
				game.TweenService:Create(Orb1,TweenInfo.new(4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0),{Position = Vector3.new(166.436, 236.377, 307.589)}):Play()
				game.TweenService:Create(Orb2,TweenInfo.new(4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0),{Position = Vector3.new(166.436, 236.377, 307.589)}):Play()
				game.TweenService:Create(Orb3,TweenInfo.new(4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0),{Position = Vector3.new(166.436, 236.377, 307.589)}):Play()
				game.TweenService:Create(v15.FormationParticles,TweenInfo.new(2.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut,0,false,0),{Position = Vector3.new(166.436, 236.380, 307.589)}):Play()
			end)
			anim:GetMarkerReachedSignal("OrbLaunch"):Connect(function()
				local Chargepart2 = u1.OrbLaunchSpeedlines
				if not cameradisconnect then
					local cameraconnection
					cameraconnection = game:GetService("RunService").RenderStepped:Connect(function()
						local camera = game.Workspace.CurrentCamera
						if camera and u1 and u1.ViewportFrame_Player and u1.ViewportFrame_Player.WorldModel and u1.ViewportFrame_Player.WorldModel:FindFirstChild("WingedEndowmentPlayer") then
							local playerModel = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer
							if playerModel:FindFirstChild("HumanoidRootPart") then
								Chargepart2.CFrame = CFrame.new(u3.CFrame.Position, playerModel.HumanoidRootPart.Position)
							else
								cameraconnection:Disconnect()
							end
						else
							cameraconnection:Disconnect()
						end
					end)
					Chargepart2.Parent = game.Workspace
					if cameradisconnect then
						cameraconnection:Disconnect()
					end
				end
				local SkyAmbiance = u1.SkyAmbiance:Clone()
				SkyAmbiance.Parent = game.Workspace
				CurrentWingedGiant2 = nil
				v24:ShakeOnce(4, 10, 0.75, 6);
				TweenService:Create(u1.ScreenGui.Lines1, TweenInfo.new(1.7), {
					ImageTransparency = 0
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines2, TweenInfo.new(1.7), {
					ImageTransparency = 0
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines3, TweenInfo.new(1.7), {
					ImageTransparency = 0.65
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines4, TweenInfo.new(1.7), {
					ImageTransparency = 0.65
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines5, TweenInfo.new(1.7), {
					ImageTransparency = 0
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines6, TweenInfo.new(1.7), {
					ImageTransparency = 0
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines7, TweenInfo.new(1.7), {
					ImageTransparency = 0
				}):Play();
				TweenService:Create(u1.ScreenGui.Vignette, TweenInfo.new(0.5), {
					ImageTransparency = 0.7
				}):Play();
				u1.ScreenGui.Vignette.ImageColor3 = Color3.fromRGB(0, 0, 0)
				TweenService:Create(v15.FormationParticles.Streaks, TweenInfo.new(1, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.FormationParticles.Center.BigDots, TweenInfo.new(1, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.FormationParticles.Center.CoreCharge, TweenInfo.new(0.005, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.FormationParticles.Center.Dots, TweenInfo.new(1, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.FormationParticles.Center.StarDots, TweenInfo.new(1, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.FormationParticles.Center.Streaks, TweenInfo.new(1, Enum.EasingStyle.Linear), {
					Rate = 0
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect1, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect2, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect3, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect4, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect5, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect6, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect7, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect8, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect9, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect10, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect11, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				TweenService:Create(v15.Beams.FlameEffect12, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
					Brightness = 1.57
				}):Play();
				for l44, l45 in pairs(v15.Beams:GetChildren()) do
					if l45:IsA("Beam") then
						l45.Enabled = true
					end;
				end;
				--TweenService:Create(script.OrbChargeLoop, TweenInfo.new(6.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Volume = 0.5, PlaybackSpeed = 1.5 }):Play()

				v15.Core.FlameEffect1_0.BrightFlare.Enabled = true;
				v15.Model.Outline.Flames.Enabled = true;
				v15.Core.FlameEffect1_0.FlameRing.Enabled = true;
				v15.Core.FlameEffect1_0.Flames1.Enabled = true;
				v15.Core.FlameEffect1_0.Flames2.Enabled = true;
				v15.Core.FlameEffect1_0.Flames3.Enabled = true;
				coroutine.wrap(function()
					wait(0.3)
					v15.Core.LaunchSound:Play();
				end)()
				u1.Drop1:Play()
				u1.Drop2:Play()
				crement = false
				--TweenService:Create(v15.FormationParticles, TweenInfo.new(1.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = Vector3.new(42, 0, 101)}):Play()
				TweenService:Create(v15.Fill, TweenInfo.new(1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = Vector3.new(166.436, 6.697, 307.589)}):Play()
				TweenService:Create(v15.Model.Outline, TweenInfo.new(1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = Vector3.new(166.436, 6.697, 307.589)}):Play()
				TweenService:Create(v15.Core, TweenInfo.new(1.75, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = Vector3.new(166.436, 6.697, 307.589)}):Play()
				--TweenService:Create(v15.Core.LaunchSound, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {PlaybackSpeed = 0}):Play()
				TweenService:Create(u1.OrbChargeLoop, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {
					Volume = 0.05
				}):Play();
				TweenService:Create(u1.OrbChargeLoop, TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					PlaybackSpeed = 2
				}):Play();
				u2(v17.EmitPoint.Explosion_Shockwave, 30);
				wait(1.675)
				u1.OrbChargeLoop.PlaybackSpeed = 1
				v15:Remove();
				u1.EnergyLoop:Stop()
				u1.OrbChargeLoop:Stop()
				TweenService:Create(game.Lighting.EndownmentColorCorrection, TweenInfo.new(2), {
					Brightness = 5
				}):Play();
				v23.Intensity = -0.5
				v23.Threshold = 0.1
				v24:ShakeOnce(6, 15, 0.5, 15);
				u1.ExplosionSound:Play()
				u1.ScreenGui.Enabled = true;

				TweenService:Create(u1.ScreenGui.Lines1, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines2, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines3, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines4, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines5, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines6, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Lines7, TweenInfo.new(0.05), {
					ImageTransparency = 1
				}):Play();
				TweenService:Create(game.Lighting.EndownmentColorCorrection, TweenInfo.new(3), {
					Brightness = 0.25
				}):Play();
				v17.Parent = game.Workspace
				Chargepart2:Destroy()
				SkyAmbiance:Destroy()
				coroutine.wrap(function()
					local name = game.Players.LocalPlayer.Name
					if game.Players[name].PlayerGui:FindFirstChild("ConcentrationLines23") then
						local scale1 = game.Players[name].PlayerGui.ConcentrationLines23:GetAttribute("Transparency")
						game.Players.LocalPlayer.PlayerGui.ConcentrationLines23.Enabled = true
						for i = scale1, 1, 0.01 do
							game.Players[name].PlayerGui.ConcentrationLines23:SetAttribute("Transparency", i)
							wait(0.01)
							if i >= 0.99 then
								game.Players[name].PlayerGui.ConcentrationLines23.Enabled = false
								break
							end
						end
					end
				end)()
				local _position = Vector3.new(166.153, 0.583, 307.092);
				v17.Position = Vector3.new(166.436, 6.697, 307.589)
				v17.EmitPoint.Impact_Spark1:Emit(100)
				v17.EmitPoint.Impact_Spark2:Emit(100)
				v17.EmitPoint.Impact_Spark3:Emit(100)
				v17.EmitPoint.Explosion_Glow:Emit(5)
				v17.EmitPoint.Explosion_Rays:Emit(100)
				v17.EmitPoint.Explosion_Ring:Emit(1)
				v17.EmitPoint.Explosion_Flare:Emit(10)
				v17.EmitPoint.Explosion_ThinRays:Emit(250)
				v17.EmitPoint.Explosion_Shockwave:Emit(25)
				local v18 = v17.BillboardGuiAnimation.Frame	
				u1.OrbChargeLoop:Stop()
				v17.ApplauseLoop.Playing = true;
				v17.ChimeLoop.Playing = true;
				v17.CoinsLoop.Playing = true;
				u1.ScreenGui.Vignette.ImageTransparency = 1
				local l__Frame__66 = v17.BillboardGuiAnimation.Frame;
				local user = game.Players.LocalPlayer.DisplayName
				l__Frame__66.TopText.Visible = true;
				l__Frame__66.BottomText.Visible = true;
				l__Frame__66.TopText.Text = string.upper(script:GetAttribute("Donator")) .. " DONATED";
				l__Frame__66.MiddleText.Text = tostring(script:GetAttribute("Amount")):reverse():gsub("%d%d%d", "%0,"):reverse():gsub("^,", "")
				l__Frame__66.BottomText.Text = "TO " .. string.upper(script:GetAttribute("Raiser"));
				l__Frame__66.RobuxLogo.Size = UDim2.fromScale(0, 0);
				l__Frame__66.RobuxLogo.Rotation = -180;
				l__Frame__66.Star.Size = UDim2.fromScale(0, 0);
				l__Frame__66.BottomText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.BottomText.Position = UDim2.fromScale(0.5, 0.5);
				l__Frame__66.MiddleText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.TopText.Position = UDim2.fromScale(0.5, 0.5);
				l__Frame__66.TopText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.Parent.Enabled = true;
				TweenService:Create(v17, TweenInfo.new(20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Position = SpawnPosition + Vector3.new(0, 400, 0)
				}):Play();
				TweenService:Create(l__Frame__66.RobuxLogo, TweenInfo.new(10, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Size = UDim2.fromScale(1, 1)
				}):Play();
				TweenService:Create(l__Frame__66.RobuxLogo, TweenInfo.new(15, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Rotation = 0
				}):Play();
				TweenService:Create(l__Frame__66.Star, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Size = UDim2.fromScale(1.5, 1.5)
				}):Play();
				TweenService:Create(l__Frame__66.Star, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Rotation = 360
				}):Play();
				TweenService:Create(l__Frame__66.BottomText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.6), {
					Size = UDim2.fromScale(1.5, 0.1), 
					Position = UDim2.fromScale(0.5, 0.59)
				}):Play();
				TweenService:Create(l__Frame__66.MiddleText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.4), {
					Size = UDim2.fromScale(1, 1)
				}):Play();
				TweenService:Create(l__Frame__66.TopText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.2), {
					Size = UDim2.fromScale(1.5, 0.1), 
					Position = UDim2.fromScale(0.5, 0.41)
				}):Play();
				TweenService:Create(l__Frame__66.Star, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 5), {
					ImageTransparency = 1, 
					ImageColor3 = Color3.fromRGB(220, 170, 255)
				}):Play();
				v17.EmitPoint.Sparks.Enabled = true;
				v17.EmitPoint.SparkleExplosion.Enabled = true;
				TweenService:Create(v17.EmitPoint.Sparks, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
					Rate = 0
				}):Play();
				TweenService:Create(v17.EmitPoint.SparkleExplosion, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
					Rate = 0
				}):Play();
				TweenService:Create(v17.ChimeLoop, TweenInfo.new(55, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0, 
					PlaybackSpeed = 0.75
				}):Play();
				TweenService:Create(v17.ApplauseLoop, TweenInfo.new(60, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0
				}):Play();
				TweenService:Create(v17.CoinsLoop, TweenInfo.new(50, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0, 
					PlaybackSpeed = 1
				}):Play();
				wait(5)
				HandParticlesOut = nil
				wait(25);
				TweenService:Create(l__Frame__66.UIScale, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Scale = 0
				}):Play();
				TweenService:Create(v17, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Size = Vector3.new(0.001, 0.001, 0.001)
				}):Play();
				wait(24);
				v17:Remove();
				wait(30)
				for v44, v45 in pairs(v16:GetChildren()) do
					if v45:IsA("ParticleEmitter") then
						TweenService:Create(v45, TweenInfo.new(60, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
							Rate = 0
						}):Play();
					end;
				end;
				wait(60)
				v18:Remove()
				--script:Remove()
				v16:Remove()
			end)
			anim:GetMarkerReachedSignal("DisappearStart"):Connect(function()
				HandVFX = false
				u1.PlayerStartVanishing:Play()
				game.Workspace.Dis1.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.Dis1.Position
				game.Workspace.Dis2.Position = u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer.Dis2.Position
				game.TweenService:Create(u1, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
					Brightness = 4
				}):Play()
				u1.BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
				game.TweenService:Create(u1.BackgroundOverlay,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{BackgroundColor3 = Color3.fromRGB(255, 85, 255)}):Play()
			end)
			anim:GetMarkerReachedSignal("Disappear"):Connect(function()
				--TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1 , Enum.EasingStyle.Quad), {Density = 0.3}):Play();
				u1.Ambiance:Stop()
				u1.BackgroundOverlay.Visible = false
				game.TweenService:Create(u1, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
					Brightness = 1
				}):Play()
				v22.Enabled = false
				--local e = u1.SkyRain:Clone()
				--local r = u1.SkyGround:Clone()
				--e.Parent = game.Workspace
				--r.Parent = game.Workspace
				--[[for i,v in ipairs(e:GetChildren()) do
					if v:IsA("ParticleEmitter") then
						game.TweenService:Create(v,TweenInfo.new(30,Enum.EasingStyle.Linear),{Rate = 30}):Play()
					end
				end
				for i,v in ipairs(r:GetChildren()) do
					if v:IsA("ParticleEmitter") then
						game.TweenService:Create(v,TweenInfo.new(30,Enum.EasingStyle.Linear),{Rate = 30}):Play()
					end
				end]]
				local skyWorldModel = u1.ViewportFrame_Background.WorldModel

				for _, child in ipairs(skyWorldModel:GetChildren()) do
					child:Destroy()
				end

				u1.PlayerVanish1:Play()
				u1.PlayerVanish2:Play()
				u1.PlayerVanish3:Play()
				for i = 1, 14 do
					local pos1 = game.Workspace.Dis1.Position
					local pos2 = game.Workspace.Dis2.Position
					local randomPosition = Vector3.new(
						math.random(math.min(pos1.X, pos2.X), math.max(pos1.X, pos2.X)),
						math.random(math.min(pos1.Y, pos2.Y), math.max(pos1.Y, pos2.Y)),
						math.random(math.min(pos1.Z, pos2.Z), math.max(pos1.Z, pos2.Z))
					)
					local disappear = u1.Disappear:Clone()
					disappear.Position = randomPosition
					disappear.Parent = u1.ViewportFrame_Player
					disappear.Size = Vector3.new(math.random(10,75),math.random(85,200),Vector3.new(10,65))
					game.TweenService:Create(disappear,TweenInfo.new(math.random(5,7),Enum.EasingStyle.Linear),{Size = Vector3.new(0,disappear.Size.Y,0)}):Play()
				end
				for i = 1, 6 do
					local pos1 = game.Workspace.Dis1.Position
					local pos2 = game.Workspace.Dis2.Position
					local randomPosition = Vector3.new(
						math.random(math.min(pos1.X, pos2.X), math.max(pos1.X, pos2.X)),
						math.random(math.min(pos1.Y, pos2.Y), math.max(pos1.Y, pos2.Y)),
						math.random(math.min(pos1.Z, pos2.Z), math.max(pos1.Z, pos2.Z))
					)
					local disappearpurple = u1.Disappear:Clone()
					disappearpurple.Color = Color3.fromRGB(89, 0, 198)
					disappearpurple.Position = randomPosition
					disappearpurple.Parent = u1.ViewportFrame_Player
					disappearpurple.Size = Vector3.new(math.random(10,75),math.random(85,200), math.random(10,65))
					game.TweenService:Create(disappearpurple,TweenInfo.new(math.random(5,7),Enum.EasingStyle.Linear),{Size = Vector3.new(0,disappearpurple.Size.Y,0)}):Play()
				end
				u1.ViewportFrame_Player.WorldModel.WingedEndowmentPlayer:Remove()
				--local _time = tostring(game.Players.LocalPlayer.PlayerGui.ScreenGui.Settings.Frame.TimeSetting.SliderFrame.TextBox.Text);
				game.TweenService:Create(game.Lighting,TweenInfo.new(10),{ClockTime = 11.8}):Play()
				game.TweenService:Create(game.Lighting,TweenInfo.new(10),{Brightness = 0}):Play()
				u1.Brightness = 1
				local flashframe = Instance.new("Frame", u1.ScreenGui)
				flashframe.AnchorPoint = Vector2.new(0.5,0.5)
				flashframe.Size = UDim2.fromScale(1,1.5)
				flashframe.Position = UDim2.fromScale(0.5,0.5)
				flashframe.BackgroundTransparency = 0
				flashframe.BackgroundColor3 = Color3.fromRGB(255,255,255)
				game.Lighting.FogColor = Color3.fromRGB(255, 147, 244)
				u1.ScreenGui.Blocks.Enabled = false
				u1.ScreenGui.v29.Enabled = false
				u1.ScreenGui.v30.Enabled = false
				u1.ScreenGui.Vignette.ImageTransparency = 0
				u1.ScreenGui.Vignette.ImageColor3 = Color3.new(1, 1, 1)
				wait(1)

				TweenService:Create(flashframe, TweenInfo.new(5, Enum.EasingStyle.Linear), {
					BackgroundTransparency = 1
				}):Play();
				TweenService:Create(u1.ScreenGui.Vignette, TweenInfo.new(5, Enum.EasingStyle.Linear), {
					ImageTransparency = 1
				}):Play();
				game:GetService("Lighting"):WaitForChild("EndownmentBloom").Enabled = false
				TweenService:Create(game.Lighting, TweenInfo.new(0),{Brightness = 2.66}):Play()
				wait(20)
				u1.Ambiance:Stop()
				flashframe:Remove()
				_speedlines:Destroy();
				_speedlines2:Destroy()
				_dis2:Destroy()
				_dis1:Destroy()
				_lines1:Destroy();
				_lines2:Destroy();
				_lines3:Destroy();
				v22:Destroy()
				v23:Destroy()
				task.wait(50)
				u1:Destroy()
				wait(5)
				script:Destroy()
			end)
		end)
	end)
	if not _succed then
		warn(_err)
	end
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.Settings.Frame.GlobalEffectsSetting:GetAttribute("Value") == true then
	task.defer(function()
		script.Parent = nil;
	end)
	game.ReplicatedStorage.EepDoop:Fire(function()
		_start()
		script:Destroy()
	end)
else
	wait(0.25)
	script:Destroy()
end