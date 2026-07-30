-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_SoundService_0 = game:GetService("SoundService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = require(l_ReplicatedStorage_0.popup);
local v6 = require(l_ReplicatedStorage_0:WaitForChild("Common").Rewards);
local v7 = require(l_ReplicatedStorage_0:WaitForChild("Common").atoms);
local v8 = require(l_ReplicatedStorage_0:WaitForChild("Client").remotes);
local _ = require(l_ReplicatedStorage_0:WaitForChild("Packages"):WaitForChild("Charm"));
local function _(v10, v11, v12, v13) --[[ Line: 16 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	task.spawn(function() --[[ Line: 17 ]]
		-- upvalues: l_TweenService_0 (ref), v10 (copy), v11 (copy), v13 (copy), v12 (copy)
		l_TweenService_0:Create(v10, TweenInfo.new(v11, v13 or Enum.EasingStyle.Quint), v12):Play();
	end);
end;
local function _(v15) --[[ Line: 27 ]] --[[ Name: clamp01 ]]
	if v15 < 0 then
		return 0;
	elseif v15 > 1 then
		return 1;
	else
		return v15;
	end;
end;
local l_CollectionService_0 = game:GetService("CollectionService");
for v18, v19 in v6 do
	local v20 = script.Reward:Clone();
	v20.Name = v19.id;
	v20.Parent = script.Parent.Frame;
	v20.RewardInfo.Objective.RewardCount.Text = ("REWARD %*"):format(v18);
	v20.RewardInfo.Objective.ObjectiveText.Text = ("SCORE %* GOALS"):format(v19.goalsRequirement);
	v20:SetAttribute("GoalsRequirement", v19.goalsRequirement);
	if v19.rewardType == "booth" then
		v20.RewardInfo.Reward.AwardImage.Image = "rbxassetid://105152746738545";
		l_CollectionService_0:AddTag(v20, "Hint");
		v20:SetAttribute("Hint", "Complete this quest to earn a free exclusive adidas booth!");
	else
		v20.RewardInfo.Reward.AwardImage.Image = "rbxassetid://91693002822877";
		l_CollectionService_0:AddTag(v20, "Hint");
		v20:SetAttribute("Hint", "Complete this quest to earn free giftbux!");
	end;
	v20.Claim.Activated:Connect(function() --[[ Line: 56 ]]
		-- upvalues: v8 (copy), v19 (copy), v5 (copy), l_SoundService_0 (copy)
		local v21, v22 = v8.CheckReward.Call(v19.id);
		if v21 == nil then
			v5("warn", "you don't have enough goals!");
			l_SoundService_0.SFX.Fail:Play();
			return;
		elseif v22 == false then
			v5("success", "claimed!");
			l_SoundService_0.SFX.GiftClaim:Play();
			l_SoundService_0.SFX.Success:Play();
			return;
		else
			v5("warn", "you've already claimed this reward!");
			l_SoundService_0.SFX.Fail:Play();
			return;
		end;
	end);
end;
local function v33() --[[ Line: 76 ]] --[[ Name: updateRewardsUI ]]
	-- upvalues: v7 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy)
	local v23 = v7.goals()[l_LocalPlayer_0.Name] or 0;
	script.Parent.TopFrame.Buttons.Goals.Count.Text = tostring(v23);
	for _, v25 in script.Parent.Frame:GetChildren() do
		if v25:IsA("Frame") then
			local l_v25_Attribute_0 = v25:GetAttribute("GoalsRequirement");
			if typeof(l_v25_Attribute_0) == "number" and l_v25_Attribute_0 > 0 then
				local v27 = v23 / l_v25_Attribute_0;
				local v28 = v27 < 0 and 0 or v27 > 1 and 1 or v27;
				v27 = v25.RewardInfo.Objective.Progress.Bar;
				local v29 = {
					Size = UDim2.new(v28, 0, 1, 0)
				};
				local l_spawn_0 = task.spawn;
				local v31 = 1;
				local v32 = nil;
				l_spawn_0(function() --[[ Line: 17 ]]
					-- upvalues: l_TweenService_0 (ref), v27 (copy), v31 (copy), v32 (copy), v29 (copy)
					l_TweenService_0:Create(v27, TweenInfo.new(v31, v32 or Enum.EasingStyle.Quint), v29):Play();
				end);
			end;
		end;
	end;
end;
l_LocalPlayer_0.PlayerGui.ScreenGui.Adidas:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 94 ]]
	-- upvalues: l_LocalPlayer_0 (copy), v33 (copy)
	if l_LocalPlayer_0.PlayerGui.ScreenGui.Adidas.Visible then
		v33();
	end;
end);