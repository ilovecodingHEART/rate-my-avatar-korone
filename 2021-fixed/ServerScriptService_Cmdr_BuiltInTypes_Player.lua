-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Util = require(script.Parent.Parent.Shared.Util)
local Players = game:GetService("Players")

local playerType = {
	Transform = function (text)
		local findPlayer = Util.MakeFuzzyFinder(Players:GetPlayers())

		return findPlayer(text)
	end;

	Validate = function (players)
		return #players > 0, "No player with that name could be found."
	end;

	Autocomplete = function (players)
		return Util.GetNames(players)
	end;

	Parse = function (players)
		return players[1]
	end;

	Default = function(player)
		return player.Name
	end;

	ArgumentOperatorAliases = {
		me = ".";
		all = "*";
		others = "**";
		random = "?";
	};
}

return function (cmdr)
	cmdr:RegisterType("player", playerType)
	cmdr:RegisterType("players", Util.MakeListableType(playerType, {
		Prefixes = "% teamPlayers";
	}))
end
