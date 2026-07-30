-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dependencies.useDependency);
local v2 = require(l_Parent_0.Dependencies.initDependency);
local v3 = require(l_Parent_0.Dependencies.updateAll);
local v4 = {};
local v5 = {
    __index = v4
};
local v6 = {
    __mode = "k"
};
v4.get = function(v7, v8) --[[ Line: 21 ]] --[[ Name: get ]]
    if v8 ~= false then
        v1(v7);
    end;
    return v7._value;
end;
v4.set = function(v9, v10, v11) --[[ Line: 35 ]] --[[ Name: set ]]
    if v9._value == v10 and not v11 then
        return;
    else
        v9._value = v10;
        v3(v9);
        return;
    end;
end;
return function(v12) --[[ Line: 47 ]] --[[ Name: State ]]
    local v13 = setmetatable({
        type = "State", 
        kind = "State", 
        dependentSet = setmetatable({}, v6), 
        _value = v12
    }, v5);
    v2(v13);
    return v13;
end;