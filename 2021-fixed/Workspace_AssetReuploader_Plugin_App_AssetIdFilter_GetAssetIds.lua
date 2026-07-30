-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x4, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- !! MANUAL FIX REQUIRED: 1 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
--!strict
local NUMBER_ONLY_FILTER = "%d+"

export type FilterOptions = {
    WhitelistedInstances: { string },
    Instances: { Instance },
}

local function isValidId(id: number): boolean
	if id == 0 or id % 1 ~= 0 then return false end

	local idLength = math.floor(math.log10(math.abs(id))) + 1
	return idLength >= 7 and idLength <= 15 -- 7 is minimum length requirement for develop get assets info endpoint do not change
end

local function getId(filteredInstance: Instance, possibleId: any): { [number]: { Instance } }
    local id = tonumber(possibleId)
    if not id or not isValidId(id) then return {} end

    return { [id] = { filteredInstance } }
end

local function getStringIds(filteredInstance: Instance, str: string): { [number]: { Instance } }
    local idMap = {}
	for matchedString in string.gmatch(str, "%d+") do
		local id = tonumber(matchedString)
		if not id or idMap[id] or not isValidId(id) then continue end

		idMap[id] = { filteredInstance }
	end
    return idMap
end

local function getAnimationId(animation: Animation): { [number]: { Instance } }
    return getId(animation, string.match(animation.AnimationId, NUMBER_ONLY_FILTER))
end

local function getSoundId(sound: Sound): { [number]: { Instance } }
    return getId(sound, string.match(sound.SoundId, NUMBER_ONLY_FILTER))
end 

local function getScriptIds(scriptInstance: Script | LocalScript | ModuleScript): { [number]: { Instance } }
    return getStringIds(scriptInstance, scriptInstance.Source)
end

local function getStringValueIds(strValue: StringValue): { [number]: { Instance } }
    return getStringIds(strValue, strValue.Value)
end

local function getNumberValueId(numValue: NumberValue | IntValue): { [number]: { Instance } }
    return getId(numValue, numValue.Value)
end

local function getCharacterMesh(characterMesh: CharacterMesh): { [number]: { Instance } }
    return getId(characterMesh, characterMesh.MeshId)
end

local function getMeshPart(meshPart: MeshPart): { [number]: { Instance } }
    return getId(meshPart, string.match(meshPart.MeshId, NUMBER_ONLY_FILTER))
end

local function getSpecialMesh(specialMesh: SpecialMesh): { [number]: { Instance } }
    return getId(specialMesh, string.match(specialMesh.MeshId, NUMBER_ONLY_FILTER))
end

local instanceIdGetters: { [string]: (instance: any) -> { [number]: { Instance } } } = {
    Animation = getAnimationId,
    Sound = getSoundId,

    NumberValue = getNumberValueId,
    IntValue = getNumberValueId,
    StringValue = getStringValueIds,

    CharacterMesh = getCharacterMesh,
    MeshPart = getMeshPart,
    SpecialMesh = getSpecialMesh,
}

local function createFilterMap(instanceFilter: { string }): {[string]: (instance: Instance) -> { [number]: { Instance } }}
    local filterMap = {} :: any -- yes my code getting lazy i apologize... v2.0.0 will do good code
    for _, className in pairs(instanceFilter) --[[ 2021 ]] do
        if className == "LuaSourceContainer" then
            filterMap["LocalScript"] = getScriptIds
            filterMap["ModuleScript"] = getScriptIds
            filterMap["Script"] = getScriptIds
        else
            assert(instanceIdGetters[className], `{className} is not a supported instance`)
            filterMap[className] = instanceIdGetters[className]
        end
    end
    return filterMap
end

local function merge(originalIdMap: { [number]: { Instance } }, otherIdMap: { [number]: { Instance } })
    for id, instanceArray in pairs(otherIdMap) --[[ 2021 ]] do
        local idInstances = originalIdMap[id]
        if not idInstances then
            originalIdMap[id] = instanceArray
            continue -- << MANUAL FIX: continue (2021 cannot compile this) >>
        end

        for _, instance in pairs(instanceArray) --[[ 2021 ]] do
            if __2021_find(idInstances, instance) then continue end
            table.insert(idInstances :: { any }, instance)
        end
    end
end

return function(filterOptions: FilterOptions): { [number]: { Instance } }
    local idMap = {}
    local filterMap = createFilterMap(filterOptions.WhitelistedInstances)
    for _, instance in pairs(filterOptions.Instances) --[[ 2021 ]] do
        local className = instance.ClassName
        local parseId = filterMap[className]
        if not parseId then continue end

        merge(idMap, parseId(instance))
    end
    return idMap
end
