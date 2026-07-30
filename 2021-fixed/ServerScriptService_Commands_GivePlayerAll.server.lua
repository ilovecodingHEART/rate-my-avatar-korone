-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- Don't put your, user in here

local Owners = {"StrawhatDevelopment"}
local ToolsFolder = game.ServerStorage:WaitForChild("PlayerTools")

local function GiveTools(plr)
	local backpack = plr:WaitForChild("Backpack")

	for _, tool in ipairs(ToolsFolder:GetChildren()) do
		if tool:IsA("Tool") then
			local clone = tool:Clone()
			clone.Parent = backpack
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if __2021_find(Owners, plr.Name) then

		plr.CharacterAdded:Connect(function()
			GiveTools(plr)
		end)

	end
end)