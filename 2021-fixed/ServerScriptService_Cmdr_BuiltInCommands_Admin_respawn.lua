-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "respawn";
	Description = "Respawns a player or a group of players.";
	Group = "DefaultAdmin";
	AutoExec = {
		"alias \"refresh|Respawns the player and returns them to their previous location.\" var= .refresh_pos ${position $1{player|Player}} && respawn $1 && tp $1 @${{var .refresh_pos}}"
	},
	Args = {
		{
			Type = "players";
			Name = "targets";
			Description = "The players to respawn."
		}
	}
}
