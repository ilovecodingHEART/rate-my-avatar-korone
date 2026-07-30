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
-- by 22slipz

local Owners = {"22Slipz", "IlIIllIIlIlIlIIII", "StrawhatDevelopment"}

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if __2021_find(Owners, plr.Name) then
			if string.find(msg, "!gun") then
				local tool = game.ServerStorage.PlayerTools.Raygun:Clone()
				tool.Parent = plr.Backpack
			end
		end
	end);
end);