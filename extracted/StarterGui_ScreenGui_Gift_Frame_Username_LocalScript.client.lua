-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_Suggestions_0 = l_Parent_0:WaitForChild("Suggestions");
local l_Suggestion_0 = script:WaitForChild("Suggestion");
l_Suggestion_0.Visible = false;
l_Suggestions_0.Visible = false;
local v7 = {};
local v8 = {};
local v9 = false;
local v10 = false;
local v11 = 0;
local v12 = false;
local v13 = false;
local function _(v14, v15, v16) --[[ Line: 27 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	l_TweenService_0:Create(v14, TweenInfo.new(v15, Enum.EasingStyle.Quint), v16):Play();
end;
local function _(v18) --[[ Line: 32 ]] --[[ Name: tolower ]]
	return string.lower(v18 or "");
end;
local function _(v20, v21) --[[ Line: 33 ]] --[[ Name: findpos ]]
	return string.find(string.lower(v20 or ""), string.lower(v21 or ""), 1, true);
end;
local function v37(v23, v24) --[[ Line: 35 ]] --[[ Name: levenshtein ]]
	v23 = string.lower(v23 or "");
	v24 = string.lower(v24 or "");
	local v25 = #v23;
	local v26 = #v24;
	if v25 == 0 then
		return v26;
	elseif v26 == 0 then
		return v25;
	else
		local v27 = {};
		for v28 = 0, v25 do
			v27[v28] = {
				[0] = v28
			};
		end;
		for v29 = 0, v26 do
			v27[0][v29] = v29;
		end;
		for v30 = 1, v25 do
			local v31 = string.sub(v23, v30, v30);
			for v32 = 1, v26 do
				local v33 = v31 == string.sub(v24, v32, v32) and 0 or 1;
				local v34 = v27[v30 - 1][v32] + 1;
				local v35 = v27[v30][v32 - 1] + 1;
				local v36 = v27[v30 - 1][v32 - 1] + v33;
				v27[v30][v32] = math.min(v34, v35, v36);
			end;
		end;
		return v27[v25][v26];
	end;
end;
if not l_Suggestions_0:FindFirstChildOfClass("UIListLayout") then
	local l_UIListLayout_0 = Instance.new("UIListLayout");
	l_UIListLayout_0.FillDirection = Enum.FillDirection.Vertical;
	l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
	l_UIListLayout_0.Padding = UDim.new(0, 4);
	l_UIListLayout_0.Parent = l_Suggestions_0;
end;
if l_Suggestions_0:IsA("ScrollingFrame") then
	l_Suggestions_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
end;
local function v41() --[[ Line: 69 ]] --[[ Name: clearList ]]
	-- upvalues: l_Suggestions_0 (copy), l_Suggestion_0 (copy)
	for _, v40 in ipairs(l_Suggestions_0:GetChildren()) do
		if v40 ~= l_Suggestion_0 and v40:IsA("GuiObject") and not v40:IsA("UIListLayout") and not v40:IsA("UIPadding") then
			v40:Destroy();
		end;
	end;
end;
local function _() --[[ Line: 78 ]] --[[ Name: closeSuggestions ]]
	-- upvalues: v11 (ref), v9 (ref), v10 (ref), l_Suggestions_0 (copy), v41 (copy)
	v11 = v11 + 1;
	v9 = false;
	v10 = false;
	l_Suggestions_0.Visible = false;
	task.defer(v41);
end;
local function v46() --[[ Line: 87 ]] --[[ Name: loadFriends ]]
	-- upvalues: v7 (ref), l_Players_0 (copy), l_LocalPlayer_0 (copy)
	v7 = {};
	local l_l_Players_0_FriendsAsync_0 = l_Players_0:GetFriendsAsync(l_LocalPlayer_0.UserId);
	repeat
		for _, v45 in ipairs(l_l_Players_0_FriendsAsync_0:GetCurrentPage()) do
			if v45.Username ~= "Account Deleted" then
				table.insert(v7, {
					userId = v45.Id, 
					username = v45.Username, 
					displayName = v45.DisplayName ~= "" and v45.DisplayName or v45.Username
				});
			end;
		end;
	until l_l_Players_0_FriendsAsync_0.IsFinished or not pcall(function() --[[ Line: 100 ]]
		-- upvalues: l_l_Players_0_FriendsAsync_0 (copy)
		l_l_Players_0_FriendsAsync_0:AdvanceToNextPageAsync();
	end);
end;
local function v56(v47, v48) --[[ Line: 103 ]] --[[ Name: makeRow ]]
	-- upvalues: l_Suggestion_0 (copy), l_Suggestions_0 (copy), v9 (ref), v12 (ref), v13 (ref), l_Parent_0 (copy), v11 (ref), v10 (ref), v41 (copy), v8 (copy), l_Players_0 (copy)
	local v49 = l_Suggestion_0:Clone();
	v49.Name = "Sug_" .. (v47.username or "user");
	v49.Visible = true;
	v49.Parent = l_Suggestions_0;
	v49.LayoutOrder = v48 or 0;
	v49:SetAttribute("username", v47.username);
	if v49:FindFirstChild("Info") then
		if v49.Info:FindFirstChild("Username") then
			v49.Info.Username.Text = "@" .. (v47.username or "");
		end;
		if v49.Info:FindFirstChild("Display") then
			v49.Info.Display.Text = v47.displayName or v47.username or "";
		end;
	end;
	if v49.MouseButton1Down then
		v49.MouseButton1Down:Connect(function() --[[ Line: 121 ]]
			-- upvalues: v9 (ref)
			v9 = true;
			local v50 = tick();
			task.delay(0.6, function() --[[ Line: 124 ]]
				-- upvalues: v50 (copy), v9 (ref)
				if tick() - v50 >= 0.59 then
					v9 = false;
				end;
			end);
		end);
	end;
	if v49.MouseEnter then
		v49.MouseEnter:Connect(function() --[[ Line: 133 ]]
			-- upvalues: v49 (copy)
			if v49:FindFirstChild("Info") then
				if v49.Info:FindFirstChild("Username") then
					v49.Info.Username.TextTransparency = 0.4;
				end;
				if v49.Info:FindFirstChild("Display") then
					v49.Info.Display.TextTransparency = 0.4;
				end;
			end;
		end);
	end;
	if v49.MouseLeave then
		v49.MouseLeave:Connect(function() --[[ Line: 141 ]]
			-- upvalues: v49 (copy)
			if v49:FindFirstChild("Info") then
				if v49.Info:FindFirstChild("Username") then
					v49.Info.Username.TextTransparency = 0;
				end;
				if v49.Info:FindFirstChild("Display") then
					v49.Info.Display.TextTransparency = 0;
				end;
			end;
		end);
	end;
	local v51 = false;
	local function v52() --[[ Line: 151 ]] --[[ Name: selectThis ]]
		-- upvalues: v51 (ref), v12 (ref), v13 (ref), l_Suggestions_0 (ref), v49 (copy), l_Parent_0 (ref), v47 (copy), v11 (ref), v9 (ref), v10 (ref), v41 (ref)
		if v51 then
			return;
		else
			v51 = true;
			v12 = true;
			v13 = true;
			l_Suggestions_0.Visible = false;
			if v49 and v49.Parent then
				v49:Destroy();
			end;
			l_Parent_0.Text = v47.username or "";
			l_Parent_0:ReleaseFocus();
			task.defer(function() --[[ Line: 160 ]]
				-- upvalues: v11 (ref), v9 (ref), v10 (ref), l_Suggestions_0 (ref), v41 (ref), v13 (ref), v12 (ref)
				v11 = v11 + 1;
				v9 = false;
				v10 = false;
				l_Suggestions_0.Visible = false;
				task.defer(v41);
				v13 = false;
				v12 = false;
			end);
			return;
		end;
	end;
	if v49.MouseButton1Click then
		v49.MouseButton1Click:Connect(v52);
	end;
	if v49.TouchTap then
		v49.TouchTap:Connect(v52);
	end;
	if v49.Activated then
		v49.Activated:Connect(v52);
	end;
	if v49:FindFirstChild("ImageLabel") and v47.userId then
		local v53 = v8[v47.userId];
		if v53 then
			v49.ImageLabel.Image = v53;
		else
			task.spawn(function() --[[ Line: 176 ]]
				-- upvalues: l_Players_0 (ref), v47 (copy), v49 (copy), v8 (ref)
				local l_status_0, l_result_0 = pcall(function() --[[ Line: 177 ]]
					-- upvalues: l_Players_0 (ref), v47 (ref)
					return l_Players_0:GetUserThumbnailAsync(v47.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
				end);
				if l_status_0 and l_result_0 and v49 and v49.Parent then
					v8[v47.userId] = l_result_0;
					v49.ImageLabel.Image = l_result_0;
				end;
			end);
		end;
	end;
end;
local function v81(v57) --[[ Line: 189 ]] --[[ Name: rebuild ]]
	-- upvalues: v12 (ref), l_Parent_0 (copy), v11 (ref), v9 (ref), v10 (ref), l_Suggestions_0 (copy), v41 (copy), v7 (ref), v37 (copy), l_Players_0 (copy), v56 (copy), l_TweenService_0 (copy)
	if v12 then
		return;
	else
		v57 = v57 or "";
		if not l_Parent_0:IsFocused() or #v57 < 1 then
			v11 = v11 + 1;
			v9 = false;
			v10 = false;
			l_Suggestions_0.Visible = false;
			task.defer(v41);
			return;
		else
			v41();
			local l_v7_0 = v7;
			local v59 = {};
			local v60 = string.lower(v57 or "");
			for _, v62 in ipairs(l_v7_0) do
				local v63 = v62.username or "";
				local v64 = v62.displayName or v63;
				local v65 = string.lower(v63 or "");
				local v66 = string.lower(v64 or "");
				local v67 = true;
				if v65 ~= v60 then
					v67 = v66 == v60;
				end;
				local v68 = true;
				if string.sub(v65, 1, #v60) ~= v60 then
					v68 = string.sub(v66, 1, #v60) == v60;
				end;
				local v69 = true;
				if string.find(v65, v60, 1, true) == nil then
					v69 = string.find(v66, v60, 1, true) ~= nil;
				end;
				local v70 = false;
				if not v67 and not v68 and not v69 then
					v70 = math.min(v37(v65, v60), (v37(v66, v60))) <= 2;
				end;
				if v67 or v68 or v69 or v70 then
					local v71 = 0;
					if v67 then
						v71 = v71 + 10000;
					end;
					if string.sub(v65, 1, #v60) == v60 then
						v71 = v71 + 3000;
					end;
					if string.sub(v66, 1, #v60) == v60 then
						v71 = v71 + 2500;
					end;
					local v72 = string.find(string.lower(v63 or ""), string.lower(v57 or ""), 1, true);
					if v72 then
						v71 = v71 + (1800 - (v72 - 1) * 8);
					end;
					local v73 = string.find(string.lower(v64 or ""), string.lower(v57 or ""), 1, true);
					if v73 then
						v71 = v71 + (1500 - (v73 - 1) * 6);
					end;
					v71 = v71 + math.max(0, 400 - math.abs(#v65 - #v60) * 40);
					if l_Players_0:GetPlayerByUserId(v62.userId or -1) then
						v71 = v71 + 120;
					end;
					table.insert(v59, {
						entry = v62, 
						score = v71
					});
				end;
			end;
			table.sort(v59, function(v74, v75) --[[ Line: 232 ]]
				if v74.score ~= v75.score then
					return v74.score > v75.score;
				else
					local v76 = v74.entry.username or "";
					local v77 = v75.entry.username or "";
					if #v76 ~= #v77 then
						return #v76 < #v77;
					else
						return string.lower(v76 or "") < string.lower(v77 or "");
					end;
				end;
			end);
			for v78 = 1, math.min(#v59, 2) do
				v56(v59[v78].entry, v78);
			end;
			l_Suggestions_0.Visible = #v59 > 0;
			l_Suggestions_0.Position = UDim2.new(0.5, -5, 0.5, -45);
			local l_l_Suggestions_0_0 = l_Suggestions_0;
			local v80 = {
				Position = UDim2.new(0.5, -5, 0.5, -25)
			};
			l_TweenService_0:Create(l_l_Suggestions_0_0, TweenInfo.new(0.35, Enum.EasingStyle.Quint), v80):Play();
			return;
		end;
	end;
end;
if l_Suggestions_0.MouseEnter then
	l_Suggestions_0.MouseEnter:Connect(function() --[[ Line: 249 ]]
		-- upvalues: v10 (ref)
		v10 = true;
	end);
end;
if l_Suggestions_0.MouseLeave then
	l_Suggestions_0.MouseLeave:Connect(function() --[[ Line: 252 ]]
		-- upvalues: v10 (ref)
		v10 = false;
	end);
end;
v46();
v81(l_Parent_0.Text);
l_Parent_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 258 ]]
	-- upvalues: v81 (copy), l_Parent_0 (copy)
	v81(l_Parent_0.Text);
end);
l_Parent_0.Focused:Connect(function() --[[ Line: 262 ]]
	-- upvalues: v81 (copy), l_Parent_0 (copy)
	v81(l_Parent_0.Text);
end);
l_Parent_0.FocusLost:Connect(function(v82, _) --[[ Line: 266 ]]
	-- upvalues: v13 (ref), l_Suggestions_0 (copy), l_Suggestion_0 (copy), v12 (ref), l_Parent_0 (copy), v11 (ref), v9 (ref), v10 (ref), v41 (copy)
	if v13 then
		return;
	else
		if v82 then
			for _, v85 in ipairs(l_Suggestions_0:GetChildren()) do
				if v85 ~= l_Suggestion_0 and v85:IsA("GuiObject") then
					local l_v85_Attribute_0 = v85:GetAttribute("username");
					if l_v85_Attribute_0 then
						v12 = true;
						v13 = true;
						l_Suggestions_0.Visible = false;
						l_Parent_0.Text = l_v85_Attribute_0;
						l_Parent_0:ReleaseFocus();
						task.defer(function() --[[ Line: 279 ]]
							-- upvalues: v11 (ref), v9 (ref), v10 (ref), l_Suggestions_0 (ref), v41 (ref), v13 (ref), v12 (ref)
							v11 = v11 + 1;
							v9 = false;
							v10 = false;
							l_Suggestions_0.Visible = false;
							task.defer(v41);
							v13 = false;
							v12 = false;
						end);
					end;
					return;
				end;
			end;
		end;
		v11 = v11 + 1;
		local l_v11_0 = v11;
		task.delay(0.1, function() --[[ Line: 292 ]]
			-- upvalues: l_v11_0 (copy), v11 (ref), v9 (ref), v10 (ref), v13 (ref), l_Suggestions_0 (ref), v41 (ref)
			if l_v11_0 ~= v11 then
				return;
			elseif v9 or v10 or v13 then
				return;
			else
				v11 = v11 + 1;
				v9 = false;
				v10 = false;
				l_Suggestions_0.Visible = false;
				task.defer(v41);
				return;
			end;
		end);
		return;
	end;
end);
l_UserInputService_0.InputBegan:Connect(function(v88, v89) --[[ Line: 299 ]]
	-- upvalues: l_Parent_0 (copy), v11 (ref), v9 (ref), v10 (ref), l_Suggestions_0 (copy), v41 (copy)
	if v89 then
		return;
	else
		if l_Parent_0:IsFocused() and v88.KeyCode == Enum.KeyCode.Escape then
			v11 = v11 + 1;
			v9 = false;
			v10 = false;
			l_Suggestions_0.Visible = false;
			task.defer(v41);
			l_Parent_0:ReleaseFocus();
		end;
		return;
	end;
end);