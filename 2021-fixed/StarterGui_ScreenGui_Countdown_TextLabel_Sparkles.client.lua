-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = game:GetService("TweenService")
while wait(math.random(90, 120) / 100) do
	spawn(function()
		-- upvalues: (copy) v_u_1
		local v2 = script.Sparkle:Clone()
		v2.Parent = script.Parent
		v2.Position = UDim2.new(math.random(20, 80) / 100, 0, math.random(20, 80) / 100, 0)
		local v3 = v2.UIScale
		local v4 = {
			["Scale"] = math.random(8, 18) / 10
		}
		local v5 = Enum.EasingStyle.Back
		v_u_1:Create(v3, TweenInfo.new(0.3, v5 or Enum.EasingStyle.Quint), v4):Play()
		wait(0.3)
		v_u_1:Create(v2.UIScale, TweenInfo.new(2, Enum.EasingStyle.Quint), {
			["Scale"] = 0
		}):Play()
		wait(1.8)
		v2:Destroy()
	end)
end
