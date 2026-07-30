-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Utility.cleanup);
local function v3() --[[ Line: 30 ]] --[[ Name: noOp ]]

end;
local v4 = {};
local v5 = 0;
local v6 = 1;
local function v10() --[[ Line: 39 ]] --[[ Name: runCleanupTasks ]]
    if v5 == 0 then
        return;
    else
        local v7 = os.clock() + 0.001;
        for _ = 1, v5 do
            local v9 = v4[v6];
            if v9.connection.Connected then
                v6 = v6 + 1;
            else
                v9.cleaned = true;
                v2(v9.task);
                table.remove(v4, v6);
                v5 = v5 - 1;
            end;
            if v5 < v6 then
                v6 = 1;
            end;
            if v7 < os.clock() then
                break;
            end;
        end;
        return;
    end;
end;
l_RunService_0.Heartbeat:Connect(v10);
return function(v11, v12) --[[ Line: 80 ]] --[[ Name: cleanupOnDestroy ]]
    local v13 = v11:GetPropertyChangedSignal("ClassName"):Connect(v3);
    local v14 = {
        debugName = v11.Name, 
        connection = v13, 
        task = v12, 
        cleaned = false
    };
    v11 = nil;
    v5 = v5 + 1;
    v4[v5] = v14;
    return function() --[[ Line: 102 ]]
        if v14.cleaned then
            return;
        else
            v14.cleaned = true;
            v13:Disconnect();
            local v15 = table.find(v4, v14);
            if v15 ~= nil then
                table.remove(v4, v15);
                v5 = v5 - 1;
            end;
            return;
        end;
    end;
end;