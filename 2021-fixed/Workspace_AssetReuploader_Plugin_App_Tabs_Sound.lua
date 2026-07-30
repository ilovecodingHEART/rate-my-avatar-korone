-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--!strict
local getFilterOptions = require("../GetFilterOptions")
local reuploadIds = require("../ReuploadIds")
local UiLibrary = require("../../UiLibrary")

local Selection = game:GetService("Selection")

return function(ui: UiLibrary.Ui, plugin: Plugin)
    local tab = ui:CreateTab("Sound")

    tab:CreateButton("Reupload", function()
        local filter = getFilterOptions(plugin, game:GetDescendants())
        table.insert(filter.WhitelistedInstances, "Sound")

		reuploadIds(plugin, ui, filter, "Sound", _G.getPlaceList()) -- forgive me
	end)
	
	tab:CreateButton("Reupload Selected", function()
        local filter = {
            WhitelistedInstances = { "Sound", "StringValue", "NumberValue", "IntValue", "LuaSourceContainer" },
            Instances = Selection:Get()
        }

        reuploadIds(plugin, ui, filter, "Sound", _G.getPlaceList()) -- forgive me
	end)


end
