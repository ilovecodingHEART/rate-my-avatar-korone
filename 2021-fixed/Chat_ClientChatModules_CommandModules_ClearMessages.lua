-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Util_0 = require(script.Parent:WaitForChild("Util"));
ProcessMessage = function(v1, v2, _) --[[ Line: 7 ]] --[[ Name: ProcessMessage ]]
    if string.sub(v1, 1, 4):lower() == "/cls" or string.sub(v1, 1, 6):lower() == "/clear" then
        local l_v2_CurrentChannel_0 = v2:GetCurrentChannel();
        if l_v2_CurrentChannel_0 then
            l_v2_CurrentChannel_0:ClearMessageLog();
        end;
        return true;
    else
        return false;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};