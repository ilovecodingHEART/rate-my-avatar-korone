-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    Connected = true
};
v0.__index = v0;
v0.Disconnect = function(v1) --[[ Line: 20 ]] --[[ Name: Disconnect ]]
    if v1.Connected then
        v1.Connected = false;
        v1.Connection:Disconnect();
    end;
end;
v0._new = function(v2) --[[ Line: 27 ]] --[[ Name: _new ]]
    return (setmetatable({
        Connection = v2
    }, v0));
end;
v0.__tostring = function(v3) --[[ Line: 33 ]] --[[ Name: __tostring ]]
    return "RbxScriptConnection<" .. tostring(v3.Connected) .. ">";
end;
return v0;