-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 05:01:43
-- Luau version 6, Types version 3
-- Time taken: 0.001235 seconds

local UIGradient_upvr = script.Parent:WaitForChild("UIGradient")
UIGradient_upvr.Color = (function(arg1) -- Line 5, Named "generateCyclicRainbow"
	arg1 = math.clamp(arg1 or 12, 3, 12)
	local var4 = arg1
	local module = {}
	table.insert(module, ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0.55, 1)))
	for i = 1, var4 - 2 do
		table.insert(module, ColorSequenceKeypoint.new(i / (var4 - 1), Color3.fromHSV(i / (var4 - 1), 0.55, 1)))
	end
	table.insert(module, ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 0.55, 1)))
	return ColorSequence.new(module)
end)(12)
UIGradient_upvr.Offset = Vector2.new(-0.5, 0)
local TweenService_upvr = game:GetService("TweenService")
task.spawn(function() -- Line 28, Named "animateGradientPingPong"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: UIGradient_upvr (readonly)
	]]
	local any_Create_result1 = TweenService_upvr:Create(UIGradient_upvr, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		Offset = Vector2.new(0.5, 0);
	})
	local any_Create_result1_2 = TweenService_upvr:Create(UIGradient_upvr, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		Offset = Vector2.new(-0.5, 0);
	})
	while true do
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		any_Create_result1_2:Play()
		any_Create_result1_2.Completed:Wait()
	end
end)