-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "var=";
	Aliases = {};
	Description = "Sets a stored value.";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "storedKey";
			Name = "Key";
			Description = "The key to set, saved in your user data store. Keys prefixed with . are not saved. Keys prefixed with $ are game-wide. Keys prefixed with $. are game-wide and non-saved.";
		},
		{
			Type = "string";
			Name = "Value";
			Description = "Value or values to set.";
			Default = "";
		}
	};

	ClientRun = function(context, key)
		context:GetStore("vars_used")[key] = true
	end
}
