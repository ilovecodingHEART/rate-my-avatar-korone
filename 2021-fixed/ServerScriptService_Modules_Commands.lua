-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- lazy
local cmds = {}

local Remotes = require(game.ReplicatedStorage:WaitForChild("Remotes"));

function cmds:GetDonated(player)
	local GetDonated = Remotes.Function("GetDonated"):InvokeServer(player);
	print(("Donated for @%s : %s"):format(player.Name, GetDonated));
	return GetDonated;
end;
function cmds:RandomCustomCommand(player)
	print('No bro lol');
end;

return cmds
