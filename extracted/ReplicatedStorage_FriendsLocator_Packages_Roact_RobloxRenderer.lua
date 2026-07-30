-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Binding);
local v1 = require(script.Parent.PropMarkers.Children);
local v2 = require(script.Parent.ElementKind);
local v3 = require(script.Parent.SingleEventManager);
local v4 = require(script.Parent.getDefaultInstanceProperty);
local v5 = require(script.Parent.PropMarkers.Ref);
local v6 = require(script.Parent.Type);
local v7 = require(script.Parent.internalAssert);
local v8 = require(script.Parent.GlobalConfig).get();
local function v9(...) --[[ Line: 32 ]] --[[ Name: identity ]]
    return ...;
end;
local function v12(v10, v11) --[[ Line: 36 ]] --[[ Name: applyRef ]]
    if v10 == nil then
        return;
    elseif typeof(v10) == "function" then
        v10(v11);
        return;
    elseif v6.of(v10) == v6.Binding then
        v0.update(v10, v11);
        return;
    else
        error(("Invalid ref: Expected type Binding but got %s"):format((typeof(v10))));
        return;
    end;
end;
local _ = function(v13, v14, v15) --[[ Line: 51 ]] --[[ Name: setRobloxInstanceProperty ]]
    if v15 == nil then
        local l_ClassName_0 = v13.ClassName;
        local _, v18 = v4(l_ClassName_0, v14);
        v15 = v18;
    end;
    v13[v14] = v15;
end;
local function _(v20, v21) --[[ Line: 64 ]] --[[ Name: removeBinding ]]
    v20.bindings[v21]();
    v20.bindings[v21] = nil;
end;
local function v38(v23, v24, v25) --[[ Line: 70 ]] --[[ Name: attachBinding ]]
    local function v37(v26) --[[ Line: 71 ]] --[[ Name: updateBoundProperty ]]
        local v33, v34 = xpcall(function() --[[ Line: 72 ]]
            local l_hostObject_0 = v23.hostObject;
            local l_v24_0 = v24;
            local l_v26_0 = v26;
            if l_v26_0 == nil then
                local l_ClassName_1 = l_hostObject_0.ClassName;
                local _, v32 = v4(l_ClassName_1, l_v24_0);
                l_v26_0 = v32;
            end;
            l_hostObject_0[l_v24_0] = l_v26_0;
        end, v9);
        if not v33 then
            local l_source_0 = v23.currentElement.source;
            if l_source_0 == nil then
                l_source_0 = "<enable element tracebacks>";
            end;
            local v36 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v34, l_source_0);
            error(v36, 0);
        end;
    end;
    if v23.bindings == nil then
        v23.bindings = {};
    end;
    v23.bindings[v24] = v0.subscribe(v25, v37);
    v37(v25:getValue());
end;
local _ = function(v39) --[[ Line: 97 ]] --[[ Name: detachAllBindings ]]
    if v39.bindings ~= nil then
        for _, v41 in pairs(v39.bindings) do
            v41();
        end;
    end;
end;
local function v55(v43, v44, v45, v46) --[[ Line: 105 ]] --[[ Name: applyProp ]]
    if v45 == v46 then
        return;
    elseif v44 == v5 or v44 == v1 then
        return;
    else
        local v47 = v6.of(v44);
        if v47 == v6.HostEvent or v47 == v6.HostChangeEvent then
            if v43.eventManager == nil then
                v43.eventManager = v3.new(v43.hostObject);
            end;
            local l_name_0 = v44.name;
            if v47 == v6.HostChangeEvent then
                v43.eventManager:connectPropertyChange(l_name_0, v45);
                return;
            else
                v43.eventManager:connectEvent(l_name_0, v45);
                return;
            end;
        else
            local v49 = v6.of(v45) == v6.Binding;
            if v6.of(v46) == v6.Binding then
                v43.bindings[v44]();
                v43.bindings[v44] = nil;
            end;
            if v49 then
                v38(v43, v44, v45);
                return;
            else
                local l_hostObject_1 = v43.hostObject;
                local l_v45_0 = v45;
                if l_v45_0 == nil then
                    local l_ClassName_2 = l_hostObject_1.ClassName;
                    local _, v54 = v4(l_ClassName_2, v44);
                    l_v45_0 = v54;
                end;
                l_hostObject_1[v44] = l_v45_0;
                return;
            end;
        end;
    end;
end;
local function v60(v56, v57) --[[ Line: 147 ]] --[[ Name: applyProps ]]
    for v58, v59 in pairs(v57) do
        v55(v56, v58, v59, nil);
    end;
end;
local function v69(v61, v62, v63) --[[ Line: 153 ]] --[[ Name: updateProps ]]
    for v64, v65 in pairs(v63) do
        local v66 = v62[v64];
        v55(v61, v64, v65, v66);
    end;
    for v67, v68 in pairs(v62) do
        if v63[v67] == nil then
            v55(v61, v67, nil, v68);
        end;
    end;
end;
return {
    isHostObject = function(v70) --[[ Line: 173 ]] --[[ Name: isHostObject ]]
        return typeof(v70) == "Instance";
    end, 
    mountHostNode = function(v71, v72) --[[ Line: 177 ]] --[[ Name: mountHostNode ]]
        local l_currentElement_0 = v72.currentElement;
        local l_hostParent_0 = v72.hostParent;
        local l_hostKey_0 = v72.hostKey;
        if v8.internalTypeChecks then
            v7(v2.of(l_currentElement_0) == v2.Host, "Element at given node is not a host Element");
        end;
        if v8.typeChecks then
            assert(l_currentElement_0.props.Name == nil, "Name can not be specified as a prop to a host component in Roact.");
            assert(l_currentElement_0.props.Parent == nil, "Parent can not be specified as a prop to a host component in Roact.");
        end;
        local v76 = Instance.new(l_currentElement_0.component);
        v72.hostObject = v76;
        local v77, v78 = xpcall(function() --[[ Line: 193 ]]
            v60(v72, l_currentElement_0.props);
        end, v9);
        if not v77 then
            local l_source_1 = l_currentElement_0.source;
            if l_source_1 == nil then
                l_source_1 = "<enable element tracebacks>";
            end;
            local v80 = ("Error applying props:\n\t%s\nIn element:\n%s\n"):format(v78, l_source_1);
            error(v80, 0);
        end;
        v76.Name = tostring(l_hostKey_0);
        local v81 = l_currentElement_0.props[v1];
        if v81 ~= nil then
            v71.updateVirtualNodeWithChildren(v72, v72.hostObject, v81);
        end;
        v76.Parent = l_hostParent_0;
        v72.hostObject = v76;
        v12(l_currentElement_0.props[v5], v76);
        if v72.eventManager ~= nil then
            v72.eventManager:resume();
        end;
    end, 
    unmountHostNode = function(v82, v83) --[[ Line: 226 ]] --[[ Name: unmountHostNode ]]
        local l_currentElement_1 = v83.currentElement;
        v12(l_currentElement_1.props[v5], nil);
        for _, v86 in pairs(v83.children) do
            v82.unmountVirtualNode(v86);
        end;
        if v83.bindings ~= nil then
            for _, v88 in pairs(v83.bindings) do
                v88();
            end;
        end;
        v83.hostObject:Destroy();
    end, 
    updateHostNode = function(v89, v90, v91) --[[ Line: 240 ]] --[[ Name: updateHostNode ]]
        local l_props_0 = v90.currentElement.props;
        local l_props_1 = v91.props;
        if v90.eventManager ~= nil then
            v90.eventManager:suspend();
        end;
        if l_props_0[v5] ~= l_props_1[v5] then
            v12(l_props_0[v5], nil);
            v12(l_props_1[v5], v90.hostObject);
        end;
        local v94, v95 = xpcall(function() --[[ Line: 254 ]]
            v69(v90, l_props_0, l_props_1);
        end, v9);
        if not v94 then
            local l_source_2 = v91.source;
            if l_source_2 == nil then
                l_source_2 = "<enable element tracebacks>";
            end;
            local v97 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v95, l_source_2);
            error(v97, 0);
        end;
        local v98 = v91.props[v1];
        if v98 ~= nil or l_props_0[v1] ~= nil then
            v89.updateVirtualNodeWithChildren(v90, v90.hostObject, v98);
        end;
        if v90.eventManager ~= nil then
            v90.eventManager:resume();
        end;
        return v90;
    end
};