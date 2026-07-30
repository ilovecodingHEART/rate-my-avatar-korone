-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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
local v71 = {
    isHostObject = function(v70) --[[ Line: 173 ]] --[[ Name: isHostObject ]]
        return typeof(v70) == "Instance";
    end
};
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v74 = require(l_ReplicatedStorage_0.Packages.HashLib);
local function v76(v75) --[[ Line: 181 ]] --[[ Name: randomName ]]
    return v74.sha512((tostring(v75)));
end;
v71.mountHostNode = function(v77, v78) --[[ Line: 186 ]] --[[ Name: mountHostNode ]]
    local l_currentElement_0 = v78.currentElement;
    local l_hostParent_0 = v78.hostParent;
    local l_hostKey_0 = v78.hostKey;
    if v8.internalTypeChecks then
        v7(v2.of(l_currentElement_0) == v2.Host, "Element at given node is not a host Element");
    end;
    if v8.typeChecks then
        assert(l_currentElement_0.props.Name == nil, "Name can not be specified as a prop to a host component in Roact.");
        assert(l_currentElement_0.props.Parent == nil, "Parent can not be specified as a prop to a host component in Roact.");
    end;
    local v82 = Instance.new(l_currentElement_0.component);
    v78.hostObject = v82;
    local v83, v84 = xpcall(function() --[[ Line: 202 ]]
        v60(v78, l_currentElement_0.props);
    end, v9);
    if not v83 then
        local l_source_1 = l_currentElement_0.source;
        if l_source_1 == nil then
            l_source_1 = "<enable element tracebacks>";
        end;
        local v86 = ("Error applying props:\n\t%s\nIn element:\n%s\n"):format(v84, l_source_1);
        error(v86, 0);
    end;
    if v82:IsA("GuiObject") or v82:IsA("UIBase") and not l_RunService_0:IsStudio() then
        v82.Name = v74.hex_to_bin(v76(math.random()));
    else
        v82.Name = tostring(l_hostKey_0);
    end;
    local v87 = l_currentElement_0.props[v1];
    if v87 ~= nil then
        v77.updateVirtualNodeWithChildren(v78, v78.hostObject, v87);
    end;
    v82.Parent = l_hostParent_0;
    v78.hostObject = v82;
    v12(l_currentElement_0.props[v5], v82);
    if v78.eventManager ~= nil then
        v78.eventManager:resume();
    end;
end;
v71.unmountHostNode = function(v88, v89) --[[ Line: 241 ]] --[[ Name: unmountHostNode ]]
    local l_currentElement_1 = v89.currentElement;
    v12(l_currentElement_1.props[v5], nil);
    for _, v92 in pairs(v89.children) do
        v88.unmountVirtualNode(v92);
    end;
    if v89.bindings ~= nil then
        for _, v94 in pairs(v89.bindings) do
            v94();
        end;
    end;
    v89.hostObject:Destroy();
end;
v71.updateHostNode = function(v95, v96, v97) --[[ Line: 255 ]] --[[ Name: updateHostNode ]]
    local l_props_0 = v96.currentElement.props;
    local l_props_1 = v97.props;
    if v96.eventManager ~= nil then
        v96.eventManager:suspend();
    end;
    if l_props_0[v5] ~= l_props_1[v5] then
        v12(l_props_0[v5], nil);
        v12(l_props_1[v5], v96.hostObject);
    end;
    local v100, v101 = xpcall(function() --[[ Line: 269 ]]
        v69(v96, l_props_0, l_props_1);
    end, v9);
    if not v100 then
        local l_source_2 = v97.source;
        if l_source_2 == nil then
            l_source_2 = "<enable element tracebacks>";
        end;
        local v103 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v101, l_source_2);
        error(v103, 0);
    end;
    local v104 = v97.props[v1];
    if v104 ~= nil or l_props_0[v1] ~= nil then
        v95.updateVirtualNodeWithChildren(v96, v96.hostObject, v104);
    end;
    if v96.eventManager ~= nil then
        v96.eventManager:resume();
    end;
    return v96;
end;
return v71;