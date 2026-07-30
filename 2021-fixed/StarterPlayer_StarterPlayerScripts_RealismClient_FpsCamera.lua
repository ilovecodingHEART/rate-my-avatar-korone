-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v28 = {
    HeadMirrors = {}, 
    HeadAttachments = {
        FaceCenterAttachment = true, 
        FaceFrontAttachment = true, 
        HairAttachment = true, 
        HatAttachment = true
    }, 
    InvalidRotationStates = {
        Swimming = true, 
        Climbing = true, 
        Dead = true, 
        Flying = true
    }, 
    Warn = function(_, ...) --[[ Line: 44 ]] --[[ Name: Warn ]]
        warn("[FpsCamera]", ...);
    end, 
    Connect = function(v5, v6, v7) --[[ Line: 51 ]] --[[ Name: Connect ]]
        return v7:Connect(function(...) --[[ Line: 52 ]]
            v5[v6](v5, ...);
        end);
    end, 
    IsInFirstPerson = function(_) --[[ Line: 60 ]] --[[ Name: IsInFirstPerson ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            if l_CurrentCamera_0.CameraType.Name == "Scriptable" then
                return false;
            else
                return (l_CurrentCamera_0.Focus.Position - l_CurrentCamera_0.CFrame.Position).Magnitude <= 1;
            end;
        else
            return false;
        end;
    end, 
    GetSubjectPosition = function(v10) --[[ Line: 80 ]] --[[ Name: GetSubjectPosition ]]
        if v10:IsInFirstPerson() then
            local l_CameraSubject_0 = workspace.CurrentCamera.CameraSubject;
            if l_CameraSubject_0 and l_CameraSubject_0:IsA("Humanoid") and l_CameraSubject_0.Health > 0 then
                local l_Parent_0 = l_CameraSubject_0.Parent;
                local v13 = l_Parent_0 and l_Parent_0:FindFirstChild("Head");
                if v13 and v13:IsA("BasePart") then
                    local l_CFrame_0 = v13.CFrame;
                    return (l_CFrame_0 * CFrame.new(0, v13.Size.Y / 3, 0)).Position, l_CFrame_0.LookVector;
                end;
            end;
        end;
        return v10:GetBaseSubjectPosition();
    end, 
    IsValidPartToModify = function(v15, v16) --[[ Line: 104 ]] --[[ Name: IsValidPartToModify ]]
        if v16:FindFirstAncestorOfClass("Tool") then
            return false;
        else
            if v16:IsA("Decal") then
                v16 = v16.Parent;
            end;
            if v16 and v16:IsA("BasePart") then
                local l_v16_FirstAncestorWhichIsA_0 = v16:FindFirstAncestorWhichIsA("Accoutrement");
                if l_v16_FirstAncestorWhichIsA_0 then
                    if v16.Name ~= "Handle" then
                        local l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0 = l_v16_FirstAncestorWhichIsA_0:FindFirstChild("Handle", true);
                        if l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0 and l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0:IsA("BasePart") then
                            v16 = l_l_v16_FirstAncestorWhichIsA_0_FirstChild_0;
                        end;
                    end;
                    for _, v20 in pairs(v16:GetChildren()) do
                        if v20:IsA("Attachment") and v15.HeadAttachments[v20.Name] then
                            return true;
                        end;
                    end;
                elseif v16.Name == "Head" then
                    local l_Parent_1 = v16.Parent;
                    local l_CurrentCamera_1 = workspace.CurrentCamera;
                    local v23 = l_Parent_1 and l_Parent_1:FindFirstChildOfClass("Humanoid");
                    local v24 = l_CurrentCamera_1.CameraSubject and l_CurrentCamera_1.CameraSubject:IsA("VehicleSeat");
                    if v23 and l_CurrentCamera_1.CameraSubject == v23 or v24 and l_CurrentCamera_1.CameraSubject.Occupant == v23 then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, 
    MountBaseCamera = function(v25, v26) --[[ Line: 151 ]] --[[ Name: MountBaseCamera ]]
        local l_GetSubjectPosition_0 = v26.GetSubjectPosition;
        v25.GetBaseSubjectPosition = l_GetSubjectPosition_0;
        if l_GetSubjectPosition_0 then
            v26.GetBaseSubjectPosition = l_GetSubjectPosition_0;
            v26.GetSubjectPosition = v25.GetSubjectPosition;
            return;
        else
            v25:Warn("MountBaseCamera - Could not find BaseCamera:GetSubjectPosition()!");
            return;
        end;
    end
};
v28.UpdateTransparency = function(v29, ...) --[[ Line: 166 ]] --[[ Name: UpdateTransparency ]]
    assert(v29 ~= v28);
    v29:BaseUpdate(...);
    if v29.ForceRefresh then
        v29.ForceRefresh = false;
        if v29.SetSubject then
            v29:SetSubject(workspace.CurrentCamera.CameraSubject);
        end;
    end;
end;
v28.SetupTransparency = function(v30, v31, ...) --[[ Line: 183 ]] --[[ Name: SetupTransparency ]]
    assert(v30 ~= v28);
    v30:BaseSetupTransparency(v31, ...);
    if v30.AttachmentListener then
        v30.AttachmentListener:Disconnect();
    end;
    v30.AttachmentListener = v31.DescendantAdded:Connect(function(v32) --[[ Line: 191 ]]
        if v32:IsA("Attachment") and v30.HeadAttachments[v32.Name] then
            if typeof(v30.cachedParts) == "table" then
                v30.cachedParts[v32.Parent] = true;
            end;
            if v30.transparencyDirty ~= nil then
                v30.transparencyDirty = true;
            end;
        end;
    end);
end;
v28.MountTransparency = function(v33, v34) --[[ Line: 208 ]] --[[ Name: MountTransparency ]]
    local l_Update_0 = v34.Update;
    if l_Update_0 then
        v34.BaseUpdate = l_Update_0;
        v34.Update = v33.UpdateTransparency;
    else
        v33:Warn("MountTransparency - Could not find Transparency:Update()!");
    end;
    if v34.IsValidPartToModify then
        v34.IsValidPartToModify = v33.IsValidPartToModify;
        v34.HeadAttachments = v33.HeadAttachments;
        v34.ForceRefresh = true;
    else
        v33:Warn("MountTransparency - Could not find Transparency:IsValidPartToModify(part)!");
    end;
    if v34.SetupTransparency then
        v34.BaseSetupTransparency = v34.SetupTransparency;
        v34.SetupTransparency = v33.SetupTransparency;
        return;
    else
        v33:Warn("MountTransparency - Could not find Transparency:SetupTransparency(character)!");
        return;
    end;
end;
v28.GetShadowAngle = function(_) --[[ Line: 237 ]] --[[ Name: GetShadowAngle ]]
    local l_l_Lighting_0_SunDirection_0 = l_Lighting_0:GetSunDirection();
    if l_l_Lighting_0_SunDirection_0.Y < -0.3 then
        l_l_Lighting_0_SunDirection_0 = l_Lighting_0:GetMoonDirection();
    end;
    return l_l_Lighting_0_SunDirection_0;
end;
v28.MirrorProperty = function(_, v39, v40, v41) --[[ Line: 251 ]] --[[ Name: MirrorProperty ]]
    v39:GetPropertyChangedSignal(v41):Connect(function() --[[ Line: 252 ]]
        v40[v41] = v39[v41];
    end);
end;
v28.AddHeadMirror = function(v42, v43) --[[ Line: 260 ]] --[[ Name: AddHeadMirror ]]
    if v43:IsA("BasePart") and v42:IsValidPartToModify(v43) then
        local v44 = v43:Clone();
        v44:ClearAllChildren();
        v44.Locked = true;
        v44.Anchored = true;
        v44.CanCollide = false;
        v44.Parent = v42.MirrorBin;
        local function v48(v45) --[[ Line: 270 ]] --[[ Name: onChildAdded ]]
            local v46 = nil;
            if v45:IsA("DataModelMesh") then
                v46 = "Scale";
            elseif v45:IsA("Decal") then
                v46 = "Transparency";
            end;
            if v46 then
                local v47 = v45:Clone();
                v47.Parent = v44;
                v42:MirrorProperty(v45, v47, v46);
            end;
        end;
        for _, v50 in pairs(v43:GetChildren()) do
            local v51 = nil;
            if v50:IsA("DataModelMesh") then
                v51 = "Scale";
            elseif v50:IsA("Decal") then
                v51 = "Transparency";
            end;
            if v51 then
                local v52 = v50:Clone();
                v52.Parent = v44;
                v42:MirrorProperty(v50, v52, v51);
            end;
        end;
        v42.HeadMirrors[v43] = v44;
        v42:MirrorProperty(v43, v44, "Transparency");
        v43.ChildAdded:Connect(v48);
    end;
end;
v28.RemoveHeadMirror = function(v53, v54) --[[ Line: 302 ]] --[[ Name: RemoveHeadMirror ]]
    local v55 = v53.HeadMirrors[v54];
    if v55 then
        v55:Destroy();
        v53.HeadMirrors[v54] = nil;
    end;
end;
v28.OnRotationTypeChanged = function(v56) --[[ Line: 315 ]] --[[ Name: OnRotationTypeChanged ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v58 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if v58 and v58:IsA("Humanoid") then
        if l_UserGameSettings_0.RotationType == Enum.RotationType.CameraRelative then
            v58.AutoRotate = false;
            l_RunService_0:BindToRenderStep("FpsCamera", 1000, function(v59) --[[ Line: 324 ]]
                if v58.AutoRotate or not v58:IsDescendantOf(game) or v58.SeatPart and v58.SeatPart:IsA("VehicleSeat") then
                    l_RunService_0:UnbindFromRenderStep("FpsCamera");
                    return;
                elseif l_CurrentCamera_2.CameraType.Name == "Scriptable" then
                    return;
                else
                    local l_RootPart_0 = v58.RootPart;
                    local v61 = l_RootPart_0 and l_RootPart_0:IsGrounded();
                    if l_RootPart_0 and not v61 then
                        local l_v58_State_0 = v58:GetState();
                        local v63 = true;
                        if v56.InvalidRotationStates[l_v58_State_0.Name] then
                            v63 = false;
                        end;
                        if v58.Sit and v58.SeatPart and l_RootPart_0:GetRootPart() ~= l_RootPart_0 then
                            v63 = false;
                        end;
                        if v63 then
                            local l_Position_0 = l_RootPart_0.Position;
                            local v65 = math.min(0.2, v59 * 40 / 3);
                            local l_Unit_0 = (l_CurrentCamera_2.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit;
                            local v67 = CFrame.new(l_Position_0, l_Position_0 + l_Unit_0);
                            l_RootPart_0.CFrame = l_RootPart_0.CFrame:Lerp(v67, v65);
                        end;
                    end;
                    if v56:IsInFirstPerson() then
                        local l_CFrame_1 = l_CurrentCamera_2.CFrame;
                        local l_v56_SubjectPosition_0, _ = v56:GetSubjectPosition(v58);
                        if l_v56_SubjectPosition_0 then
                            local v71 = l_v56_SubjectPosition_0 - l_CFrame_1.Position;
                            l_CFrame_1 = l_CFrame_1 + v71;
                            l_CurrentCamera_2.CFrame = l_CFrame_1;
                            local l_l_CurrentCamera_2_0 = l_CurrentCamera_2;
                            l_l_CurrentCamera_2_0.Focus = l_l_CurrentCamera_2_0.Focus + v71;
                        end;
                        local l_v56_ShadowAngle_0 = v56:GetShadowAngle();
                        local v74 = l_CFrame_1.LookVector:Dot(l_v56_ShadowAngle_0);
                        if v74 < 0 then
                            for v75, v76 in pairs(v56.HeadMirrors) do
                                v76.CFrame = v75.CFrame + l_v56_ShadowAngle_0 * 9;
                            end;
                        end;
                        v56.MirrorBin.Parent = v74 < 0 and l_CurrentCamera_2 or nil;
                        return;
                    else
                        v56.MirrorBin.Parent = nil;
                        return;
                    end;
                end;
            end);
            return;
        else
            v58.AutoRotate = true;
            v56.MirrorBin.Parent = nil;
        end;
    end;
end;
v28.OnCharacterAdded = function(v77, v78) --[[ Line: 401 ]] --[[ Name: OnCharacterAdded ]]
    local l_MirrorBin_0 = v77.MirrorBin;
    if l_MirrorBin_0 then
        l_MirrorBin_0:ClearAllChildren();
        l_MirrorBin_0.Parent = nil;
    end;
    v77.HeadMirrors = {};
    for _, v81 in pairs(v78:GetDescendants()) do
        v77:AddHeadMirror(v81);
    end;
    v77:Connect("AddHeadMirror", v78.DescendantAdded);
    v77:Connect("RemoveHeadMirror", v78.DescendantRemoving);
end;
local v82 = false;
v28.Start = function(v83) --[[ Line: 424 ]] --[[ Name: Start ]]
    if v82 then
        return;
    else
        v82 = true;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local l_Character_0 = l_LocalPlayer_0.Character;
        local l_PlayerModule_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule");
        local l_l_PlayerModule_0_FirstChild_0 = l_PlayerModule_0:FindFirstChild("BaseCamera", true);
        local l_l_PlayerModule_0_FirstChild_1 = l_PlayerModule_0:FindFirstChild("TransparencyController", true);
        if l_l_PlayerModule_0_FirstChild_0 and l_l_PlayerModule_0_FirstChild_0:IsA("ModuleScript") then
            v83:MountBaseCamera((require(l_l_PlayerModule_0_FirstChild_0)));
        else
            v83:Warn("Start - Could not find BaseCamera module!");
        end;
        if l_l_PlayerModule_0_FirstChild_1 and l_l_PlayerModule_0_FirstChild_1:IsA("ModuleScript") then
            v83:MountTransparency((require(l_l_PlayerModule_0_FirstChild_1)));
        else
            v83:Warn("Start - Cound not find TransparencyController module!");
        end;
        v83:Connect("OnRotationTypeChanged", (l_UserGameSettings_0:GetPropertyChangedSignal("RotationType")));
        v83.MirrorBin = Instance.new("Folder");
        v83.MirrorBin.Name = "HeadMirrors";
        if l_Character_0 then
            v83:OnCharacterAdded(l_Character_0);
        end;
        v83:Connect("OnCharacterAdded", l_LocalPlayer_0.CharacterAdded);
        return;
    end;
end;
return v28;