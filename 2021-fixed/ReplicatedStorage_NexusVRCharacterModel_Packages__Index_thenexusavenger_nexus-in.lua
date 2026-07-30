-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x5, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    "__call", 
    "__concat", 
    "__unm", 
    "__add", 
    "__sub", 
    "__mul", 
    "__div", 
    "__idiv", 
    "__mod", 
    "__pow", 
    "__tostring", 
    "__eq", 
    "__lt", 
    "__le", 
    "__gc", 
    "__len", 
    "__iter"
};
local l_TypedEvent_0 = require(script:WaitForChild("Event"):WaitForChild("TypedEvent"));
local v2 = {
    TypedEvent = l_TypedEvent_0
};
v2.ToInstance = function(v3) --[[ Line: 53 ]] --[[ Name: ToInstance ]]
    -- upvalues: l_TypedEvent_0 (copy), v2 (copy), v0 (copy)
    v3.new = function(...) --[[ Line: 56 ]]
        -- upvalues: l_TypedEvent_0 (ref), v3 (copy), v2 (ref), v0 (ref)
        local v4 = l_TypedEvent_0.new();
        local v5 = {};
        local v6 = {};
        local v7 = {};
        local v8 = {};
        local v9 = {};
        local v10 = {};
        local v11 = {};
        local v12 = {};
        local v13 = {
            Changed = v4, 
            BaseClass = v3, 
            Events = {
                v4
            }, 
            TransformFunctions = v6, 
            PropertyTransformFunctions = v7, 
            OnAnyPropertyChangedFunctions = v8, 
            OnPropertyChangedFunctions = v9, 
            HiddenPropertyChanges = v10, 
            HiddenNextPropertyChanges = v11, 
            PropertyChangedEvents = v12
        };
        local v31 = {
            __index = function(_, v15) --[[ Line: 82 ]] --[[ Name: __index ]]
                -- upvalues: v5 (copy), v2 (ref), v3 (ref)
                local v16 = v5[v15];
                if v16 ~= nil then
                    return v16;
                else
                    local v17 = v2[v15];
                    if v17 ~= nil then
                        return v17;
                    else
                        return v3[v15];
                    end;
                end;
            end, 
            __newindex = function(v18, v19, v20) --[[ Line: 98 ]] --[[ Name: __newindex ]]
                -- upvalues: v6 (copy), v7 (copy), v5 (copy), v8 (copy), v9 (copy), v11 (copy), v10 (copy), v12 (copy)
                for _, v22 in pairs(v6) --[[ 2021 ]] do
                    v20 = v22(v19, v20);
                end;
                if v7[v19] then
                    for _, v24 in v7[v19] do
                        v20 = v24(v20);
                    end;
                end;
                if v18[v19] == v20 then
                    return;
                else
                    v5[v19] = v20;
                    for _, v26 in pairs(v8) --[[ 2021 ]] do
                        v26(v19, v20);
                    end;
                    local v27 = v9[v19];
                    if v27 then
                        for _, v29 in pairs(v27) --[[ 2021 ]] do
                            v29(v20);
                        end;
                    end;
                    if v11[v19] then
                        v11[v19] = nil;
                        return;
                    elseif v10[v19] then
                        return;
                    else
                        v18.Changed:Fire(v19);
                        local v30 = v12[v19];
                        if v30 then
                            v30:Fire();
                        end;
                        return;
                    end;
                end;
            end
        };
        for _, v33 in pairs(v0) --[[ 2021 ]] do
            v31[v33] = v3[v33];
        end;
        local v34 = setmetatable(v13, v31);
        local l___new_0 = v3.__new;
        if l___new_0 then
            l___new_0(v34, ...);
        end;
        return v34;
    end;
    return v3;
end;
v2.CreateEvent = function(v36) --[[ Line: 167 ]] --[[ Name: CreateEvent ]]
    -- upvalues: l_TypedEvent_0 (copy)
    local v37 = l_TypedEvent_0.new();
    table.insert(v36.Events, v37);
    return v37;
end;
v2.AddGenericPropertyTransform = function(v38, v39) --[[ Line: 176 ]] --[[ Name: AddGenericPropertyTransform ]]
    table.insert(v38.TransformFunctions, v39);
end;
v2.AddPropertyTransform = function(v40, v41, v42) --[[ Line: 183 ]] --[[ Name: AddPropertyTransform ]]
    if not v40.PropertyTransformFunctions[v41] then
        v40.PropertyTransformFunctions[v41] = {};
    end;
    table.insert(v40.PropertyTransformFunctions[v41], v42);
end;
v2.OnAnyPropertyChanged = function(v43, v44) --[[ Line: 194 ]] --[[ Name: OnAnyPropertyChanged ]]
    table.insert(v43.OnAnyPropertyChangedFunctions, v44);
end;
v2.OnPropertyChanged = function(v45, v46, v47) --[[ Line: 202 ]] --[[ Name: OnPropertyChanged ]]
    if not v45.OnPropertyChangedFunctions[v46] then
        v45.OnPropertyChangedFunctions[v46] = {};
    end;
    table.insert(v45.OnPropertyChangedFunctions[v46], v47);
end;
v2.HidePropertyChanges = function(v48, v49) --[[ Line: 212 ]] --[[ Name: HidePropertyChanges ]]
    v48.HiddenPropertyChanges[v49] = true;
end;
v2.HideNextPropertyChange = function(v50, v51) --[[ Line: 219 ]] --[[ Name: HideNextPropertyChange ]]
    v50.HiddenNextPropertyChanges[v51] = true;
end;
v2.GetPropertyChangedSignal = function(v52, v53) --[[ Line: 226 ]] --[[ Name: GetPropertyChangedSignal ]]
    if not v52.PropertyChangedEvents[v53] then
        v52.PropertyChangedEvents[v53] = v52:CreateEvent();
    end;
    return v52.PropertyChangedEvents[v53];
end;
v2.Destroy = function(v54) --[[ Line: 236 ]] --[[ Name: Destroy ]]
    local l_Destroy_0 = v54.BaseClass.Destroy;
    if l_Destroy_0 then
        l_Destroy_0(v54);
    end;
    task.defer(function() --[[ Line: 244 ]]
        -- upvalues: v54 (copy)
        for _, v57 in pairs(v54.Events) --[[ 2021 ]] do
            v57:Destroy();
        end;
        v54.Events = {};
    end);
end;
return v2;