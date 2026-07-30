-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "run";
	Aliases = {">"};
	AutoExec = {
		"alias \"discard|Run a command and discard the output.\" replace ${run $1} .* \\\"\\\""
	};
	Description = "Runs a given command string (replacing embedded commands).";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "string";
			Name = "Command";
			Description = "The command string to run"
		},
	};

	Run = function(context, commandString)
		return context.Cmdr.Util.RunCommandString(context.Dispatcher, commandString)
	end
}