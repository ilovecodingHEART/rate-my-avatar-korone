-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "fetch";
	Aliases = {};
	Description = "Fetch a value from the Internet";
	Group = "DefaultDebug";
	Args = {
		{
			Type = "url";
			Name = "URL";
			Description = "The URL to fetch.";
		}
	};
}