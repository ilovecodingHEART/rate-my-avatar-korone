-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x2, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
local ARGUMENT_SHORTHANDS = [[
Argument Shorthands
-------------------
.   Me/Self
*   All/Everyone
**  Others
?   Random
?N  List of N random values
]]

local TIPS = [[
Tips
----
• Utilize the Tab key to automatically complete commands
• Easily select and copy command output
]]

return {
	Name = "help";
	Description = "Displays a list of all commands, or inspects one command.";
	Group = "Help";
	Args = {
		{
			Type = "command";
			Name = "Command";
			Description = "The command to view information on";
			Optional = true;
		},
	};

	ClientRun = function (context, commandName)
		if commandName then
			local command = context.Cmdr.Registry:GetCommand(commandName)
			context:Reply(`Command: {command.Name}`, Color3.fromRGB(230, 126, 34))
			if command.Aliases and #command.Aliases > 0 then
				context:Reply(`Aliases: {table.concat(command.Aliases, ", ")}`, Color3.fromRGB(230, 230, 230))
			end
			context:Reply(command.Description, Color3.fromRGB(230, 230, 230))
			for i, arg in ipairs(command.Args) do
				context:Reply(
					`#{i} {arg.Name}{if arg.Optional == true then "?" else ""}: {arg.Type} - {arg.Description}`
				)
			end
		else
			context:Reply(ARGUMENT_SHORTHANDS)
			context:Reply(TIPS)

			local commands = context.Cmdr.Registry:GetCommands()
			table.sort(commands, function(a, b)
				return __2021_if(function() return a.Group and b.Group end, function() return a.Group < b.Group end, function() return a.Group end)
			end)
			local lastGroup
			for _, command in ipairs(commands) do
				command.Group = command.Group or "No Group"
				if lastGroup ~= command.Group then
					context:Reply(`\n{command.Group}\n{string.rep("-", #command.Group)}`)
					lastGroup = command.Group
				end
				context:Reply(__2021_if(function() return command.Description end, function() return `{command.Name} - {command.Description}` end, function() return command.Name end))
			end
		end
		return ""
	end;
}
