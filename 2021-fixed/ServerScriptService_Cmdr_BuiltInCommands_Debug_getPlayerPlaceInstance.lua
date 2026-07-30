-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "get-player-place-instance";
	Aliases = {};
	Description = "Returns the target player's Place ID and the JobId separated by a space. Returns 0 if the player is offline or something else goes wrong.";
	Group = "DefaultDebug";
	Args = {
		{
			Type = "playerId";
			Name = "Player";
			Description = "Get the place instance of this player";
		},
		function(context)
			return {
				Type = context.Cmdr.Util.MakeEnumType("PlaceInstance Format", {"PlaceIdJobId", "PlaceId", "JobId"}),
				Name = "Format";
				Description = "What data to return. PlaceIdJobId returns both separated by a space.";
				Default = "PlaceIdJobId";
			}
		end
	};
}