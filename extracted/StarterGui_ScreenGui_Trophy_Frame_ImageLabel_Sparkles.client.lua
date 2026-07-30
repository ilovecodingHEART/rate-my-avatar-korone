-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 10:00:02
-- Luau version 6, Types version 3
-- Time taken: 0.002966 seconds

local TweenService_upvr = game:GetService("TweenService")
local function _(arg1, arg2, arg3, arg4) -- Line 4, Named "tween"
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local var2 = arg4
	if not var2 then
		var2 = Enum.EasingStyle.Quint
	end
	TweenService_upvr:Create(arg1, TweenInfo.new(arg2, var2), arg3):Play()
end
while wait(math.random(90, 150) / 100) do
	spawn(function() -- Line 10
		--[[ Upvalues[1]:
			[1]: TweenService_upvr (readonly)
		]]
		local clone = script.Sparkle:Clone()
		clone.Parent = script.Parent
		clone.Position = UDim2.new(math.random(20, 80) / 100, 0, math.random(20, 80) / 100, 0)
		local Back = Enum.EasingStyle.Back
		if not Back then
			Back = Enum.EasingStyle.Quint
		end
		TweenService_upvr:Create(clone.UIScale, TweenInfo.new(0.3, Back), {
			Scale = math.random(8, 18) / 20;
		}):Play()
		wait(0.3)
		TweenService_upvr:Create(clone.UIScale, TweenInfo.new(2, Enum.EasingStyle.Quint), {
			Scale = 0;
		}):Play()
		wait(1.8)
		clone:Destroy()
	end)
end