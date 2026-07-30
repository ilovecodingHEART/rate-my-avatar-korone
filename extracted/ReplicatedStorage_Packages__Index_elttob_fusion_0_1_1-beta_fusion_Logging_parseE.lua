-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 9 ]] --[[ Name: parseError ]]
    return {
        raw = v2, 
        message = v2:gsub("^.+:%d+:%s*", ""), 
        trace = debug.traceback(nil, 2)
    };
end;