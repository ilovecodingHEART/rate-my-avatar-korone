-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x1, compound-assign x0, shims: __2021_freeze
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
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Shared_0 = game:GetService("ReplicatedStorage").Slerp.Shared;
local v1 = require(l_Shared_0.ChassisCore);
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v4 = {};
local function _(v5, v6, v7) --[[ Line: 19 ]] --[[ Name: getForceForGravity ]]
    return v5 * v6 * (1 - v7 / v6);
end;
v4.getDragForce = function(v9) --[[ Line: 23 ]] --[[ Name: getDragForce ]]
    local l_AssemblyLinearVelocity_0 = v9.chassisPart.AssemblyLinearVelocity;
    local l_dragCoeff_0 = v9.dragCoeff;
    return v1.getDragForce(l_AssemblyLinearVelocity_0, l_dragCoeff_0);
end;
v4.getRollingResistanceForce = function(v12) --[[ Line: 31 ]] --[[ Name: getRollingResistanceForce ]]
    local l_AssemblyLinearVelocity_1 = v12.chassisPart.AssemblyLinearVelocity;
    local l_rollingResistanceCoeff_0 = v12.rollingResistanceCoeff;
    if v12.chassisPart.AssemblyLinearVelocity.Magnitude < 4 then
        l_rollingResistanceCoeff_0 = l_rollingResistanceCoeff_0 * 100;
    end;
    return v1.getRollingResistanceForce(l_AssemblyLinearVelocity_1, l_rollingResistanceCoeff_0);
end;
v4.getLateralFriction = function(v15) --[[ Line: 43 ]] --[[ Name: getLateralFriction ]]
    local l_chassisPart_0 = v15.chassisPart;
    local l_AssemblyLinearVelocity_2 = l_chassisPart_0.AssemblyLinearVelocity;
    local l_CFrame_0 = l_chassisPart_0.CFrame;
    local v19 = l_CFrame_0:VectorToObjectSpace(l_AssemblyLinearVelocity_2);
    return l_CFrame_0.RightVector * v19.X * -l_chassisPart_0.AssemblyMass * v15.targetGravity * 1;
end;
v4.getWheelRaycastDistance = function(v20, v21, v22) --[[ Line: 52 ]] --[[ Name: getWheelRaycastDistance ]]
    local l_suspensionSpringTargetHeight_0 = v21.suspensionSpringTargetHeight;
    local l_suspensionSpringAttachment_0 = v21.suspensionSpringAttachment;
    local v25 = workspace:Raycast(l_suspensionSpringAttachment_0.WorldPosition, -v20.CFrame.UpVector * l_suspensionSpringTargetHeight_0, v22);
    if v25 then
        return v25.Distance;
    else
        return l_suspensionSpringTargetHeight_0;
    end;
end;
v4.getWheelRaycastResult = function(v26, v27, v28) --[[ Line: 68 ]] --[[ Name: getWheelRaycastResult ]]
    local l_suspensionSpringTargetHeight_1 = v27.suspensionSpringTargetHeight;
    local l_suspensionSpringAttachment_1 = v27.suspensionSpringAttachment;
    return workspace:Raycast(l_suspensionSpringAttachment_1.WorldPosition, -v26.CFrame.UpVector * l_suspensionSpringTargetHeight_1, v28);
end;
v4.getForceToReachGravity = function(v31, v32, v33) --[[ Line: 79 ]] --[[ Name: getForceToReachGravity ]]
    return v33 * (v32 - v31);
end;
v4.getWheelCF = function(v34, _) --[[ Line: 83 ]] --[[ Name: getWheelCF ]]
    return v34;
end;
local function v38(v36, v37) --[[ Line: 87 ]] --[[ Name: getVelocityAtPoint ]]
    return v36.AssemblyLinearVelocity + v36.AssemblyAngularVelocity:Cross(v37 - v36.Position);
end;
v4.getWheelFriction = function(v39, v40, v41) --[[ Line: 91 ]] --[[ Name: getWheelFriction ]]
    local l_Position_0 = v40.Position;
    local v43 = v39.AssemblyLinearVelocity + v39.AssemblyAngularVelocity:Cross(l_Position_0 - v39.Position);
    l_Position_0 = v40.LookVector:Dot(v43);
    local v44 = v40.RightVector:Dot(v43);
    return -v40.RightVector * v44 * v41;
end;
v4.getVelocityAtPoint = v38;
v4.getWheelForce = function(v45, v46, v47, v48, _) --[[ Line: 100 ]] --[[ Name: getWheelForce ]]
    local _ = v46.suspensionSpringAttachment;
    local l_UpVector_0 = v45.CFrame.UpVector;
    local _ = l_UpVector_0:Dot(-Vector3.yAxis);
    local v53 = nil;
    v53 = Vector3.zero;
    local v54 = v48.Magnitude / l_UpVector_0:Dot(Vector3.yAxis);
    local v55 = l_UpVector_0:Angle(Vector3.yAxis);
    local _ = (v54 * -Vector3.yAxis):Dot(-l_UpVector_0.Unit);
    local v57 = v54 * math.cos(v55);
    v57 = v45.AssemblyMass * 100 * 0.1275;
    local v58 = v45.AssemblyMass * 100 * 0.1275 * -Vector3.yAxis;
    local l_AssemblyCenterOfMass_0 = v45.AssemblyCenterOfMass;
    local v60 = v46.vectorForce.Attachment0.Position - l_AssemblyCenterOfMass_0;
    v54 = (v45.AssemblyMass * 100 * -Vector3.yAxis):Dot(v60);
    local _ = v48:Dot(Vector3.yAxis);
    local v62 = v58 - -v48;
    local v63 = v48.Magnitude / l_UpVector_0.Y;
    v62 = Vector3.zero;
    v63 = v54;
    v63 = v45.AssemblyMass * 100 * 0.25;
    local v64 = v46.suspensionVectorForce.Attachment0.WorldPosition - v45.AssemblyCenterOfMass;
    if v46.tot then
        local _ = (v46.tot - v64.Magnitude) / v46.tot * (v45.AssemblyMass * 100);
    end;
    if v63 and v63 > 0 and v63 < v45.AssemblyMass * 100 * 0.3 * 100 then
        v58 = v63 * -Vector3.yAxis;
        v62 = v58 - l_UpVector_0:Dot(v58) * l_UpVector_0;
    end;
    v53 = __2021_if(function() return v62.Magnitude > 0 end, function() return v62 end, function() return Vector3.zero end);
    if game:GetService("RunService"):IsClient() then
        local _ = v46.suspensionVectorForce.Attachment0.WorldPosition - v45.AssemblyCenterOfMass;
    end;
    local _ = v45.CFrame.RightVector:Dot(v53);
    local _ = v45.CFrame.LookVector:Dot(v53);
    local l_Position_1 = v47.Position;
    local v70 = v45.AssemblyLinearVelocity + v45.AssemblyAngularVelocity:Cross(l_Position_1 - v45.Position);
    l_Position_1 = v47.LookVector:Dot(v70);
    local v71 = v47.RightVector:Dot(v70);
    v46.vectorForceAttachment.WorldCFrame = v47;
    if v45.AssemblyLinearVelocity.Magnitude < 1 then
        l_Position_1 = l_Position_1 * 10;
    end;
    return -v47.RightVector * v71 * v46.currentLateralResistance + -v47.LookVector * l_Position_1 * v46.currentLongitudinalResistance - v53;
end;
local _ = Vector3.new;
local l_zero_0 = Vector3.zero;
v4.getWheelSuspensionForce = function(v74, v75, v76) --[[ Line: 210 ]] --[[ Name: getWheelSuspensionForce ]]
    local v77 = v75.suspensionSpringTargetHeight - v76;
    if v77 == 0 then
        return l_zero_0;
    else
        local l_suspensionSpringForceFactor_0 = v75.suspensionSpringForceFactor;
        local l_suspensionSpringDamping_0 = v75.suspensionSpringDamping;
        local l_suspensionSpringAttachment_3 = v75.suspensionSpringAttachment;
        local l_WorldPosition_0 = l_suspensionSpringAttachment_3.WorldPosition;
        local v82 = v74.AssemblyLinearVelocity + v74.AssemblyAngularVelocity:Cross(l_WorldPosition_0 - v74.Position);
        l_WorldPosition_0 = l_suspensionSpringAttachment_3.WorldCFrame:VectorToObjectSpace(v82);
        local v83 = v1.getSuspensionDampingSubtrahend(l_suspensionSpringDamping_0, l_WorldPosition_0.Y);
        return v74.CFrame.UpVector * v1.getSuspensionForce(v77, l_suspensionSpringForceFactor_0, v83);
    end;
end;
v4.simulate = function(v84, v85) --[[ Line: 227 ]] --[[ Name: simulate ]]
    local l_chassisPart_1 = v84.chassisPart;
    local l_AssemblyLinearVelocity_3 = l_chassisPart_1.AssemblyLinearVelocity;
    local l_CFrame_1 = l_chassisPart_1.CFrame;
    local l_dragCoeff_1 = v84.dragCoeff;
    local l_rollingResistanceCoeff_1 = v84.rollingResistanceCoeff;
    local v91 = v1.getDragForce(l_AssemblyLinearVelocity_3, l_dragCoeff_1) * 700;
    local v92 = v1.getRollingResistanceForce(l_AssemblyLinearVelocity_3, l_rollingResistanceCoeff_1) * 700;
    local v93 = l_CFrame_1:VectorToObjectSpace(l_AssemblyLinearVelocity_3);
    local v94 = l_CFrame_1.RightVector * v93.X * -5000000;
    local v95 = -l_CFrame_1.UpVector;
    local v96 = true;
    for _, v98 in pairs(v84.wheelRecords) --[[ 2021 ]] do
        local l_suspensionSpringForceFactor_1 = v98.suspensionSpringForceFactor;
        local l_suspensionSpringDamping_1 = v98.suspensionSpringDamping;
        local l_suspensionSpringTargetHeight_2 = v98.suspensionSpringTargetHeight;
        local l_suspensionSpringAttachment_4 = v98.suspensionSpringAttachment;
        local l_l_chassisPart_1_VelocityAtPosition_0 = l_chassisPart_1:GetVelocityAtPosition(l_suspensionSpringAttachment_4.WorldPosition);
        local v104 = l_suspensionSpringAttachment_4.WorldCFrame:VectorToObjectSpace(l_l_chassisPart_1_VelocityAtPosition_0);
        local v105 = v1.getSuspensionDampingSubtrahend(l_suspensionSpringDamping_1, v104.Y);
        local _ = v98.wheelRadius;
        local l_WorldPosition_1 = l_suspensionSpringAttachment_4.WorldPosition;
        local v108 = workspace:Raycast(l_WorldPosition_1, v95 * l_suspensionSpringTargetHeight_2, v85);
        local v109 = nil;
        if v108 then
            v109 = v108.Distance;
            v98.vectorForce.Force = l_CFrame_1.UpVector * v1.getSuspensionForce(l_suspensionSpringTargetHeight_2, v109, l_suspensionSpringForceFactor_1, v105);
        else
            v109 = l_suspensionSpringTargetHeight_2;
            v96 = false;
            v98.vectorForce.Force = Vector3.zero;
        end;
    end;
    local l_driveVectorForce_0 = v84.driveVectorForce;
    local _ = l_CFrame_1.LookVector;
    local _ = l_CFrame_1.Position;
    if v96 then
        local l_yAxis_0 = Vector3.yAxis;
        local l_AssemblyMass_0 = l_chassisPart_1.AssemblyMass;
        local l_Gravity_0 = workspace.Gravity;
        local v116 = l_yAxis_0 * (l_AssemblyMass_0 * l_Gravity_0 * (1 - 35 / l_Gravity_0));
        l_driveVectorForce_0.Force = v91 + v92 + v94 + v116;
        l_yAxis_0 = l_CFrame_1:VectorToObjectSpace(l_chassisPart_1.AssemblyAngularVelocity);
        v84.angularVelocity.AngularVelocity = Vector3.new(l_yAxis_0.X, v84.angularVelocity.AngularVelocity.Y, l_yAxis_0.Z);
        v84.angularVelocity.MaxTorque = l_chassisPart_1.AssemblyMass * 300;
        return;
    else
        l_driveVectorForce_0.Force = Vector3.zero;
        v84.angularVelocity.MaxTorque = 0;
        return;
    end;
end;
v4.simulate2 = function(v117, v118, v119) --[[ Line: 286 ]] --[[ Name: simulate2 ]]
    local l_chassisPart_2 = v117.chassisPart;
    local l_AssemblyLinearVelocity_4 = l_chassisPart_2.AssemblyLinearVelocity;
    local l_CFrame_2 = l_chassisPart_2.CFrame;
    local l_dragCoeff_2 = v117.dragCoeff;
    local l_rollingResistanceCoeff_2 = v117.rollingResistanceCoeff;
    local v125 = v1.getDragForce(l_AssemblyLinearVelocity_4, l_dragCoeff_2) * 10000;
    local v126 = v1.getRollingResistanceForce(l_AssemblyLinearVelocity_4, l_rollingResistanceCoeff_2) * 10000;
    local v127 = v1.getRollingResistanceForce(l_chassisPart_2.AssemblyAngularVelocity, 800000) + v1.getDragForce(l_chassisPart_2.AssemblyAngularVelocity, 800000);
    local v128 = l_CFrame_2:VectorToObjectSpace(l_AssemblyLinearVelocity_4);
    local v129 = l_CFrame_2.RightVector * -v128.X * 15000;
    local _ = v119.wheelForces;
    local v131 = -l_CFrame_2.UpVector;
    local v132 = true;
    for _, v134 in pairs(v117.wheelRecords) --[[ 2021 ]] do
        local l_suspensionSpringForceFactor_2 = v134.suspensionSpringForceFactor;
        local l_suspensionSpringDamping_2 = v134.suspensionSpringDamping;
        local l_suspensionSpringTargetHeight_3 = v134.suspensionSpringTargetHeight;
        local l_suspensionSpringAttachment_5 = v134.suspensionSpringAttachment;
        local l_l_chassisPart_2_VelocityAtPosition_0 = l_chassisPart_2:GetVelocityAtPosition(l_suspensionSpringAttachment_5.WorldPosition);
        local v140 = l_suspensionSpringAttachment_5.WorldCFrame:VectorToObjectSpace(l_l_chassisPart_2_VelocityAtPosition_0);
        local v141 = v1.getSuspensionDampingSubtrahend(l_suspensionSpringDamping_2, v140.Y);
        local l_wheelRadius_1 = v134.wheelRadius;
        local v143 = workspace:Spherecast(l_suspensionSpringAttachment_5.WorldPosition, l_wheelRadius_1, v131 * l_suspensionSpringTargetHeight_3, v118);
        if v143 then
            local l_Distance_0 = v143.Distance;
            v134.vectorForce.Force = l_CFrame_2.UpVector * v1.getSuspensionForce(l_suspensionSpringTargetHeight_3, l_Distance_0, l_suspensionSpringForceFactor_2, v141);
        else
            v132 = false;
            v134.vectorForce.Force = Vector3.zero;
        end;
    end;
    local l_driveVectorForce_1 = v117.driveVectorForce;
    if v132 then
        local v146 = l_CFrame_2.LookVector * 0;
        l_driveVectorForce_1.Force = v125 + v126 + v129 + v146;
        v117.torque.Torque = v127;
        return;
    else
        l_driveVectorForce_1.Force = Vector3.zero;
        v117.torque.Torque = Vector3.zero;
        return;
    end;
end;
__2021_freeze(v4);
return v4;