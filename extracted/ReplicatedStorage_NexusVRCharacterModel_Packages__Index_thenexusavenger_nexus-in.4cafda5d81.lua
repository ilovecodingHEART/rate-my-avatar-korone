-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_TypedEventConnection_0 = require(script.Parent:WaitForChild("TypedEventConnection"));
local v3 = {
    LastArguments = {}, 
    QueuedClearArguments = {}
};
v3.__index = v3;
v3.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        BindableEvent = Instance.new("BindableEvent"), 
        Connections = {}, 
        CurrentWaits = 0
    }, v3));
end;
v3.Connect = function(v4, v5) --[[ Line: 41 ]] --[[ Name: Connect ]]
    -- upvalues: l_TypedEventConnection_0 (copy)
    local v6 = l_TypedEventConnection_0.new(v4, v5);
    local v8 = v4.BindableEvent.Event:Connect(function(v7) --[[ Line: 46 ]]
        -- upvalues: v6 (copy), v4 (copy)
        v6:Fire(table.unpack(v4.LastArguments[v7]));
    end);
    v4.Connections[v6] = v8;
    return v6;
end;
v3.Once = function(v9, v10) --[[ Line: 64 ]] --[[ Name: Once ]]
    local v11 = nil;
    v11 = v9:Connect(function(...) --[[ Line: 66 ]]
        -- upvalues: v11 (ref), v10 (copy)
        if v11 then
            v11:Disconnect();
        end;
        v10(...);
    end);
end;
v3.Wait = function(v12) --[[ Line: 77 ]] --[[ Name: Wait ]]
    v12.CurrentWaits = v12.CurrentWaits + 1;
    local v13 = v12.BindableEvent.Event:Wait();
    v12.CurrentWaits = v12.CurrentWaits - 1;
    return table.unpack(v12.LastArguments[v13]);
end;
v3.Fire = function(v14, ...) --[[ Line: 90 ]] --[[ Name: Fire ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy)
    if next(v14.Connections) == nil and v14.CurrentWaits <= 0 then
        return;
    else
        local v15 = l_HttpService_0:GenerateGUID();
        local v16 = table.pack(...);
        v14.LastArguments[v15] = v16;
        task.defer(function() --[[ Line: 101 ]]
            -- upvalues: v3 (ref), v15 (copy)
            v3.QueuedClearArguments[v15] = true;
        end);
        v14.BindableEvent:Fire(v15);
        return;
    end;
end;
v3.Disconnected = function(v17, v18) --[[ Line: 112 ]] --[[ Name: Disconnected ]]
    if not v17.Connections[v18] then
        return;
    else
        v17.Connections[v18]:Disconnect();
        v17.Connections[v18] = nil;
        return;
    end;
end;
v3.Destroy = function(v19) --[[ Line: 121 ]] --[[ Name: Destroy ]]
    local l_Connections_0 = v19.Connections;
    v19.Connections = {};
    v19.CurrentWaits = 0;
    for v21, _ in l_Connections_0 do
        v21:Disconnect();
    end;
    v19.BindableEvent:Destroy();
end;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 134 ]]
    -- upvalues: v3 (copy)
    local l_QueuedClearArguments_0 = v3.QueuedClearArguments;
    v3.QueuedClearArguments = {};
    for v24, _ in l_QueuedClearArguments_0 do
        v3.LastArguments[v24] = nil;
    end;
end);
return v3;