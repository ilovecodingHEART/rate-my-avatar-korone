-- This is a script you would create in ServerScriptService, for example.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(script.Parent)

Cmdr:RegisterDefaultCommands() -- This loads the default set of commands that Cmdr comes with. (Optional)
Cmdr:RegisterHooksIn(script.Parent.Hooks)
Cmdr:RegisterCommandsIn(script.Parent.CmdrCommands)
-- Cmdr:RegisterCommandsIn(script.Parent.CmdrCommands) -- Register commands from your own folder. (Optional)