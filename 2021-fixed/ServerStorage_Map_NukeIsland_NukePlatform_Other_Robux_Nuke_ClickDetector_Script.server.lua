-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local ClickDetector = script.Parent
local ServerStorage = game:GetService("ServerStorage")

ClickDetector.MouseClick:Connect(function(player)

	local Backpack = player:FindFirstChild("Backpack")

	if Backpack then

		if Backpack:FindFirstChild("NukePlushie") then

			return

		end

	end

	local NukePlushie = ServerStorage.NukePlushie:Clone()
	NukePlushie.Parent = Backpack

end)