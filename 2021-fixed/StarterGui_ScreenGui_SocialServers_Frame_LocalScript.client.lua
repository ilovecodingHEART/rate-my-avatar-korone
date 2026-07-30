-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x1, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("TeleportService")
local v_u_3 = require(game.ReplicatedStorage.FeaturePlaces)
local v_u_4 = require(game.ReplicatedStorage.popup)
script.Parent.Social.Activated:Connect(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	v_u_4("info", "teleporting you, please stand by!")
	v_u_2:Teleport(130598004097945, game.Players.LocalPlayer)
	script.Parent.Parent.Visible = false
end)
script.Parent.Regular.Activated:Connect(function()
	script.Parent.Parent.Visible = false
end)
v_u_1.LocalPlayer.Idled:Connect(function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	print((("Player has been idle for %s seconds"):format(p5)))
	if v_u_3.IsSocialOnly then
		if p5 > 300 and p5 < 310 then
			v_u_4("warn", "you will be kicked in 10 seconds if you remain idle.")
		end
		if p5 >= 310 then
			v_u_1.LocalPlayer:Kick("You\'re not allowed to AFK in Social Servers.")
		end
	end
end)
