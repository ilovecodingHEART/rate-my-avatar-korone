-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local HttpService = game:GetService("HttpService")

return {
	Name = "json-array-encode";
	Aliases = {};
	Description = "Encodes a comma-separated list into a JSON array";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "string";
			Name = "CSV";
			Description = "The comma-separated list"
		},
	};

	Run = function(_, text)
		return HttpService:JSONEncode(text:split(","))
	end
}