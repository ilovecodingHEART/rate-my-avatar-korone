-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-12-18 19:42:27
-- Luau version 6, Types version 3
-- Time taken: 0.001883 seconds

local TweenService_upvr = game:GetService("TweenService")
local function _(arg1, arg2, arg3, arg4) -- Line 3, Named "tween"
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local var2 = arg4
	if not var2 then
		var2 = Enum.EasingStyle.Linear
	end
	local any_Create_result1_2 = TweenService_upvr:Create(arg1, TweenInfo.new(arg2, var2), arg3)
	any_Create_result1_2:Play()
	return any_Create_result1_2
end
while true do
	local any_Create_result1 = TweenService_upvr:Create(script.Parent, TweenInfo.new(3, Enum.EasingStyle.Linear), {
		Rotation = script.Parent.Rotation - 20;
	})
	any_Create_result1:Play()
	any_Create_result1.Completed:Wait()
end