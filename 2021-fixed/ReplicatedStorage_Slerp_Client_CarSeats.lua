-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x8, if-expr -> __2021_if x5, compound-assign x0, shims: __2021_freeze
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
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Client_0 = l_ReplicatedStorage_0.Slerp.Client;
local v5 = require(l_Client_0.Cars);
local l_Shared_0 = l_ReplicatedStorage_0.Slerp.Shared;
local v7 = require(l_Shared_0.CarSeats.Net);
local _ = require(l_Shared_0.CarSeats.Types);
local v9 = require(l_Shared_0.Signal);
local v10 = {};
local v11 = {
	cars = {}, 
	isWorking = false, 
	isWorkingChanged = v9.new(), 
	incomingCarQueue = {}
};
local function _(v12) --[[ Line: 38 ]] --[[ Name: makeHumanoidsExitSeat ]]
	-- upvalues: l_Debris_0 (copy)
	local l_SeatWeld_0 = v12:FindFirstChild("SeatWeld");
	if l_SeatWeld_0 then
		l_Debris_0:AddItem(l_SeatWeld_0, 0);
	end;
end;
local function _(v15, v16) --[[ Line: 46 ]] --[[ Name: sit ]]
	if v15.Sit then
		v15.Sit = false;
	end;
	v16:Sit(v15);
end;
local function _() --[[ Line: 52 ]] --[[ Name: getHumanoid ]]
	-- upvalues: l_LocalPlayer_0 (copy)
	local l_Character_0 = l_LocalPlayer_0.Character;
	if not l_Character_0 then
		return;
	else
		return l_Character_0:FindFirstChild("Humanoid");
	end;
end;
local function _(v20) --[[ Line: 59 ]] --[[ Name: postInit ]]
	-- upvalues: l_LocalPlayer_0 (copy), v5 (copy)
	local l_Character_1 = l_LocalPlayer_0.Character;
	local v22 = __2021_if(function() return not l_Character_1 end, function() return nil end, function() return l_Character_1:FindFirstChild("Humanoid") end);
	local v23;
	l_Character_1, v23 = v5.getCarOwner(v20.id);
	if v22 and v20.driveSeatIndex and v23 == l_LocalPlayer_0 then
		local l_seatPart_0 = v20.seats[v20.driveSeatIndex].seatPart;
		if v22.Sit then
			v22.Sit = false;
		end;
		l_seatPart_0:Sit(v22);
	end;
end;
local function v42(v26) --[[ Line: 66 ]] --[[ Name: addCar ]]
	-- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v11 (copy)
	local v27 = table.create(#v26.seats);
	local v28 = v5.getLocallyDrivenCarId() and true or false;
	for v29, v30 in pairs(v26.seats) --[[ 2021 ]] do
		if v28 then
			v30.proximityPrompt.Enabled = false;
		else
			v30.proximityPrompt.Enabled = not v30.occupant or false;
		end;
		v27[v29] = v30.proximityPrompt.Triggered:Connect(function(v31) --[[ Line: 76 ]]
			-- upvalues: l_LocalPlayer_0 (ref), v30 (copy), v5 (ref), v26 (copy), v29 (copy)
			if v31 ~= l_LocalPlayer_0 then
				return;
			else
				local l_Character_2 = l_LocalPlayer_0.Character;
				if not l_Character_2 then
					return;
				else
					local l_Humanoid_0 = l_Character_2:FindFirstChild("Humanoid");
					if not l_Humanoid_0 then
						return;
					elseif v30.occupant or v30.seatPart.Occupant then
						return;
					else
						local _, v35 = v5.getCarOwner(v26.id);
						if v35 ~= l_LocalPlayer_0 and v29 == v26.driveSeatIndex then
							return;
						else
							local l_seatPart_1 = v30.seatPart;
							if l_Humanoid_0.Sit then
								l_Humanoid_0.Sit = false;
							end;
							l_seatPart_1:Sit(l_Humanoid_0);
							return;
						end;
					end;
				end;
			end;
		end);
	end;
	local v37 = v26.driveSeatIndex and v26.seats[v26.driveSeatIndex];
	if v37 and v37.occupant then
		v5.setDriver(v26.id, v37.occupant);
	end;
	v11.cars[v26.id] = {
		shared = v26, 
		proximityPromptTriggeredConnections = v27
	};
	local l_Character_3 = l_LocalPlayer_0.Character;
	local v39 = __2021_if(function() return not l_Character_3 end, function() return nil end, function() return l_Character_3:FindFirstChild("Humanoid") end);
	local v40;
	l_Character_3, v40 = v5.getCarOwner(v26.id);
	if v39 and v26.driveSeatIndex and v40 == l_LocalPlayer_0 then
		local l_seatPart_2 = v26.seats[v26.driveSeatIndex].seatPart;
		if v39.Sit then
			v39.Sit = false;
		end;
		l_seatPart_2:Sit(v39);
	end;
end;
local function _(v43) --[[ Line: 113 ]] --[[ Name: getCarFromId ]]
	-- upvalues: v11 (copy)
	return v11.cars[v43];
end;
local _ = function(v45) --[[ Line: 117 ]] --[[ Name: disconnectRBXScriptConnections ]]
	for _, v47 in pairs(v45) --[[ 2021 ]] do
		v47:Disconnect();
	end;
end;
local function v53() --[[ Line: 123 ]] --[[ Name: hideAllProximityPrompts ]]
	-- upvalues: v11 (copy)
	for _, v50 in pairs(v11.cars) --[[ 2021 ]] do
		for _, v52 in pairs(v50.shared.seats) --[[ 2021 ]] do
			v52.proximityPrompt.Enabled = false;
		end;
	end;
end;
local function v58() --[[ Line: 131 ]] --[[ Name: showProximityPrompts ]]
	-- upvalues: v11 (copy)
	for _, v55 in pairs(v11.cars) --[[ 2021 ]] do
		for _, v57 in pairs(v55.shared.seats) --[[ 2021 ]] do
			v57.proximityPrompt.Enabled = not v57.occupant or false;
		end;
	end;
end;
local function v66(v59) --[[ Line: 139 ]] --[[ Name: removeCar ]]
	-- upvalues: v11 (copy), v5 (copy), v58 (copy), l_LocalPlayer_0 (copy)
	local v60 = v11.cars[v59];
	if not v60 then
		return;
	else
		for _, v62 in pairs(v60.proximityPromptTriggeredConnections) --[[ 2021 ]] do
			v62:Disconnect();
		end;
		local v63 = v5.getLocallyDrivenCarId();
		if v63 == v59 or not v63 then
			v58();
			local l_Character_4 = l_LocalPlayer_0.Character;
			local v65 = __2021_if(function() return not l_Character_4 end, function() return nil end, function() return l_Character_4:FindFirstChild("Humanoid") end);
			if v65 then
				v65:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
			end;
		end;
		if v11.locallySeated and v59 == v11.locallySeated.carId then
			v58();
			v11.locallySeated = nil;
		end;
		v11.cars[v59] = nil;
		return;
	end;
end;
v10.init = function() --[[ Line: 162 ]] --[[ Name: init ]]
	-- upvalues: v7 (copy), v42 (copy), v66 (copy), v11 (copy), v5 (copy), l_LocalPlayer_0 (copy), v53 (copy), v58 (copy)
	v7.RemoteEvents.RegisterCar.OnClientEvent:Connect(function(v67) --[[ Line: 163 ]]
		-- upvalues: v42 (ref)
		v42(v67);
	end);
	v7.RemoteEvents.RegisterCars.OnClientEvent:Connect(function(v68) --[[ Line: 166 ]]
		-- upvalues: v42 (ref)
		for _, v70 in pairs(v68) --[[ 2021 ]] do
			v42(v70);
		end;
	end);
	v7.RemoteEvents.UnregisterCar.OnClientEvent:Connect(function(v71) --[[ Line: 171 ]]
		-- upvalues: v66 (ref)
		v66(v71);
	end);
	v7.RemoteEvents.SetOccupant.OnClientEvent:Connect(function(v72, v73, v74, v75) --[[ Line: 174 ]]
		-- upvalues: v11 (ref), v5 (ref), l_LocalPlayer_0 (ref), v53 (ref), v58 (ref)
		local v76 = v11.cars[v72];
		if not v76 then
			return;
		else
			local v77 = v76.shared.seats[v73];
			if not v75 and v77.occupant == v74 then
				return;
			else
				local v78 = v73 == v76.shared.driveSeatIndex;
				local v79 = not v74 or false;
				local v80 = v76.shared.seats[v73];
				v80.occupant = v74;
				if v78 then
					v5.setDriver(v72, v74);
					if v80.occupant == l_LocalPlayer_0 then
						local l_Character_5 = l_LocalPlayer_0.Character;
						local v82 = __2021_if(function() return not l_Character_5 end, function() return nil end, function() return l_Character_5:FindFirstChild("Humanoid") end);
						if v82 then
							if v82.SeatPart ~= v80.seatPart then
								l_Character_5 = v80.seatPart;
								if v82.Sit then
									v82.Sit = false;
								end;
								l_Character_5:Sit(v82);
							end;
							v82:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
						end;
					end;
				end;
				if v74 == l_LocalPlayer_0 then
					v53();
					v11.locallySeated = {
						carId = v72, 
						seatIndex = v73
					};
					return;
				else
					if v11.locallySeated then
						if v72 == v11.locallySeated.carId and v73 == v11.locallySeated.seatIndex then
							v58();
							v11.locallySeated = nil;
							local l_Character_6 = l_LocalPlayer_0.Character;
							local v84 = __2021_if(function() return not l_Character_6 end, function() return nil end, function() return l_Character_6:FindFirstChild("Humanoid") end);
							if v84 then
								v84:UnequipTools();
								v84:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
								return;
							end;
						end;
					else
						v80.proximityPrompt.Enabled = v79;
					end;
					return;
				end;
			end;
		end;
	end);
end;
__2021_freeze(v10);
return v10;
