-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_AdService_0 = game:GetService("AdService");
local l_RequestShowAdEvent_0 = l_ReplicatedStorage_0:WaitForChild("RequestShowAdEvent");
local l_RecheckAdAvailabilityEvent_0 = l_ReplicatedStorage_0:WaitForChild("RecheckAdAvailabilityEvent");
local v4 = require(game.ReplicatedStorage.popup);
local l_Parent_0 = script.Parent;
local v6 = false;
local function v8(v7) --[[ Line: 13 ]] --[[ Name: toggleAdButton ]]
	-- upvalues: v6 (ref), l_Parent_0 (copy)
	if v7 then
		v6 = true;
		l_Parent_0.Active = true;
		l_Parent_0.AutoButtonColor = true;
		l_Parent_0.Text = "WATCH AD";
		l_Parent_0.BackgroundColor3 = Color3.fromRGB(255, 0, 132);
		return;
	else
		v6 = false;
		l_Parent_0.Active = false;
		l_Parent_0.AutoButtonColor = false;
		l_Parent_0.Text = "CURRENTLY UNAVAILABLE";
		l_Parent_0.BackgroundColor3 = Color3.fromRGB(161, 161, 161);
		return;
	end;
end;
local function v9() --[[ Line: 29 ]] --[[ Name: checkAdAvailability ]]
	-- upvalues: l_AdService_0 (copy), v6 (ref), v4 (copy), v8 (copy), v9 (copy)
	if l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo).AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
		if v6 == false and script.Parent.Parent.Parent.Parent.Visible == false then
			v4("adReward", "Ad reward now available!");
		end;
		v8(true);
		return;
	else
		v8(false);
		task.delay(30, v9);
		return;
	end;
end;
v9();
l_Parent_0.Activated:Connect(function() --[[ Line: 48 ]]
	-- upvalues: l_RequestShowAdEvent_0 (copy), v8 (copy)
	l_RequestShowAdEvent_0:FireServer();
	v8(false);
end);
l_RecheckAdAvailabilityEvent_0.OnClientEvent:Connect(function() --[[ Line: 53 ]]
	-- upvalues: v9 (copy)
	v9();
end);