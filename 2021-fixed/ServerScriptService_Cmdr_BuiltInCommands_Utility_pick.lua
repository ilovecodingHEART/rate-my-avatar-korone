-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "pick";
	Aliases = {};
	Description = "Picks a value out of a comma-separated list.";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "integer";
			Name = "Index to pick";
			Description = "The index of the item you want to pick";
		},
		{
			Type = "string";
			Name = "CSV";
			Description = "The comma-separated list"
		}
	};

	Run = function(_, index, list)
		return list:split(",")[index] or ""
	end
}