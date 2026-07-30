-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent;
local l_Head_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Head"));
local l_Torso_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Torso"));
local l_Appendage_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Appendage"));
local l_FootPlanter_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("FootPlanter"));
local v8 = require(l_Parent_0:WaitForChild("State"):WaitForChild("EnigmaService")).GetInstance();
local v9 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v10 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
local l_NexusAppendage_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusAppendage"));
local l_UpdateInputs_0 = l_Parent_0:WaitForChild("UpdateInputs");
local l_Appendage_1 = l_NexusAppendage_0.Appendage;
local v14 = {};
v14.__index = v14;
v14.new = function(v15) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: l_Players_0 (copy), v9 (copy), v14 (copy), l_VRService_0 (copy), v10 (copy), l_UpdateInputs_0 (copy)
    local v16 = setmetatable({
        CharacterModel = v15, 
        TweenComponents = v15 ~= l_Players_0.LocalPlayer.Character, 
        UseIKControl = v9:GetSetting("Extra.TEMPORARY_UseIKControl")
    }, v14);
    local v17 = false;
    if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character == v15 then
        if v9:GetSetting("Appearance.LocalAllowArmDisconnection") == false then
            v17 = true;
        end;
    elseif v9:GetSetting("Appearance.NonLocalAllowArmDisconnection") == false then
        v17 = true;
    end;
    v16.Humanoid = v15:WaitForChild("Humanoid");
    v16.CurrentWalkspeed = 0;
    v16.Humanoid.Running:Connect(function(v18) --[[ Line: 83 ]]
        -- upvalues: l_VRService_0 (ref), v10 (ref), v16 (copy)
        if l_VRService_0.AvatarGestures and v10:GetThumbstickPosition(Enum.KeyCode.Thumbstick1).Magnitude < 0.2 then
            v18 = 0;
        end;
        v16.CurrentWalkspeed = v18;
    end);
    v16.PreventArmDisconnection = v17;
    v16:SetUpVRParts();
    v16.AppearanceChangedConnection = nil;
    v16:SetUpAppearanceChanged();
    v16.CurrentMotor6DTransforms = {};
    v16.LastMotor6DTransforms = {};
    v16.LastRefreshTime = tick();
    if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character == v15 then
        task.spawn(function() --[[ Line: 104 ]]
            -- upvalues: v16 (copy), l_VRService_0 (ref), l_UpdateInputs_0 (ref)
            while v16.Humanoid.Health > 0 do
                local l_ReplicationCFrames_0 = v16.ReplicationCFrames;
                local l_ReplicationTrackerData_0 = v16.ReplicationTrackerData;
                if l_ReplicationCFrames_0 and v16.LastReplicationCFrames ~= l_ReplicationCFrames_0 and v16.LastReplicationTrackerData ~= l_ReplicationTrackerData_0 then
                    v16.LastReplicationCFrames = l_ReplicationCFrames_0;
                    v16.LastReplicationTrackerData = l_ReplicationTrackerData_0;
                    local v21 = {
                        UpdateTime = tick(), 
                        CurrentWalkspeed = v16.CurrentWalkspeed, 
                        LeftFootCFrame = l_ReplicationTrackerData_0 and l_ReplicationTrackerData_0.LeftFoot, 
                        RightFootCFrame = l_ReplicationTrackerData_0 and l_ReplicationTrackerData_0.RightFoot
                    };
                    if not l_VRService_0.AvatarGestures then
                        v21.HeadCFrame = l_ReplicationCFrames_0.HeadCFrame;
                        v21.LeftHandCFrame = l_ReplicationCFrames_0.LeftHandCFrame;
                        v21.RightHandCFrame = l_ReplicationCFrames_0.RightHandCFrame;
                    end;
                    l_UpdateInputs_0:FireServer(v21);
                end;
                task.wait(0.03333333333333333);
            end;
        end);
    end;
    return v16;
end;
v14.SetUpVRParts = function(v22) --[[ Line: 139 ]] --[[ Name: SetUpVRParts ]]
    -- upvalues: l_Head_0 (copy), l_Torso_0 (copy), l_Appendage_1 (copy), l_Appendage_0 (copy), l_FootPlanter_0 (copy)
    local l_CharacterModel_0 = v22.CharacterModel;
    local l_PreventArmDisconnection_0 = v22.PreventArmDisconnection;
    v22.Parts = {
        Head = l_CharacterModel_0:WaitForChild("Head"), 
        UpperTorso = l_CharacterModel_0:WaitForChild("UpperTorso"), 
        LowerTorso = l_CharacterModel_0:WaitForChild("LowerTorso"), 
        HumanoidRootPart = l_CharacterModel_0:WaitForChild("HumanoidRootPart"), 
        RightUpperArm = l_CharacterModel_0:WaitForChild("RightUpperArm"), 
        RightLowerArm = l_CharacterModel_0:WaitForChild("RightLowerArm"), 
        RightHand = l_CharacterModel_0:WaitForChild("RightHand"), 
        LeftUpperArm = l_CharacterModel_0:WaitForChild("LeftUpperArm"), 
        LeftLowerArm = l_CharacterModel_0:WaitForChild("LeftLowerArm"), 
        LeftHand = l_CharacterModel_0:WaitForChild("LeftHand"), 
        RightUpperLeg = l_CharacterModel_0:WaitForChild("RightUpperLeg"), 
        RightLowerLeg = l_CharacterModel_0:WaitForChild("RightLowerLeg"), 
        RightFoot = l_CharacterModel_0:WaitForChild("RightFoot"), 
        LeftUpperLeg = l_CharacterModel_0:WaitForChild("LeftUpperLeg"), 
        LeftLowerLeg = l_CharacterModel_0:WaitForChild("LeftLowerLeg"), 
        LeftFoot = l_CharacterModel_0:WaitForChild("LeftFoot")
    };
    v22.Motors = {
        Neck = v22.Parts.Head:WaitForChild("Neck"), 
        Waist = v22.Parts.UpperTorso:WaitForChild("Waist"), 
        Root = v22.Parts.LowerTorso:WaitForChild("Root"), 
        RightShoulder = v22.Parts.RightUpperArm:WaitForChild("RightShoulder"), 
        RightElbow = v22.Parts.RightLowerArm:WaitForChild("RightElbow"), 
        RightWrist = v22.Parts.RightHand:WaitForChild("RightWrist"), 
        LeftShoulder = v22.Parts.LeftUpperArm:WaitForChild("LeftShoulder"), 
        LeftElbow = v22.Parts.LeftLowerArm:WaitForChild("LeftElbow"), 
        LeftWrist = v22.Parts.LeftHand:WaitForChild("LeftWrist"), 
        RightHip = v22.Parts.RightUpperLeg:WaitForChild("RightHip"), 
        RightKnee = v22.Parts.RightLowerLeg:WaitForChild("RightKnee"), 
        RightAnkle = v22.Parts.RightFoot:WaitForChild("RightAnkle"), 
        LeftHip = v22.Parts.LeftUpperLeg:WaitForChild("LeftHip"), 
        LeftKnee = v22.Parts.LeftLowerLeg:WaitForChild("LeftKnee"), 
        LeftAnkle = v22.Parts.LeftFoot:WaitForChild("LeftAnkle")
    };
    v22.Attachments = {
        Head = {
            NeckRigAttachment = v22.Parts.Head:WaitForChild("NeckRigAttachment")
        }, 
        UpperTorso = {
            NeckRigAttachment = v22.Parts.UpperTorso:WaitForChild("NeckRigAttachment"), 
            LeftShoulderRigAttachment = v22.Parts.UpperTorso:WaitForChild("LeftShoulderRigAttachment"), 
            RightShoulderRigAttachment = v22.Parts.UpperTorso:WaitForChild("RightShoulderRigAttachment"), 
            WaistRigAttachment = v22.Parts.UpperTorso:WaitForChild("WaistRigAttachment")
        }, 
        LowerTorso = {
            WaistRigAttachment = v22.Parts.LowerTorso:WaitForChild("WaistRigAttachment"), 
            LeftHipRigAttachment = v22.Parts.LowerTorso:WaitForChild("LeftHipRigAttachment"), 
            RightHipRigAttachment = v22.Parts.LowerTorso:WaitForChild("RightHipRigAttachment"), 
            RootRigAttachment = v22.Parts.LowerTorso:WaitForChild("RootRigAttachment")
        }, 
        HumanoidRootPart = {
            RootRigAttachment = v22.Parts.HumanoidRootPart:WaitForChild("RootRigAttachment")
        }, 
        RightUpperArm = {
            RightShoulderRigAttachment = v22.Parts.RightUpperArm:WaitForChild("RightShoulderRigAttachment"), 
            RightElbowRigAttachment = v22.Parts.RightUpperArm:WaitForChild("RightElbowRigAttachment")
        }, 
        RightLowerArm = {
            RightElbowRigAttachment = v22.Parts.RightLowerArm:WaitForChild("RightElbowRigAttachment"), 
            RightWristRigAttachment = v22.Parts.RightLowerArm:WaitForChild("RightWristRigAttachment")
        }, 
        RightHand = {
            RightWristRigAttachment = v22.Parts.RightHand:WaitForChild("RightWristRigAttachment")
        }, 
        LeftUpperArm = {
            LeftShoulderRigAttachment = v22.Parts.LeftUpperArm:WaitForChild("LeftShoulderRigAttachment"), 
            LeftElbowRigAttachment = v22.Parts.LeftUpperArm:WaitForChild("LeftElbowRigAttachment")
        }, 
        LeftLowerArm = {
            LeftElbowRigAttachment = v22.Parts.LeftLowerArm:WaitForChild("LeftElbowRigAttachment"), 
            LeftWristRigAttachment = v22.Parts.LeftLowerArm:WaitForChild("LeftWristRigAttachment")
        }, 
        LeftHand = {
            LeftWristRigAttachment = v22.Parts.LeftHand:WaitForChild("LeftWristRigAttachment")
        }, 
        RightUpperLeg = {
            RightHipRigAttachment = v22.Parts.RightUpperLeg:WaitForChild("RightHipRigAttachment"), 
            RightKneeRigAttachment = v22.Parts.RightUpperLeg:WaitForChild("RightKneeRigAttachment")
        }, 
        RightLowerLeg = {
            RightKneeRigAttachment = v22.Parts.RightLowerLeg:WaitForChild("RightKneeRigAttachment"), 
            RightAnkleRigAttachment = v22.Parts.RightLowerLeg:WaitForChild("RightAnkleRigAttachment")
        }, 
        RightFoot = {
            RightAnkleRigAttachment = v22.Parts.RightFoot:WaitForChild("RightAnkleRigAttachment"), 
            RightFootAttachment = v22.Parts.RightFoot:FindFirstChild("RightFootAttachment")
        }, 
        LeftUpperLeg = {
            LeftHipRigAttachment = v22.Parts.LeftUpperLeg:WaitForChild("LeftHipRigAttachment"), 
            LeftKneeRigAttachment = v22.Parts.LeftUpperLeg:WaitForChild("LeftKneeRigAttachment")
        }, 
        LeftLowerLeg = {
            LeftKneeRigAttachment = v22.Parts.LeftLowerLeg:WaitForChild("LeftKneeRigAttachment"), 
            LeftAnkleRigAttachment = v22.Parts.LeftLowerLeg:WaitForChild("LeftAnkleRigAttachment")
        }, 
        LeftFoot = {
            LeftAnkleRigAttachment = v22.Parts.LeftFoot:WaitForChild("LeftAnkleRigAttachment"), 
            LeftFootAttachment = v22.Parts.LeftFoot:FindFirstChild("LeftFootAttachment")
        }
    };
    if not v22.Motors.Neck:IsA("Motor6D") then
        v22.UseIKControl = true;
    end;
    if not v22.Attachments.RightFoot.RightFootAttachment then
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Position = Vector3.new(0, -v22.Parts.RightFoot.Size.Y / 2, 0);
        l_Attachment_0.Name = "RightFootAttachment";
        local l_Vector3Value_0 = Instance.new("Vector3Value");
        l_Vector3Value_0.Name = "OriginalPosition";
        l_Vector3Value_0.Value = l_Attachment_0.Position;
        l_Vector3Value_0.Parent = l_Attachment_0;
        l_Attachment_0.Parent = v22.Parts.RightFoot;
        v22.Attachments.RightFoot.RightFootAttachment = l_Attachment_0;
    end;
    if not v22.Attachments.LeftFoot.LeftFootAttachment then
        local l_Attachment_1 = Instance.new("Attachment");
        l_Attachment_1.Position = Vector3.new(0, -v22.Parts.LeftFoot.Size.Y / 2, 0);
        l_Attachment_1.Name = "LeftFootAttachment";
        local l_Vector3Value_1 = Instance.new("Vector3Value");
        l_Vector3Value_1.Name = "OriginalPosition";
        l_Vector3Value_1.Value = l_Attachment_1.Position;
        l_Vector3Value_1.Parent = l_Attachment_1;
        l_Attachment_1.Parent = v22.Parts.LeftFoot;
        v22.Attachments.LeftFoot.LeftFootAttachment = l_Attachment_1;
    end;
    v22.Head = l_Head_0.new(v22.Parts.Head);
    v22.Torso = l_Torso_0.new(v22.Parts.LowerTorso, v22.Parts.UpperTorso);
    if v22.UseIKControl then
        v22.LeftArm = l_Appendage_1.FromPreset("LeftArm", l_CharacterModel_0, not l_PreventArmDisconnection_0, v22.TweenComponents and 0.1 or 0);
        v22.RightArm = l_Appendage_1.FromPreset("RightArm", l_CharacterModel_0, not l_PreventArmDisconnection_0, v22.TweenComponents and 0.1 or 0);
        v22.LeftLeg = l_Appendage_1.FromPreset("LeftLeg", l_CharacterModel_0, false, v22.TweenComponents and 0.1 or 0);
        v22.RightLeg = l_Appendage_1.FromPreset("RightLeg", l_CharacterModel_0, false, v22.TweenComponents and 0.1 or 0);
    else
        local v29 = l_Appendage_0.new(l_CharacterModel_0:WaitForChild("LeftUpperArm"), l_CharacterModel_0:WaitForChild("LeftLowerArm"), l_CharacterModel_0:WaitForChild("LeftHand"), "LeftShoulderRigAttachment", "LeftElbowRigAttachment", "LeftWristRigAttachment", "LeftGripAttachment", l_PreventArmDisconnection_0);
        local v30 = l_Appendage_0.new(l_CharacterModel_0:WaitForChild("RightUpperArm"), l_CharacterModel_0:WaitForChild("RightLowerArm"), l_CharacterModel_0:WaitForChild("RightHand"), "RightShoulderRigAttachment", "RightElbowRigAttachment", "RightWristRigAttachment", "RightGripAttachment", l_PreventArmDisconnection_0);
        local v31 = l_Appendage_0.new(l_CharacterModel_0:WaitForChild("LeftUpperLeg"), l_CharacterModel_0:WaitForChild("LeftLowerLeg"), l_CharacterModel_0:WaitForChild("LeftFoot"), "LeftHipRigAttachment", "LeftKneeRigAttachment", "LeftAnkleRigAttachment", "LeftFootAttachment", true);
        v31.InvertBendDirection = true;
        local v32 = l_Appendage_0.new(l_CharacterModel_0:WaitForChild("RightUpperLeg"), l_CharacterModel_0:WaitForChild("RightLowerLeg"), l_CharacterModel_0:WaitForChild("RightFoot"), "RightHipRigAttachment", "RightKneeRigAttachment", "RightAnkleRigAttachment", "RightFootAttachment", true);
        v32.InvertBendDirection = true;
        v22.LeftArm = v29;
        v22.RightArm = v30;
        v22.LeftLeg = v31;
        v22.RightLeg = v32;
    end;
    v22.FootPlanter = l_FootPlanter_0:CreateSolver(l_CharacterModel_0:WaitForChild("LowerTorso"), v22.Humanoid:FindFirstChild("BodyHeightScale"));
end;
v14.SetUpAppearanceChanged = function(v33) --[[ Line: 303 ]] --[[ Name: SetUpAppearanceChanged ]]
    local l_Humanoid_0 = v33.CharacterModel:WaitForChild("Humanoid");
    if v33.AppearanceChangedConnection then
        v33.AppearanceChangedConnection:Disconnect();
        v33.AppearanceChangedConnection = nil;
    end;
    v33.AppearanceChangedConnection = l_Humanoid_0.ChildAdded:Connect(function(v35) --[[ Line: 313 ]]
        -- upvalues: v33 (copy)
        if v35:IsA("HumanoidDescription") then
            v33:SetUpVRParts();
        end;
    end);
end;
v14.GetHumanoidScale = function(v36, v37) --[[ Line: 326 ]] --[[ Name: GetHumanoidScale ]]
    local l_FirstChild_0 = v36.Humanoid:FindFirstChild(v37);
    if l_FirstChild_0 then
        return l_FirstChild_0.Value;
    elseif v37 == "BodyTypeScale" then
        return 0;
    else
        return 1;
    end;
end;
v14.GetHumanoidSeatPart = function(v39) --[[ Line: 340 ]] --[[ Name: GetHumanoidSeatPart ]]
    if not v39.Humanoid.Sit then
        return nil;
    elseif v39.Humanoid.SeatPart then
        return v39.Humanoid.SeatPart;
    else
        for _, v41 in v39.Parts.HumanoidRootPart:GetConnectedParts() do
            if v41:IsA("Seat") or v41:IsA("VehicleSeat") then
                return v41;
            end;
        end;
        return nil;
    end;
end;
v14.SetCFrameProperty = function(v42, v43, v44, v45) --[[ Line: 366 ]] --[[ Name: SetCFrameProperty ]]
    -- upvalues: l_TweenService_0 (copy)
    if v42.TweenComponents and v44 ~= "Transform" then
        l_TweenService_0:Create(v43, TweenInfo.new(0.03333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            [v44] = v45
        }):Play();
    else
        v43[v44] = v45;
    end;
    if v44 == "Transform" then
        v42.CurrentMotor6DTransforms[v43] = v45;
    end;
end;
v14.SetTransform = function(v46, v47, v48, v49, v50, v51, v52) --[[ Line: 386 ]] --[[ Name: SetTransform ]]
    v46:SetCFrameProperty(v46.Motors[v47], "Transform", (v51 * v46.Attachments[v49][v48].CFrame):Inverse() * (v52 * v46.Attachments[v50][v48].CFrame));
end;
v14.RefreshCharacter = function(v53) --[[ Line: 394 ]] --[[ Name: RefreshCharacter ]]
    if v53.TweenComponents then
        local v54 = math.min((tick() - v53.LastRefreshTime) / 0.03333333333333333, 1);
        for v55, v56 in v53.CurrentMotor6DTransforms do
            local v57 = v53.LastMotor6DTransforms[v55];
            if v57 then
                v55.Transform = v57:Lerp(v56, v54);
            else
                v55.Transform = v56;
            end;
        end;
        return;
    else
        for v58, v59 in v53.CurrentMotor6DTransforms do
            v58.Transform = v59;
        end;
        return;
    end;
end;
v14.UpdateFromInputs = function(v60, v61, v62, v63, v64, v65) --[[ Line: 416 ]] --[[ Name: UpdateFromInputs ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), l_VRService_0 (copy)
    if v60.Humanoid.Health <= 0 then
        return;
    elseif v60:GetHumanoidSeatPart() then
        v60:UpdateFromInputsSeated(v61, v62, v63);
        return;
    else
        for v66, _ in v60.CurrentMotor6DTransforms do
            v60.LastMotor6DTransforms[v66] = v66.Transform;
        end;
        v60.LastRefreshTime = tick();
        local v68 = v61 or v60.Parts.Head.CFrame * v60.Head:GetEyesOffset();
        local l_HeadCFrame_0 = v60.Head:GetHeadCFrame(v68);
        local l_NeckCFrame_0 = v60.Head:GetNeckCFrame(v68);
        local l_TorsoCFrames_0, v72 = v60.Torso:GetTorsoCFrames(l_NeckCFrame_0);
        local l_AppendageJointCFrames_0 = v60.Torso:GetAppendageJointCFrames(l_TorsoCFrames_0, v72);
        local v74 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character == v60.CharacterModel;
        local l_FeetCFrames_0, v76 = v60.FootPlanter:GetFeetCFrames();
        local v77 = false;
        local v78 = false;
        if v65 and v65.LeftFoot then
            l_FeetCFrames_0 = v65.LeftFoot;
            v77 = true;
        else
            l_FeetCFrames_0 = l_FeetCFrames_0 * CFrame.Angles(0, 3.141592653589793, 0);
        end;
        if v65 and v65.RightFoot then
            v76 = v65.RightFoot;
            v78 = true;
        else
            v76 = v76 * CFrame.Angles(0, 3.141592653589793, 0);
        end;
        if v74 then
            local l_v8_CFrames_0 = v8:GetCFrames(v60);
            if l_v8_CFrames_0.LeftFoot then
                l_FeetCFrames_0 = l_v8_CFrames_0.LeftFoot;
                v77 = true;
            end;
            if l_v8_CFrames_0.RightFoot then
                v76 = l_v8_CFrames_0.RightFoot;
                v78 = true;
            end;
            v60.ReplicationTrackerData = {
                LeftFoot = l_v8_CFrames_0.LeftFoot, 
                RightFoot = l_v8_CFrames_0.RightFoot
            };
        end;
        local l_AvatarGestures_0 = l_VRService_0.AvatarGestures;
        local v81 = (v64 or v60.CurrentWalkspeed) > 0.1;
        local v82 = l_TorsoCFrames_0 * v60.Attachments.LowerTorso.RootRigAttachment.CFrame * v60.Attachments.HumanoidRootPart.RootRigAttachment.CFrame:Inverse();
        local v83 = v60.Parts.HumanoidRootPart.CFrame.Y - v82.Y;
        local v84 = CFrame.new(v82.Position) * CFrame.Angles(0, math.atan2(v82.LookVector.X, v82.LookVector.Z) + 3.141592653589793, 0);
        if not l_AvatarGestures_0 then
            v60:SetCFrameProperty(v60.Parts.HumanoidRootPart, "CFrame", CFrame.new(0, v83, 0) * v84);
            v60:SetCFrameProperty(v60.Motors.Root, "Transform", CFrame.new(0, -v83, 0) * (v84 * v60.Attachments.HumanoidRootPart.RootRigAttachment.CFrame):Inverse() * l_TorsoCFrames_0 * v60.Attachments.LowerTorso.RootRigAttachment.CFrame);
            v60:SetTransform("Neck", "NeckRigAttachment", "UpperTorso", "Head", v72, l_HeadCFrame_0);
            v60:SetTransform("Waist", "WaistRigAttachment", "LowerTorso", "UpperTorso", l_TorsoCFrames_0, v72);
        end;
        if v60.UseIKControl then
            if not l_AvatarGestures_0 and v62 and v63 then
                v60.LeftArm:MoveToWorld(v62);
                v60.RightArm:MoveToWorld(v63);
            end;
            if not v81 and (not l_AvatarGestures_0 or v77) then
                v60.LeftLeg:MoveToWorld(l_FeetCFrames_0);
                v60.LeftLeg:Enable();
            else
                v60.LeftLeg:Disable();
            end;
            if not v81 and (not l_AvatarGestures_0 or v78) then
                v60.RightLeg:MoveToWorld(v76);
                v60.RightLeg:Enable();
            else
                v60.RightLeg:Disable();
            end;
        else
            if not l_AvatarGestures_0 then
                local l_AppendageCFrames_0, v86, v87 = v60.LeftArm:GetAppendageCFrames(l_AppendageJointCFrames_0.LeftShoulder, v62);
                local l_AppendageCFrames_1, v89, v90 = v60.RightArm:GetAppendageCFrames(l_AppendageJointCFrames_0.RightShoulder, v63);
                v60:SetTransform("RightShoulder", "RightShoulderRigAttachment", "UpperTorso", "RightUpperArm", v72, l_AppendageCFrames_1);
                v60:SetTransform("RightElbow", "RightElbowRigAttachment", "RightUpperArm", "RightLowerArm", l_AppendageCFrames_1, v89);
                v60:SetTransform("RightWrist", "RightWristRigAttachment", "RightLowerArm", "RightHand", v89, v90);
                v60:SetTransform("LeftShoulder", "LeftShoulderRigAttachment", "UpperTorso", "LeftUpperArm", v72, l_AppendageCFrames_0);
                v60:SetTransform("LeftElbow", "LeftElbowRigAttachment", "LeftUpperArm", "LeftLowerArm", l_AppendageCFrames_0, v86);
                v60:SetTransform("LeftWrist", "LeftWristRigAttachment", "LeftLowerArm", "LeftHand", v86, v87);
            end;
            if not v81 and (not l_AvatarGestures_0 or v77) then
                local l_AppendageCFrames_2, v92, v93 = v60.LeftLeg:GetAppendageCFrames(l_AppendageJointCFrames_0.LeftHip, l_FeetCFrames_0);
                v60:SetTransform("LeftHip", "LeftHipRigAttachment", "LowerTorso", "LeftUpperLeg", l_TorsoCFrames_0, l_AppendageCFrames_2);
                v60:SetTransform("LeftKnee", "LeftKneeRigAttachment", "LeftUpperLeg", "LeftLowerLeg", l_AppendageCFrames_2, v92);
                v60:SetTransform("LeftAnkle", "LeftAnkleRigAttachment", "LeftLowerLeg", "LeftFoot", v92, v93);
            else
                v60.CurrentMotor6DTransforms[v60.Motors.LeftHip] = nil;
                v60.CurrentMotor6DTransforms[v60.Motors.LeftKnee] = nil;
                v60.CurrentMotor6DTransforms[v60.Motors.LeftAnkle] = nil;
            end;
            if not v81 and (not l_AvatarGestures_0 or v78) then
                local l_AppendageCFrames_3, v95, v96 = v60.RightLeg:GetAppendageCFrames(l_AppendageJointCFrames_0.RightHip, v76);
                v60:SetTransform("RightHip", "RightHipRigAttachment", "LowerTorso", "RightUpperLeg", l_TorsoCFrames_0, l_AppendageCFrames_3);
                v60:SetTransform("RightKnee", "RightKneeRigAttachment", "RightUpperLeg", "RightLowerLeg", l_AppendageCFrames_3, v95);
                v60:SetTransform("RightAnkle", "RightAnkleRigAttachment", "RightLowerLeg", "RightFoot", v95, v96);
            else
                v60.CurrentMotor6DTransforms[v60.Motors.RightHip] = nil;
                v60.CurrentMotor6DTransforms[v60.Motors.RightKnee] = nil;
                v60.CurrentMotor6DTransforms[v60.Motors.RightAnkle] = nil;
            end;
        end;
        if v74 then
            v60.ReplicationCFrames = {
                HeadCFrame = v61, 
                LeftHandCFrame = v62, 
                RightHandCFrame = v63
            };
        end;
        return;
    end;
end;
v14.UpdateFromInputsSeated = function(v97, v98, v99, v100) --[[ Line: 557 ]] --[[ Name: UpdateFromInputsSeated ]]
    -- upvalues: l_VRService_0 (copy), l_Players_0 (copy)
    if v97.Humanoid.Health <= 0 then
        return;
    elseif l_VRService_0.AvatarGestures or not v98 or not v99 or not v100 then
        return;
    else
        local l_HeadCFrame_1 = v97.Head:GetHeadCFrame(v98);
        local l_NeckCFrame_1 = v97.Head:GetNeckCFrame(v98, 0);
        local l_TorsoCFrames_1, v104 = v97.Torso:GetTorsoCFrames(l_NeckCFrame_1);
        local l_AppendageJointCFrames_1 = v97.Torso:GetAppendageJointCFrames(l_TorsoCFrames_1, v104);
        local l_EyesOffset_0 = v97.Head:GetEyesOffset();
        local v107 = CFrame.new(0, (CFrame.new(0, l_EyesOffset_0.Y, 0) * (v98 * l_EyesOffset_0:Inverse())).Y, 0);
        v97:SetCFrameProperty(v97.Motors.Root, "Transform", v107 * CFrame.new(0, -l_TorsoCFrames_1.Y, 0) * l_TorsoCFrames_1);
        v97:SetTransform("Neck", "NeckRigAttachment", "UpperTorso", "Head", v104, l_HeadCFrame_1);
        v97:SetTransform("Waist", "WaistRigAttachment", "LowerTorso", "UpperTorso", l_TorsoCFrames_1, v104);
        if v97.UseIKControl then
            local v108 = v97.Parts.Head.CFrame * l_EyesOffset_0;
            v97.LeftArm:MoveToWorld(v108 * v98:Inverse() * v99);
            v97.RightArm:MoveToWorld(v108 * v98:Inverse() * v100);
            v97.LeftLeg:Disable();
            v97.RightLeg:Disable();
        else
            local l_AppendageCFrames_4, v110, v111 = v97.LeftArm:GetAppendageCFrames(l_AppendageJointCFrames_1.LeftShoulder, v99);
            local l_AppendageCFrames_5, v113, v114 = v97.RightArm:GetAppendageCFrames(l_AppendageJointCFrames_1.RightShoulder, v100);
            v97:SetTransform("RightShoulder", "RightShoulderRigAttachment", "UpperTorso", "RightUpperArm", v104, l_AppendageCFrames_5);
            v97:SetTransform("RightElbow", "RightElbowRigAttachment", "RightUpperArm", "RightLowerArm", l_AppendageCFrames_5, v113);
            v97:SetTransform("RightWrist", "RightWristRigAttachment", "RightLowerArm", "RightHand", v113, v114);
            v97:SetTransform("LeftShoulder", "LeftShoulderRigAttachment", "UpperTorso", "LeftUpperArm", v104, l_AppendageCFrames_4);
            v97:SetTransform("LeftElbow", "LeftElbowRigAttachment", "LeftUpperArm", "LeftLowerArm", l_AppendageCFrames_4, v110);
            v97:SetTransform("LeftWrist", "LeftWristRigAttachment", "LeftLowerArm", "LeftHand", v110, v111);
        end;
        v97.CurrentMotor6DTransforms[v97.Motors.RightHip] = nil;
        v97.CurrentMotor6DTransforms[v97.Motors.LeftHip] = nil;
        v97.CurrentMotor6DTransforms[v97.Motors.RightKnee] = nil;
        v97.CurrentMotor6DTransforms[v97.Motors.LeftKnee] = nil;
        v97.CurrentMotor6DTransforms[v97.Motors.RightAnkle] = nil;
        v97.CurrentMotor6DTransforms[v97.Motors.LeftAnkle] = nil;
        if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character == v97.CharacterModel then
            v97.ReplicationCFrames = {
                HeadCFrame = v98, 
                LeftHandCFrame = v99, 
                RightHandCFrame = v100
            };
        end;
        return;
    end;
end;
return v14;