-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "goto-place";
	Aliases = {};
	Description = "Teleport to a Roblox place";
	Group = "DefaultAdmin";
	AutoExec = {
		"alias \"follow-player|Join a player in another server\" goto-place $1{players|Players} ${{get-player-place-instance $2{playerId|Target}}}",
		"alias \"rejoin|Rejoin this place. You might end up in a different server.\" goto-place $1{players|Players} ${get-player-place-instance ${me} PlaceId}"
	};
	Args = {
		{
			Type = "players";
			Name = "Players";
			Description = "The players you want to teleport";
		},
		{
			Type = "integer";
			Name = "Place ID";
			Description = "The Place ID you want to teleport to";
		},
		{
			Type = "string";
			Name = "JobId";
			Description = "The specific JobId you want to teleport to";
			Optional = true;
		}
	};
}