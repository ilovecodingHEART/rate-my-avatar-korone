-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local version = "v1.12.0"

return {
	Name = "version",
	Args = {},
	Description = "Shows the current version of Cmdr",
	Group = "DefaultDebug",

	Run = function()
		return ("Cmdr Version %s"):format(version)
	end,
}
