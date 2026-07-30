-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_BufferedRemoteEventReceiver_0 = require(script.Parent:WaitForChild("BufferedRemoteEventReceiver"));
local v1 = {
    Players = game:GetService("Players")
};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_BufferedRemoteEventReceiver_0 (copy), v1 (copy)
    local v4 = {};
    local v5 = setmetatable({
        PlayerUserIdLookup = v4, 
        BufferedRemoteEventReceiver = l_BufferedRemoteEventReceiver_0.new(v2, v3)
    }, v1);
    for _, v7 in v1.Players:GetPlayers() do
        v4[v7.UserId] = v7;
    end;
    table.insert(v5.BufferedRemoteEventReceiver.EventConnections, v1.Players.PlayerAdded:Connect(function(v8) --[[ Line: 32 ]]
        -- upvalues: v4 (copy)
        v4[v8.UserId] = v8;
    end));
    table.insert(v5.BufferedRemoteEventReceiver.EventConnections, v1.Players.PlayerRemoving:Connect(function(v9) --[[ Line: 35 ]]
        -- upvalues: v4 (copy)
        v4[v9.UserId] = nil;
    end));
    return v5;
end;
v1.OnDataReceived = function(v10, v11) --[[ Line: 46 ]] --[[ Name: OnDataReceived ]]
    v10.BufferedRemoteEventReceiver:OnDataReceived(function(v12, v13) --[[ Line: 47 ]]
        -- upvalues: v10 (copy), v11 (copy)
        local v14 = v10.PlayerUserIdLookup[v12];
        if not v14 then
            return;
        else
            v11(v14, v13);
            return;
        end;
    end);
end;
v1.Destroy = function(v15) --[[ Line: 57 ]] --[[ Name: Destroy ]]
    v15.BufferedRemoteEventReceiver:Destroy();
end;
return v1;