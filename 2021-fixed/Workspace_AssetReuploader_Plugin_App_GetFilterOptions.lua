-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--!strict
local AssetIdFilter = require("./AssetIdFilter")

local pluginSettings: { [string]: { string } } = {
    StrVals = { "StringValue" },
    Scripts = { "LuaSourceContainer" },
    NumVals = { "NumberValue", "IntValue" }
}

return function(plugin: Plugin, filteredInstances: { Instance }): AssetIdFilter.FilterOptions
    local instanceArray: { string } = {}
    for settingName, classNames in pairs(pluginSettings) --[[ 2021 ]] do
        if not plugin:GetSetting(settingName) then continue end

        for _, className in pairs(classNames) --[[ 2021 ]] do
            table.insert(instanceArray, className)
        end
    end

    return {
        WhitelistedInstances = instanceArray,
        Instances = filteredInstances
    }
end
