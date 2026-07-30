-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-26 08:01:34
-- Luau version 6, Types version 3
-- Time taken: 0.001635 seconds

local UIGradient_upvr = script.Parent:WaitForChild("UIGradient")
UIGradient_upvr.Offset = Vector2.new(-1, 0)
UIGradient_upvr.Color = (function() -- Line 5, Named "generateHighContrastPastelRainbow"
	for i = 0, 12 do
		local var3 = i / 12
		if var3 < 0.75 or 0.95 < var3 then
			table.insert({}, ColorSequenceKeypoint.new(var3, Color3.fromHSV(var3, 0.45, 1)))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return ColorSequence.new({})
end)()
local TweenService_upvr = game:GetService("TweenService")
task.spawn(function() -- Line 26, Named "animateGradient"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: UIGradient_upvr (readonly)
	]]
	while true do
		local any_Create_result1 = TweenService_upvr:Create(UIGradient_upvr, TweenInfo.new(5, Enum.EasingStyle.Linear), {
			Offset = Vector2.new(1, 0);
		})
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		UIGradient_upvr.Offset = Vector2.new(-1, 0)
	end
end)