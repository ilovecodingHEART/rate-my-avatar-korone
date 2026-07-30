-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "len";
	Aliases = {};
	Description = "Returns the length of a comma-separated list";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "string";
			Name = "CSV";
			Description = "The comma-separated list"
		}
	};

	Run = function(_, list)
		return #(list:split(","))
	end
}