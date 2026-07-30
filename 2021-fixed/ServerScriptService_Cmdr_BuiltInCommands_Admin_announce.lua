-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "announce";
	Aliases = {"m"};
	Description = "Makes a server-wide announcement.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "string";
			Name = "text";
			Description = "The announcement text.";
		},
	};
}