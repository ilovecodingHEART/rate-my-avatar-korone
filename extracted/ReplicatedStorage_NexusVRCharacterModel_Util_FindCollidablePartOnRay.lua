-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
return function(v1, v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_Workspace_0 (copy)
    if typeof(v4) == "Instance" and v4:IsA("BasePart") then
        v4 = v4.CollisionGroup;
    end;
    local v5 = RaycastParams.new();
    v5.FilterType = Enum.RaycastFilterType.Exclude;
    v5.FilterDescendantsInstances = {
        l_Workspace_0.CurrentCamera
    };
    if v3 then
        v5:AddToFilter(v3);
    end;
    v5.IgnoreWater = true;
    if v4 then
        v5.CollisionGroup = v4;
    end;
    while true do
        local v6 = l_Workspace_0:Raycast(v1, v2, v5);
        if not v6 then
            return nil, v1 + v2;
        else
            local l_Instance_0 = v6.Instance;
            local l_Position_0 = v6.Position;
            if l_Instance_0 and not l_Instance_0.CanCollide and (not l_Instance_0:IsA("Seat") or not l_Instance_0:IsA("VehicleSeat") or l_Instance_0.Disabled) then
                v5:AddToFilter(l_Instance_0);
            else
                return l_Instance_0, l_Position_0;
            end;
        end;
    end;
end;