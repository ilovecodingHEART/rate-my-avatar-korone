-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "teleport";
	Aliases = {"tp"};
	Description = "Teleports a player or set of players to one target.";
	Group = "DefaultAdmin";
	AutoExec = {
		"alias \"bring|Brings a player or set of players to you.\" teleport $1{players|players|The players to bring} ${me}";
		"alias \"to|Teleports you to another player or location.\" teleport ${me} $1{player @ vector3|Destination|The player or location to teleport to}";
	};
	Args = {
		{
			Type = "players";
			Name = "From";
			Description = "The players to teleport";
		},
		{
			Type = "player @ vector3";
			Name = "Destination";
			Description = "The player to teleport to"
		}
	};
}