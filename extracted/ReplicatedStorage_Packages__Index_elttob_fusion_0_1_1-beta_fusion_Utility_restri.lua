-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Logging.logError);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: restrictRead ]]
    local v4 = getmetatable(v3);
    if v4 == nil then
        v4 = {};
        setmetatable(v3, v4);
    end;
    v4.__index = function(_, v6) --[[ Line: 16 ]] --[[ Name: __index ]]
        v1("strictReadError", nil, tostring(v6), v2);
    end;
    return v3;
end;