-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dependencies.initDependency);
local v2 = {};
local v3 = {
    __index = v2
};
local v4 = {};
v2.update = function(v5) --[[ Line: 18 ]] --[[ Name: update ]]
    for v6 in pairs(v5._changeListeners) do
        coroutine.wrap(v6)();
    end;
    return false;
end;
v2.onChange = function(v7, v8) --[[ Line: 33 ]] --[[ Name: onChange ]]
    v7._numChangeListeners = v7._numChangeListeners + 1;
    v7._changeListeners[v8] = true;
    v4[v7] = true;
    local v9 = false;
    return function() --[[ Line: 41 ]]
        if v9 then
            return;
        else
            v9 = true;
            v7._changeListeners[v8] = nil;
            local l_v7_0 = v7;
            l_v7_0._numChangeListeners = l_v7_0._numChangeListeners - 1;
            if v7._numChangeListeners == 0 then
                v4[v7] = nil;
            end;
            return;
        end;
    end;
end;
return function(v11) --[[ Line: 56 ]] --[[ Name: Compat ]]
    local v12 = setmetatable({
        type = "State", 
        kind = "Compat", 
        dependencySet = {
            [v11] = true
        }, 
        dependentSet = {}, 
        _changeListeners = {}, 
        _numChangeListeners = 0
    }, v3);
    v1(v12);
    v11.dependentSet[v12] = true;
    return v12;
end;