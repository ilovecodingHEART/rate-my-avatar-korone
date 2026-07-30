-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--!strict
local AssetIdFilter = {}

local getAssetIds = require("./AssetIdFilter/GetAssetIds")
local changeIds = require("./AssetIdFilter/ChangeIds")

export type FilterOptions = getAssetIds.FilterOptions

function AssetIdFilter.filterInstances(filterOptions: getAssetIds.FilterOptions): { [number]: { Instance } }
    return getAssetIds(filterOptions)
end

function AssetIdFilter.getIdArray(filteredIds: { [number]: { Instance } } ): { number }
    local idArray = {}
    for id, _ in pairs(filteredIds) --[[ 2021 ]] do
        table.insert(idArray, id)
    end
    return idArray
end

function AssetIdFilter.replaceIds(filteredIds: { [number]: { Instance } }, idsToChange: { changeIds.IdPair })
    changeIds(filteredIds, idsToChange)
end

return AssetIdFilter
