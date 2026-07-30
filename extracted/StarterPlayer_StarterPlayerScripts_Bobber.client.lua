-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v3 = {};
local function v13(v4) --[[ Line: 12 ]] --[[ Name: bobbingInstance ]]
	-- upvalues: l_RunService_0 (copy), v3 (copy)
	assert(v4:IsA("BasePart"), "Bobbing tag added to non-part");
	local l_CFrame_0 = v4.CFrame;
	v3[v4] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 15 ]]
		-- upvalues: v4 (copy), l_CFrame_0 (copy)
		local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
		local v7 = v4:GetAttribute("HeightScale") or 0;
		local v8 = v4:GetAttribute("HeightOffset") or 0;
		local v9 = v4:GetAttribute("Rotation") or 0;
		local v10 = v4:GetAttribute("Variation") or 0;
		local v11 = Random.new(v10 * 1000000);
		local v12 = l_workspace_ServerTimeNow_0 * math.rad(v9) % 6.283185307179586;
		v4.CFrame = l_CFrame_0 * CFrame.new(0, math.sin(l_workspace_ServerTimeNow_0 * v11:NextNumber() + v11:NextNumber()) * v7 + v8, 0) * CFrame.Angles(0, v12, 0);
	end);
end;
l_CollectionService_0:GetInstanceAddedSignal("Bobbing"):Connect(v13);
l_CollectionService_0:GetInstanceRemovedSignal("Bobbing"):Connect(function(v14) --[[ Line: 31 ]]
	-- upvalues: v3 (copy)
	v3[v14]:Disconnect();
	v3[v14] = nil;
end);
for _, v16 in l_CollectionService_0:GetTagged("Bobbing") do
	task.spawn(v13, v16);
end;