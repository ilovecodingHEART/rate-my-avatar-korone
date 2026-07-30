-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateUnknownMessageLabel = function(v3) --[[ Line: 12 ]] --[[ Name: CreateUnknownMessageLabel ]]
    print("No message creator for message: " .. v3.Message);
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = "UnknownMessage", 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
};