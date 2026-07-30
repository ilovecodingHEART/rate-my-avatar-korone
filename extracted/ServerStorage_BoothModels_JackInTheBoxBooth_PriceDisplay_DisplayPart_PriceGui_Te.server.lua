-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = game:GetService("Players")
game:GetService("CollectionService")
local v_u_2 = game:GetService("TweenService")
local _ = v1.LocalPlayer
function tween(p3, p4, p5)
	-- upvalues: (copy) v_u_2
	v_u_2:Create(p3, TweenInfo.new(p4), p5):Play()
end
local v_u_6 = script.Parent
spawn(function()
	-- upvalues: (copy) v_u_6
	local v7 = {
		Color3.fromRGB(255, 70, 70),
		Color3.fromRGB(255, 127, 0),
		Color3.fromRGB(255, 230, 0),
		Color3.fromRGB(50, 255, 50),
		Color3.fromRGB(10, 150, 255),
		Color3.fromRGB(220, 0, 255)
	}
	local v8 = 1
	while true do
		local v9 = v8 % #v7 + 1
		local v10 = {
			["TextColor3"] = v7[v9]
		}
		tween(v_u_6, 1, v10)
		v8 = v9
		wait(0.5)
	end
end)
