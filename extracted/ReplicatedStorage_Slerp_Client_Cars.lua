local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContextActionService");
local _ = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule", 5);
local v8 = nil;
if not v7 then
	warn("PlayerModule not found. Mobile controls are disabled");
else
	v8 = require(v7);
end;
local l_Shared_0 = l_ReplicatedStorage_0.Slerp.Shared;
local l_Car_0 = l_Shared_0.Car;
local _ = require(l_Car_0.Types);
local _ = require(l_Car_0.Simulator);
local v13 = require(l_Car_0.Physics);
local v14 = require(l_Car_0.Net);
local l_RemoteEvents_0 = v14.RemoteEvents;
local v16 = require(l_Shared_0.Signal);
local l_CAR_RAYCAST_COLLISION_GROUP_0 = v13.CAR_RAYCAST_COLLISION_GROUP;
local _ = v13.PLAYER_CHARACTER_COLLISION_GROUP;
local v19 = require(script.Controller);
local _ = require(script.Types);
local v21 = require(script.Input);
local v22 = require(script.Util);
local v23 = {};
local v24 = {
	cars = {}, 
	carIdToIndexMap = {}, 
	ownedCarIds = {}, 
	inputState = v21.createInputState(), 
	isWorking = false, 
	isWorkingChangedSignal = v16.new()
};
local _ = workspace.CurrentCamera;
v23.setLightsAreEnabled = v22.setLightsAreEnabled;
local v26 = v16.new();
local v27 = v16.new();
local v28 = v16.new();
local v29 = v16.new();
v23.getCarRegisteredSignal = function() --[[ Line: 72 ]] --[[ Name: getCarRegisteredSignal ]]
	-- upvalues: v26 (copy)
	return v26;
end;
v23.getCarUnregisteredSignal = function() --[[ Line: 76 ]] --[[ Name: getCarUnregisteredSignal ]]
	-- upvalues: v27 (copy)
	return v27;
end;
v23.getCarInitializedSignal = function() --[[ Line: 80 ]] --[[ Name: getCarInitializedSignal ]]
	-- upvalues: v28 (copy)
	return v28;
end;
v23.getCarDeinitializingSignal = function() --[[ Line: 84 ]] --[[ Name: getCarDeinitializingSignal ]]
	-- upvalues: v29 (copy)
	return v29;
end;
v23.getIsWorkingChangedSignal = function() --[[ Line: 88 ]] --[[ Name: getIsWorkingChangedSignal ]]
	-- upvalues: v24 (copy)
	return v24.isWorkingChangedSignal;
end;
v23.isWorking = function() --[[ Line: 92 ]] --[[ Name: isWorking ]]
	-- upvalues: v24 (copy)
	return v24.isWorking;
end;
local function _(v30) --[[ Line: 96 ]] --[[ Name: setIsWorking ]]
	-- upvalues: v24 (copy)
	if v30 == v24.isWorking then
		return;
	else
		v24.isWorking = v30;
		v24.isWorkingChangedSignal:Fire(v30);
		return;
	end;
end;
local function _(v32) --[[ Line: 104 ]] --[[ Name: getCarFromId ]]
	-- upvalues: v24 (copy)
	local v33 = v24.carIdToIndexMap[v32];
	if not v33 then
		return nil, 0;
	else
		return v24.cars[v33], v33;
	end;
end;
local function v38(v35) --[[ Line: 112 ]] --[[ Name: deinitCar ]]
	-- upvalues: v24 (copy), v23 (copy), v29 (copy)
	local v36 = v24.carIdToIndexMap[v35];
	local v37 = if not v36 then nil else v24.cars[v36];
	if not v37 then
		return;
	else
		v36 = v37.initialized;
		if not v36 then
			return;
		else
			v37.state = "deinitializing";
			if v35 == v24.locallyDrivenCarId then
				v23.setDriver(v35, nil);
			end;
			v36.scriptConnections.destroying:Disconnect();
			v37.initialized = nil;
			v29:Fire(v35);
			v37.state = "inactive";
			return;
		end;
	end;
end;
local function _(v39, v40) --[[ Line: 135 ]] --[[ Name: fastRemove ]]
	local v41 = v39[v40];
	if v40 == #v39 then
		v39[v40] = nil;
		return v41;
	else
		local v42 = v39[#v39];
		v39[#v39] = nil;
		v39[v40] = v42;
		return v41;
	end;
end;
v23.doesCarExist = function(v44) --[[ Line: 147 ]] --[[ Name: doesCarExist ]]
	-- upvalues: v24 (copy)
	local v45 = v24.carIdToIndexMap[v44];
	if if not v45 then nil else v24.cars[v45] then
		return true;
	else
		return false;
	end;
end;
local function _(v46, v47) --[[ Line: 152 ]] --[[ Name: setCarOwner ]]
	-- upvalues: v24 (copy), l_LocalPlayer_0 (copy)
	local v48 = v24.carIdToIndexMap[v46];
	if not if not v48 then nil else v24.cars[v48] then
		return;
	elseif v24.ownedCarIds[v46] then
		if v47 == l_LocalPlayer_0 then
			return;
		else
			v24.ownedCarIds[v46] = nil;
			return;
		end;
	else
		if v47 == l_LocalPlayer_0 then
			v24.ownedCarIds[v46] = true;
		end;
		return;
	end;
end;
v23.getCarOwner = function(v50) --[[ Line: 171 ]] --[[ Name: getCarOwner ]]
	-- upvalues: v24 (copy)
	local v51 = v24.carIdToIndexMap[v50];
	local v52;
	if not v51 then
		v52 = nil;
		local _ = 0;
	else
		v52 = v24.cars[v51];
		local _ = v51;
	end;
	if not v52 then
		return false, nil;
	else
		return true, v52.shared.owner;
	end;
end;
local function v60(v55) --[[ Line: 179 ]] --[[ Name: unregisterCar ]]
	-- upvalues: v24 (copy), v38 (copy), l_LocalPlayer_0 (copy)
	local v56 = v24.carIdToIndexMap[v55];
	local v57, v58;
	if not v56 then
		v57 = nil;
		v58 = 0;
	else
		v57 = v24.cars[v56];
		v58 = v56;
	end;
	if not v57 then
		return nil;
	else
		v38(v55);
		local v59 = v24.carIdToIndexMap[v55];
		if if not v59 then nil else v24.cars[v59] then
			if v24.ownedCarIds[v55] then
				if l_LocalPlayer_0 ~= nil then
					v24.ownedCarIds[v55] = nil;
				end;
			elseif l_LocalPlayer_0 == nil then
				v24.ownedCarIds[v55] = true;
			end;
		end;
		v56 = v24.cars;
		if v58 == #v56 then
			v56[v58] = nil;
		else
			v59 = v56[#v56];
			v56[#v56] = nil;
			v56[v58] = v59;
			v24.carIdToIndexMap[v59.shared.id] = v58;
		end;
		v24.carIdToIndexMap[v55] = nil;
		return v57;
	end;
end;
local function v69(v61) --[[ Line: 201 ]] --[[ Name: initCar ]]
	-- upvalues: l_CAR_RAYCAST_COLLISION_GROUP_0 (copy), v60 (copy), v24 (copy), l_LocalPlayer_0 (copy), v28 (copy)
	v61.state = "initializing";
	local l_shared_0 = v61.shared;
	local v63 = RaycastParams.new();
	v63.FilterType = Enum.RaycastFilterType.Exclude;
	v63.RespectCanCollide = true;
	v63.FilterDescendantsInstances = {
		v61.shared.model
	};
	v63.IgnoreWater = true;
	v63.CollisionGroup = l_CAR_RAYCAST_COLLISION_GROUP_0;
	local v64 = l_shared_0.chassisPart.Destroying:Connect(function() --[[ Line: 212 ]]
		-- upvalues: v60 (ref), l_shared_0 (copy)
		v60(l_shared_0.id);
	end);
	local v65 = #l_shared_0.wheelRecords;
	v61.initialized = {
		scriptConnections = {
			destroying = v64
		}, 
		wheelRaycastParams = v63, 
		wheelSuspensionHeights = table.create(v65, 0), 
		wheelRotations = table.create(v65, 0), 
		steer = 0, 
		throttle = 0, 
		targetSteeringAlpha = 0, 
		driftFrictionMultiplier = 0, 
		isHandbrakeEngaged = false, 
		lightsAreEnabled = false, 
		lastWasThrottling = false, 
		brakeLightsAreEnabled = false, 
		lastLongVelocity = 0
	};
	local l_id_0 = v61.shared.id;
	local l_owner_0 = v61.shared.owner;
	local v68 = v24.carIdToIndexMap[l_id_0];
	if if not v68 then nil else v24.cars[v68] then
		if v24.ownedCarIds[l_id_0] then
			if l_owner_0 ~= l_LocalPlayer_0 then
				v24.ownedCarIds[l_id_0] = nil;
			end;
		elseif l_owner_0 == l_LocalPlayer_0 then
			v24.ownedCarIds[l_id_0] = true;
		end;
	end;
	v61.state = "initialized";
	v28:Fire();
end;
local function v73(v70) --[[ Line: 244 ]] --[[ Name: registerClientCarFromSharedCar ]]
	-- upvalues: v24 (copy), v26 (copy), v69 (copy)
	local v71 = {
		shared = v70, 
		state = "inactive", 
		initialized = nil
	};
	local v72 = #v24.cars + 1;
	v24.cars[v72] = v71;
	v24.carIdToIndexMap[v70.id] = v72;
	v26:Fire(v70.id);
	v69(v71);
end;
local function v98() --[[ Line: 258 ]] --[[ Name: initScriptConnections ]]
	-- upvalues: l_RunService_0 (copy), v24 (copy), v19 (copy), l_LocalPlayer_0 (copy), l_Players_0 (copy), l_RemoteEvents_0 (copy), v73 (copy), v60 (copy), v14 (copy)
	l_RunService_0.PreRender:Connect(function() --[[ Line: 259 ]]
		-- upvalues: v24 (ref), v19 (ref)
		for _, v75 in v24.cars do
			if v75.state == "initialized" then
				if v24.ownedCarIds[v75.shared.id] then
					v19.preRender(v75);
				else
					v19.bystanderPreRender(v75);
				end;
			end;
		end;
	end);
	l_RunService_0.PreSimulation:Connect(function(v76) --[[ Line: 272 ]]
		-- upvalues: v24 (ref), l_LocalPlayer_0 (ref), v19 (ref)
		for _, v78 in v24.cars do
			if v78.shared.owner == l_LocalPlayer_0 then
				v19.preSimulation(v76, v78);
			else
				v19.bystanderPreSimulation(v76, v78);
			end;
		end;
	end);
	local v79 = {};
	local function _(v80) --[[ Line: 282 ]] --[[ Name: handlePlayer ]]
		-- upvalues: v79 (copy)
		v79[v80] = {};
	end;
	for _, v83 in l_Players_0:GetPlayers() do
		v79[v83] = {};
	end;
	l_Players_0.PlayerAdded:Connect(function(v84) --[[ Line: 289 ]]
		-- upvalues: v79 (copy)
		v79[v84] = {};
	end);
	l_Players_0.PlayerRemoving:Connect(function(v85) --[[ Line: 292 ]]
		-- upvalues: v79 (copy)
		local v86 = v79[v85];
		if not v86 then
			return;
		else
			for _, v88 in v86 do
				v88:Disconnect();
			end;
			return;
		end;
	end);
	l_RemoteEvents_0.RegisterCar.OnClientEvent:Connect(function(v89) --[[ Line: 302 ]]
		-- upvalues: v73 (ref)
		v73(v89);
	end);
	l_RemoteEvents_0.UnregisterCar.OnClientEvent:Connect(function(v90) --[[ Line: 305 ]]
		-- upvalues: v60 (ref)
		v60(v90);
	end);
	l_RemoteEvents_0.RegisterCars.OnClientEvent:Connect(function(v91) --[[ Line: 308 ]]
		-- upvalues: v73 (ref)
		for _, v93 in v91 do
			v73(v93);
		end;
	end);
	v14.RemoteEvents.SetLightsAreEnabled.OnClientEvent:Connect(function(v92, v93) --[[ Line: 306 ]]
		-- upvalues: v24 (ref), v19 (ref)
		local v94 = v24.carIdToIndexMap[v92];
		if not v94 then
			return;
		else
			local v95 = v24.cars[v94];
			if not v95 then
				return;
			else
				v95.shared.lightsAreEnabled = v93;
				v19.setLightsAreEnabled(v95, v93);
				return;
			end;
		end;
	end);
end;
v23.getLocallyDrivenCarId = function() --[[ Line: 326 ]] --[[ Name: getLocallyDrivenCarId ]]
	-- upvalues: v24 (copy)
	return v24.locallyDrivenCarId;
end;
v23.setDriver = function(v99, v100) --[[ Line: 330 ]] --[[ Name: setDriver ]]
	-- upvalues: v24 (copy), l_LocalPlayer_0 (copy), v19 (copy), v21 (copy)
	local v101 = v24.carIdToIndexMap[v99];
	local v102 = if not v101 then nil else v24.cars[v101];
	if not v102 then
		return false;
	else
		v101 = v102.initialized;
		if not v101 then
			return false;
		else
			if v24.ownedCarIds[v99] then
				if v100 == l_LocalPlayer_0 then
					if v24.locallyDrivenCarId then
						return false;
					else
						v101.driver = {
							player = l_LocalPlayer_0, 
							characterSubset = nil
						};
						v24.locallyDrivenCarId = v99;
						v19.onCarEntered(v102);
						v21.onCarEntered(v24.inputState, v102);
					end;
				elseif v100 == nil then
					if v24.locallyDrivenCarId ~= v99 then
						return false;
					else
						v101.driver = nil;
						v24.locallyDrivenCarId = nil;
						v19.onCarExited(v102);
						v21.onCarExited(v24.inputState);
					end;
				else
					return false;
				end;
			elseif v100 then
				v101.driver = {
					player = v100, 
					characterSubset = nil
				};
				v19.bystanderOnCarEntered(v102);
			else
				v19.bystanderOnCarExited(v102);
				v101.driver = nil;
			end;
			return true;
		end;
	end;
end;
v23.getCarIdFromModel = function(v103) --[[ Line: 379 ]] --[[ Name: getCarIdFromModel ]]
	-- upvalues: v24 (copy)
	for _, v105 in v24.cars do
		if v105.shared.model == v103 then
			return v105.shared.id;
		end;
	end;
	return nil;
end;
v23.init = function() --[[ Line: 388 ]] --[[ Name: init ]]
	-- upvalues: v98 (copy)
	v98();
end;
table.freeze(v23);
return v23;
