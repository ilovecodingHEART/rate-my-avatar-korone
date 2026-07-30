-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Flipper);
local v1 = require(script.Parent.useGoal);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: useInstant ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v2, v0.Instant.new(v3));
end;