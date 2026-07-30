-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if l_status_0 then
    v0 = l_result_0;
end;
l_status_0 = game:GetService("StarterGui");
l_result_0 = game:GetService("GuiService");
local l_Chat_0 = game:GetService("Chat");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local function v50() --[[ Line: 24 ]] --[[ Name: DoEverything ]]
    local l_ChatMain_0 = require(script:WaitForChild("ChatMain"));
    local v8 = {
        ChatWindow = {}, 
        SetCore = {}, 
        GetCore = {}
    };
    v8.ChatWindow.ChatTypes = {};
    v8.ChatWindow.ChatTypes.BubbleChatEnabled = l_ChatSettings_0.BubbleChatEnabled;
    v8.ChatWindow.ChatTypes.ClassicChatEnabled = l_ChatSettings_0.ClassicChatEnabled;
    local function _(v9) --[[ Line: 37 ]] --[[ Name: ConnectEvent ]]
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = v9;
        v8.ChatWindow[v9] = l_BindableEvent_0;
        l_BindableEvent_0.Event:connect(function(...) --[[ Line: 42 ]]
            l_ChatMain_0[v9](l_ChatMain_0, ...);
        end);
    end;
    local function _(v12) --[[ Line: 45 ]] --[[ Name: ConnectFunction ]]
        local l_BindableFunction_0 = Instance.new("BindableFunction");
        l_BindableFunction_0.Name = v12;
        v8.ChatWindow[v12] = l_BindableFunction_0;
        l_BindableFunction_0.OnInvoke = function(...) --[[ Line: 50 ]]
            return l_ChatMain_0[v12](l_ChatMain_0, ...);
        end;
    end;
    local function _(v15) --[[ Line: 53 ]] --[[ Name: ReverseConnectEvent ]]
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = v15;
        v8.ChatWindow[v15] = l_BindableEvent_1;
        l_ChatMain_0[v15]:connect(function(...) --[[ Line: 58 ]]
            l_BindableEvent_1:Fire(...);
        end);
    end;
    local function _(v18) --[[ Line: 61 ]] --[[ Name: ConnectSignal ]]
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = v18;
        v8.ChatWindow[v18] = l_BindableEvent_2;
        l_BindableEvent_2.Event:connect(function(...) --[[ Line: 66 ]]
            l_ChatMain_0[v18]:fire(...);
        end);
    end;
    local function _(v21) --[[ Line: 69 ]] --[[ Name: ConnectSetCore ]]
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = v21;
        v8.SetCore[v21] = l_BindableEvent_3;
        l_BindableEvent_3.Event:connect(function(...) --[[ Line: 74 ]]
            l_ChatMain_0[v21 .. "Event"]:fire(...);
        end);
    end;
    local function _(v24) --[[ Line: 77 ]] --[[ Name: ConnectGetCore ]]
        local l_BindableFunction_1 = Instance.new("BindableFunction");
        l_BindableFunction_1.Name = v24;
        v8.GetCore[v24] = l_BindableFunction_1;
        l_BindableFunction_1.OnInvoke = function(...) --[[ Line: 82 ]]
            return l_ChatMain_0["f" .. v24](...);
        end;
    end;
    local l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ToggleVisibility";
    v8.ChatWindow.ToggleVisibility = l_BindableEvent_4;
    local l_Event_0 = l_BindableEvent_4.Event;
    local v29 = "ToggleVisibility";
    local l_v29_0 = v29 --[[ copy: 12 -> 13 ]];
    l_Event_0:connect(function(...) --[[ Line: 42 ]]
        l_ChatMain_0[l_v29_0](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "SetVisible";
    v8.ChatWindow.SetVisible = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "SetVisible";
    local l_v29_1 = v29 --[[ copy: 12 -> 14 ]];
    l_Event_0:connect(function(...) --[[ Line: 42 ]]
        l_ChatMain_0[l_v29_1](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "FocusChatBar";
    v8.ChatWindow.FocusChatBar = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "FocusChatBar";
    local l_v29_2 = v29 --[[ copy: 12 -> 15 ]];
    l_Event_0:connect(function(...) --[[ Line: 42 ]]
        l_ChatMain_0[l_v29_2](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "EnterWhisperState";
    v8.ChatWindow.EnterWhisperState = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "EnterWhisperState";
    local l_v29_3 = v29 --[[ copy: 12 -> 16 ]];
    l_Event_0:connect(function(...) --[[ Line: 42 ]]
        l_ChatMain_0[l_v29_3](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "GetVisibility";
    v8.ChatWindow.GetVisibility = l_BindableEvent_4;
    local v34 = "GetVisibility";
    local l_v34_0 = v34 --[[ copy: 10 -> 17 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 50 ]]
        return l_ChatMain_0[l_v34_0](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "GetMessageCount";
    v8.ChatWindow.GetMessageCount = l_BindableEvent_4;
    v34 = "GetMessageCount";
    local l_v34_1 = v34 --[[ copy: 10 -> 18 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 50 ]]
        return l_ChatMain_0[l_v34_1](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "TopbarEnabledChanged";
    v8.ChatWindow.TopbarEnabledChanged = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "TopbarEnabledChanged";
    local l_v29_4 = v29 --[[ copy: 12 -> 19 ]];
    l_Event_0:connect(function(...) --[[ Line: 42 ]]
        l_ChatMain_0[l_v29_4](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "IsFocused";
    v8.ChatWindow.IsFocused = l_BindableEvent_4;
    v34 = "IsFocused";
    local l_v34_2 = v34 --[[ copy: 10 -> 20 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 50 ]]
        return l_ChatMain_0[l_v34_2](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatBarFocusChanged";
    v8.ChatWindow.ChatBarFocusChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_0 = l_BindableEvent_4 --[[ copy: 8 -> 21 ]];
    l_ChatMain_0.ChatBarFocusChanged:connect(function(...) --[[ Line: 58 ]]
        l_l_BindableEvent_4_0:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "VisibilityStateChanged";
    v8.ChatWindow.VisibilityStateChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_1 = l_BindableEvent_4 --[[ copy: 8 -> 22 ]];
    l_ChatMain_0.VisibilityStateChanged:connect(function(...) --[[ Line: 58 ]]
        l_l_BindableEvent_4_1:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "MessagesChanged";
    v8.ChatWindow.MessagesChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_2 = l_BindableEvent_4 --[[ copy: 8 -> 23 ]];
    l_ChatMain_0.MessagesChanged:connect(function(...) --[[ Line: 58 ]]
        l_l_BindableEvent_4_2:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "MessagePosted";
    v8.ChatWindow.MessagePosted = l_BindableEvent_4;
    local l_l_BindableEvent_4_3 = l_BindableEvent_4 --[[ copy: 8 -> 24 ]];
    l_ChatMain_0.MessagePosted:connect(function(...) --[[ Line: 58 ]]
        l_l_BindableEvent_4_3:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "CoreGuiEnabled";
    v8.ChatWindow.CoreGuiEnabled = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "CoreGuiEnabled";
    local l_v29_5 = v29 --[[ copy: 12 -> 25 ]];
    l_Event_0:connect(function(...) --[[ Line: 66 ]]
        l_ChatMain_0[l_v29_5]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatMakeSystemMessage";
    v8.SetCore.ChatMakeSystemMessage = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "ChatMakeSystemMessage";
    local l_v29_6 = v29 --[[ copy: 12 -> 26 ]];
    l_Event_0:connect(function(...) --[[ Line: 74 ]]
        l_ChatMain_0[l_v29_6 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatWindowPosition";
    v8.SetCore.ChatWindowPosition = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "ChatWindowPosition";
    local l_v29_7 = v29 --[[ copy: 12 -> 27 ]];
    l_Event_0:connect(function(...) --[[ Line: 74 ]]
        l_ChatMain_0[l_v29_7 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatWindowSize";
    v8.SetCore.ChatWindowSize = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "ChatWindowSize";
    local l_v29_8 = v29 --[[ copy: 12 -> 28 ]];
    l_Event_0:connect(function(...) --[[ Line: 74 ]]
        l_ChatMain_0[l_v29_8 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatWindowPosition";
    v8.GetCore.ChatWindowPosition = l_BindableEvent_4;
    v34 = "ChatWindowPosition";
    local l_v34_3 = v34 --[[ copy: 10 -> 29 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 82 ]]
        return l_ChatMain_0["f" .. l_v34_3](...);
    end;
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatWindowSize";
    v8.GetCore.ChatWindowSize = l_BindableEvent_4;
    v34 = "ChatWindowSize";
    local l_v34_4 = v34 --[[ copy: 10 -> 30 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 82 ]]
        return l_ChatMain_0["f" .. l_v34_4](...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatBarDisabled";
    v8.SetCore.ChatBarDisabled = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v29 = "ChatBarDisabled";
    local l_v29_9 = v29 --[[ copy: 12 -> 31 ]];
    l_Event_0:connect(function(...) --[[ Line: 74 ]]
        l_ChatMain_0[l_v29_9 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatBarDisabled";
    v8.GetCore.ChatBarDisabled = l_BindableEvent_4;
    v34 = "ChatBarDisabled";
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 82 ]]
        return l_ChatMain_0["f" .. v34](...);
    end;
    if not v0 then
        l_BindableEvent_4 = Instance.new("BindableEvent");
        l_BindableEvent_4.Name = "SpecialKeyPressed";
        v8.ChatWindow.SpecialKeyPressed = l_BindableEvent_4;
        l_Event_0 = l_BindableEvent_4.Event;
        v29 = "SpecialKeyPressed";
        l_Event_0:connect(function(...) --[[ Line: 42 ]]
            l_ChatMain_0[v29](l_ChatMain_0, ...);
        end);
    end;
    SetCoreGuiChatConnections(v8);
end;
SetCoreGuiChatConnections = function(v51) --[[ Line: 117 ]] --[[ Name: SetCoreGuiChatConnections ]]
    local v52 = 0;
    while v52 < 10 do
        v52 = v52 + 1;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 121 ]]
            l_status_0:SetCore("CoreGuiChatConnections", v51);
        end);
        if not l_status_1 then
            if not l_status_1 and v52 == 10 then
                error("Error calling SetCore CoreGuiChatConnections: " .. l_result_1);
            end;
            wait();
        else
            break;
        end;
    end;
end;
checkBothChatTypesDisabled = function() --[[ Line: 132 ]] --[[ Name: checkBothChatTypesDisabled ]]
    if l_ChatSettings_0.BubbleChatEnabled ~= nil and l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return not (l_ChatSettings_0.BubbleChatEnabled or l_ChatSettings_0.ClassicChatEnabled);
    else
        return false;
    end;
end;
if not l_result_0:IsTenFootInterface() and not game:GetService("UserInputService").VREnabled then
    if not checkBothChatTypesDisabled() then
        v50();
    else
        local v55 = {
            ChatWindow = {}
        };
        v55.ChatWindow.ChatTypes = {};
        v55.ChatWindow.ChatTypes.BubbleChatEnabled = false;
        v55.ChatWindow.ChatTypes.ClassicChatEnabled = false;
        SetCoreGuiChatConnections(v55);
    end;
else
    l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer();
end;