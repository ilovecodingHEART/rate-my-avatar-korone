-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v5 = nil;
pcall(function() --[[ Line: 12 ]]
    v5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v5 == nil then
    v5 = {};
end;
if not v5.FormatMessageToSend or not v5.LocalizeFormattedMessage then
    v5.FormatMessageToSend = function(_, _, v8) --[[ Line: 15 ]] --[[ Name: FormatMessageToSend ]]
        return v8;
    end;
end;
local v9 = {
    "\n", 
    "\r", 
    "\t", 
    "\v", 
    "\f"
};
if l_ChatSettings_0.DisallowedWhiteSpace then
    v9 = l_ChatSettings_0.DisallowedWhiteSpace;
end;
local function v11(v10) --[[ Line: 25 ]] --[[ Name: isMessageValidServer ]]
    if v10:len() > l_ChatSettings_0.MaximumMessageLength * 6 then
        return false;
    elseif utf8.len(v10) == nil then
        return false;
    elseif utf8.len(utf8.nfcnormalize(v10)) > l_ChatSettings_0.MaximumMessageLength then
        return false;
    else
        return true;
    end;
end;
local function _(v12) --[[ Line: 45 ]] --[[ Name: CanUserChat ]]
    if l_RunService_0:IsStudio() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 49 ]]
            return l_Chat_0:CanUserChatAsync(v12.UserId);
        end);
        return l_status_0 and l_result_0;
    end;
end;
return function(v16) --[[ Line: 55 ]] --[[ Name: Run ]]
    v16:RegisterProcessCommandsFunction("message_validation", function(v17, v18, v19) --[[ Line: 56 ]] --[[ Name: ValidateChatFunction ]]
        local l_v16_Speaker_0 = v16:GetSpeaker(v17);
        local l_l_v16_Speaker_0_Player_0 = l_v16_Speaker_0:GetPlayer();
        if not l_v16_Speaker_0 then
            return false;
        elseif not l_l_v16_Speaker_0_Player_0 then
            return false;
        elseif not l_RunService_0:IsStudio() and l_l_v16_Speaker_0_Player_0.UserId < 1 then
            return true;
        else
            local v22;
            if l_RunService_0:IsStudio() then
                v22 = true;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 49 ]]
                    return l_Chat_0:CanUserChatAsync(l_l_v16_Speaker_0_Player_0.UserId);
                end);
                v22 = l_status_1 and l_result_1;
            end;
            if not v22 then
                l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), v19);
                return true;
            elseif not v11(v18) then
                l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), v19);
                return true;
            else
                for _, v26 in pairs(v9) do
                    if v18:find(v26) then
                        l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), v19);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, l_ChatConstants_0.VeryHighPriority);
end;