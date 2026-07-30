-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Logging.logError);
local v2 = require(l_Parent_0.Animation.unpackType);
local v3 = require(l_Parent_0.Animation.SpringScheduler);
local v4 = require(l_Parent_0.Dependencies.useDependency);
local v5 = require(l_Parent_0.Dependencies.initDependency);
local _ = require(l_Parent_0.Dependencies.updateAll);
local v7 = {};
local v8 = {
    __index = v7
};
local v9 = {
    __mode = "k"
};
v7.get = function(v10, v11) --[[ Line: 25 ]] --[[ Name: get ]]
    if v11 ~= false then
        v4(v10);
    end;
    return v10._currentValue;
end;
v7.update = function(v12) --[[ Line: 44 ]] --[[ Name: update ]]
    local v13 = v12._goalState:get(false);
    local l__currentType_0 = v12._currentType;
    local v15 = typeof(v13);
    v12._goalValue = v13;
    v12._currentType = v15;
    local v16 = v2(v13, v15);
    local v17 = #v16;
    v12._springGoals = v16;
    if v15 ~= l__currentType_0 then
        local v18 = table.create(v17, 0);
        local v19 = table.create(v17, 0);
        for v20, v21 in ipairs(v16) do
            v18[v20] = v21;
        end;
        v12._springPositions = v18;
        v12._springVelocities = v19;
        v12._currentValue = v12._goalValue;
        v3.remove(v12);
        return true;
    elseif v17 == 0 then
        v12._currentValue = v12._goalValue;
        v3.remove(v12);
        return true;
    else
        v3.add(v12);
        return false;
    end;
end;
return function(v22, v23, v24) --[[ Line: 176 ]] --[[ Name: Spring ]]
    if v23 == nil then
        v23 = 10;
    elseif v23 < 0 then
        v1("invalidSpringSpeed", nil, v23);
    end;
    if v24 == nil then
        v24 = 1;
    elseif v24 < 0 then
        v1("invalidSpringDamping", nil, v24);
    end;
    local v25 = setmetatable({
        type = "State", 
        kind = "Spring", 
        dependencySet = {
            [v22] = true
        }, 
        dependentSet = setmetatable({}, v9), 
        _speed = v23, 
        _damping = v24, 
        _goalState = v22, 
        _goalValue = nil, 
        _currentType = nil, 
        _currentValue = nil, 
        _springPositions = nil, 
        _springGoals = nil, 
        _springVelocities = nil
    }, v8);
    v5(v25);
    v22.dependentSet[v25] = true;
    v25:update();
    return v25;
end;