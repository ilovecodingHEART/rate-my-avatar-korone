-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_StandardPriority_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants")).StandardPriority;
if l_StandardPriority_0 == nil then
    l_StandardPriority_0 = 10;
end;
local v2 = {};
v2.__index = v2;
local v3 = {};
local v4 = {};
v4.__index = v4;
v4.RebuildProcessCommandsPriorities = function(v5) --[[ Line: 24 ]] --[[ Name: RebuildProcessCommandsPriorities ]]
    v5.RegisteredPriorites = {};
    for v6, v7 in pairs(v5.FunctionMap) do
        local v8 = true;
        for _, _ in pairs(v7) do
            v8 = false;
            break;
        end;
        if not v8 then
            table.insert(v5.RegisteredPriorites, v6);
        end;
    end;
    table.sort(v5.RegisteredPriorites, function(v11, v12) --[[ Line: 36 ]]
        return v12 < v11;
    end);
end;
v4.HasFunction = function(v13, v14) --[[ Line: 41 ]] --[[ Name: HasFunction ]]
    if v13.RegisteredFunctions[v14] == nil then
        return false;
    else
        return true;
    end;
end;
v4.RemoveFunction = function(v15, v16) --[[ Line: 48 ]] --[[ Name: RemoveFunction ]]
    local v17 = v15.RegisteredFunctions[v16];
    v15.RegisteredFunctions[v16] = nil;
    v15.FunctionMap[v17][v16] = nil;
    v15:RebuildProcessCommandsPriorities();
end;
v4.AddFunction = function(v18, v19, v20, v21) --[[ Line: 55 ]] --[[ Name: AddFunction ]]
    if v21 == nil then
        v21 = l_StandardPriority_0;
    end;
    if v18.RegisteredFunctions[v19] then
        error(v19 .. " is already in use!");
    end;
    v18.RegisteredFunctions[v19] = v21;
    if v18.FunctionMap[v21] == nil then
        v18.FunctionMap[v21] = {};
    end;
    v18.FunctionMap[v21][v19] = v20;
    v18:RebuildProcessCommandsPriorities();
end;
v4.GetIterator = function(v22) --[[ Line: 74 ]] --[[ Name: GetIterator ]]
    local v23 = 1;
    local v24 = nil;
    local v25 = nil;
    return function() --[[ Line: 79 ]]
        while true do
            if v23 > #v22.RegisteredPriorites then
                return;
            else
                local v26 = v22.RegisteredPriorites[v23];
                local v27, v28 = next(v22.FunctionMap[v26], v24);
                v24 = v27;
                v25 = v28;
                if v24 == nil then
                    v23 = v23 + 1;
                else
                    return v24, v25, v26;
                end;
            end;
        end;
    end;
end;
v3.new = function() --[[ Line: 95 ]] --[[ Name: new ]]
    local v29 = setmetatable({}, v4);
    v29.RegisteredFunctions = {};
    v29.RegisteredPriorites = {};
    v29.FunctionMap = {};
    return v29;
end;
v2.NewSortedFunctionContainer = function(_) --[[ Line: 106 ]] --[[ Name: NewSortedFunctionContainer ]]
    return v3.new();
end;
return v2;