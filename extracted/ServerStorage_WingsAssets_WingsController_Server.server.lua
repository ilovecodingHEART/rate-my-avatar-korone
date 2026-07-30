local _tweenservice = game:GetService("TweenService");
local _players = game:GetService("Players");

local function _equiwings(p1)
	print("equip function")
	--p1.FlyingTrail.Enabled = false
	local _info = {
		['wait'] = 0.15;
	};
	local _haloeffects = p1.Halo.EmitPoint;
	local _halo = p1.Halo;
	_haloeffects.Equip_FlareFlash:Emit(_haloeffects.Equip_FlareFlash:GetAttribute("EmitCount"));
	_haloeffects.Equip_Shockwave:Emit(3);
	_halo.EquipSound:Play();
	_halo.EquipSound2:Play();
	_tweenservice:Create(_halo, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play();
	_tweenservice:Create(p1.HaloStar1, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play();
	_tweenservice:Create(p1.HaloStar2, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play();
	_tweenservice:Create(p1.LeftDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play();
	_tweenservice:Create(p1.RightDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play();
	_tweenservice:Create(_halo, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 0, 191)}):Play();
	_tweenservice:Create(p1.HaloStar1, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 102, 204)}):Play();
	_tweenservice:Create(p1.HaloStar2, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 102, 204)}):Play();
	_tweenservice:Create(p1.LeftDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 102, 204)}):Play();
	_tweenservice:Create(p1.RightDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 102, 204)}):Play();
	_tweenservice:Create(_halo.GlowLight, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 1}):Play();

	local halostar_elements = {p1.HaloStar1, p1.HaloStar2, p1.LeftDiamond, p1.RightDiamond}
	for _, halo in pairs(halostar_elements) do
		for _, child in pairs(halo:GetChildren()) do
			if child:IsA("SpotLight") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play();
			elseif child:IsA("Trail") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2.5}):Play();
			elseif child:IsA("PointLight") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2.5}):Play();
			end
		end
	end

	for i = 1, 5 do
		local leftStar = p1["LeftStar"..i]
		local rightStar = p1["RightStar"..i]
		local leftWing = p1["LeftWing"..i]
		local rightWing = p1["RightWing"..i]

		leftStar.EmitPoint.Equip_FlareFlash:Emit(leftStar.EmitPoint.Equip_FlareFlash:GetAttribute("EmitCount"))
		rightStar.EmitPoint.Equip_Shockwave:Emit(1)
		leftWing.EmitPoint.Equip_FlareFlash:Emit(leftWing.EmitPoint.Equip_FlareFlash:GetAttribute("EmitCount"))
		rightWing.EmitPoint.Equip_Shockwave:Emit(1)

		local elements = {leftWing, rightWing}
		for _, element in pairs(elements) do
			_tweenservice:Create(element, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play()
			_tweenservice:Create(element, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 0, 191)}):Play()
			for _, child in pairs(element:GetChildren()) do
				if child:IsA("PointLight") then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2}):Play()
				end
				if child:IsA("SpotLight")  then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play()
				end
				if child:IsA("Trail") then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2.5}):Play()
				end
			end
		end
		local elements = {leftStar, rightStar}
		for _, element in pairs(elements) do
			_tweenservice:Create(element, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play()
			_tweenservice:Create(element, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(255, 102, 204)}):Play()
			for _, child in pairs(element:GetChildren()) do
				if child:IsA("PointLight") then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2}):Play()
				end
				if child:IsA("SpotLight")  then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play()
				end
				if child:IsA("Trail") then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 2.5}):Play()
				end
			end
		end
		leftStar.EmitPoint.EquipSound:Play()
		rightStar.EmitPoint.EquipSound:Play()
		leftWing.EmitPoint.EquipSound:Play()
		rightWing.EmitPoint.EquipSound:Play()
		task.wait(_info.wait);
	end
end;

local function _unequiwings(p1)
	print("unequip function")
	--p1.FlyingTrail.Enabled = false
	local _info = {
		['wait'] = 0.15;
	};
	local _haloeffects = p1.Halo.EmitPoint;
	local _halo = p1.Halo;
	_haloeffects.Unequip_Burst:Emit(15);
	--_haloeffects.Unequip_HollowBurst:Emit(_haloeffects.Unequip_HollowBurst:GetAttribute("EmitCount"));
	_halo.UnequipSound:Play();
	_tweenservice:Create(_halo, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play();
	_tweenservice:Create(p1.HaloStar1, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play();
	_tweenservice:Create(p1.HaloStar2, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1 }):Play();
	_tweenservice:Create(p1.LeftDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play();
	_tweenservice:Create(p1.RightDiamond, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play();
	_tweenservice:Create(_halo.GlowLight, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness =0}):Play();
	local halostar_elements = {p1.HaloStar1, p1.HaloStar2, p1.LeftDiamond, p1.RightDiamond}
	for _, halo in pairs(halostar_elements) do
		for _, child in pairs(halo:GetChildren()) do
			if child:IsA("SpotLight") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play();
			elseif child:IsA("Trail") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play();
			elseif child:IsA("PointLight") then
				_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play();
			end
		end
	end

	for i = 1, 5 do
		local leftStar = p1["LeftStar"..i]
		local rightStar = p1["RightStar"..i]
		local leftWing = p1["LeftWing"..i]
		local rightWing = p1["RightWing"..i]

		leftStar.EmitPoint.Unequip_HollowBurst:Emit(15)
		rightStar.EmitPoint.Unequip_HollowBurst:Emit(10)
		leftWing.EmitPoint.Unequip_HollowBurst:Emit(15)
		rightWing.EmitPoint.Unequip_HollowBurst:Emit(10)

		local elements = {leftStar, rightStar, leftWing, rightWing}
		for _, element in pairs(elements) do
			_tweenservice:Create(element, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play()
			_tweenservice:Create(element, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play()
			for _, child in pairs(element:GetChildren()) do
				if child:IsA("PointLight") or child:IsA("SpotLight") or child:IsA("Trail") then
					_tweenservice:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Brightness = 0}):Play()
				end
			end
		end
		leftStar.EmitPoint.UnequipSound:Play()
		rightStar.EmitPoint.UnequipSound:Play()
		leftWing.EmitPoint.UnequipSound:Play()
		rightWing.EmitPoint.UnequipSound:Play()
		task.wait(_info.wait);
		_tweenservice:Create(_halo, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play();
		_tweenservice:Create(p1.HaloStar1, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play();
		_tweenservice:Create(p1.HaloStar2, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play();
		_tweenservice:Create(p1.LeftDiamond, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play();
		_tweenservice:Create(p1.RightDiamond, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(243, 151, 255)}):Play();
	end
end;

local _wingforplayer = nil;
local _portal = true;
local _canportalagain = true;
local _localplayer = nil;
local _canusewingsagain = true;
local _secondagain = false; 
script.Parent.Equipped:Connect(function()
	if _canusewingsagain == true then
		local _player = _players:GetPlayerFromCharacter(script.Parent.Parent)
		_canusewingsagain = false
		if script.Parent.Wings.Value == nil then
			script.Parent.Wings.Value = _player.Character:FindFirstChild("SEWings")
		end
		task.wait(0.25)
		_canusewingsagain = true
		_localplayer = _player
		script.Parent.Client.Enabled = true
		if not _player.Character:FindFirstChild("SEWings") then
			local _serverstorage = game:GetService("ServerStorage")
			local _vfxpart = _serverstorage.WingsAssets:FindFirstChild("FlyingVfx"):Clone()
			local _particle = _serverstorage.WingsAssets.EndowmentWingsVFX:FindFirstChild("DashRing"):Clone()
			local _attachment = Instance.new("Attachment")
			_attachment.Name = "RootPartAtt"
			_attachment.Parent = _player.Character.HumanoidRootPart
			local _attachment1 = Instance.new("Attachment")
			_attachment1.Name = "WingsAtt"
			_attachment1.Parent = _player.Character.UpperTorso
			_particle.Parent = _attachment
			if not _player.Character:FindFirstChild("FlyingVfx") then
				_vfxpart.Parent = _player.Character
				_vfxpart.RigidConstraint.Attachment0 = _attachment
			else
				_vfxpart:Destroy()
			end
			_equiwings(_player.Character:FindFirstChild("SEWings"))
		else
			if _player.Character:FindFirstChild("FlyingVfx") then
				_player.Character:FindFirstChild("FlyingVfx").Size = Vector3.new(35, 46, 42.5)
			end
			_equiwings(_player.Character:FindFirstChild("SEWings"))
		end
		if not _secondagain then
			script.Parent.Unequipped:Connect(function()
				if _canusewingsagain == true then
					local _player = _players:GetPlayerFromCharacter(script.Parent.Parent)
					if _localplayer.Character:FindFirstChild("FlyingVfx") then
						_localplayer.Character:FindFirstChild("FlyingVfx").Size = Vector3.new(0, 0, 0)
					end
					_unequiwings(_localplayer.Character:FindFirstChild("SEWings"))
				end
			end)
			_secondagain = true
		end
	end
end)
script.Parent.Controller.OnServerEvent:Connect(function(p1, p2, p3, p4)
	local character = p1.Character or p1.CharacterAdded:Wait();
	local _humanoid = character:WaitForChild("HumanoidRootPart")
	if p2 == "Dash" then
		character.SEWings.Halo:FindFirstChild("DashSound"):Play();
		local dash = _humanoid.RootPartAtt
		local dasheffects = game.ServerStorage.WingsAssets:WaitForChild("DashEffects").VfxAttachment:Clone()
		dasheffects.Parent = workspace.Terrain
		dasheffects.WorldCFrame = dash.WorldCFrame
		dasheffects.Burst:Emit(dasheffects.Burst:GetAttribute("EmitCount"))
		dasheffects.BurstDust:Emit(dasheffects.BurstDust:GetAttribute("EmitCount"))
		dasheffects.Lines:Emit(dasheffects.Lines:GetAttribute("EmitCount"))
		dasheffects.Ring:Emit(dasheffects.Ring:GetAttribute("EmitCount"))
		dasheffects.Shockwave:Emit(dasheffects.Shockwave:GetAttribute("EmitCount"))
		delay(5, function()
			dasheffects:Destroy()
		end)
		local dashEffect = _humanoid.RootPartAtt.DashRing
		if _humanoid:FindFirstChild("RootPartAtt"):FindFirstChild("ClientDashRing") then
			_humanoid.RootPartAtt.ClientDashRing.Enabled = false
		end
		dashEffect.Rate = 7.5
		dashEffect.Enabled = true
		dashEffect.Transparency = NumberSequence.new(0)
		local v59 = {
			Force = Vector3.new(0, 0, 0, 0)
		};
		local v60 = {
			Rate = 0
		};
		v59 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
		game.TweenService:Create(dashEffect, v59, v60):Play();

	elseif p2 == "Flying" then
		if p3 == false and p4 == false then
			character.SEWings.Halo:FindFirstChild("FlyEndSound"):Play();
			local dashEffect = game.ServerStorage.WingsAssets.EndowmentWingsVFX.Star:Clone();
			dashEffect.Parent = character:FindFirstChild("HumanoidRootPart") or dashEffect:Destroy();
			local dashEffect2 = game.ServerStorage.WingsAssets.EndowmentWingsVFX.Ring2:Clone();
			dashEffect2.Parent = character:FindFirstChild("HumanoidRootPart") or dashEffect:Destroy();
			dashEffect:Emit(dashEffect:GetAttribute("EmitCount"));
			dashEffect2:Emit(dashEffect:GetAttribute("EmitCount"));
			delay(0.5, function()
				dashEffect:Destroy();
				dashEffect2:Destroy();
			end);
		end
		if p3 == true and p4 == false then
			character.SEWings.Halo:FindFirstChild("FlyStartSound"):Play();
			local _scatterring = game.ServerStorage.WingsAssets.EndowmentWingsVFX.Ring1:Clone();
			local _scatterring2 = game.ServerStorage.WingsAssets.EndowmentWingsVFX.ScatterRing:Clone();
			local _sparkles = game.ServerStorage.WingsAssets.EndowmentWingsVFX.BigSparkles:Clone();
			_scatterring.Parent = character:FindFirstChild("LowerTorso");
			_scatterring:Emit(_scatterring:GetAttribute("EmitCount"));
			_scatterring2.Parent = character:FindFirstChild("LowerTorso");
			_scatterring2:Emit(_scatterring2:GetAttribute("EmitCount"));
			_sparkles.Parent = character:FindFirstChild("LowerTorso");
			_sparkles:Emit(_sparkles:GetAttribute("EmitCount"));
			delay(5, function()
				_sparkles:Destroy();
				_scatterring:Destroy();
				_scatterring2:Destroy();
			end);
		end
		if p3 == true and p4 == true then
			character.SEWings.Halo:FindFirstChild("FlyStartSound"):Play();
			character.SEWings.Halo:FindFirstChild("GroundedFlyStartSound"):Play();
			local _scatterring = game.ServerStorage.WingsAssets.EndowmentWingsVFX.Ring1:Clone();
			local _scatterring2 = game.ServerStorage.WingsAssets.EndowmentWingsVFX.ScatterRing:Clone();
			local _sparkles = game.ServerStorage.WingsAssets.EndowmentWingsVFX.BigSparkles:Clone();
			_scatterring.Parent = character:FindFirstChild("HumanoidRootPart").RootAttachment;
			_scatterring:Emit(_scatterring:GetAttribute("EmitCount"));
			_scatterring2.Parent = character:FindFirstChild("HumanoidRootPart").RootAttachment;
			_scatterring2:Emit(_scatterring2:GetAttribute("EmitCount"));
			_sparkles.Parent = character:FindFirstChild("HumanoidRootPart").RootAttachment;
			_sparkles:Emit(_sparkles:GetAttribute("EmitCount"));
			delay(5, function()
				_sparkles:Destroy();
				_scatterring:Destroy();
				_scatterring2:Destroy();
			end);
		end
		local isFlying = p4 
		if isFlying then
			local dashEffect = _humanoid.RootPartAtt.DashRing
			if _humanoid:FindFirstChild("RootPartAtt"):FindFirstChild("ClientDashRing") then
				_humanoid.RootPartAtt.ClientDashRing.Enabled = false
			end
			dashEffect.Rate = 7.5
			dashEffect.Enabled = true
			dashEffect.Transparency = NumberSequence.new(0)
			local v59 = {
				Force = Vector3.new(0, 0, 0, 0)
			};
			local v60 = {
				Rate = 0
			};
			v59 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
			game.TweenService:Create(dashEffect, v59, v60):Play();
		else
			_humanoid.Velocity = Vector3.new(0, 0, 0);
		end
	elseif p2 == "FlyingSound" then
		if p4 == true then
			character.SEWings.Halo.FlyingSound.Volume = math.clamp((p3 - 20) * 0.01, 0, 0.25);
			character.SEWings.Halo.FlyingSound.PlaybackSpeed = math.clamp((p3 - 20) * 0.005 + 0.5, 0.5, 1.25);
			character.FlyingVfx.FlyingSparkles.Rate = math.clamp((p3 - 20) * 0.5 + 5, 5, 100);
		else
			character.SEWings.Halo.FlyingSound.Volume = 0;
			character.SEWings.Halo.FlyingSound.PlaybackSpeed = 0;
		end
		character.SEWings.Halo.FlyingSound.Playing = p4 and p3 > 20;
		character.SEWings.Halo.DragSound.Playing = p4
		character.FlyingVfx.FlyingSparkles.Enabled = p4;
		character.SEWings.FlyingTrail.Enabled = p4 and p3 > 20;
		character.SEWings.Halo.WingsFlapSound.Playing = p4;
		character.SEWings.Halo.FlyingSound.Volume = math.clamp((p3 - 20) * 0.01, 0, 0.25);
		character.SEWings.Halo.FlyingSound.PlaybackSpeed = math.clamp((p3 - 20) * 0.005 + 0.5, 0.5, 1.25);
		character.SEWings.Halo.DragSound.PlaybackSpeed = math.clamp((p3 - 20) * 0.05 + 0.5, 0.5, 1);
		character.SEWings.Halo.WingsFlapSound.Volume = math.clamp(p3 * 0.1 + 0.2, 0.2, 1);
		character.SEWings.Halo.WingsFlapSound.PlaybackSpeed = math.clamp(p3 * 0.01 + 0.75, 0.75, 1.25);
	else
		print("Something wrong happend and it didn't get anything")
	end
end)