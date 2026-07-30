-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "kill";
	Aliases = {"slay"};
	Description = "Kills a player or set of players.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "victims";
			Description = "The players to kill.";
		},
	};
}