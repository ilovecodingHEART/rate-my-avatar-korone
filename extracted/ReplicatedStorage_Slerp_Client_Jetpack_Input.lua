-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(script.Shared);
local _ = require(script.Parent.Types);
local v3 = require(script.Keyboard);
local v4 = require(script.Gamepad);
local v5 = require(script.Touch);
local v6 = {};
local function _(v7, v8) --[[ Line: 17 ]] --[[ Name: isInputIgnored ]]
    if v8 then

    end;
    if v7.UserInputType == Enum.UserInputType.MouseButton1 then
        return true;
    else
        return false;
    end;
end;
local function _(v10) --[[ Line: 27 ]] --[[ Name: destroyConnections ]]
    if v10.inputBegan then
        v10.inputBegan:Disconnect();
    end;
    if v10.inputEnded then
        v10.inputEnded:Disconnect();
    end;
    if v10.inputChanged then
        v10.inputChanged:Disconnect();
    end;
end;
local function _(v12) --[[ Line: 39 ]] --[[ Name: resetInputState ]]
    v12._throttle = 0;
    v12._tiltW = 1;
    v12._tiltV = Vector3.zero;
end;
local function _(v14, v15) --[[ Line: 45 ]] --[[ Name: onHandlerUpdate ]]
    if v15 and v15.destroy then
        v15.destroy(v14._handlerData);
    end;
    local v16 = v14._handlers[1];
    if v16.new then
        v14._handlerData = v16.new(v14);
        return;
    else
        v14._handlerData = nil;
        return;
    end;
end;
local function v25(v18, v19, v20) --[[ Line: 57 ]] --[[ Name: getHandler ]]
    for v21, v22 in v18._handlers do
        if v22.is(v19, v20) then
            if v21 ~= 1 then
                local v23 = v18._handlers[1];
                v18._handlers[1] = v22;
                v18._handlers[v21] = v23;
                v18._throttle = 0;
                v18._tiltW = 1;
                v18._tiltV = Vector3.zero;
                if v23 and v23.destroy then
                    v23.destroy(v18._handlerData);
                end;
                local v24 = v18._handlers[1];
                if v24.new then
                    v18._handlerData = v24.new(v18);
                    return v22;
                else
                    v18._handlerData = nil;
                end;
            end;
            return v22;
        end;
    end;
    return nil;
end;
local function _(v26) --[[ Line: 77 ]] --[[ Name: disconnectInputBeganConnection ]]
    local l__connections_0 = v26._connections;
    if l__connections_0.inputBegan then
        l__connections_0.inputBegan:Disconnect();
    end;
end;
local function _(v29) --[[ Line: 84 ]] --[[ Name: setInputBeganConnection ]]
    local l__connections_1 = v29._connections;
    if l__connections_1.inputBegan then
        l__connections_1.inputBegan:Disconnect();
    end;
    v29._connections.inputBegan = l_UserInputService_0.InputBegan:Connect(function(v31, v32) --[[ Line: 86 ]]
        if if v32 then v31.UserInputType == Enum.UserInputType.MouseButton1 else v31.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        elseif v31.UserInputType == Enum.UserInputType.Focus then
            local l_v29_0 = v29;
            l_v29_0._throttle = 0;
            l_v29_0._tiltW = 1;
            l_v29_0._tiltV = Vector3.zero;
            return;
        else
            local v34 = v25(v29, v31, v32);
            if not v34 then
                return;
            else
                v34.inputBeganCallback(v29, v31, v32);
                return;
            end;
        end;
    end);
end;
local function _(v36) --[[ Line: 102 ]] --[[ Name: disconnectInputEndedConnection ]]
    local l__connections_2 = v36._connections;
    if l__connections_2.inputEnded then
        l__connections_2.inputEnded:Disconnect();
    end;
end;
local function _(v39) --[[ Line: 109 ]] --[[ Name: setInputEndedConnection ]]
    local l__connections_3 = v39._connections;
    if l__connections_3.inputEnded then
        l__connections_3.inputEnded:Disconnect();
    end;
    v39._connections.inputEnded = l_UserInputService_0.InputEnded:Connect(function(v41, v42) --[[ Line: 111 ]]
        if if v42 then v41.UserInputType == Enum.UserInputType.MouseButton1 else v41.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v43 = v25(v39, v41, v42);
            if not v43 then
                return;
            else
                v43.inputEndedCallback(v39, v41, v42);
                return;
            end;
        end;
    end);
end;
local function _(v45) --[[ Line: 123 ]] --[[ Name: disconnectInputChangedConnection ]]
    local l__connections_4 = v45._connections;
    if l__connections_4.inputChanged then
        l__connections_4.inputChanged:Disconnect();
    end;
end;
local function _(v48) --[[ Line: 130 ]] --[[ Name: setInputChangedConnection ]]
    local l__connections_5 = v48._connections;
    if l__connections_5.inputChanged then
        l__connections_5.inputChanged:Disconnect();
    end;
    v48._connections.inputChanged = l_UserInputService_0.InputChanged:Connect(function(v50, v51) --[[ Line: 132 ]]
        if if v51 then v50.UserInputType == Enum.UserInputType.MouseButton1 else v50.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v52 = v25(v48, v50, v51);
            if not v52 then
                return;
            else
                v52.inputChangedCallback(v48, v50, v51);
                return;
            end;
        end;
    end);
end;
local function _(v54) --[[ Line: 145 ]] --[[ Name: getCurrentHandler ]]
    return v54._handlers[1];
end;
v6.onJetpackEquipped = function(v56, v57) --[[ Line: 149 ]] --[[ Name: onJetpackEquipped ]]
    v56._jetpack = v57;
    local v58 = v56._handlers[1];
    if v58 and v58.onJetpackEquipped then
        v58.onJetpackEquipped(v56);
    end;
end;
v6.onJetpackUnequipped = function(v59) --[[ Line: 157 ]] --[[ Name: onJetpackUnequipped ]]
    v59._jetpack = nil;
    local v60 = v59._handlers[1];
    if v60 and v60.onJetpackUnequipped then
        v60.onJetpackUnequipped(v59);
    end;
end;
v6.createInputState = function() --[[ Line: 165 ]] --[[ Name: createInputState ]]
    local v61 = {
        inputBegan = nil, 
        inputEnded = nil, 
        inputChanged = nil
    };
    local v62 = {
        _throttle = 0, 
        _tiltW = 1, 
        _tiltV = Vector3.zero, 
        _handlers = {
            v3, 
            v4, 
            v5
        }, 
        _connections = v61, 
        _jetpack = nil
    };
    local l__connections_6 = v62._connections;
    if l__connections_6.inputBegan then
        l__connections_6.inputBegan:Disconnect();
    end;
    v62._connections.inputBegan = l_UserInputService_0.InputBegan:Connect(function(v64, v65) --[[ Line: 86 ]]
        if if v65 then v64.UserInputType == Enum.UserInputType.MouseButton1 else v64.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        elseif v64.UserInputType == Enum.UserInputType.Focus then
            local l_v62_0 = v62;
            l_v62_0._throttle = 0;
            l_v62_0._tiltW = 1;
            l_v62_0._tiltV = Vector3.zero;
            return;
        else
            local v67 = v25(v62, v64, v65);
            if not v67 then
                return;
            else
                v67.inputBeganCallback(v62, v64, v65);
                return;
            end;
        end;
    end);
    l__connections_6 = v62._connections;
    if l__connections_6.inputEnded then
        l__connections_6.inputEnded:Disconnect();
    end;
    v62._connections.inputEnded = l_UserInputService_0.InputEnded:Connect(function(v68, v69) --[[ Line: 111 ]]
        if if v69 then v68.UserInputType == Enum.UserInputType.MouseButton1 else v68.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v70 = v25(v62, v68, v69);
            if not v70 then
                return;
            else
                v70.inputEndedCallback(v62, v68, v69);
                return;
            end;
        end;
    end);
    l__connections_6 = v62._connections;
    if l__connections_6.inputChanged then
        l__connections_6.inputChanged:Disconnect();
    end;
    v62._connections.inputChanged = l_UserInputService_0.InputChanged:Connect(function(v71, v72) --[[ Line: 132 ]]
        if if v72 then v71.UserInputType == Enum.UserInputType.MouseButton1 else v71.UserInputType == Enum.UserInputType.MouseButton1 then
            return;
        else
            local v73 = v25(v62, v71, v72);
            if not v73 then
                return;
            else
                v73.inputChangedCallback(v62, v71, v72);
                return;
            end;
        end;
    end);
    l__connections_6 = v62._handlers[1];
    if l__connections_6.new then
        v62._handlerData = l__connections_6.new(v62);
        return v62;
    else
        v62._handlerData = nil;
        return v62;
    end;
end;
table.freeze(v6);
return v6;