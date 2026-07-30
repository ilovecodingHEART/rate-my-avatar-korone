-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = require(game.ReplicatedStorage.LiveEventInfo).start
local v_u_2 = script.Parent
game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local function v_u_17(p4)
	local v5 = p4 / 86400
	local v6 = math.floor(v5)
	local v7 = p4 % 86400 / 3600
	local v8 = math.floor(v7)
	local v9 = p4 % 3600 / 60
	local v10 = math.floor(v9)
	local v11 = p4 % 60
	local v12 = {}
	if v6 > 1 then
		local v13 = v6 .. "d"
		table.insert(v12, v13)
	end
	if v8 > 0 then
		local v14 = v8 .. "h"
		table.insert(v12, v14)
	end
	if v10 > 0 then
		local v15 = v10 .. "m"
		table.insert(v12, v15)
	end
	if v11 > 0 then
		local v16 = v11 .. "s"
		table.insert(v12, v16)
	end
	if #v12 == 0 then
		table.insert(v12, "0s")
	end
	return table.concat(v12, "")
end
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_17
	while true do
		local v18 = v_u_1 - DateTime.now().UnixTimestamp
		if v18 <= 0 then
			break
		end
		v_u_2.TextColor3 = Color3.fromRGB(255, 217, 255)
		local v19 = v_u_2
		local v20 = {
			["TextColor3"] = Color3.fromRGB(255, 255, 255)
		}
		v_u_3:Create(v19, TweenInfo.new(1, Enum.EasingStyle.Quint), v20):Play()
		v_u_2.Text = v_u_17(v18)
		task.wait(1)
	end
	v_u_2.Text = "0s"
	local v21 = v_u_2.Parent
	if v21 then
		v21.Visible = true
	end
end)
