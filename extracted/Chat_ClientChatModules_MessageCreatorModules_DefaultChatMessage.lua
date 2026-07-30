-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateMessageLabel = function(v4, v5) --[[ Line: 10 ]] --[[ Name: CreateMessageLabel ]]
    local l_FromSpeaker_0 = v4.FromSpeaker;
    local v7 = nil;
    v7 = if l_ChatSettings_0.PlayerDisplayNamesEnabled and v4.SpeakerDisplayName then v4.SpeakerDisplayName else l_FromSpeaker_0;
    local _ = v4.Message;
    local v9 = v4.ExtraData or {};
    local v10 = v9.Font or l_ChatSettings_0.DefaultFont;
    local v11 = v9.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v12 = v9.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v13 = v9.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v14 = v9.ChannelColor or v13;
    local v15 = v9.Tags or {};
    local v16 = string.format("[%s]:", v7);
    local _ = l_Util_0:GetStringTextBounds(v16, v10, v11);
    local v18 = l_Util_0:GetNumberOfSpaces(v16, v10, v11) + 1;
    local l_l_Util_0_BaseMessage_0, v20 = l_Util_0:CreateBaseMessage("", v10, v11, v13);
    local v21 = l_Util_0:AddNameButtonToBaseMessage(v20, v12, v16, l_FromSpeaker_0);
    local v22 = nil;
    local v23 = UDim2.new(0, 0, 0, 0);
    if v5 ~= v4.OriginalChannel then
        local v24 = string.format("{%s}", v4.OriginalChannel);
        v22 = l_Util_0:AddChannelButtonToBaseMessage(v20, v14, v24, v4.OriginalChannel);
        v23 = UDim2.new(0, v22.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v10, v11).X, 0, 0);
        v18 = v18 + l_Util_0:GetNumberOfSpaces(v24, v10, v11) + 1;
    end;
    local v25 = {};
    for _, v27 in pairs(v15) do
        local v28 = v27.TagColor or Color3.fromRGB(255, 0, 255);
        local v29 = v27.TagText or "???";
        local v30 = string.format("[%s] ", v29);
        local v31 = l_Util_0:AddTagLabelToBaseMessage(v20, v28, v30);
        v31.Position = v23;
        v18 = v18 + l_Util_0:GetNumberOfSpaces(v30, v10, v11);
        v23 = v23 + UDim2.new(0, v31.Size.X.Offset, 0, 0);
        table.insert(v25, v31);
    end;
    v21.Position = v23;
    local function v34(v32) --[[ Line: 64 ]] --[[ Name: UpdateTextFunction ]]
        if v4.IsFiltered then
            v20.Text = string.rep(" ", v18) .. v32.Message;
            return;
        else
            local v33 = v32.MessageLengthUtf8 or v32.MessageLength;
            v20.Text = string.rep(" ", v18) .. string.rep("_", v33);
            return;
        end;
    end;
    v34(v4);
    local function v36(v35) --[[ Line: 75 ]] --[[ Name: GetHeightFunction ]]
        return l_Util_0:GetMessageHeight(v20, l_l_Util_0_BaseMessage_0, v35);
    end;
    local v37 = {
        [v21] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }, 
        [v20] = {
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
    for v38, v39 in pairs(v25) do
        local _ = string.format("Tag%d", v38);
        v37[v39] = {
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
    if v22 then
        v37[v22] = {
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
    local l_l_Util_0_FadeFunctions_0, v42, v43 = l_Util_0:CreateFadeFunctions(v37);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v20, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v34, 
        [l_Util_0.KEY_GET_HEIGHT] = v36, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v42, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v43
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeDefault, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};