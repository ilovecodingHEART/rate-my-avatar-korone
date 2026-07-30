-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clear
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dependencies.captureDependencies);
local v2 = require(l_Parent_0.Dependencies.initDependency);
local v3 = require(l_Parent_0.Dependencies.useDependency);
local v4 = require(l_Parent_0.Logging.logErrorNonFatal);
local v5 = {};
local v6 = {
    __index = v5
};
local v7 = {
    __mode = "k"
};
v5.get = function(v8, v9) --[[ Line: 22 ]] --[[ Name: get ]]
    if v9 ~= false then
        v3(v8);
    end;
    return v8._value;
end;
v5.update = function(v10) --[[ Line: 33 ]] --[[ Name: update ]]
    for v11 in pairs(v10.dependencySet) do
        v11.dependentSet[v10] = nil;
    end;
    local l_dependencySet_0 = v10.dependencySet;
    local l__oldDependencySet_0 = v10._oldDependencySet;
    v10._oldDependencySet = l_dependencySet_0;
    v10.dependencySet = l__oldDependencySet_0;
    __2021_clear(v10.dependencySet);
    l_dependencySet_0, l__oldDependencySet_0 = v1(v10.dependencySet, v10._callback);
    if l_dependencySet_0 then
        local l__value_0 = v10._value;
        v10._value = l__oldDependencySet_0;
        for v15 in pairs(v10.dependencySet) do
            v15.dependentSet[v10] = true;
        end;
        return l__value_0 ~= l__oldDependencySet_0;
    else
        v4("computedCallbackError", l__oldDependencySet_0);
        local l_dependencySet_1 = v10.dependencySet;
        local l__oldDependencySet_1 = v10._oldDependencySet;
        v10._oldDependencySet = l_dependencySet_1;
        v10.dependencySet = l__oldDependencySet_1;
        for v18 in pairs(v10.dependencySet) do
            v18.dependentSet[v10] = true;
        end;
        return false;
    end;
end;
return function(v19) --[[ Line: 75 ]] --[[ Name: Computed ]]
    local v20 = setmetatable({
        type = "State", 
        kind = "Computed", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v7), 
        _oldDependencySet = {}, 
        _callback = v19, 
        _value = nil
    }, v6);
    v2(v20);
    v20:update();
    return v20;
end;