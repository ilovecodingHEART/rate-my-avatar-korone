-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clear
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Utility.cleanupOnDestroy);
local v3 = require(l_Parent_0.Instances.Children);
local v4 = require(l_Parent_0.Instances.Scheduler);
local v5 = require(l_Parent_0.Instances.defaultProps);
local v6 = require(l_Parent_0.State.Compat);
local v7 = require(l_Parent_0.Logging.logError);
local v8 = require(l_Parent_0.Logging.logWarn);
local v9 = setmetatable({}, {
    __mode = "k"
});
return function(v10) --[[ Line: 23 ]] --[[ Name: New ]]
    return function(v11) --[[ Line: 24 ]]
        local v12 = {};
        local v13 = {};
        local v14 = setmetatable({}, {
            __mode = ""
        });
        local v15 = nil;
        local l_status_0, l_result_0 = pcall(Instance.new, v10);
        if not l_status_0 then
            v7("cannotCreateClass", nil, v10);
        end;
        local v18 = v5[v10];
        if v18 ~= nil then
            for v19, v20 in pairs(v18) do
                l_result_0[v19] = v20;
            end;
        end;
        v14.instance = l_result_0;
        v15 = l_result_0.Changed:Connect(function() --[[ Line: 52 ]]

        end);
        l_result_0 = nil;
        for v21, v22 in pairs(v11) do
            if v21 ~= v3 and v21 ~= "Parent" then
                if typeof(v21) == "string" then
                    if typeof(v22) == "table" and v22.type == "State" then
                        if not pcall(function() --[[ Line: 71 ]]
                            v14.instance[v21] = v22:get(false);
                        end) then
                            v7("cannotAssignProperty", nil, v10, v21);
                        end;
                        table.insert(v12, v6(v22):onChange(function() --[[ Line: 80 ]]
                            if v14.instance == nil then
                                return;
                            else
                                v4.enqueueProperty(v14.instance, v21, v22:get(false));
                                return;
                            end;
                        end));
                    elseif not pcall(function() --[[ Line: 97 ]]
                        v14.instance[v21] = v22;
                    end) then
                        v7("cannotAssignProperty", nil, v10, v21);
                    end;
                elseif typeof(v21) == "table" and v21.type == "Symbol" then
                    if v21.name == "OnEvent" then
                        local v23 = nil;
                        do
                            local l_v23_0 = v23;
                            if not pcall(function() --[[ Line: 116 ]]
                                l_v23_0 = v14.instance[v21.key];
                            end) or typeof(l_v23_0) ~= "RBXScriptSignal" then
                                v7("cannotConnectChange", nil, v10, v21.key);
                            end;
                            v13[l_v23_0] = v22;
                        end;
                    elseif v21.name == "OnChange" then
                        local v25 = nil;
                        do
                            local l_v25_0 = v25;
                            if not pcall(function() --[[ Line: 131 ]]
                                l_v25_0 = v14.instance:GetPropertyChangedSignal(v21.key);
                            end) then
                                v7("cannotConnectChange", nil, v10, v21.key);
                            end;
                            v13[l_v25_0] = function() --[[ Line: 138 ]]
                                if v14.instance == nil then
                                    return;
                                else
                                    v22(v14.instance[v21.key]);
                                    return;
                                end;
                            end;
                        end;
                    else
                        v7("unrecognisedPropertyKey", nil, v21.name);
                    end;
                else
                    v7("unrecognisedPropertyKey", nil, (typeof(v21)));
                end;
            end;
        end;
        l_status_0 = v11[v3];
        if l_status_0 ~= nil then
            l_result_0 = {};
            v18 = {};
            local v27 = {};
            local v28 = {};
            do
                local l_l_result_0_0, l_v18_0, l_v27_0, l_v28_0 = l_result_0, v18, v27, v28;
                local function v33() --[[ Line: 174 ]] --[[ Name: updateCurrentlyParented ]]
                    if v14.instance == nil then
                        return;
                    else
                        local l_l_l_result_0_0_0 = l_l_result_0_0;
                        local l_l_v18_0_0 = l_v18_0;
                        l_v18_0 = l_l_l_result_0_0_0;
                        l_l_result_0_0 = l_l_v18_0_0;
                        l_l_l_result_0_0_0 = l_v27_0;
                        l_l_v18_0_0 = l_v28_0;
                        l_v28_0 = l_l_l_result_0_0_0;
                        l_v27_0 = l_l_v18_0_0;
                        l_l_l_result_0_0_0 = function(v36) --[[ Line: 189 ]] --[[ Name: recursiveAddChild ]]
                            local v37 = typeof(v36);
                            if v37 == "Instance" then
                                l_l_result_0_0[v36] = true;
                                if l_v18_0[v36] == nil then
                                    if v9[v36] == nil then
                                        v36.Parent = v14.instance;
                                        return;
                                    end;
                                else
                                    l_v18_0[v36] = nil;
                                    return;
                                end;
                            elseif v37 == "table" then
                                if v36.type == "State" then
                                    l_l_l_result_0_0_0(v36:get(false));
                                    local v38 = l_v28_0[v36];
                                    if v38 ~= nil then
                                        l_v27_0[v36] = v38;
                                        l_v28_0[v36] = nil;
                                        return;
                                    else
                                        l_v27_0[v36] = v6(v36):onChange(function() --[[ Line: 223 ]]
                                            v4.enqueueCallback(v33);
                                        end);
                                        return;
                                    end;
                                else
                                    for _, v40 in pairs(v36) do
                                        l_l_l_result_0_0_0(v40);
                                    end;
                                    return;
                                end;
                            elseif v37 ~= "nil" then
                                v8("unrecognisedChildType", v37);
                            end;
                        end;
                        l_l_l_result_0_0_0(l_status_0);
                        for v41 in pairs(l_v18_0) do
                            if v9[v41] == nil then
                                v41.Parent = nil;
                            end;
                        end;
                        for _, v43 in pairs(l_v28_0) do
                            v43();
                        end;
                        __2021_clear(l_v18_0);
                        __2021_clear(l_v28_0);
                        return;
                    end;
                end;
                v33();
            end;
        end;
        l_result_0 = v11.Parent;
        if l_result_0 ~= nil then
            v9[v14.instance] = l_result_0;
            if typeof(l_result_0) == "table" and l_result_0.type == "State" then
                if not pcall(function() --[[ Line: 270 ]]
                    v14.instance.Parent = l_result_0:get(false);
                end) then
                    v7("cannotAssignProperty", nil, v10, "Parent");
                end;
                table.insert(v12, v6(l_result_0):onChange(function() --[[ Line: 279 ]]
                    if v14.instance == nil then
                        return;
                    else
                        v4.enqueueProperty(v14.instance, "Parent", l_result_0:get(false));
                        return;
                    end;
                end));
            elseif not pcall(function() --[[ Line: 296 ]]
                v14.instance.Parent = l_result_0;
            end) then
                v7("cannotAssignProperty", nil, v10, "Parent");
            end;
        end;
        for v44, v45 in pairs(v13) do
            table.insert(v12, v44:Connect(v45));
        end;
        if v12[1] ~= nil then
            v2(v14.instance, v12);
        end;
        return v14.instance;
    end;
end;