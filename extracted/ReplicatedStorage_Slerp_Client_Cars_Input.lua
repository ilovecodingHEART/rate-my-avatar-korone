-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(script.Shared);
local v2 = require(script.Gamepad);
local v3 = require(script.Keyboard);
local v4 = require(script.Touch);
local v5 = {};
local function _(v6, v7) --[[ Line: 7 ]] --[[ Name: _ ]]
    if v7 then

    end;
    if v6.UserInputType == Enum.UserInputType.MouseButton1 then
        return true;
    else
        return false;
    end;
end;
local function _(v9) --[[ Line: 17 ]] --[[ Name: _ ]]
    if v9.inputBegan then
        v9.inputBegan:Disconnect();
    end;
    if v9.inputEnded then
        v9.inputEnded:Disconnect();
    end;
    if v9.inputChanged then
        v9.inputChanged:Disconnect();
    end;
end;
local function _(v11) --[[ Line: 28 ]] --[[ Name: _ ]]
    v11._throttle = 0;
    v11._steer = 0;
    v11._isHandbrakeEngaged = false;
end;
local function _(v13, v14) --[[ Line: 33 ]] --[[ Name: _ ]]
    if v14 and v14.destroy then
        v14.destroy(v13._handlerData);
    end;
    local v15 = v13._handlers[1];
    if v15.new then
        v13._handlerData = v15.new(v13);
        return;
    else
        v13._handlerData = nil;
        return;
    end;
end;
local function v24(v17, v18, v19) --[[ Line: 46 ]] --[[ Name: v24 ]]
    for v20, v21 in v17._handlers do
        if v21.is(v18, v19) then
            if v20 ~= 1 then
                local v22 = v17._handlers[1];
                v17._handlers[1] = v21;
                v17._handlers[v20] = v22;
                v17._throttle = 0;
                v17._steer = 0;
                v17._isHandbrakeEngaged = false;
                if v22 and v22.destroy then
                    v22.destroy(v17._handlerData);
                end;
                local v23 = v17._handlers[1];
                if v23.new then
                    v17._handlerData = v23.new(v17);
                else
                    v17._handlerData = nil;
                end;
                if v17._car and v21.onCarEntered then
                    v21.onCarEntered(v17);
                end;
            end;
            return v21;
        end;
    end;
    return nil;
end;
local function _(v25) --[[ Line: 74 ]] --[[ Name: _ ]]
    local l__connections_0 = v25._connections;
    if l__connections_0.inputBegan then
        l__connections_0.inputBegan:Disconnect();
    end;
end;
local function _(v28) --[[ Line: 80 ]] --[[ Name: _ ]]
    -- upvalues: l_UserInputService_0 (copy), v24 (copy)
    local l__connections_1 = v28._connections;
    if l__connections_1.inputBegan then
        l__connections_1.inputBegan:Disconnect();
    end;
    v28._connections.inputBegan = l_UserInputService_0.InputBegan:Connect(function(v30, v31) --[[ Line: 86 ]]
        -- upvalues: v28 (copy), v24 (ref)
        if if v31 then v30.UserInputType == Enum.UserInputType.MouseButton1 else v30.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        elseif v30.UserInputType == Enum.UserInputType.Focus then
            local l_v28_0 = v28;
            l_v28_0._throttle = 0;
            l_v28_0._steer = 0;
            l_v28_0._isHandbrakeEngaged = false;
            return;
        else
            local v33 = v24(v28, v30, v31);
            if not v33 then
                return;
            else
                v33.inputBeganCallback(v28, v30, v31);
                return;
            end;
        end;
    end);
end;
local function _(v35) --[[ Line: 107 ]] --[[ Name: _ ]]
    local l__connections_2 = v35._connections;
    if l__connections_2.inputEnded then
        l__connections_2.inputEnded:Disconnect();
    end;
end;
local function _(v38) --[[ Line: 113 ]] --[[ Name: _ ]]
    -- upvalues: l_UserInputService_0 (copy), v24 (copy)
    local l__connections_3 = v38._connections;
    if l__connections_3.inputEnded then
        l__connections_3.inputEnded:Disconnect();
    end;
    v38._connections.inputEnded = l_UserInputService_0.InputEnded:Connect(function(v40, v41) --[[ Line: 119 ]]
        -- upvalues: v24 (ref), v38 (copy)
        if if v41 then v40.UserInputType == Enum.UserInputType.MouseButton1 else v40.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v42 = v24(v38, v40, v41);
            if not v42 then
                return;
            else
                v42.inputEndedCallback(v38, v40, v41);
                return;
            end;
        end;
    end);
end;
local function _(v44) --[[ Line: 134 ]] --[[ Name: _ ]]
    local l__connections_4 = v44._connections;
    if l__connections_4.inputChanged then
        l__connections_4.inputChanged:Disconnect();
    end;
end;
local function _(v47) --[[ Line: 140 ]] --[[ Name: _ ]]
    -- upvalues: l_UserInputService_0 (copy), v24 (copy)
    local l__connections_5 = v47._connections;
    if l__connections_5.inputChanged then
        l__connections_5.inputChanged:Disconnect();
    end;
    v47._connections.inputChanged = l_UserInputService_0.InputChanged:Connect(function(v49, v50) --[[ Line: 146 ]]
        -- upvalues: v24 (ref), v47 (copy)
        if if v50 then v49.UserInputType == Enum.UserInputType.MouseButton1 else v49.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v51 = v24(v47, v49, v50);
            if not v51 then
                return;
            else
                v51.inputChangedCallback(v47, v49, v50);
                return;
            end;
        end;
    end);
end;
local function _(v53) --[[ Line: 161 ]] --[[ Name: _ ]]
    return v53._handlers[1];
end;
v5.onCarEntered = function(v55, v56) --[[ Line: 164 ]]
    v55._car = v56;
    local v57 = v55._handlers[1];
    if v57 and v57.onCarEntered then
        v57.onCarEntered(v55);
    end;
end;
v5.onCarExited = function(v58) --[[ Line: 171 ]]
    local l__car_0 = v58._car;
    if l__car_0 and l__car_0.initialized then
        local l_initialized_0 = l__car_0.initialized;
        l_initialized_0.throttle = 0;
        l_initialized_0.steer = 0;
    end;
    v58._car = nil;
    local v61 = v58._handlers[1];
    if v61 and v61.onCarExited then
        v61.onCarExited(v58);
    end;
end;
v5.createInputState = function() --[[ Line: 184 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_UserInputService_0 (copy), v24 (copy)
    local v62 = {
        inputBegan = nil, 
        inputEnded = nil, 
        inputChanged = nil
    };
    local v63 = {
        _throttle = 0, 
        _steer = 0, 
        _isHandbrakeEngaged = false, 
        _connections = v62, 
        _handlers = {
            v3, 
            v2, 
            v4
        }, 
        _shouldDisconnectWhenPossible = false
    };
    local l__connections_6 = v63._connections;
    if l__connections_6.inputBegan then
        l__connections_6.inputBegan:Disconnect();
    end;
    v63._connections.inputBegan = l_UserInputService_0.InputBegan:Connect(function(v65, v66) --[[ Line: 207 ]]
        -- upvalues: v63 (copy), v24 (ref)
        if if v66 then v65.UserInputType == Enum.UserInputType.MouseButton1 else v65.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        elseif v65.UserInputType == Enum.UserInputType.Focus then
            local l_v63_0 = v63;
            l_v63_0._throttle = 0;
            l_v63_0._steer = 0;
            l_v63_0._isHandbrakeEngaged = false;
            return;
        else
            local v68 = v24(v63, v65, v66);
            if not v68 then
                return;
            else
                v68.inputBeganCallback(v63, v65, v66);
                return;
            end;
        end;
    end);
    l__connections_6 = v63._connections;
    if l__connections_6.inputEnded then
        l__connections_6.inputEnded:Disconnect();
    end;
    v63._connections.inputEnded = l_UserInputService_0.InputEnded:Connect(function(v69, v70) --[[ Line: 231 ]]
        -- upvalues: v24 (ref), v63 (copy)
        if if v70 then v69.UserInputType == Enum.UserInputType.MouseButton1 else v69.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v71 = v24(v63, v69, v70);
            if not v71 then
                return;
            else
                v71.inputEndedCallback(v63, v69, v70);
                return;
            end;
        end;
    end);
    l__connections_6 = v63._connections;
    if l__connections_6.inputChanged then
        l__connections_6.inputChanged:Disconnect();
    end;
    v63._connections.inputChanged = l_UserInputService_0.InputChanged:Connect(function(v72, v73) --[[ Line: 249 ]]
        -- upvalues: v24 (ref), v63 (copy)
        if if v73 then v72.UserInputType == Enum.UserInputType.MouseButton1 else v72.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v74 = v24(v63, v72, v73);
            if not v74 then
                return;
            else
                v74.inputChangedCallback(v63, v72, v73);
                return;
            end;
        end;
    end);
    l__connections_6 = v63._handlers[1];
    if l__connections_6.new then
        v63._handlerData = l__connections_6.new(v63);
        return v63;
    else
        v63._handlerData = nil;
        return v63;
    end;
end;
table.freeze(v5);
return v5;