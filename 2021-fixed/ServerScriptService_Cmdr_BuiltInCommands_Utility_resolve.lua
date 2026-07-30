-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "resolve";
	Aliases = {};
	Description = "Resolves Argument Value Operators into lists. E.g., resolve players * gives you a list of all players.";
	Group = "DefaultUtil";
	AutoExec = {
		"alias \"me|Displays your username\" resolve players ."
	};
	Args = {
		{
			Type = "type";
			Name = "Type";
			Description = "The type for which to resolve"
		},
		function (context)
			if context:GetArgument(1):Validate() == false then
				return
			end

			return {
				Type = context:GetArgument(1):GetValue();
				Name = "Argument Value Operator";
				Description = "The value operator to resolve. One of: * ** . ? ?N";
				Optional = true;
			}
		end
	};

	Run = function(context)
		return table.concat(context:GetArgument(2).RawSegments, ",")
	end
}