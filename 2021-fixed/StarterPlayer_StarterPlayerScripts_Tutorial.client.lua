-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")

local player = Players.LocalPlayer

player.Chatted:Connect(function(message)
	if string.lower(message) == "!tutorial" then
		local playerGui = player:WaitForChild("PlayerGui")
		local screenGui = playerGui:WaitForChild("ScreenGui")
		local Guis = screenGui:WaitForChild("TutorialA")
		Guis.Visible = not Guis.Visible
	end
end)