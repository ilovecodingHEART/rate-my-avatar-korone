-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = script.Parent:WaitForChild("UIGradient")
local v_u_2 = game:GetService("TweenService")
v_u_1.Color = (function()
	local v3 = {
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 180, 0)),
		ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 200, 50)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 80)),
		ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 200, 50)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 180, 0))
	}
	return ColorSequence.new(v3)
end)()
v_u_1.Offset = Vector2.new(-0.5, 0)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v4 = v_u_2:Create(v_u_1, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		["Offset"] = Vector2.new(0.5, 0)
	})
	local v5 = v_u_2:Create(v_u_1, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		["Offset"] = Vector2.new(-0.5, 0)
	})
	while true do
		v4:Play()
		v4.Completed:Wait()
		v5:Play()
		v5.Completed:Wait()
	end
end)
