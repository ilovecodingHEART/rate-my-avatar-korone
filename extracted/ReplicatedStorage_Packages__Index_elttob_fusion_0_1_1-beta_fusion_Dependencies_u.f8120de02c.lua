-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Dependencies.sharedState);
local l_initialisedStack_0 = v2.initialisedStack;
return function(v4) --[[ Line: 12 ]] --[[ Name: useDependency ]]
    local l_dependencySet_0 = v2.dependencySet;
    if l_dependencySet_0 ~= nil then
        local l_initialisedStackSize_0 = v2.initialisedStackSize;
        if l_initialisedStackSize_0 > 0 and l_initialisedStack_0[l_initialisedStackSize_0][v4] ~= nil then
            return;
        else
            l_dependencySet_0[v4] = true;
        end;
    end;
end;