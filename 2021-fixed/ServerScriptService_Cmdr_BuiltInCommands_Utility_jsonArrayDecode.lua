-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "json-array-decode";
	Aliases = {};
	Description = "Decodes a JSON Array into a comma-separated list";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "json";
			Name = "JSON";
			Description = "The JSON array."
		},
	};

	ClientRun = function(_, value)
		if type(value) ~= "table" then
			value = { value }
		end

		return table.concat(value, ",")
	end
}
