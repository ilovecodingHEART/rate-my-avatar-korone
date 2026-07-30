-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x29, if-expr -> __2021_if x1, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players").LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Slerp.Shared;
local _ = require(l_Shared_0.ChassisCore);
local v4 = require(l_Shared_0.IK2L);
local l_Car_0 = l_Shared_0.Car;
local v6 = require(l_Car_0.Simulator);
local _ = require(script.Parent.Types);
local _ = require(l_Car_0.Types);
local v9 = {};
local l_Follow_0 = Enum.CameraType.Follow;
local function v27(v11, v12, v13, v14) --[[ Line: 31 ]] --[[ Name: createArm ]]
	local l_v12_FirstChild_0 = v12:FindFirstChild(v11 .. "Shoulder");
	local l_v13_FirstChild_0 = v13:FindFirstChild(v11 .. "Elbow");
	local l_v12_FirstChild_1 = v12:FindFirstChild(v11 .. "ShoulderRigAttachment");
	local l_v12_FirstChild_2 = v12:FindFirstChild(v11 .. "ShoulderAttachment");
	local l_v12_FirstChild_3 = v12:FindFirstChild(v11 .. "ElbowRigAttachment");
	local l_v13_FirstChild_1 = v13:FindFirstChild(v11 .. "ElbowRigAttachment");
	local l_v14_FirstChild_0 = v14:FindFirstChild(v11 .. "GripAttachment");
	if not l_v12_FirstChild_0 or not l_v13_FirstChild_0 then
		return nil;
	elseif not l_v12_FirstChild_1 or not l_v12_FirstChild_2 then
		return nil;
	elseif not l_v12_FirstChild_3 or not l_v13_FirstChild_1 then
		return nil;
	else
		local l_Magnitude_0 = (l_v12_FirstChild_2.WorldPosition - l_v12_FirstChild_3.WorldPosition).Magnitude;
		local l_Magnitude_1 = (l_v13_FirstChild_1.WorldPosition - l_v14_FirstChild_0.WorldPosition).Magnitude;
		local v24 = l_v12_FirstChild_1.WorldCFrame:ToObjectSpace(l_v12_FirstChild_1.WorldCFrame.Rotation + l_v12_FirstChild_2.WorldPosition);
		local v25 = l_v12_FirstChild_1.WorldCFrame:ToObjectSpace(l_v12_FirstChild_3.WorldCFrame);
		local v26 = l_v13_FirstChild_1.WorldCFrame:ToObjectSpace(l_v14_FirstChild_0.WorldCFrame);
		return {
			upperArm = v12, 
			lowerArm = v13, 
			upperArmLength = l_Magnitude_0, 
			lowerArmLength = l_Magnitude_1, 
			shoulderJoint = l_v12_FirstChild_0, 
			elbowJoint = l_v13_FirstChild_0, 
			shoulderRigToShoulder = v24, 
			shoulderRigToElbowRig = v25, 
			elbowRigToGrip = v26
		};
	end;
end;
v9.createCharacterSubsetFromModel = function(v28) --[[ Line: 71 ]] --[[ Name: createCharacterSubsetFromModel ]]
	-- upvalues: v27 (copy)
	local l_LeftUpperArm_0 = v28:FindFirstChild("LeftUpperArm");
	local l_LeftLowerArm_0 = v28:FindFirstChild("LeftLowerArm");
	local l_LeftHand_0 = v28:FindFirstChild("LeftHand");
	local v32 = nil;
	if l_LeftUpperArm_0 and l_LeftLowerArm_0 and l_LeftHand_0 then
		v32 = v27("Left", l_LeftUpperArm_0, l_LeftLowerArm_0, l_LeftHand_0);
	end;
	local l_RightUpperArm_0 = v28:FindFirstChild("RightUpperArm");
	local l_RightLowerArm_0 = v28:FindFirstChild("RightLowerArm");
	local l_RightHand_0 = v28:FindFirstChild("RightHand");
	local v36 = nil;
	if l_RightUpperArm_0 and l_RightLowerArm_0 and l_RightHand_0 then
		v36 = v27("Right", l_RightUpperArm_0, l_RightLowerArm_0, l_RightHand_0);
	end;
	return {
		characterModel = v28, 
		leftArm = v32, 
		rightArm = v36
	};
end;
local function v49(v37) --[[ Line: 96 ]] --[[ Name: sharedOnCarEntered ]]
	-- upvalues: v9 (copy)
	if not v37.initialized then
		return;
	else
		local l_driver_0 = v37.initialized.driver;
		if not l_driver_0 then
			return;
		else
			local l_Character_0 = l_driver_0.player.Character;
			if not l_Character_0 then
				return;
			else
				l_driver_0.characterSubset = v9.createCharacterSubsetFromModel(l_Character_0);
				local l_engineSounds_0 = v37.shared.engineSounds;
				local l_driftSounds_0 = v37.shared.driftSounds;
				local l_exhaustParticles_0 = v37.shared.exhaustParticles;
				for _, v44 in pairs(l_engineSounds_0) --[[ 2021 ]] do
					v44.sound.Looped = true;
					v44.sound:Play();
					v44.sound.PlaybackSpeed = v44.minPlaybackSpeed;
				end;
				for _, v46 in pairs(l_driftSounds_0) --[[ 2021 ]] do
					v46.sound.Looped = true;
					v46.sound.Volume = 0;
					v46.sound:Play();
				end;
				for _, v48 in pairs(l_exhaustParticles_0) --[[ 2021 ]] do
					v48.particle.Enabled = true;
					v48.particle.Rate = v48.minRate;
				end;
				return;
			end;
		end;
	end;
end;
local _ = function(v50) --[[ Line: 133 ]] --[[ Name: sharedOnCarExited ]]
	local l_engineSounds_1 = v50.shared.engineSounds;
	local l_driftSounds_1 = v50.shared.driftSounds;
	local l_exhaustParticles_1 = v50.shared.exhaustParticles;
	for _, v55 in pairs(l_engineSounds_1) --[[ 2021 ]] do
		v55.sound:Stop();
	end;
	for _, v57 in pairs(l_driftSounds_1) --[[ 2021 ]] do
		v57.sound:Stop();
	end;
	for _, v59 in pairs(l_exhaustParticles_1) --[[ 2021 ]] do
		v59.particle.Enabled = false;
	end;
end;
local function _(v61, v62) --[[ Line: 149 ]] --[[ Name: setLightEffectIsEnabled ]]
	v61.Enabled = v62;
end;
local function v68(v64, v65) --[[ Line: 152 ]] --[[ Name: setLightEffectsAreEnabled ]]
	for _, v67 in pairs(v64) --[[ 2021 ]] do
		if v67:IsA("SurfaceLight") or v67:IsA("Beam") then
			v67.Enabled = v65;
		end;
	end;
end;
local function _(v69, v70) --[[ Line: 160 ]] --[[ Name: setLightPartIsEnabled ]]
	-- upvalues: v68 (copy)
	if v70 then
		v69.Material = Enum.Material.Neon;
	else
		v69.Material = Enum.Material.SmoothPlastic;
	end;
	v68(v69:GetChildren(), v70);
end;
local _ = function(v72, v73) --[[ Line: 169 ]] --[[ Name: setBrakeLightsAreEnabled ]]
	-- upvalues: v68 (copy)
	if not v72.initialized then
		return;
	else
		v72.initialized.brakeLightsAreEnabled = v73;
		local _ = v72.shared;
		for _, v76 in pairs(v72.shared.reverseLightParts) --[[ 2021 ]] do
			if v73 then
				v76.Material = Enum.Material.Neon;
			else
				v76.Material = Enum.Material.SmoothPlastic;
			end;
			v68(v76:GetChildren(), v73);
		end;
		return;
	end;
end;
v9.onCarEntered = function(v78) --[[ Line: 181 ]] --[[ Name: onCarEntered ]]
	-- upvalues: v49 (copy), v68 (copy), l_Follow_0 (copy)
	if not v78.initialized then
		return;
	else
		v49(v78);
		local l_shared_1 = v78.shared;
		local l_Attachment0_0 = l_shared_1.driveVectorForce.Attachment0;
		local l_chassisPart_0 = l_shared_1.chassisPart;
		local l_AlignOrientation_0 = Instance.new("AlignOrientation");
		l_AlignOrientation_0.Name = "LocalAlignOrientation";
		l_AlignOrientation_0.Attachment0 = l_Attachment0_0;
		l_AlignOrientation_0.Mode = Enum.OrientationAlignmentMode.OneAttachment;
		l_AlignOrientation_0.CFrame = CFrame.identity;
		l_AlignOrientation_0.Enabled = false;
		l_AlignOrientation_0.MaxTorque = 1e999;
		l_AlignOrientation_0.MaxAngularVelocity = 1e999;
		l_AlignOrientation_0.RigidityEnabled = false;
		l_AlignOrientation_0.Responsiveness = 35;
		l_AlignOrientation_0.Parent = l_chassisPart_0;
		v78.initialized.alignOrientation = l_AlignOrientation_0;
		if v78.initialized then
			v78.initialized.brakeLightsAreEnabled = false;
			local _ = v78.shared;
			for _, v85 in pairs(v78.shared.reverseLightParts) --[[ 2021 ]] do
				v85.Material = Enum.Material.SmoothPlastic;
				v68(v85:GetChildren(), false);
			end;
		end;
		local l_CurrentCamera_0 = workspace.CurrentCamera;
		if l_CurrentCamera_0 then
			l_CurrentCamera_0.CameraType = l_Follow_0;
		end;
		return;
	end;
end;
v9.onCarExited = function(v87) --[[ Line: 212 ]] --[[ Name: onCarExited ]]
	-- upvalues: v68 (copy), l_Follow_0 (copy)
	if not v87.initialized then
		return;
	else
		if v87.initialized then
			v87.initialized.brakeLightsAreEnabled = false;
			local _ = v87.shared;
			for _, v90 in pairs(v87.shared.reverseLightParts) --[[ 2021 ]] do
				v90.Material = Enum.Material.SmoothPlastic;
				v68(v90:GetChildren(), false);
			end;
		end;
		if v87.initialized.alignOrientation then
			v87.initialized.alignOrientation:Destroy();
			v87.initialized.alignOrientation = nil;
		end;
		local l_CurrentCamera_1 = workspace.CurrentCamera;
		if l_CurrentCamera_1 and l_CurrentCamera_1.CameraType == l_Follow_0 then
			l_CurrentCamera_1.CameraType = Enum.CameraType.Custom;
		end;
		return;
	end;
end;
v9.bystanderOnCarEntered = function(v92) --[[ Line: 230 ]] --[[ Name: bystanderOnCarEntered ]]
	-- upvalues: v49 (copy)
	v49(v92);
end;
v9.bystanderOnCarExited = function(_) --[[ Line: 234 ]] --[[ Name: bystanderOnCarExited ]]

end;
local function _(v94, v95, v96) --[[ Line: 238 ]] --[[ Name: getForceForGravity ]]
	return v94 * v95 * (v95 - v96) / v95;
end;
local function _(v98, v99) --[[ Line: 242 ]] --[[ Name: safeSteer ]]
	return v99 * (1 - math.min(v98, 110) / 128);
end;
local l_Dot_0 = Vector3.zero.Dot;
local function _(v102, v103, v104, v105) --[[ Line: 247 ]] --[[ Name: linePlaneInter ]]
	-- upvalues: l_Dot_0 (copy)
	local v106 = l_Dot_0(v102 - v104, v103) / l_Dot_0(v105.Unit, v103);
	return v104 + v105.Unit * v106;
end;
local v108 = CFrame.Angles(1.5707963267948966, 0, 0);
local function _(v109, v110, v111) --[[ Line: 254 ]] --[[ Name: getRotationForPivotPoint ]]
	local v112 = v110 - v109;
	local v113 = v111 - v109;
	return v112:Cross(v113).Unit, -v112:Angle(v113);
end;
local function v146(v115, v116, v117) --[[ Line: 260 ]] --[[ Name: armIk ]]
	-- upvalues: v108 (copy), v4 (copy)
	local l_shoulderJoint_0 = v115.shoulderJoint;
	local _ = v115.upperArm;
	local l_Part0_0 = l_shoulderJoint_0.Part0;
	if not l_Part0_0 then
		return;
	else
		local v121 = l_Part0_0.CFrame * l_shoulderJoint_0.C0;
		local v122 = v116 - v121.Position;
		local v123 = v121:VectorToObjectSpace(v116 - v121.Position);
		local v124 = v121:PointToObjectSpace((v121 * v115.shoulderRigToShoulder).Position);
		local v125 = math.asin(v124.X / v122.Magnitude);
		local v126 = v121 * (CFrame.lookAt(Vector3.new(0, 0, 0, 0), v123.Unit) * CFrame.Angles(0, 0, v117) * CFrame.Angles(0, v125, 0)) * v108;
		local v127 = v126 * CFrame.new(v124.X, 0, 0);
		local _ = v126 * CFrame.new(v124.X, 0, v124.Z);
		local v129 = v115.upperArmLength - v124.Y;
		local l_Magnitude_2 = (v116 - v127.Position).Magnitude;
		local v131, v132 = v4.solve2d(l_Magnitude_2, v129, v115.lowerArmLength);
		if v131 ~= v131 or v132 ~= v132 then
			return;
		else
			v126 = v126 * CFrame.Angles(-v131, 0, 0);
			local v133 = v126 * CFrame.new(v124.X, 0, 0) * CFrame.new(0, -v129, 0);
			local v134 = v126 * v115.shoulderRigToElbowRig;
			local l_Position_0 = v126.Position;
			local l_Position_1 = v133.Position;
			local l_Position_2 = v134.Position;
			local v138 = l_Position_1 - l_Position_0;
			local v139 = l_Position_2 - l_Position_0;
			local l_Unit_0 = v138:Cross(v139).Unit;
			local v141 = -v138:Angle(v139);
			l_Position_0 = CFrame.fromAxisAngle(v126:VectorToObjectSpace(l_Unit_0), v141);
			if l_Position_0 == l_Position_0 then
				v126 = v126 * l_Position_0;
			end;
			l_Unit_0 = v126 * v115.shoulderRigToElbowRig;
			v141 = v133;
			l_Position_0 = v133 * CFrame.Angles(3.141592653589793 - v132, 0, 0) * CFrame.new(0, -v115.lowerArmLength, 0);
			l_Position_1 = v133 * v115.elbowRigToGrip;
			v139 = v133.Position;
			local l_Position_3 = l_Position_0.Position;
			local l_Position_4 = l_Position_1.Position;
			local v144 = l_Position_3 - v139;
			local v145 = l_Position_4 - v139;
			l_Position_2 = v144:Cross(v145).Unit;
			v138 = -v144:Angle(v145);
			v139 = CFrame.fromAxisAngle(v133:VectorToObjectSpace(l_Position_2), v138);
			if v139 == v139 then
				v133 = v133 * v139;
			end;
			l_Position_2 = v121.Rotation:ToObjectSpace(v126.Rotation).Rotation;
			v139 = (v121.Rotation * l_Position_2 * v115.shoulderRigToElbowRig).Rotation:ToObjectSpace(v133.Rotation).Rotation;
			v115.shoulderJoint.Transform = l_Position_2;
			v115.elbowJoint.Transform = v139;
			return;
		end;
	end;
end;
local function _(v147, v148, v149, v150) --[[ Line: 324 ]] --[[ Name: steeringWheelIK ]]
	-- upvalues: v146 (copy)
	local l_leftArm_0 = v147.leftArm;
	local l_rightArm_0 = v147.rightArm;
	if l_leftArm_0 then
		v146(l_leftArm_0, v148, v150);
	end;
	if l_rightArm_0 then
		v146(l_rightArm_0, v149, v150);
	end;
end;
local function v163(v154, v155, v156) --[[ Line: 337 ]] --[[ Name: calculateTargetSteeringAngle ]]
	if not v154.initialized then
		return 0;
	else
		local l_chassisPart_1 = v154.shared.chassisPart;
		local _ = v154.initialized.wheelRotations;
		local l_AssemblyLinearVelocity_0 = l_chassisPart_1.AssemblyLinearVelocity;
		local v160 = l_chassisPart_1.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_0);
		local v161 = v155 * 0.5235987755982988;
		if not v156 then
			local v162 = math.abs(v160.Z);
			v161 = v161 * (math.abs(v155) * (1 - math.min(v162, 110) / 128));
		end;
		return v161;
	end;
end;
v9.calculateTargetSteeringAngle = v163;
local function _(v164, v165, v166) --[[ Line: 357 ]] --[[ Name: updateSteeringAngle ]]
	return v165 + (v166 - v165) * math.min(v164, 0.16666666666666666) * 6;
end;
local _ = function(v168, v169) --[[ Line: 362 ]] --[[ Name: curveLookup ]]
	local v170 = nil;
	for _, v172 in pairs(v168) --[[ 2021 ]] do
		local v173 = v172[1];
		local v174 = v172[2];
		if v173 == v169 then
			return v174;
		elseif v173 < v169 then
			v170 = v174;
		else
			return v170;
		end;
	end;
	return v170;
end;
local _ = function(v176) --[[ Line: 379 ]] --[[ Name: getEngineThrust ]]
	local l_shared_4 = v176.shared;
	local l_chassisPart_2 = l_shared_4.chassisPart;
	local l_AssemblyLinearVelocity_1 = l_chassisPart_2.AssemblyLinearVelocity;
	local v180 = l_chassisPart_2.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_1);
	local v181 = v180.Z > 0;
	local v182 = math.abs(v180.Z);
	if v181 then
		local l_reverseEngineThrustCurve_0 = l_shared_4.reverseEngineThrustCurve;
		local v184 = nil;
		for _, v186 in pairs(l_reverseEngineThrustCurve_0) --[[ 2021 ]] do
			local v187 = v186[1];
			local v188 = v186[2];
			if v187 == v182 then
				return v188;
			elseif v187 < v182 then
				v184 = v188;
			else
				return v184;
			end;
		end;
		return v184;
	else
		local l_forwardEngineThrustCurve_0 = l_shared_4.forwardEngineThrustCurve;
		local v190 = nil;
		for _, v192 in pairs(l_forwardEngineThrustCurve_0) --[[ 2021 ]] do
			local v193 = v192[1];
			local v194 = v192[2];
			if v193 == v182 then
				return v194;
			elseif v193 < v182 then
				v190 = v194;
			else
				return v190;
			end;
		end;
		return v190;
	end;
end;
v9.setLightsAreEnabled = function(v196, v197) --[[ Line: 396 ]] --[[ Name: setLightsAreEnabled ]]
	-- upvalues: v68 (copy)
	local l_shared_5 = v196.shared;
	local l_frontLightParts_0 = l_shared_5.frontLightParts;
	local l_tailLightParts_0 = l_shared_5.tailLightParts;
	for _, v202 in pairs(l_frontLightParts_0) --[[ 2021 ]] do
		if v197 then
			v202.Material = Enum.Material.Neon;
		else
			v202.Material = Enum.Material.SmoothPlastic;
		end;
		v68(v202:GetChildren(), v197);
	end;
	for _, v204 in pairs(l_tailLightParts_0) --[[ 2021 ]] do
		if v197 then
			v204.Material = Enum.Material.Neon;
		else
			v204.Material = Enum.Material.SmoothPlastic;
		end;
		v68(v204:GetChildren(), v197);
	end;
end;
local _ = function(v205, v206) --[[ Line: 407 ]] --[[ Name: setReverseLightsAreEnabled ]]
	-- upvalues: v68 (copy)
	for _, v208 in pairs(v205.shared.reverseLightParts) --[[ 2021 ]] do
		if v206 then
			v208.Material = Enum.Material.Neon;
		else
			v208.Material = Enum.Material.SmoothPlastic;
		end;
		v68(v208:GetChildren(), v206);
	end;
end;
local function v232(_, v211) --[[ Line: 415 ]] --[[ Name: preSimulationShared ]]
	-- upvalues: v146 (copy)
	if not v211.initialized then
		return;
	else
		local l_shared_6 = v211.shared;
		local l_steeringWheel_0 = l_shared_6.steeringWheel;
		if l_steeringWheel_0 then
			local l_steeringAngle_0 = l_shared_6.steeringAngle;
			local l_weld_0 = l_steeringWheel_0.weld;
			local v216 = 1.65 * l_steeringAngle_0;
			l_weld_0.C0 = CFrame.Angles(0, 0, -v216);
			local l_leftHandAttachment_0 = l_steeringWheel_0.leftHandAttachment;
			local l_rightHandAttachment_0 = l_steeringWheel_0.rightHandAttachment;
			local l_driver_1 = v211.initialized.driver;
			local v220 = l_driver_1 and l_driver_1.characterSubset;
			if v220 and l_leftHandAttachment_0 and l_rightHandAttachment_0 then
				local l_WorldPosition_0 = l_leftHandAttachment_0.WorldPosition;
				local l_WorldPosition_1 = l_rightHandAttachment_0.WorldPosition;
				local l_leftArm_1 = v220.leftArm;
				local l_rightArm_1 = v220.rightArm;
				if l_leftArm_1 then
					v146(l_leftArm_1, l_WorldPosition_0, v216);
				end;
				if l_rightArm_1 then
					v146(l_rightArm_1, l_WorldPosition_1, v216);
				end;
			end;
		end;
		local l_Magnitude_3 = v211.shared.chassisPart.AssemblyLinearVelocity.Magnitude;
		for _, v227 in pairs(v211.shared.engineSounds) --[[ 2021 ]] do
			local v228 = math.max(math.min(l_Magnitude_3, v227.maxVel) - v227.minVel, 0);
			v227.sound.PlaybackSpeed = v227.minPlaybackSpeed + v228 / (v227.maxVel - v227.minVel) * (v227.maxPlaybackSpeed - v227.minPlaybackSpeed);
		end;
		for _, v230 in pairs(v211.shared.exhaustParticles) --[[ 2021 ]] do
			local v231 = math.max(math.min(l_Magnitude_3, v230.maxVel) - v230.minVel, 0);
			v230.particle.Rate = v230.minRate + v231 / (v230.maxVel - v230.minVel) * (v230.maxRate - v230.minRate);
		end;
		return;
	end;
end;
local _ = function(_) --[[ Line: 451 ]] --[[ Name: preSimulationWheelShared ]]

end;
local function v239(v235, v236) --[[ Line: 455 ]] --[[ Name: setDriftSoundsAreEnabled ]]
	for _, v238 in pairs(v235) --[[ 2021 ]] do
		if v236 then
			if v238.volume ~= v238.sound.Volume then
				v238.sound.Volume = v238.volume;
			end;
		elseif v238.sound.Volume ~= 0 then
			v238.sound.Volume = 0;
		end;
	end;
end;
v9.preSimulation = function(v240, v241) --[[ Line: 469 ]] --[[ Name: preSimulation ]]
	-- upvalues: v163 (copy), v6 (copy), v239 (copy), v68 (copy), v232 (copy)
	local v242 = false;
	if not v241.initialized then
		return;
	else
		local l_initialized_0 = v241.initialized;
		local l_shared_7 = v241.shared;
		local l_chassisPart_3 = l_shared_7.chassisPart;
		local l_AssemblyLinearVelocity_2 = l_chassisPart_3.AssemblyLinearVelocity;
		local v247 = l_chassisPart_3.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_2);
		local l_steeringAngle_1 = l_shared_7.steeringAngle;
		local l_isHandbrakeEngaged_0 = l_initialized_0.isHandbrakeEngaged;
		local v250 = false;
		local v251 = v163(v241, l_initialized_0.steer, l_isHandbrakeEngaged_0);
		local l_l_steeringAngle_1_0 = l_steeringAngle_1;
		l_steeringAngle_1 = l_l_steeringAngle_1_0 + (v251 - l_l_steeringAngle_1_0) * math.min(v240, 0.16666666666666666) * 6;
		l_shared_7.steeringAngle = l_steeringAngle_1;
		l_initialized_0.lastWasThrottling = l_initialized_0.throttle > 0;
		l_l_steeringAngle_1_0 = CFrame.Angles(0, l_steeringAngle_1, 0);
		local v253 = math.sign(v247.Z);
		local v254 = nil;
		if l_initialized_0.throttle ~= 0 and v253 ~= -math.sign(l_initialized_0.throttle) then
			local _ = math.abs(l_initialized_0.throttle);
			v254 = v253 * l_shared_7.brakeForce;
		else
			local l_shared_8 = v241.shared;
			local l_chassisPart_4 = l_shared_8.chassisPart;
			local l_AssemblyLinearVelocity_3 = l_chassisPart_4.AssemblyLinearVelocity;
			local v259 = l_chassisPart_4.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_3);
			local v260 = v259.Z > 0;
			local v261 = math.abs(v259.Z);
			local v262;
			if v260 then
				local l_reverseEngineThrustCurve_1 = l_shared_8.reverseEngineThrustCurve;
				local v264 = nil;
				for _, v266 in pairs(l_reverseEngineThrustCurve_1) --[[ 2021 ]] do
					local v267 = v266[1];
					local v268 = v266[2];
					if v267 == v261 then
						v262 = v268;
						v242 = true;
					elseif v267 < v261 then
						v264 = v268;
					else
						v262 = v264;
						v242 = true;
					end;
					if v242 then
						break;
					end;
					if v242 then
						break;
					end;
				end;
				if not v242 then
					if not v242 then
						v262 = v264;
					end;
				end;
			else
				local l_forwardEngineThrustCurve_1 = l_shared_8.forwardEngineThrustCurve;
				local v270 = nil;
				for _, v272 in pairs(l_forwardEngineThrustCurve_1) --[[ 2021 ]] do
					local v273 = v272[1];
					local v274 = v272[2];
					if v273 == v261 then
						v262 = v274;
						v242 = true;
					elseif v273 < v261 then
						v270 = v274;
					else
						v262 = v270;
						v242 = true;
					end;
					if v242 then
						break;
					end;
					if v242 then
						break;
					end;
				end;
				if not v242 then
					if not v242 then
						v262 = v270;
					end;
				end;
			end;
			v242 = false;
			v254 = (v262 or 0) * l_initialized_0.throttle;
		end;
		local l_wheelRotations_1 = l_initialized_0.wheelRotations;
		local l_wheelRaycastParams_0 = l_initialized_0.wheelRaycastParams;
		local l_wheelSuspensionHeights_0 = l_initialized_0.wheelSuspensionHeights;
		local l_driftFrictionMultiplier_0 = l_initialized_0.driftFrictionMultiplier;
		l_driftFrictionMultiplier_0 = l_initialized_0.isHandbrakeEngaged and 1 or l_driftFrictionMultiplier_0 + -l_driftFrictionMultiplier_0 * math.min(v240, 0.6666666666666666) * 1.5;
		l_initialized_0.driftFrictionMultiplier = l_driftFrictionMultiplier_0;
		for v279, v280 in pairs(l_shared_7.wheelRecords) --[[ 2021 ]] do
			local v281 = v6.getWheelRaycastResult(l_chassisPart_3, v280, l_wheelRaycastParams_0);
			local v282 = v6.getWheelRaycastDistance(l_chassisPart_3, v280, l_wheelRaycastParams_0);
			local v283 = v6.getWheelSuspensionForce(l_chassisPart_3, v280, v282);
			v280.suspensionVectorForce.Force = v283;
			local _ = v280.suspensionSpringAttachment;
			l_wheelSuspensionHeights_0[v279] = v282;
			local l_driftTrailPart_0 = v280.driftTrailPart;
			local l_driftTrail_0 = v280.driftTrail;
			if v282 < v280.suspensionSpringTargetHeight then
				local v287 = v6.getWheelCF(v280.suspensionSpringAttachment.WorldCFrame, v282);
				if v280.isTurnWheel then
					v287 = v287 * l_l_steeringAngle_1_0;
				end;
				v280.currentLateralResistance = v280.lateralResistance + l_driftFrictionMultiplier_0 * (v280.minLateralResistance - v280.lateralResistance);
				local v288 = v6.getWheelForce(l_chassisPart_3, v280, v287, v283, v281.Normal);
				if v280.isDriveWheel then
					v288 = v288 + v287.LookVector * v254;
				end;
				v280.vectorForce.Force = v288;
				local v289 = v6.getVelocityAtPoint(l_chassisPart_3, v287.Position);
				local v290 = -l_chassisPart_3.CFrame.LookVector:Dot(v289) * v240;
				l_wheelRotations_1[v279] = (l_wheelRotations_1[v279] + v290 / v280.wheelRadius) % 6.283185307179586;
				if l_driftTrailPart_0 and l_driftTrail_0 then
					if math.abs((v287.RightVector:Dot(v289))) > 12 then
						l_driftTrail_0.Enabled = true;
						v250 = true;
					else
						l_driftTrail_0.Enabled = false;
					end;
				end;
			else
				if l_driftTrailPart_0 and l_driftTrail_0 and l_driftTrail_0.Enabled ~= false then
					l_driftTrail_0.Enabled = false;
				end;
				v280.vectorForce.Force = Vector3.new(0, 0, 0, 0);
			end;
		end;
		if v250 then
			v239(v241.shared.driftSounds, true);
		else
			v239(v241.shared.driftSounds, false);
		end;
		local l_UpVector_0 = l_chassisPart_3.CFrame.UpVector;
		local v292 = l_chassisPart_3.AssemblyMass * workspace.Gravity * Vector3.new(-0, -1, -0, -0);
		local _ = v292 - v292:Dot(l_UpVector_0) * l_UpVector_0;
		local v294 = v6.getForceToReachGravity(l_shared_7.targetGravity, workspace.Gravity, l_chassisPart_3.AssemblyMass);
		l_shared_7.centerOfMassForce.Force = Vector3.new(0, 1, 0, 0) * v294;
		local v295 = l_initialized_0.throttle == -1;
		if v295 and l_initialized_0.brakeLightsAreEnabled == false then
			if v241.initialized then
				v241.initialized.brakeLightsAreEnabled = true;
				local _ = v241.shared;
				for _, v298 in pairs(v241.shared.reverseLightParts) --[[ 2021 ]] do
					v298.Material = Enum.Material.Neon;
					v68(v298:GetChildren(), true);
				end;
			end;
		elseif not v295 and l_initialized_0.brakeLightsAreEnabled == true and v241.initialized then
			v241.initialized.brakeLightsAreEnabled = false;
			local _ = v241.shared;
			for _, v301 in pairs(v241.shared.reverseLightParts) --[[ 2021 ]] do
				v301.Material = Enum.Material.SmoothPlastic;
				v68(v301:GetChildren(), false);
			end;
		end;
		v232(v240, v241);
		return;
	end;
end;
local function _(v302, v303, v304, v305) --[[ Line: 593 ]] --[[ Name: getWheelBaseCF ]]
	return v302 + v303 - v302.UpVector * (v304 - v305);
end;
v9.preRender = function(v307) --[[ Line: 597 ]] --[[ Name: preRender ]]
	-- upvalues: v9 (copy)
	v9.bystanderPreRender(v307);
end;
v9.bystanderPreRender = function(v308) --[[ Line: 601 ]] --[[ Name: bystanderPreRender ]]
	local l_initialized_1 = v308.initialized;
	if not l_initialized_1 then
		return;
	else
		local l_shared_11 = v308.shared;
		local l_Rotation_0 = l_shared_11.chassisPart.CFrame.Rotation;
		local _ = -l_Rotation_0.UpVector;
		local l_wheelRotations_2 = l_initialized_1.wheelRotations;
		local l_wheelSuspensionHeights_1 = l_initialized_1.wheelSuspensionHeights;
		local v315 = CFrame.Angles(0, l_shared_11.steeringAngle, 0);
		for v316, v317 in pairs(l_shared_11.wheelRecords) --[[ 2021 ]] do
			local l_suspensionSpringAttachment_1 = v317.suspensionSpringAttachment;
			local l_wheelRadius_0 = v317.wheelRadius;
			local l_WorldPosition_2 = l_suspensionSpringAttachment_1.WorldPosition;
			local _ = v317.suspensionSpringTargetHeight;
			local l_model_0 = v317.model;
			local v323 = l_wheelSuspensionHeights_1[v316];
			local v324 = l_Rotation_0 + l_WorldPosition_2 - l_Rotation_0.UpVector * (v323 - l_wheelRadius_0);
			if v317.isTurnWheel then
				v324 = v324 * v315;
			end;
			l_model_0:PivotTo(v324 * CFrame.Angles(l_wheelRotations_2[v316], 0, 0));
			local l_driftTrailPart_1 = v317.driftTrailPart;
			if l_driftTrailPart_1 then
				l_driftTrailPart_1.CFrame = l_suspensionSpringAttachment_1.WorldCFrame - l_suspensionSpringAttachment_1.WorldCFrame.UpVector * (v323 - 0.1);
			end;
		end;
		return;
	end;
end;
local function _(v326) --[[ Line: 643 ]] --[[ Name: getSteeringAngle ]]
	local l_chassisPart_5 = v326.shared.chassisPart;
	local l_wheelBase_0 = v326.shared.wheelBase;
	local l_AssemblyAngularVelocity_0 = l_chassisPart_5.AssemblyAngularVelocity;
	local v330 = l_chassisPart_5.AssemblyLinearVelocity:Dot(l_chassisPart_5.CFrame.LookVector);
	local v331 = math.asin(l_AssemblyAngularVelocity_0.Y * l_wheelBase_0 / v330);
	if v331 ~= v331 then
		return 0;
	else
		return (math.clamp(v331, -v326.shared.maxSteeringAngle, v326.shared.maxSteeringAngle));
	end;
end;
v9.bystanderPreSimulation = function(v333, v334) --[[ Line: 656 ]] --[[ Name: bystanderPreSimulation ]]
	-- upvalues: v6 (copy), v239 (copy), v68 (copy), v232 (copy)
	local l_initialized_2 = v334.initialized;
	if not l_initialized_2 then
		return;
	else
		local l_shared_12 = v334.shared;
		local l_steeringAngle_2 = l_shared_12.steeringAngle;
		local l_steeringAngle_3 = l_shared_12.steeringAngle;
		local l_chassisPart_6 = v334.shared.chassisPart;
		local l_wheelBase_1 = v334.shared.wheelBase;
		local l_AssemblyAngularVelocity_1 = l_chassisPart_6.AssemblyAngularVelocity;
		local v342 = l_chassisPart_6.AssemblyLinearVelocity:Dot(l_chassisPart_6.CFrame.LookVector);
		local v343 = math.asin(l_AssemblyAngularVelocity_1.Y * l_wheelBase_1 / v342);
		l_shared_12.steeringAngle = l_steeringAngle_3 + ((v343 ~= v343 and 0 or math.clamp(v343, -v334.shared.maxSteeringAngle, v334.shared.maxSteeringAngle)) - l_shared_12.steeringAngle) * math.min(v333, 0.16666666666666666) * 6;
		l_steeringAngle_3 = CFrame.Angles(0, l_steeringAngle_2, 0);
		local v344 = false;
		local l_chassisPart_7 = l_shared_12.chassisPart;
		local l_CFrame_0 = l_chassisPart_7.CFrame;
		l_chassisPart_6 = -l_CFrame_0.Rotation.UpVector;
		l_wheelBase_1 = l_CFrame_0.Position;
		l_AssemblyAngularVelocity_1 = l_chassisPart_7.AssemblyLinearVelocity;
		v342 = -l_CFrame_0.LookVector:Dot(l_AssemblyAngularVelocity_1) * v333;
		v343 = l_initialized_2.wheelRaycastParams;
		local l_wheelRotations_3 = l_initialized_2.wheelRotations;
		local l_wheelSuspensionHeights_2 = l_initialized_2.wheelSuspensionHeights;
		for v349, v350 in pairs(l_shared_12.wheelRecords) --[[ 2021 ]] do
			local l_suspensionSpringAttachment_2 = v350.suspensionSpringAttachment;
			local _ = v350.wheelRadius;
			local l_WorldPosition_3 = l_suspensionSpringAttachment_2.WorldPosition;
			local l_suspensionSpringTargetHeight_1 = v350.suspensionSpringTargetHeight;
			local _ = v350.model;
			local v356 = workspace:Raycast(l_WorldPosition_3, l_chassisPart_6 * l_suspensionSpringTargetHeight_1, v343);
			local v357 = nil;
			v357 = __2021_if(function() return v356 end, function() return v356.Distance end, function() return l_suspensionSpringTargetHeight_1 end);
			l_wheelSuspensionHeights_2[v349] = v357;
			l_wheelRotations_3[v349] = (l_wheelRotations_3[v349] + v342 / v350.wheelRadius) % 6.283185307179586;
			local _ = v350.driftTrailPart;
			local l_driftTrail_1 = v350.driftTrail;
			if v357 == l_suspensionSpringTargetHeight_1 then
				if l_driftTrail_1.Enabled ~= false then
					l_driftTrail_1.Enabled = false;
				end;
			else
				local v360 = v6.getWheelCF(l_suspensionSpringAttachment_2.WorldCFrame, v357) * l_steeringAngle_3;
				local v361 = v6.getVelocityAtPoint(l_chassisPart_7, v360.Position);
				if math.abs((v360.RightVector:Dot(v361))) > 25 then
					v344 = true;
					if l_driftTrail_1.Enabled ~= true then
						l_driftTrail_1.Enabled = true;
					end;
				elseif l_driftTrail_1.Enabled ~= false then
					l_driftTrail_1.Enabled = false;
				end;
			end;
		end;
		if v344 then
			v239(v334.shared.driftSounds, true);
		else
			v239(v334.shared.driftSounds, false);
		end;
		local v362 = l_chassisPart_7.CFrame.LookVector:Dot(l_AssemblyAngularVelocity_1);
		local l_lastLongVelocity_0 = l_initialized_2.lastLongVelocity;
		l_initialized_2.lastLongVelocity = v362;
		local v364 = false;
		if v362 < l_lastLongVelocity_0 and math.abs(l_lastLongVelocity_0 - v362) > 1 then
			v364 = true;
		end;
		if v362 < 0 and math.abs(l_lastLongVelocity_0 - v362) < 2 then
			v364 = true;
		end;
		if v364 then
			if l_initialized_2.brakeLightsAreEnabled == false and v334.initialized then
				v334.initialized.brakeLightsAreEnabled = true;
				local _ = v334.shared;
				for _, v367 in pairs(v334.shared.reverseLightParts) --[[ 2021 ]] do
					v367.Material = Enum.Material.Neon;
					v68(v367:GetChildren(), true);
				end;
			end;
		elseif l_initialized_2.brakeLightsAreEnabled == true and v334.initialized then
			v334.initialized.brakeLightsAreEnabled = false;
			local _ = v334.shared;
			for _, v370 in pairs(v334.shared.reverseLightParts) --[[ 2021 ]] do
				v370.Material = Enum.Material.SmoothPlastic;
				v68(v370:GetChildren(), false);
			end;
		end;
		v232(v333, v334);
		return;
	end;
end;
v9.throttleSignChanged = function(v371) --[[ Line: 765 ]] --[[ Name: throttleSignChanged ]]
	-- upvalues: v68 (copy)
	local l_initialized_3 = v371.initialized;
	if not l_initialized_3 then
		return;
	else
		local v373 = math.sign(l_initialized_3.throttle) == -1;
		if not v371.initialized then
			return;
		else
			v371.initialized.brakeLightsAreEnabled = v373;
			local _ = v371.shared;
			for _, v376 in pairs(v371.shared.reverseLightParts) --[[ 2021 ]] do
				if v373 then
					v376.Material = Enum.Material.Neon;
				else
					v376.Material = Enum.Material.SmoothPlastic;
				end;
				v68(v376:GetChildren(), v373);
			end;
			return;
		end;
	end;
end;
local _ = function(v377) --[[ Line: 775 ]] --[[ Name: getAlignOrientationCFrame ]]
	local _, v379, _ = v377:ToOrientation();
	return CFrame.Angles(0, v379, 0);
end;
v9.makeUpright = function(v382) --[[ Line: 780 ]] --[[ Name: makeUpright ]]
	local l_initialized_4 = v382.initialized;
	if not l_initialized_4 then
		return;
	else
		local l_alignOrientation_0 = l_initialized_4.alignOrientation;
		if not l_alignOrientation_0 then
			print("no align orientation.");
			return;
		else
			local _, v386, _ = v382.shared.chassisPart.CFrame:ToOrientation();
			l_alignOrientation_0.CFrame = CFrame.Angles(0, v386, 0);
			l_alignOrientation_0.Enabled = true;
			task.delay(1, function() --[[ Line: 793 ]]
				-- upvalues: l_alignOrientation_0 (copy)
				if l_alignOrientation_0 then
					l_alignOrientation_0.Enabled = false;
				end;
			end);
			return;
		end;
	end;
end;
return v9;
