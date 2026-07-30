-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "convertTimestamp";
	Aliases = { "date" },
	Description = "Convert a timestamp to a human-readable format.";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "number";
			Name = "timestamp";
			Description = "A numerical representation of a specific moment in time.";
			Optional = true
		}
	};
	ClientRun = function(_, timestamp)
		timestamp = timestamp or os.time()
		return `{os.date("%x", timestamp)} {os.date("%X", timestamp)}`
	end
}
