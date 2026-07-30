-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local _ = script.Parent;
local v5 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v5 = l_status_0 and l_result_0;
l_status_0 = function(v8) --[[ Line: 23 ]] --[[ Name: ShallowCopy ]]
    local v9 = {};
    for v10, v11 in pairs(v8) do
        v9[v10] = v11;
    end;
    return v9;
end;
l_result_0 = {};
local v12 = {
    eDestroyed = true, 
    eSaidMessage = true, 
    eReceivedMessage = true, 
    eReceivedUnfilteredMessage = true, 
    eMessageDoneFiltering = true, 
    eReceivedSystemMessage = true, 
    eChannelJoined = true, 
    eChannelLeft = true, 
    eMuted = true, 
    eUnmuted = true, 
    eExtraDataUpdated = true, 
    eMainChannelSet = true, 
    eChannelNameColorUpdated = true
};
local v13 = {
    Destroyed = "eDestroyed", 
    SaidMessage = "eSaidMessage", 
    ReceivedMessage = "eReceivedMessage", 
    ReceivedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    RecievedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    MessageDoneFiltering = "eMessageDoneFiltering", 
    ReceivedSystemMessage = "eReceivedSystemMessage", 
    ChannelJoined = "eChannelJoined", 
    ChannelLeft = "eChannelLeft", 
    Muted = "eMuted", 
    Unmuted = "eUnmuted", 
    ExtraDataUpdated = "eExtraDataUpdated", 
    MainChannelSet = "eMainChannelSet", 
    ChannelNameColorUpdated = "eChannelNameColorUpdated"
};
l_result_0.__index = function(v14, v15) --[[ Line: 67 ]]
    local v16 = rawget(l_result_0, v15);
    if v16 then
        return v16;
    else
        if v12[v15] and not rawget(v14, v15) then
            rawset(v14, v15, Instance.new("BindableEvent"));
        end;
        local v17 = v13[v15];
        if v17 and not rawget(v14, v15) then
            if not rawget(v14, v17) then
                rawset(v14, v17, Instance.new("BindableEvent"));
            end;
            rawset(v14, v15, rawget(v14, v17).Event);
        end;
        return (rawget(v14, v15));
    end;
end;
l_result_0.LazyFire = function(v18, v19, ...) --[[ Line: 84 ]] --[[ Name: LazyFire ]]
    local v20 = rawget(v18, v19);
    if v20 then
        v20:Fire(...);
    end;
end;
l_result_0.SayMessage = function(v21, v22, v23, v24) --[[ Line: 91 ]] --[[ Name: SayMessage ]]
    if v21.ChatService:InternalDoProcessCommands(v21.Name, v22, v23) then
        return;
    elseif not v23 then
        return;
    else
        local v25 = v21.Channels[v23:lower()];
        if not v25 then
            return;
        else
            local v26 = v25:InternalPostMessage(v21, v22, v24);
            if v26 then
                pcall(function() --[[ Line: 106 ]]
                    v21:LazyFire("eSaidMessage", v26, v23);
                end);
            end;
            return v26;
        end;
    end;
end;
l_result_0.JoinChannel = function(v27, v28) --[[ Line: 114 ]] --[[ Name: JoinChannel ]]
    if v27.Channels[v28:lower()] then
        warn("Speaker is already in channel \"" .. v28 .. "\"");
        return;
    else
        local l_Channel_0 = v27.ChatService:GetChannel(v28);
        if not l_Channel_0 then
            error("Channel \"" .. v28 .. "\" does not exist!");
        end;
        v27.Channels[v28:lower()] = l_Channel_0;
        l_Channel_0:InternalAddSpeaker(v27);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 127 ]]
            v27.eChannelJoined:Fire(l_Channel_0.Name, l_Channel_0:GetWelcomeMessageForSpeaker(v27));
        end);
        if not l_status_1 and l_result_1 then
            print("Error joining channel: " .. l_result_1);
        end;
        return;
    end;
end;
l_result_0.LeaveChannel = function(v32, v33) --[[ Line: 135 ]] --[[ Name: LeaveChannel ]]
    if not v32.Channels[v33:lower()] then
        warn("Speaker is not in channel \"" .. v33 .. "\"");
        return;
    else
        local v34 = v32.Channels[v33:lower()];
        v32.Channels[v33:lower()] = nil;
        v34:InternalRemoveSpeaker(v32);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 145 ]]
            v32:LazyFire("eChannelLeft", v34.Name);
            if v32.PlayerObj then
                v32.EventFolder.OnChannelLeft:FireClient(v32.PlayerObj, v34.Name);
            end;
        end);
        if not l_status_2 and l_result_2 then
            print("Error leaving channel: " .. l_result_2);
        end;
        return;
    end;
end;
l_result_0.IsInChannel = function(v37, v38) --[[ Line: 156 ]] --[[ Name: IsInChannel ]]
    return v37.Channels[v38:lower()] ~= nil;
end;
l_result_0.GetChannelList = function(v39) --[[ Line: 160 ]] --[[ Name: GetChannelList ]]
    local v40 = {};
    for _, v42 in pairs(v39.Channels) do
        table.insert(v40, v42.Name);
    end;
    return v40;
end;
l_result_0.SendMessage = function(v43, v44, v45, v46, v47) --[[ Line: 168 ]] --[[ Name: SendMessage ]]
    local v48 = v43.Channels[v45:lower()];
    if v48 then
        v48:SendMessageToSpeaker(v44, v43.Name, v46, v47);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", v43.Name, v45));
        end;
        return;
    end;
end;
l_result_0.SendSystemMessage = function(v49, v50, v51, v52) --[[ Line: 179 ]] --[[ Name: SendSystemMessage ]]
    local v53 = v49.Channels[v51:lower()];
    if v53 then
        v53:SendSystemMessageToSpeaker(v50, v49.Name, v52);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", v49.Name, v51));
        end;
        return;
    end;
end;
l_result_0.GetPlayer = function(v54) --[[ Line: 190 ]] --[[ Name: GetPlayer ]]
    return v54.PlayerObj;
end;
l_result_0.GetNameForDisplay = function(v55) --[[ Line: 194 ]] --[[ Name: GetNameForDisplay ]]
    if l_ChatSettings_0.PlayerDisplayNamesEnabled then
        local l_v55_Player_0 = v55:GetPlayer();
        if l_v55_Player_0 then
            return l_v55_Player_0.DisplayName;
        else
            return v55.Name;
        end;
    else
        return v55.Name;
    end;
end;
l_result_0.SetExtraData = function(v57, v58, v59) --[[ Line: 208 ]] --[[ Name: SetExtraData ]]
    v57.ExtraData[v58] = v59;
    v57:LazyFire("eExtraDataUpdated", v58, v59);
end;
l_result_0.GetExtraData = function(v60, v61) --[[ Line: 213 ]] --[[ Name: GetExtraData ]]
    return v60.ExtraData[v61];
end;
l_result_0.SetMainChannel = function(v62, v63) --[[ Line: 217 ]] --[[ Name: SetMainChannel ]]
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 218 ]]
        v62:LazyFire("eMainChannelSet", v63);
        if v62.PlayerObj then
            v62.EventFolder.OnMainChannelSet:FireClient(v62.PlayerObj, v63);
        end;
    end);
    if not l_status_3 and l_result_3 then
        print("Error setting main channel: " .. l_result_3);
    end;
end;
l_result_0.AddMutedSpeaker = function(v66, v67) --[[ Line: 230 ]] --[[ Name: AddMutedSpeaker ]]
    v66.MutedSpeakers[v67:lower()] = true;
end;
l_result_0.RemoveMutedSpeaker = function(v68, v69) --[[ Line: 234 ]] --[[ Name: RemoveMutedSpeaker ]]
    v68.MutedSpeakers[v69:lower()] = false;
end;
l_result_0.IsSpeakerMuted = function(v70, v71) --[[ Line: 238 ]] --[[ Name: IsSpeakerMuted ]]
    return v70.MutedSpeakers[v71:lower()];
end;
l_result_0.InternalDestroy = function(v72) --[[ Line: 244 ]] --[[ Name: InternalDestroy ]]
    for _, v74 in pairs(v72.Channels) do
        v74:InternalRemoveSpeaker(v72);
    end;
    v72.eDestroyed:Fire();
    v72.EventFolder = nil;
    v72.eDestroyed:Destroy();
    v72.eSaidMessage:Destroy();
    v72.eReceivedMessage:Destroy();
    v72.eReceivedUnfilteredMessage:Destroy();
    v72.eMessageDoneFiltering:Destroy();
    v72.eReceivedSystemMessage:Destroy();
    v72.eChannelJoined:Destroy();
    v72.eChannelLeft:Destroy();
    v72.eMuted:Destroy();
    v72.eUnmuted:Destroy();
    v72.eExtraDataUpdated:Destroy();
    v72.eMainChannelSet:Destroy();
    v72.eChannelNameColorUpdated:Destroy();
end;
l_result_0.InternalAssignPlayerObject = function(v75, v76) --[[ Line: 267 ]] --[[ Name: InternalAssignPlayerObject ]]
    v75.PlayerObj = v76;
end;
l_result_0.InternalAssignEventFolder = function(v77, v78) --[[ Line: 271 ]] --[[ Name: InternalAssignEventFolder ]]
    v77.EventFolder = v78;
end;
l_result_0.InternalSendMessage = function(v79, v80, v81) --[[ Line: 275 ]] --[[ Name: InternalSendMessage ]]
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 276 ]]
        v79:LazyFire("eReceivedUnfilteredMessage", v80, v81);
        if v79.PlayerObj then
            v79.EventFolder.OnNewMessage:FireClient(v79.PlayerObj, v80, v81);
        end;
    end);
    if not l_status_4 and l_result_4 then
        print("Error sending internal message: " .. l_result_4);
    end;
end;
l_result_0.InternalSendFilteredMessage = function(v84, v85, v86) --[[ Line: 287 ]] --[[ Name: InternalSendFilteredMessage ]]
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 288 ]]
        v84:LazyFire("eReceivedMessage", v85, v86);
        v84:LazyFire("eMessageDoneFiltering", v85, v86);
        if v84.PlayerObj then
            v84.EventFolder.OnMessageDoneFiltering:FireClient(v84.PlayerObj, v85, v86);
        end;
    end);
    if not l_status_5 and l_result_5 then
        print("Error sending internal filtered message: " .. l_result_5);
    end;
end;
l_result_0.InternalSendFilteredMessageWithFilterResult = function(v89, v90, v91) --[[ Line: 303 ]] --[[ Name: InternalSendFilteredMessageWithFilterResult ]]
    local v92 = {};
    for v93, v94 in pairs(v90) do
        v92[v93] = v94;
    end;
    local l_v92_0 = v92;
    v92 = l_v92_0.FilterResult;
    local l_v89_Player_0 = v89:GetPlayer();
    local v97 = "";
    pcall(function() --[[ Line: 310 ]]
        if l_v92_0.IsFilterResult then
            if l_v89_Player_0 then
                v97 = v92:GetChatForUserAsync(l_v89_Player_0.UserId);
                return;
            else
                v97 = v92:GetNonChatStringForBroadcastAsync();
                return;
            end;
        else
            v97 = v92;
            return;
        end;
    end);
    if v5 then
        l_v92_0.Message = v97;
        l_v92_0.FilterResult = nil;
        v89:InternalSendFilteredMessage(l_v92_0, v91);
    elseif #v97 > 0 then
        l_v92_0.Message = v97;
        l_v92_0.FilterResult = nil;
        v89:InternalSendFilteredMessage(l_v92_0, v91);
    end;
end;
l_result_0.InternalSendSystemMessage = function(v98, v99, v100) --[[ Line: 339 ]] --[[ Name: InternalSendSystemMessage ]]
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 340 ]]
        v98:LazyFire("eReceivedSystemMessage", v99, v100);
        if v98.PlayerObj then
            v98.EventFolder.OnNewSystemMessage:FireClient(v98.PlayerObj, v99, v100);
        end;
    end);
    if not l_status_6 and l_result_6 then
        print("Error sending internal system message: " .. l_result_6);
    end;
end;
l_result_0.UpdateChannelNameColor = function(v103, v104, v105) --[[ Line: 351 ]] --[[ Name: UpdateChannelNameColor ]]
    v103:LazyFire("eChannelNameColorUpdated", v104, v105);
    if v103.PlayerObj then
        v103.EventFolder.ChannelNameColorUpdated:FireClient(v103.PlayerObj, v104, v105);
    end;
end;
v0.new = function(v106, v107) --[[ Line: 361 ]] --[[ Name: new ]]
    local v108 = setmetatable({}, l_result_0);
    v108.ChatService = v106;
    v108.PlayerObj = nil;
    v108.Name = v107;
    v108.ExtraData = {};
    v108.Channels = {};
    v108.MutedSpeakers = {};
    v108.EventFolder = nil;
    return v108;
end;
return v0;