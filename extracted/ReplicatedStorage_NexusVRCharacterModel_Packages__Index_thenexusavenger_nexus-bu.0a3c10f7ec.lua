-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    Players = game:GetService("Players")
};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = setmetatable({
        RemoteEvent = v1, 
        TotalPlayers = #v0.Players:GetPlayers(), 
        EnrolledPlayers = {}, 
        EventConnections = {}
    }, v0);
    table.insert(v2.EventConnections, v0.Players.PlayerAdded:Connect(function() --[[ Line: 30 ]]
        -- upvalues: v2 (copy), v0 (ref)
        v2.TotalPlayers = #v0.Players:GetPlayers();
    end));
    table.insert(v2.EventConnections, v0.Players.PlayerRemoving:Connect(function(v3) --[[ Line: 33 ]]
        -- upvalues: v2 (copy), v0 (ref)
        v2.TotalPlayers = #v0.Players:GetPlayers();
        v2:UnenrollPlayer(v3);
    end));
    return v2;
end;
v0.EnrollPlayer = function(v4, v5) --[[ Line: 45 ]] --[[ Name: EnrollPlayer ]]
    if table.find(v4.EnrolledPlayers, v5) then
        return;
    else
        table.insert(v4.EnrolledPlayers, v5);
        return;
    end;
end;
v0.UnenrollPlayer = function(v6, v7) --[[ Line: 53 ]] --[[ Name: UnenrollPlayer ]]
    local v8 = table.find(v6.EnrolledPlayers, v7);
    if not v8 then
        return;
    else
        table.remove(v6.EnrolledPlayers, v8);
        return;
    end;
end;
v0.FireAllClients = function(v9, ...) --[[ Line: 62 ]] --[[ Name: FireAllClients ]]
    local v10 = #v9.EnrolledPlayers;
    if #v9.EnrolledPlayers == 0 then
        return;
    else
        local l_RemoteEvent_0 = v9.RemoteEvent;
        if v10 == v9.TotalPlayers then
            l_RemoteEvent_0:FireAllClients(...);
            return;
        else
            for _, v13 in v9.EnrolledPlayers do
                l_RemoteEvent_0:FireClient(v13, ...);
            end;
            return;
        end;
    end;
end;
v0.Destroy = function(v14) --[[ Line: 83 ]] --[[ Name: Destroy ]]
    for _, v16 in v14.EventConnections do
        v16:Disconnect();
    end;
    v14.EventConnections = {};
end;
return v0;