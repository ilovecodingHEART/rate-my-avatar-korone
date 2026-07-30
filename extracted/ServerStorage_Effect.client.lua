local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = {
	CenterOfEvent = Vector3.new(166.153, 0.583, 307.092)
};
local v2 = false;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local function _(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: Tween_1 ]]
	-- upvalues: l_TweenService_0 (copy)
	local v10 = l_TweenService_0:Create(v7, v8, v9);
	v10:Play();
	v10:Destroy();
end;
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
local _ = os.clock();
local v13 = require(script.HKGFKFKGKSFKDS);
local v14 = require(script.SADOGISEIFSIFSA);
local v15 = {
	[1] = "rbxassetid://1079408535", 
	[2] = "rbxassetid://4961088919", 
	[3] = "rbxassetid://6993372814", 
	[4] = "rbxassetid://8068501155", 
	[5] = "rbxassetid://6994934244", 
	[6] = "rbxassetid://8845650656", 
	[7] = "rbxassetid://4961025694", 
	[8] = "rbxassetid://8028042834", 
	[9] = "rbxassetid://6458307118"
};
local function v8(donatoruser, raiseruser, robux)
	local l_MeshParts_0 = script.Assets.MeshParts;
	local l_Sounds_0 = script.Sounds;
	l_Sounds_0.Parent = workspace;
	l_Sounds_0.Name = "EffectSounds";
	local l_Part_0 = Instance.new("Part");
	l_Part_0.Name = "LightningSoundPoint";
	l_Part_0.Anchored = true;
	l_Part_0.CanCollide = false;
	l_Part_0.Transparency = 1;
	l_Part_0.CanQuery = false;
	l_Part_0.Size = Vector3.new(0, 0, 0, 0);
	l_Part_0.CanTouch = false;
	local l_Sound_0 = Instance.new("Sound");
	l_Sound_0.Name = "LightningSound";
	l_Sound_0.RollOffMode = Enum.RollOffMode.Inverse;
	l_Sound_0.RollOffMinDistance = 100;
	l_Sound_0.RollOffMaxDistance = 100000;
	l_Sound_0.Volume = 0.5;
	l_Sound_0.SoundId = "rbxassetid://821439273";
	l_Sound_0.Parent = l_Part_0;
	local l_Part_1 = Instance.new("Part");
	l_Part_1.Name = "Fireball";
	l_Part_1.Anchored = true;
	l_Part_1.BottomSurface = Enum.SurfaceType.Smooth;
	l_Part_1.CanCollide = false;
	l_Part_1.TopSurface = Enum.SurfaceType.Smooth;
	l_Part_1.Color = Color3.fromRGB(255, 55, 1);
	l_Part_1.Material = Enum.Material.Neon;
	l_Part_1.Size = Vector3.new(3, 3, 3, 0);
	l_Part_1.CastShadow = false;
	l_Part_1.Shape = Enum.PartType.Ball;
	local l_Attachment_0 = Instance.new("Attachment");
	l_Attachment_0.Name = "Center";
	l_Attachment_0.Parent = l_Part_1;
	local l_Attachment_1 = Instance.new("Attachment");
	l_Attachment_1.Name = "Trail0";
	l_Attachment_1.Position = Vector3.new(0, 1.5, 0, 0);
	l_Attachment_1.Parent = l_Part_1;
	local l_Attachment_2 = Instance.new("Attachment");
	l_Attachment_2.Name = "Trail1";
	l_Attachment_2.Position = Vector3.new(0, -1.5, 0, 0);
	l_Attachment_2.Parent = l_Part_1;
	local l_PointLight_0 = Instance.new("PointLight");
	l_PointLight_0.Name = "Glow";
	l_PointLight_0.Shadows = true;
	l_PointLight_0.Color = Color3.fromRGB(255, 74, 14);
	l_PointLight_0.Brightness = 2.5;
	l_PointLight_0.Range = 10;
	l_PointLight_0.Parent = l_Attachment_0;
	local l_Sound_1 = Instance.new("Sound");
	l_Sound_1.Name = "AmbientLoop";
	l_Sound_1.RollOffMaxDistance = 1000;
	l_Sound_1.Volume = 0.25;
	l_Sound_1.Looped = true;
	l_Sound_1.MaxDistance = 1000;
	l_Sound_1.SoundId = "http://www.roblox.com/asset/?id=31760113";
	l_Sound_1.Parent = l_Part_1;
	local l_Sound_2 = Instance.new("Sound");
	l_Sound_2.Name = "Summon";
	l_Sound_2.Volume = 1;
	l_Sound_2.SoundId = "http://www.roblox.com/asset/?id=83674171";
	l_Sound_2.Parent = l_Part_1;
	local l_Sound_3 = Instance.new("Sound");
	l_Sound_3.Name = "Woosh";
	l_Sound_3.Volume = 1;
	l_Sound_3.SoundId = "http://www.roblox.com/asset/?id=128912290";
	l_Sound_3.Parent = l_Part_1;
	script.Assets.Particles.Fireball.Burst:Clone().Parent = l_Part_1;
	script.Assets.Particles.Fireball.Fire:Clone().Parent = l_Part_1;
	script.Assets.Particles.Fireball.Flare:Clone().Parent = l_Attachment_0;
	script.Assets.Particles.Fireball.Sparks:Clone().Parent = l_Attachment_0;
	local v28 = script.Assets.Trails.Fireball.MainTrail:Clone();
	v28.Parent = l_Part_1;
	v28.Attachment0 = l_Attachment_1;
	v28.Attachment1 = l_Attachment_2;
	local v29 = script.Assets.Trails.Fireball.MainTrail:Clone();
	v29.Parent = l_Part_1;
	v29.Attachment0 = l_Attachment_1;
	v29.Attachment1 = l_Attachment_2;
	local v30 = script.Assets.Trails.Fireball.LongTrail:Clone();
	v30.Parent = l_Part_1;
	v30.Attachment0 = l_Attachment_1;
	v30.Attachment1 = l_Attachment_2;
	local l_Part_2 = Instance.new("Part");
	l_Part_2.Name = "Rift";
	l_Part_2.Anchored = true;
	l_Part_2.BottomSurface = Enum.SurfaceType.Smooth;
	l_Part_2.CanCollide = false;
	l_Part_2.Transparency = 1;
	l_Part_2.TopSurface = Enum.SurfaceType.Smooth;
	l_Part_2.CanQuery = false;
	l_Part_2.Size = Vector3.new(1, 1, 1, 0);
	l_Part_2.CanTouch = false;
	l_Part_2.Material = Enum.Material.Neon;
	l_Part_2.Color = Color3.new(0, 0, 0);
	local l_SpecialMesh_0 = Instance.new("SpecialMesh");
	l_SpecialMesh_0.Name = "SphereMesh";
	l_SpecialMesh_0.Parent = l_Part_2;
	l_SpecialMesh_0.MeshType = Enum.MeshType.Sphere;
	l_SpecialMesh_0.Offset = Vector3.new(0, 3, 0, 0);
	local l_Attachment_3 = Instance.new("Attachment");
	l_Attachment_3.Name = "VortexAtt";
	l_Attachment_3.Parent = l_Part_2;
	local l_Attachment_4 = Instance.new("Attachment");
	l_Attachment_4.Name = "FormationAtt";
	l_Attachment_4.Parent = l_Part_2;
	script.Assets.Particles.Rift.Formation_Field:Clone().Parent = l_Attachment_4;
	script.Assets.Particles.Rift.Formation_Glow:Clone().Parent = l_Attachment_4;
	script.Assets.Particles.Rift.Hole:Clone().Parent = l_Attachment_3;
	script.Assets.Particles.Rift.Lines:Clone().Parent = l_Attachment_3;
	script.Assets.Particles.Rift.Vortex:Clone().Parent = l_Attachment_3;
	local l_Sound_4 = Instance.new("Sound");
	l_Sound_4.Name = "PortalAmbience";
	l_Sound_4.EmitterSize = 1000;
	l_Sound_4.RollOffMaxDistance = 100000;
	l_Sound_4.Volume = 1;
	l_Sound_4.Looped = true;
	l_Sound_4.MinDistance = 1000;
	l_Sound_4.MaxDistance = 100000;
	l_Sound_4.SoundId = "rbxassetid://6666407865";
	l_Sound_4.RollOffMinDistance = 1000;
	l_Sound_4.Parent = l_Part_2;
	local l_Part_3 = Instance.new("Part");
	l_Part_3.Name = "LeavesEmitter";
	l_Part_3.Anchored = true;
	l_Part_3.BottomSurface = Enum.SurfaceType.Smooth;
	l_Part_3.CanCollide = false;
	l_Part_3.Transparency = 1;
	l_Part_3.TopSurface = Enum.SurfaceType.Smooth;
	l_Part_3.CanQuery = false;
	l_Part_3.Color = Color3.fromRGB(147, 26, 17);
	l_Part_3.Size = Vector3.new(350, 0.001, 350);
	l_Part_3.CanTouch = false;
	script.Assets.Particles.Leaves.Leaves1:Clone().Parent = l_Part_3;
	script.Assets.Particles.Leaves.Leaves2:Clone().Parent = l_Part_3;
	local l_Sound_5 = Instance.new("Sound");
	l_Sound_5.Name = "LeavesRustle";
	l_Sound_5.EmitterSize = 100;
	l_Sound_5.RollOffMaxDistance = 100000;
	l_Sound_5.Volume = 0;
	l_Sound_5.PlaybackSpeed = 0.5;
	l_Sound_5.Looped = true;
	l_Sound_5.MinDistance = 100;
	l_Sound_5.MaxDistance = 100000;
	l_Sound_5.SoundId = "rbxassetid://9116258071";
	l_Sound_5.RollOffMinDistance = 100;
	local l_DistortionSoundEffect_0 = Instance.new("DistortionSoundEffect");
	l_DistortionSoundEffect_0.Level = 0.5;
	l_DistortionSoundEffect_0.Parent = l_Sound_5;
	l_Sound_5.Parent = l_Part_3;
	local function v44(v39, v40) --[[ Line: 173 ]] --[[ Name: RescaleParticle_1 ]]
		v39.Speed = NumberRange.new(v39.Speed.Min * v40, v39.Speed.Max * v40);
		v39.Acceleration = v39.Acceleration * v40;
		local l_Keypoints_0 = v39.Size.Keypoints;
		local v42 = {};
		for v43 = 1, #l_Keypoints_0 do
			table.insert(v42, NumberSequenceKeypoint.new(l_Keypoints_0[v43].Time, l_Keypoints_0[v43].Value * v40, l_Keypoints_0[v43].Envelope * v40));
		end;
		v39.Size = NumberSequence.new(v42);
	end;
	local l_TweenService_1 = game:GetService("TweenService");
	local l_SoundService_0 = game:GetService("SoundService");
	local v47 = 0;
	local v48 = {};
	pcall(function() --[[ Line: 189 ]]
		-- upvalues: v2 (ref), l_TweenService_1 (copy), l_SoundService_0 (copy), l_LocalPlayer_0 (copy), v14 (copy), l_Part_1 (copy), v48 (copy), v1 (copy), l_TweenService_0 (copy), l_Part_2 (copy), l_RunService_0 (copy), v47 (ref), l_Sounds_0 (copy), v44 (copy), l_Part_3 (copy), l_MeshParts_0 (copy), l_Debris_0 (copy), l_Part_0 (copy), v15 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
		if v2 == true then
			print('gg')
			return;
		else
			print('started')
        --[[l_TweenService_1:Create(l_SoundService_0.Music.DaytimeTrack, TweenInfo.new(10), {
            Volume = 0
        }):Play();]]
			v2 = true;
			local v49 = nil;
			local v50 = nil;
			local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
			l_ColorCorrectionEffect_0.Name = "HalloweenLiveEvent_ColorCorrection";
			l_ColorCorrectionEffect_0.Parent = game.Lighting;
			local v52 = script.Assets.ScreenGuis.ScreenOverlays:Clone();
			v52.Parent = l_LocalPlayer_0.PlayerGui;
			local l_Folder_0 = Instance.new("Folder");
			l_Folder_0.Name = "ValuesFolder";
			l_Folder_0.Parent = script;
			local l_NumberValue_0 = Instance.new("NumberValue");
			l_NumberValue_0.Name = "RS_FireballsHeight";
			l_NumberValue_0.Parent = l_Folder_0;
			local l_NumberValue_1 = Instance.new("NumberValue");
			l_NumberValue_1.Name = "RS_FireballsRadius";
			l_NumberValue_1.Parent = l_Folder_0;
			local l_NumberValue_2 = Instance.new("NumberValue");
			l_NumberValue_2.Name = "RS_FireballsAngularVelocity";
			l_NumberValue_2.Parent = l_Folder_0;
			local l_NumberValue_3 = Instance.new("NumberValue");
			l_NumberValue_3.Name = "RS_LeavesAngularVelocity";
			l_NumberValue_3.Parent = l_Folder_0;
			local l_NumberValue_4 = Instance.new("NumberValue");
			l_NumberValue_4.Name = "RS_VortexSize";
			l_NumberValue_4.Parent = l_Folder_0;
			local l_NumberValue_5 = Instance.new("NumberValue");
			l_NumberValue_5.Name = "RS_ShockwaveRate";
			l_NumberValue_5.Parent = l_Folder_0;
			local l_NumberValue_6 = Instance.new("NumberValue");
			l_NumberValue_6.Name = "RS_ShockwaveTransparency0";
			l_NumberValue_6.Parent = l_Folder_0;
			local l_NumberValue_7 = Instance.new("NumberValue");
			l_NumberValue_7.Name = "RS_ShockwaveTransparency1";
			l_NumberValue_7.Parent = l_Folder_0;
			local v63 = v14.new(Enum.RenderPriority.Camera.Value, function(v62) --[[ Line: 232 ]]
				workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * v62;
			end);
			v63:Start();
			for v64 = 0, 20 do
				local v65 = l_Part_1:Clone();
				v65:SetAttribute("Index", v64);
				table.insert(v48, v65);
				v65.Size = Vector3.new(0, 0, 0, 0);
				v65.Center.Glow.Brightness = 0;
				v65.Fire.Enabled = true;
				v65.Position = CFrame.new(v1.CenterOfEvent):ToWorldSpace(CFrame.Angles(0, math.rad(v64 / 21 * 360), 0)).LookVector * 58 + v1.CenterOfEvent + Vector3.new(0, 5, 0, 0);
				v65.Parent = workspace;
				v65.Burst:Emit(25);
				v65.Summon:Play();
				v65.AmbientLoop.TimePosition = math.random(0, l_Part_1.AmbientLoop.TimeLength * 1000) / 1000;
				v65.AmbientLoop.PlaybackSpeed = math.random(900, 1100) / 1000;
				v65.AmbientLoop.Playing = true;
				l_TweenService_0:Create(v65, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
					Size = Vector3.new(3, 3, 3, 0)
				}):Play();
				l_TweenService_0:Create(v65.Center.Glow, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
					Brightness = 2.5
				}):Play();
				task.wait(0.8);
			end;
			task.wait(1);
			for _, v67 in pairs(v48) do
				local l_Beam_0 = Instance.new("Beam");
				l_Beam_0.FaceCamera = true;
				l_Beam_0.Brightness = 5;
				l_Beam_0.LightInfluence = 0;
				l_Beam_0.Width0 = 0;
				l_Beam_0.Width1 = 0;
				l_Beam_0.Transparency = NumberSequence.new(0);
				l_Beam_0.Color = ColorSequence.new(Color3.fromRGB(255, 55, 1));
				l_Beam_0.Parent = v67;
				l_Beam_0.Attachment0 = v67.Center;
				v67.Center.Flare.Rate = 0;
				v67.Center.Flare.Enabled = true;
				if v48[v67:GetAttribute("Index")] == nil then
					l_Beam_0.Attachment1 = v48[#v48].Center;
				else
					l_Beam_0.Attachment1 = v48[v67:GetAttribute("Index")].Center;
				end;
				local v69 = TweenInfo.new(math.random(5000, 7500) / 1000, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, math.random(0, 2500) / 1000);
				l_TweenService_0:Create(v67, v69, {
					Position = CFrame.new(v1.CenterOfEvent):ToWorldSpace(CFrame.Angles(0, math.rad(v67:GetAttribute("Index") / 11 * 360), 0)).LookVector * 5 + v1.CenterOfEvent + Vector3.new(0, 200, 0, 0)
				}):Play();
				l_TweenService_0:Create(l_Beam_0, v69, {
					Width0 = 2, 
					Width1 = 2
				}):Play();
				l_TweenService_0:Create(v67.Center.Flare, v69, {
					Rate = 25
				}):Play();
				l_TweenService_0:Create(v67.Fire, v69, {
					Rate = 25
				}):Play();
				v67.Woosh.PlaybackSpeed = math.random(650, 800) / 1000;
				v67.Woosh:Play();
			end;
			spawn(function()
				wait(5)
				l_Sounds_0.Song.Volume = 0;
				l_Sounds_0.Song.Playing = true;
				l_TweenService_0:Create(l_Sounds_0.Song, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Volume = 0.75
				}):Play();
			end);
			task.wait(10.5);
			l_NumberValue_0.Value = 200;
			local v70 = {};
			local v71 = l_Part_2:Clone();
			v71.Position = v1.CenterOfEvent + Vector3.new(0, 200, 0, 0);
			v71.Parent = workspace;
			local function v78(v72) --[[ Line: 310 ]] --[[ Name: RescaleVortex_1 ]]
				-- upvalues: v70 (copy)
				for _, v74 in pairs(v70) do
					v74.Speed = NumberRange.new(v74.Speed.Min * v72, v74.Speed.Max * v72);
					v74.Acceleration = v74.Acceleration * v72;
					local l_SizeSequence_0 = v74.SizeSequence;
					local v76 = {};
					for v77 = 1, #l_SizeSequence_0 do
						table.insert(v76, NumberSequenceKeypoint.new(l_SizeSequence_0[v77].Time, l_SizeSequence_0[v77].Value * v72, l_SizeSequence_0[v77].Envelope * v72));
					end;
					v74.Instance.Size = NumberSequence.new(v76);
				end;
			end;
			v49 = l_RunService_0.Heartbeat:Connect(function(v79) --[[ Line: 322 ]]
				-- upvalues: v47 (ref), l_NumberValue_2 (copy), v48 (ref), v1 (ref), l_NumberValue_1 (copy), l_NumberValue_0 (copy)
				v47 = v47 + l_NumberValue_2.Value * v79;
				for _, v81 in pairs(v48) do
					v81.Position = CFrame.new(v1.CenterOfEvent):ToWorldSpace(CFrame.Angles(0, math.rad(v81:GetAttribute("Index") / 20 * 360), 0)):ToWorldSpace(CFrame.Angles(0, math.rad(v47), 0)).LookVector * l_NumberValue_1.Value + v1.CenterOfEvent + Vector3.new(0, l_NumberValue_0.Value, 0);
				end;
			end);
			for _, v83 in pairs(v71.VortexAtt:GetDescendants()) do
				if v83:IsA("ParticleEmitter") then
					table.insert(v70, {
						Instance = v83, 
						Speed = v83.Speed, 
						Acceleration = v83.Acceleration, 
						SizeSequence = v83.Size.Keypoints
					});
				end;
			end;
			v78(0);
			l_NumberValue_4.Changed:Connect(v78);
			l_Sounds_0.RiftFormation.Volume = 0;
			l_Sounds_0.RiftFormation.Playing = true;
			l_TweenService_0:Create(l_Sounds_0.RiftFormation, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 1
			}):Play();
			l_Sounds_0.RiftFormation2.Volume = 0;
			l_Sounds_0.RiftFormation2.Playing = true;
			local l_Quint_0 = Enum.EasingStyle.Quint;
			l_TweenService_0:Create(l_Sounds_0.RiftFormation2, TweenInfo.new(3, l_Quint_0, Enum.EasingDirection.In, 0, false, 3), {
				Volume = 1.25
			}):Play();
			local l_InOut_0 = Enum.EasingDirection.InOut;
			l_TweenService_0:Create(l_NumberValue_2, TweenInfo.new(4, Enum.EasingStyle.Sine, l_InOut_0, 0, false, 0), {
				Value = 75
			}):Play();
			local l_Sine_0 = Enum.EasingStyle.Sine;
			l_NumberValue_1.Value = 5;
			l_TweenService_0:Create(l_NumberValue_1, TweenInfo.new(4, l_Sine_0, Enum.EasingDirection.InOut, 0, false, 0), {
				Value = 25
			}):Play();
			for _, v88 in pairs(v48) do
				l_TweenService_0:Create(v88.Fire, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {
					Rate = 10
				}):Play();
			end;
			for _, v90 in pairs(v71.FormationAtt:GetChildren()) do
				v44(v90, 1.5);
				v90.Enabled = true;
			end;
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 5), {
				Brightness = 0.25, 
				Contrast = 0, 
				Saturation = 0, 
				TintColor = Color3.fromRGB(255, 197, 130)
			}):Play();
			task.wait(6);
			v63:ShakeOnce(0.3, 3.5, 0.05, 1);
			v63:StartShake(0.1, 3.5, 3);
			l_ColorCorrectionEffect_0.Brightness = 0.5;
			l_ColorCorrectionEffect_0.TintColor = Color3.fromRGB(255, 255, 255);
			l_Sounds_0.RiftFormation:Stop();
			l_Sounds_0.RiftFormation2:Stop();
			l_Sounds_0.Darkness:Play();
			l_Sounds_0.HeavyWindLoop.Playing = true;
			l_Sounds_0.HeavyWindLoop.Volume = 0;
			l_TweenService_0:Create(l_Sounds_0.HeavyWindLoop, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0.5
			}):Play();
			local v91 = l_Part_3:Clone();
			v91.Position = v1.CenterOfEvent;
			v91.Parent = workspace;
			l_NumberValue_3.Value = 0;
			v50 = l_RunService_0.Heartbeat:Connect(function(v92) --[[ Line: 400 ]]
				-- upvalues: v91 (copy), l_NumberValue_3 (copy)
				v91.Orientation = v91.Orientation + Vector3.new(0, l_NumberValue_3.Value * v92, 0);
				for _, v94 in pairs(v91:GetChildren()) do
					if v94:IsA("ParticleEmitter") then
						v94.Speed = NumberRange.new(0, 0.5 * l_NumberValue_3.Value);
					end;
				end;
			end);
			spawn(function()
				l_Sounds_0['Full Force'].Playing = true;
				l_TweenService_0:Create(l_Sounds_0['Full Force'], TweenInfo.new(15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
					Volume = 0.5
				}):Play();
			end)
			l_TweenService_0:Create(l_NumberValue_3, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 75
			}):Play();
			v91.LeavesRustle.Playing = true;
			local v95 = 6;
			local v96 = {
				PlaybackSpeed = 1, 
				Volume = 1
			};
			l_TweenService_0:Create(v91.LeavesRustle, TweenInfo.new(v95, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), v96):Play();
			for _, v98 in pairs(v91:GetChildren()) do
				if v98:IsA("ParticleEmitter") then
					v98.Enabled = true;
					l_TweenService_0:Create(v98, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
						Rate = 10
					}):Play();
				end;
			end;
			local v99 = true;
			l_NumberValue_5.Value = 1;
			l_NumberValue_6.Value = 0.9;
			l_NumberValue_7.Value = 1;
			spawn(function() --[[ Line: 437 ]]
				-- upvalues: l_NumberValue_5 (copy), l_MeshParts_0 (ref), l_Debris_0 (ref), v1 (ref), v71 (copy), l_TweenService_0 (ref), l_NumberValue_6 (copy), l_NumberValue_7 (copy), v99 (ref)
				repeat
					task.wait(l_NumberValue_5.Value);
					local v100 = math.random(300, 500) / 1000;
					local v101 = l_MeshParts_0.Spiral:Clone();
					l_Debris_0:AddItem(v101, v100);
					v101.Position = v1.CenterOfEvent:Lerp(v1.CenterOfEvent + Vector3.new(0, 200, 0, 0), 0.5);
					v101.Orientation = Vector3.new(0, math.random(-180000, 180000) / 1000, 180);
					local v102 = math.random(v71.SphereMesh.Scale.X * 2, v71.SphereMesh.Scale.X * 3);
					v101.Size = Vector3.new(v102 + 225, 200, v102 + 225);
					v101.Transparency = 1;
					v101.Parent = workspace;
					l_TweenService_0:Create(v101, TweenInfo.new(v100 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0), {
						Transparency = math.random(l_NumberValue_6.Value * 1000, l_NumberValue_7.Value * 1000) / 1000
					}):Play();
					local l_Sine_1 = Enum.EasingStyle.Sine;
					l_TweenService_0:Create(v101, TweenInfo.new(v100, l_Sine_1, Enum.EasingDirection.InOut, 0, true, 0), {
						Orientation = Vector3.new(v101.Orientation.X, v101.Orientation.Y + math.random(90000, 120000) / 1000, v101.Orientation.Z), 
						Size = Vector3.new(v101.Size.X * 1.25, v101.Size.Y, v101.Size.Z * 1.25)
					}):Play();
				until v99 == false;
			end);
			spawn(function() --[[ Line: 463 ]]
				-- upvalues: l_NumberValue_5 (copy), l_MeshParts_0 (ref), l_Debris_0 (ref), v1 (ref), v71 (copy), l_TweenService_0 (ref), v99 (ref)
				repeat
					task.wait(l_NumberValue_5.Value * 0.75);
					local v104 = math.random(300, 450) / 1000;
					local v105 = l_MeshParts_0.Vortex:Clone();
					l_Debris_0:AddItem(v105, v104);
					v105.Position = v1.CenterOfEvent + Vector3.new(0, 200, 0, 0);
					v105.Orientation = Vector3.new(0, math.random(-180000, 180000) / 1000, 0);
					local v106 = math.random(v71.SphereMesh.Scale.X * 2, v71.SphereMesh.Scale.X * 3);
					v105.Size = Vector3.new(v106+ 225, 0, v106+ 225);
					v105.Transparency = 1;
					v105.Parent = workspace;
					l_TweenService_0:Create(v105, TweenInfo.new(v104 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0), {
						Transparency = math.random(0, 250) / 1000
					}):Play();
					local l_Sine_2 = Enum.EasingStyle.Sine;
					l_TweenService_0:Create(v105, TweenInfo.new(v104, l_Sine_2, Enum.EasingDirection.InOut, 0, true, 0), {
						Orientation = Vector3.new(v105.Orientation.X, v105.Orientation.Y + math.random(90000, 120000) / 1000, v105.Orientation.Z), 
						Size = Vector3.new(v105.Size.X * 0.5, v105.Size.Y, v105.Size.Z * 0.5)
					}):Play();
				until v99 == false;
			end);
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1), {
				Brightness = 0.1, 
				Contrast = 0.1, 
				Saturation = 0.1, 
				TintColor = Color3.fromRGB(255, 152, 78)
			}):Play();
			for _, v109 in pairs(v48) do
				local l_LongTrail_0 = v109.LongTrail;
				l_LongTrail_0.Lifetime = l_LongTrail_0.Lifetime * 2;
				v109.Center.Sparks.Enabled = true;
				v109.Fire.Enabled = false;
				v109.AmbientLoop:Stop();
			end;
			for _, v112 in pairs(v71.FormationAtt:GetChildren()) do
				v112.Enabled = false;
			end;
			for _, v114 in pairs(v71.VortexAtt:GetChildren()) do
				v114.Enabled = true;
			end;
			v71.Transparency = 0;
			v71.SphereMesh.Scale = Vector3.new(1, 0.10000000149011612, 1, 0);
			local _ = TweenInfo.new;
			l_TweenService_0:Create(l_NumberValue_2, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 300
			}):Play();
			local l_Quad_0 = Enum.EasingStyle.Quad;
			l_TweenService_0:Create(l_NumberValue_1, TweenInfo.new(6, l_Quad_0, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 250
			}):Play();
			l_TweenService_0:Create(l_NumberValue_4, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 25
			}):Play();
			l_TweenService_0:Create(v71.SphereMesh, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Scale = Vector3.new(150, 0, 150, 0)
			}):Play();
			local l_Out_0 = Enum.EasingDirection.Out;
			l_TweenService_0:Create(l_NumberValue_5, TweenInfo.new(6, Enum.EasingStyle.Quad, l_Out_0, 0, false, 0), {
				Value = 0.075
			}):Play();
			l_TweenService_0:Create(game.Lighting, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				ClockTime = 5
			}):Play();
			task.wait(10);
			v63:StartShake(0.5, 5, 10);
			local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
			l_ColorCorrectionEffect_1.Name = "LightningFlash";
			l_ColorCorrectionEffect_1.Parent = game.Lighting;
			spawn(function() --[[ Line: 547 ]]
				repeat
					task.wait(math.random(500, 2000) / 1450);
					local v119 = Vector3.new(math.random(-100, 100), 0, math.random(-100, 100)) + v1.CenterOfEvent;
					local v120 = l_Part_0:Clone();
					l_Debris_0:AddItem(v120, 15);
					local l_LightningSound_0 = v120.LightningSound;
					l_LightningSound_0.PlaybackSpeed = l_LightningSound_0.PlaybackSpeed + math.random(0, 150) / 1000;
					v120.LightningSound.SoundId = v15[math.random(1, #v15)];
					v120.Position = v119 + Vector3.new(0, 100, 0, 0);
					v120.Parent = workspace;
					v120.LightningSound:Play();
					l_ColorCorrectionEffect_1.Brightness = 0.5;
					l_ColorCorrectionEffect_1.TintColor = Color3.fromRGB(255, 136, 120);
					l_TweenService_0:Create(l_ColorCorrectionEffect_1, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
						Brightness = 0, 
						TintColor = Color3.fromRGB(255, 255, 255)
					}):Play();
					v13.SummonLightning(v119 + Vector3.new(math.random(-50, 50), 200, math.random(-50, 50)), Vector3.new(math.random(-100, 100), 0, math.random(-100, 100)) + v1.CenterOfEvent, Color3.fromRGB(255, 55, 1), Vector2.new(0, 5), 3, 10, 1, 1);
				until v99 == false;
			end);
			spawn(function()
				l_Sounds_0.ChaoticEnergyLoop.Playing = true;
				l_Sounds_0.ChaoticEnergyLoop.Volume = 0;
				l_Sounds_0.ChaoticEnergyLoop.PlaybackSpeed = 0.75;
				wait(90.5);
				l_TweenService_0:Create(l_Sounds_0.ChaoticEnergyLoop, TweenInfo.new(10, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 2.5,
				}):Play();
				l_TweenService_0:Create(l_Sounds_0.ChaoticEnergyLoop, TweenInfo.new(80, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0), {
					PlaybackSpeed = 2.5, 
				}):Play();
			end)
			local l_Quint_1 = Enum.EasingStyle.Quint;
			l_TweenService_0:Create(l_Sounds_0.HeavyWindLoop, TweenInfo.new(95.5, l_Quint_1, Enum.EasingDirection.In, 0, false, 0), {
				PlaybackSpeed = 1.5, 
				Volume = 1
			}):Play();
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(95.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
				Brightness = -0.15, 
				Contrast = 0.25, 
				Saturation = 0.5, 
				TintColor = Color3.fromRGB(255, 55, 1)
			}):Play();
			l_TweenService_0:Create(v52.Vignette, TweenInfo.new(85, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
				ImageTransparency = 0
			}):Play();
			local l_Out_1 = Enum.EasingDirection.Out;
			l_TweenService_0:Create(l_NumberValue_2, TweenInfo.new(95, Enum.EasingStyle.Quint, l_Out_1, 0, false, 0), {
				Value = 350
			}):Play();
			local l_Quad_1 = Enum.EasingStyle.Quad;
			l_TweenService_0:Create(l_NumberValue_1, TweenInfo.new(95, l_Quad_1, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 300
			}):Play();
			local l_Quad_2 = Enum.EasingStyle.Quad;
			l_TweenService_0:Create(l_NumberValue_4, TweenInfo.new(95, l_Quad_2, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 30
			}):Play();
			local v126 = 9;
			local v127 = {
				Scale = Vector3.new(175, 0, 175, 0)
			};
			l_TweenService_0:Create(v71.SphereMesh, TweenInfo.new(v126, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), v127):Play();
			for _, v129 in pairs(v48) do
				l_TweenService_0:Create(v129.Center.Sparks, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
					Rate = 100
				}):Play();
			end;
			l_TweenService_0:Create(l_NumberValue_5, TweenInfo.new(6.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {
				Value = 0.01
			}):Play();
			l_TweenService_0:Create(v91.LeavesRustle, TweenInfo.new(95, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0), {
				PlaybackSpeed = 1.5, 
				Volume = 2
			}):Play();
			local l_InOut_1 = Enum.EasingDirection.InOut;
			l_TweenService_0:Create(l_NumberValue_3, TweenInfo.new(95, Enum.EasingStyle.Quint, l_InOut_1, 0, false, 0), {
				Value = 100
			}):Play();
			for _, v132 in pairs(v91:GetChildren()) do
				if v132:IsA("ParticleEmitter") then
					local l_new_1 = TweenInfo.new;
					l_TweenService_0:Create(v132, l_new_1(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
						Rate = 100
					}):Play();
				end;
			end;
			task.wait(100);
			v63:StopSustained(0);
			v63:ShakeOnce(1, 15, 0, 3);
			l_Sounds_0.EnergyExplosion:Play();
			l_TweenService_0:Create(v91.LeavesRustle, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
				PlaybackSpeed = 1.5, 
				Volume = 0
			}):Play();
			l_TweenService_0:Create(l_Sounds_0.HeavyWindLoop, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0
			}):Play();
			l_TweenService_0:Create(l_Sounds_0.ChaoticEnergyLoop, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0
			}):Play();
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
				Brightness = 1, 
				Contrast = 1, 
				Saturation = 0, 
				TintColor = Color3.fromRGB(255, 140, 140)
			}):Play();
			l_TweenService_0:Create(v52.Vignette, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
				ImageColor3 = Color3.fromRGB(255, 55, 1)
			}):Play();
			task.wait(0.25);
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Brightness = 1, 
				Contrast = 0, 
				Saturation = 0, 
				TintColor = Color3.fromRGB(255, 255, 255)
			}):Play();
			print('aaaaaaaaaaaaaaaaaaaaaaa')
			l_Sounds_0.End:Play()
			spawn(function()
				l_TweenService_0:Create(l_Sounds_0['Full Force'], TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
					Volume = 0.5
				}):Play();
			end)
			l_TweenService_0:Create(v52.Vignette, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
				BackgroundTransparency = 0, 
				ImageColor3 = Color3.fromRGB(50, 5, 5)
			}):Play();
			spawn(function()
				wait(0.15);
				local v63 = script.ImpactVisuals:Clone();
				v63.Position = v1.CenterOfEvent;
				v63.Parent = workspace;
				u2(v63.EmitPoint.Impact_FractalBurst, 10);
				u2(v63.EmitPoint.Impact_RaysBurst, 25);
				u2(v63.EmitPoint.Impact_Shockwave, 30);
				u2(v63.EmitPoint.Impact_Spark1, 10);
				u2(v63.EmitPoint.Impact_Spark2, 10);
				u2(v63.EmitPoint.Impact_Spark3, 10);
				u2(v63.EmitPoint.Impact_SparkleExplosion, 10);
				u2(v63.EmitPoint.SparkleExplosion, 7.5);
				u2(v63.EmitPoint.Sparks, 5);
				for v64, v65 in pairs(v63.EmitPoint:GetChildren()) do
					if v65:IsA("ParticleEmitter") and string.find(v65.Name, "Impact_") ~= nil then
						v65:Emit(v65:GetAttribute("EmitCount"));
					end;
				end;
				v63.ApplauseLoop.Playing = true;
				v63.ChimeLoop.Playing = true;
				v63.CoinsLoop.Playing = true;
				local l__Frame__66 = v63.BillboardGuiAnimation.Frame;
				l__Frame__66.TopText.Visible = true;
				l__Frame__66.BottomText.Visible = true;
				l__Frame__66.TopText.Text = string.upper(donatoruser) .. " DONATED";
				l__Frame__66.MiddleText.Text = tostring(robux):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
				l__Frame__66.BottomText.Text = "TO " .. string.upper(raiseruser);
				l__Frame__66.RobuxLogo.Size = UDim2.fromScale(0, 0);
				l__Frame__66.RobuxLogo.Rotation = -180;
				l__Frame__66.Star.Size = UDim2.fromScale(0, 0);
				l__Frame__66.BottomText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.BottomText.Position = UDim2.fromScale(0.5, 0.5);
				l__Frame__66.MiddleText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.TopText.Position = UDim2.fromScale(0.5, 0.5);
				l__Frame__66.TopText.Size = UDim2.fromScale(0, 0);
				l__Frame__66.Parent.Enabled = true;
				l_TweenService_0:Create(v63, TweenInfo.new(30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Position = v1.CenterOfEvent + Vector3.new(0, 400, 0)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.RobuxLogo, TweenInfo.new(10, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Size = UDim2.fromScale(1, 1)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.RobuxLogo, TweenInfo.new(15, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Rotation = 0
				}):Play();
				l_TweenService_0:Create(l__Frame__66.Star, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
					Size = UDim2.fromScale(1.5, 1.5)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.Star, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
					Rotation = 360
				}):Play();
				l_TweenService_0:Create(l__Frame__66.BottomText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.6), {
					Size = UDim2.fromScale(1.5, 0.1), 
					Position = UDim2.fromScale(0.5, 0.59)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.MiddleText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.4), {
					Size = UDim2.fromScale(1, 1)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.TopText, TweenInfo.new(5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0.2), {
					Size = UDim2.fromScale(1.5, 0.1), 
					Position = UDim2.fromScale(0.5, 0.41)
				}):Play();
				l_TweenService_0:Create(l__Frame__66.Star, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 5), {
					ImageTransparency = 1, 
					ImageColor3 = Color3.fromRGB(255, 54, 19)
				}):Play();
				v63.EmitPoint.Sparks.Enabled = true;
				v63.EmitPoint.SparkleExplosion.Enabled = true;
				l_TweenService_0:Create(v63.EmitPoint.Sparks, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
					Rate = 0
				}):Play();
				l_TweenService_0:Create(v63.EmitPoint.SparkleExplosion, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 0), {
					Rate = 0
				}):Play();
				l_TweenService_0:Create(v63.ChimeLoop, TweenInfo.new(55, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0, 
					PlaybackSpeed = 0.75
				}):Play();
				l_TweenService_0:Create(v63.ApplauseLoop, TweenInfo.new(60, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0
				}):Play();
				l_TweenService_0:Create(v63.CoinsLoop, TweenInfo.new(50, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Volume = 0, 
					PlaybackSpeed = 1
				}):Play();
				wait(30);
				l_TweenService_0:Create(l__Frame__66.UIScale, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
					Scale = 0
				}):Play();
				wait(30);
				v63:Destroy();
			end);
			print('aaaaaaaaaaaaaaaaaaaaaaa')
			task.wait(0.2);
			v63:StartShake(0.075, 2, 10);
			v99 = false;
			v71.Transparency = 1;
			for _, v139 in pairs(v71.VortexAtt:GetChildren()) do
				v139.Enabled = false;
			end;
			local v140 = script.Assets.Particles.Rift.Wind:Clone();
			local _ = v140;
			v44(v140, 7);
			v140.Enabled = true;
			v140.Parent = v71.VortexAtt;
			for _, v143 in pairs(v48) do
				v143.Center.Flare.Enabled = false;
				local l_LongTrail_1 = v143.LongTrail;
				l_LongTrail_1.Lifetime = l_LongTrail_1.Lifetime * 0.75;
				v143.Center.Sparks.Enabled = false;
				v143.Fire.Enabled = true;
				v143.Fire.Rate = 100;
			end;
			l_TweenService_0:Create(v91.LeavesRustle, TweenInfo.new(10, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0), {
				PlaybackSpeed = 1, 
				Volume = 0.75
			}):Play();
			l_Sounds_0.WindLoop.Volume = 0;
			l_Sounds_0.WindLoop.Playing = true;
			local l_WindLoop_0 = l_Sounds_0.WindLoop;
			local l_Quad_3 = Enum.EasingStyle.Quad;
			l_TweenService_0:Create(l_WindLoop_0, TweenInfo.new(6, l_Quad_3, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 1
			}):Play();
			-- l_ReplicatedStorage_0.MapChange:FireServer();
			game.Players.LocalPlayer.PlayerGui.ScreenGui.NavigationButtons.Visible = true;
			print('aaaaaaaaaaaaaaaaaaaaaaa')
			task.wait(10);
			v63:StopSustained(15);
			local l_Out_3 = Enum.EasingDirection.Out;
			l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(15, Enum.EasingStyle.Sine, l_Out_3, 0, false, 0), {
				Brightness = 0, 
				Contrast = 0, 
				Saturation = 0, 
				TintColor = Color3.fromRGB(255, 255, 255)
			}):Play();
			l_TweenService_0:Create(l_Sounds_0.Song, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0
			}):Play();
			print('waza')
			l_TweenService_0:Create(v52.Vignette, TweenInfo.new(15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
				BackgroundTransparency = 1
			}):Play();
			l_TweenService_0:Create(v52.Vignette, TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
				ImageTransparency = 1
			}):Play();
			l_TweenService_0:Create(v91.LeavesRustle, TweenInfo.new(35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {
				PlaybackSpeed = 0.5, 
				Volume = 0
			}):Play();
			local l_Out_4 = Enum.EasingDirection.Out;
			l_TweenService_0:Create(l_NumberValue_3, TweenInfo.new(40, Enum.EasingStyle.Sine, l_Out_4, 0, false, 0), {
				Value = 0
			}):Play();
			for _, v153 in pairs(v91:GetChildren()) do
				if v153:IsA("ParticleEmitter") then
					local l_new_2 = TweenInfo.new;
					l_TweenService_0:Create(v153, l_new_2(25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
						TimeScale = 0.75, 
						Rate = 0
					}):Play();
				end;
			end;
			for _, v156 in pairs(v48) do
				l_TweenService_0:Create(v156.Beam, TweenInfo.new(7.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
					Width0 = 0, 
					Width1 = 0
				}):Play();
			end;
			l_TweenService_0:Create(l_NumberValue_2, TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
				Value = 0
			}):Play();
			local l_Sine_4 = Enum.EasingStyle.Sine;
			l_TweenService_0:Create(l_NumberValue_1, TweenInfo.new(20, l_Sine_4, Enum.EasingDirection.Out, 0, false, 0), {
				Value = l_NumberValue_1.Value - 250
			}):Play();
			local l_Sine_5 = Enum.EasingStyle.Sine;
			l_TweenService_0:Create(v140, TweenInfo.new(20, l_Sine_5, Enum.EasingDirection.Out, 0, false, 0), {
				TimeScale = 0.15, 
				Rate = 0
			}):Play();
			l_TweenService_0:Create(l_Sounds_0.WindLoop, TweenInfo.new(25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0
			}):Play();
			task.wait(10);
			--l_SoundService_0.Music.DaytimeTrack.TimePosition = 0;
		--[[l_TweenService_1:Create(l_SoundService_0.Music.DaytimeTrack, TweenInfo.new(10), {
            Volume = 1
        }):Play();]]
			task.wait(10);
			l_TweenService_0:Create(l_NumberValue_1, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
				Value = l_NumberValue_1.Value + 500
			}):Play();
			local l_Sine_6 = Enum.EasingStyle.Sine;
			l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(10, l_Sine_6, Enum.EasingDirection.In, 0, false, 0), {
				Value = l_NumberValue_0.Value - 100
			}):Play();
			for _, v161 in pairs(v48) do
				l_TweenService_0:Create(v161, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
					Size = Vector3.new(0, 0, 0, 0)
				}):Play();
				l_TweenService_0:Create(v161.Center.Glow, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
					Brightness = 0
				}):Play();
				local l_Sine_7 = Enum.EasingStyle.Sine;
				l_TweenService_0:Create(v161.Fire, TweenInfo.new(10, l_Sine_7, Enum.EasingDirection.In, 0, false, 0), {
					Rate = 0
				}):Play();
			end;
			l_TweenService_0:Create(l_Sounds_0['Full Force'], TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
				Volume = 0
			}):Play();
			task.wait(30);
			for _, v164 in pairs(v48) do
				v164:Destroy();
			end;
			v91:Destroy();
			v71:Destroy();
			l_ColorCorrectionEffect_0:Destroy();
			v49:Disconnect();
			v50:Disconnect();
			v63:Stop();
			l_Sounds_0:Destroy();
			script:Destroy();
			return;
		end;
	end);
end;
if game.Players.LocalPlayer.PlayerGui.ScreenGui.Settings.Frame.GlobalEffectsSetting:GetAttribute("Value") == true then
	print('e')
	task.defer(function()
		script.Parent = nil;
	end)
	game.ReplicatedStorage.EepDoop:Fire(function()
		v8(script:GetAttribute("Donator"), script:GetAttribute("Raiser"), script:GetAttribute("Amount"));
		script:Destroy()
	end)
else
	wait(0.1)
	script:Destroy()
end

--v8(script:GetAttribute("Donator"), script:GetAttribute("Raiser"), script:GetAttribute("Amount"));