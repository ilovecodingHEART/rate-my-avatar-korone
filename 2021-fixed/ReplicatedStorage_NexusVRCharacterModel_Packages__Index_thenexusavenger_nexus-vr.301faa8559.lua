-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_NexusInstance_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local v1 = {
    ClassName = "BaseScreenGui"
};
v1.__index = v1;
v1.__new = function(v2, v3) --[[ Line: 27 ]] --[[ Name: __new ]]
    v2.Container = v3;
    local v4 = {};
    v2.NonReplicatedProperties = v4;
    local v5 = getmetatable(v2);
    local l___index_0 = v5.__index;
    v5.__index = function(v7, v8) --[[ Line: 35 ]]
        -- upvalues: l___index_0 (copy), v4 (copy), v3 (copy)
        local v9 = l___index_0(v7, v8);
        if v9 ~= nil or v4[v8] then
            return v9;
        else
            return v3[v8];
        end;
    end;
    v2:OnAnyPropertyChanged(function(v10, v11) --[[ Line: 47 ]]
        -- upvalues: v4 (copy), v3 (copy)
        if v4[v10] then
            return;
        else
            v3[v10] = v11;
            return;
        end;
    end);
    v2:DisableChangeReplication("RotationOffset");
    v2.RotationOffset = CFrame.identity;
    v2:DisableChangeReplication("Depth");
    v2.Depth = 5;
    v2:DisableChangeReplication("FieldOfView");
    v2.FieldOfView = 0.8726646259971648;
    if not v3:IsA("SurfaceGui") then
        v2:DisableChangeReplication("CanvasSize");
    end;
    v2.CanvasSize = Vector2.new(1000, 1000);
    v2:DisableChangeReplication("Easing");
    v2.Easing = 0;
    v2:DisableChangeReplication("PointingEnabled");
    v2.PointingEnabled = true;
end;
v1.IsA = function(_, v13) --[[ Line: 73 ]] --[[ Name: IsA ]]
    warn("BaseScreenGui::IsA is deprecated.");
    local v14 = true;
    if v13 ~= "NexusObject" then
        v14 = true;
        if v13 ~= "NexusInstance" then
            v14 = v13 == "BaseScreenGui";
        end;
    end;
    return v14;
end;
v1.DisableChangeReplication = function(v15, v16) --[[ Line: 81 ]] --[[ Name: DisableChangeReplication ]]
    v15.NonReplicatedProperties[v16] = true;
end;
v1.GetContainer = function(v17) --[[ Line: 88 ]] --[[ Name: GetContainer ]]
    return v17.Container;
end;
v1.Destroy = function(v18) --[[ Line: 95 ]] --[[ Name: Destroy ]]
    v18.Container:Destroy();
end;
return (l_NexusInstance_0.ToInstance(v1));