-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- !! MANUAL FIX REQUIRED: 1 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

if game:GetService("UserInputService").VREnabled then
	return;
else
	local l_CollectionService_0 = game:GetService("CollectionService");
	local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
	local l_RunService_0 = game:GetService("RunService");
	local l_Players_0 = game:GetService("Players");
	local _ = game:GetService("Debris");
	local v5 = require(script.Util);
	local v6 = require(script.Config);
	local v7 = require(script.FpsCamera);
	local v111 = {
		Rotators = {}, 
		BindTag = "RealismHook", 
		Player = l_Players_0.LocalPlayer, 
		SetLookAngles = l_ReplicatedStorage_0:WaitForChild("SetLookAngles"), 
		Connect = function(v8, v9, v10) --[[ Line: 39 ]] --[[ Name: Connect ]]
			return v10:Connect(function(...) --[[ Line: 40 ]]
				-- upvalues: v8 (copy), v9 (copy)
				v8[v9](v8, ...);
			end);
		end, 
		AddMotor = function(_, v12, v13) --[[ Line: 48 ]] --[[ Name: AddMotor ]]
			-- upvalues: v5 (copy)
			local l_Parent_0 = v13.Parent;
			if l_Parent_0 and l_Parent_0.Name == "Head" then
				l_Parent_0.CanCollide = false;
			end;
			v5:PromiseValue(v13, "Active", function() --[[ Line: 58 ]]
				-- upvalues: v13 (copy), v5 (ref), v12 (copy)
				local v15 = {
					Motor = v13, 
					C0 = v13.C0
				};
				v5:PromiseChild(v13.Part0, v13.Name .. "RigAttachment", function(v16) --[[ Line: 68 ]]
					-- upvalues: v15 (copy)
					if v16:IsA("Attachment") then
						v15.Origin = v16;
						v15.C0 = nil;
					end;
				end);
				local l_Name_0 = v13.Part1.Name;
				v12.Motors[l_Name_0] = v15;
			end);
		end, 
		OnLookReceive = function(v18, v19, v20, v21) --[[ Line: 87 ]] --[[ Name: OnLookReceive ]]
			local l_Character_0 = v19.Character;
			local v23 = v18.Rotators[l_Character_0];
			if v23 then
				v23.Pitch.Goal = v20;
				v23.Yaw.Goal = v21;
			end;
		end, 
		ComputeLookAngle = function(v24, v25, v26) --[[ Line: 101 ]] --[[ Name: ComputeLookAngle ]]
			-- upvalues: v7 (copy)
			local v27 = v7:IsInFirstPerson();
			local v28 = 0;
			local v29 = 0;
			local v30 = 1;
			if not v25 then
				v25 = workspace.CurrentCamera.CFrame.LookVector;
			end;
			if v25 then
				local l_Character_1 = v24.Player.Character;
				local v32 = l_Character_1 and l_Character_1:FindFirstChild("HumanoidRootPart");
				if v32 and v32:IsA("BasePart") then
					local l_CFrame_0 = v32.CFrame;
					v28 = -l_CFrame_0.RightVector:Dot(v25);
					if not v27 then
						v30 = math.clamp(l_CFrame_0.LookVector:Dot(v25) * 10, -1, 1);
					end;
				end;
				v29 = v25.Y;
			end;
			if v26 then
				v30 = v26;
			end;
			return v28 * v30, v29 * v30;
		end, 
		StepValue = function(_, v35, v36) --[[ Line: 139 ]] --[[ Name: StepValue ]]
			-- upvalues: v5 (copy)
			local v37 = v35.Current or 0;
			local l_Goal_0 = v35.Goal;
			local v39 = 5 / (v36 * 60);
			local v40 = math.min(math.min(1, v36 * 20 / 3), math.abs(l_Goal_0 - v37) / v39);
			v35.Current = v5:StepTowards(v37, l_Goal_0, v40);
			return v35.Current;
		end, 
		UpdateLookAngles = function(v41, _) --[[ Line: 156 ]] --[[ Name: UpdateLookAngles ]]
			-- upvalues: v5 (copy), l_Players_0 (copy), v7 (copy), l_CollectionService_0 (copy)
			local v43, v44 = v41:ComputeLookAngle();
			v41:OnLookReceive(v41.Player, v43, v44);
			local v45 = v41.LastUpdate or 0;
			local v46 = os.clock();
			if v46 - v45 > 0.5 then
				v43 = v5:RoundNearestInterval(v43, 0.05);
				v44 = v5:RoundNearestInterval(v44, 0.05);
				if v43 ~= v41.Pitch then
					v41.Pitch = v43;
					v41.Dirty = true;
				end;
				if v44 ~= v41.Yaw then
					v41.Yaw = v44;
					v41.Dirty = true;
				end;
				if v41.Dirty then
					v41.Dirty = false;
					v41.LastUpdate = v46;
					v41.SetLookAngles:FireServer(v43, v44);
				end;
			end;
			local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
			local l_Player_0 = v41.Player;
			local v49 = nil;
			for v50, v51 in pairs(v41.Rotators) do
				if not v50.Parent then
					if not v49 then
						v49 = {};
					end;
					v49[v50] = true;
				else
					local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v50);
					local v53 = l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0:DistanceFromCharacter(l_Position_0) or 0;
					if l_l_Players_0_PlayerFromCharacter_0 == l_Player_0 or v53 <= 30 then
						local v54 = v46 - (v51.LastStep or 0);
						local l_Humanoid_0 = v50:FindFirstChildOfClass("Humanoid");
						local v56 = l_Humanoid_0 and l_Humanoid_0.RootPart;
						if v56 then
							local l_Pitch_0 = v51.Pitch;
							v41:StepValue(l_Pitch_0, v54);
							local l_Yaw_0 = v51.Yaw;
							v41:StepValue(l_Yaw_0, v54);
							local l_Motors_0 = v51.Motors;
							v51.LastStep = v46;
							if l_Motors_0 then
								for v60, v61 in pairs(v41.RotationFactors) do
									local v62 = l_Motors_0 and l_Motors_0[v60];
									if v62 then
										local l_Motor_0 = v62.Motor;
										local l_Origin_0 = v62.Origin;
										if l_Origin_0 then
											local l_Part0_0 = l_Motor_0.Part0;
											local l_Parent_1 = l_Origin_0.Parent;
											if l_Part0_0 and l_Part0_0 ~= l_Parent_1 then
												local l_l_Part0_0_FirstChild_0 = l_Part0_0:FindFirstChild(l_Origin_0.Name);
												if l_l_Part0_0_FirstChild_0 and l_l_Part0_0_FirstChild_0:IsA("Attachment") then
													l_Origin_0 = l_l_Part0_0_FirstChild_0;
													v62.Origin = l_l_Part0_0_FirstChild_0;
												end;
											end;
											l_Origin_0 = l_Origin_0.CFrame;
										elseif v62.C0 then
											l_Origin_0 = v62.C0;
										else
											continue; -- << MANUAL FIX: continue (2021 cannot compile this) >>
										end;
										local v68 = l_Pitch_0.Current or 0;
										local v69 = l_Yaw_0.Current or 0;
										if v51.SnapFirstPerson and v60 == "Head" and v7:IsInFirstPerson() then
											v68 = l_Pitch_0.Goal;
											v69 = l_Yaw_0.Goal;
										end;
										local v70 = v68 * v61.Pitch;
										local v71 = v69 * v61.Yaw;
										if v60:sub(-4) == " Arm" or v60:sub(-8) == "UpperArm" then
											local l_Tool_0 = v50:FindFirstChildOfClass("Tool");
											if l_Tool_0 and not l_CollectionService_0:HasTag(l_Tool_0, "NoArmRotation") then
												if v60:sub(1, 5) == "Right" and v56:GetRootPart() ~= v56 then
													v70 = v68 * 1.3;
													v71 = v69 * 1.3;
												else
													v71 = v69 * 0.8;
												end;
											end;
										end;
										local v73 = false;
										if v70 ~= l_Pitch_0.Value then
											l_Pitch_0.Value = v70;
											v73 = true;
										end;
										if v71 ~= l_Yaw_0.Value then
											l_Yaw_0.Value = v71;
											v73 = true;
										end;
										if v73 then
											local v74 = l_Origin_0 - l_Origin_0.Position;
											local v75 = CFrame.Angles(0, v70, 0) * CFrame.Angles(v71, 0, 0);
											l_Motor_0.C0 = l_Origin_0 * v74:Inverse() * v75 * v74;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
			if v49 then
				for v76 in pairs(v49) do
					local v77 = v41.Rotators[v76];
					local v78 = v77 and v77.Listener;
					if v78 then
						v78:Disconnect();
					end;
					v41.Rotators[v76] = nil;
				end;
			end;
		end, 
		MountLookAngle = function(v79, v80) --[[ Line: 336 ]] --[[ Name: MountLookAngle ]]
			-- upvalues: l_Players_0 (copy)
			local l_Parent_2 = v80.Parent;
			local v82 = l_Parent_2 and v79.Rotators[l_Parent_2];
			if not v82 then
				v82 = {
					Motors = {}, 
					Pitch = {
						Goal = 0, 
						Current = 0
					}, 
					Yaw = {
						Goal = 0, 
						Current = 0
					}
				};
				if l_Players_0:GetPlayerFromCharacter(l_Parent_2) == v79.Player then
					v82.SnapFirstPerson = true;
				end;
				v79.Rotators[l_Parent_2] = v82;
				local function v84(v83) --[[ Line: 375 ]] --[[ Name: onDescendantAdded ]]
					-- upvalues: v79 (copy), v82 (ref)
					if v83:IsA("Motor6D") then
						v79:AddMotor(v82, v83);
					end;
				end;
				for _, v86 in pairs(l_Parent_2:GetDescendants()) do
					if v86:IsA("Motor6D") then
						v79:AddMotor(v82, v86);
					end;
				end;
				v82.Listener = l_Parent_2.DescendantAdded:Connect(v84);
			end;
			return v82;
		end, 
		MountMaterialSounds = function(v87, v88) --[[ Line: 395 ]] --[[ Name: MountMaterialSounds ]]
			-- upvalues: v5 (copy), l_RunService_0 (copy)
			local l_Parent_3 = v88.Parent;
			local v90 = l_Parent_3 and l_Parent_3:WaitForChild("HumanoidRootPart", 10);
			if not v90 or not v90:IsA("BasePart") then
				return;
			else
				v5:PromiseChild(v90, "Running", function(v91) --[[ Line: 403 ]]
					-- upvalues: v88 (copy), v90 (copy), l_RunService_0 (ref), v87 (copy)
					if not v91:IsA("Sound") then
						return;
					else
						local l_NumberValue_0 = Instance.new("NumberValue");
						l_NumberValue_0.Name = "OldPitch";
						l_NumberValue_0.Parent = v91;
						l_NumberValue_0.Value = 1;
						local function v98(_, v94) --[[ Line: 413 ]] --[[ Name: onStateChanged ]]
							-- upvalues: v88 (ref), v90 (ref), v91 (copy), l_NumberValue_0 (copy), l_RunService_0 (ref)
							if v94.Name:find("Running") then
								while v88:GetState() == v94 do
									local l_HipHeight_0 = v88.HipHeight;
									if v88.RigType.Name == "R6" then
										l_HipHeight_0 = 2.8;
									end;
									local v96 = l_HipHeight_0 / 3;
									local l_Magnitude_0 = (v90.Velocity * Vector3.new(1, 0, 1, 0)).Magnitude;
									v91.Volume = math.clamp((l_Magnitude_0 - 4) / 12 * v96, 0, 1);
									v91.Pitch = l_NumberValue_0.Value / (v96 * 15 / l_Magnitude_0);
									l_RunService_0.Heartbeat:Wait();
								end;
							end;
						end;
						local function v101() --[[ Line: 436 ]] --[[ Name: updateRunningSoundId ]]
							-- upvalues: v87 (ref), v88 (ref), v91 (copy)
							local l_Concrete_0 = v87.Sounds.Concrete;
							local l_Name_1 = v88.FloorMaterial.Name;
							if not v87.Sounds[l_Name_1] then
								l_Name_1 = v87.MaterialMap[l_Name_1];
							end;
							if v87.Sounds[l_Name_1] then
								l_Concrete_0 = v87.Sounds[l_Name_1];
							end;
							v91.SoundId = "rbxassetid://" .. l_Concrete_0;
						end;
						v88:GetPropertyChangedSignal("FloorMaterial"):Connect(v101);
						v91.EmitterSize = 1;
						v91.MaxDistance = 50;
						local l_Concrete_1 = v87.Sounds.Concrete;
						local l_Name_2 = v88.FloorMaterial.Name;
						if not v87.Sounds[l_Name_2] then
							l_Name_2 = v87.MaterialMap[l_Name_2];
						end;
						if v87.Sounds[l_Name_2] then
							l_Concrete_1 = v87.Sounds[l_Name_2];
						end;
						v91.SoundId = "rbxassetid://" .. l_Concrete_1;
						v88.StateChanged:Connect(v98);
						v98(nil, Enum.HumanoidStateType.Running);
						return;
					end;
				end);
				return;
			end;
		end, 
		OnHumanoidAdded = function(v104, v105) --[[ Line: 468 ]] --[[ Name: OnHumanoidAdded ]]
			if v105:IsA("Humanoid") then
				if not v104.SkipLookAngle then
					v104:MountLookAngle(v105);
				end;
				if not v104.SkipMaterialSounds then
					v104:MountMaterialSounds(v105);
				end;
			end;
		end, 
		Start = function(v106) --[[ Line: 484 ]] --[[ Name: Start ]]
			-- upvalues: v6 (copy), l_CollectionService_0 (copy), l_RunService_0 (copy), v7 (copy)
			assert(not _G.DefineRealismClient, "Realism can only be started once on the client!");
			_G.DefineRealismClient = true;
			for v107, v108 in pairs(v6) do
				v106[v107] = v108;
			end;
			for _, v110 in pairs(l_CollectionService_0:GetTagged(v106.BindTag)) do
				v106:OnHumanoidAdded(v110);
			end;
			v106:Connect("UpdateLookAngles", l_RunService_0.Heartbeat);
			v106:Connect("OnLookReceive", v106.SetLookAngles.OnClientEvent);
			v106:Connect("OnHumanoidAdded", l_CollectionService_0:GetInstanceAddedSignal(v106.BindTag));
			v7:Start();
		end
	};
	if script:IsA("ModuleScript") then
		return v111;
	else
		assert(script:FindFirstAncestorOfClass("PlayerScripts"), "RealismClient must be a descendant of the PlayerScripts!");
		assert(l_Players_0.LocalPlayer, "RealismClient expects a Player on the client to automatically start execution!");
		v111:Start();
		return;
	end;
end;