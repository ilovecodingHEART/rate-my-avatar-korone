-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x3, pairs() wrap x3, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        MaxRequestSize = 900, 
        QueuedData = {}, 
        RemoteEvent = v1, 
        SerializeMessage = v2, 
        SendingActive = true
    }, v0));
end;
v0.WithPlayerKeys = function(v3, v4) --[[ Line: 39 ]] --[[ Name: WithPlayerKeys ]]
    -- upvalues: v0 (copy)
    return v0.new(v3, function(v5, v6) --[[ Line: 40 ]]
        -- upvalues: v4 (copy)
        local v7 = v4(v6);
        local v8 = buffer.create(8 + buffer.len(v7));
        buffer.writef64(v8, 0, v5.UserId);
        buffer.copy(v8, 8, v7);
        return v8;
    end);
end;
v0.QueueData = function(v9, v10, v11) --[[ Line: 53 ]] --[[ Name: QueueData ]]
    v9.QueuedData[v10] = v11;
end;
v0.SendQueuedData = function(v12) --[[ Line: 60 ]] --[[ Name: SendQueuedData ]]
    local l_QueuedData_0 = v12.QueuedData;
    v12.QueuedData = {};
    local v14 = {
        {
            Buffers = {}, 
            CurrentLength = 0
        }
    };
    local l_MaxRequestSize_0 = v12.MaxRequestSize;
    for v16, v17 in pairs(l_QueuedData_0) --[[ 2021 ]] do
        local v18 = v12.SerializeMessage(v16, v17);
        local v19 = buffer.len(v18);
        if v12.MaxRequestSize < v19 then
            warn((("Data was serialzied for key %s and was too long (%s > %s). The data will be dropped."):format(v16, v19, l_MaxRequestSize_0)));
        else
            local v20 = v14[#v14];
            local v21 = v20.CurrentLength + v19;
            if l_MaxRequestSize_0 < v21 then
                table.insert(v14, {
                    Buffers = {
                        v18
                    }, 
                    CurrentLength = v19
                });
            else
                table.insert(v20.Buffers, v18);
                v20.CurrentLength = v21;
            end;
        end;
    end;
    for _, v23 in pairs(v14) --[[ 2021 ]] do
        if v23.CurrentLength == 0 then
            return;
        else
            local v24 = buffer.create(v23.CurrentLength);
            local v25 = 0;
            for _, v27 in pairs(v23.Buffers) --[[ 2021 ]] do
                buffer.copy(v24, v25, v27);
                v25 = v25 + buffer.len(v27);
            end;
            v12.RemoteEvent:FireAllClients(v24);
        end;
    end;
end;
v0.StartDataSending = function(v28, v29) --[[ Line: 113 ]] --[[ Name: StartDataSending ]]
    task.spawn(function() --[[ Line: 114 ]]
        -- upvalues: v28 (copy), v29 (copy)
        while v28.SendingActive do
            v28:SendQueuedData();
            v29();
        end;
    end);
end;
v0.StartDataSendingWithDelay = function(v30, v31) --[[ Line: 125 ]] --[[ Name: StartDataSendingWithDelay ]]
    v30:StartDataSending(function() --[[ Line: 126 ]]
        -- upvalues: v31 (copy)
        task.wait(v31);
    end);
end;
v0.StartDataSendingWithEvent = function(v32, v33) --[[ Line: 134 ]] --[[ Name: StartDataSendingWithEvent ]]
    v32:StartDataSending(function() --[[ Line: 135 ]]
        -- upvalues: v33 (copy)
        v33:Wait();
    end);
end;
v0.Destroy = function(v34) --[[ Line: 143 ]] --[[ Name: Destroy ]]
    v34.SendingActive = false;
end;
return v0;