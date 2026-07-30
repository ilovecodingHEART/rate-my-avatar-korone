-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = {};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local _ = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v6 = {};
v6.__index = v6;
v6.Destroy = function(v7) --[[ Line: 26 ]] --[[ Name: Destroy ]]
    v7.Destroyed = true;
end;
v6.SetActive = function(v8, v9) --[[ Line: 30 ]] --[[ Name: SetActive ]]
    if v9 == v8.Active then
        return;
    else
        if v9 == false then
            v8.MessageLogDisplay:Clear();
        else
            v8.MessageLogDisplay:SetCurrentChannelName(v8.Name);
            for v10 = 1, #v8.MessageLog do
                v8.MessageLogDisplay:AddMessage(v8.MessageLog[v10]);
            end;
        end;
        v8.Active = v9;
        return;
    end;
end;
v6.UpdateMessageFiltered = function(v11, v12) --[[ Line: 45 ]] --[[ Name: UpdateMessageFiltered ]]
    local v13 = 1;
    local l_MessageLog_0 = v11.MessageLog;
    local v15 = nil;
    while v13 <= #l_MessageLog_0 do
        local v16 = l_MessageLog_0[v13];
        if v16.ID == v12.ID then
            v15 = v16;
            break;
        else
            v13 = v13 + 1;
        end;
    end;
    if v15 then
        v15.Message = v12.Message;
        v15.IsFiltered = true;
        if v11.Active then
            if v0 and v15.Message == "" then
                table.remove(v11.MessageLog, v13);
            end;
            v11.MessageLogDisplay:UpdateMessageFiltered(v15);
            return;
        end;
    else
        v11:AddMessageToChannelByTimeStamp(v12);
    end;
end;
v6.AddMessageToChannel = function(v17, v18) --[[ Line: 77 ]] --[[ Name: AddMessageToChannel ]]
    table.insert(v17.MessageLog, v18);
    if v17.Active then
        v17.MessageLogDisplay:AddMessage(v18);
    end;
    if #v17.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel then
        v17:RemoveLastMessageFromChannel();
    end;
end;
v6.InternalAddMessageAtTimeStamp = function(v19, v20) --[[ Line: 87 ]] --[[ Name: InternalAddMessageAtTimeStamp ]]
    for v21 = 1, #v19.MessageLog do
        if v20.Time < v19.MessageLog[v21].Time then
            table.insert(v19.MessageLog, v21, v20);
            return;
        end;
    end;
    table.insert(v19.MessageLog, v20);
end;
v6.AddMessagesToChannelByTimeStamp = function(v22, v23, v24) --[[ Line: 97 ]] --[[ Name: AddMessagesToChannelByTimeStamp ]]
    for v25 = v24, #v23 do
        v22:InternalAddMessageAtTimeStamp(v23[v25]);
    end;
    while #v22.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel do
        table.remove(v22.MessageLog, 1);
    end;
    if v22.Active then
        v22.MessageLogDisplay:Clear();
        for v26 = 1, #v22.MessageLog do
            v22.MessageLogDisplay:AddMessage(v22.MessageLog[v26]);
        end;
    end;
end;
v6.AddMessageToChannelByTimeStamp = function(v27, v28) --[[ Line: 112 ]] --[[ Name: AddMessageToChannelByTimeStamp ]]
    if #v27.MessageLog >= 1 then
        if v27.MessageLog[1].Time > v28.Time then
            return;
        elseif v28.Time >= v27.MessageLog[#v27.MessageLog].Time then
            v27:AddMessageToChannel(v28);
            return;
        else
            for v29 = 1, #v27.MessageLog do
                if v28.Time < v27.MessageLog[v29].Time then
                    table.insert(v27.MessageLog, v29, v28);
                    if #v27.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel then
                        v27:RemoveLastMessageFromChannel();
                    end;
                    if v27.Active then
                        v27.MessageLogDisplay:AddMessageAtIndex(v28, v29);
                    end;
                    return;
                end;
            end;
            return;
        end;
    else
        v27:AddMessageToChannel(v28);
        return;
    end;
end;
v6.RemoveLastMessageFromChannel = function(v30) --[[ Line: 142 ]] --[[ Name: RemoveLastMessageFromChannel ]]
    table.remove(v30.MessageLog, 1);
    if v30.Active then
        v30.MessageLogDisplay:RemoveLastMessage();
    end;
end;
v6.ClearMessageLog = function(v31) --[[ Line: 150 ]] --[[ Name: ClearMessageLog ]]
    v31.MessageLog = {};
    if v31.Active then
        v31.MessageLogDisplay:Clear();
    end;
end;
v6.RegisterChannelTab = function(v32, v33) --[[ Line: 158 ]] --[[ Name: RegisterChannelTab ]]
    v32.ChannelTab = v33;
end;
l_status_0.new = function(v34, v35) --[[ Line: 165 ]] --[[ Name: new ]]
    local v36 = setmetatable({}, v6);
    v36.Destroyed = false;
    v36.Active = false;
    v36.MessageLog = {};
    v36.MessageLogDisplay = v35;
    v36.ChannelTab = nil;
    v36.Name = v34;
    return v36;
end;
return l_status_0;