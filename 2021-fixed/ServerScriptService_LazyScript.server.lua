-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players");
local Remotes = require(game.ReplicatedStorage:WaitForChild("Remotes"));
local CommandsModule = require(game.ServerScriptService.Modules.Commands);

Players.PlayerAdded:Connect(function(player)
	if player then
		player.Chatted:Connect(function(msg)
			if msg:sub(1, 5) == ("GetDomate") then 
				
			end;
		end);
	end;
end);