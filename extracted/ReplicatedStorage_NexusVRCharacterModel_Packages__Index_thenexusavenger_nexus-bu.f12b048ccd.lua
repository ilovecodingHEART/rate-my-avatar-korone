-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_NexusInstance_0 = require(script.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local v1 = {};
v1.__index = v1;
v1.__new = function(v2, v3) --[[ Line: 20 ]] --[[ Name: __new ]]
    local v4 = {};
    v2.WrappedInstance = v3;
    v2.DisabledReplicationProperties = v4;
    local v5 = getmetatable(v2);
    local l___index_0 = v5.__index;
    v5.__index = function(v7, v8) --[[ Line: 29 ]]
        -- upvalues: l___index_0 (copy), v4 (copy), v3 (copy)
        local v9 = l___index_0(v7, v8);
        if v9 ~= nil then
            return v9;
        elseif v4[v8] then
            return nil;
        else
            local v10 = v3[v8];
            if typeof(v10) == "function" then
                return function(_, ...) --[[ Line: 40 ]]
                    -- upvalues: v10 (copy), v3 (ref)
                    return v10(v3, ...);
                end;
            else
                return v10;
            end;
        end;
    end;
    v2:OnAnyPropertyChanged(function(v12, v13) --[[ Line: 48 ]]
        -- upvalues: v4 (copy), v3 (copy)
        if v4[v12] then
            return;
        else
            v3[v12] = v13;
            return;
        end;
    end);
    if typeof(v3) == "Instance" then
        v3.Changed:Connect(function(v14) --[[ Line: 53 ]]
            -- upvalues: v4 (copy), l___index_0 (copy), v2 (copy), v3 (copy)
            if v4[v14] then
                return;
            elseif l___index_0(v2, v14) ~= nil then
                v2[v14] = v3[v14];
                return;
            else
                v2.Changed:Fire(v14);
                local v15 = v2.PropertyChangedEvents[v14];
                if v15 then
                    v15:Fire();
                end;
                return;
            end;
        end);
    end;
end;
v1.DisableChangeReplication = function(v16, v17) --[[ Line: 77 ]] --[[ Name: DisableChangeReplication ]]
    v16.DisabledReplicationProperties[v17] = true;
end;
v1.GetWrappedInstance = function(v18) --[[ Line: 84 ]] --[[ Name: GetWrappedInstance ]]
    return v18.WrappedInstance;
end;
v1.Destroy = function(v19) --[[ Line: 91 ]] --[[ Name: Destroy ]]
    if typeof(v19.WrappedInstance) ~= "Instance" then
        return;
    else
        v19.WrappedInstance:Destroy();
        return;
    end;
end;
return (l_NexusInstance_0.ToInstance(v1));