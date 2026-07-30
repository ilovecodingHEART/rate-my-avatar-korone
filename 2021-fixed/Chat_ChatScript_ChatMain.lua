-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x4, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local v1 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
    return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if l_status_0 then
    v1 = l_result_0;
end;
l_status_0 = game:GetService("RunService");
l_result_0 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_DefaultChatSystemChatEvents_0 = l_result_0:WaitForChild("DefaultChatSystemChatEvents");
local l_DefaultChatSystemChatEvents_1 = l_result_0:WaitForChild("DefaultChatSystemChatEvents");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_MessageCreatorModules_0 = l_ClientChatModules_0:WaitForChild("MessageCreatorModules");
local l_Util_0 = require(l_MessageCreatorModules_0:WaitForChild("Util"));
local v14 = nil;
pcall(function() --[[ Line: 42 ]]
    v14 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v14 == nil then
    v14 = {
        Get = function(_, _, v17) --[[ Line: 43 ]] --[[ Name: Get ]]
            return v17;
        end
    };
end;
local v18 = 10;
local v19 = {
    OnNewMessage = "RemoteEvent", 
    OnMessageDoneFiltering = "RemoteEvent", 
    OnNewSystemMessage = "RemoteEvent", 
    OnChannelJoined = "RemoteEvent", 
    OnChannelLeft = "RemoteEvent", 
    OnMuted = "RemoteEvent", 
    OnUnmuted = "RemoteEvent", 
    OnMainChannelSet = "RemoteEvent", 
    SayMessageRequest = "RemoteEvent", 
    GetInitDataRequest = "RemoteFunction"
};
local v20 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
TryRemoveChildWithVerifyingIsCorrectType = function(v22) --[[ Line: 68 ]] --[[ Name: TryRemoveChildWithVerifyingIsCorrectType ]]
    if v19[v22.Name] and v22:IsA(v19[v22.Name]) then
        v19[v22.Name] = nil;
        v20[v22.Name] = v22;
        v18 = v18 - 1;
    end;
end;
for _, v24 in pairs(l_DefaultChatSystemChatEvents_1:GetChildren()) do
    TryRemoveChildWithVerifyingIsCorrectType(v24);
end;
if v18 > 0 then
    local v26 = l_DefaultChatSystemChatEvents_1.ChildAdded:connect(function(v25) --[[ Line: 81 ]]
        TryRemoveChildWithVerifyingIsCorrectType(v25);
        if v18 < 1 then
            l_BindableEvent_0:Fire();
        end;
    end);
    l_BindableEvent_0.Event:wait();
    v26:disconnect();
    l_BindableEvent_0:Destroy();
end;
l_DefaultChatSystemChatEvents_1 = v20;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v31 = true;
local v32 = 6;
if l_ChatSettings_0.ScreenGuiDisplayOrder ~= nil then
    v32 = l_ChatSettings_0.ScreenGuiDisplayOrder;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "Chat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.DisplayOrder = v32;
l_ScreenGui_0.Parent = l_PlayerGui_0;
local v35 = false;
local l_script_0 = script;
local l_ChatWindow_0 = require(l_script_0:WaitForChild("ChatWindow"));
local l_ChatBar_0 = require(l_script_0:WaitForChild("ChatBar"));
local l_ChannelsBar_0 = require(l_script_0:WaitForChild("ChannelsBar"));
local _ = require(l_script_0:WaitForChild("MessageLabelCreator"));
local l_MessageLogDisplay_0 = require(l_script_0:WaitForChild("MessageLogDisplay"));
local _ = require(l_script_0:WaitForChild("ChatChannel"));
local l_CommandProcessor_0 = require(l_script_0:WaitForChild("CommandProcessor"));
local v44 = l_ChatWindow_0.new();
local v45 = l_ChannelsBar_0.new();
local v46 = l_MessageLogDisplay_0.new();
local v47 = l_CommandProcessor_0.new();
local v48 = l_ChatBar_0.new(v47, v44);
v44:CreateGuiObjects(l_ScreenGui_0);
v44:RegisterChatBar(v48);
v44:RegisterChannelsBar(v45);
v44:RegisterMessageLogDisplay(v46);
l_Util_0:RegisterChatWindow(v44);
local l_MessageSender_0 = require(l_script_0:WaitForChild("MessageSender"));
l_MessageSender_0:RegisterSayMessageFunction(l_DefaultChatSystemChatEvents_1.SayMessageRequest);
if l_UserInputService_0.TouchEnabled then
    v48:SetTextLabelText(v14:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"));
else
    v48:SetTextLabelText(v14:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
end;
spawn(function() --[[ Line: 162 ]]
    local l_CurveUtil_0 = require(l_script_0:WaitForChild("CurveUtil"));
    local v51 = 1 / (l_ChatSettings_0.ChatAnimationFPS or 20);
    local v52 = tick();
    while true do
        local v53 = tick();
        local v54 = l_CurveUtil_0:DeltaTimeToTimescale(v53 - v52);
        if v54 ~= 0 then
            v44:Update(v54);
        end;
        v52 = v53;
        wait(v51);
    end;
end);
CheckIfPointIsInSquare = function(v55, v56, v57) --[[ Line: 188 ]] --[[ Name: CheckIfPointIsInSquare ]]
    local v58 = false;
    if v56.X <= v55.X then
        v58 = false;
        if v55.X <= v57.X then
            v58 = false;
            if v56.Y <= v55.Y then
                v58 = v55.Y <= v57.Y;
            end;
        end;
    end;
    return v58;
end;
local v59 = false;
local v60 = false;
local v61 = 0;
local v62 = 0;
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
DoBackgroundFadeIn = function(v66) --[[ Line: 202 ]] --[[ Name: DoBackgroundFadeIn ]]
    v62 = tick();
    v59 = false;
    l_BindableEvent_1:Fire();
    v44:FadeInBackground(v66 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v44:GetCurrentChannel() then
        local l_Scroller_0 = v46.Scroller;
        l_Scroller_0.ScrollingEnabled = true;
        l_Scroller_0.ScrollBarThickness = l_MessageLogDisplay_0.ScrollBarThickness;
    end;
end;
DoBackgroundFadeOut = function(v68) --[[ Line: 217 ]] --[[ Name: DoBackgroundFadeOut ]]
    v62 = tick();
    v59 = true;
    l_BindableEvent_1:Fire();
    v44:FadeOutBackground(v68 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v44:GetCurrentChannel() then
        local l_Scroller_1 = v46.Scroller;
        l_Scroller_1.ScrollingEnabled = false;
        l_Scroller_1.ScrollBarThickness = 0;
    end;
end;
DoTextFadeIn = function(v70) --[[ Line: 232 ]] --[[ Name: DoTextFadeIn ]]
    v61 = tick();
    v60 = false;
    l_BindableEvent_1:Fire();
    v44:FadeInText((v70 or l_ChatSettings_0.ChatDefaultFadeDuration) * 0);
end;
DoTextFadeOut = function(v71) --[[ Line: 239 ]] --[[ Name: DoTextFadeOut ]]
    v61 = tick();
    v60 = true;
    l_BindableEvent_1:Fire();
    v44:FadeOutText(v71 or l_ChatSettings_0.ChatDefaultFadeDuration);
end;
DoFadeInFromNewInformation = function() --[[ Line: 246 ]] --[[ Name: DoFadeInFromNewInformation ]]
    DoTextFadeIn();
    if l_ChatSettings_0.ChatShouldFadeInFromNewInformation then
        DoBackgroundFadeIn();
    end;
end;
InstantFadeIn = function() --[[ Line: 253 ]] --[[ Name: InstantFadeIn ]]
    DoBackgroundFadeIn(0);
    DoTextFadeIn(0);
end;
InstantFadeOut = function() --[[ Line: 258 ]] --[[ Name: InstantFadeOut ]]
    DoBackgroundFadeOut(0);
    DoTextFadeOut(0);
end;
local v72 = nil;
UpdateFadingForMouseState = function(v73) --[[ Line: 264 ]] --[[ Name: UpdateFadingForMouseState ]]
    v72 = v73;
    l_BindableEvent_2:Fire();
    if v48:IsFocused() then
        return;
    elseif v73 then
        DoBackgroundFadeIn();
        DoTextFadeIn();
        return;
    else
        DoBackgroundFadeIn();
        return;
    end;
end;
spawn(function() --[[ Line: 280 ]]
    while true do
        l_RunService_0.RenderStepped:wait();
        while true do
            if v72 or v48:IsFocused() then
                if v72 then
                    l_BindableEvent_2.Event:wait();
                end;
                if v48:IsFocused() then
                    l_BindableEvent_3.Event:wait();
                end;
            elseif not v59 then
                if tick() - v62 > l_ChatSettings_0.ChatWindowBackgroundFadeOutTime then
                    DoBackgroundFadeOut();
                    break;
                else
                    break;
                end;
            elseif not v60 then
                if tick() - v61 > l_ChatSettings_0.ChatWindowTextFadeOutTime then
                    DoTextFadeOut();
                    break;
                else
                    break;
                end;
            else
                l_BindableEvent_1.Event:wait();
                break;
            end;
        end;
    end;
end);
getClassicChatEnabled = function() --[[ Line: 313 ]] --[[ Name: getClassicChatEnabled ]]
    if l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return l_ChatSettings_0.ClassicChatEnabled;
    else
        return l_Players_0.ClassicChat;
    end;
end;
getBubbleChatEnabled = function() --[[ Line: 320 ]] --[[ Name: getBubbleChatEnabled ]]
    if l_ChatSettings_0.BubbleChatEnabled ~= nil then
        return l_ChatSettings_0.BubbleChatEnabled;
    else
        return l_Players_0.BubbleChat;
    end;
end;
bubbleChatOnly = function() --[[ Line: 327 ]] --[[ Name: bubbleChatOnly ]]
    return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
UpdateMousePosition = function(v74) --[[ Line: 331 ]] --[[ Name: UpdateMousePosition ]]
    if not v0.Visible or not v0.IsCoreGuiEnabled or not v0.TopbarEnabled and not l_ChatSettings_0.ChatOnWithTopBarOff then
        return;
    elseif bubbleChatOnly() then
        return;
    else
        local l_AbsolutePosition_0 = v44.GuiObject.AbsolutePosition;
        local l_AbsoluteSize_0 = v44.GuiObject.AbsoluteSize;
        local v77 = CheckIfPointIsInSquare(v74, l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
        if v77 ~= v72 then
            UpdateFadingForMouseState(v77);
        end;
        return;
    end;
end;
l_UserInputService_0.InputChanged:connect(function(v78, _) --[[ Line: 348 ]]
    if v78.UserInputType == Enum.UserInputType.MouseMovement then
        local v80 = Vector2.new(v78.Position.X, v78.Position.Y);
        UpdateMousePosition(v80);
    end;
end);
l_UserInputService_0.TouchTap:connect(function(v81, _) --[[ Line: 355 ]]
    UpdateMousePosition(v81[1]);
end);
l_UserInputService_0.TouchMoved:connect(function(v83, _) --[[ Line: 359 ]]
    local v85 = Vector2.new(v83.Position.X, v83.Position.Y);
    UpdateMousePosition(v85);
end);
l_UserInputService_0.Changed:connect(function(v86) --[[ Line: 364 ]]
    if v86 == "MouseBehavior" and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local l_AbsolutePosition_1 = v44.GuiObject.AbsolutePosition;
        local l_AbsoluteSize_1 = v44.GuiObject.AbsoluteSize;
        local l_AbsoluteSize_2 = l_ScreenGui_0.AbsoluteSize;
        if CheckIfPointIsInSquare(l_AbsoluteSize_2 / 2, l_AbsolutePosition_1, l_AbsolutePosition_1 + l_AbsoluteSize_1) then
            l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
        end;
    end;
end);
UpdateFadingForMouseState(true);
UpdateFadingForMouseState(false);
local v98 = {
    Signal = function() --[[ Line: 389 ]] --[[ Name: Signal ]]
        local v90 = {};
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        local v92 = nil;
        local v93 = nil;
        v90.fire = function(_, ...) --[[ Line: 397 ]] --[[ Name: fire ]]
            v92 = {
                ...
            };
            v93 = select("#", ...);
            l_BindableEvent_4:Fire();
        end;
        v90.connect = function(_, v96) --[[ Line: 403 ]] --[[ Name: connect ]]
            if not v96 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_4.Event:connect(function() --[[ Line: 405 ]]
                v96(unpack(v92, 1, v93));
            end);
        end;
        v90.wait = function(_) --[[ Line: 410 ]] --[[ Name: wait ]]
            l_BindableEvent_4.Event:wait();
            assert(v92, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
            return unpack(v92, 1, v93);
        end;
        return v90;
    end
};
SetVisibility = function(v99) --[[ Line: 421 ]] --[[ Name: SetVisibility ]]
    v44:SetVisible(v99);
    v0.VisibilityStateChanged:fire(v99);
    v0.Visible = v99;
    if v0.IsCoreGuiEnabled then
        if v99 then
            InstantFadeIn();
            return;
        else
            InstantFadeOut();
        end;
    end;
end;
v0.TopbarEnabled = true;
v0.MessageCount = 0;
v0.Visible = true;
v0.IsCoreGuiEnabled = true;
v0.ToggleVisibility = function(_) --[[ Line: 441 ]] --[[ Name: ToggleVisibility ]]
    SetVisibility(not v44:GetVisible());
end;
v0.SetVisible = function(_, v102) --[[ Line: 445 ]] --[[ Name: SetVisible ]]
    if v44:GetVisible() ~= v102 then
        SetVisibility(v102);
    end;
end;
v0.FocusChatBar = function(_) --[[ Line: 451 ]] --[[ Name: FocusChatBar ]]
    v48:CaptureFocus();
end;
v0.EnterWhisperState = function(_, v105) --[[ Line: 455 ]] --[[ Name: EnterWhisperState ]]
    v48:EnterWhisperState(v105);
end;
v0.GetVisibility = function(_) --[[ Line: 459 ]] --[[ Name: GetVisibility ]]
    return v44:GetVisible();
end;
v0.GetMessageCount = function(v107) --[[ Line: 463 ]] --[[ Name: GetMessageCount ]]
    return v107.MessageCount;
end;
v0.TopbarEnabledChanged = function(v108, v109) --[[ Line: 467 ]] --[[ Name: TopbarEnabledChanged ]]
    v108.TopbarEnabled = v109;
    v108.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
end;
v0.IsFocused = function(_, _) --[[ Line: 472 ]] --[[ Name: IsFocused ]]
    return v48:IsFocused();
end;
v0.ChatBarFocusChanged = v98.Signal();
v0.VisibilityStateChanged = v98.Signal();
v0.MessagesChanged = v98.Signal();
v0.MessagePosted = v98.Signal();
v0.CoreGuiEnabled = v98.Signal();
v0.ChatMakeSystemMessageEvent = v98.Signal();
v0.ChatWindowPositionEvent = v98.Signal();
v0.ChatWindowSizeEvent = v98.Signal();
v0.ChatBarDisabledEvent = v98.Signal();
v0.fChatWindowPosition = function(_) --[[ Line: 490 ]] --[[ Name: fChatWindowPosition ]]
    return v44.GuiObject.Position;
end;
v0.fChatWindowSize = function(_) --[[ Line: 494 ]] --[[ Name: fChatWindowSize ]]
    return v44.GuiObject.Size;
end;
v0.fChatBarDisabled = function(_) --[[ Line: 498 ]] --[[ Name: fChatBarDisabled ]]
    return not v48:GetEnabled();
end;
if v1 then
    l_ContextActionService_0:BindAction("ToggleChat", function(v115, v116, v117) --[[ Line: 506 ]] --[[ Name: handleAction ]]
        if v115 == "ToggleChat" and v116 == Enum.UserInputState.Begin and v31 and v117.UserInputType == Enum.UserInputType.Keyboard then
            DoChatBarFocus();
        end;
    end, true, Enum.KeyCode.Slash);
else
    v0.SpecialKeyPressed = function(_, v119, _) --[[ Line: 513 ]] --[[ Name: SpecialKeyPressed ]]
        if v119 == Enum.SpecialKey.ChatHotkey and v31 then
            DoChatBarFocus();
        end;
    end;
end;
v0.CoreGuiEnabled:connect(function(v121) --[[ Line: 523 ]]
    v0.IsCoreGuiEnabled = v121;
    v121 = v121 and (v0.TopbarEnabled or l_ChatSettings_0.ChatOnWithTopBarOff);
    v44:SetCoreGuiEnabled(v121);
    if not v121 then
        v48:ReleaseFocus();
        InstantFadeOut();
        return;
    else
        InstantFadeIn();
        return;
    end;
end);
trimTrailingSpaces = function(v122) --[[ Line: 538 ]] --[[ Name: trimTrailingSpaces ]]
    local v123 = #v122;
    while v123 > 0 and v122:find("^%s", v123) do
        v123 = v123 - 1;
    end;
    return v122:sub(1, v123);
end;
v0.ChatMakeSystemMessageEvent:connect(function(v124) --[[ Line: 551 ]]
    if v124.Text and type(v124.Text) == "string" then
        while not v35 do
            wait();
        end;
        local l_GeneralChannelName_0 = l_ChatSettings_0.GeneralChannelName;
        local l_v44_Channel_0 = v44:GetChannel(l_GeneralChannelName_0);
        if l_v44_Channel_0 then
            l_v44_Channel_0:AddMessageToChannel({
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = l_GeneralChannelName_0, 
                IsFiltered = true, 
                MessageLength = string.len(v124.Text), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v124.Text)), 
                Message = trimTrailingSpaces(v124.Text), 
                MessageType = l_ChatConstants_0.MessageTypeSetCore, 
                Time = os.time(), 
                ExtraData = v124
            });
            v45:UpdateMessagePostedInChannel(l_GeneralChannelName_0);
            v0.MessageCount = v0.MessageCount + 1;
            v0.MessagesChanged:fire(v0.MessageCount);
        end;
    end;
end);
v0.ChatBarDisabledEvent:connect(function(v127) --[[ Line: 581 ]]
    if v31 then
        v48:SetEnabled(not v127);
        if v127 then
            v48:ReleaseFocus();
        end;
    end;
end);
v0.ChatWindowSizeEvent:connect(function(v128) --[[ Line: 590 ]]
    v44.GuiObject.Size = v128;
end);
v0.ChatWindowPositionEvent:connect(function(v129) --[[ Line: 594 ]]
    v44.GuiObject.Position = v129;
end);
DoChatBarFocus = function() --[[ Line: 602 ]] --[[ Name: DoChatBarFocus ]]
    if not v44:GetCoreGuiEnabled() then
        return;
    elseif not v48:GetEnabled() then
        return;
    else
        if not v48:IsFocused() and v48:GetVisible() then
            v0:SetVisible(true);
            InstantFadeIn();
            v48:CaptureFocus();
            v0.ChatBarFocusChanged:fire(true);
        end;
        return;
    end;
end;
l_BindableEvent_3.Event:connect(function(v130) --[[ Line: 614 ]]
    v0.ChatBarFocusChanged:fire(v130);
end);
DoSwitchCurrentChannel = function(v131) --[[ Line: 618 ]] --[[ Name: DoSwitchCurrentChannel ]]
    if v44:GetChannel(v131) then
        v44:SwitchCurrentChannel(v131);
    end;
end;
SendMessageToSelfInTargetChannel = function(v132, v133, v134) --[[ Line: 624 ]] --[[ Name: SendMessageToSelfInTargetChannel ]]
    local l_v44_Channel_1 = v44:GetChannel(v133);
    if l_v44_Channel_1 then
        l_v44_Channel_1:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = v133, 
            IsFiltered = true, 
            MessageLength = string.len(v132), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v132)), 
            Message = trimTrailingSpaces(v132), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = v134
        });
    end;
end;
chatBarFocused = function() --[[ Line: 645 ]] --[[ Name: chatBarFocused ]]
    if not v72 then
        DoBackgroundFadeIn();
        if v60 then
            DoTextFadeIn();
        end;
    end;
    l_BindableEvent_3:Fire(true);
end;
chatBarFocusLost = function(v136, _) --[[ Line: 657 ]] --[[ Name: chatBarFocusLost ]]
    DoBackgroundFadeIn();
    l_BindableEvent_3:Fire(false);
    if v136 then
        local l_Text_0 = v48:GetTextBox().Text;
        if v48:IsInCustomState() then
            local l_v48_CustomMessage_0 = v48:GetCustomMessage();
            if l_v48_CustomMessage_0 then
                l_Text_0 = l_v48_CustomMessage_0;
            end;
            local v140 = v48:CustomStateProcessCompletedMessage(l_Text_0);
            v48:ResetCustomState();
            if v140 then
                return;
            end;
        end;
        v48:GetTextBox().Text = "";
        if l_Text_0 ~= "" then
            v0.MessagePosted:fire(l_Text_0);
            if not v47:ProcessCompletedChatMessage(l_Text_0, v44) then
                if l_ChatSettings_0.DisallowedWhiteSpace then
                    for v141 = 1, #l_ChatSettings_0.DisallowedWhiteSpace do
                        if l_ChatSettings_0.DisallowedWhiteSpace[v141] == "\t" then
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v141], " ");
                        else
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v141], "");
                        end;
                    end;
                end;
                l_Text_0 = string.gsub(l_Text_0, "\n", "");
                l_Text_0 = string.gsub(l_Text_0, "[ ]+", " ");
                local l_v44_TargetMessageChannel_0 = v44:GetTargetMessageChannel();
                if l_v44_TargetMessageChannel_0 then
                    l_MessageSender_0:SendMessage(l_Text_0, l_v44_TargetMessageChannel_0);
                    return;
                else
                    l_MessageSender_0:SendMessage(l_Text_0, nil);
                end;
            end;
        end;
    end;
end;
local v143 = {};
setupChatBarConnections = function() --[[ Line: 708 ]] --[[ Name: setupChatBarConnections ]]
    for v144 = 1, #v143 do
        v143[v144]:Disconnect();
    end;
    v143 = {};
    local v145 = v48:GetTextBox().FocusLost:connect(chatBarFocusLost);
    table.insert(v143, v145);
    local v146 = v48:GetTextBox().Focused:connect(chatBarFocused);
    table.insert(v143, v146);
end;
setupChatBarConnections();
v48.GuiObjectsChanged:connect(setupChatBarConnections);
getEchoMessagesInGeneral = function() --[[ Line: 724 ]] --[[ Name: getEchoMessagesInGeneral ]]
    if l_ChatSettings_0.EchoMessagesInGeneralChannel == nil then
        return true;
    else
        return l_ChatSettings_0.EchoMessagesInGeneralChannel;
    end;
end;
l_DefaultChatSystemChatEvents_1.OnMessageDoneFiltering.OnClientEvent:connect(function(v147) --[[ Line: 731 ]]
    if not l_ChatSettings_0.ShowUserOwnFilteredMessage and v147.FromSpeaker == l_LocalPlayer_0.Name then
        return;
    else
        local l_OriginalChannel_0 = v147.OriginalChannel;
        local l_v44_Channel_2 = v44:GetChannel(l_OriginalChannel_0);
        if l_v44_Channel_2 then
            l_v44_Channel_2:UpdateMessageFiltered(v147);
        end;
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and l_OriginalChannel_0 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v44_Channel_3 = v44:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v44_Channel_3 then
                l_v44_Channel_3:UpdateMessageFiltered(v147);
            end;
        end;
        return;
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewMessage.OnClientEvent:connect(function(v151, v152) --[[ Line: 752 ]]
    local l_v44_Channel_4 = v44:GetChannel(v152);
    if l_v44_Channel_4 then
        l_v44_Channel_4:AddMessageToChannel(v151);
        if v151.FromSpeaker ~= l_LocalPlayer_0.Name then
            v45:UpdateMessagePostedInChannel(v152);
        end;
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and v152 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v44_Channel_5 = v44:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v44_Channel_5 then
                l_v44_Channel_5:AddMessageToChannel(v151);
            end;
        end;
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewSystemMessage.OnClientEvent:connect(function(v155, v156) --[[ Line: 775 ]]
    v156 = v156 or "System";
    local l_v44_Channel_6 = v44:GetChannel(v156);
    if l_v44_Channel_6 then
        l_v44_Channel_6:AddMessageToChannel(v155);
        v45:UpdateMessagePostedInChannel(v156);
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
        if getEchoMessagesInGeneral() and l_ChatSettings_0.GeneralChannelName and v156 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v44_Channel_7 = v44:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v44_Channel_7 then
                l_v44_Channel_7:AddMessageToChannel(v155);
                return;
            end;
        end;
    else
        warn(string.format("Just received system message for channel I'm not in [%s]", v156));
    end;
end);
HandleChannelJoined = function(v159, v160, v161, v162, v163, v164) --[[ Line: 801 ]] --[[ Name: HandleChannelJoined ]]
    if v44:GetChannel(v159) then
        v44:RemoveChannel(v159);
    end;
    if v159 == l_ChatSettings_0.GeneralChannelName then
        v35 = true;
    end;
    if v162 then
        v48:SetChannelNameColor(v159, v162);
    end;
    local v165 = v44:AddChannel(v159);
    if v165 then
        if v159 == l_ChatSettings_0.GeneralChannelName then
            DoSwitchCurrentChannel(v159);
        end;
        if v161 then
            local v166 = 1;
            if #v161 > l_ChatSettings_0.MessageHistoryLengthPerChannel then
                v166 = #v161 - l_ChatSettings_0.MessageHistoryLengthPerChannel;
            end;
            for v167 = v166, #v161 do
                v165:AddMessageToChannel(v161[v167]);
            end;
            if getEchoMessagesInGeneral() and v163 and l_ChatSettings_0.GeneralChannelName and v159 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v44_Channel_8 = v44:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v44_Channel_8 then
                    l_v44_Channel_8:AddMessagesToChannelByTimeStamp(v161, v166);
                end;
            end;
        end;
        if v160 ~= "" then
            local v169 = {
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = v159, 
                IsFiltered = true, 
                MessageLength = string.len(v160), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v160)), 
                Message = trimTrailingSpaces(v160), 
                MessageType = l_ChatConstants_0.MessageTypeWelcome, 
                Time = os.time(), 
                ExtraData = nil
            };
            v165:AddMessageToChannel(v169);
            if getEchoMessagesInGeneral() and v164 and not l_ChatSettings_0.ShowChannelsBar and v159 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v44_Channel_9 = v44:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v44_Channel_9 then
                    l_v44_Channel_9:AddMessageToChannel(v169);
                end;
            end;
        end;
        DoFadeInFromNewInformation();
    end;
end;
l_DefaultChatSystemChatEvents_1.OnChannelJoined.OnClientEvent:connect(function(v171, v172, v173, v174) --[[ Line: 874 ]]
    HandleChannelJoined(v171, v172, v173, v174, false, true);
end);
l_DefaultChatSystemChatEvents_1.OnChannelLeft.OnClientEvent:connect(function(v175) --[[ Line: 878 ]]
    v44:RemoveChannel(v175);
    DoFadeInFromNewInformation();
end);
l_DefaultChatSystemChatEvents_1.OnMuted.OnClientEvent:connect(function(_) --[[ Line: 884 ]]

end);
l_DefaultChatSystemChatEvents_1.OnUnmuted.OnClientEvent:connect(function(_) --[[ Line: 890 ]]

end);
l_DefaultChatSystemChatEvents_1.OnMainChannelSet.OnClientEvent:connect(function(v178) --[[ Line: 894 ]]
    DoSwitchCurrentChannel(v178);
end);
coroutine.wrap(function() --[[ Line: 898 ]]
    local v179 = l_DefaultChatSystemChatEvents_0:WaitForChild("ChannelNameColorUpdated", 5);
    if v179 then
        v179.OnClientEvent:connect(function(v180, v181) --[[ Line: 902 ]]
            v48:SetChannelNameColor(v180, v181);
        end);
    end;
end)();
local v182 = nil;
local v183 = nil;
local v184 = nil;
local v185 = nil;
pcall(function() --[[ Line: 918 ]]
    v182 = l_StarterGui_0:GetCore("PlayerBlockedEvent");
    v183 = l_StarterGui_0:GetCore("PlayerMutedEvent");
    v184 = l_StarterGui_0:GetCore("PlayerUnblockedEvent");
    v185 = l_StarterGui_0:GetCore("PlayerUnmutedEvent");
end);
SendSystemMessageToSelf = function(v186) --[[ Line: 925 ]] --[[ Name: SendSystemMessageToSelf ]]
    local l_v44_CurrentChannel_0 = v44:GetCurrentChannel();
    if l_v44_CurrentChannel_0 then
        l_v44_CurrentChannel_0:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = l_v44_CurrentChannel_0.Name, 
            IsFiltered = true, 
            MessageLength = string.len(v186), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v186)), 
            Message = trimTrailingSpaces(v186), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = nil
        });
    end;
end;
MutePlayer = function(v188) --[[ Line: 947 ]] --[[ Name: MutePlayer ]]
    local l_MutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("MutePlayerRequest");
    if l_MutePlayerRequest_0 then
        return l_MutePlayerRequest_0:InvokeServer(v188.Name);
    else
        return false;
    end;
end;
if v182 then
    v182.Event:connect(function(v190) --[[ Line: 956 ]]
        if MutePlayer(v190) then
            local v191 = nil;
            v191 = __2021_if(function() return l_ChatSettings_0.PlayerDisplayNamesEnabled end, function() return v190.DisplayName end, function() return v190.Name end);
            SendSystemMessageToSelf(v14:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", v191), {
                RBX_NAME = v191
            }));
        end;
    end);
end;
if v183 then
    v183.Event:connect(function(v192) --[[ Line: 978 ]]
        if MutePlayer(v192) then
            local v193 = nil;
            v193 = __2021_if(function() return l_ChatSettings_0.PlayerDisplayNamesEnabled end, function() return v192.DisplayName end, function() return v192.Name end);
            SendSystemMessageToSelf(v14:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", v193), {
                RBX_NAME = v193
            }));
        end;
    end);
end;
UnmutePlayer = function(v194) --[[ Line: 999 ]] --[[ Name: UnmutePlayer ]]
    local l_UnMutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("UnMutePlayerRequest");
    if l_UnMutePlayerRequest_0 then
        return l_UnMutePlayerRequest_0:InvokeServer(v194.Name);
    else
        return false;
    end;
end;
if v184 then
    v184.Event:connect(function(v196) --[[ Line: 1008 ]]
        if UnmutePlayer(v196) then
            local v197 = nil;
            v197 = __2021_if(function() return l_ChatSettings_0.PlayerDisplayNamesEnabled end, function() return v196.DisplayName end, function() return v196.Name end);
            SendSystemMessageToSelf(v14:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", v197), {
                RBX_NAME = v197
            }));
        end;
    end);
end;
if v185 then
    v185.Event:connect(function(v198) --[[ Line: 1030 ]]
        if UnmutePlayer(v198) then
            local v199 = nil;
            v199 = __2021_if(function() return l_ChatSettings_0.PlayerDisplayNamesEnabled end, function() return v198.DisplayName end, function() return v198.Name end);
            SendSystemMessageToSelf(v14:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", v199), {
                RBX_NAME = v199
            }));
        end;
    end);
end;
spawn(function() --[[ Line: 1053 ]]
    if l_LocalPlayer_0.UserId > 0 then
        pcall(function() --[[ Line: 1056 ]]
            local l_l_StarterGui_0_Core_0 = l_StarterGui_0:GetCore("GetBlockedUserIds");
            if #l_l_StarterGui_0_Core_0 > 0 then
                local l_SetBlockedUserIdsRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("SetBlockedUserIdsRequest");
                if l_SetBlockedUserIdsRequest_0 then
                    l_SetBlockedUserIdsRequest_0:FireServer(l_l_StarterGui_0_Core_0);
                end;
            end;
        end);
    end;
end);
spawn(function() --[[ Line: 1068 ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 1069 ]]
        return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
    end);
    if l_status_1 then
        v31 = l_RunService_0:IsStudio() or l_result_1;
    end;
end);
local v204 = l_DefaultChatSystemChatEvents_1.GetInitDataRequest:InvokeServer();
for _, v206 in pairs(v204.Channels) do
    if v206[1] == l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v206[1], v206[2], v206[3], v206[4], true, false);
    end;
end;
for _, v208 in pairs(v204.Channels) do
    if v208[1] ~= l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v208[1], v208[2], v208[3], v208[4], true, false);
    end;
end;
return v0;