-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
return function(v3) --[[ Line: 10 ]] --[[ Name: Run ]]
    if l_ChatSettings_0 and l_ChatSettings_0.AllowMeCommand then
        v3:RegisterFilterMessageFunction("me_command", function(_, v5, _) --[[ Line: 13 ]] --[[ Name: MeCommandFilterFunction ]]
            local l_Message_0 = v5.Message;
            if l_Message_0 and string.sub(l_Message_0, 1, 4):lower() == "/me " then
                v5.MessageType = l_ChatConstants_0.MessageTypeMeCommand;
            end;
        end);
    end;
end;