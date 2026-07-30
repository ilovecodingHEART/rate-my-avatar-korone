-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = script.Parent.Parent:WaitForChild("CommonUtils");
local l_None_0 = Enum.UserInputType.None;
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v5 = setmetatable({}, l_BaseCharacterController_0);
v5.__index = v5;
v5.new = function(v6) --[[ Line: 23 ]] --[[ Name: new ]]
    local v7 = setmetatable(l_BaseCharacterController_0.new(), v5);
    v7.CONTROL_ACTION_PRIORITY = v6;
    v7.forwardValue = 0;
    v7.backwardValue = 0;
    v7.leftValue = 0;
    v7.rightValue = 0;
    v7.activeGamepad = l_None_0;
    v7.gamepadConnectedConn = nil;
    v7.gamepadDisconnectedConn = nil;
    return v7;
end;
v5.Enable = function(v8, v9) --[[ Line: 39 ]] --[[ Name: Enable ]]
    if v9 == v8.enabled then
        return true;
    else
        v8.forwardValue = 0;
        v8.backwardValue = 0;
        v8.leftValue = 0;
        v8.rightValue = 0;
        v8.moveVector = Vector3.new(0, 0, 0, 0);
        v8.isJumping = false;
        if v9 then
            v8.activeGamepad = v8:GetHighestPriorityGamepad();
            if v8.activeGamepad ~= l_None_0 then
                v8:BindContextActions();
                v8:ConnectGamepadConnectionListeners();
            else
                return false;
            end;
        else
            v8:UnbindContextActions();
            v8:DisconnectGamepadConnectionListeners();
            v8.activeGamepad = l_None_0;
        end;
        v8.enabled = v9;
        return true;
    end;
end;
v5.GetHighestPriorityGamepad = function(_) --[[ Line: 75 ]] --[[ Name: GetHighestPriorityGamepad ]]
    local l_l_UserInputService_0_ConnectedGamepads_0 = l_UserInputService_0:GetConnectedGamepads();
    local l_l_None_0_0 = l_None_0;
    for _, v14 in pairs(l_l_UserInputService_0_ConnectedGamepads_0) do
        if v14.Value < l_l_None_0_0.Value then
            l_l_None_0_0 = v14;
        end;
    end;
    return l_l_None_0_0;
end;
v5.BindContextActions = function(v15) --[[ Line: 86 ]] --[[ Name: BindContextActions ]]
    if v15.activeGamepad == l_None_0 then
        return false;
    else
        local function v19(_, v17, _) --[[ Line: 93 ]]
            v15.isJumping = v17 == Enum.UserInputState.Begin;
            return Enum.ContextActionResult.Sink;
        end;
        local function v23(_, v21, v22) --[[ Line: 98 ]]
            if v21 == Enum.UserInputState.Cancel then
                v15.moveVector = Vector3.new(0, 0, 0, 0);
                return Enum.ContextActionResult.Sink;
            elseif v15.activeGamepad ~= v22.UserInputType then
                return Enum.ContextActionResult.Pass;
            elseif v22.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                return;
            else
                if v22.Position.magnitude > 0.2 then
                    v15.moveVector = Vector3.new(v22.Position.X, 0, -v22.Position.Y);
                else
                    v15.moveVector = Vector3.new(0, 0, 0, 0);
                end;
                return Enum.ContextActionResult.Sink;
            end;
        end;
        l_ContextActionService_0:BindActivate(v15.activeGamepad, Enum.KeyCode.ButtonR2);
        l_ContextActionService_0:BindActionAtPriority("jumpAction", v19, false, v15.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:BindActionAtPriority("moveThumbstick", v23, false, v15.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
        return true;
    end;
end;
v5.UnbindContextActions = function(v24) --[[ Line: 127 ]] --[[ Name: UnbindContextActions ]]
    if v24.activeGamepad ~= l_None_0 then
        l_ContextActionService_0:UnbindActivate(v24.activeGamepad, Enum.KeyCode.ButtonR2);
    end;
    l_ContextActionService_0:UnbindAction("moveThumbstick");
    l_ContextActionService_0:UnbindAction("jumpAction");
end;
v5.OnNewGamepadConnected = function(v25) --[[ Line: 135 ]] --[[ Name: OnNewGamepadConnected ]]
    local l_v25_HighestPriorityGamepad_0 = v25:GetHighestPriorityGamepad();
    if l_v25_HighestPriorityGamepad_0 == v25.activeGamepad then
        return;
    elseif l_v25_HighestPriorityGamepad_0 == l_None_0 then
        warn("Gamepad:OnNewGamepadConnected found no connected gamepads");
        v25:UnbindContextActions();
        return;
    else
        if v25.activeGamepad ~= l_None_0 then
            v25:UnbindContextActions();
        end;
        v25.activeGamepad = l_v25_HighestPriorityGamepad_0;
        v25:BindContextActions();
        return;
    end;
end;
v5.OnCurrentGamepadDisconnected = function(v27) --[[ Line: 162 ]] --[[ Name: OnCurrentGamepadDisconnected ]]
    if v27.activeGamepad ~= l_None_0 then
        l_ContextActionService_0:UnbindActivate(v27.activeGamepad, Enum.KeyCode.ButtonR2);
    end;
    local l_v27_HighestPriorityGamepad_0 = v27:GetHighestPriorityGamepad();
    if v27.activeGamepad ~= l_None_0 and l_v27_HighestPriorityGamepad_0 == v27.activeGamepad then
        warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.");
        v27:UnbindContextActions();
        v27.activeGamepad = l_None_0;
        return;
    elseif l_v27_HighestPriorityGamepad_0 == l_None_0 then
        v27:UnbindContextActions();
        v27.activeGamepad = l_None_0;
        return;
    else
        v27.activeGamepad = l_v27_HighestPriorityGamepad_0;
        l_ContextActionService_0:BindActivate(v27.activeGamepad, Enum.KeyCode.ButtonR2);
        return;
    end;
end;
v5.ConnectGamepadConnectionListeners = function(v29) --[[ Line: 187 ]] --[[ Name: ConnectGamepadConnectionListeners ]]
    v29.gamepadConnectedConn = l_UserInputService_0.GamepadConnected:Connect(function(_) --[[ Line: 188 ]]
        v29:OnNewGamepadConnected();
    end);
    v29.gamepadDisconnectedConn = l_UserInputService_0.GamepadDisconnected:Connect(function(v31) --[[ Line: 192 ]]
        if v29.activeGamepad == v31 then
            v29:OnCurrentGamepadDisconnected();
        end;
    end);
end;
v5.DisconnectGamepadConnectionListeners = function(v32) --[[ Line: 200 ]] --[[ Name: DisconnectGamepadConnectionListeners ]]
    if v32.gamepadConnectedConn then
        v32.gamepadConnectedConn:Disconnect();
        v32.gamepadConnectedConn = nil;
    end;
    if v32.gamepadDisconnectedConn then
        v32.gamepadDisconnectedConn:Disconnect();
        v32.gamepadDisconnectedConn = nil;
    end;
end;
return v5;