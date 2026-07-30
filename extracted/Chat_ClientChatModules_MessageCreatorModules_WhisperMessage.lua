-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v6 = nil;
pcall(function() --[[ Line: 18 ]]
    v6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
CreateMessageLabel = function(v7, v8) --[[ Line: 20 ]] --[[ Name: CreateMessageLabel ]]
    local l_FromSpeaker_0 = v7.FromSpeaker;
    local l_SpeakerDisplayName_0 = v7.SpeakerDisplayName;
    local _ = v7.Message;
    local v12 = v7.ExtraData or {};
    local v13 = v12.Font or l_ChatSettings_0.DefaultFont;
    local v14 = v12.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v15 = v12.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v16 = v12.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v17 = v12.ChannelColor or v16;
    local v18 = nil;
    v18 = if l_ChatSettings_0.PlayerDisplayNamesEnabled and v7.SpeakerDisplayName then string.format("[%s]:", l_SpeakerDisplayName_0) else string.format("[%s]:", l_FromSpeaker_0);
    local _ = l_Util_0:GetStringTextBounds(v18, v13, v14);
    local v20 = l_Util_0:GetNumberOfSpaces(v18, v13, v14) + 1;
    local l_l_Util_0_BaseMessage_0, v22 = l_Util_0:CreateBaseMessage("", v13, v14, v16);
    local v23 = l_Util_0:AddNameButtonToBaseMessage(v22, v15, v18, l_FromSpeaker_0);
    local v24 = nil;
    if v8 ~= v7.OriginalChannel then
        local l_OriginalChannel_0 = v7.OriginalChannel;
        if v7.FromSpeaker ~= l_LocalPlayer_0.Name then
            l_OriginalChannel_0 = string.format("From %s", v7.FromSpeaker);
        end;
        if v6.tryLocalize then
            l_OriginalChannel_0 = v6:tryLocalize(l_OriginalChannel_0);
        end;
        local v26 = string.format("{%s}", l_OriginalChannel_0);
        v24 = l_Util_0:AddChannelButtonToBaseMessage(v22, v17, v26, v7.OriginalChannel);
        v23.Position = UDim2.new(0, v24.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v13, v14).X, 0, 0);
        v20 = v20 + l_Util_0:GetNumberOfSpaces(v26, v13, v14) + 1;
    end;
    local function v29(v27) --[[ Line: 64 ]] --[[ Name: UpdateTextFunction ]]
        if v7.IsFiltered then
            v22.Text = string.rep(" ", v20) .. v27.Message;
            return;
        else
            local v28 = v27.MessageLengthUtf8 or v27.MessageLength;
            v22.Text = string.rep(" ", v20) .. string.rep("_", v28);
            return;
        end;
    end;
    v29(v7);
    local function v31(v30) --[[ Line: 75 ]] --[[ Name: GetHeightFunction ]]
        return l_Util_0:GetMessageHeight(v22, l_l_Util_0_BaseMessage_0, v30);
    end;
    local v32 = {
        [v23] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }, 
        [v22] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }
    };
    if v24 then
        v32[v24] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        };
    end;
    local l_l_Util_0_FadeFunctions_0, v34, v35 = l_Util_0:CreateFadeFunctions(v32);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v22, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v29, 
        [l_Util_0.KEY_GET_HEIGHT] = v31, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v34, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v35
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeWhisper, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};