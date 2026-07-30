-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x5, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v3 = setmetatable({
        Containers = {}, 
        Tools = {}, 
        Events = {}, 
        ToolsChangedEvent = l_BindableEvent_0, 
        ToolsChanged = l_BindableEvent_0.Event
    }, v0);
    if v1 then
        for _, v5 in pairs(v1) --[[ 2021 ]] do
            v3:AddContainer(v5);
        end;
    end;
    return v3;
end;
v0.AddTool = function(v6, v7) --[[ Line: 43 ]] --[[ Name: AddTool ]]
    if not v7:IsA("BackpackItem") then
        return;
    else
        for _, v9 in pairs(v6.Tools) --[[ 2021 ]] do
            if v7 == v9 then
                return;
            end;
        end;
        table.insert(v6.Tools, v7);
        v6.ToolsChangedEvent:Fire();
        return;
    end;
end;
v0.RemoveTool = function(v10, v11) --[[ Line: 61 ]] --[[ Name: RemoveTool ]]
    if not v11:IsA("BackpackItem") then
        return;
    else
        for _, v13 in pairs(v10.Containers) --[[ 2021 ]] do
            if v11.Parent == v13 then
                return;
            end;
        end;
        local v14 = nil;
        for v15, v16 in pairs(v10.Tools) --[[ 2021 ]] do
            if v11 == v16 then
                v14 = v15;
                break;
            end;
        end;
        if not v14 then
            return;
        else
            table.remove(v10.Tools, v14);
            v10.ToolsChangedEvent:Fire();
            return;
        end;
    end;
end;
v0.AddContainer = function(v17, v18) --[[ Line: 87 ]] --[[ Name: AddContainer ]]
    table.insert(v17.Containers, v18);
    for _, v20 in v18:GetChildren() do
        v17:AddTool(v20);
    end;
    table.insert(v17.Events, v18.ChildAdded:Connect(function(v21) --[[ Line: 92 ]]
        -- upvalues: v17 (copy)
        v17:AddTool(v21);
    end));
    table.insert(v17.Events, v18.ChildRemoved:Connect(function(v22) --[[ Line: 95 ]]
        -- upvalues: v17 (copy)
        v17:RemoveTool(v22);
    end));
end;
v0.Destroy = function(v23) --[[ Line: 103 ]] --[[ Name: Destroy ]]
    for _, v25 in pairs(v23.Events) --[[ 2021 ]] do
        v25:Disconnect();
    end;
    v23.Events = {};
    v23.Tools = {};
    v23.Containers = {};
    v23.ToolsChangedEvent:Destroy();
end;
return v0;