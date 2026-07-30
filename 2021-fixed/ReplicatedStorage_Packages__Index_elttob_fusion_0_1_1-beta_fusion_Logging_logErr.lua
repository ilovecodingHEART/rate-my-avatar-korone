-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Logging.messages);
return function(v3, v4, ...) --[[ Line: 8 ]] --[[ Name: logError ]]
    local v5 = v2[v3];
    if v5 == nil then
        v3 = "unknownMessage";
        v5 = v2[v3];
    end;
    local v6 = nil;
    if v4 == nil then
        v6 = string.format("[Fusion] " .. v5 .. "\n(ID: " .. v3 .. ")", ...);
    else
        v5 = v5:gsub("ERROR_MESSAGE", v4.message);
        v6 = string.format("[Fusion] " .. v5 .. "\n(ID: " .. v3 .. ")\n---- Stack trace ----\n" .. v4.trace, ...);
    end;
    error(v6:gsub("\n", "\n    "), 0);
end;