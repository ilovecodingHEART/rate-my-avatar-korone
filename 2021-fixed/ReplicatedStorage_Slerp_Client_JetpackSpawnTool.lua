-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_EquipJetpack_0 = l_ReplicatedStorage_0.Slerp.RemoteEvents.EquipJetpack;
local l_UnequipJetpack_0 = l_ReplicatedStorage_0.Slerp.RemoteEvents.UnequipJetpack;
local v5 = {};
local v6 = {};
local function _() --[[ Line: 22 ]] --[[ Name: toolActivated ]]
	-- upvalues: l_EquipJetpack_0 (copy)
	l_EquipJetpack_0:FireServer();
end;
local function _() --[[ Line: 26 ]] --[[ Name: toolDeactivated ]]
	-- upvalues: l_UnequipJetpack_0 (copy)
	l_UnequipJetpack_0:FireServer();
end;
local function v18() --[[ Line: 30 ]] --[[ Name: createScriptConnections ]]
	-- upvalues: l_LocalPlayer_0 (copy), v6 (copy), l_CollectionService_0 (copy), l_EquipJetpack_0 (copy), l_UnequipJetpack_0 (copy)
	v6.characterModel = l_LocalPlayer_0.Character;
	local v9 = nil;
	local v10 = nil;
	local function _(v11) --[[ Line: 37 ]] --[[ Name: characterAdded ]]
		-- upvalues: v6 (ref), v9 (ref), l_CollectionService_0 (ref), l_EquipJetpack_0 (ref), v10 (ref), l_UnequipJetpack_0 (ref)
		v6.characterModel = v11;
		if v9 then
			v9:Disconnect();
		end;
		v9 = v11.ChildAdded:Connect(function(v12) --[[ Line: 42 ]]
			-- upvalues: l_CollectionService_0 (ref), l_EquipJetpack_0 (ref), v10 (ref), l_UnequipJetpack_0 (ref)
			if v12:IsA("Tool") and l_CollectionService_0:HasTag(v12, "JetpackEquipTool") then
				l_EquipJetpack_0:FireServer();
				v10 = v12.Unequipped:Connect(function() --[[ Line: 45 ]]
					-- upvalues: v10 (ref), l_UnequipJetpack_0 (ref)
					if v10 then
						v10:Disconnect();
						v10 = nil;
					end;
					l_UnequipJetpack_0:FireServer();
				end);
			end;
		end);
	end;
	if l_LocalPlayer_0.Character then
		local l_Character_0 = l_LocalPlayer_0.Character;
		v6.characterModel = l_Character_0;
		if v9 then
			v9:Disconnect();
		end;
		v9 = l_Character_0.ChildAdded:Connect(function(v15) --[[ Line: 42 ]]
			-- upvalues: l_CollectionService_0 (ref), l_EquipJetpack_0 (ref), v10 (ref), l_UnequipJetpack_0 (ref)
			if v15:IsA("Tool") and l_CollectionService_0:HasTag(v15, "JetpackEquipTool") then
				l_EquipJetpack_0:FireServer();
				v10 = v15.Unequipped:Connect(function() --[[ Line: 45 ]]
					-- upvalues: v10 (ref), l_UnequipJetpack_0 (ref)
					if v10 then
						v10:Disconnect();
						v10 = nil;
					end;
					l_UnequipJetpack_0:FireServer();
				end);
			end;
		end);
	end;
	l_LocalPlayer_0.CharacterAdded:Connect(function(v16) --[[ Line: 58 ]]
		-- upvalues: v6 (ref), v9 (ref), l_CollectionService_0 (ref), l_EquipJetpack_0 (ref), v10 (ref), l_UnequipJetpack_0 (ref)
		v6.characterModel = v16;
		if v9 then
			v9:Disconnect();
		end;
		v9 = v16.ChildAdded:Connect(function(v17) --[[ Line: 42 ]]
			-- upvalues: l_CollectionService_0 (ref), l_EquipJetpack_0 (ref), v10 (ref), l_UnequipJetpack_0 (ref)
			if v17:IsA("Tool") and l_CollectionService_0:HasTag(v17, "JetpackEquipTool") then
				l_EquipJetpack_0:FireServer();
				v10 = v17.Unequipped:Connect(function() --[[ Line: 45 ]]
					-- upvalues: v10 (ref), l_UnequipJetpack_0 (ref)
					if v10 then
						v10:Disconnect();
						v10 = nil;
					end;
					l_UnequipJetpack_0:FireServer();
				end);
			end;
		end);
	end);
end;
v5.init = function() --[[ Line: 63 ]] --[[ Name: init ]]
	-- upvalues: v18 (copy)
	v18();
end;
v5.getCollectionServiceTag = function() --[[ Line: 67 ]] --[[ Name: getCollectionServiceTag ]]
	return "JetpackEquipTool";
end;
__2021_freeze(v5);
return v5;