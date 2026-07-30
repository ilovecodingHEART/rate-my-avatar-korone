local Remotes = require(game.ReplicatedStorage.Remotes);
local ItemsModule = require(game.ServerScriptService.Modules.Items);
Remotes.Function("FetchCreateLink").OnServerInvoke = function(player) 
	return ("https://create.roblox.com/dashboard/creations/experiences/%*/passes/create"):format(ItemsModule:FetchPlayerGame(player)) or "All your experiences are private, make one public and add a gamepass by going to https://create.roblox.com/dashboard/creations";
end;