-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        RemoteEvent = v1, 
        DeserializeMessages = v2, 
        OnDataReceivedCallbacks = {}, 
        EventConnections = {}
    }, v0));
end;
v0.OnDataReceived = function(v3, v4) --[[ Line: 31 ]] --[[ Name: OnDataReceived ]]
    table.insert(v3.OnDataReceivedCallbacks, v4);
    if #v3.OnDataReceivedCallbacks > 1 then
        return;
    else
        table.insert(v3.EventConnections, v3.RemoteEvent.OnClientEvent:Connect(function(v5) --[[ Line: 37 ]]
            -- upvalues: v3 (copy)
            for v6, v7 in v3.DeserializeMessages(v5) do
                for _, v9 in pairs(v3.OnDataReceivedCallbacks) --[[ 2021 ]] do
                    task.spawn(v9, v6, v7);
                end;
            end;
        end));
        return;
    end;
end;
v0.Destroy = function(v10) --[[ Line: 49 ]] --[[ Name: Destroy ]]
    for _, v12 in pairs(v10.EventConnections) --[[ 2021 ]] do
        v12:Disconnect();
    end;
    v10.EventConnections = {};
    v10.OnDataReceivedCallbacks = {};
end;
return v0;