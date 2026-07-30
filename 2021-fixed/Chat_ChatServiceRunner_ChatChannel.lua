-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
    return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = nil;
local v3;
l_result_0, v3 = pcall(function() --[[ Line: 12 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = {};
v3 = script.Parent;
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(v3:WaitForChild("Util"));
local v10 = nil;
pcall(function() --[[ Line: 32 ]]
    v10 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
v10 = v10 or {};
if not v10.FormatMessageToSend or not v10.LocalizeFormattedMessage then
    v10.FormatMessageToSend = function(_, _, v13) --[[ Line: 36 ]] --[[ Name: FormatMessageToSend ]]
        return v13;
    end;
end;
local v14 = {};
v14.__index = v14;
v14.SendSystemMessage = function(v15, v16, v17) --[[ Line: 45 ]] --[[ Name: SendSystemMessage ]]
    local v18 = v15:InternalCreateMessageObject(v16, nil, true, v17);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 48 ]]
        v15.eMessagePosted:Fire(v18);
    end);
    if not l_status_1 and l_result_1 then
        print("Error posting message: " .. l_result_1);
    end;
    v15:InternalAddMessageToHistoryLog(v18);
    for _, v22 in pairs(v15.Speakers) do
        v22:InternalSendSystemMessage(v18, v15.Name);
    end;
    return v18;
end;
v14.SendSystemMessageToSpeaker = function(v23, v24, v25, v26) --[[ Line: 62 ]] --[[ Name: SendSystemMessageToSpeaker ]]
    local v27 = v23.Speakers[v25];
    if v27 then
        v27:InternalSendSystemMessage(v23:InternalCreateMessageObject(v24, nil, true, v26), v23.Name);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", v25, v23.Name));
        end;
        return;
    end;
end;
v14.SendMessageObjToFilters = function(v28, v29, v30, v31) --[[ Line: 72 ]] --[[ Name: SendMessageObjToFilters ]]
    local l_Message_0 = v30.Message;
    v30.Message = v29;
    v28:InternalDoMessageFilter(v31.Name, v30, v28.Name);
    v28.ChatService:InternalDoMessageFilter(v31.Name, v30, v28.Name);
    local l_Message_1 = v30.Message;
    v30.Message = l_Message_0;
    return l_Message_1;
end;
v14.CanCommunicateByUserId = function(_, v35, v36) --[[ Line: 82 ]] --[[ Name: CanCommunicateByUserId ]]
    if l_RunService_0:IsStudio() then
        return true;
    elseif v35 == 0 or v36 == 0 then
        return true;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 90 ]]
            return l_Chat_0:CanUsersChatAsync(v35, v36);
        end);
        return l_status_2 and l_result_2;
    end;
end;
v14.CanCommunicate = function(v39, v40, v41) --[[ Line: 96 ]] --[[ Name: CanCommunicate ]]
    local l_v40_Player_0 = v40:GetPlayer();
    local l_v41_Player_0 = v41:GetPlayer();
    if l_v40_Player_0 and l_v41_Player_0 then
        return v39:CanCommunicateByUserId(l_v40_Player_0.UserId, l_v41_Player_0.UserId);
    else
        return true;
    end;
end;
v14.SendMessageToSpeaker = function(v44, v45, v46, v47, v48) --[[ Line: 105 ]] --[[ Name: SendMessageToSpeaker ]]
    local v49 = v44.Speakers[v46];
    local l_Speaker_0 = v44.ChatService:GetSpeaker(v47);
    if v49 and l_Speaker_0 then
        if v49:IsSpeakerMuted(v47) then
            return;
        elseif not v44:CanCommunicate(v49, l_Speaker_0) then
            return;
        else
            local v51 = v44:InternalCreateMessageObject(v45, v47, v46 == v47, v48);
            v45 = v44:SendMessageObjToFilters(v45, v51, v47);
            v49:InternalSendMessage(v51, v44.Name);
            local v52 = v44.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat;
            local v53, v54, v55 = v44.ChatService:InternalApplyRobloxFilterNewAPI(v51.FromSpeaker, v45, v52);
            if v53 then
                v51.FilterResult = v55;
                v51.IsFilterResult = v54;
                v51.IsFiltered = true;
                v49:InternalSendFilteredMessageWithFilterResult(v51, v44.Name);
                return;
            end;
        end;
    elseif l_RunService_0:IsStudio() then
        warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", v46, v44.Name));
    end;
end;
v14.KickSpeaker = function(v56, v57, v58) --[[ Line: 141 ]] --[[ Name: KickSpeaker ]]
    local l_Speaker_1 = v56.ChatService:GetSpeaker(v57);
    if not l_Speaker_1 then
        error("Speaker \"" .. v57 .. "\" does not exist!");
    end;
    local v60 = "";
    local v61 = "";
    local l_l_Speaker_1_NameForDisplay_0 = l_Speaker_1:GetNameForDisplay();
    if v58 then
        v60 = string.format("You were kicked from '%s' for the following reason(s): %s", v56.Name, v58);
        v61 = string.format("%s was kicked for the following reason(s): %s", l_l_Speaker_1_NameForDisplay_0, v58);
    else
        v60 = string.format("You were kicked from '%s'", v56.Name);
        v61 = string.format("%s was kicked", l_l_Speaker_1_NameForDisplay_0);
    end;
    v56:SendSystemMessageToSpeaker(v60, v57);
    l_Speaker_1:LeaveChannel(v56.Name);
    v56:SendSystemMessage(v61);
end;
v14.MuteSpeaker = function(v63, v64, v65, v66) --[[ Line: 164 ]] --[[ Name: MuteSpeaker ]]
    local l_Speaker_2 = v63.ChatService:GetSpeaker(v64);
    if not l_Speaker_2 then
        error("Speaker \"" .. v64 .. "\" does not exist!");
    end;
    v63.Mutes[v64:lower()] = (not (v66 ~= 0) or v66 == nil) and 0 or os.time() + v66;
    if v65 then
        local l_l_Speaker_2_NameForDisplay_0 = l_Speaker_2:GetNameForDisplay();
        v63:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", l_l_Speaker_2_NameForDisplay_0, v65));
    end;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 178 ]]
        v63.eSpeakerMuted:Fire(v64, v65, v66);
    end);
    if not l_status_3 and l_result_3 then
        print("Error mutting speaker: " .. l_result_3);
    end;
    local l_Speaker_3 = v63.ChatService:GetSpeaker(v64);
    if l_Speaker_3 then
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 185 ]]
            l_Speaker_3.eMuted:Fire(v63.Name, v65, v66);
        end);
        if not l_status_4 and l_result_4 then
            print("Error mutting speaker: " .. l_result_4);
        end;
    end;
end;
v14.UnmuteSpeaker = function(v74, v75) --[[ Line: 193 ]] --[[ Name: UnmuteSpeaker ]]
    if not v74.ChatService:GetSpeaker(v75) then
        error("Speaker \"" .. v75 .. "\" does not exist!");
    end;
    v74.Mutes[v75:lower()] = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 201 ]]
        v74.eSpeakerUnmuted:Fire(v75);
    end);
    if not l_status_5 and l_result_5 then
        print("Error unmuting speaker: " .. l_result_5);
    end;
    local l_Speaker_4 = v74.ChatService:GetSpeaker(v75);
    if l_Speaker_4 then
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 208 ]]
            l_Speaker_4.eUnmuted:Fire(v74.Name);
        end);
        if not l_status_6 and l_result_6 then
            print("Error unmuting speaker: " .. l_result_6);
        end;
    end;
end;
v14.IsSpeakerMuted = function(v81, v82) --[[ Line: 215 ]] --[[ Name: IsSpeakerMuted ]]
    return v81.Mutes[v82:lower()] ~= nil;
end;
v14.GetSpeakerList = function(v83) --[[ Line: 219 ]] --[[ Name: GetSpeakerList ]]
    local v84 = {};
    for _, v86 in pairs(v83.Speakers) do
        table.insert(v84, v86.Name);
    end;
    return v84;
end;
v14.RegisterFilterMessageFunction = function(v87, v88, v89, v90) --[[ Line: 227 ]] --[[ Name: RegisterFilterMessageFunction ]]
    if v87.FilterMessageFunctions:HasFunction(v88) then
        error(string.format("FilterMessageFunction '%s' already exists", v88));
    end;
    v87.FilterMessageFunctions:AddFunction(v88, v89, v90);
end;
v14.FilterMessageFunctionExists = function(v91, v92) --[[ Line: 234 ]] --[[ Name: FilterMessageFunctionExists ]]
    return v91.FilterMessageFunctions:HasFunction(v92);
end;
v14.UnregisterFilterMessageFunction = function(v93, v94) --[[ Line: 238 ]] --[[ Name: UnregisterFilterMessageFunction ]]
    if not v93.FilterMessageFunctions:HasFunction(v94) then
        error(string.format("FilterMessageFunction '%s' does not exists", v94));
    end;
    v93.FilterMessageFunctions:RemoveFunction(v94);
end;
v14.RegisterProcessCommandsFunction = function(v95, v96, v97, v98) --[[ Line: 245 ]] --[[ Name: RegisterProcessCommandsFunction ]]
    if v95.ProcessCommandsFunctions:HasFunction(v96) then
        error(string.format("ProcessCommandsFunction '%s' already exists", v96));
    end;
    v95.ProcessCommandsFunctions:AddFunction(v96, v97, v98);
end;
v14.ProcessCommandsFunctionExists = function(v99, v100) --[[ Line: 252 ]] --[[ Name: ProcessCommandsFunctionExists ]]
    return v99.ProcessCommandsFunctions:HasFunction(v100);
end;
v14.UnregisterProcessCommandsFunction = function(v101, v102) --[[ Line: 256 ]] --[[ Name: UnregisterProcessCommandsFunction ]]
    if not v101.ProcessCommandsFunctions:HasFunction(v102) then
        error(string.format("ProcessCommandsFunction '%s' does not exist", v102));
    end;
    v101.ProcessCommandsFunctions:RemoveFunction(v102);
end;
local function _(v103) --[[ Line: 263 ]] --[[ Name: ShallowCopy ]]
    local v104 = {};
    for v105, v106 in pairs(v103) do
        v104[v105] = v106;
    end;
    return v104;
end;
v14.GetHistoryLog = function(v108) --[[ Line: 271 ]] --[[ Name: GetHistoryLog ]]
    local l_ChatHistory_0 = v108.ChatHistory;
    local v110 = {};
    for v111, v112 in pairs(l_ChatHistory_0) do
        v110[v111] = v112;
    end;
    return v110;
end;
v14.GetHistoryLogForSpeaker = function(v113, v114) --[[ Line: 275 ]] --[[ Name: GetHistoryLogForSpeaker ]]
    local v115 = -1;
    local l_v114_Player_0 = v114:GetPlayer();
    if l_v114_Player_0 then
        v115 = l_v114_Player_0.UserId;
    end;
    local v117 = {};
    for v118 = 1, #v113.ChatHistory do
        if v113:CanCommunicateByUserId(v115, v113.ChatHistory[v118].SpeakerUserId) then
            local v119 = v113.ChatHistory[v118];
            local v120 = {};
            for v121, v122 in pairs(v119) do
                v120[v121] = v122;
            end;
            local l_v120_0 = v120;
            if l_v120_0.MessageType == l_ChatConstants_0.MessageTypeDefault or l_v120_0.MessageType == l_ChatConstants_0.MessageTypeMeCommand then
                v119 = l_v120_0.FilterResult;
                if l_v120_0.IsFilterResult then
                    if l_v114_Player_0 then
                        l_v120_0.Message = v119:GetChatForUserAsync(l_v114_Player_0.UserId);
                    else
                        l_v120_0.Message = v119:GetNonChatStringForBroadcastAsync();
                    end;
                else
                    l_v120_0.Message = v119;
                end;
            end;
            table.insert(v117, l_v120_0);
        end;
    end;
    return v117;
end;
v14.InternalDestroy = function(v124) --[[ Line: 313 ]] --[[ Name: InternalDestroy ]]
    for _, v126 in pairs(v124.Speakers) do
        v126:LeaveChannel(v124.Name);
    end;
    v124.eDestroyed:Fire();
    v124.eDestroyed:Destroy();
    v124.eMessagePosted:Destroy();
    v124.eSpeakerJoined:Destroy();
    v124.eSpeakerLeft:Destroy();
    v124.eSpeakerMuted:Destroy();
    v124.eSpeakerUnmuted:Destroy();
end;
v14.InternalDoMessageFilter = function(v127, v128, v129, v130) --[[ Line: 328 ]] --[[ Name: InternalDoMessageFilter ]]
    for v131, v132, _ in (v127.FilterMessageFunctions:GetIterator()) do
        local l_status_7, l_result_7 = pcall(function() --[[ Line: 331 ]]
            v132(v128, v129, v130);
        end);
        if not l_status_7 then
            warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", v131, l_result_7));
        end;
    end;
end;
v14.InternalDoProcessCommands = function(v136, v137, v138, v139) --[[ Line: 341 ]] --[[ Name: InternalDoProcessCommands ]]
    for v140, v141, _ in (v136.ProcessCommandsFunctions:GetIterator()) do
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 344 ]]
            local v143 = v141(v137, v138, v139);
            if type(v143) ~= "boolean" then
                error("Process command functions must return a bool");
            end;
            return v143;
        end);
        if not l_status_8 then
            warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", v140, l_result_8));
        elseif l_result_8 then
            return true;
        end;
    end;
    return false;
end;
v14.InternalPostMessage = function(v146, v147, v148, v149) --[[ Line: 362 ]] --[[ Name: InternalPostMessage ]]
    if v146:InternalDoProcessCommands(v147.Name, v148, v146.Name) then
        return false;
    else
        if v146.Mutes[v147.Name:lower()] ~= nil then
            local v150 = v146.Mutes[v147.Name:lower()];
            if v150 > 0 and v150 < os.time() then
                v146:UnmuteSpeaker(v147.Name);
            else
                v146:SendSystemMessageToSpeaker(v10:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), v147.Name);
                return false;
            end;
        end;
        local v151 = v146:InternalCreateMessageObject(v148, v147.Name, false, v149);
        v151.Message = v148;
        local v152 = nil;
        pcall(function() --[[ Line: 380 ]]
            v152 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, v151);
        end);
        v151.Message = nil;
        if v152 then
            if v152.ShouldDeliver == false then
                return false;
            else
                v151 = v152;
            end;
        end;
        v148 = v146:SendMessageObjToFilters(v148, v151, v147);
        local v153 = {};
        for _, v155 in pairs(v146.Speakers) do
            if not v155:IsSpeakerMuted(v147.Name) and v146:CanCommunicate(v147, v155) then
                table.insert(v153, v155.Name);
                if v155.Name == v147.Name then
                    local l_v151_0 = v151;
                    local v157 = {};
                    for v158, v159 in pairs(l_v151_0) do
                        v157[v158] = v159;
                    end;
                    local l_v157_0 = v157;
                    if v0 then
                        l_v151_0 = v151.MessageLengthUtf8 or v151.MessageLength;
                        l_v157_0.Message = string.rep("_", l_v151_0);
                    else
                        l_v157_0.Message = v148;
                    end;
                    l_v157_0.IsFiltered = true;
                    v155:InternalSendMessage(l_v157_0, v146.Name);
                else
                    v155:InternalSendMessage(v151, v146.Name);
                end;
            end;
        end;
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 419 ]]
            v146.eMessagePosted:Fire(v151);
        end);
        if not l_status_9 and l_result_9 then
            print("Error posting message: " .. l_result_9);
        end;
        local v163 = v146.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat;
        local v164, v165, v166 = v146.ChatService:InternalApplyRobloxFilterNewAPI(v151.FromSpeaker, v148, v163);
        if v164 then
            v151.FilterResult = v166;
            v151.IsFilterResult = v165;
        elseif l_status_0 then
            v151.IsFilterResult = false;
            v151.FilterResult = "";
            v151.MessageLength = 0;
        else
            return false;
        end;
        v151.IsFiltered = true;
        v146:InternalAddMessageToHistoryLog(v151);
        for _, v168 in pairs(v153) do
            local v169 = v146.Speakers[v168];
            if v169 then
                v169:InternalSendFilteredMessageWithFilterResult(v151, v146.Name);
            end;
        end;
        local v170 = {};
        for _, v172 in pairs(v146.Speakers) do
            if not v172:IsSpeakerMuted(v147.Name) and v146:CanCommunicate(v147, v172) then
                local v173 = false;
                for _, v175 in pairs(v153) do
                    if v172.Name == v175 then
                        v173 = true;
                        break;
                    end;
                end;
                if not v173 then
                    table.insert(v170, v172.Name);
                end;
            end;
        end;
        for _, v177 in pairs(v170) do
            local v178 = v146.Speakers[v177];
            if v178 then
                v178:InternalSendFilteredMessageWithFilterResult(v151, v146.Name);
            end;
        end;
        return v151;
    end;
end;
v14.InternalAddSpeaker = function(v179, v180) --[[ Line: 481 ]] --[[ Name: InternalAddSpeaker ]]
    if v179.Speakers[v180.Name] then
        warn("Speaker \"" .. v180.name .. "\" is already in the channel!");
        return;
    else
        v179.Speakers[v180.Name] = v180;
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 488 ]]
            v179.eSpeakerJoined:Fire(v180.Name);
        end);
        if not l_status_10 and l_result_10 then
            print("Error removing channel: " .. l_result_10);
        end;
        return;
    end;
end;
v14.InternalRemoveSpeaker = function(v183, v184) --[[ Line: 494 ]] --[[ Name: InternalRemoveSpeaker ]]
    if not v183.Speakers[v184.Name] then
        warn("Speaker \"" .. v184.name .. "\" is not in the channel!");
        return;
    else
        v183.Speakers[v184.Name] = nil;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 501 ]]
            v183.eSpeakerLeft:Fire(v184.Name);
        end);
        if not l_status_11 and l_result_11 then
            print("Error removing speaker: " .. l_result_11);
        end;
        return;
    end;
end;
v14.InternalRemoveExcessMessagesFromLog = function(v187) --[[ Line: 507 ]] --[[ Name: InternalRemoveExcessMessagesFromLog ]]
    local l_remove_0 = table.remove;
    while #v187.ChatHistory > v187.MaxHistory do
        l_remove_0(v187.ChatHistory, 1);
    end;
end;
v14.InternalAddMessageToHistoryLog = function(v189, v190) --[[ Line: 514 ]] --[[ Name: InternalAddMessageToHistoryLog ]]
    table.insert(v189.ChatHistory, v190);
    v189:InternalRemoveExcessMessagesFromLog();
end;
v14.GetMessageType = function(_, _, v193) --[[ Line: 520 ]] --[[ Name: GetMessageType ]]
    if v193 == nil then
        return l_ChatConstants_0.MessageTypeSystem;
    else
        return l_ChatConstants_0.MessageTypeDefault;
    end;
end;
v14.InternalCreateMessageObject = function(v194, v195, v196, v197, v198) --[[ Line: 527 ]] --[[ Name: InternalCreateMessageObject ]]
    local l_v194_MessageType_0 = v194:GetMessageType(v195, v196);
    local v200 = -1;
    local v201 = nil;
    local v202 = nil;
    if v196 then
        v202 = v194.ChatService:GetSpeaker(v196);
        if v202 then
            local l_v202_Player_0 = v202:GetPlayer();
            if l_v202_Player_0 then
                v200 = l_v202_Player_0.UserId;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    v201 = v202:GetNameForDisplay();
                end;
            else
                v200 = 0;
            end;
        end;
    end;
    local v204 = {
        ID = v194.ChatService:InternalGetUniqueMessageId(), 
        FromSpeaker = v196, 
        SpeakerDisplayName = v201, 
        SpeakerUserId = v200, 
        OriginalChannel = v194.Name, 
        MessageLength = string.len(v195), 
        MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v195)), 
        MessageType = l_v194_MessageType_0, 
        IsFiltered = v197, 
        Message = v197 and v195 or nil, 
        Time = os.time(), 
        ExtraData = {}
    };
    if v202 then
        for v205, v206 in pairs(v202.ExtraData) do
            v204.ExtraData[v205] = v206;
        end;
    end;
    if v198 then
        for v207, v208 in pairs(v198) do
            v204.ExtraData[v207] = v208;
        end;
    end;
    return v204;
end;
v14.SetChannelNameColor = function(v209, v210) --[[ Line: 587 ]] --[[ Name: SetChannelNameColor ]]
    v209.ChannelNameColor = v210;
    for _, v212 in pairs(v209.Speakers) do
        v212:UpdateChannelNameColor(v209.Name, v210);
    end;
end;
v14.GetWelcomeMessageForSpeaker = function(v213, v214) --[[ Line: 594 ]] --[[ Name: GetWelcomeMessageForSpeaker ]]
    if v213.GetWelcomeMessageFunction then
        local v215 = v213.GetWelcomeMessageFunction(v214);
        if v215 then
            return v215;
        end;
    end;
    return v213.WelcomeMessage;
end;
v14.RegisterGetWelcomeMessageFunction = function(v216, v217) --[[ Line: 604 ]] --[[ Name: RegisterGetWelcomeMessageFunction ]]
    if type(v217) ~= "function" then
        error("RegisterGetWelcomeMessageFunction must be called with a function.");
    end;
    v216.GetWelcomeMessageFunction = v217;
end;
v14.UnRegisterGetWelcomeMessageFunction = function(v218) --[[ Line: 611 ]] --[[ Name: UnRegisterGetWelcomeMessageFunction ]]
    v218.GetWelcomeMessageFunction = nil;
end;
l_result_0.new = function(v219, v220, v221, v222) --[[ Line: 618 ]] --[[ Name: new ]]
    local v223 = setmetatable({}, v14);
    v223.ChatService = v219;
    v223.Name = v220;
    v223.WelcomeMessage = v221 or "";
    v223.GetWelcomeMessageFunction = nil;
    v223.ChannelNameColor = v222;
    v223.Joinable = true;
    v223.Leavable = true;
    v223.AutoJoin = false;
    v223.Private = false;
    v223.Speakers = {};
    v223.Mutes = {};
    v223.MaxHistory = 200;
    v223.HistoryIndex = 0;
    v223.ChatHistory = {};
    v223.FilterMessageFunctions = l_Util_0:NewSortedFunctionContainer();
    v223.ProcessCommandsFunctions = l_Util_0:NewSortedFunctionContainer();
    v223.eDestroyed = Instance.new("BindableEvent");
    v223.eMessagePosted = Instance.new("BindableEvent");
    v223.eSpeakerJoined = Instance.new("BindableEvent");
    v223.eSpeakerLeft = Instance.new("BindableEvent");
    v223.eSpeakerMuted = Instance.new("BindableEvent");
    v223.eSpeakerUnmuted = Instance.new("BindableEvent");
    v223.MessagePosted = v223.eMessagePosted.Event;
    v223.SpeakerJoined = v223.eSpeakerJoined.Event;
    v223.SpeakerLeft = v223.eSpeakerLeft.Event;
    v223.SpeakerMuted = v223.eSpeakerMuted.Event;
    v223.SpeakerUnmuted = v223.eSpeakerUnmuted.Event;
    v223.Destroyed = v223.eDestroyed.Event;
    return v223;
end;
return l_result_0;