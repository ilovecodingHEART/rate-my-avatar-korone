-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local function _(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: Tween ]]
	-- upvalues: l_TweenService_0 (copy)
	l_TweenService_0:Create(v3, v4, v5):Play();
end;
local function _(v7, v8, v9, v10) --[[ Line: 16 ]] --[[ Name: Lerp ]]
	if v10 == true then
		v9 = math.clamp(v9, 0, 1);
	end;
	return v7 + (v8 - v7) * v9;
end;
local function _(v12) --[[ Line: 20 ]] --[[ Name: ClientifySound ]]
	v12:Clone().Parent = v12.Parent;
	v12.Name = "Server_" .. v12.Name;
	v12.SoundId = "";
end;
local l_CameraShaker_0 = require(script:WaitForChild("CameraShaker"));
local l_Parent_0 = script.Parent;
local _ = l_Parent_0:WaitForChild("AssetsFolder").Value;
local v17 = false;
local v18 = false;
local v19 = false;
local l_Controller_0 = l_Parent_0:WaitForChild("Controller");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
local l_Animator_0 = l_Character_0.Humanoid:WaitForChild("Animator");
local l_Value_1 = l_Parent_0.Wings.Value;
local v26 = script.ConcentrationLines:Clone();
v26.Parent = l_LocalPlayer_0.PlayerGui;
v26.ConcentrationLineRunner.Enabled = true;
v26.Enabled = true;
local l_ControlModule_0 = require(l_LocalPlayer_0:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"));
local l_RootPart_0 = l_Character_0.Humanoid.RootPart;
local l_Attachment_0 = Instance.new("Attachment");
l_Attachment_0.Name = "ForceAttachment";
l_Attachment_0.Parent = l_Character_0.Humanoid.RootPart;
local l_AlignOrientation_0 = Instance.new("AlignOrientation");
l_AlignOrientation_0.Enabled = false;
l_AlignOrientation_0.MaxTorque = 100000;
l_AlignOrientation_0.Responsiveness = 5;
l_AlignOrientation_0.Mode = Enum.OrientationAlignmentMode.OneAttachment;
l_AlignOrientation_0.Parent = l_RootPart_0;
l_AlignOrientation_0.Attachment0 = l_Attachment_0;
local l_LinearVelocity_0 = Instance.new("LinearVelocity");
l_LinearVelocity_0.Enabled = false;
l_LinearVelocity_0.Name = "Drag";
l_LinearVelocity_0.MaxForce = 250;
l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, 0, 0);
l_LinearVelocity_0.Attachment0 = l_Attachment_0;
l_LinearVelocity_0.Parent = l_Attachment_0;
local l_VectorForce_0 = Instance.new("VectorForce");
l_VectorForce_0.RelativeTo = Enum.ActuatorRelativeTo.World;
l_VectorForce_0.Enabled = false;
l_VectorForce_0.Name = "VectorForce";
l_VectorForce_0.ApplyAtCenterOfMass = true;
l_VectorForce_0.Force = Vector3.new(0, 0, 0, 0);
l_VectorForce_0.Attachment0 = l_Attachment_0;
l_VectorForce_0.Parent = l_Attachment_0;
local l_VectorForce_1 = Instance.new("VectorForce");
l_VectorForce_1.RelativeTo = Enum.ActuatorRelativeTo.World;
l_VectorForce_1.Enabled = false;
l_VectorForce_1.Name = "GravityModifier";
l_VectorForce_1.ApplyAtCenterOfMass = true;
l_VectorForce_1.Force = Vector3.new(0, 0, 0, 0);
l_VectorForce_1.Attachment0 = l_Attachment_0;
l_VectorForce_1.Parent = l_Attachment_0;
local function v34() --[[ Line: 89 ]] --[[ Name: UpdateForce ]]
	-- upvalues: l_VectorForce_1 (copy), l_RootPart_0 (copy)
	l_VectorForce_1.Force = Vector3.new(0, workspace.Gravity * l_RootPart_0.AssemblyMass, 0);
end;
l_RootPart_0:GetPropertyChangedSignal("AssemblyMass"):Connect(v34);
workspace:GetPropertyChangedSignal("Gravity"):Connect(v34);
l_VectorForce_1.Force = Vector3.new(0, workspace.Gravity * l_RootPart_0.AssemblyMass, 0);
local v35 = {
	Wings = {
		Dash = l_Value_1.AnimationController.Animator:LoadAnimation(l_Parent_0.Animations.Wings.Dash), 
		Flying = l_Value_1.AnimationController.Animator:LoadAnimation(l_Parent_0.Animations.Wings.Flying), 
		Fold = l_Value_1.AnimationController.Animator:LoadAnimation(l_Parent_0.Animations.Wings.Fold), 
		Idle = l_Value_1.AnimationController.Animator:LoadAnimation(l_Parent_0.Animations.Wings.Idle)
	}, 
	Character = {
		Dash = l_Animator_0:LoadAnimation(l_Parent_0.Animations.Character.Dash), 
		Flying = l_Animator_0:LoadAnimation(l_Parent_0.Animations.Character.Flying), 
		FloatIdle = l_Animator_0:LoadAnimation(l_Parent_0.Animations.Character.FloatIdle)
	}
};
local v36 = false;
local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
local function _() --[[ Line: 112 ]] --[[ Name: UnIdle ]]
	-- upvalues: l_workspace_ServerTimeNow_0 (ref), v36 (ref), v35 (copy)
	l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
	if v36 == true then
		v36 = false;
		v35.Wings.Idle:Play(0.25, 1, 1);
		v35.Wings.Fold:Stop();
	end;
end;
l_Parent_0.Equipped:Connect(function() --[[ Line: 121 ]]
	-- upvalues: l_Parent_0 (copy), v17 (ref), l_workspace_ServerTimeNow_0 (ref), v36 (ref), v35 (copy)
	if l_Parent_0:GetAttribute("EquipDebounce") == true then
		while task.wait() and l_Parent_0:GetAttribute("EquipDebounce") ~= false do

		end;
	end;
	v17 = true;
	l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
	if v36 == true then
		v36 = false;
		v35.Wings.Idle:Play(0.25, 1, 1);
		v35.Wings.Fold:Stop();
	end;
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 132 ]]
	-- upvalues: v17 (ref), v35 (copy)
	v17 = false;
	v35.Character.Dash:Stop();
	v35.Wings.Dash:Stop();
end);
local v40 = l_CameraShaker_0.new(Enum.RenderPriority.Character.Value, function(v39) --[[ Line: 142 ]]
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * v39;
end);
v40:Start();
v35.Wings.Idle:Play(0, 1, 1);
for _, v42 in pairs(l_Value_1.Halo:GetChildren()) do
	if v42:IsA("Sound") and not v42:GetAttribute("IgnoreClientifySound") then
		v42:Clone().Parent = v42.Parent;
		v42.Name = "Server_" .. v42.Name;
		v42.SoundId = "";
	end;
end;
local l_DashRing_0 = l_RootPart_0:WaitForChild("RootPartAtt").DashRing;
local v44 = l_DashRing_0:Clone();
v44.Name = "Client_" .. v44.Name;
v44.Parent = l_RootPart_0.RootPartAtt;
v44.Rate = 0;
v44.Enabled = false;
l_DashRing_0.Transparency = NumberSequence.new(1);
local l_FlyingVfx_0 = l_Character_0:WaitForChild("FlyingVfx");
local v46 = Vector3.new(0, 0, 0, 0);
local v47 = Vector3.new(0, 0, 0, 0);
l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 169 ]]
	-- upvalues: v36 (ref), l_workspace_ServerTimeNow_0 (ref), v35 (copy), l_RootPart_0 (copy), v46 (ref), l_ControlModule_0 (copy), v47 (ref), l_CurrentCamera_0 (copy), v19 (ref), l_VectorForce_0 (copy), l_Value_1 (copy), l_LinearVelocity_0 (copy), v26 (copy), l_AlignOrientation_0 (copy), l_FlyingVfx_0 (copy), l_Character_0 (copy)
	if v36 == false and l_workspace_ServerTimeNow_0 + 30 < workspace:GetServerTimeNow() then
		v36 = true;
		v35.Wings.Fold:Play(1, 1, 1);
		v35.Wings.Idle:Stop();
	end;
	local l_Magnitude_0 = l_RootPart_0.AssemblyLinearVelocity.Magnitude;
	v46 = Vector3.new(0, 0, 0, 0);
	if l_ControlModule_0:GetMoveVector() ~= Vector3.new(0, 0, 0, 0) then
		v46 = l_ControlModule_0:GetMoveVector().Unit;
	end;
	v47 = l_CurrentCamera_0.CFrame:VectorToWorldSpace(v46);
	if v19 == true then
		l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
		if v36 == true then
			v36 = false;
			v35.Wings.Idle:Play(0.25, 1, 1);
			v35.Wings.Fold:Stop();
		end;
		if v46.Magnitude > 0.1 then
			l_VectorForce_0.Force = v47 * 1500 * v46.Magnitude;
			local l_DragSound_0 = l_Value_1.Halo.DragSound;
			local l_Volume_0 = l_Value_1.Halo.DragSound.Volume;
			local v52 = math.clamp(0.15, 0, 1);
			l_DragSound_0.Volume = l_Volume_0 + (0 - l_Volume_0) * v52;
		else
			l_VectorForce_0.Force = Vector3.new(0, 0, 0, 0);
			local l_DragSound_1 = l_Value_1.Halo.DragSound;
			local l_Volume_1 = l_Value_1.Halo.DragSound.Volume;
			local v55 = math.clamp(l_Magnitude_0 * 0.2, 0, 2.5);
			local v56 = math.clamp(0.15, 0, 1);
			l_DragSound_1.Volume = l_Volume_1 + (v55 - l_Volume_1) * v56;
		end;
		l_LinearVelocity_0.MaxForce = 250 + l_Magnitude_0 * 15;
		v26.ConcentrationLineRunner:SetAttribute("IS_RUNNING", l_Magnitude_0 > 25);
		v26.ConcentrationLineRunner:SetAttribute("EFFECT_STRENGTH", (math.clamp((l_Magnitude_0 - 25) * 0.1, 1, 5)));
		v35.Wings.Idle:AdjustSpeed((math.clamp(2.5 + l_Magnitude_0 * 0.2, 2.5, 7.5)));
		v35.Wings.Flying:AdjustSpeed((math.clamp((l_Magnitude_0 - 20) * 0.05, 1, 2)));
		if l_Magnitude_0 > 20 then
			if v35.Wings.Flying.IsPlaying == false then
				v35.Wings.Flying:Play(0.25, 1.5, nil);
				v35.Character.Flying:Play(0.25, 1, 1);
				v35.Wings.Idle:Stop();
				v35.Character.FloatIdle:Stop();
			end;
			l_AlignOrientation_0.MaxTorque = 100000;
			l_AlignOrientation_0.Responsiveness = 100;
			l_AlignOrientation_0.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0, 0), l_RootPart_0.AssemblyLinearVelocity);
		else
			if v35.Wings.Flying.IsPlaying == true then
				v35.Wings.Idle:Play(0.5, 1, nil);
				v35.Character.FloatIdle:Play(0.5, 1, nil);
				v35.Wings.Flying:Stop();
				v35.Character.Flying:Stop();
			end;
			l_AlignOrientation_0.MaxTorque = 10000 + 90000 * math.clamp(l_Magnitude_0 / 25, 0, 1);
			l_AlignOrientation_0.Responsiveness = 5 + 20 * math.clamp(l_Magnitude_0 / 25, 0, 1);
			l_AlignOrientation_0.CFrame = l_CurrentCamera_0.CFrame;
		end;
		l_Value_1.Halo.FlyingSound.Volume = math.clamp((l_Magnitude_0 - 20) * 0.01, 0, 0.25);
		l_Value_1.Halo.FlyingSound.PlaybackSpeed = math.clamp((l_Magnitude_0 - 20) * 0.005 + 0.5, 0.5, 1.25);
		l_Value_1.Halo.DragSound.PlaybackSpeed = math.clamp((l_Magnitude_0 - 20) * 0.05 + 0.5, 0.5, 1);
		l_Value_1.Halo.WingsFlapSound.Volume = math.clamp(l_Magnitude_0 * 0.1 + 0.2, 0.2, 1);
		l_Value_1.Halo.WingsFlapSound.PlaybackSpeed = math.clamp(l_Magnitude_0 * 0.01 + 0.75, 0.75, 1.25);
	else
		v26.ConcentrationLineRunner:SetAttribute("IS_RUNNING", false);
		v35.Wings.Idle:AdjustSpeed(1);
	end;
	l_Value_1.FlyingTrail.Enabled = v19 and l_Magnitude_0 > 20;
	l_FlyingVfx_0.FlyingSparkles.Enabled = v19;
	l_FlyingVfx_0.FlyingSparkles.Rate = math.clamp((l_Magnitude_0 - 20) * 0.5 + 5, 5, 100);
	l_Value_1.Halo.DashFlyingSound.Playing = v19 and l_Magnitude_0 > 20;
	l_Value_1.Halo.DragSound.Playing = v19;
	l_Value_1.Halo.FlyingSound.Playing = v19 and l_Magnitude_0 > 20;
	l_Value_1.Halo.WingsFlapSound.Playing = v19;
	l_Character_0.Animate.Enabled = not v19;
	l_Character_0.Humanoid.AutoRotate = not v19;
	l_Controller_0:FireServer("FlyingSound", l_Magnitude_0, v19);
end);
local function v64() --[[ Line: 271 ]] --[[ Name: Dash ]]
	-- upvalues: l_VectorForce_0 (copy), v47 (ref), l_RootPart_0 (copy), l_Attachment_0 (copy), l_TweenService_0 (copy), l_Controller_0 (copy), l_Character_0 (copy), v44 (copy), l_Value_1 (copy), v40 (copy), l_CurrentCamera_0 (copy)
	local v57 = l_VectorForce_0:Clone();
	game.Debris:AddItem(v57, 2);
	v57.Name = "DashForce";
	v57.Force = v47 * 250;
	l_RootPart_0.AssemblyLinearVelocity = v57.Force;
	v57.Attachment0 = l_Attachment_0;
	v57.Parent = l_Attachment_0;
	local v58 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
	local v59 = {
		Force = Vector3.new(0, 0, 0, 0)
	};
	l_TweenService_0:Create(v57, v58, v59):Play();
	l_Controller_0:FireServer("Dash", CFrame.lookAt(l_Character_0.HumanoidRootPart.Position, l_Character_0.HumanoidRootPart.Position + v47));
	v44.Rate = 7.5;
	v58 = v44;
	v59 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
	local v60 = {
		Rate = 0
	};
	l_TweenService_0:Create(v58, v59, v60):Play();
	l_Value_1.Halo.DashSound:Play();
	v40:ShakeOnce(5, 10, 0.1, 2);
	task.delay(0, function() --[[ Line: 292 ]]
		-- upvalues: l_CurrentCamera_0 (ref), l_TweenService_0 (ref)
		local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
		local v62 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
		local v63 = {
			FieldOfView = 105
		};
		l_TweenService_0:Create(l_l_CurrentCamera_0_0, v62, v63):Play();
		task.wait(0.25);
		l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
		v62 = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0);
		v63 = {
			FieldOfView = 70
		};
		l_TweenService_0:Create(l_l_CurrentCamera_0_0, v62, v63):Play();
	end);
	l_Value_1.Halo.DashFlyingSound.Volume = 1;
	l_Value_1.Halo.DashFlyingSound.PlaybackSpeed = 2;
	v58 = l_Value_1.Halo.DashFlyingSound;
	v59 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
	v60 = {
		Volume = 0, 
		PlaybackSpeed = 0.5
	};
	l_TweenService_0:Create(v58, v59, v60):Play();
end;
local v65 = false;
l_UserInputService_0.JumpRequest:Connect(function() --[[ Line: 313 ]]
	-- upvalues: v65 (ref), l_RootPart_0 (copy), v19 (ref), v64 (copy)
	if v65 == true then
		return;
	else
		v65 = true;
		local l_Magnitude_1 = l_RootPart_0.AssemblyLinearVelocity.Magnitude;
		if v19 == true and l_Magnitude_1 > 20 then
			v64();
			task.wait(5);
		end;
		task.wait(0.5);
		v65 = false;
		return;
	end;
end);
local function _(v67) --[[ Line: 336 ]] --[[ Name: ToggleForces ]]
	-- upvalues: l_VectorForce_1 (copy), l_AlignOrientation_0 (copy), l_VectorForce_0 (copy), l_LinearVelocity_0 (copy)
	l_VectorForce_1.Enabled = v67;
	l_AlignOrientation_0.Enabled = v67;
	l_VectorForce_0.Enabled = v67;
	l_LinearVelocity_0.Enabled = v67;
end;
local v69 = false;
local function v70() --[[ Line: 344 ]] --[[ Name: StopFlying ]]
	-- upvalues: v19 (ref), l_Controller_0 (copy), l_Character_0 (copy), l_VectorForce_1 (copy), l_AlignOrientation_0 (copy), l_VectorForce_0 (copy), l_LinearVelocity_0 (copy), l_Value_1 (copy), v35 (copy)
	if v19 == true then
		l_Controller_0:FireServer("Flying", false, false);
		v19 = false;
		l_Character_0.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
		l_VectorForce_1.Enabled = false;
		l_AlignOrientation_0.Enabled = false;
		l_VectorForce_0.Enabled = false;
		l_LinearVelocity_0.Enabled = false;
		l_Value_1.Halo.FlyEndSound:Play();
		v35.Wings.Flying:Stop();
		v35.Character.Flying:Stop();
		v35.Character.FloatIdle:Stop();
		v35.Wings.Idle:Play(0, 1, 1);
	end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 359 ]]
	-- upvalues: v69 (ref), l_Parent_0 (copy), v19 (ref), l_Character_0 (copy), v18 (ref), l_workspace_ServerTimeNow_0 (ref), v36 (ref), v35 (copy), v17 (ref), l_Value_1 (copy), l_Controller_0 (copy), l_VectorForce_1 (copy), l_AlignOrientation_0 (copy), l_VectorForce_0 (copy), l_LinearVelocity_0 (copy), v47 (ref), l_CurrentCamera_0 (copy), v64 (copy), v70 (copy)
	if v69 == true or l_Parent_0:GetAttribute("EquipDebounce") == true then
		return;
	else
		v69 = true;
		if v19 == false then
			if l_Character_0.Humanoid.FloorMaterial ~= Enum.Material.Air then
				if v18 == true then
					return;
				else
					v18 = true;
					l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
					if v36 == true then
						v36 = false;
						v35.Wings.Idle:Play(0.25, 1, 1);
						v35.Wings.Fold:Stop();
					end;
					local l_WalkSpeed_0 = l_Character_0.Humanoid.WalkSpeed;
					local l_JumpHeight_0 = l_Character_0.Humanoid.JumpHeight;
					local l_Humanoid_0 = l_Character_0.Humanoid;
					local l_Humanoid_1 = l_Character_0.Humanoid;
					local v75 = 0;
					local v76 = 0;
					l_Humanoid_0.WalkSpeed = v75;
					l_Humanoid_1.JumpHeight = v76;
					v35.Wings.Dash:Play(0.15, 1, 1);
					v35.Character.Dash:Play(0.15, 1, 1);
					task.wait(0.5);
					if v17 == false or l_Parent_0:GetAttribute("EquipDebounce") == true then
						l_Humanoid_0 = l_Character_0.Humanoid;
						l_Humanoid_1 = l_Character_0.Humanoid;
						l_Humanoid_0.WalkSpeed = l_WalkSpeed_0;
						l_Humanoid_1.JumpHeight = l_JumpHeight_0;
						return;
					else
						l_Value_1.Halo.FlyStartSound:Play();
						l_Value_1.Halo.GroundedFlyStartSound:Play();
						l_Controller_0:FireServer("Flying", true, true);
						v19 = true;
						l_Character_0.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
						l_VectorForce_1.Enabled = true;
						l_AlignOrientation_0.Enabled = true;
						l_VectorForce_0.Enabled = true;
						l_LinearVelocity_0.Enabled = true;
						if v47 == Vector3.new(0, 0, 0, 0) then
							v47 = l_CurrentCamera_0.CFrame.LookVector;
						end;
						v64();
						l_Humanoid_0 = l_Character_0.Humanoid;
						l_Humanoid_1 = l_Character_0.Humanoid;
						l_Humanoid_0.WalkSpeed = l_WalkSpeed_0;
						l_Humanoid_1.JumpHeight = l_JumpHeight_0;
						task.wait(1);
						v35.Character.FloatIdle:Play(0.25, 1, 1);
						v18 = false;
					end;
				end;
			else
				l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
				if v36 == true then
					v36 = false;
					v35.Wings.Idle:Play(0.25, 1, 1);
					v35.Wings.Fold:Stop();
				end;
				l_Value_1.Halo.FlyStartSound:Play();
				l_Controller_0:FireServer("Flying", true, false);
				v19 = true;
				l_Character_0.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
				l_VectorForce_1.Enabled = true;
				l_AlignOrientation_0.Enabled = true;
				l_VectorForce_0.Enabled = true;
				l_LinearVelocity_0.Enabled = true;
				v35.Character.FloatIdle:Play(0.25, 1, 1);
			end;
		else
			v70();
		end;
		task.wait(1);
		v69 = false;
		return;
	end;
end);
l_Parent_0.Unequipped:Connect(v70);