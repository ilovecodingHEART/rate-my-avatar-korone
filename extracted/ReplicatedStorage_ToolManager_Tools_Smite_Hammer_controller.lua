-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_SoundService_0 = game:GetService("SoundService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_utils_0 = require(l_Parent_0:WaitForChild("utils"));
local l_ToolAssets_0 = l_ReplicatedStorage_0:WaitForChild("ToolAssets");
local l_Smite_0 = l_ToolAssets_0:WaitForChild("Smite");
local l_Lightning_0 = require(l_ToolAssets_0:WaitForChild("Lightning"));
local l_Destruction_0 = require(l_ToolAssets_0:WaitForChild("Destruction"));
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v14 = Random.new();
local function _(v15) --[[ Line: 25 ]] --[[ Name: tweenCleanUp ]]
    v15.Completed:Once(function() --[[ Line: 26 ]]
        -- upvalues: v15 (copy)
        v15:Destroy();
    end);
    return v15;
end;
local function v21(v17, v18) --[[ Line: 33 ]] --[[ Name: emit ]]
    -- upvalues: l_Players_0 (copy), l_SoundService_0 (copy)
    for _, v20 in pairs(v17:GetChildren()) do
        if v20:IsA("ParticleEmitter") then
            if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
                v20:Emit(v20:GetAttribute("EmitCount"));
            end;
        elseif v20:IsA("Sound") then
            v20.Parent = game:GetService("SoundService");
            v20.SoundGroup = l_SoundService_0.ToolSFXGroup;
            v20:Play();
            task.delay(v18, function() --[[ Line: 43 ]]
                -- upvalues: v20 (copy)
                v20:Destroy();
            end);
        end;
    end;
end;
local function v26(v22, v23) --[[ Line: 48 ]] --[[ Name: enable ]]
    -- upvalues: l_Players_0 (copy), l_SoundService_0 (copy)
    for _, v25 in pairs(v22:GetChildren()) do
        if v25:IsA("ParticleEmitter") or v25:IsA("Trail") then
            if not v23 or l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
                v25.Enabled = v23;
            end;
        elseif v25:IsA("Sound") then
            v25.SoundGroup = l_SoundService_0.ToolSFXGroup;
            if v23 then
                v25:Play();
            else
                v25:Stop();
            end;
        end;
    end;
end;
local function v32(v27, v28, v29, v30) --[[ Line: 64 ]] --[[ Name: pulse ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    local l_BloomEffect_0 = Instance.new("BloomEffect");
    l_BloomEffect_0.Parent = l_Lighting_0;
    l_BloomEffect_0.Size = v27;
    l_BloomEffect_0.Threshold = v29;
    l_TweenService_0:Create(l_BloomEffect_0, TweenInfo.new(v30 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Intensity = v28
    }):Play();
    task.delay(v30 / 2, function() --[[ Line: 75 ]]
        -- upvalues: l_TweenService_0 (ref), l_BloomEffect_0 (copy), v30 (copy), l_Debris_0 (ref)
        l_TweenService_0:Create(l_BloomEffect_0, TweenInfo.new(v30 * 1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Intensity = 0, 
            Threshold = 4
        }):Play();
        l_Debris_0:AddItem(l_BloomEffect_0, v30 * 1.5);
    end);
end;
local _ = function(v33, v34, v35) --[[ Line: 85 ]] --[[ Name: camShake ]]
    -- upvalues: v14 (copy)
    local l_Humanoid_0 = v33.Humanoid;
    local l_v35_0 = v35;
    local v38 = v34 / 100;
    task.spawn(function() --[[ Line: 93 ]]
        -- upvalues: l_v35_0 (ref), v35 (copy), l_Humanoid_0 (copy), v14 (ref), v38 (copy)
        for _ = 1, 100 do
            l_v35_0 = l_v35_0 - v35 / 100;
            l_Humanoid_0.CameraOffset = Vector3.new(v14:NextNumber(-l_v35_0, l_v35_0), v14:NextNumber(-l_v35_0, l_v35_0), v14:NextNumber(-l_v35_0, l_v35_0));
            task.wait(v38);
        end;
    end);
end;
local function _(v41, v42, v43) --[[ Line: 103 ]] --[[ Name: lerp ]]
    return v41 + (v42 - v41) * v43;
end;
local function _(v45, v46) --[[ Line: 107 ]] --[[ Name: randomVec3 ]]
    -- upvalues: v14 (copy)
    return (Vector3.new(v14:NextNumber(v45, v46), v14:NextNumber(v45, v46), v14:NextNumber(v45, v46)));
end;
local function _() --[[ Line: 111 ]] --[[ Name: createWindParticle ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.CanTouch = false;
    l_Part_0.Size = Vector3.new(15, 10.5, 0.25, 0);
    l_Part_0.Name = "windParticle";
    l_Part_0.Parent = workspace;
    local v49 = script.WindParticles:Clone();
    v49.Parent = l_Part_0;
    return l_Part_0, v49;
end;
local function _(v51) --[[ Line: 131 ]] --[[ Name: createVel ]]
    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
    l_BodyVelocity_0.Parent = v51.HumanoidRootPart;
    l_BodyVelocity_0.MaxForce = Vector3.new(150000, 150000, 150000, 0);
    return l_BodyVelocity_0;
end;
local v54 = {
    range = 135, 
    height = 75, 
    interactHeight = 8, 
    impulseDuration = 0.35, 
    cooldownTime = 2, 
    renderDistance = 75
};
local function v59(v55, v56) --[[ Line: 151 ]] --[[ Name: applyImpulseDirection ]]
    -- upvalues: v54 (copy)
    local l_BodyVelocity_1 = Instance.new("BodyVelocity");
    l_BodyVelocity_1.Parent = v55.HumanoidRootPart;
    l_BodyVelocity_1.MaxForce = Vector3.new(150000, 150000, 150000, 0);
    local l_l_BodyVelocity_1_0 = l_BodyVelocity_1;
    l_BodyVelocity_1 = v55.Humanoid.MoveDirection;
    l_l_BodyVelocity_1_0.Velocity = l_BodyVelocity_1 * v54.range + Vector3.new(0, v54.height / 1, 0);
    v56.bodyVelocity = l_l_BodyVelocity_1_0;
    v56.bounceCooldown = true;
    task.delay(v54.impulseDuration * 2, function() --[[ Line: 161 ]]
        -- upvalues: v56 (copy)
        v56.bounceCooldown = false;
    end);
    task.delay(v54.impulseDuration, function() --[[ Line: 165 ]]
        -- upvalues: l_l_BodyVelocity_1_0 (copy), v56 (copy)
        l_l_BodyVelocity_1_0:Destroy();
        v56.bodyVelocity = nil;
    end);
    if v56.vectorForce then
        v56.vectorForce.Force = l_BodyVelocity_1 * (v54.range * 2) + Vector3.new(0, 250, 0, 0);
    end;
end;
local function _(v60, v61) --[[ Line: 175 ]] --[[ Name: applyLeap ]]
    -- upvalues: v54 (copy)
    local l_BodyVelocity_2 = Instance.new("BodyVelocity");
    l_BodyVelocity_2.Parent = v60.HumanoidRootPart;
    l_BodyVelocity_2.MaxForce = Vector3.new(150000, 150000, 150000, 0);
    local l_l_BodyVelocity_2_0 = l_BodyVelocity_2;
    l_l_BodyVelocity_2_0.Velocity = v60.Humanoid.MoveDirection * (v54.range / 2) + Vector3.new(0, 150, 0, 0);
    task.delay(0.2, function() --[[ Line: 182 ]]
        -- upvalues: l_l_BodyVelocity_2_0 (copy), v61 (copy), v60 (copy)
        l_l_BodyVelocity_2_0:Destroy();
        if v61.vectorForce then
            v61.vectorForce.Force = Vector3.new(v60.HumanoidRootPart.Position.X, -2500, v60.HumanoidRootPart.Position.Z);
        end;
    end);
end;
local function v71(v65, v66, v67) --[[ Line: 191 ]] --[[ Name: scaleModel ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_NumberValue_0 = Instance.new("NumberValue");
    local v69 = l_TweenService_0:Create(l_NumberValue_0, v66, {
        Value = v65
    });
    v69:Play();
    local v70 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 200 ]]
        -- upvalues: v67 (copy), l_NumberValue_0 (copy)
        v67(l_NumberValue_0.Value);
    end);
    v69.Completed:Once(function() --[[ Line: 204 ]]
        -- upvalues: v70 (copy), v69 (copy), l_NumberValue_0 (copy)
        v70:Disconnect();
        v69:Destroy();
        l_NumberValue_0:Destroy();
    end);
end;
local v72 = {
    server = {}, 
    client = {}
};
v72.client.createBounceParticle = function(v73, v74) --[[ Line: 218 ]] --[[ Name: createBounceParticle ]]
    -- upvalues: l_Players_0 (copy), l_Smite_0 (copy), v21 (copy), l_Debris_0 (copy), v26 (copy), l_RunService_0 (copy), v54 (copy), l_TweenService_0 (copy), l_Lightning_0 (copy), v14 (copy), l_Destruction_0 (copy), l_CurrentCamera_0 (copy)
    if v73.user == l_Players_0.LocalPlayer and v74 == "server" then
        return;
    else
        local l_character_0 = v73.character;
        local l_cast_0 = v73.cast;
        local l_Normal_0 = l_cast_0.Normal;
        local v78 = CFrame.lookAt(l_cast_0.Position, l_cast_0.Position + l_Normal_0);
        local v79 = l_Smite_0.Bounce:Clone();
        v79.Parent = workspace;
        v79.CFrame = v78;
        v21(v79.Main, 5);
        v21(v79.Main.Wind1, 5);
        local l_Environment_0 = workspace:WaitForChild("Map"):WaitForChild("Environment");
        if l_cast_0.Instance:IsDescendantOf(l_Environment_0:WaitForChild("Terrain")) then
            v21(v79.Crack);
        end;
        l_Debris_0:AddItem(v79, 5);
        local v81 = l_Smite_0.TorsoWind:Clone();
        v81.Parent = workspace;
        v26(v81, true);
        local l_Position_0 = l_character_0.HumanoidRootPart.Position;
        local v85 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 252 ]]
            -- upvalues: l_character_0 (copy), l_Position_0 (ref), v81 (copy)
            local l_Position_1 = l_character_0.HumanoidRootPart.Position;
            local l_Unit_0 = (l_Position_1 - l_Position_0).Unit;
            v81.CFrame = CFrame.lookAt(l_Position_1, l_Position_1 + l_Unit_0);
            l_Position_0 = l_character_0.HumanoidRootPart.Position;
        end);
        task.delay(v54.impulseDuration * 2.85, function() --[[ Line: 262 ]]
            -- upvalues: v26 (ref), v81 (copy), v85 (copy), l_Debris_0 (ref)
            v26(v81, false);
            v85:Disconnect();
            l_Debris_0:AddItem(v81, 3);
        end);
        if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
            local v86 = l_Smite_0.Wind:Clone();
            v86.Parent = workspace;
            v86.CFrame = v78 * CFrame.Angles(-1.5707963267948966, 0, 0);
            v86.Size = Vector3.new(5, 45, 5, 0);
            local v87 = l_TweenService_0:Create(v86, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Size = Vector3.new(41.39630126953125, 10.926300048828125, 41.39630126953125, 0), 
                Transparency = 1
            });
            local l_v87_0 = v87 --[[ copy: 13 -> 18 ]];
            v87.Completed:Once(function() --[[ Line: 26 ]]
                -- upvalues: l_v87_0 (copy)
                l_v87_0:Destroy();
            end);
            v87:Play();
            l_Debris_0:AddItem(v86, 3);
            local l_Position_2 = l_character_0.HumanoidRootPart.Position;
            do
                local l_l_Position_2_0 = l_Position_2;
                task.delay(0.2, function() --[[ Line: 284 ]]
                    -- upvalues: l_character_0 (copy), l_l_Position_2_0 (ref), l_Smite_0 (ref), l_TweenService_0 (ref), l_Debris_0 (ref)
                    for _ = 1, 2 do
                        local l_Unit_1 = (l_character_0.HumanoidRootPart.Position - l_l_Position_2_0).Unit;
                        local v93 = l_Smite_0.Wind2:Clone();
                        v93.Parent = workspace;
                        v93.CFrame = CFrame.lookAt(l_character_0.HumanoidRootPart.Position, l_character_0.HumanoidRootPart.Position + l_Unit_1) * CFrame.Angles(1.5707963267948966, 0, 0);
                        v93.Size = Vector3.new(0, 0, 0, 0);
                        local v94 = l_TweenService_0:Create(v93, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Size = Vector3.new(34.94464874267578, 18.329999923706055, 34.94464874267578, 0), 
                            Transparency = 1
                        });
                        v94.Completed:Once(function() --[[ Line: 26 ]]
                            -- upvalues: v94 (copy)
                            v94:Destroy();
                        end);
                        v94:Play();
                        l_Debris_0:AddItem(v93, 0.35);
                        l_l_Position_2_0 = l_character_0.HumanoidRootPart.Position;
                        task.wait(0.2);
                    end;
                end);
                task.spawn(function() --[[ Line: 307 ]]
                    -- upvalues: l_Lightning_0 (ref), l_cast_0 (copy), v14 (ref), l_character_0 (copy)
                    for _ = 1, 15 do
                        l_Lightning_0:CreateArc(l_cast_0.Position + Vector3.new(v14:NextNumber(-7, 7), v14:NextNumber(-7, 7), v14:NextNumber(-7, 7)), l_character_0:GetPivot().Position + Vector3.new(v14:NextNumber(-3, 3), v14:NextNumber(-3, 3), v14:NextNumber(-3, 3)), 3, 6, 3, 0.05, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.05);
                        l_Lightning_0:CreateArc(l_cast_0.Position, l_cast_0.Position + Vector3.new(Vector3.new(v14:NextNumber(-30, 30), v14:NextNumber(-30, 30), v14:NextNumber(-30, 30)).X, Vector3.new(v14:NextNumber(0, 30), v14:NextNumber(0, 30), v14:NextNumber(0, 30)), Vector3.new(v14:NextNumber(-30, 30), v14:NextNumber(-30, 30), v14:NextNumber(-30, 30)).Z), 2, 6, 4, 0.15, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.075);
                        task.wait(0.02);
                    end;
                end);
                l_Destruction_0:flyDebris(6, l_cast_0, 17.5, 12.5);
            end;
        end;
        if l_Players_0.LocalPlayer == v73.user then
            local l_Humanoid_1 = l_character_0.Humanoid;
            local v97 = 0.75;
            local l_spawn_0 = task.spawn;
            local v99 = 0.75;
            local v100 = 0.002;
            local l_l_Humanoid_1_0 = l_Humanoid_1 --[[ copy: 11 -> 17 ]];
            do
                local l_v97_0 = v97;
                l_spawn_0(function() --[[ Line: 93 ]]
                    -- upvalues: l_v97_0 (ref), v99 (copy), l_l_Humanoid_1_0 (copy), v14 (ref), v100 (copy)
                    for _ = 1, 100 do
                        l_v97_0 = l_v97_0 - v99 / 100;
                        l_l_Humanoid_1_0.CameraOffset = Vector3.new(v14:NextNumber(-l_v97_0, l_v97_0), v14:NextNumber(-l_v97_0, l_v97_0), v14:NextNumber(-l_v97_0, l_v97_0));
                        task.wait(v100);
                    end;
                end);
            end;
            l_spawn_0 = Instance.new("Part");
            l_spawn_0.Transparency = 1;
            l_spawn_0.Anchored = true;
            l_spawn_0.CanCollide = false;
            l_spawn_0.CanQuery = false;
            l_spawn_0.CanTouch = false;
            l_spawn_0.Size = Vector3.new(15, 10.5, 0.25, 0);
            l_spawn_0.Name = "windParticle";
            l_spawn_0.Parent = workspace;
            local v104 = script.WindParticles:Clone();
            v104.Parent = l_spawn_0;
            l_Humanoid_1 = l_spawn_0;
            v97 = v104;
            l_spawn_0 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 324 ]]
                -- upvalues: l_Humanoid_1 (copy), l_CurrentCamera_0 (ref)
                l_Humanoid_1.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -1.75);
            end);
            v97.Enabled = true;
            task.delay(1.6, function() --[[ Line: 330 ]]
                -- upvalues: v97 (copy), l_spawn_0 (copy), l_Humanoid_1 (copy)
                v97.Enabled = false;
                task.wait(1);
                l_spawn_0:Disconnect();
                l_Humanoid_1:Destroy();
            end);
        end;
        return;
    end;
end;
v72.client.createSlamDownParticle = function(v105, v106) --[[ Line: 340 ]] --[[ Name: createSlamDownParticle ]]
    -- upvalues: l_Players_0 (copy), l_Smite_0 (copy), v26 (copy), v21 (copy), v71 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_Lightning_0 (copy), v14 (copy), l_Debris_0 (copy)
    if v105.user == l_Players_0.LocalPlayer and v106 == "server" then
        return;
    else
        local l_character_1 = v105.character;
        local l_states_0 = v105.states;
        local l_tool_0 = v105.tool;
        local l_Position_3 = l_character_1.HumanoidRootPart.Position;
        local v111 = l_Smite_0.TorsoWind2:Clone();
        v111.Parent = workspace;
        v26(v111, true);
        v26(v111.Wind1, true);
        local v112 = l_Smite_0.smiteUse:Clone();
        v112.Parent = l_character_1.UpperTorso;
        v21(v112, 8);
        v26(v112.Shine, true);
        v71(1, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), function(v113) --[[ Line: 361 ]]
            -- upvalues: l_states_0 (copy), l_tool_0 (copy)
            if l_states_0.equipped and l_states_0.using then
                l_tool_0:ScaleTo(1 + v113);
            end;
        end);
        task.delay(0.65, function() --[[ Line: 367 ]]
            -- upvalues: v111 (copy), l_TweenService_0 (ref)
            for _, v115 in pairs(v111.Wind1.Beams:GetChildren()) do
                local v116 = l_TweenService_0:Create(v115, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Brightness = 1
                });
                v116.Completed:Once(function() --[[ Line: 26 ]]
                    -- upvalues: v116 (copy)
                    v116:Destroy();
                end);
                v116:Play();
            end;
        end);
        if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
            local v117 = 0;
            do
                local l_v117_0 = v117;
                local v125 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 378 ]]
                    -- upvalues: l_character_1 (copy), l_Position_3 (ref), v111 (copy), l_v117_0 (ref), l_Lightning_0 (ref), v14 (ref), v26 (ref)
                    local l_Position_4 = l_character_1.HumanoidRootPart.Position;
                    local l_Unit_2 = (l_Position_4 - l_Position_3).Unit;
                    v111.CFrame = CFrame.lookAt(l_Position_4, l_Position_4 + l_Unit_2);
                    local v121 = RaycastParams.new();
                    v121.FilterType = Enum.RaycastFilterType.Include;
                    v121.FilterDescendantsInstances = {
                        workspace.Map
                    };
                    local v122 = OverlapParams.new();
                    v122.FilterType = Enum.RaycastFilterType.Include;
                    v122.FilterDescendantsInstances = {
                        workspace.Map
                    };
                    local l_workspace_PartBoundsInRadius_0 = workspace:GetPartBoundsInRadius(l_character_1.HumanoidRootPart.Position, 100, v122);
                    local v124 = workspace:Raycast(l_character_1.HumanoidRootPart.Position, Vector3.new(0, -350, 0, 0), v121);
                    if v124 and l_Position_3.Y > l_character_1.HumanoidRootPart.Position.Y and tick() - l_v117_0 > 0.025 then
                        l_Lightning_0:CreateArc(l_character_1.HumanoidRootPart.Position + Vector3.new(v14:NextNumber(-3, 3), v14:NextNumber(-3, 3), v14:NextNumber(-3, 3)) + Vector3.new(0, -5, 0, 0), v124.Position + Vector3.new(v14:NextNumber(-35, 35), v14:NextNumber(-35, 35), v14:NextNumber(-35, 35)) + Vector3.new(0, 100, 0, 0), 1.5, 6, 3, 0.1, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.05);
                        l_Lightning_0:CreateArc(l_character_1.HumanoidRootPart.Position + Vector3.new(v14:NextNumber(-3, 3), v14:NextNumber(-3, 3), v14:NextNumber(-3, 3)) + Vector3.new(0, -5, 0, 0), v124.Position + Vector3.new(v14:NextNumber(-35, 35), v14:NextNumber(-35, 35), v14:NextNumber(-35, 35)), 1.5, 6, 3, 0.1, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.05);
                        if #l_workspace_PartBoundsInRadius_0 > 10 then
                            l_Lightning_0:CreateArc(l_character_1.HumanoidRootPart.Position + Vector3.new(v14:NextNumber(-3, 3), v14:NextNumber(-3, 3), v14:NextNumber(-3, 3)) + Vector3.new(0, -5, 0, 0), l_workspace_PartBoundsInRadius_0[math.random(1, #l_workspace_PartBoundsInRadius_0)].Position, 1.5, 6, 3, 0.1, ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                                ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                                ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                            }), 0.05);
                        end;
                        v26(v111.Down, true);
                        l_v117_0 = tick();
                    end;
                    l_Position_3 = l_character_1.HumanoidRootPart.Position;
                end);
                task.delay(1, function() --[[ Line: 413 ]]
                    -- upvalues: v111 (copy), l_TweenService_0 (ref)
                    for _, v127 in pairs(v111.Wind1.Beams:GetChildren()) do
                        local v128 = l_TweenService_0:Create(v127, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Brightness = 0
                        });
                        v128.Completed:Once(function() --[[ Line: 26 ]]
                            -- upvalues: v128 (copy)
                            v128:Destroy();
                        end);
                        v128:Play();
                    end;
                end);
                task.delay(1.2, function() --[[ Line: 421 ]]
                    -- upvalues: v125 (copy), v26 (ref), v111 (copy), l_Debris_0 (ref)
                    v125:Disconnect();
                    v26(v111, false);
                    v26(v111.Down, false);
                    v26(v111.Wind1, false);
                    l_Debris_0:AddItem(v111, 4);
                end);
                task.delay(1.3, function() --[[ Line: 431 ]]
                    -- upvalues: v26 (ref), v112 (copy), l_Debris_0 (ref)
                    v26(v112.Shine, false);
                    l_Debris_0:AddItem(v112, 5);
                end);
                task.spawn(function() --[[ Line: 437 ]]
                    -- upvalues: l_character_1 (copy), l_Position_3 (ref), l_Smite_0 (ref), l_TweenService_0 (ref), l_Debris_0 (ref)
                    for _ = 1, 2 do
                        local l_Unit_3 = (l_character_1.HumanoidRootPart.Position - l_Position_3).Unit;
                        local v131 = l_Smite_0.Wind2:Clone();
                        v131.Parent = workspace;
                        v131.CFrame = CFrame.lookAt(l_character_1.HumanoidRootPart.Position, l_character_1.HumanoidRootPart.Position + l_Unit_3) * CFrame.Angles(1.5707963267948966, 0, 0);
                        v131.Size = Vector3.new(0, 0, 0, 0);
                        local v132 = l_TweenService_0:Create(v131, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Size = Vector3.new(45.69685363769531, 23.970001220703125, 45.69685363769531, 0), 
                            Transparency = 1
                        });
                        v132.Completed:Once(function() --[[ Line: 26 ]]
                            -- upvalues: v132 (copy)
                            v132:Destroy();
                        end);
                        v132:Play();
                        l_Debris_0:AddItem(v131, 0.35);
                        l_Position_3 = l_character_1.HumanoidRootPart.Position;
                        task.wait(0.2);
                    end;
                end);
            end;
        end;
        return;
    end;
end;
v72.client.createSlam = function(v133, v134) --[[ Line: 461 ]] --[[ Name: createSlam ]]
    -- upvalues: l_Players_0 (copy), l_Smite_0 (copy), v21 (copy), l_Debris_0 (copy), v14 (copy), l_TweenService_0 (copy), l_Destruction_0 (copy), v26 (copy), l_Lightning_0 (copy), v32 (copy)
    if v133.user == l_Players_0.LocalPlayer and v134 == "server" then
        return;
    else
        local l_character_2 = v133.character;
        local l_cast_1 = v133.cast;
        v133.tool:ScaleTo(1);
        local l_Normal_1 = l_cast_1.Normal;
        local v138 = CFrame.lookAt(l_cast_1.Position, l_cast_1.Position + l_Normal_1);
        local v139 = l_Smite_0.Smite:Clone();
        v139.Parent = workspace;
        v139.CFrame = v138;
        v21(v139.Main, 7);
        v21(v139.Main.Wind1, 7);
        local l_Environment_1 = workspace:WaitForChild("Map"):WaitForChild("Environment");
        if l_cast_1.Instance:IsDescendantOf(l_Environment_1:WaitForChild("Terrain")) then
            v21(v139.Crack);
        end;
        l_Debris_0:AddItem(v139, 5);
        if l_Players_0.LocalPlayer:GetAttribute("ToolVFX") then
            task.spawn(function() --[[ Line: 493 ]]
                -- upvalues: l_Smite_0 (ref), v138 (copy), v14 (ref), l_TweenService_0 (ref), l_Debris_0 (ref), l_Destruction_0 (ref), l_cast_1 (copy), v26 (ref)
                for v141 = 1, 6 do
                    local v142 = l_Smite_0.Wind:Clone();
                    v142.Parent = workspace;
                    v142.CFrame = v138 * CFrame.Angles(-1.5707963267948966, math.rad((v14:NextNumber(-360, 360))), 0);
                    v142.Size = Vector3.new(5, 10, 5, 0);
                    local v143 = l_TweenService_0:Create(v142, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = Vector3.new(22.5, 5.949999809265137, 22.56999969482422, 0) * (v141 / 1.25 + 1), 
                        Transparency = 1
                    });
                    v143.Completed:Once(function() --[[ Line: 26 ]]
                        -- upvalues: v143 (copy)
                        v143:Destroy();
                    end);
                    v143:Play();
                    l_Debris_0:AddItem(v142, 3);
                    l_Destruction_0:flyDebris(5, l_cast_1, 25, 15, function(v144, v145) --[[ Line: 507 ]]
                        -- upvalues: l_Smite_0 (ref), v26 (ref), l_Debris_0 (ref)
                        if v144.Transparency == 1 then
                            return;
                        elseif v144.Size.X < 1.5 or v144.Size.Y < 1.5 or v144.Size.Z < 1.5 then
                            return;
                        else
                            local v146 = {};
                            for _, v148 in pairs(l_Smite_0.debrisParticles:GetChildren()) do
                                v148 = v148:Clone();
                                v148.Parent = v144;
                                if v148:IsA("ParticleEmitter") then
                                    v148.Enabled = true;
                                else
                                    v26(v148, true);
                                end;
                                table.insert(v146, v148);
                            end;
                            task.delay(v145 / 2.2, function() --[[ Line: 526 ]]
                                -- upvalues: v146 (copy), v26 (ref), l_Debris_0 (ref)
                                for _, v150 in pairs(v146) do
                                    if v150:IsA("ParticleEmitter") then
                                        v150.Enabled = false;
                                    else
                                        v26(v150, false);
                                    end;
                                    l_Debris_0:AddItem(v150, 1.5);
                                end;
                            end);
                            return;
                        end;
                    end);
                    task.wait(0.1);
                end;
            end);
            task.spawn(function() --[[ Line: 543 ]]
                -- upvalues: l_Smite_0 (ref), v138 (copy), v14 (ref), l_TweenService_0 (ref), l_Debris_0 (ref)
                for _ = 1, 2 do
                    local v152 = l_Smite_0.Wind:Clone();
                    v152.Parent = workspace;
                    v152.CFrame = v138 * CFrame.Angles(-1.5707963267948966, math.rad((v14:NextNumber(-360, 360))), 0);
                    v152.Size = Vector3.new(22.5, 112.5, 22.5, 0);
                    v152.Transparency = 0;
                    v152.Color = Color3.fromRGB(51, 156, 255);
                    local v153 = l_TweenService_0:Create(v152, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Size = Vector3.new(82.5, 32.724998474121094, 82.5, 0), 
                        Transparency = 1
                    });
                    v153.Completed:Once(function() --[[ Line: 26 ]]
                        -- upvalues: v153 (copy)
                        v153:Destroy();
                    end);
                    v153:Play();
                    l_Debris_0:AddItem(v152, 0.3);
                    task.wait(0.3);
                end;
            end);
            task.spawn(function() --[[ Line: 564 ]]
                -- upvalues: l_Smite_0 (ref), v138 (copy), v14 (ref), l_TweenService_0 (ref), l_Debris_0 (ref)
                for _ = 1, 2 do
                    local v155 = l_Smite_0.Wind2:Clone();
                    v155.Parent = workspace;
                    v155.CFrame = v138 * CFrame.Angles(-1.5707963267948966, math.rad((v14:NextNumber(-360, 360))), 0);
                    v155.Size = Vector3.new(75, 250, 75, 0);
                    v155.Transparency = 0;
                    v155.Color = Color3.fromRGB(51, 156, 255);
                    local v156 = l_TweenService_0:Create(v155, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = Vector3.new(135, 53.54999923706055, 135, 0), 
                        Transparency = 1
                    });
                    v156.Completed:Once(function() --[[ Line: 26 ]]
                        -- upvalues: v156 (copy)
                        v156:Destroy();
                    end);
                    v156:Play();
                    l_Debris_0:AddItem(v155, 0.3);
                    task.wait(0.15);
                end;
            end);
            local v157 = true;
            do
                local l_v157_0 = v157;
                task.spawn(function() --[[ Line: 586 ]]
                    -- upvalues: l_v157_0 (ref), l_Lightning_0 (ref), l_cast_1 (copy), v14 (ref)
                    while l_v157_0 do
                        l_Lightning_0:CreateArc(l_cast_1.Position + Vector3.new(v14:NextNumber(-35, 35), v14:NextNumber(-35, 35), v14:NextNumber(-35, 35)) + Vector3.new(0, 125, 0, 0), l_cast_1.Position + Vector3.new(v14:NextNumber(-13, 13), v14:NextNumber(-13, 13), v14:NextNumber(-13, 13)), 2.5, 6, 3, 0.1, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.05);
                        l_Lightning_0:CreateArc(l_cast_1.Position + Vector3.new(v14:NextNumber(-15, 15), v14:NextNumber(-15, 15), v14:NextNumber(-15, 15)), l_cast_1.Position + Vector3.new(v14:NextNumber(-35, 35), v14:NextNumber(-35, 35), v14:NextNumber(-35, 35)), 1.5, 6, 3, 0.05, ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")), 
                            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00ffff")), 
                            ColorSequenceKeypoint.new(1, Color3.fromHex("#0055ff"))
                        }), 0.085);
                        task.wait(0.0075);
                    end;
                end);
                task.delay(1, function() --[[ Line: 595 ]]
                    -- upvalues: l_v157_0 (ref)
                    l_v157_0 = false;
                end);
            end;
        end;
        if l_Players_0.LocalPlayer == v133.user then
            local l_Humanoid_2 = l_character_2.Humanoid;
            local v160 = 0.85;
            local l_spawn_1 = task.spawn;
            local v162 = 0.85;
            local v163 = 0.004;
            do
                local l_v160_0 = v160;
                l_spawn_1(function() --[[ Line: 93 ]]
                    -- upvalues: l_v160_0 (ref), v162 (copy), l_Humanoid_2 (copy), v14 (ref), v163 (copy)
                    for _ = 1, 100 do
                        l_v160_0 = l_v160_0 - v162 / 100;
                        l_Humanoid_2.CameraOffset = Vector3.new(v14:NextNumber(-l_v160_0, l_v160_0), v14:NextNumber(-l_v160_0, l_v160_0), v14:NextNumber(-l_v160_0, l_v160_0));
                        task.wait(v163);
                    end;
                end);
            end;
        end;
        v32(56, 0.6, 2.5, 0.2);
        return;
    end;
end;
v72.client.assignTool = function(_, v167, v168) --[[ Line: 607 ]] --[[ Name: assignTool ]]
    -- upvalues: l_utils_0 (copy), v26 (copy), v54 (copy), l_CurrentCamera_0 (copy), l_RunService_0 (copy), v59 (copy), v72 (copy)
    local l_FirstChild_0 = l_utils_0.scr.events:FindFirstChild(v168:GetAttribute("UID"));
    if not l_FirstChild_0 then
        return;
    else
        local l_Character_0 = v167.Character;
        local l_Handle_0 = v168:WaitForChild("Handle");
        local v172 = {
            loadedAnims = false, 
            equipped = false, 
            using = false, 
            utils = {}, 
            conns = {}, 
            anims = {}, 
            guide = nil, 
            bodyVelocity = nil, 
            bounceCooldown = false, 
            cooldown = false
        };
        local function v182(v173, v174) --[[ Line: 632 ]] --[[ Name: discardAll ]]
            -- upvalues: v167 (copy), v172 (copy), v26 (ref), v168 (copy), v54 (ref), l_CurrentCamera_0 (ref)
            local l_Humanoid_3 = v167.Character:FindFirstChild("Humanoid");
            for _, v177 in pairs(v172.anims) do
                v177:Stop();
            end;
            for _, v179 in pairs(v172.conns) do
                v179:Disconnect();
            end;
            for _, v181 in pairs(v172.utils) do
                v181:Destroy();
            end;
            if not v174 then
                v26(v168.Handle, false);
                v168:ScaleTo(1);
            end;
            v172.using = false;
            v172.conns = {};
            v172.utils = {};
            l_Humanoid_3.WalkSpeed = 16;
            l_Humanoid_3.JumpHeight = 7.2;
            if v172.bodyVelocity then
                v172.bodyVelocity:Destroy();
                v172.bodyVelocity = nil;
            end;
            if v172.vectorForce then
                v172.vectorForce:Destroy();
                v172.vectorForce = nil;
            end;
            if v173 then
                v172.cooldown = true;
                task.delay(v54.cooldownTime, function() --[[ Line: 675 ]]
                    -- upvalues: v172 (ref)
                    v172.cooldown = false;
                end);
                if l_Humanoid_3 then
                    l_CurrentCamera_0.CameraSubject = l_Humanoid_3;
                end;
            end;
        end;
        local v183 = {
            onTool = {}
        };
        v183.onTool.equip = v168.Equipped:Connect(function() --[[ Line: 689 ]]
            -- upvalues: v167 (copy), v172 (copy), v26 (ref), l_Handle_0 (copy)
            local l_Character_1 = v167.Character;
            if not l_Character_1 then
                return;
            else
                v172.guide = l_Character_1:WaitForChild("HumanoidRootPart"):WaitForChild("hammerGuide");
                if not v172.loadedAnims then
                    local l_Humanoid_4 = l_Character_1.Humanoid;
                    for _, v187 in pairs(script.Animations:GetChildren()) do
                        local v188 = l_Humanoid_4:LoadAnimation(v187);
                        v172.anims[v187.Name] = v188;
                    end;
                    v172.loadedAnims = true;
                end;
                v172.equipped = true;
                v172.anims.equip:Play();
                v26(l_Handle_0.Diamonds, true);
                return;
            end;
        end);
        v183.onTool.unequip = v168.Unequipped:Connect(function() --[[ Line: 712 ]]
            -- upvalues: v167 (copy), v172 (copy), v182 (copy)
            if not v167.Character then
                return;
            elseif not v172.equipped then
                return;
            else
                v172.equipped = false;
                if v172.using then
                    v182(true);
                    return;
                else
                    v182();
                    return;
                end;
            end;
        end);
        v183.onTool.activated = v168.Activated:Connect(function() --[[ Line: 727 ]]
            -- upvalues: v172 (copy), l_Character_0 (copy), l_Handle_0 (copy), l_RunService_0 (ref), v182 (copy), v54 (ref), v59 (ref), v167 (copy), v72 (ref), l_FirstChild_0 (copy), v26 (ref), v168 (copy), l_CurrentCamera_0 (ref)
            if not v172.equipped then
                return;
            elseif v172.using then
                return;
            elseif v172.cooldown then
                return;
            else
                local l_VectorForce_0 = Instance.new("VectorForce");
                l_VectorForce_0.Attachment0 = v172.guide;
                l_VectorForce_0.ApplyAtCenterOfMass = true;
                l_VectorForce_0.Force = Vector3.new(0, 250, 0, 0);
                l_VectorForce_0.RelativeTo = Enum.ActuatorRelativeTo.World;
                l_VectorForce_0.Parent = l_Character_0.HumanoidRootPart;
                v172.vectorForce = l_VectorForce_0;
                v172.anims.launch:Play();
                l_Handle_0.Activate:Play();
                v172.using = true;
                task.delay(0.95, function() --[[ Line: 747 ]]
                    -- upvalues: v172 (ref), l_Character_0 (ref), l_RunService_0 (ref), v182 (ref), v54 (ref), v59 (ref), v167 (ref), v72 (ref), l_FirstChild_0 (ref), v26 (ref), l_Handle_0 (ref), v168 (ref), l_CurrentCamera_0 (ref)
                    if not v172.equipped or not v172.using then
                        return;
                    else
                        local v190 = tick();
                        local v191 = false;
                        local v192 = true;
                        local l_Part_1 = Instance.new("Part");
                        l_Part_1.Transparency = 1;
                        l_Part_1.Anchored = true;
                        l_Part_1.CanCollide = false;
                        l_Part_1.CanQuery = false;
                        l_Part_1.CanTouch = false;
                        l_Part_1.Size = Vector3.new(15, 10.5, 0.25, 0);
                        l_Part_1.Name = "windParticle";
                        l_Part_1.Parent = workspace;
                        local v194 = script.WindParticles:Clone();
                        v194.Parent = l_Part_1;
                        local l_l_Part_1_0 = l_Part_1;
                        local l_v194_0 = v194;
                        table.insert(v172.utils, l_l_Part_1_0);
                        l_Part_1 = l_Character_0.HumanoidRootPart.Position;
                        v194 = nil;
                        v194 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 762 ]]
                            -- upvalues: v172 (ref), v182 (ref), v194 (ref), l_Character_0 (ref), v54 (ref), v192 (ref), v59 (ref), v167 (ref), v72 (ref), l_FirstChild_0 (ref), v191 (ref), v26 (ref), l_Handle_0 (ref), v168 (ref), l_l_Part_1_0 (copy), l_CurrentCamera_0 (ref), l_Part_1 (ref), l_v194_0 (copy)
                            if not v172.equipped or not v172.using then
                                v182(true);
                                v194:Disconnect();
                            end;
                            l_Character_0.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
                            local v197 = RaycastParams.new();
                            v197.FilterType = Enum.RaycastFilterType.Include;
                            v197.FilterDescendantsInstances = {
                                workspace.Map
                            };
                            local v198 = workspace:Raycast(l_Character_0.HumanoidRootPart.Position, Vector3.new(0, -1, 0, 0) * v54.interactHeight, v197);
                            if v198 then
                                if v192 then
                                    if v172.bounceCooldown then
                                        return;
                                    else
                                        if v172.bodyVelocity then
                                            v172.bodyVelocity:Destroy();
                                            v172.bodyVelocity = nil;
                                        end;
                                        v172.anims.bounce:Play();
                                        v59(l_Character_0, v172);
                                        local v199 = {
                                            user = v167, 
                                            character = l_Character_0, 
                                            cast = {
                                                Normal = v198.Normal, 
                                                Position = v198.Position, 
                                                Instance = v198.Instance
                                            }
                                        };
                                        v72.client.createBounceParticle(v199, "client");
                                        l_FirstChild_0.toggleParticle:FireServer("createBounceParticle", v199);
                                        return;
                                    end;
                                elseif v191 then
                                    v182(true);
                                    v26(l_Handle_0.Diamonds, true);
                                    v172.anims.smite:Play();
                                    v172.anims.equip:Play();
                                    l_Character_0.Humanoid.WalkSpeed = 0;
                                    l_Character_0.Humanoid.JumpHeight = 0;
                                    l_Character_0.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
                                    local v200 = workspace:Raycast((l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3.5)).Position, Vector3.new(0, -35, 0, 0), v197);
                                    local v201 = {
                                        user = v167, 
                                        character = l_Character_0, 
                                        cast = {
                                            Normal = v198.Normal or v200.Normal, 
                                            Position = v198.Position or v200.Position, 
                                            Instance = v198.Instance or v200.Instance
                                        }, 
                                        tool = v168
                                    };
                                    v72.client.createSlam(v201, "client");
                                    l_FirstChild_0.toggleParticle:FireServer("createSlam", v201);
                                    task.delay(2, function() --[[ Line: 815 ]]
                                        -- upvalues: v172 (ref), l_Character_0 (ref)
                                        if v172.equipped and not v172.using then
                                            l_Character_0.Humanoid.WalkSpeed = 16;
                                            l_Character_0.Humanoid.JumpHeight = 7.2;
                                        end;
                                    end);
                                    return;
                                end;
                            end;
                            if table.find(v172.utils, l_l_Part_1_0) then
                                l_l_Part_1_0.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -1.75);
                            end;
                            if v192 and l_Part_1.Y < l_Character_0.HumanoidRootPart.Position.Y or v191 and l_Part_1.Y > l_Character_0.HumanoidRootPart.Position.Y then
                                l_v194_0.Enabled = true;
                                if l_Handle_0.Spin.IsPlaying then
                                    l_Handle_0.Spin:Pause();
                                end;
                            else
                                l_v194_0.Enabled = false;
                                if not l_Handle_0.Spin.IsPlaying and v172.using then
                                    l_Handle_0.Spin:Play();
                                end;
                            end;
                            l_Part_1 = l_Character_0.HumanoidRootPart.Position;
                        end);
                        table.insert(v172.conns, v194);
                        local v202 = nil;
                        v202 = v168.Activated:Connect(function() --[[ Line: 853 ]]
                            -- upvalues: v190 (copy), v192 (ref), v191 (ref), v202 (ref), v172 (ref), v167 (ref), l_Character_0 (ref), v168 (ref), l_FirstChild_0 (ref), v72 (ref), v54 (ref)
                            if tick() - v190 < 0.6 then
                                return;
                            else
                                if v192 and not v191 then
                                    v192 = false;
                                    v191 = true;
                                    v202:Disconnect();
                                    table.remove(v172.conns, table.find(v172.conns, v202));
                                    if v172.bodyVelocity then
                                        v172.bodyVelocity:Destroy();
                                        v172.bodyVelocity = nil;
                                    end;
                                    local v203 = {
                                        user = v167, 
                                        character = l_Character_0, 
                                        states = v172, 
                                        tool = v168
                                    };
                                    l_FirstChild_0.toggleParticle:FireServer("createSlamDownParticle", v203);
                                    v72.client.createSlamDownParticle(v203, "client");
                                    local l_l_Character_0_0 = l_Character_0;
                                    local l_v172_0 = v172;
                                    local l_BodyVelocity_3 = Instance.new("BodyVelocity");
                                    l_BodyVelocity_3.Parent = l_l_Character_0_0.HumanoidRootPart;
                                    l_BodyVelocity_3.MaxForce = Vector3.new(150000, 150000, 150000, 0);
                                    local l_l_BodyVelocity_3_0 = l_BodyVelocity_3;
                                    l_l_BodyVelocity_3_0.Velocity = l_l_Character_0_0.Humanoid.MoveDirection * (v54.range / 2) + Vector3.new(0, 150, 0, 0);
                                    task.delay(0.2, function() --[[ Line: 182 ]]
                                        -- upvalues: l_l_BodyVelocity_3_0 (copy), l_v172_0 (copy), l_l_Character_0_0 (copy)
                                        l_l_BodyVelocity_3_0:Destroy();
                                        if l_v172_0.vectorForce then
                                            l_v172_0.vectorForce.Force = Vector3.new(l_l_Character_0_0.HumanoidRootPart.Position.X, -2500, l_l_Character_0_0.HumanoidRootPart.Position.Z);
                                        end;
                                    end);
                                    v172.anims.flyingSmite:Play();
                                    v172.anims.bounce:Stop();
                                    v172.anims.flyingSpinning:Stop();
                                end;
                                return;
                            end;
                        end);
                        table.insert(v172.conns, v202);
                        return;
                    end;
                end);
                return;
            end;
        end);
        v183.onTool.destroying = v168.Destroying:Connect(function() --[[ Line: 885 ]]
            -- upvalues: v183 (copy), v182 (copy), v172 (copy)
            for _, v209 in pairs(v183.onTool) do
                v209:Disconnect();
            end;
            v182(v172.using, true);
        end);
        return;
    end;
end;
v72.server.assignTool = function(_, v211, v212) --[[ Line: 894 ]] --[[ Name: assignTool ]]
    -- upvalues: l_utils_0 (copy), l_Parent_0 (copy), v72 (copy), v54 (copy)
    local v213 = v211.Character or v211.CharacterAdded:Wait();
    local l_Handle_1 = v212:WaitForChild("Handle");
    local v215 = l_utils_0.server:getUID("SmiteHammer");
    v212:SetAttribute("UID", v215);
    v212:SetAttribute("folderID", script.Parent.Name);
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = v215;
    l_Folder_0.Parent = l_Parent_0.utils.events;
    local v217 = {
        events = {
            toggleParticle = l_utils_0.server:createRemoteEvent("toggleParticle", l_Folder_0, v211)
        }, 
        onTool = {}, 
        tool = v212
    };
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "hammerGuide";
    l_Attachment_0.Parent = v213:WaitForChild("HumanoidRootPart");
    l_Handle_1.Connect.Part0 = v213:WaitForChild("RightHand");
    v217.onTool.equip = v212.Equipped:Connect(function() --[[ Line: 922 ]]
        -- upvalues: v211 (copy), l_Handle_1 (copy)
        local l_Character_2 = v211.Character;
        if not l_Character_2 then
            return;
        else
            local v220 = l_Character_2.RightHand:WaitForChild("RightGrip", 5);
            if v220 and v220.Part1 == l_Handle_1 then
                v220:Destroy();
            end;
            return;
        end;
    end);
    local v221 = tick();
    v217.onTool.toggleParticle = v217.events.toggleParticle.OnServerEvent(function(v222, v223) --[[ Line: 934 ]]
        -- upvalues: v72 (ref), v221 (ref), v211 (copy), l_utils_0 (ref), v213 (copy), v54 (ref)
        if not v72.client[v222] then
            return;
        elseif tick() - v221 < 0.3 then
            return;
        else
            v221 = tick();
            v223.user = v211;
            l_utils_0.server:replicateToClientInRange("Smite Hammer", v222, v213:GetPivot().Position, v54.renderDistance, v223);
            return;
        end;
    end);
    v217.destroy = function() --[[ Line: 944 ]]
        -- upvalues: v217 (copy), l_Attachment_0 (copy)
        for _, v225 in pairs(v217.onTool) do
            v225:Disconnect();
        end;
        l_Attachment_0:Destroy();
    end;
    return v217;
end;
return v72;