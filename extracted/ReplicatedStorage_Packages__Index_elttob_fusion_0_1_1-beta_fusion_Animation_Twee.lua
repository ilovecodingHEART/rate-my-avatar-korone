-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Animation.TweenScheduler);
local v2 = require(l_Parent_0.Dependencies.useDependency);
local v3 = require(l_Parent_0.Dependencies.initDependency);
local v4 = {};
local v5 = {
    __index = v4
};
local v6 = {
    __mode = "k"
};
v4.get = function(v7, v8) --[[ Line: 22 ]] --[[ Name: get ]]
    if v8 ~= false then
        v2(v7);
    end;
    return v7._currentValue;
end;
v4.update = function(v9) --[[ Line: 33 ]] --[[ Name: update ]]
    v9._prevValue = v9._currentValue;
    v9._nextValue = v9._goalState:get(false);
    v9._currentTweenStartTime = os.clock();
    v9._currentTweenInfo = v9._tweenInfo;
    local v10 = v9._tweenInfo.DelayTime + v9._tweenInfo.Time;
    if v9._tweenInfo.Reverses then
        v10 = v10 + v9._tweenInfo.Time;
    end;
    v9._currentTweenDuration = v10 * v9._tweenInfo.RepeatCount;
    v1.add(v9);
    return false;
end;
return function(v11, v12) --[[ Line: 63 ]] --[[ Name: Tween ]]
    local v13 = v11:get(false);
    local v14 = setmetatable({
        type = "State", 
        kind = "Tween", 
        dependencySet = {
            [v11] = true
        }, 
        dependentSet = setmetatable({}, v6), 
        _goalState = v11, 
        _tweenInfo = v12 or TweenInfo.new(), 
        _prevValue = v13, 
        _nextValue = v13, 
        _currentValue = v13, 
        _currentTweenInfo = v12, 
        _currentTweenDuration = 0, 
        _currentTweenStartTime = 0
    }, v5);
    v3(v14);
    v11.dependentSet[v14] = true;
    return v14;
end;