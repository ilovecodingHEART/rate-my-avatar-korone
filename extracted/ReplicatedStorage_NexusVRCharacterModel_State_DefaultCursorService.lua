-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local v3 = {};
v3.__index = v3;
local v4 = nil;
v3.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_StarterGui_0 (copy), l_RunService_0 (copy), l_Workspace_0 (copy), v3 (copy)
    return (setmetatable({
        CursorOptionsList = {
            "Detect", 
            "Enabled", 
            "Disabled"
        }, 
        CursorOptions = {
            Detect = function() --[[ Line: 29 ]] --[[ Name: Detect ]]
                -- upvalues: l_StarterGui_0 (ref), l_RunService_0 (ref), l_Workspace_0 (ref)
                l_StarterGui_0:SetCore("VRLaserPointerMode", "Pointer");
                l_RunService_0.Stepped:Wait();
                l_RunService_0:BindToRenderStep("NexusVRCharacterModel_MoveCursorWorkaround", Enum.RenderPriority.Last.Value + 1, function() --[[ Line: 38 ]]
                    -- upvalues: l_Workspace_0 (ref)
                    local l_VRCoreEffectParts_0 = l_Workspace_0.CurrentCamera:FindFirstChild("VRCoreEffectParts");
                    if l_VRCoreEffectParts_0 then
                        local l_LaserPointerOrigin_0 = l_VRCoreEffectParts_0:FindFirstChild("LaserPointerOrigin");
                        local l_Cursor_0 = l_VRCoreEffectParts_0:FindFirstChild("Cursor");
                        if l_LaserPointerOrigin_0 and l_Cursor_0 then
                            local l_CursorSurfaceGui_0 = l_Cursor_0:FindFirstChild("CursorSurfaceGui");
                            if l_CursorSurfaceGui_0 and not l_CursorSurfaceGui_0.Enabled then
                                l_LaserPointerOrigin_0.CFrame = CFrame.new(0, 1e999, 0);
                            end;
                        end;
                    end;
                end);
            end, 
            Enabled = function() --[[ Line: 53 ]] --[[ Name: Enabled ]]
                -- upvalues: l_StarterGui_0 (ref)
                l_StarterGui_0:SetCore("VRLaserPointerMode", "Pointer");
            end, 
            Disabled = function() --[[ Line: 56 ]] --[[ Name: Disabled ]]
                -- upvalues: l_StarterGui_0 (ref)
                l_StarterGui_0:SetCore("VRLaserPointerMode", "Disabled");
            end
        }, 
        CursorDisabledOptions = {
            Detect = function() --[[ Line: 61 ]] --[[ Name: Detect ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("NexusVRCharacterModel_MoveCursorWorkaround");
            end
        }
    }, v3));
end;
v3.GetInstance = function() --[[ Line: 71 ]] --[[ Name: GetInstance ]]
    -- upvalues: v4 (ref), v3 (copy)
    if not v4 then
        v4 = v3.new();
    end;
    return v4;
end;
v3.SetCursorState = function(v9, v10) --[[ Line: 81 ]] --[[ Name: SetCursorState ]]
    if v9.CurrentCursorState == v10 then
        return;
    else
        if v9.CurrentCursorState and v9.CursorDisabledOptions[v9.CurrentCursorState] then
            v9.CursorDisabledOptions[v9.CurrentCursorState]();
        end;
        v9.CurrentCursorState = v10;
        task.spawn(v9.CursorOptions[v10]);
        return;
    end;
end;
return v3;