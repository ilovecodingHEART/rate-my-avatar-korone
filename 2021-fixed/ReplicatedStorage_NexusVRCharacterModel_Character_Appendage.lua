-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x1, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Limb_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusAppendage")).Limb;
local v1 = {};
v1.__index = v1;
setmetatable(v1, l_Limb_0);
v1.new = function(v2, v3, v4, v5, v6, v7, v8, v9) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: l_Limb_0 (copy), v1 (copy)
    local v10 = setmetatable(l_Limb_0.new(), v1);
    v10.UpperLimb = v2;
    v10.LowerLimb = v3;
    v10.LimbEnd = v4;
    v10.StartAttachment = v5;
    v10.LimbJointAttachment = v6;
    v10.LimbEndAttachment = v7;
    v10.LimbHoldAttachment = v8;
    v10.InvertBendDirection = false;
    v10.PreventDisconnection = v9 or false;
    return (setmetatable(v10, v1));
end;
v1.SolveJoint = function(v11, v12, v13, v14, v15) --[[ Line: 46 ]] --[[ Name: SolveJoint ]]
    local v16 = v12:PointToObjectSpace(v13);
    local l_Unit_0 = v16.Unit;
    local l_Magnitude_0 = v16.Magnitude;
    local v19 = Vector3.new(0, 0, -1, 0):Cross(l_Unit_0);
    if v19 == Vector3.new(0, 0, 0, 0) then
        v19 = __2021_if(function() return v16.Z < 0 end, function() return Vector3.new(0, 0, 0.0010000000474974513, 0) end, function() return Vector3.new(0, 0, -0.0010000000474974513, 0) end);
    end;
    local v20 = math.acos(-l_Unit_0.Z);
    local v21 = v12 * CFrame.fromAxisAngle(v19, v20);
    if l_Magnitude_0 < math.max(v15, v14) - math.min(v15, v14) then
        if v11.PreventDisconnection then
            return v21, -1.5707963267948966, 3.141592653589793;
        else
            return v21 * CFrame.new(0, 0, math.max(v15, v14) - math.min(v15, v14) - l_Magnitude_0), -1.5707963267948966, 3.141592653589793;
        end;
    elseif v14 + v15 < l_Magnitude_0 then
        if v11.PreventDisconnection then
            return v21, 1.5707963267948966, 0;
        else
            return v21 * CFrame.new(0, 0, v14 + v15 - l_Magnitude_0), 1.5707963267948966, 0;
        end;
    else
        local v22 = -math.acos((-(v15 * v15) + v14 * v14 + l_Magnitude_0 * l_Magnitude_0) / (v14 * 2 * l_Magnitude_0));
        local v23 = math.acos((v15 * v15 - v14 * v14 + l_Magnitude_0 * l_Magnitude_0) / (v15 * 2 * l_Magnitude_0));
        if v11.InvertBendDirection then
            v22 = -v22;
            v23 = -v23;
        end;
        return v21, v22 + 1.5707963267948966, v23 - v22;
    end;
end;
v1.RotationTo = function(_, v25, v26) --[[ Line: 93 ]] --[[ Name: RotationTo ]]
    local l_Position_0 = (v25:Inverse() * v26).Position;
    return CFrame.Angles(math.atan2(l_Position_0.Z, l_Position_0.Y), 0, -math.atan2(l_Position_0.X, l_Position_0.Y));
end;
v1.GetAppendageCFrames = function(v28, v29, v30) --[[ Line: 103 ]] --[[ Name: GetAppendageCFrames ]]
    local l_v28_AttachmentCFrame_0 = v28:GetAttachmentCFrame(v28.LimbEnd, v28.LimbHoldAttachment);
    local l_v28_AttachmentCFrame_1 = v28:GetAttachmentCFrame(v28.LimbEnd, v28.LimbEndAttachment);
    local l_v28_AttachmentCFrame_2 = v28:GetAttachmentCFrame(v28.UpperLimb, v28.StartAttachment);
    local l_v28_AttachmentCFrame_3 = v28:GetAttachmentCFrame(v28.UpperLimb, v28.LimbJointAttachment);
    local l_v28_AttachmentCFrame_4 = v28:GetAttachmentCFrame(v28.LowerLimb, v28.LimbJointAttachment);
    local l_v28_AttachmentCFrame_5 = v28:GetAttachmentCFrame(v28.LowerLimb, v28.LimbEndAttachment);
    local l_Magnitude_1 = (l_v28_AttachmentCFrame_2.Position - l_v28_AttachmentCFrame_3.Position).Magnitude;
    local l_Magnitude_2 = (l_v28_AttachmentCFrame_4.Position - l_v28_AttachmentCFrame_5.Position).Magnitude;
    local v39 = v30 * l_v28_AttachmentCFrame_0:Inverse() * l_v28_AttachmentCFrame_1;
    local v40, v41, v42 = v28:SolveJoint(v29, v39.Position, l_Magnitude_1, l_Magnitude_2);
    local v43 = v40 * CFrame.Angles(v41, 0, 0) * CFrame.new(0, -l_Magnitude_1, 0);
    local v44 = v43 * CFrame.Angles(v42, 0, 0);
    local v45 = v43 * v28:RotationTo(l_v28_AttachmentCFrame_3, l_v28_AttachmentCFrame_2):Inverse() * l_v28_AttachmentCFrame_3:Inverse();
    local v46 = v44 * v28:RotationTo(l_v28_AttachmentCFrame_5, l_v28_AttachmentCFrame_4):Inverse() * l_v28_AttachmentCFrame_4:Inverse();
    return v45, v46, CFrame.new((v46 * l_v28_AttachmentCFrame_5).Position) * (CFrame.new(-v39.Position) * v39) * l_v28_AttachmentCFrame_1:Inverse();
end;
return v1;