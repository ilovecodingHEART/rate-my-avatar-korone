-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-06-10 00:46:35
-- Luau version 6, Types version 3
-- Time taken: 0.000544 seconds

local Parent_upvr = script.Parent
local TweenService_upvr = game:GetService("TweenService")
local function tweenPadding(arg1) -- Line 10
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: Parent_upvr (readonly)
	]]
	local any_Create_result1 = TweenService_upvr:Create(Parent_upvr, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		PaddingBottom = UDim.new(arg1, 0);
	})
	any_Create_result1:Play()
	return any_Create_result1
end
while Parent_upvr:IsDescendantOf(game) do
	tweenPadding(0.1).Completed:Wait()
	tweenPadding(0.05).Completed:Wait()
end