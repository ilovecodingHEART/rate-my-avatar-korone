-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script.Parent.Types);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v3 = {
        _version = " 2.5.0 ", 
        _started = false, 
        _shutdown = false, 
        _cycleTick = 0, 
        _deltaTime = 0, 
        _globalRefreshRequested = false, 
        _refreshCounter = 0, 
        _refreshLevel = 1, 
        _refreshStack = table.create(16), 
        _widgets = {}, 
        _stackIndex = 1, 
        _rootInstance = nil
    };
    v3._rootWidget = {
        ID = "R", 
        type = "Root", 
        Instance = v3._rootInstance, 
        ZIndex = 0, 
        ZOffset = 0
    };
    v3._lastWidget = v3._rootWidget;
    v3._rootConfig = {};
    v3._config = v3._rootConfig;
    v3._IDStack = {
        "R"
    };
    v3._usedIDs = {};
    v3._pushedIds = {};
    v3._newID = false;
    v3._nextWidgetId = nil;
    v3._states = {};
    v3._postCycleCallbacks = {};
    v3._connectedFunctions = {};
    v3._connections = {};
    v3._initFunctions = {};
    v3._fullErrorTracebacks = game:GetService("RunService"):IsStudio();
    v3._cycleCoroutine = coroutine.create(function() --[[ Line: 75 ]]
        -- upvalues: v3 (copy)
        while v3._started do
            for _, v5 in v3._connectedFunctions do
                debug.profilebegin("Iris/Connection");
                local l_status_0, l_result_0 = pcall(v5);
                debug.profileend();
                if not l_status_0 then
                    v3._stackIndex = 1;
                    coroutine.yield(false, l_result_0);
                end;
            end;
            coroutine.yield(true);
        end;
    end);
    local v8 = {};
    v8.__index = v8;
    v8.get = function(v9) --[[ Line: 133 ]] --[[ Name: get ]]
        return v9.value;
    end;
    v8.set = function(v10, v11, v12) --[[ Line: 146 ]] --[[ Name: set ]]
        -- upvalues: v2 (copy), v3 (copy)
        if v11 == v10.value and v12 ~= true then
            return v10.value;
        else
            v10.value = v11;
            v10.lastChangeTick = v2.Internal._cycleTick;
            for _, v14 in v10.ConnectedWidgets do
                if v14.lastCycleTick ~= -1 then
                    v3._widgets[v14.type].UpdateState(v14);
                end;
            end;
            for _, v16 in v10.ConnectedFunctions do
                v16(v11);
            end;
            return v10.value;
        end;
    end;
    v8.onChange = function(v17, v18) --[[ Line: 178 ]] --[[ Name: onChange ]]
        local v19 = #v17.ConnectedFunctions + 1;
        v17.ConnectedFunctions[v19] = v18;
        return function() --[[ Line: 181 ]]
            -- upvalues: v17 (copy), v19 (copy)
            v17.ConnectedFunctions[v19] = nil;
        end;
    end;
    v8.changed = function(v20) --[[ Line: 193 ]] --[[ Name: changed ]]
        -- upvalues: v3 (copy)
        return v20.lastChangeTick + 1 == v3._cycleTick;
    end;
    v3.StateClass = v8;
    v3._cycle = function(v21) --[[ Line: 211 ]] --[[ Name: _cycle ]]
        -- upvalues: v2 (copy), v3 (copy)
        if v2.Disabled then
            return;
        else
            v3._rootWidget.lastCycleTick = v3._cycleTick;
            if v3._rootInstance == nil or v3._rootInstance.Parent == nil then
                v2.ForceRefresh();
            end;
            for _, v23 in v3._lastVDOM do
                if v23.lastCycleTick ~= v3._cycleTick and v23.lastCycleTick ~= -1 then
                    v3._DiscardWidget(v23);
                end;
            end;
            setmetatable(v3._lastVDOM, {
                __mode = "kv"
            });
            v3._lastVDOM = v3._VDOM;
            v3._VDOM = v3._generateEmptyVDOM();
            task.spawn(function() --[[ Line: 237 ]]
                -- upvalues: v3 (ref)
                for _, v25 in v3._postCycleCallbacks do
                    v25();
                end;
            end);
            if v3._globalRefreshRequested then
                v3._generateSelectionImageObject();
                v3._globalRefreshRequested = false;
                for _, v27 in v3._lastVDOM do
                    v3._DiscardWidget(v27);
                end;
                v3._generateRootInstance();
                v3._lastVDOM = v3._generateEmptyVDOM();
            end;
            local l_v3_0 = v3;
            l_v3_0._cycleTick = l_v3_0._cycleTick + 1;
            v3._deltaTime = v21;
            table.clear(v3._usedIDs);
            if (v3.parentInstance:IsA("GuiBase2d") or v3.parentInstance:IsA("CoreGui") or v3.parentInstance:IsA("PluginGui") or v3.parentInstance:IsA("PlayerGui")) == false then
                error("The Iris parent instance will not display any GUIs.");
            end;
            if v3._fullErrorTracebacks then
                for _, v30 in v3._connectedFunctions do
                    v30();
                end;
            else
                local v31 = coroutine.status(v3._cycleCoroutine);
                if v31 == "suspended" then
                    local _, v33, v34 = coroutine.resume(v3._cycleCoroutine);
                    if v33 == false then
                        error(v34, 0);
                    end;
                elseif v31 == "running" then
                    error("Iris cycleCoroutine took to long to yield. Connected functions should not yield.");
                else
                    error("unrecoverable state");
                end;
            end;
            if v3._stackIndex ~= 1 then
                v3._stackIndex = 1;
                error("Too few calls to Iris.End().", 0);
            end;
            if #v3._pushedIds ~= 0 then
                error("Too few calls to Iris.PopId().", 0);
            end;
            return;
        end;
    end;
    v3._NoOp = function() --[[ Line: 324 ]] --[[ Name: _NoOp ]]

    end;
    v3.WidgetConstructor = function(v35, v36) --[[ Line: 338 ]] --[[ Name: WidgetConstructor ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v37 = {
            All = {
                Required = {
                    "Generate", 
                    "Discard", 
                    "Update", 
                    "Args", 
                    "Events", 
                    "hasChildren", 
                    "hasState"
                }, 
                Optional = {}
            }, 
            IfState = {
                Required = {
                    "GenerateState", 
                    "UpdateState"
                }, 
                Optional = {}
            }, 
            IfChildren = {
                Required = {
                    "ChildAdded"
                }, 
                Optional = {
                    "ChildDiscarded"
                }
            }
        };
        local v38 = {};
        for _, v40 in v37.All.Required do
            assert(v36[v40] ~= nil, (("field %* is missing from widget %*, it is required for all widgets"):format(v40, v35)));
            v38[v40] = v36[v40];
        end;
        for _, v42 in v37.All.Optional do
            if v36[v42] == nil then
                v38[v42] = v3._NoOp;
            else
                v38[v42] = v36[v42];
            end;
        end;
        if v36.hasState then
            for _, v44 in v37.IfState.Required do
                assert(v36[v44] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with state"):format(v44, v35)));
                v38[v44] = v36[v44];
            end;
            for _, v46 in v37.IfState.Optional do
                if v36[v46] == nil then
                    v38[v46] = v3._NoOp;
                else
                    v38[v46] = v36[v46];
                end;
            end;
        end;
        if v36.hasChildren then
            for _, v48 in v37.IfChildren.Required do
                assert(v36[v48] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with children"):format(v48, v35)));
                v38[v48] = v36[v48];
            end;
            for _, v50 in v37.IfChildren.Optional do
                if v36[v50] == nil then
                    v38[v50] = v3._NoOp;
                else
                    v38[v50] = v36[v50];
                end;
            end;
        end;
        v3._widgets[v35] = v38;
        v2.Args[v35] = v38.Args;
        local v51 = {};
        for v52, v53 in v38.Args do
            v51[v53] = v52;
        end;
        v38.ArgNames = v51;
        for v54, _ in v38.Events do
            if v2.Events[v54] == nil then
                v2.Events[v54] = function() --[[ Line: 429 ]]
                    -- upvalues: v3 (ref), v54 (copy)
                    return v3._EventCall(v3._lastWidget, v54);
                end;
            end;
        end;
    end;
    v3._Insert = function(v56, v57, v58) --[[ Line: 447 ]] --[[ Name: _Insert ]]
        -- upvalues: v3 (copy)
        local v59 = v3._getID(3);
        local v60 = v3._widgets[v56];
        if v3._VDOM[v59] then
            return v3._ContinueWidget(v59, v56);
        else
            local v61 = {};
            if v57 ~= nil then
                if type(v57) ~= "table" then
                    v57 = {
                        v57
                    };
                end;
                for v62, v63 in v57 do
                    assert(v62 > 0, (("Widget Arguments must be a positive number, not %* of type %* for %*."):format(v62, typeof(v62), v63)));
                    v61[v60.ArgNames[v62]] = v63;
                end;
            end;
            table.freeze(v61);
            local v64 = v3._lastVDOM[v59];
            if v64 and v56 == v64.type and v3._refreshCounter > 0 then
                v3._DiscardWidget(v64);
                v64 = nil;
            end;
            local v65 = if v64 == nil then v3._GenNewWidget(v56, v61, v58, v59) else v64;
            local l_parentWidget_0 = v65.parentWidget;
            if v65.type ~= "Window" and v65.type ~= "Tooltip" then
                if v65.ZIndex ~= l_parentWidget_0.ZOffset then
                    l_parentWidget_0.ZUpdate = true;
                end;
                if l_parentWidget_0.ZUpdate then
                    v65.ZIndex = l_parentWidget_0.ZOffset;
                    if v65.Instance then
                        v65.Instance.ZIndex = v65.ZIndex;
                        v65.Instance.LayoutOrder = v65.ZIndex;
                    end;
                end;
            end;
            if l_parentWidget_0.type == "Table" then
                l_parentWidget_0._rowCycles[l_parentWidget_0._rowIndex] = v3._cycleTick;
            end;
            if v3._deepCompare(v65.providedArguments, v61) == false then
                v65.arguments = v3._deepCopy(v61);
                v65.providedArguments = v61;
                v60.Update(v65);
            end;
            v65.lastCycleTick = v3._cycleTick;
            l_parentWidget_0.ZOffset = l_parentWidget_0.ZOffset + 1;
            if v60.hasChildren then
                v65.ZOffset = 0;
                v65.ZUpdate = false;
                local l_v3_1 = v3;
                l_v3_1._stackIndex = l_v3_1._stackIndex + 1;
                v3._IDStack[v3._stackIndex] = v65.ID;
            end;
            v3._VDOM[v59] = v65;
            v3._lastWidget = v65;
            return v65;
        end;
    end;
    v3._GenNewWidget = function(v68, v69, v70, v71) --[[ Line: 548 ]] --[[ Name: _GenNewWidget ]]
        -- upvalues: v3 (copy), l_HttpService_0 (ref)
        local v72 = v3._IDStack[v3._stackIndex];
        local v73 = v3._VDOM[v72];
        local v74 = v3._widgets[v68];
        local v75 = {};
        setmetatable(v75, v75);
        v75.ID = v71;
        v75.type = v68;
        v75.parentWidget = v73;
        v75.trackedEvents = {};
        v75.UID = l_HttpService_0:GenerateGUID(false):sub(0, 8);
        v75.ZIndex = v73.ZOffset;
        v75.Instance = v74.Generate(v75);
        v73 = v75.parentWidget;
        if v3._config.Parent then
            v75.Instance.Parent = v3._config.Parent;
        else
            v75.Instance.Parent = v3._widgets[v73.type].ChildAdded(v73, v75);
        end;
        v75.providedArguments = v69;
        v75.arguments = v3._deepCopy(v69);
        v74.Update(v75);
        local v76 = nil;
        if v74.hasState then
            if v70 then
                for v77, v78 in v70 do
                    if type(v78) ~= "table" or getmetatable(v78) ~= v3.StateClass then
                        v70[v77] = v3._widgetState(v75, v77, v78);
                    end;
                    v70[v77].lastChangeTick = v3._cycleTick;
                end;
                v75.state = v70;
                for _, v80 in v70 do
                    v80.ConnectedWidgets[v75.ID] = v75;
                end;
            else
                v75.state = {};
            end;
            v74.GenerateState(v75);
            v74.UpdateState(v75);
            v75.stateMT = {};
            setmetatable(v75.state, v75.stateMT);
            v75.__index = v75.state;
            v76 = v75.stateMT;
        else
            v76 = v75;
        end;
        v76.__index = function(_, v82) --[[ Line: 614 ]]
            -- upvalues: v3 (ref), v75 (copy)
            return function() --[[ Line: 615 ]]
                -- upvalues: v3 (ref), v75 (ref), v82 (copy)
                return v3._EventCall(v75, v82);
            end;
        end;
        return v75;
    end;
    v3._ContinueWidget = function(v83, v84) --[[ Line: 633 ]] --[[ Name: _ContinueWidget ]]
        -- upvalues: v3 (copy)
        local v85 = v3._widgets[v84];
        local v86 = v3._VDOM[v83];
        if v85.hasChildren then
            local l_v3_2 = v3;
            l_v3_2._stackIndex = l_v3_2._stackIndex + 1;
            v3._IDStack[v3._stackIndex] = v86.ID;
        end;
        v3._lastWidget = v86;
        return v86;
    end;
    v3._DiscardWidget = function(v88) --[[ Line: 656 ]] --[[ Name: _DiscardWidget ]]
        -- upvalues: v3 (copy)
        local l_parentWidget_1 = v88.parentWidget;
        if l_parentWidget_1 then
            v3._widgets[l_parentWidget_1.type].ChildDiscarded(l_parentWidget_1, v88);
        end;
        v3._widgets[v88.type].Discard(v88);
        v88.lastCycleTick = -1;
    end;
    v3._widgetState = function(v90, v91, v92) --[[ Line: 681 ]] --[[ Name: _widgetState ]]
        -- upvalues: v3 (copy)
        local v93 = v90.ID .. v91;
        if v3._states[v93] then
            v3._states[v93].ConnectedWidgets[v90.ID] = v90;
            v3._states[v93].lastChangeTick = v3._cycleTick;
            return v3._states[v93];
        else
            v3._states[v93] = {
                ID = v93, 
                value = v92, 
                lastChangeTick = v3._cycleTick, 
                ConnectedWidgets = {
                    [v90.ID] = v90
                }, 
                ConnectedFunctions = {}
            };
            setmetatable(v3._states[v93], v3.StateClass);
            return v3._states[v93];
        end;
    end;
    v3._EventCall = function(v94, v95) --[[ Line: 710 ]] --[[ Name: _EventCall ]]
        -- upvalues: v3 (copy)
        local v96 = v3._widgets[v94.type].Events[v95];
        assert(v96 ~= nil, (("widget %* has no event of name %*"):format(v94.type, v95)));
        if v94.trackedEvents[v95] == nil then
            v96.Init(v94);
            v94.trackedEvents[v95] = true;
        end;
        return v96.Get(v94);
    end;
    v3._GetParentWidget = function() --[[ Line: 729 ]] --[[ Name: _GetParentWidget ]]
        -- upvalues: v3 (copy)
        return v3._VDOM[v3._IDStack[v3._stackIndex]];
    end;
    v3._generateEmptyVDOM = function() --[[ Line: 743 ]] --[[ Name: _generateEmptyVDOM ]]
        -- upvalues: v3 (copy)
        return {
            R = v3._rootWidget
        };
    end;
    v3._generateRootInstance = function() --[[ Line: 756 ]] --[[ Name: _generateRootInstance ]]
        -- upvalues: v3 (copy)
        v3._rootInstance = v3._widgets.Root.Generate(v3._widgets.Root);
        v3._rootInstance.Parent = v3.parentInstance;
        v3._rootWidget.Instance = v3._rootInstance;
    end;
    v3._generateSelectionImageObject = function() --[[ Line: 770 ]] --[[ Name: _generateSelectionImageObject ]]
        -- upvalues: v3 (copy)
        if v3.SelectionImageObject then
            v3.SelectionImageObject:Destroy();
        end;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Position = UDim2.fromOffset(-1, -1);
        l_Frame_0.Size = UDim2.new(1, 2, 1, 2);
        l_Frame_0.BackgroundColor3 = v3._config.SelectionImageObjectColor;
        l_Frame_0.BackgroundTransparency = v3._config.SelectionImageObjectTransparency;
        l_Frame_0.BorderSizePixel = 0;
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Thickness = 1;
        l_UIStroke_0.Color = v3._config.SelectionImageObjectBorderColor;
        l_UIStroke_0.Transparency = v3._config.SelectionImageObjectBorderTransparency;
        l_UIStroke_0.LineJoinMode = Enum.LineJoinMode.Round;
        l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        l_UIStroke_0.Parent = l_Frame_0;
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(0, 2);
        l_UICorner_0.Parent = l_Frame_0;
        v3.SelectionImageObject = l_Frame_0;
    end;
    v3._getID = function(v100) --[[ Line: 811 ]] --[[ Name: _getID ]]
        -- upvalues: v3 (copy)
        if v3._nextWidgetId then
            local l__nextWidgetId_0 = v3._nextWidgetId;
            v3._nextWidgetId = nil;
            return l__nextWidgetId_0;
        else
            local v102 = 1 + (v100 or 1);
            local v103 = "";
            local v104 = debug.info(v102, "l");
            while v104 ~= -1 and v104 ~= nil do
                v103 = v103 .. "+" .. v104;
                v102 = v102 + 1;
                v104 = debug.info(v102, "l");
            end;
            local v105 = v3._usedIDs[v103];
            if v105 then
                local l__usedIDs_0 = v3._usedIDs;
                l__usedIDs_0[v103] = l__usedIDs_0[v103] + 1;
                v105 = v105 + 1;
            else
                v3._usedIDs[v103] = 1;
                v105 = 1;
            end;
            if #v3._pushedIds == 0 then
                return v103 .. ":" .. v105;
            elseif v3._newID then
                v3._newID = false;
                return v103 .. "::" .. table.concat(v3._pushedIds, "\\");
            else
                return v103 .. ":" .. v105 .. ":" .. table.concat(v3._pushedIds, "\\");
            end;
        end;
    end;
    v3._deepCompare = function(v107, v108) --[[ Line: 858 ]] --[[ Name: _deepCompare ]]
        -- upvalues: v3 (copy)
        for v109, v110 in v107 do
            local v111 = v108[v109];
            if type(v110) == "table" then
                if v111 and type(v111) == "table" then
                    if v3._deepCompare(v110, v111) == false then
                        return false;
                    end;
                else
                    return false;
                end;
            elseif type(v110) ~= type(v111) or v110 ~= v111 then
                return false;
            end;
        end;
        return true;
    end;
    v3._deepCopy = function(v112) --[[ Line: 889 ]] --[[ Name: _deepCopy ]]
        -- upvalues: v3 (copy)
        local v113 = table.clone(v112);
        for v114, v115 in pairs(v112) do
            if type(v115) == "table" then
                v113[v114] = v3._deepCopy(v115);
            end;
        end;
        return v113;
    end;
    v3._lastVDOM = v3._generateEmptyVDOM();
    v3._VDOM = v3._generateEmptyVDOM();
    v2.Internal = v3;
    v2._config = v3._config;
    return v3;
end;