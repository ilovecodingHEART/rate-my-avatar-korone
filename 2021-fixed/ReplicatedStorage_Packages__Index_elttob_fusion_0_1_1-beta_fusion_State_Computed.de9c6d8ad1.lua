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
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Dependencies.captureDependencies);
local v3 = require(l_Parent_0.Dependencies.initDependency);
local v4 = require(l_Parent_0.Dependencies.useDependency);
local v5 = require(l_Parent_0.Logging.parseError);
local v6 = require(l_Parent_0.Logging.logErrorNonFatal);
local v7 = require(l_Parent_0.Utility.cleanup);
local v8 = {};
local v9 = {
    __index = v8
};
local v10 = {
    __mode = "k"
};
v8.get = function(v11, v12) --[[ Line: 27 ]] --[[ Name: get ]]
    if v12 ~= false then
        v4(v11);
    end;
    return v11._outputTable;
end;
v8.update = function(v13) --[[ Line: 52 ]] --[[ Name: update ]]
    local l__inputIsState_0 = v13._inputIsState;
    local l__oldInputTable_0 = v13._oldInputTable;
    local l__inputTable_0 = v13._inputTable;
    local l__oldOutputTable_0 = v13._oldOutputTable;
    local l__outputTable_0 = v13._outputTable;
    if l__inputIsState_0 then
        l__inputTable_0 = l__inputTable_0:get(false);
    end;
    local v19 = false;
    for v20 in pairs(v13.dependencySet) do
        v20.dependentSet[v13] = nil;
    end;
    local l_dependencySet_0 = v13.dependencySet;
    local l__oldDependencySet_0 = v13._oldDependencySet;
    v13._oldDependencySet = l_dependencySet_0;
    v13.dependencySet = l__oldDependencySet_0;
    __2021_clear(v13.dependencySet);
    if l__inputIsState_0 then
        v13._inputTable.dependentSet[v13] = true;
        v13.dependencySet[v13._inputTable] = true;
    end;
    for v23, v24 in pairs(l__inputTable_0) do
        local v25 = v13._keyData[v23];
        if v25 == nil then
            v25 = {
                dependencySet = setmetatable({}, v10), 
                oldDependencySet = setmetatable({}, v10), 
                dependencyValues = setmetatable({}, v10)
            };
            v13._keyData[v23] = v25;
        end;
        local v26 = l__oldInputTable_0[v23] ~= v24;
        if not v26 then
            for v27, v28 in pairs(v25.dependencyValues) do
                if v28 ~= v27:get(false) then
                    v26 = true;
                    break;
                end;
            end;
        end;
        if v26 then
            local l_dependencySet_1 = v25.dependencySet;
            local l_oldDependencySet_0 = v25.oldDependencySet;
            v25.oldDependencySet = l_dependencySet_1;
            v25.dependencySet = l_oldDependencySet_0;
            __2021_clear(v25.dependencySet);
            l_dependencySet_1 = l__oldOutputTable_0[v23];
            local v31;
            l_oldDependencySet_0, v31 = v2(v25.dependencySet, v13._processor, v23, v24);
            if l_oldDependencySet_0 then
                if l_dependencySet_1 ~= v31 then
                    v19 = true;
                    if l_dependencySet_1 ~= nil then
                        local v32, v33 = xpcall(v13._destructor, v5, l_dependencySet_1);
                        if not v32 then
                            v6("pairsDestructorError", v33);
                        end;
                    end;
                end;
                l__oldInputTable_0[v23] = v24;
                l__oldOutputTable_0[v23] = v31;
                l__outputTable_0[v23] = v31;
            else
                local l_dependencySet_2 = v25.dependencySet;
                local l_oldDependencySet_1 = v25.oldDependencySet;
                v25.oldDependencySet = l_dependencySet_2;
                v25.dependencySet = l_oldDependencySet_1;
                v6("pairsProcessorError", v31);
            end;
        end;
        for v36 in pairs(v25.dependencySet) do
            v25.dependencyValues[v36] = v36:get(false);
            v13.dependencySet[v36] = true;
            v36.dependentSet[v13] = true;
        end;
    end;
    for v37 in pairs(l__oldInputTable_0) do
        if l__inputTable_0[v37] == nil then
            local v38 = l__oldOutputTable_0[v37];
            if v38 ~= nil then
                local v39, v40 = xpcall(v13._destructor, v5, v38);
                if not v39 then
                    v6("pairsDestructorError", v40);
                end;
            end;
            l__oldInputTable_0[v37] = nil;
            l__oldOutputTable_0[v37] = nil;
            l__outputTable_0[v37] = nil;
            v13._keyData[v37] = nil;
        end;
    end;
    return v19;
end;
return function(v41, v42, v43) --[[ Line: 181 ]] --[[ Name: ComputedPairs ]]
    if v43 == nil then
        v43 = v7;
    end;
    local v44 = false;
    if v41.type == "State" then
        v44 = typeof(v41.get) == "function";
    end;
    local v45 = setmetatable({
        type = "State", 
        kind = "ComputedPairs", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v10), 
        _oldDependencySet = {}, 
        _processor = v42, 
        _destructor = v43, 
        _inputIsState = v44, 
        _inputTable = v41, 
        _oldInputTable = {}, 
        _outputTable = {}, 
        _oldOutputTable = {}, 
        _keyData = {}
    }, v9);
    v3(v45);
    v45:update();
    return v45;
end;