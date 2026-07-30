-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_TypedEvent_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusInstance")).TypedEvent;
local v2 = {};
v2.__index = v2;
local v3 = nil;
v2.new = function(v4, v5) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: l_TypedEvent_0 (copy), v2 (copy)
    local v6 = setmetatable({
        RecenterOffset = CFrame.identity, 
        ThumbstickValues = {
            [Enum.KeyCode.Thumbstick1] = Vector3.new(0, 0, 0, 0), 
            [Enum.KeyCode.Thumbstick2] = Vector3.new(0, 0, 0, 0)
        }, 
        VRService = v4 or game:GetService("VRService"), 
        UserInputService = v5 or game:GetService("UserInputService"), 
        Recentered = l_TypedEvent_0.new(), 
        EyeLevelSet = l_TypedEvent_0.new()
    }, v2);
    v6.UserInputService.InputEnded:Connect(function(v7) --[[ Line: 46 ]]
        -- upvalues: v6 (copy)
        if v6.ThumbstickValues[v7.KeyCode] then
            v6.ThumbstickValues[v7.KeyCode] = Vector3.new(0, 0, 0, 0);
        end;
    end);
    v6.UserInputService.InputChanged:Connect(function(v8) --[[ Line: 51 ]]
        -- upvalues: v6 (copy)
        if v6.ThumbstickValues[v8.KeyCode] then
            v6.ThumbstickValues[v8.KeyCode] = v8.Position;
        end;
    end);
    return v6;
end;
v2.GetInstance = function() --[[ Line: 64 ]] --[[ Name: GetInstance ]]
    -- upvalues: v3 (ref), v2 (copy)
    if not v3 then
        v3 = v2.new();
    end;
    return v3;
end;
v2.GetVRInputs = function(v9) --[[ Line: 75 ]] --[[ Name: GetVRInputs ]]
    local v10 = {
        [Enum.UserCFrame.Head] = v9.VRService:GetUserCFrame(Enum.UserCFrame.Head)
    };
    if v9.VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v10[Enum.UserCFrame.LeftHand] = v9.VRService:GetUserCFrame(Enum.UserCFrame.LeftHand);
    else
        v10[Enum.UserCFrame.LeftHand] = v10[Enum.UserCFrame.Head] * CFrame.new(-1, -2.5, 0.5);
    end;
    if v9.VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        v10[Enum.UserCFrame.RightHand] = v9.VRService:GetUserCFrame(Enum.UserCFrame.RightHand);
    else
        v10[Enum.UserCFrame.RightHand] = v10[Enum.UserCFrame.Head] * CFrame.new(1, -2.5, 0.5);
    end;
    local v11 = 0;
    if v9.ManualNormalHeadLevel then
        v11 = -v9.ManualNormalHeadLevel;
    else
        local l_Y_0 = (v10[Enum.UserCFrame.Head] * CFrame.new(0, 0, 0.5)).Y;
        if not v9.HighestHeadHeight or v9.HighestHeadHeight < l_Y_0 then
            v9.HighestHeadHeight = l_Y_0;
        end;
        v11 = -v9.HighestHeadHeight;
    end;
    for _, v14 in {
        Enum.UserCFrame.Head, 
        Enum.UserCFrame.LeftHand, 
        Enum.UserCFrame.RightHand
    } do
        v10[v14] = CFrame.new(0, v11, 0) * v9.RecenterOffset * v10[v14];
    end;
    return v10;
end;
v2.Recenter = function(v15) --[[ Line: 122 ]] --[[ Name: Recenter ]]
    local l_UserCFrame_0 = v15.VRService:GetUserCFrame(Enum.UserCFrame.Head);
    v15.RecenterOffset = CFrame.Angles(0, -math.atan2(-l_UserCFrame_0.LookVector.X, -l_UserCFrame_0.LookVector.Z), 0) * CFrame.new(-l_UserCFrame_0.X, 0, -l_UserCFrame_0.Z);
    v15.Recentered:Fire();
end;
v2.SetEyeLevel = function(v17) --[[ Line: 131 ]] --[[ Name: SetEyeLevel ]]
    v17.ManualNormalHeadLevel = v17.VRService:GetUserCFrame(Enum.UserCFrame.Head).Y;
    v17.EyeLevelSet:Fire();
end;
v2.GetThumbstickPosition = function(v18, v19) --[[ Line: 139 ]] --[[ Name: GetThumbstickPosition ]]
    return v18.ThumbstickValues[v19] or Vector3.new(0, 0, 0, 0);
end;
return v2;