-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("FriendService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local _ = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v6 = nil;
pcall(function() --[[ Line: 14 ]]
    v6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v6 == nil then
    v6 = {};
end;
if not v6.FormatMessageToSend or not v6.LocalizeFormattedMessage then
    v6.FormatMessageToSend = function(_, _, v9) --[[ Line: 17 ]] --[[ Name: FormatMessageToSend ]]
        return v9;
    end;
end;
local v10 = {
    ChatColor = Color3.fromRGB(255, 255, 255)
};
return function(v11) --[[ Line: 23 ]] --[[ Name: Run ]]
    local function _() --[[ Line: 25 ]] --[[ Name: ShowFriendJoinNotification ]]
        if l_ChatSettings_0.ShowFriendJoinNotification ~= nil then
            return l_ChatSettings_0.ShowFriendJoinNotification;
        else
            return false;
        end;
    end;
    local function v17(v13, v14) --[[ Line: 32 ]] --[[ Name: SendFriendJoinNotification ]]
        local l_v11_Speaker_0 = v11:GetSpeaker(v13.Name);
        if l_v11_Speaker_0 then
            local l_Name_0 = v14.Name;
            if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                l_Name_0 = v14.DisplayName;
            end;
            l_v11_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", l_Name_0), "RBX_NAME", l_Name_0), "System", v10);
        end;
    end;
    local function _(v18, v19) --[[ Line: 48 ]] --[[ Name: TrySendFriendNotification ]]
        if v18 ~= v19 then
            coroutine.wrap(function() --[[ Line: 50 ]]
                if v18:IsFriendsWith(v19.UserId) then
                    v17(v18, v19);
                end;
            end)();
        end;
    end;
    if l_ChatSettings_0.ShowFriendJoinNotification ~= nil and l_ChatSettings_0.ShowFriendJoinNotification then
        l_Players_0.PlayerAdded:connect(function(v21) --[[ Line: 59 ]]
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            for v23 = 1, #l_l_Players_0_Players_0 do
                local v24 = l_l_Players_0_Players_0[v23];
                if v24 ~= v21 then
                    coroutine.wrap(function() --[[ Line: 50 ]]
                        if v24:IsFriendsWith(v21.UserId) then
                            v17(v24, v21);
                        end;
                    end)();
                end;
            end;
        end);
    end;
end;