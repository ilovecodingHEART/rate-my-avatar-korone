-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = game:GetService("TweenService")
local v2 = require(game.ReplicatedStorage.Remotes)
local v_u_3 = script.Parent.RobuxCounter
local v_u_4 = script.Parent.MoneyCounter
local v_u_5 = script.Parent.DevExCounter
local v6 = script:WaitForChild("ExtraStat")
function tween(p7, p8, p9, p10)
	-- upvalues: (copy) v_u_1
	v_u_1:Create(p7, TweenInfo.new(p8, p10 or Enum.EasingStyle.Quint), p9):Play()
end
local function v_u_14(p11)
	local v12 = tostring(p11)
	repeat
		local v13
		v12, v13 = string.gsub(v12, "^(-?%d+)(%d%d%d)", "%1,%2")
		k = v13
	until k == 0
	return v12
end
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = 0
local function v_u_29(p18, p19, p20)
	-- upvalues: (copy) v_u_14
	local v21 = v_u_14(p19)
	local v22 = #v21
	for v23 = 1, 9 do
		local v24 = p18:FindFirstChild((tostring(v23)))
		if v24 then
			v24.Text = ""
			if v24:FindFirstChild("UIScale") then
				v24.UIScale.Scale = 0
			end
		end
	end
	tween(p18, 0.25, {
		["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	})
	tween(p18.UIScale, 0.5, {
		["Scale"] = 1.1
	})
	local v25 = 9
	for v26 = v22, 1, -1 do
		local v27 = v21:sub(v26, v26)
		local v28 = p18:FindFirstChild((tostring(v25)))
		if v28 then
			v28.Text = v27
			if v28:FindFirstChild("UIScale") then
				tween(v28.UIScale, 0.3, {
					["Scale"] = 1
				}, Enum.EasingStyle.Back)
			end
		end
		v25 = v25 - 1
		task.wait(p20)
	end
	tween(p18.UIScale, 0.5, {
		["Scale"] = 1
	})
end
for v30, v31 in ipairs({
	"Past 1 Min",
	"Past 5 Min",
	"Past 15 Min",
	"Past 1 Hr",
	"Avg R$/s",
	"Top Donator (1hr)",
	"Most Active Donator",
	"Anonymous Donations"
}) do
	local v32 = v6:Clone()
	v32.Name = "Stat_" .. v31:gsub("[^%w]", "")
	v32.Text = ""
	v32.Visible = true
	v32.LayoutOrder = v30
	v32.Parent = script.Parent
	v_u_15[v31] = v32
end
v2.OnClientEvent("UpdateCounter"):Connect(function(p33)
	-- upvalues: (copy) v_u_16
	local v34 = script.Robux
	v34.Value = v34.Value + p33.donatedRobux
	local v35 = v_u_16
	local v36 = {
		["time"] = os.clock(),
		["amount"] = p33.donatedRobux,
		["donatorId"] = p33.donatorUserId,
		["donatorName"] = p33.donatorUserInfo.DisplayName,
		["donatorUsername"] = p33.donatorUserInfo.Username,
		["anon"] = p33.anonymousDonator
	}
	table.insert(v35, v36)
end)
script.Robux.Changed:Connect(function()
	-- upvalues: (ref) v_u_17, (copy) v_u_29, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	if tick() - v_u_17 >= 1 then
		v_u_17 = tick()
		local v37 = script.Robux.Value
		local v38 = v37 * 0.0125
		local v39 = math.floor(v38)
		local v40 = v37 * 0.0037
		local v41 = math.floor(v40)
		v_u_29(v_u_3, v37, 0)
		v_u_29(v_u_4, v39, 0)
		v_u_29(v_u_5, v41, 0)
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_16, (copy) v_u_15
	while true do
		local v42 = os.clock()
		local v43 = 0
		local v44 = 0
		local v45 = 0
		local v46 = 0
		local v47 = 0
		local v48 = {}
		local v49 = {}
		for v50 = #v_u_16, 1, -1 do
			local v51 = v_u_16[v50]
			local v52 = v42 - v51.time
			if v52 > 3600 then
				table.remove(v_u_16, v50)
			else
				local v53 = v51.amount
				if v52 <= 60 then
					v44 = v44 + v53
				end
				if v52 <= 300 then
					v45 = v45 + v53
				end
				if v52 <= 900 then
					v46 = v46 + v53
				end
				if v52 <= 3600 then
					v47 = v47 + v53
				end
				if v51.anon then
					v43 = v43 + 1
				end
				v48[v51.donatorId] = (v48[v51.donatorId] or 0) + 1
				v49[v51.donatorId] = (v49[v51.donatorId] or 0) + v53
			end
		end
		local v54 = 0
		local v55 = 0
		local v56 = nil
		local v57 = "N/A"
		local v58 = "N/A"
		local v59 = nil
		for v60, v61 in pairs(v49) do
			if v54 < v61 then
				v56 = v60
				v54 = v61
			end
		end
		for v62, v63 in pairs(v48) do
			if v55 < v63 then
				v59 = v62
				v55 = v63
			end
		end
		for v64 = #v_u_16, 1, -1 do
			local v65 = v_u_16[v64]
			if v65.donatorId == v56 and v57 == "N/A" then
				v57 = string.format("%s (@%s)", v65.donatorName, v65.donatorUsername)
			end
			if v65.donatorId == v59 and v58 == "N/A" then
				v58 = string.format("%s (@%s)", v65.donatorName, v65.donatorUsername)
			end
			if v57 ~= "N/A" and v58 ~= "N/A" then
				goto l25
			end
		end
		::l25::
		local v66 = v_u_15["Past 1 Min"]
		local v67 = v44 * 0.0125
		local v68 = math.floor(v67)
		local v69 = v44 * 0.0037
		local v70 = math.floor(v69)
		v66.Text = string.format("<b><font color=\'#999999\'>%s</font></b>\n<font color=\'#FFD700\'>R$ %s</font> | <font color=\'#4EB5FF\'>$%s</font> | <font color=\'#00FF7F\'>DevEx: $%s</font>", "Past 1 Min", v44, v68, v70)
		local v71 = v_u_15["Past 5 Min"]
		local v72 = v45 * 0.0125
		local v73 = math.floor(v72)
		local v74 = v45 * 0.0037
		local v75 = math.floor(v74)
		v71.Text = string.format("<b><font color=\'#999999\'>%s</font></b>\n<font color=\'#FFD700\'>R$ %s</font> | <font color=\'#4EB5FF\'>$%s</font> | <font color=\'#00FF7F\'>DevEx: $%s</font>", "Past 5 Min", v45, v73, v75)
		local v76 = v_u_15["Past 15 Min"]
		local v77 = v46 * 0.0125
		local v78 = math.floor(v77)
		local v79 = v46 * 0.0037
		local v80 = math.floor(v79)
		v76.Text = string.format("<b><font color=\'#999999\'>%s</font></b>\n<font color=\'#FFD700\'>R$ %s</font> | <font color=\'#4EB5FF\'>$%s</font> | <font color=\'#00FF7F\'>DevEx: $%s</font>", "Past 15 Min", v46, v78, v80)
		local v81 = v_u_15["Past 1 Hr"]
		local v82 = v47 * 0.0125
		local v83 = math.floor(v82)
		local v84 = v47 * 0.0037
		local v85 = math.floor(v84)
		v81.Text = string.format("<b><font color=\'#999999\'>%s</font></b>\n<font color=\'#FFD700\'>R$ %s</font> | <font color=\'#4EB5FF\'>$%s</font> | <font color=\'#00FF7F\'>DevEx: $%s</font>", "Past 1 Hr", v47, v83, v85)
		v_u_15["Avg R$/s"].Text = string.format("<b><font color=\'#999999\'>Avg R$/s:</font></b> <font color=\'#FFD700\'>%.2f</font>", v44 / 60)
		v_u_15["Top Donator (1hr)"].Text = string.format("<b><font color=\'#999999\'>Top Donator (1hr):</font></b> <font color=\'#ffffff\'>%s</font> <font color=\'#FFD700\'>(R$ %d)</font>", v57, v54)
		v_u_15["Most Active Donator"].Text = string.format("<b><font color=\'#999999\'>Most Active Donator:</font></b> <font color=\'#ffffff\'>%s</font> <font color=\'#FFD700\'>(%dx)</font>", v58, v55)
		v_u_15["Anonymous Donations"].Text = string.format("<b><font color=\'#999999\'>Anonymous Donations:</font></b> <font color=\'#ffffff\'>%d</font>", v43)
		task.wait(1)
	end
end)
local v86 = game:GetService("UserInputService")
local v_u_87 = game:GetService("Players").LocalPlayer
local v_u_88 = true
local function v_u_91()
	-- upvalues: (copy) v_u_15, (ref) v_u_88, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	for v89, v90 in pairs(v_u_15) do
		v90.Visible = v_u_88 or ((v89 == "Top Donator (1hr)" or v89 == "Most Active Donator") and true or v89 == "Anonymous Donations")
	end
	v_u_3.Visible = v_u_88
	v_u_4.Visible = v_u_88
	v_u_5.Visible = v_u_88
end
v86.InputBegan:Connect(function(p92, p93)
	-- upvalues: (copy) v_u_87, (ref) v_u_88, (copy) v_u_91
	if not p93 then
		if p92.KeyCode == Enum.KeyCode.V and v_u_87.UserId == 151848836 then
			script.Parent.Visible = not script.Parent.Visible
			if script.Parent.Visible then
				v_u_88 = not v_u_88
				v_u_91()
			end
		end
	end
end)
