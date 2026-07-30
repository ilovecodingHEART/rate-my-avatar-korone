-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- !! MANUAL FIX REQUIRED: 1 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
return {
	Name = "run-lines";
	Aliases = {};
	Description = "Splits input by newlines and runs each line as its own command. This is used by the init-run command.";
	Group = "DefaultUtil";
	Args = {
		{
			Type = "string";
			Name = "Script";
			Description = "The script to parse.";
			Default = "";
		}
	};

	ClientRun = function(context, text)
		if #text == 0 then
			return ""
		end

		local shouldPrintOutput = context.Dispatcher:Run("var", "INIT_PRINT_OUTPUT") ~= ""

		local commands = text:gsub("\n+", "\n"):split("\n")

		for _, command in ipairs(commands) do
			if command:sub(1, 1) == "#" then
				continue -- << MANUAL FIX: continue (2021 cannot compile this) >>
			end

			local output = context.Dispatcher:EvaluateAndRun(command)

			if shouldPrintOutput then
				context:Reply(output)
			end
		end

		return ""
	end
}
