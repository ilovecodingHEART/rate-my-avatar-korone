-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_utils_0 = require(l_Parent_0:WaitForChild("utils"));
local l_ToolAssets_0 = l_ReplicatedStorage_0:WaitForChild("ToolAssets");
local _ = require(l_ToolAssets_0:WaitForChild("Lightning"));
local _ = require(l_ToolAssets_0:WaitForChild("Destruction"));
local l_SoundService_0 = game:GetService("SoundService");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v13 = Random.new();
local function v17(v14) --[[ Line: 24 ]] --[[ Name: emit ]]
	-- upvalues: l_Players_0 (copy), l_SoundService_0 (copy)
	for _, v16 in pairs(v14:GetDescendants()) do
		if v16:IsA("ParticleEmitter") then
			if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
				v16:Emit(v16:GetAttribute("EmitCount"));
			end;
		elseif v16:IsA("Sound") then
			v16.SoundGroup = l_SoundService_0.ToolSFXGroup;
			v16:Play();
		end;
	end;
end;
local function v22(v18, v19) --[[ Line: 36 ]] --[[ Name: enable ]]
	-- upvalues: l_Players_0 (copy), l_SoundService_0 (copy)
	for _, v21 in pairs(v18:GetDescendants()) do
		if v21:IsA("ParticleEmitter") or v21:IsA("Trail") then
			if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
				v21.Enabled = v19;
			end;
		elseif v21:IsA("Sound") then
			v21.SoundGroup = l_SoundService_0.ToolSFXGroup;
			if v19 then
				v21:Play();
			else
				v21:Stop();
			end;
		end;
	end;
end;
local function v28(v23, v24, v25, v26) --[[ Line: 52 ]] --[[ Name: pulse ]]
	-- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
	local l_BloomEffect_0 = Instance.new("BloomEffect");
	l_BloomEffect_0.Parent = l_Lighting_0;
	l_BloomEffect_0.Size = v23;
	l_BloomEffect_0.Threshold = v25;
	l_TweenService_0:Create(l_BloomEffect_0, TweenInfo.new(v26 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Intensity = v24
	}):Play();
	task.delay(v26 / 2, function() --[[ Line: 63 ]]
		-- upvalues: l_TweenService_0 (ref), l_BloomEffect_0 (copy), v26 (copy), l_Debris_0 (ref)
		l_TweenService_0:Create(l_BloomEffect_0, TweenInfo.new(v26 * 1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Intensity = 0, 
			Threshold = 4
		}):Play();
		l_Debris_0:AddItem(l_BloomEffect_0, v26 * 1.5);
	end);
end;
local _ = function(v29, v30, v31) --[[ Line: 73 ]] --[[ Name: camShake ]]
	-- upvalues: v13 (copy)
	local l_Humanoid_0 = v29.Humanoid;
	local l_v31_0 = v31;
	local v34 = v30 / 100;
	task.spawn(function() --[[ Line: 81 ]]
		-- upvalues: l_v31_0 (ref), v31 (copy), l_Humanoid_0 (copy), v13 (ref), v34 (copy)
		for _ = 1, 100 do
			l_v31_0 = l_v31_0 - v31 / 100;
			l_Humanoid_0.CameraOffset = Vector3.new(v13:NextNumber(-l_v31_0, l_v31_0), v13:NextNumber(-l_v31_0, l_v31_0), v13:NextNumber(-l_v31_0, l_v31_0));
			task.wait(v34);
		end;
	end);
end;
local function _(v37, v38, v39) --[[ Line: 91 ]] --[[ Name: lerp ]]
	return v37 + (v38 - v37) * v39;
end;
local function _(v41, v42) --[[ Line: 95 ]] --[[ Name: randomVec3 ]]
	-- upvalues: v13 (copy)
	return (Vector3.new(v13:NextNumber(v41, v42), v13:NextNumber(v41, v42), v13:NextNumber(v41, v42)));
end;
local function _() --[[ Line: 99 ]] --[[ Name: createWindParticle ]]
	local l_Part_0 = Instance.new("Part");
	l_Part_0.Transparency = 1;
	l_Part_0.Anchored = true;
	l_Part_0.CanCollide = false;
	l_Part_0.CanQuery = false;
	l_Part_0.CanTouch = false;
	l_Part_0.Size = Vector3.new(15, 10.5, 0.25, 0);
	l_Part_0.Parent = workspace;
	script.WindParticles:Clone().Parent = l_Part_0;
	return l_Part_0;
end;
local function v50(v46) --[[ Line: 118 ]] --[[ Name: createBlastParticle ]]
	local l_Part_1 = Instance.new("Part");
	l_Part_1.Transparency = 1;
	l_Part_1.Anchored = true;
	l_Part_1.CanCollide = false;
	l_Part_1.CanQuery = false;
	l_Part_1.CanTouch = false;
	l_Part_1.Size = Vector3.new(50, 50, 0.8500000238418579, 0);
	l_Part_1.Parent = workspace;
	l_Part_1.CFrame = v46 * CFrame.new(0, 100, 0) * CFrame.Angles(1.5707963267948966, 0, 0);
	for _, v49 in pairs(script.BlastUpParticles:GetChildren()) do
		v49:Clone().Parent = l_Part_1;
	end;
	return l_Part_1;
end;
local v51 = {
	speed = 18, 
	acceleration = 12, 
	explodeDistance = 5, 
	cooldownTime = 1, 
	renderDistance = 1e999
};
local function _(v52, v53, v54) --[[ Line: 150 ]] --[[ Name: scaleModel ]]
	-- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy)
	local l_NumberValue_0 = Instance.new("NumberValue");
	local v56 = l_TweenService_0:Create(l_NumberValue_0, v53, {
		Value = v52
	});
	v56:Play();
	local v57 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 159 ]]
		-- upvalues: v54 (copy), l_NumberValue_0 (copy)
		v54(l_NumberValue_0.Value);
	end);
	v56.Completed:Once(function() --[[ Line: 163 ]]
		-- upvalues: v57 (copy), v56 (copy), l_NumberValue_0 (copy)
		v57:Disconnect();
		v56:Destroy();
		l_NumberValue_0:Destroy();
	end);
end;
local v59 = {
	server = {}, 
	client = {}
};
v59.client.toggleNukeParticles = function(v60) --[[ Line: 177 ]] --[[ Name: toggleNukeParticles ]]
	-- upvalues: v22 (copy), v17 (copy)
	local l_tool_0 = v60.tool;
	local l_type_0 = v60.type;
	local l_name_0 = v60.name;
	local l_toggle_0 = v60.toggle;
	if l_type_0 == "enable" then
		if l_name_0 == "all" then
			v22(l_tool_0, false);
			return;
		elseif l_name_0 == "Explosion" or l_name_0 == "Kickback" then
			return;
		else
			v22(l_tool_0.Nuke[l_name_0], l_toggle_0);
			return;
		end;
	elseif l_tool_0.Nuke[l_name_0]:GetAttribute("delay") and tick() - l_tool_0.Nuke[l_name_0]:GetAttribute("delay") < 9 then
		return;
	else
		v17(l_tool_0.Nuke[l_name_0]);
		l_tool_0.Nuke[l_name_0]:SetAttribute("delay", tick());
		return;
	end;
end;
v59.client.assignTool = function(_, v66, v67) --[[ Line: 198 ]] --[[ Name: assignTool ]]
	-- upvalues: l_utils_0 (copy), v51 (copy), l_CurrentCamera_0 (copy), v13 (copy), v50 (copy), v22 (copy), v28 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_RunService_0 (copy)
	local l_FirstChild_0 = l_utils_0.scr.events:FindFirstChild(v67:GetAttribute("UID"));
	if not l_FirstChild_0 then
		return;
	else
		local l_Character_0 = v66.Character;
		local l_Nuke_0 = v67:WaitForChild("Nuke");
		local v71 = {
			loadedAnims = false, 
			equipped = false, 
			launching = false, 
			flying = false, 
			shaking = false, 
			utils = {}, 
			conns = {}, 
			anims = {}, 
			guide = nil, 
			cooldown = false
		};
		local function v81(v72, v73) --[[ Line: 223 ]] --[[ Name: discardAll ]]
			-- upvalues: l_Character_0 (copy), v71 (copy), l_FirstChild_0 (copy), v51 (ref), l_CurrentCamera_0 (ref)
			local l_Humanoid_1 = l_Character_0:FindFirstChild("Humanoid");
			for _, v76 in pairs(v71.anims) do
				v76:Stop();
			end;
			for _, v78 in pairs(v71.conns) do
				v78:Disconnect();
			end;
			for _, v80 in pairs(v71.utils) do
				v80:Destroy();
			end;
			if not v73 then
				l_FirstChild_0.toggleParticle:FireServer("all", false, "enable");
			end;
			v71.launching = false;
			v71.flying = false;
			v71.shaking = false;
			v71.conns = {};
			v71.utils = {};
			if v72 then
				v71.cooldown = true;
				task.delay(v51.cooldownTime, function() --[[ Line: 253 ]]
					-- upvalues: v71 (ref)
					v71.cooldown = false;
				end);
				if l_Humanoid_1 then
					l_CurrentCamera_0.CameraSubject = l_Humanoid_1;
				end;
			end;
		end;
		local v82 = {
			onTool = {}
		};
		v82.onTool.equip = v67.Equipped:Connect(function() --[[ Line: 267 ]]
			-- upvalues: v71 (copy), l_Character_0 (copy)
			v71.guide = l_Character_0:WaitForChild("HumanoidRootPart"):WaitForChild("nukeGuide");
			if not v71.loadedAnims then
				local l_Humanoid_2 = l_Character_0.Humanoid;
				for _, v85 in pairs(script.Animations:GetChildren()) do
					local v86 = l_Humanoid_2:LoadAnimation(v85);
					v71.anims[v85.Name] = v86;
				end;
				v71.loadedAnims = true;
			end;
			v71.equipped = true;
			v71.anims.equip:Play();
		end);
		v82.onTool.unequip = v67.Unequipped:Connect(function() --[[ Line: 285 ]]
			-- upvalues: v71 (copy), v81 (copy)
			if not v71.equipped then
				return;
			else
				v71.equipped = false;
				if v71.launching or v71.flying or v71.shaking then
					v81(true);
					return;
				else
					v81();
					return;
				end;
			end;
		end);
		v82.onTool.activated = v67.Activated:Connect(function() --[[ Line: 297 ]]
			-- upvalues: v71 (copy), l_Nuke_0 (copy), l_FirstChild_0 (copy), l_Character_0 (copy), v13 (ref), l_CurrentCamera_0 (ref), v50 (ref), v22 (ref), v28 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), l_RunService_0 (ref), v51 (ref), v81 (copy)
			if not v71.equipped then
				return;
			elseif v71.launching or v71.flying then
				return;
			elseif v71.cooldown then
				return;
			else
				v71.anims.use:Play();
				v71.launching = true;
				local v87 = false;
				task.delay(0.3, function() --[[ Line: 308 ]]
					-- upvalues: v71 (ref), l_Nuke_0 (ref)
					if not v71.equipped or not v71.launching then
						return;
					else
						l_Nuke_0.Throw:Play();
						task.wait(0.75);
						if not v71.equipped or not v71.launching then
							return;
						else
							l_Nuke_0.NukeFall:Play();
							task.wait(0.5);
							if not v71.equipped or not v71.launching then
								return;
							else
								l_Nuke_0.NukeLandHands:Play();
								return;
							end;
						end;
					end;
				end);
				task.delay(2.25, function() --[[ Line: 323 ]]
					-- upvalues: v71 (ref), l_FirstChild_0 (ref), l_Nuke_0 (ref), l_Character_0 (ref), v13 (ref)
					if not v71.equipped or not v71.launching then
						return;
					else
						v71.shaking = true;
						l_FirstChild_0.toggleParticle:FireServer("Charge", true, "enable");
						l_Nuke_0.Launch1:Play();
						local l_Humanoid_3 = l_Character_0.Humanoid;
						local v89 = 0.35;
						local l_spawn_0 = task.spawn;
						local v91 = 0.35;
						local v92 = 0.01;
						do
							local l_v89_0 = v89;
							l_spawn_0(function() --[[ Line: 81 ]]
								-- upvalues: l_v89_0 (ref), v91 (copy), l_Humanoid_3 (copy), v13 (ref), v92 (copy)
								for _ = 1, 100 do
									l_v89_0 = l_v89_0 - v91 / 100;
									l_Humanoid_3.CameraOffset = Vector3.new(v13:NextNumber(-l_v89_0, l_v89_0), v13:NextNumber(-l_v89_0, l_v89_0), v13:NextNumber(-l_v89_0, l_v89_0));
									task.wait(v92);
								end;
							end);
						end;
						l_Character_0.Humanoid.CameraOffset = Vector3.new(0, 0, 0, 0);
						return;
					end;
				end);
				task.delay(3, function() --[[ Line: 335 ]]
					-- upvalues: v71 (ref), l_FirstChild_0 (ref), l_Character_0 (ref), v13 (ref), l_CurrentCamera_0 (ref), v50 (ref), v22 (ref), v28 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), l_RunService_0 (ref), v51 (ref), v81 (ref), l_Nuke_0 (ref), v87 (ref)
					if not v71.equipped or not v71.launching then
						return;
					else
						l_FirstChild_0.toggleParticle:FireServer("Charge", false, "enable");
						l_FirstChild_0.toggleParticle:FireServer("Launch", true, "enable");
						local l_Humanoid_4 = l_Character_0.Humanoid;
						local v96 = 3;
						local l_spawn_1 = task.spawn;
						local v98 = 3;
						local v99 = 0.0085;
						local l_l_Humanoid_4_0 = l_Humanoid_4 --[[ copy: 1 -> 7 ]];
						do
							local l_v96_0 = v96;
							l_spawn_1(function() --[[ Line: 81 ]]
								-- upvalues: l_v96_0 (ref), v98 (copy), l_l_Humanoid_4_0 (copy), v13 (ref), v99 (copy)
								for _ = 1, 100 do
									l_v96_0 = l_v96_0 - v98 / 100;
									l_l_Humanoid_4_0.CameraOffset = Vector3.new(v13:NextNumber(-l_v96_0, l_v96_0), v13:NextNumber(-l_v96_0, l_v96_0), v13:NextNumber(-l_v96_0, l_v96_0));
									task.wait(v99);
								end;
							end);
						end;
						if l_Character_0:FindFirstChild("Head") then
							l_CurrentCamera_0.CameraSubject = l_Character_0:FindFirstChild("Head");
						end;
						local v103 = v50(l_Character_0.HumanoidRootPart.CFrame);
						table.insert(v71.utils, v103);
						l_Humanoid_4 = Instance.new("AlignPosition");
						v96 = Instance.new("AlignOrientation");
						l_Humanoid_4.Mode = Enum.PositionAlignmentMode.OneAttachment;
						l_Humanoid_4.Attachment0 = v71.guide;
						v96.Mode = Enum.OrientationAlignmentMode.OneAttachment;
						v96.Attachment0 = v71.guide;
						l_Humanoid_4.Parent = l_Character_0.HumanoidRootPart;
						v96.Parent = l_Character_0.HumanoidRootPart;
						l_Humanoid_4.ApplyAtCenterOfMass = true;
						l_Humanoid_4.MaxForce = 1e999;
						v96.MaxTorque = 1e999;
						l_Humanoid_4.Responsiveness = 9;
						v96.Responsiveness = 20;
						l_Humanoid_4.Position = (l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)).Position;
						v96.CFrame = l_Character_0.HumanoidRootPart.CFrame;
						table.insert(v71.utils, l_Humanoid_4);
						table.insert(v71.utils, v96);
						l_spawn_1 = RaycastParams.new();
						l_spawn_1.FilterType = Enum.RaycastFilterType.Exclude;
						l_spawn_1.FilterDescendantsInstances = {
							l_Character_0
						};
						v71.anims.blastOff:Play();
						v71.anims.blastOff:AdjustSpeed(1);
						v71.anims.use:Stop();
						v71.anims.equip:Play();
						v22(v103, true);
						task.delay(1.05, function() --[[ Line: 390 ]]
							-- upvalues: v22 (ref), v103 (copy)
							v22(v103, false);
						end);
						task.delay(1.6, function() --[[ Line: 394 ]]
							-- upvalues: v71 (ref), l_FirstChild_0 (ref), v28 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), l_RunService_0 (ref), v51 (ref), l_Character_0 (ref), l_spawn_1 (copy), v81 (ref), l_Nuke_0 (ref), v13 (ref), v87 (ref), l_Humanoid_4 (copy), l_CurrentCamera_0 (ref), v96 (copy)
							if v71.launching and v71.equipped then
								local v104 = 0;
								v71.launching = false;
								v71.flying = true;
								v71.anims.idleRide:Play();
								v71.anims.idleRide:AdjustWeight(1, 0);
								v71.anims.idleBlast:Play();
								v71.anims.idleBlast:AdjustWeight(0, 0);
								l_FirstChild_0.toggleParticle:FireServer("Launch", false, "enable");
								l_FirstChild_0.toggleParticle:FireServer("Thrust", true, "enable");
								l_FirstChild_0.toggleParticle:FireServer("Kickback", true, "emit");
								v28(350, 0.15, 2, 1.5);
								l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
									ExposureCompensation = 0.8
								}):Play();
								local l_Part_2 = Instance.new("Part");
								l_Part_2.Transparency = 1;
								l_Part_2.Anchored = true;
								l_Part_2.CanCollide = false;
								l_Part_2.CanQuery = false;
								l_Part_2.CanTouch = false;
								l_Part_2.Size = Vector3.new(15, 10.5, 0.25, 0);
								l_Part_2.Parent = workspace;
								script.WindParticles:Clone().Parent = l_Part_2;
								local l_l_Part_2_0 = l_Part_2;
								table.insert(v71.utils, l_l_Part_2_0);
								l_Part_2 = v71.guide.WorldPosition;
								local v107 = nil;
								do
									local l_v104_0, l_l_Part_2_1, l_v107_0 = v104, l_Part_2, v107;
									l_v107_0 = l_RunService_0.RenderStepped:Connect(function(v111) --[[ Line: 424 ]]
										-- upvalues: l_v104_0 (ref), v51 (ref), l_Character_0 (ref), l_spawn_1 (ref), v81 (ref), l_Nuke_0 (ref), l_FirstChild_0 (ref), v13 (ref), v71 (ref), l_v107_0 (ref), l_l_Part_2_1 (ref), l_l_Part_2_0 (copy), v87 (ref), l_Humanoid_4 (ref), l_CurrentCamera_0 (ref), v96 (ref)
										l_v104_0 = l_v104_0 + (v51.speed - l_v104_0) * v51.acceleration * v111;
										local v112 = workspace:Raycast(l_Character_0.HumanoidRootPart.Position, Vector3.new(0, -1, 0, 0) * v51.explodeDistance, l_spawn_1);
										local v113 = workspace:Raycast(l_Character_0.HumanoidRootPart.Position, l_Character_0.HumanoidRootPart.CFrame.LookVector * v51.explodeDistance, l_spawn_1);
										local root = l_Character_0.HumanoidRootPart
										local origin = root.Position
										local dist = v51.explodeDistance

										local directions = {
											Vector3.new(0,-1,0),
											root.CFrame.LookVector,
											-root.CFrame.LookVector,
											root.CFrame.RightVector,
											-root.CFrame.RightVector
										}

										local hit = false

										for _,dir in ipairs(directions) do
											if workspace:Raycast(origin, dir * dist, l_spawn_1) then
												hit = true
												break
											end
										end

										if hit then
											v81(true);
											l_Nuke_0.Explosion.WorldCFrame = CFrame.new(l_Nuke_0.Position);
											l_FirstChild_0.toggleParticle:FireServer("Explosion", true, "emit");
											local l_Humanoid_5 = l_Character_0.Humanoid;
											local v115 = 0.4;
											local l_spawn_2 = task.spawn;
											local v117 = 0.4;
											local v118 = 0.003;
											local l_v117_0 = v117 --[[ copy: 8 -> 10 ]];
											local l_l_Humanoid_5_0 = l_Humanoid_5 --[[ copy: 4 -> 11 ]];
											local l_v118_0 = v118 --[[ copy: 9 -> 12 ]];
											do
												local l_v115_0 = v115;
												l_spawn_2(function() --[[ Line: 81 ]]
													-- upvalues: l_v115_0 (ref), l_v117_0 (copy), l_l_Humanoid_5_0 (copy), v13 (ref), l_v118_0 (copy)
													for _ = 1, 100 do
														l_v115_0 = l_v115_0 - l_v117_0 / 100;
														l_l_Humanoid_5_0.CameraOffset = Vector3.new(v13:NextNumber(-l_v115_0, l_v115_0), v13:NextNumber(-l_v115_0, l_v115_0), v13:NextNumber(-l_v115_0, l_v115_0));
														task.wait(l_v118_0);
													end;
												end);
											end;
											l_Character_0.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
											v71.anims.equip:Play();
										end;
										if not v71.equipped and v71.flying then
											v81(true);
											return;
										elseif not l_v107_0.Connected then
											return;
										else
											local v124 = 1;
											local v125 = math.clamp((l_l_Part_2_1.Y - v71.guide.WorldPosition.Y) * 1, -1.5, 1.5);
											v124 = v124 + v125;
											if l_l_Part_2_1.Y > v71.guide.WorldPosition.Y then
												v71.anims.idleBlast:AdjustWeight(v125);
												v71.anims.idleRide:AdjustWeight(1 - v125);
												l_l_Part_2_0.WindParticles.Enabled = true;
												v125 = v125 * 1.5;
												v87 = true;
											else
												v71.anims.idleBlast:AdjustWeight(0);
												v71.anims.idleRide:AdjustWeight(1);
												l_l_Part_2_0.WindParticles.Enabled = false;
												v87 = false;
											end;
											v124 = v124 + v125;
											local target = v71.guide.WorldPosition + l_CurrentCamera_0.CFrame.LookVector * l_v104_0 * v124

											local groundCheck = workspace:Raycast(target, Vector3.new(0,-10,0), l_spawn_1)
											if groundCheck then
												target = Vector3.new(target.X, groundCheck.Position.Y + 3, target.Z)
											end

											l_Humanoid_4.Position = target
											v96.CFrame = CFrame.lookAt(v71.guide.WorldPosition, v71.guide.WorldPosition + l_CurrentCamera_0.CFrame.LookVector, l_CurrentCamera_0.CFrame.UpVector);
											if table.find(v71.utils, l_l_Part_2_0) then
												l_l_Part_2_0.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, v124 / 1.8 * -2);
											end;
											for _, v127 in pairs(l_Nuke_0.Thrust.ThrusterSFX:GetChildren()) do
												v127.PlaybackSpeed = math.clamp(v125 / 4.5, 0, 0.5) + 0.5;
											end;
											l_l_Part_2_1 = v71.guide.WorldPosition;
											return;
										end;
									end);
									table.insert(v71.conns, l_v107_0);
								end;
							end;
						end);
						return;
					end;
				end);
				return;
			end;
		end);
		v82.onTool.destroying = v67.Destroying:Connect(function() --[[ Line: 494 ]]
			-- upvalues: v82 (copy), v81 (copy), v71 (copy)
			for _, v129 in pairs(v82.onTool) do
				v129:Disconnect();
			end;
			v81(v71.launching or v71.flying, true);
		end);
		return;
	end;
end;
v59.server.assignTool = function(_, v131, v132) --[[ Line: 503 ]] --[[ Name: assignTool ]]
	-- upvalues: l_utils_0 (copy), l_Parent_0 (copy), v51 (copy)
	local v133 = v131.Character or v131.CharacterAdded:Wait();
	local l_Nuke_1 = v132.Nuke;
	local v135 = l_utils_0.server:getUID("Nuke");
	v132:SetAttribute("UID", v135);
	v132:SetAttribute("folderID", script.Parent.Name);
	l_Nuke_1.Connect.Part0 = v133:WaitForChild("UpperTorso");
	local l_Attachment_0 = Instance.new("Attachment");
	l_Attachment_0.Name = "nukeGuide";
	l_Attachment_0.Parent = v133:WaitForChild("HumanoidRootPart");
	local l_Folder_0 = Instance.new("Folder");
	l_Folder_0.Name = v135;
	l_Folder_0.Parent = l_Parent_0.utils.events;
	local v138 = {
		events = {
			toggleParticle = l_utils_0.server:createRemoteEvent("toggleParticle", l_Folder_0, v131)
		}, 
		onTool = {}, 
		tool = v132
	};
	v138.onTool.toggleParticle = v138.events.toggleParticle.OnServerEvent(function(v139, v140, v141) --[[ Line: 531 ]]
		-- upvalues: l_utils_0 (ref), l_Nuke_1 (copy), v51 (ref), v131 (copy), v132 (copy)
		l_utils_0.server:replicateToClientInRange("Nuke", "toggleNukeParticles", l_Nuke_1.Position, v51.renderDistance, {
			user = v131, 
			type = v141, 
			tool = v132, 
			name = v139, 
			toggle = v140
		});
	end);
	v138.destroy = function() --[[ Line: 541 ]]
		-- upvalues: v138 (copy), l_Folder_0 (copy)
		for _, v143 in pairs(v138.onTool) do
			v143:Disconnect();
		end;
		l_Folder_0:Destroy();
	end;
	return v138;
end;
return v59;