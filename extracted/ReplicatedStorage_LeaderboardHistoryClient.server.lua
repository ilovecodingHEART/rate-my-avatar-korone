-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TextChatService_0 = game:GetService("TextChatService");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v2 = require(game.ReplicatedStorage.Remotes);
local l_formatCommas_0 = require(game.ReplicatedStorage.NumberHelpers).formatCommas;
local l_LeaderboardHistory_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("LeaderboardHistory");
local v5 = {};
task.spawn(function() --[[ Line: 14 ]]
	-- upvalues: v2 (copy), l_LocalPlayer_0 (copy), v5 (copy), l_LeaderboardHistory_0 (copy)
	for _, v7 in v2.Function("GetLeaderboards"):InvokeServer() do
		local v8 = v7:split("_");
		if v8[3] == "donated" and tonumber(v8[4]) >= 2024 then
			if v8[2] == "monthly" then
				local v9 = DateTime.fromUniversalTime(v8[4], v8[5]);
				local v10 = DateTime.fromUniversalTime(if v8[5] == "12" then v8[4] + 1 else v8[4], v8[5] == "12" and 1 or v8[5] + 1);
				local v11 = v9:FormatUniversalTime("MMMM", l_LocalPlayer_0.LocaleId);
				local v12 = {
					ed = v10, 
					text = ("%* %*"):format(v11, v8[4]), 
					dkey = ("ldb_monthly_donated_%*_%*"):format(v8[4], v8[5]), 
					rkey = ("ldb_monthly_raised_%*_%*"):format(v8[4], v8[5])
				};
				table.insert(v5, v12);
			elseif v8[2] == "yearly" then
				local _ = DateTime.fromUniversalTime(v8[4]);
				local v14 = {
					ed = DateTime.fromUniversalTime(v8[4] + 1, 1, 1, 1), 
					text = ("Year of %*"):format(v8[4]), 
					dkey = ("ldb_yearly_donated_%*"):format(v8[4]), 
					rkey = ("ldb_yearly_raised_%*"):format(v8[4])
				};
				table.insert(v5, v14);
			end;
		end;
	end;
	table.sort(v5, function(v15, v16) --[[ Line: 57 ]]
		return v15.ed.UnixTimestamp > v16.ed.UnixTimestamp;
	end);
	for v17, v18 in v5 do
		l_LeaderboardHistory_0.Frame.Sort.Time:SetAttribute(v17, v18.text);
	end;
	l_LeaderboardHistory_0.Frame.Sort.Time.Text = v5[1].text or "Time";
end);
l_TextChatService_0.SendingMessage:Connect(function(v19) --[[ Line: 67 ]]
	-- upvalues: l_LeaderboardHistory_0 (copy)
	if v19.Text == "!donatedhistory" then
		l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
		l_LeaderboardHistory_0.Visible = true;
		return;
	elseif v19.Text == "!raisedhistory" then
		l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Raised";
		l_LeaderboardHistory_0.Visible = true;
		return;
	elseif v19.Text == "!leaderboardhistory" then
		l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
		l_LeaderboardHistory_0.Visible = true;
		return;
	elseif v19.Text == "!ldbhistory" then
		l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
		l_LeaderboardHistory_0.Visible = true;
		return;
	elseif v19.Text == "!history" then
		l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
		l_LeaderboardHistory_0.Visible = true;
		return;
	else
		if v19.Text == "!ldbh" then
			l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
			l_LeaderboardHistory_0.Visible = true;
		end;
		return;
	end;
end);
workspace.TopDonatedHistory.ProximityPrompt.Triggered:Connect(function() --[[ Line: 89 ]]
	-- upvalues: l_LeaderboardHistory_0 (copy)
	l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Donated";
	l_LeaderboardHistory_0.Visible = true;
end);
workspace.TopRaisedHistory.ProximityPrompt.Triggered:Connect(function() --[[ Line: 93 ]]
	-- upvalues: l_LeaderboardHistory_0 (copy)
	l_LeaderboardHistory_0.Frame.Sort.Type.Text = "Top Raised";
	l_LeaderboardHistory_0.Visible = true;
end);
local function v22() --[[ Line: 98 ]] --[[ Name: startload ]]
	-- upvalues: l_LeaderboardHistory_0 (copy)
	for _, v21 in pairs(l_LeaderboardHistory_0.Frame.History:GetChildren()) do
		if v21.Name == "Entry" then
			v21:Destroy();
		end;
	end;
	l_LeaderboardHistory_0.Frame.History.Loading.Visible = true;
end;
local v23 = 0;
local v24 = {};
local function v45() --[[ Line: 111 ]] --[[ Name: render ]]
	-- upvalues: l_LeaderboardHistory_0 (copy), v5 (copy), v23 (ref), v2 (copy), v24 (copy), l_formatCommas_0 (copy), l_LocalPlayer_0 (copy)
	local v25 = l_LeaderboardHistory_0.Frame.Sort.Type.Text == "Top Donated";
	local v26 = nil;
	local l_Text_0 = l_LeaderboardHistory_0.Frame.Sort.Time.Text;
	for _, v29 in v5 do
		if v29.text == l_Text_0 then
			if v25 then
				v26 = v29.dkey;
			else
				v26 = v29.rkey;
			end;
		end;
	end;
	v23 = os.clock();
	local v30 = v2.Function("GetLeaderboard"):InvokeServer(v26);
	xpcall(function() --[[ Line: 123 ]]
		-- upvalues: v30 (copy), v26 (ref), v25 (copy), v24 (ref)
		local v31 = {};
		local v32 = {};
		for _, v34 in v30.leaderboard do
			local v35 = v30.anonymous[tostring(v34.id)];
			local v36 = tonumber(v26:split("_")[4]) or 1e999;
			local v37 = v25 or v36 < 2025;
			if v35 and v37 then
				v34.avatar = "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150";
				v34.name = "Anonymous";
			elseif v24[v34.id] then
				v34.name = "@" .. v24[v34.id].Username;
			else
				table.insert(v31, v34.id);
			end;
			v32[v34.id] = v34;
		end;
		if #v31 > 0 then
			for _, v39 in (game:GetService("UserService"):GetUserInfosByUserIdsAsync(v31)) do
				v24[v39.Id] = v39;
				v32[v39.Id].name = "@" .. v39.Username;
			end;
		end;
	end, warn);
	l_LeaderboardHistory_0.Frame.History.Loading.Visible = false;
	if v30.count then
		local v40 = script.Entry:Clone();
		v40.Info.Rank.Visible = false;
		v40.Info.Avatar.Visible = false;
		v40.Info.Username.Text = "Total Donations";
		v40.Robux.Text = ("%*"):format((l_formatCommas_0(v30.count)));
		v40.Seperator.Visible = true;
		v40.Parent = l_LeaderboardHistory_0.Frame.History;
	end;
	if v30.rank then
		local v41 = script.Entry:Clone();
		v41.Info.Rank.Text = l_formatCommas_0(v30.rank);
		v41.Info.Avatar.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(l_LocalPlayer_0.UserId);
		v41.Info.Username.Text = "@" .. l_LocalPlayer_0.Name;
		v41.Robux.Text = ("\238\128\130%*"):format((l_formatCommas_0(v30.score)));
		v41.Seperator.Visible = true;
		v41.Parent = l_LeaderboardHistory_0.Frame.History;
	end;
	for v42, v43 in v30.leaderboard do
		local v44 = script.Entry:Clone();
		v44.Info.Rank.Text = v42;
		v44.Info.Avatar.Image = v43.avatar;
		v44.Info.Username.Text = v43.name or "error";
		v44.Robux.Text = ("\238\128\130%*"):format((l_formatCommas_0(v43.robux)));
		v44.Parent = l_LeaderboardHistory_0.Frame.History;
	end;
end;
local v46 = nil;
local function v48() --[[ Line: 197 ]] --[[ Name: queuerender ]]
	-- upvalues: v46 (ref), v23 (ref), v45 (copy)
	if v46 then
		task.cancel(v46);
	end;
	v46 = coroutine.running();
	local v47 = math.max(0.5, v23 + 3.2 - os.clock());
	print((("Waiting for %* seconds"):format(v47)));
	task.wait(v47);
	v46 = nil;
	v45();
end;
l_LeaderboardHistory_0:GetPropertyChangedSignal("Visible"):Wait();
l_LeaderboardHistory_0.Frame.Sort.Type:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 212 ]]
	-- upvalues: v22 (copy), v48 (copy)
	v22();
	v48();
end);
l_LeaderboardHistory_0.Frame.Sort.Time:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 217 ]]
	-- upvalues: v22 (copy), v48 (copy)
	v22();
	v48();
end);
v22();
v45();