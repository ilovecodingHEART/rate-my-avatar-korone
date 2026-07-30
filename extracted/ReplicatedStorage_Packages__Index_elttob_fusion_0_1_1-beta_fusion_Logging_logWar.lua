-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Logging.messages);
return function(v2, ...) --[[ Line: 8 ]] --[[ Name: logWarn ]]
    local v3 = v1[v2];
    if v3 == nil then
        v2 = "unknownMessage";
        v3 = v1[v2];
    end;
    warn(string.format("[Fusion] " .. v3 .. "\n(ID: " .. v2 .. ")", ...));
end;