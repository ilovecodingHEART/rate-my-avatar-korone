-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.GetPromiseLibrary);
local v1 = require(script.RbxScriptConnection);
local v2 = require(script.Symbol);
local v3, v4 = v0();
local v5 = v2("IndicesReference");
local v6 = v2("LinkToInstanceIndex");
local v7 = {
    ClassName = "Janitor", 
    CurrentlyCleaning = true, 
    SuppressInstanceReDestroy = false, 
    [v5] = nil
};
v7.__index = v7;
local v8 = {
    ["function"] = true, 
    thread = true, 
    RBXScriptConnection = "Disconnect"
};
v7.new = function() --[[ Line: 64 ]] --[[ Name: new ]]
    return (setmetatable({
        CurrentlyCleaning = false, 
        [v5] = nil
    }, v7));
end;
v7.Is = function(v9) --[[ Line: 77 ]] --[[ Name: Is ]]
    local v10 = false;
    if type(v9) == "table" then
        v10 = getmetatable(v9) == v7;
    end;
    return v10;
end;
v7.Add = function(v11, v12, v13, v14) --[[ Line: 161 ]] --[[ Name: Add ]]
    if v14 then
        v11:Remove(v14);
        local v15 = v11[v5];
        if not v15 then
            v15 = {};
            v11[v5] = v15;
        end;
        v15[v14] = v12;
    end;
    local v16 = typeof(v12);
    local v17 = v13 or v8[v16] or "Destroy";
    if v16 == "function" or v16 == "thread" then
        if v17 ~= true then
            warn(string.format("Object is a %s and as such expected `true?` for the method name and instead got %s. Traceback: %s", v16, tostring(v17), debug.traceback(nil, 2)));
        end;
    elseif not v12[v17] then
        warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(v12), tostring(v17), debug.traceback(nil, 2)));
    end;
    v11[v12] = v17;
    return v12;
end;
v7.AddPromise = function(v18, v19) --[[ Line: 217 ]] --[[ Name: AddPromise ]]
    if v3 then
        if not v4.is(v19) then
            error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s)) Traceback: %s", typeof(v19), tostring(v19), debug.traceback(nil, 2)));
        end;
        if v19:getStatus() == v4.Status.Started then
            local v20 = newproxy(false);
            local v24 = v18:Add(v4.new(function(v21, _, v23) --[[ Line: 225 ]]
                if v23(function() --[[ Line: 226 ]]
                    v19:cancel();
                end) then
                    return;
                else
                    v21(v19);
                    return;
                end;
            end), "cancel", v20);
            v24:finallyCall(v18.Remove, v18, v20);
            return v24;
        else
            return v19;
        end;
    else
        return v19;
    end;
end;
v7.Remove = function(v25, v26) --[[ Line: 270 ]] --[[ Name: Remove ]]
    local v27 = v25[v5];
    if v27 then
        local v28 = v27[v26];
        if v28 then
            local v29 = v25[v28];
            if v29 then
                if v29 == true then
                    if type(v28) == "function" then
                        v28();
                    else
                        local v30 = nil;
                        if coroutine.running() ~= v28 then
                            v30 = pcall(function() --[[ Line: 286 ]]
                                task.cancel(v28);
                            end);
                        end;
                        if not v30 then
                            task.defer(function() --[[ Line: 292 ]]
                                if v28 then
                                    task.cancel(v28);
                                end;
                            end);
                        end;
                    end;
                else
                    local v31 = v28[v29];
                    if v31 then
                        if v25.SuppressInstanceReDestroy and v29 == "Destroy" and typeof(v28) == "Instance" then
                            pcall(v31, v28);
                        else
                            v31(v28);
                        end;
                    end;
                end;
                v25[v28] = nil;
            end;
            v27[v26] = nil;
        end;
    end;
    return v25;
end;
v7.RemoveNoClean = function(v32, v33) --[[ Line: 349 ]] --[[ Name: RemoveNoClean ]]
    local v34 = v32[v5];
    if v34 then
        local v35 = v34[v33];
        if v35 then
            v32[v35] = nil;
        end;
        v34[v33] = nil;
    end;
    return v32;
end;
v7.RemoveList = function(v36, ...) --[[ Line: 405 ]] --[[ Name: RemoveList ]]
    if v36[v5] then
        local v37 = select("#", ...);
        if v37 == 1 then
            return v36:Remove(...);
        else
            for v38 = 1, v37 do
                v36:Remove(select(v38, ...));
            end;
        end;
    end;
    return v36;
end;
v7.RemoveListNoClean = function(v39, ...) --[[ Line: 462 ]] --[[ Name: RemoveListNoClean ]]
    local v40 = v39[v5];
    if v40 then
        local v41 = select("#", ...);
        if v41 == 1 then
            return v39:RemoveNoClean(...);
        else
            for v42 = 1, v41 do
                local v43 = select(v42, ...);
                local v44 = v40[v43];
                if v44 then
                    v39[v44] = nil;
                end;
                v40[v43] = nil;
            end;
        end;
    end;
    return v39;
end;
v7.Get = function(v45, v46) --[[ Line: 510 ]] --[[ Name: Get ]]
    local v47 = v45[v5];
    if v47 then
        return v47[v46];
    else
        return nil;
    end;
end;
v7.GetAll = function(v48) --[[ Line: 540 ]] --[[ Name: GetAll ]]
    local v49 = v48[v5];
    if v49 then
        return (table.freeze(table.clone(v49)));
    else
        return {};
    end;
end;
local function _(v50) --[[ Line: 545 ]] --[[ Name: GetFenv ]]
    return function() --[[ Line: 546 ]]
        for v51, v52 in next, v50 do
            if v51 ~= v5 then
                return v51, v52;
            end;
        end;
    end;
end;
v7.Cleanup = function(v54) --[[ Line: 572 ]] --[[ Name: Cleanup ]]
    if not v54.CurrentlyCleaning then
        v54.CurrentlyCleaning = nil;
        local function v57() --[[ Line: 546 ]]
            for v55, v56 in next, v54 do
                if v55 ~= v5 then
                    return v55, v56;
                end;
            end;
        end;
        local v58, v59 = v57();
        do
            local l_v58_0 = v58;
            while l_v58_0 and v59 do
                if v59 == true then
                    if type(l_v58_0) == "function" then
                        l_v58_0();
                    else
                        local v61 = nil;
                        if coroutine.running() ~= l_v58_0 then
                            v61 = pcall(function() --[[ Line: 586 ]]
                                task.cancel(l_v58_0);
                            end);
                        end;
                        if not v61 then
                            task.defer(function() --[[ Line: 592 ]]
                                if l_v58_0 then
                                    task.cancel(l_v58_0);
                                end;
                            end);
                        end;
                    end;
                else
                    local v62 = l_v58_0[v59];
                    if v62 then
                        if v54.SuppressInstanceReDestroy and v59 == "Destroy" and typeof(l_v58_0) == "Instance" then
                            pcall(v62, l_v58_0);
                        else
                            v62(l_v58_0);
                        end;
                    end;
                end;
                v54[l_v58_0] = nil;
                local v63, v64 = v57();
                l_v58_0 = v63;
                v59 = v64;
            end;
            local v65 = v54[v5];
            if v65 then
                table.clear(v65);
                v54[v5] = {};
            end;
            v54.CurrentlyCleaning = false;
        end;
    end;
end;
v7.Destroy = function(v66) --[[ Line: 631 ]] --[[ Name: Destroy ]]
    v66:Cleanup();
    table.clear(v66);
    setmetatable(v66, nil);
end;
v7.__call = v7.Cleanup;
v7.LinkToInstance = function(v67, v68, v69) --[[ Line: 680 ]] --[[ Name: LinkToInstance ]]
    local v70 = v69 and newproxy(false) or v6;
    return v67:Add(v68.Destroying:Connect(function() --[[ Line: 683 ]]
        v67:Cleanup();
    end), "Disconnect", v70);
end;
v7.LegacyLinkToInstance = function(v71, v72, v73) --[[ Line: 733 ]] --[[ Name: LegacyLinkToInstance ]]
    local v74 = nil;
    local v75 = v73 and newproxy(false) or v6;
    local v76 = v72.Parent == nil;
    local v77 = setmetatable({}, v1);
    local function v80(v78, v79) --[[ Line: 739 ]] --[[ Name: ChangedFunction ]]
        if v77.Connected then
            v78 = nil;
            v76 = v79 == nil;
            if v76 then
                task.defer(function() --[[ Line: 745 ]]
                    if not v77.Connected then
                        return;
                    elseif not v74.Connected then
                        v71:Cleanup();
                        return;
                    else
                        while v76 and v74.Connected and v77.Connected do
                            task.wait();
                        end;
                        if v77.Connected and v76 then
                            v71:Cleanup();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end;
    v74 = v72.AncestryChanged:Connect(v80);
    v77.Connection = v74;
    if v76 then
        local v81 = nil;
        local l_Parent_0 = v72.Parent;
        if v77.Connected then
            v81 = nil;
            v76 = l_Parent_0 == nil;
            if v76 then
                task.defer(function() --[[ Line: 745 ]]
                    if not v77.Connected then
                        return;
                    elseif not v74.Connected then
                        v71:Cleanup();
                        return;
                    else
                        while v76 and v74.Connected and v77.Connected do
                            task.wait();
                        end;
                        if v77.Connected and v76 then
                            v71:Cleanup();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end;
    v72 = nil;
    return v71:Add(v77, "Disconnect", v75);
end;
v7.LinkToInstances = function(v83, ...) --[[ Line: 781 ]] --[[ Name: LinkToInstances ]]
    local v84 = v7.new();
    for _, v86 in {
        ...
    } do
        v84:Add(v83:LinkToInstance(v86, true), "Disconnect");
    end;
    return v84;
end;
v7.__tostring = function(_) --[[ Line: 790 ]] --[[ Name: __tostring ]]
    return "Janitor";
end;
table.freeze(v7);
return v7;