-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Limb_0 = require(script.Parent:WaitForChild("Limb"));
local l_JointOffset_0 = require(script.Parent:WaitForChild("JointOffset"));
local v2 = {
    Presets = {
        LeftArm = {
            "UpperTorso", 
            "LeftUpperArm", 
            "LeftLowerArm", 
            "LeftHand", 
            "LeftShoulder", 
            "LeftShoulderRigAttachment", 
            "LeftElbowRigAttachment", 
            "LeftWristRigAttachment", 
            "LeftGripAttachment"
        }, 
        RightArm = {
            "UpperTorso", 
            "RightUpperArm", 
            "RightLowerArm", 
            "RightHand", 
            "RightShoulder", 
            "RightShoulderRigAttachment", 
            "RightElbowRigAttachment", 
            "RightWristRigAttachment", 
            "RightGripAttachment"
        }, 
        LeftLeg = {
            "LowerTorso", 
            "LeftUpperLeg", 
            "LeftLowerLeg", 
            "LeftFoot", 
            "LeftHip", 
            "LeftHipRigAttachment", 
            "LeftKneeRigAttachment", 
            "LeftAnkleRigAttachment", 
            "LeftFootAttachment"
        }, 
        RightLeg = {
            "LowerTorso", 
            "RightUpperLeg", 
            "RightLowerLeg", 
            "RightFoot", 
            "RightHip", 
            "RightHipRigAttachment", 
            "RightKneeRigAttachment", 
            "RightAnkleRigAttachment", 
            "RightFootAttachment"
        }
    }, 
    ConstraintPresets = {
        LeftArm = {
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "UpperTorso", 
                    Attachment = "LeftShoulderRigAttachment", 
                    Offset = CFrame.Angles(0, 3.141592653589793, 0)
                }, 
                Attachment1 = {
                    Part = "LeftUpperArm", 
                    Attachment = "LeftShoulderRigAttachment", 
                    Offset = CFrame.Angles(0, 3.141592653589793, -1.5707963267948966)
                }, 
                Properties = {
                    Name = "LeftShoulderBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 110, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -85, 
                    TwistUpperAngle = 85
                }
            }, 
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "LeftUpperArm", 
                    Attachment = "LeftElbowRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "LeftLowerArm", 
                    Attachment = "LeftElbowRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "LeftElbowBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 20, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = 5, 
                    TwistUpperAngle = 120
                }
            }
        }, 
        RightArm = {
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "UpperTorso", 
                    Attachment = "RightShoulderRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "RightUpperArm", 
                    Attachment = "RightShoulderRigAttachment", 
                    Offset = CFrame.Angles(0, 0, -1.5707963267948966)
                }, 
                Properties = {
                    Name = "RightShoulderBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 110, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -85, 
                    TwistUpperAngle = 85
                }
            }, 
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "RightUpperArm", 
                    Attachment = "RightElbowRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "RightLowerArm", 
                    Attachment = "RightElbowRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "RightElbowBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 20, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = 5, 
                    TwistUpperAngle = 120
                }
            }
        }, 
        LeftLeg = {
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "LowerTorso", 
                    Attachment = "LeftHipRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "LeftUpperLeg", 
                    Attachment = "LeftHipRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "LeftHipBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 40, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -5, 
                    TwistUpperAngle = 80
                }
            }, 
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "LeftUpperLeg", 
                    Attachment = "LeftKneeRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "LeftLowerLeg", 
                    Attachment = "LeftKneeRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "LeftKneeBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 5, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -120, 
                    TwistUpperAngle = 5
                }
            }
        }, 
        RightLeg = {
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "LowerTorso", 
                    Attachment = "RightHipRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "RightUpperLeg", 
                    Attachment = "RightHipRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "RightHipBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 40, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -5, 
                    TwistUpperAngle = 80
                }
            }, 
            {
                Type = "BallSocketConstraint", 
                Attachment0 = {
                    Part = "RightUpperLeg", 
                    Attachment = "RightKneeRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Attachment1 = {
                    Part = "RightLowerLeg", 
                    Attachment = "RightKneeRigAttachment", 
                    Offset = CFrame.identity
                }, 
                Properties = {
                    Name = "RightKneeBallSocket", 
                    LimitsEnabled = true, 
                    UpperAngle = 5, 
                    TwistLimitsEnabled = true, 
                    TwistLowerAngle = -120, 
                    TwistUpperAngle = 5
                }
            }
        }
    }
};
v2.__index = v2;
setmetatable(v2, l_Limb_0);
v2.new = function(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14) --[[ Line: 256 ]] --[[ Name: new ]]
    -- upvalues: l_Limb_0 (copy), v2 (copy), l_JointOffset_0 (copy)
    local v15 = setmetatable(l_Limb_0.new(), v2);
    v15.RootPart = v4;
    v15.UpperLimb = v5;
    v15.LowerLimb = v6;
    v15.LimbEnd = v7;
    v15.StartJointOffset = l_JointOffset_0.new(v5:WaitForChild(v8), v4, v9);
    v15.StartAttachment = v9;
    v15.LimbJointAttachment = v10;
    v15.LimbEndAttachment = v11;
    v15.LimbHoldAttachment = v12;
    v15.AllowDisconnection = v13 or false;
    v15.Constraints = {};
    if (v12 == "LeftFootAttachment" or v12 == "RightFootAttachment") and not v7:FindFirstChild(v12) then
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = v12;
        l_Attachment_0.CFrame = CFrame.new(0, -v7.Size.Y / 2, 0);
        l_Attachment_0.Parent = v7;
        local l_Vector3Value_0 = Instance.new("Vector3Value");
        l_Vector3Value_0.Name = "OriginalPosition";
        l_Vector3Value_0.Value = l_Attachment_0.Position;
        l_Vector3Value_0.Parent = l_Attachment_0;
    end;
    if not v3:FindFirstChildOfClass("Animator") then
        Instance.new("Animator").Parent = v3;
    end;
    local l_Attachment_1 = Instance.new("Attachment");
    l_Attachment_1.Name = ("%*_%*_Attachment"):format(v5.Name, v6.Name);
    l_Attachment_1.Parent = v4;
    v15.IKControlAttachment = l_Attachment_1;
    local l_IKControl_0 = Instance.new("IKControl");
    l_IKControl_0.Name = ("%*_%*_IKControl"):format(v5.Name, v6.Name);
    l_IKControl_0.ChainRoot = v5;
    l_IKControl_0.EndEffector = v7;
    l_IKControl_0.Offset = v15:GetAttachmentCFrame(v7, v12):Inverse();
    l_IKControl_0.SmoothTime = v14 or 0;
    l_IKControl_0.Target = l_Attachment_1;
    l_IKControl_0.Parent = v3;
    v15.IKControl = l_IKControl_0;
    v15:MoveTo(v15:GetAttachmentCFrame(v5, v9):Inverse() * v15:GetAttachmentCFrame(v5, v10) * v15:GetAttachmentCFrame(v6, v10):Inverse() * v15:GetAttachmentCFrame(v6, v11) * v15:GetAttachmentCFrame(v7, v11):Inverse() * v15:GetAttachmentCFrame(v7, v12));
    return v15;
end;
v2.FromPreset = function(v20, v21, v22, v23) --[[ Line: 312 ]] --[[ Name: FromPreset ]]
    -- upvalues: v2 (copy)
    local v24 = v2.Presets[v20];
    local v25 = v2.new(v21:WaitForChild("Humanoid"), v21:WaitForChild(v24[1]), v21:WaitForChild(v24[2]), v21:WaitForChild(v24[3]), v21:WaitForChild(v24[4]), v24[5], v24[6], v24[7], v24[8], v24[9], v22, v23);
    v25:AddConstraints(v20, v21);
    return v25;
end;
v2.AddConstraints = function(v26, v27, v28) --[[ Line: 322 ]] --[[ Name: AddConstraints ]]
    -- upvalues: v2 (copy)
    for _, v30 in v2.ConstraintPresets[v27] do
        local v31 = v28:WaitForChild(v30.Attachment0.Part);
        local v32 = v28:WaitForChild(v30.Attachment1.Part);
        if not v32:FindFirstChildOfClass(v30.Type) then
            local v33 = v31:WaitForChild(v30.Attachment0.Attachment);
            if v30.Attachment0.Offset ~= CFrame.identity then
                local v34 = v33:Clone();
                v34.Name = "NexusAppendageConstraintOffset";
                v34.CFrame = v30.Attachment0.Offset;
                v34.Parent = v33;
                table.insert(v26.Constraints, v34);
                v33 = v34;
            end;
            local v35 = v32:WaitForChild(v30.Attachment1.Attachment);
            if v30.Attachment1.Offset ~= CFrame.identity then
                local v36 = v35:Clone();
                v36.Name = "NexusAppendageConstraintOffset";
                v36.CFrame = v30.Attachment1.Offset;
                v36.Parent = v35;
                table.insert(v26.Constraints, v36);
                v35 = v36;
            end;
            local v37 = Instance.new(v30.Type);
            for v38, v39 in v30.Properties do
                v37[v38] = v39;
            end;
            v37.Attachment0 = v33;
            v37.Attachment1 = v35;
            v37.Parent = v32;
            table.insert(v26.Constraints, v37);
        end;
    end;
end;
v2.Enable = function(v40) --[[ Line: 365 ]] --[[ Name: Enable ]]
    v40.IKControl.Weight = 1;
end;
v2.Disable = function(v41) --[[ Line: 372 ]] --[[ Name: Disable ]]
    v41.IKControl.Weight = 0;
end;
v2.SetTargetAttachment = function(v42, v43) --[[ Line: 380 ]] --[[ Name: SetTargetAttachment ]]
    v42.IKControl.Target = v43 or v42.IKControlAttachment;
end;
v2.SetSmoothTime = function(v44, v45) --[[ Line: 387 ]] --[[ Name: SetSmoothTime ]]
    v44.IKControl.SmoothTime = v45;
end;
v2.MoveTo = function(v46, v47, v48) --[[ Line: 395 ]] --[[ Name: MoveTo ]]
    local l_AttachmentCFrame_0 = v46.StartJointOffset.AttachmentCFrame;
    v46.StartJointOffset:SetProperty(v46.IKControlAttachment, "CFrame", l_AttachmentCFrame_0 * v47, v48);
    if not v46.AllowDisconnection then
        return;
    else
        local v50 = v47 * v46:GetAttachmentCFrame(v46.LimbEnd, v46.LimbHoldAttachment):Inverse() * v46:GetAttachmentCFrame(v46.LimbEnd, v46.LimbEndAttachment);
        local l_Magnitude_0 = (v46:GetAttachmentCFrame(v46.UpperLimb, v46.StartAttachment):Inverse() * v46:GetAttachmentCFrame(v46.UpperLimb, v46.LimbJointAttachment) * v46:GetAttachmentCFrame(v46.LowerLimb, v46.LimbJointAttachment):Inverse() * v46:GetAttachmentCFrame(v46.LowerLimb, v46.LimbEndAttachment)).Position.Magnitude;
        local l_Magnitude_1 = v50.Position.Magnitude;
        if l_Magnitude_0 < l_Magnitude_1 then
            v46.StartJointOffset:SetOffset(CFrame.new(CFrame.new(Vector3.new(0, 0, 0, 0), v50.Position).LookVector * (l_Magnitude_1 - l_Magnitude_0)), v48);
            return;
        else
            v46.StartJointOffset:SetOffset(CFrame.identity, v48);
            return;
        end;
    end;
end;
v2.MoveToWorld = function(v53, v54, _) --[[ Line: 415 ]] --[[ Name: MoveToWorld ]]
    v53:MoveTo((v53.RootPart.CFrame * v53.StartJointOffset.AttachmentCFrame):Inverse() * v54);
end;
v2.Destroy = function(v56) --[[ Line: 423 ]] --[[ Name: Destroy ]]
    v56.StartJointOffset:Destroy();
    v56.IKControlAttachment:Destroy();
    v56.IKControl:Destroy();
    for _, v58 in v56.Constraints do
        v58:Destroy();
    end;
end;
return v2;