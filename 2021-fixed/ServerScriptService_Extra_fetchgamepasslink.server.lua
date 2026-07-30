-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x1, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Remotes = require(game.ReplicatedStorage.Remotes);
local ItemsModule = require(game.ServerScriptService.Modules.Items);
Remotes.Function("FetchCreateLink").OnServerInvoke = function(player) 
	return ("https://create.roblox.com/dashboard/creations/experiences/%s/passes/create"):format(ItemsModule:FetchPlayerGame(player)) or "All your experiences are private, make one public and add a gamepass by going to https://create.roblox.com/dashboard/creations";
end;