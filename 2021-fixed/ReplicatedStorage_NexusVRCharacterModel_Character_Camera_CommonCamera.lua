-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({}, v4));
end;
v4.Enable = function(_) --[[ Line: 27 ]] --[[ Name: Enable ]]

end;
v4.Disable = function(_) --[[ Line: 34 ]] --[[ Name: Disable ]]

end;
v4.UpdateCamera = function(_, _) --[[ Line: 41 ]] --[[ Name: UpdateCamera ]]

end;
v4.SetCFrame = function(_, v10) --[[ Line: 48 ]] --[[ Name: SetCFrame ]]
    -- upvalues: l_Workspace_0 (copy), v3 (copy), l_VRService_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v3:GetSetting("Camera.DisableHeadLocked") ~= false then
        l_CurrentCamera_0.HeadLocked = false;
    end;
    local l_v10_0 = v10;
    if l_CurrentCamera_0.HeadLocked then
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_v10_0 = v10 * (CFrame.new(l_l_VRService_0_UserCFrame_0.Position * (l_Workspace_0.CurrentCamera.HeadScale - 1)) * l_l_VRService_0_UserCFrame_0):Inverse();
        l_CurrentCamera_0.VRTiltAndRollEnabled = true;
    end;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = l_v10_0;
    l_CurrentCamera_0.Focus = l_v10_0;
end;
return v4;