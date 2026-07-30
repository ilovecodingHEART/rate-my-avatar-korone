-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Types);
local v1 = {};
local v2 = require(script.Internal)(v1);
v1.Disabled = false;
v1.Args = {};
v1.Events = {};
v1.Init = function(v3, v4, v5) --[[ Line: 73 ]] --[[ Name: Init ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(v2._shutdown == false, "Iris.Init() cannot be called once shutdown.");
    local v6 = true;
    if v2._started ~= false then
        v6 = v5 == true;
    end;
    assert(v6, "Iris.Init() can only be called once.");
    if v2._started then
        return v1;
    else
        if v3 == nil then
            v3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
        end;
        if v4 == nil then
            v4 = game:GetService("RunService").Heartbeat;
        end;
        v2.parentInstance = v3;
        v2._started = true;
        v2._generateRootInstance();
        v2._generateSelectionImageObject();
        for _, v8 in v2._initFunctions do
            v8();
        end;
        task.spawn(function() --[[ Line: 100 ]]
            -- upvalues: v4 (ref), v2 (ref)
            if typeof(v4) == "function" then
                while v2._started do
                    local v9 = v4();
                    v2._cycle(v9);
                end;
            elseif v4 ~= nil and v4 ~= false then
                v2._eventConnection = v4:Connect(function(...) --[[ Line: 107 ]]
                    -- upvalues: v2 (ref)
                    v2._cycle(...);
                end);
            end;
        end);
        return v1;
    end;
end;
v1.Shutdown = function() --[[ Line: 122 ]] --[[ Name: Shutdown ]]
    -- upvalues: v2 (copy)
    v2._started = false;
    v2._shutdown = true;
    if v2._eventConnection then
        v2._eventConnection:Disconnect();
    end;
    v2._eventConnection = nil;
    if v2._rootWidget then
        if v2._rootWidget.Instance then
            v2._widgets.Root.Discard(v2._rootWidget);
        end;
        v2._rootInstance = nil;
    end;
    if v2.SelectionImageObject then
        v2.SelectionImageObject:Destroy();
    end;
    for _, v11 in v2._connections do
        v11:Disconnect();
    end;
end;
v1.Connect = function(_, v13) --[[ Line: 159 ]] --[[ Name: Connect ]]
    -- upvalues: v2 (copy)
    if v2._started == false then
        warn("Iris:Connect() was called before calling Iris.Init(); always initialise Iris first.");
    end;
    local v14 = #v2._connectedFunctions + 1;
    v2._connectedFunctions[v14] = v13;
    return function() --[[ Line: 165 ]]
        -- upvalues: v2 (ref), v14 (copy)
        v2._connectedFunctions[v14] = nil;
    end;
end;
v1.Append = function(v15) --[[ Line: 180 ]] --[[ Name: Append ]]
    -- upvalues: v2 (copy)
    local v16 = v2._GetParentWidget();
    local _ = nil;
    v15.Parent = if v2._config.Parent then v2._config.Parent else v2._widgets[v16.type].ChildAdded(v16, {
        type = "userInstance"
    });
end;
v1.End = function() --[[ Line: 218 ]] --[[ Name: End ]]
    -- upvalues: v2 (copy)
    if v2._stackIndex == 1 then
        error("Too many calls to Iris.End().", 2);
    end;
    v2._IDStack[v2._stackIndex] = nil;
    local l_v2_0 = v2;
    l_v2_0._stackIndex = l_v2_0._stackIndex - 1;
end;
v1.ForceRefresh = function() --[[ Line: 243 ]] --[[ Name: ForceRefresh ]]
    -- upvalues: v2 (copy)
    v2._globalRefreshRequested = true;
end;
v1.UpdateGlobalConfig = function(v19) --[[ Line: 265 ]] --[[ Name: UpdateGlobalConfig ]]
    -- upvalues: v2 (copy), v1 (copy)
    for v20, v21 in v19 do
        v2._rootConfig[v20] = v21;
    end;
    v1.ForceRefresh();
end;
v1.PushConfig = function(v22) --[[ Line: 290 ]] --[[ Name: PushConfig ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v23 = v1.State(-1);
    if v23.value == -1 then
        v23:set(v22);
    elseif v2._deepCompare(v23:get(), v22) == false then
        v23:set(v22);
        v2._refreshStack[v2._refreshLevel] = true;
        local l_v2_1 = v2;
        l_v2_1._refreshCounter = l_v2_1._refreshCounter + 1;
    end;
    local l_v2_2 = v2;
    l_v2_2._refreshLevel = l_v2_2._refreshLevel + 1;
    v2._config = setmetatable(v22, {
        __index = v2._config
    });
end;
v1.PopConfig = function() --[[ Line: 318 ]] --[[ Name: PopConfig ]]
    -- upvalues: v2 (copy)
    local l_v2_3 = v2;
    l_v2_3._refreshLevel = l_v2_3._refreshLevel - 1;
    if v2._refreshStack[v2._refreshLevel] == true then
        l_v2_3 = v2;
        l_v2_3._refreshCounter = l_v2_3._refreshCounter - 1;
        v2._refreshStack[v2._refreshLevel] = nil;
    end;
    v2._config = getmetatable(v2._config).__index;
end;
v1.TemplateConfig = require(script.config);
v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
v1.UpdateGlobalConfig(v1.TemplateConfig.utilityDefault);
v2._globalRefreshRequested = false;
v1.PushId = function(v27) --[[ Line: 354 ]] --[[ Name: PushId ]]
    -- upvalues: v2 (copy)
    assert(typeof(v27) == "string", "The ID argument to Iris.PushId() to be a string.");
    v2._newID = true;
    table.insert(v2._pushedIds, v27);
end;
v1.PopId = function() --[[ Line: 367 ]] --[[ Name: PopId ]]
    -- upvalues: v2 (copy)
    if #v2._pushedIds == 0 then
        return;
    else
        table.remove(v2._pushedIds);
        return;
    end;
end;
v1.SetNextWidgetID = function(v28) --[[ Line: 397 ]] --[[ Name: SetNextWidgetID ]]
    -- upvalues: v2 (copy)
    v2._nextWidgetId = v28;
end;
v1.State = function(v29) --[[ Line: 439 ]] --[[ Name: State ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v30 = v2._getID(2);
    if v2._states[v30] then
        return v2._states[v30];
    else
        v2._states[v30] = {
            ID = v30, 
            value = v29, 
            lastChangeTick = v1.Internal._cycleTick, 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        setmetatable(v2._states[v30], v2.StateClass);
        return v2._states[v30];
    end;
end;
v1.WeakState = function(v31) --[[ Line: 464 ]] --[[ Name: WeakState ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v32 = v2._getID(2);
    if v2._states[v32] then
        if next(v2._states[v32].ConnectedWidgets) == nil then
            v2._states[v32] = nil;
        else
            return v2._states[v32];
        end;
    end;
    v2._states[v32] = {
        ID = v32, 
        value = v31, 
        lastChangeTick = v1.Internal._cycleTick, 
        ConnectedWidgets = {}, 
        ConnectedFunctions = {}
    };
    setmetatable(v2._states[v32], v2.StateClass);
    return v2._states[v32];
end;
v1.VariableState = function(v33, v34) --[[ Line: 522 ]] --[[ Name: VariableState ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v35 = v2._getID(2);
    local v36 = v2._states[v35];
    if v36 then
        if v33 ~= v36.value then
            v36:set(v33);
        end;
        return v36;
    else
        local v37 = {
            ID = v35, 
            value = v33, 
            lastChangeTick = v1.Internal._cycleTick, 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        setmetatable(v37, v2.StateClass);
        v2._states[v35] = v37;
        v37:onChange(v34);
        return v37;
    end;
end;
v1.TableState = function(v38, v39, v40) --[[ Line: 602 ]] --[[ Name: TableState ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v41 = v38[v39];
    local v42 = v2._getID(2);
    local v43 = v2._states[v42];
    if v43 then
        if v41 ~= v43.value then
            v43:set(v41);
        end;
        return v43;
    else
        local v44 = {
            ID = v42, 
            value = v41, 
            lastChangeTick = v1.Internal._cycleTick, 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        setmetatable(v44, v2.StateClass);
        v2._states[v42] = v44;
        v44:onChange(function() --[[ Line: 626 ]]
            -- upvalues: v40 (copy), v44 (copy), v38 (copy), v39 (copy)
            if v40 ~= nil then
                if v40(v44.value) then
                    v38[v39] = v44.value;
                    return;
                end;
            else
                v38[v39] = v44.value;
            end;
        end);
        return v44;
    end;
end;
v1.ComputedState = function(v45, v46) --[[ Line: 655 ]] --[[ Name: ComputedState ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v47 = v2._getID(2);
    if v2._states[v47] then
        return v2._states[v47];
    else
        v2._states[v47] = {
            ID = v47, 
            value = v46(v45.value), 
            lastChangeTick = v1.Internal._cycleTick, 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        v45:onChange(function(v48) --[[ Line: 668 ]]
            -- upvalues: v2 (ref), v47 (copy), v46 (copy)
            v2._states[v47]:set(v46(v48));
        end);
        setmetatable(v2._states[v47], v2.StateClass);
        return v2._states[v47];
    end;
end;
v1.ShowDemoWindow = require(script.demoWindow)(v1);
require(script.widgets)(v2);
require(script.API)(v1);
return v1;