-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_NexusInstance_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_BaseScreenGui_0 = require(script.Parent:WaitForChild("BaseScreenGui"));
local v4 = {
    ClassName = "ScreenGui3D"
};
v4.__index = v4;
setmetatable(v4, l_BaseScreenGui_0);
v4.__new = function(v5) --[[ Line: 27 ]] --[[ Name: __new ]]
    -- upvalues: l_BaseScreenGui_0 (copy), l_Workspace_0 (copy), l_RunService_0 (copy)
    l_BaseScreenGui_0.__new(v5, Instance.new("SurfaceGui"));
    local l_NexusVRCoreContainer_0 = l_Workspace_0.CurrentCamera:FindFirstChild("NexusVRCoreContainer");
    if not l_NexusVRCoreContainer_0 then
        l_NexusVRCoreContainer_0 = Instance.new("Folder");
        l_NexusVRCoreContainer_0.Name = "NexusVRCoreContainer";
        l_NexusVRCoreContainer_0.Parent = l_Workspace_0.CurrentCamera;
    end;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Parent = l_NexusVRCoreContainer_0;
    v5.Adornee = l_Part_0;
    v5.Face = Enum.NormalId.Back;
    v5.AlwaysOnTop = true;
    v5:OnPropertyChanged("PointingEnabled", function() --[[ Line: 47 ]]
        -- upvalues: v5 (copy)
        v5.Adornee.CanQuery = v5.Enabled and v5.PointingEnabled;
    end);
    v5:OnPropertyChanged("Enabled", function() --[[ Line: 50 ]]
        -- upvalues: v5 (copy)
        v5.Adornee.CanQuery = v5.Enabled and v5.PointingEnabled;
    end);
    v5:DisableChangeReplication("DisplayOrder");
    v5:DisableChangeReplication("IgnoreGuiInset");
    v5:DisableChangeReplication("LastRotation");
    v5.LastRotation = CFrame.new(l_Workspace_0.CurrentCamera:GetRenderCFrame().Position):Inverse() * l_Workspace_0.CurrentCamera:GetRenderCFrame();
    v5:OnPropertyChanged("Depth", function() --[[ Line: 61 ]]
        -- upvalues: v5 (copy)
        v5:UpdateSize();
    end);
    v5:OnPropertyChanged("FieldOfView", function() --[[ Line: 64 ]]
        -- upvalues: v5 (copy)
        v5:UpdateSize();
    end);
    v5:OnPropertyChanged("CanvasSize", function(_) --[[ Line: 67 ]]
        -- upvalues: v5 (copy)
        v5:UpdateSize();
    end);
    v5:UpdateSize();
    v5:DisableChangeReplication("UpdateEvent");
    if l_RunService_0:IsClient() then
        v5.UpdateEvent = l_RunService_0.RenderStepped:Connect(function(v9) --[[ Line: 75 ]]
            -- upvalues: v5 (copy)
            if v5.Enabled then
                v5:UpdateCFrame(v9);
            end;
        end);
    end;
end;
v4.UpdateSize = function(v10) --[[ Line: 86 ]] --[[ Name: UpdateSize ]]
    local v11 = math.tan(v10.FieldOfView / 2) * 2 * v10.Depth;
    local l_CanvasSize_0 = v10.CanvasSize;
    if l_CanvasSize_0.Y <= l_CanvasSize_0.X then
        v10.Adornee.Size = Vector3.new(v11, v11 * (v10.CanvasSize.Y / v10.CanvasSize.X), 0);
    else
        v10.Adornee.Size = Vector3.new(v11 * (v10.CanvasSize.X / v10.CanvasSize.Y), v11, 0);
    end;
    v10.CanvasSize = v10.CanvasSize;
end;
v4.UpdateCFrame = function(v13, v14) --[[ Line: 100 ]] --[[ Name: UpdateCFrame ]]
    -- upvalues: l_Workspace_0 (copy)
    v14 = v14 or v13.Easing;
    local l_RenderCFrame_0 = l_Workspace_0.CurrentCamera:GetRenderCFrame();
    local v16 = CFrame.new(l_RenderCFrame_0.Position):Inverse() * l_RenderCFrame_0;
    if v13.Easing == 0 then
        v13.LastRotation = v16;
    else
        v13.LastRotation = v13.LastRotation:Lerp(v16, (math.clamp(v14 / v13.Easing, 0, 1)));
    end;
    v13.Adornee.CFrame = CFrame.new(l_RenderCFrame_0.Position) * v13.LastRotation * v13.RotationOffset * CFrame.new(0, 0, -v13.Depth);
end;
v4.Destroy = function(v17) --[[ Line: 119 ]] --[[ Name: Destroy ]]
    -- upvalues: l_BaseScreenGui_0 (copy)
    l_BaseScreenGui_0.Destroy(v17);
    if v17.UpdateEvent then
        v17.UpdateEvent:Disconnect();
        v17.UpdateEvent = nil;
    end;
    v17.Adornee:Destroy();
end;
return (l_NexusInstance_0.ToInstance(v4));