-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 05:02:47
-- Luau version 6, Types version 3
-- Time taken: 0.008739 seconds

local longstring1 = "<b><font color='#999999'>%s</font></b>\n<font color='#FFD700'>R$ %s</font> | <font color='#4EB5FF'>$%s</font> | <font color='#00FF7F'>DevEx: $%s</font>"
local RobuxCounter_upvr = script.Parent.RobuxCounter
local MoneyCounter_upvr = script.Parent.MoneyCounter
local DevExCounter_upvr = script.Parent.DevExCounter
local ExtraStat = script:WaitForChild("ExtraStat")
local tbl_5_upvr = {}
local TweenService_upvr = game:GetService("TweenService")
function tween(arg1, arg2, arg3, arg4) -- Line 17
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local var11 = arg4
	if not var11 then
		var11 = Enum.EasingStyle.Quint
	end
	TweenService_upvr:Create(arg1, TweenInfo.new(arg2, var11), arg3):Play()
end
local function formatWithCommas_upvr(arg1) -- Line 22, Named "formatWithCommas"
	local var12
	repeat
		local string_gsub_result1, string_gsub_result2 = string.gsub(var12, "^(-?%d+)(%d%d%d)", "%1,%2")
		k = string_gsub_result2 -- Setting global
		var12 = string_gsub_result1
	until k == 0
	return var12
end
local function updateCounter_upvr(arg1, arg2, arg3) -- Line 31, Named "updateCounter"
	--[[ Upvalues[1]:
		[1]: formatWithCommas_upvr (readonly)
	]]
	local formatWithCommas_upvr_result1 = formatWithCommas_upvr(arg2)
	for i = 1, 9 do
		local SOME_3 = arg1:FindFirstChild(tostring(i))
		if SOME_3 then
			SOME_3.Text = ""
			if SOME_3:FindFirstChild("UIScale") then
				SOME_3.UIScale.Scale = 0
			end
		end
	end
	tween(arg1, 0.25, {
		BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	})
	tween(arg1.UIScale, 0.5, {
		Scale = 1.1;
	})
	for i_2 = #formatWithCommas_upvr_result1, 1, -1 do
		local SOME_4 = arg1:FindFirstChild(tostring(9))
		if SOME_4 then
			SOME_4.Text = formatWithCommas_upvr_result1:sub(i_2, i_2)
			if SOME_4:FindFirstChild("UIScale") then
				tween(SOME_4.UIScale, 0.3, {
					Scale = 1;
				}, Enum.EasingStyle.Back)
			end
		end
		task.wait(arg3)
	end
	tween(arg1.UIScale, 0.5, {
		Scale = 1;
	})
end
local tbl_upvr = {}
for i_3, v in ipairs({"Past 1 Min", "Past 5 Min", "Past 15 Min", "Past 1 Hr", "Avg R$/s", "Top Donator (1hr)", "Most Active Donator", "Anonymous Donations"}) do
	local clone = ExtraStat:Clone()
	clone.Name = "Stat_"..v:gsub("[^%w]", "")
	clone.Text = ""
	clone.Visible = true
	clone.LayoutOrder = i_3
	clone.Parent = script.Parent
	tbl_upvr[v] = clone
end
local function _(arg1, arg2) -- Line 89, Named "richLine"
	return string.format(longstring1, arg1, arg2, math.floor(arg2 * 0.0125), math.floor(arg2 * 0.0035))
end
require(game.ReplicatedStorage.Remotes).OnClientEvent("UpdateCounter"):Connect(function(arg1) -- Line 100
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	local Robux = script.Robux
	Robux.Value += arg1.donatedRobux
	table.insert(tbl_5_upvr, {
		time = os.clock();
		amount = arg1.donatedRobux;
		donatorId = arg1.donatorUserId;
		donatorName = arg1.donatorUserInfo.DisplayName;
		donatorUsername = arg1.donatorUserInfo.Username;
		anon = arg1.anonymousDonator;
	})
end)
local var45_upvw = 0
script.Robux.Changed:Connect(function() -- Line 114
	--[[ Upvalues[5]:
		[1]: var45_upvw (read and write)
		[2]: updateCounter_upvr (readonly)
		[3]: RobuxCounter_upvr (readonly)
		[4]: MoneyCounter_upvr (readonly)
		[5]: DevExCounter_upvr (readonly)
	]]
	if tick() - var45_upvw < 1 then
	else
		var45_upvw = tick()
		local Value = script.Robux.Value
		updateCounter_upvr(RobuxCounter_upvr, Value, 0)
		updateCounter_upvr(MoneyCounter_upvr, math.floor(Value * 0.0125), 0)
		updateCounter_upvr(DevExCounter_upvr, math.floor(Value * 0.0035), 0)
	end
end)
task.spawn(function() -- Line 129
	--[[ Upvalues[2]:
		[1]: tbl_5_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	while true do
		local var72
		local tbl_2 = {}
		local tbl_3 = {}
		var72 = 1
		for i_4 = #tbl_5_upvr, var72, -1 do
			local var75 = tbl_5_upvr[i_4]
			local var76 = os.clock() - var75.time
			if 3600 < var76 then
				table.remove(tbl_5_upvr, i_4)
			else
				local amount = var75.amount
				if var76 <= 60 then
					local var78 = 0 + amount
				end
				if var76 <= 300 then
				end
				if var76 <= 900 then
				end
				if var76 <= 3600 then
				end
				if var75.anon then
				end
				tbl_2[var75.donatorId] = (tbl_2[var75.donatorId] or 0) + 1
				tbl_3[var75.donatorId] = (tbl_3[var75.donatorId] or 0) + amount
			end
		end
		var72 = nil
		for i_5, v_2 in pairs(tbl_3) do
			if 0 < v_2 then
				var72 = i_5
			end
		end
		for i_6, v_3 in pairs(tbl_2) do
			if 0 < v_3 then
			end
		end
		for i_7 = #tbl_5_upvr, 1, -1 do
			local var85 = tbl_5_upvr[i_7]
			local var86
			if var85.donatorId == var72 and var86 == "N/A" then
				var86 = string.format("%s (@%s)", var85.donatorName, var85.donatorUsername)
				local var87 = var86
			end
			local var88
			if var85.donatorId == i_6 and var88 == "N/A" then
				var88 = string.format("%s (@%s)", var85.donatorName, var85.donatorUsername)
				local var89 = var88
			end
			if var87 == "N/A" or var89 ~= "N/A" then break end
		end
		local var90 = var78
		tbl_upvr["Past 1 Min"].Text = string.format(longstring1, "Past 1 Min", var90, math.floor(var90 * 0.0125), math.floor(var90 * 0.0035))
		local var91 = 0 + amount
		tbl_upvr["Past 5 Min"].Text = string.format(longstring1, "Past 5 Min", var91, math.floor(var91 * 0.0125), math.floor(var91 * 0.0035))
		local var92 = 0 + amount
		tbl_upvr["Past 15 Min"].Text = string.format(longstring1, "Past 15 Min", var92, math.floor(var92 * 0.0125), math.floor(var92 * 0.0035))
		local var93 = 0 + amount
		tbl_upvr["Past 1 Hr"].Text = string.format(longstring1, "Past 1 Hr", var93, math.floor(var93 * 0.0125), math.floor(var93 * 0.0035))
		tbl_upvr["Avg R$/s"].Text = string.format("<b><font color='#999999'>Avg R$/s:</font></b> <font color='#FFD700'>%.2f</font>", var78 / 60)
		tbl_upvr["Top Donator (1hr)"].Text = string.format("<b><font color='#999999'>Top Donator (1hr):</font></b> <font color='#ffffff'>%s</font> <font color='#FFD700'>(R$ %d)</font>", var87, v_2)
		tbl_upvr["Most Active Donator"].Text = string.format("<b><font color='#999999'>Most Active Donator:</font></b> <font color='#ffffff'>%s</font> <font color='#FFD700'>(%dx)</font>", var89, v_3)
		tbl_upvr["Anonymous Donations"].Text = string.format("<b><font color='#999999'>Anonymous Donations:</font></b> <font color='#ffffff'>%d</font>", 0 + 1)
		task.wait(1)
	end
end)
local var94_upvw = true
local function updateStatVisibility_upvr() -- Line 217, Named "updateStatVisibility"
	--[[ Upvalues[5]:
		[1]: tbl_upvr (readonly)
		[2]: var94_upvw (read and write)
		[3]: RobuxCounter_upvr (readonly)
		[4]: MoneyCounter_upvr (readonly)
		[5]: DevExCounter_upvr (readonly)
	]]
	for i_8, v_4 in pairs(tbl_upvr) do
		local var110 = true
		if i_8 ~= "Top Donator (1hr)" then
			var110 = true
			if i_8 ~= "Most Active Donator" then
				if i_8 ~= "Anonymous Donations" then
					var110 = false
				else
					var110 = true
				end
			end
		end
		v_4.Visible = var94_upvw or var110
	end
	RobuxCounter_upvr.Visible = var94_upvw
	MoneyCounter_upvr.Visible = var94_upvw
	DevExCounter_upvr.Visible = var94_upvw
end
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
game:GetService("UserInputService").InputBegan:Connect(function(arg1, arg2) -- Line 233
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var94_upvw (read and write)
		[3]: updateStatVisibility_upvr (readonly)
	]]
	if arg2 then
	elseif arg1.KeyCode == Enum.KeyCode.V and LocalPlayer_upvr.UserId == 151848836 then
		script.Parent.Visible = not script.Parent.Visible
		if script.Parent.Visible then
			var94_upvw = not var94_upvw
			updateStatVisibility_upvr()
		end
	end
end)