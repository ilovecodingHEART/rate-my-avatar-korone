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