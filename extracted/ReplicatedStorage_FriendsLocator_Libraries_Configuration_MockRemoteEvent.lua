-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
local v1 = {};
v0.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    local v2 = {
        _onClientEventBindable = Instance.new("BindableEvent")
    };
    v2.OnClientEvent = v2._onClientEventBindable.Event;
    v2._onServerEventBindable = Instance.new("BindableEvent");
    v2.OnServerEvent = v2._onServerEventBindable.Event;
    return (setmetatable(v2, v0));
end;
v0.FireServer = function(v3, ...) --[[ Line: 18 ]] --[[ Name: FireServer ]]
    v3._onServerEventBindable:Fire(v1, ...);
end;
v0.FireClient = function(v4, _, ...) --[[ Line: 22 ]] --[[ Name: FireClient ]]
    v4._onClientEventBindable:Fire(...);
end;
v0.FireAllClients = function(v6, ...) --[[ Line: 26 ]] --[[ Name: FireAllClients ]]
    v6._onClientEventBindable:Fire(...);
end;
return v0;