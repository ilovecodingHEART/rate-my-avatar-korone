-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule", 500);
local v4 = nil;
if not v3 then
	warn("PlayerModule not found. Jetpack mobile controls are disabled.");
else
	v4 = require(v3);
end;
local l_Shared_0 = l_ReplicatedStorage_0.Slerp.Shared;
local l_Jetpack_0 = l_Shared_0.Jetpack;
local _ = require(l_Jetpack_0.Types);
local v8 = require(l_Jetpack_0.Net);
local v9 = require(l_Shared_0.Signal);
local _ = require(script.Types);
local v11 = require(script.Controller);
local v12 = require(script.Input);
local v13 = {};
local v14 = {};
local v15 = v12.createInputState();
local v16 = nil;
local l_JetpackSound_0 = l_ReplicatedStorage_0.Slerp.Assets.Jetpacks.JetpackSound;
local v18 = {};
local v19 = v9.new();
local v20 = v9.new();
local v21 = v9.new();
local v22 = v9.new();
v18.getJetpackRegisteredSignal = function() --[[ Line: 43 ]] --[[ Name: getJetpackRegisteredSignal ]]
	-- upvalues: v19 (copy)
	return v19;
end;
v18.getJetpackUnregisteredSignal = function() --[[ Line: 47 ]] --[[ Name: getJetpackUnregisteredSignal ]]
	-- upvalues: v20 (copy)
	return v20;
end;
v18.getJetpackEquippedSignal = function() --[[ Line: 50 ]] --[[ Name: getJetpackEquippedSignal ]]
	-- upvalues: v21 (copy)
	return v21;
end;
v18.getJetpackUnequippedSignal = function() --[[ Line: 53 ]] --[[ Name: getJetpackUnequippedSignal ]]
	-- upvalues: v22 (copy)
	return v22;
end;
local function v29(v23, v24) --[[ Line: 59 ]] --[[ Name: collectParticlesUsingDescendants ]]
	for _, v26 in v23:GetDescendants() do
		if v26:IsA("ParticleEmitter") or v26:IsA("Beam") then
			local v27 = v26:GetAttribute("MinThrottle") or 0;
			local v28 = v26:GetAttribute("MaxThrottle") or 1;
			assert(v27 <= v28);
			v26.Enabled = false;
			table.insert(v24, {
				particleEmitter = v26, 
				minThrottle = v27, 
				maxThrottle = v28
			});
		end;
	end;
end;
local _ = function(_) --[[ Line: 77 ]] --[[ Name: setProximityPromptsAreEnabled ]]
	-- upvalues: v13 (copy)
	for _, _ in v13 do

	end;
end;
local function v43(v34, v35, v36) --[[ Line: 83 ]] --[[ Name: setOwner ]]
	-- upvalues: l_LocalPlayer_0 (copy), v16 (ref), v11 (copy), v12 (copy), v15 (copy), v13 (copy), v22 (copy), v21 (copy)
	local l_shared_0 = v34.shared;
	local v38 = if v36 then nil else l_shared_0.owner;
	l_shared_0.owner = v35;
	if v38 then
		if v38 == l_LocalPlayer_0 then
			v16 = nil;
			v11.onJetpackUnequipped(v34);
			v12.onJetpackUnequipped(v15);
			for _, _ in v13 do

			end;
			v22:Fire(v34);
		else
			v11.bystanderOnJetpackUnequipped(v34);
		end;
	end;
	if v35 then
		if v35 == l_LocalPlayer_0 then
			v11.onJetpackEquipped(v34);
			v12.onJetpackEquipped(v15, v34);
			v16 = v34;
			for _, _ in v13 do

			end;
			v21:Fire(v34);
			return;
		else
			v11.bystanderOnJetpackEquipped(v34);
		end;
	end;
end;
local function v62(v44) --[[ Line: 113 ]] --[[ Name: addFromOwnedShared ]]
	-- upvalues: v29 (copy), l_JetpackSound_0 (copy), v13 (copy), v14 (copy), v19 (copy), v43 (copy)
	local l_id_0 = v44.id;
	local _ = {};
	local l_root_0 = v44.root;
	local l_LeftOut_0 = l_root_0:FindFirstChild("LeftOut");
	local l_RightOut_0 = l_root_0:FindFirstChild("RightOut");
	local v50 = {};
	if l_LeftOut_0 then
		v29(l_LeftOut_0, v50);
	end;
	if l_RightOut_0 then
		v29(l_RightOut_0, v50);
	end;
	local l_LeftGround_0 = l_root_0:FindFirstChild("LeftGround");
	local l_RightGround_0 = l_root_0:FindFirstChild("RightGround");
	local v53 = {};
	if l_LeftGround_0 then
		v29(l_LeftGround_0, v53);
	end;
	local v54 = {};
	if l_RightGround_0 then
		v29(l_RightGround_0, v54);
	end;
	local l_LeftHand_0 = (v44.model:FindFirstChild("LeftJoystick") or l_root_0):FindFirstChild("LeftHand");
	local l_RightHand_0 = (v44.model:FindFirstChild("RightJoystick") or l_root_0):FindFirstChild("RightHand");
	local v57 = nil;
	local v58 = nil;
	if l_LeftHand_0 then
		v57 = l_LeftHand_0.Position;
	end;
	if l_RightHand_0 then
		v58 = l_RightHand_0.Position;
	end;
	local v59 = l_JetpackSound_0:Clone();
	v59.Parent = l_root_0;
	local v60 = {
		shared = v44, 
		rig = nil, 
		throttle = 0, 
		particles = v50, 
		leftGroundParticles = v53, 
		rightGroundParticles = v54, 
		leftOut = l_LeftOut_0, 
		rightOut = l_RightOut_0, 
		leftGround = l_LeftGround_0, 
		rightGround = l_RightGround_0, 
		originLeftHandPos = v57, 
		originRightHandPos = v58, 
		leftHandPos = v57, 
		rightHandPos = v58, 
		leftHand = l_LeftHand_0, 
		rightHand = l_RightHand_0, 
		jetpackSound = v59, 
		closeToGroundSoundLerpAlpha = 0
	};
	local v61 = #v13 + 1;
	v13[v61] = v60;
	v14[l_id_0] = v61;
	v19:Fire(v60);
	if v60.shared.owner then
		v43(v60, v60.shared.owner, true);
	end;
end;
local function _(v63) --[[ Line: 189 ]] --[[ Name: cleanupJetpack ]]
	-- upvalues: v43 (copy)
	v43(v63, nil);
end;
local function v70(v65) --[[ Line: 193 ]] --[[ Name: removeJetpackFromId ]]
	-- upvalues: v14 (copy), v13 (copy), v43 (copy), v20 (copy), l_LocalPlayer_0 (copy)
	local v66 = v14[v65];
	if not v66 then
		return;
	else
		local v67 = v13[v66];
		if not v67 then
			warn("[FATAL] jetpack id has index associated with it but no jetpack with index exists.");
			return;
		else
			local l_owner_0 = v67.shared.owner;
			v43(v67, nil);
			if v66 == #v13 then
				v13[v66] = nil;
			else
				local v69 = v13[#v13];
				v13[#v13] = nil;
				v13[v66] = v69;
				v14[v69.shared.id] = v66;
			end;
			v14[v65] = nil;
			v20:Fire(v67, l_owner_0 == l_LocalPlayer_0);
			return;
		end;
	end;
end;
local v71 = 1;
v18.setMaxThrottle = function(v72) --[[ Line: 221 ]] --[[ Name: setMaxThrottle ]]
	-- upvalues: v71 (ref), v11 (copy), v16 (ref)
	if v72 > 1 or v72 < 0 then
		return;
	else
		v71 = v72;
		v11._setMaxThrottle(v72);
		if v16 and v72 < v16.throttle then
			v11.setThrottle(v16, v72);
		end;
		return;
	end;
end;
v18.init = function() --[[ Line: 232 ]] --[[ Name: init ]]
	-- upvalues: v8 (copy), v62 (copy), v70 (copy), v14 (copy), v13 (copy), v43 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy), v11 (copy)
	v8.RemoteEvents.AddJetpack.OnClientEvent:Connect(function(v73) --[[ Line: 233 ]]
		-- upvalues: v62 (ref)
		v62(v73);
	end);
	v8.RemoteEvents.AddJetpacks.OnClientEvent:Connect(function(v74) --[[ Line: 236 ]]
		-- upvalues: v62 (ref)
		for _, v76 in v74 do
			v62(v76);
		end;
	end);
	v8.RemoteEvents.RemoveJetpack.OnClientEvent:Connect(function(v77) --[[ Line: 241 ]]
		-- upvalues: v70 (ref)
		v70(v77);
	end);
	v8.RemoteEvents.SetOwner.OnClientEvent:Connect(function(v78, v79) --[[ Line: 244 ]]
		-- upvalues: v14 (ref), v13 (ref), v43 (ref)
		local v80 = v14[v78];
		if not v80 then
			warn("[JETPACK 1]");
			return;
		else
			local v81 = v13[v80];
			if not v81 then
				warn("[JETPACK 2]");
				return;
			else
				v43(v81, v79);
				return;
			end;
		end;
	end);
	l_RunService_0.PreSimulation:Connect(function(v82) --[[ Line: 259 ]]
		-- upvalues: v13 (ref), l_LocalPlayer_0 (ref), v11 (ref)
		for _, v84 in v13 do
			if v84.shared.owner == l_LocalPlayer_0 then
				v11.preSimulation(v82, v84);
			else
				v11.bystanderPreSimulation(v84, v82);
			end;
		end;
	end);
	v11.init();
end;
v18.getJetpackIdFromModel = function(v85) --[[ Line: 273 ]] --[[ Name: getJetpackIdFromModel ]]
	-- upvalues: v13 (copy)
	for _, v87 in v13 do
		if v87.shared.model == v85 then
			return v87.shared.id;
		end;
	end;
	return nil;
end;
table.freeze(v18);
return v18;