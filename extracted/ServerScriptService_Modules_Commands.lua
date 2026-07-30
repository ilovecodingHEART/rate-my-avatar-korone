-- lazy
local cmds = {}

local Remotes = require(game.ReplicatedStorage:WaitForChild("Remotes"));

function cmds:GetDonated(player)
	local GetDonated = Remotes.Function("GetDonated"):InvokeServer(player);
	print(("Donated for @%* : %*"):format(player.Name, GetDonated));
	return GetDonated;
end;
function cmds:RandomCustomCommand(player)
	print('No bro lol');
end;

return cmds
