-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Shared_0 = game:GetService("ReplicatedStorage").Slerp.Shared;
local v1 = require(l_Shared_0.DeferredRemoteEvent);
local v10 = {
    new = function(v2, v3) --[[ Line: 20 ]] --[[ Name: new ]]
        return {
            _inner = v1.new(), 
            _replicationInterval = v3 or 0.016666666666666666, 
            _remoteEvent = v2, 
            _callbackMap = {}
        };
    end, 
    addCallback = function(v4, v5, v6) --[[ Line: 30 ]] --[[ Name: addCallback ]]
        if v4._callbackMap[v5] then
            return false;
        else
            v4._callbackMap[v5] = v6;
            return true;
        end;
    end, 
    fireServer = function(v7, v8, ...) --[[ Line: 38 ]] --[[ Name: fireServer ]]
        v1.add(v7._inner, v8, {
            ...
        });
    end, 
    _fireQueue = function(v9) --[[ Line: 43 ]] --[[ Name: _fireQueue ]]
        v9._remoteEvent:FireServer(v1.take(v9._inner));
    end
};
v10.init = function(v11) --[[ Line: 47 ]] --[[ Name: init ]]
    if v11._runtimeThread or v11._remoteEventConnected then
        v10.deinit(v11);
    end;
    v11._remoteEventConnected = v11._remoteEvent.OnClientEvent:Connect(function(v12) --[[ Line: 51 ]]
        for _, v14 in v12 do
            local v15 = v11._callbackMap[v14.id];
            if v15 then
                v15(table.unpack(v14.data));
            end;
        end;
    end);
    v11._runtimeThread = task.defer(function() --[[ Line: 60 ]]
        while true do
            task.wait(v11._replicationInterval);
            if #v11._inner._queue ~= 0 then
                v10._fireQueue(v11);
            end;
        end;
    end);
end;
v10.deinit = function(v16) --[[ Line: 72 ]] --[[ Name: deinit ]]
    if v16._runtimeThread then
        coroutine.close(v16._runtimeThread);
        v16._runtimeThread = nil;
    end;
    if v16._remoteEventConnected then
        v16._remoteEventConnected:Disconnect();
        v16._remoteEventConnected = nil;
    end;
end;
table.freeze(v10);
return v10;