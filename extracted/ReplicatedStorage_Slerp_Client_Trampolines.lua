-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_TrampolineEffects_0 = l_ReplicatedStorage_0.Slerp.RemoteEvents.TrampolineEffects;
local v4 = require(script.Spring);
local v5 = RaycastParams.new();
v5.FilterType = Enum.RaycastFilterType.Include;
local v6 = {};
local v7 = {};
local v8 = {};
v6.addTrampoline = function(v9) --[[ Line: 48 ]] --[[ Name: addTrampoline ]]
    v5:AddToFilter({
        v9.triggerPart
    });
    local v10 = #v7 + 1;
    v7[v10] = v9;
    v8[v9.model] = v10;
end;
local function v15(v11) --[[ Line: 55 ]] --[[ Name: getBones ]]
    local v12 = {};
    for _, v14 in v11:GetChildren() do
        if v14:IsA("Bone") then
            if v14.Name ~= "Center" then

            end;
            table.insert(v12, v14);
        end;
    end;
    return v12;
end;
local function v20(v16) --[[ Line: 68 ]] --[[ Name: getParticles ]]
    local v17 = {};
    for _, v19 in v16:GetDescendants() do
        if v19:IsA("ParticleEmitter") then
            table.insert(v17, {
                emitter = v19, 
                amount = v19:GetAttribute("EmitCount")
            });
        end;
    end;
    return v17;
end;
v6.addFromModel = function(v21) --[[ Line: 78 ]] --[[ Name: addFromModel ]]
    local l_BouncePart_0 = v21:WaitForChild("BouncePart");
    local l_Trigger_0 = v21:WaitForChild("Trigger");
    local v24 = v15(l_BouncePart_0);
    local _ = RaycastParams.new();
    local v26 = v4.new(0, os.clock);
    v26.s = 10.5;
    v26.d = 0.23;
    local l_Magnitude_0 = v24[1].Position.Magnitude;
    if #v24 > 1 then
        for v28 = 2, #v24 do
            local l_Magnitude_1 = v24[v28].Position.Magnitude;
            if l_Magnitude_0 < l_Magnitude_1 then
                l_Magnitude_0 = l_Magnitude_1;
            end;
        end;
    end;
    local v30 = {
        model = v21, 
        plane = l_BouncePart_0, 
        triggerPart = l_Trigger_0, 
        waves = {}, 
        bones = v24, 
        boneHeights = table.create(#v24, 0), 
        particles = v20(l_Trigger_0), 
        spring = v26, 
        maxDist = l_Magnitude_0
    };
    v6.addTrampoline(v30);
end;
local v31 = 0;
local l_sin_0 = math.sin;
local l_Dot_0 = Vector3.zero.Dot;
local function _(v34, v35, v36, v37, v38, v39) --[[ Line: 118 ]] --[[ Name: getWaveHeight ]]
    return v37 * l_sin_0(l_Dot_0(v36, v35) * v38 + v34 * v39);
end;
local function _(v41, v42) --[[ Line: 122 ]] --[[ Name: zeroArray ]]
    for v43 in v41 do
        v41[v43] = v42;
    end;
end;
local function v52(v45, _) --[[ Line: 128 ]] --[[ Name: updateWaves ]]
    local l_p_0 = v45.spring.p;
    for _, v49 in v45.bones do
        local v50 = 1 - v49.Position.Magnitude / (v45.maxDist / 0.9);
        if v50 ~= v50 then
            v50 = 1;
        end;
        local v51 = l_p_0 * v50;
        v49.Transform = CFrame.new(0, v51, 0);
    end;
end;
local function _(v53) --[[ Line: 142 ]] --[[ Name: addWave ]]
    v53.spring:Impulse(-20);
end;
local function v59(v55) --[[ Line: 146 ]] --[[ Name: emitParticles ]]
    local v56 = game.SoundService.SFX.BouncePad:Clone();
    v56.Parent = v55.model.Trigger;
    v56.RollOffMaxDistance = 100;
    v56.PlaybackSpeed = math.random(10, 15) / 10;
    v56.PlayOnRemove = true;
    v56:Destroy();
    for _, v58 in pairs(v55.model:GetDescendants()) do
        if v58:IsA("ParticleEmitter") then
            v58:Emit(v58:GetAttribute("EmitCount"));
        end;
    end;
end;
local function _(v60) --[[ Line: 161 ]] --[[ Name: doEffects ]]
    v60.spring:Impulse(-20);
    v59(v60);
end;
v6.init = function() --[[ Line: 166 ]] --[[ Name: init ]]
    local v62 = 0;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local _ = function() --[[ Line: 171 ]] --[[ Name: setFromCharacterModel ]]
        v64 = l_Character_0:WaitForChild("Humanoid");
        v65 = l_Character_0:WaitForChild("HumanoidRootPart");
        v66 = v64.StateChanged:Connect(function(_, v68) --[[ Line: 174 ]]
            if v68 ~= Enum.HumanoidStateType.Landed then
                return;
            else
                local v69 = workspace:Raycast(v65.Position, -Vector3.yAxis * 10, v5);
                if not v69 then
                    v31 = 0;
                    v64:SetStateEnabled(Enum.HumanoidStateType.Running, true);
                    return;
                else
                    local l_Parent_0 = v69.Instance.Parent;
                    if not l_Parent_0 then
                        return;
                    else
                        local v71 = v8[l_Parent_0];
                        if not v71 then
                            return;
                        else
                            local v72 = v7[v71];
                            if not v72 then
                                return;
                            else
                                v72.spring:Impulse(-20);
                                v59(v72);
                                task.wait();
                                v64:ChangeState(Enum.HumanoidStateType.Freefall);
                                v64:SetStateEnabled(Enum.HumanoidStateType.Running, false);
                                local l_AssemblyLinearVelocity_0 = v65.AssemblyLinearVelocity;
                                local v74 = math.min(v62 * 1.5, 300);
                                v65.AssemblyLinearVelocity = Vector3.new(l_AssemblyLinearVelocity_0.X, v74, l_AssemblyLinearVelocity_0.Z);
                                v62 = 0;
                                l_TrampolineEffects_0:FireServer(v72.model);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
    end;
    if l_Character_0 then
        v64 = l_Character_0:WaitForChild("Humanoid");
        v65 = l_Character_0:WaitForChild("HumanoidRootPart");
        v66 = v64.StateChanged:Connect(function(_, v77) --[[ Line: 174 ]]
            if v77 ~= Enum.HumanoidStateType.Landed then
                return;
            else
                local v78 = workspace:Raycast(v65.Position, -Vector3.yAxis * 10, v5);
                if not v78 then
                    v31 = 0;
                    v64:SetStateEnabled(Enum.HumanoidStateType.Running, true);
                    return;
                else
                    local l_Parent_1 = v78.Instance.Parent;
                    if not l_Parent_1 then
                        return;
                    else
                        local v80 = v8[l_Parent_1];
                        if not v80 then
                            return;
                        else
                            local v81 = v7[v80];
                            if not v81 then
                                return;
                            else
                                v81.spring:Impulse(-20);
                                v59(v81);
                                task.wait();
                                v64:ChangeState(Enum.HumanoidStateType.Freefall);
                                v64:SetStateEnabled(Enum.HumanoidStateType.Running, false);
                                local l_AssemblyLinearVelocity_1 = v65.AssemblyLinearVelocity;
                                local v83 = math.min(v62 * 1.5, 300);
                                v65.AssemblyLinearVelocity = Vector3.new(l_AssemblyLinearVelocity_1.X, v83, l_AssemblyLinearVelocity_1.Z);
                                v62 = 0;
                                l_TrampolineEffects_0:FireServer(v81.model);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
    end;
    l_LocalPlayer_0.CharacterRemoving:Connect(function() --[[ Line: 222 ]]
        l_Character_0 = nil;
        v31 = 0;
        v62 = 0;
        v66:Disconnect();
    end);
    l_LocalPlayer_0.CharacterAdded:Connect(function(v84) --[[ Line: 228 ]]
        l_Character_0 = v84;
        v64 = l_Character_0:WaitForChild("Humanoid");
        v65 = l_Character_0:WaitForChild("HumanoidRootPart");
        v66 = v64.StateChanged:Connect(function(_, v86) --[[ Line: 174 ]]
            if v86 ~= Enum.HumanoidStateType.Landed then
                return;
            else
                local v87 = workspace:Raycast(v65.Position, -Vector3.yAxis * 10, v5);
                if not v87 then
                    v31 = 0;
                    v64:SetStateEnabled(Enum.HumanoidStateType.Running, true);
                    return;
                else
                    local l_Parent_2 = v87.Instance.Parent;
                    if not l_Parent_2 then
                        return;
                    else
                        local v89 = v8[l_Parent_2];
                        if not v89 then
                            return;
                        else
                            local v90 = v7[v89];
                            if not v90 then
                                return;
                            else
                                v90.spring:Impulse(-20);
                                v59(v90);
                                task.wait();
                                v64:ChangeState(Enum.HumanoidStateType.Freefall);
                                v64:SetStateEnabled(Enum.HumanoidStateType.Running, false);
                                local l_AssemblyLinearVelocity_2 = v65.AssemblyLinearVelocity;
                                local v92 = math.min(v62 * 1.5, 300);
                                v65.AssemblyLinearVelocity = Vector3.new(l_AssemblyLinearVelocity_2.X, v92, l_AssemblyLinearVelocity_2.Z);
                                v62 = 0;
                                l_TrampolineEffects_0:FireServer(v90.model);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
    end);
    l_RunService_0.PostSimulation:Connect(function() --[[ Line: 233 ]]
        local v93 = os.clock();
        if v64 and v65 and v64:GetState() == Enum.HumanoidStateType.Freefall then
            v62 = v65.AssemblyLinearVelocity.Magnitude;
        end;
        for _, v95 in v7 do
            v52(v95, v93);
        end;
    end);
    l_TrampolineEffects_0.OnClientEvent:Connect(function(v96) --[[ Line: 248 ]]
        local v97 = v8[v96];
        if not v97 then
            return;
        else
            local v98 = v7[v97];
            if not v98 then
                return;
            else
                v98.spring:Impulse(-20);
                v59(v98);
                return;
            end;
        end;
    end);
end;
table.freeze(v6);
return v6;