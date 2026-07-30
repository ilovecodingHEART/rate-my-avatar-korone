-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")

return {
	Name = "hover";
	Description = "Returns the name of the player you are hovering over.";
	Group = "DefaultUtil";
	Args = {};

	ClientRun = function()
		local mouse = Players.LocalPlayer:GetMouse()
		local target = mouse.Target

		if not target then
			return ""
		end

		local p = Players:GetPlayerFromCharacter(target:FindFirstAncestorOfClass("Model"))

		return p and p.Name or ""
	end
}