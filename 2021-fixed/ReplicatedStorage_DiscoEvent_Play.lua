-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_SoundService_0 = game:GetService("SoundService");
local l_Assets_0 = script.Parent:WaitForChild("Assets");
local l_Rift_0 = require(l_Assets_0:WaitForChild("Rift"));
local _ = Random.new();
local v8 = {
    Color3.fromRGB(255, 0, 4), 
    Color3.fromRGB(255, 94, 20), 
    Color3.fromRGB(255, 237, 34), 
    Color3.fromRGB(67, 255, 25), 
    Color3.fromRGB(0, 166, 255), 
    Color3.fromRGB(255, 0, 255)
};
local _ = function(v9, v10, v11) --[[ Line: 27 ]] --[[ Name: LoadAnimations ]]
    local v12 = tick();
    local v13 = {};
    for _, v15 in pairs(v10:GetChildren()) do
        v13[v15.Name] = v9.Animator:LoadAnimation(v15);
        if v11 then
            repeat
                task.wait();
            until v13[v15.Name].Length > 0;
        end;
    end;
    warn("Rig animations loaded in " .. tick() - v12 .. " seconds");
    return v13;
end;
local _ = function(v17) --[[ Line: 43 ]] --[[ Name: Emit ]]
    for _, v19 in pairs(v17:GetChildren()) do
        if v19:IsA("ParticleEmitter") then
            v19:Emit(v19:GetAttribute("EmitCount"));
        elseif v19:IsA("Sound") then
            v19:Play();
        end;
    end;
end;
local function v25(v21, v22) --[[ Line: 53 ]] --[[ Name: Enable ]]
    for _, v24 in pairs(v21:GetChildren()) do
        if v24:IsA("ParticleEmitter") or v24:IsA("Trail") or v24:IsA("Beam") then
            v24.Enabled = v22;
        elseif v24:IsA("Sound") then
            if v22 then
                v24:Play();
            else
                v24:Stop();
            end;
        end;
    end;
end;
local function _(v26, v27, v28) --[[ Line: 67 ]] --[[ Name: EmitSound ]]
    local v29 = v27:Clone();
    v29.Parent = v26;
    v29.Volume = v28;
    v29:Play();
    task.spawn(function() --[[ Line: 74 ]]
        -- upvalues: v29 (copy)
        repeat
            task.wait();
        until v29.TimeLength > 0;
        task.delay(v29.TimeLength, function() --[[ Line: 77 ]]
            -- upvalues: v29 (ref)
            v29:Destroy();
        end);
    end);
end;
local function v37(v31, v32, v33) --[[ Line: 84 ]] --[[ Name: ScaleModel ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_NumberValue_0 = Instance.new("NumberValue");
    local v35 = l_TweenService_0:Create(l_NumberValue_0, v32, {
        Value = v31
    });
    v35:Play();
    local v36 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 93 ]]
        -- upvalues: v33 (copy), l_NumberValue_0 (copy)
        v33(l_NumberValue_0.Value);
    end);
    v35.Completed:Once(function() --[[ Line: 97 ]]
        -- upvalues: v36 (copy), v35 (copy), l_NumberValue_0 (copy)
        v36:Disconnect();
        v35:Destroy();
        l_NumberValue_0:Destroy();
    end);
end;
local v38 = {};
local v39 = {
    Offset = l_Lighting_0.Atmosphere.Offset, 
    Density = l_Lighting_0.Atmosphere.Density, 
    Haze = l_Lighting_0.Atmosphere.Haze, 
    Color = l_Lighting_0.Atmosphere.Color, 
    Decay = l_Lighting_0.Atmosphere.Decay, 
    Glare = l_Lighting_0.Atmosphere.Glare
};
local v40 = false;
v38.PlayEffect = function(_, v42) --[[ Line: 118 ]] --[[ Name: PlayEffect ]]
    -- upvalues: v40 (ref), l_Players_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_Rift_0 (copy), l_Assets_0 (copy), v37 (copy), l_SoundService_0 (copy), v25 (copy), v8 (copy), l_RunService_0 (copy), v39 (copy)
    if workspace:FindFirstChild("Debris") then
        workspace.Debris:Destroy();
    end;
    v40 = true;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Parent = workspace;
    l_Folder_0.Name = "Debris";
    local l_DiscoEvent_0 = workspace:WaitForChild("DiscoEvent");
    if not l_DiscoEvent_0 then
        return;
    else
        local v47 = l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ClockTime = 23.5, 
            GeographicLatitude = 237
        });
        local v48 = {
            ClockTime = l_Lighting_0.ClockTime, 
            GeographicLatitude = l_Lighting_0.ClockTime
        };
        local v49 = l_TweenService_0:Create(l_Lighting_0.Atmosphere, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Offset = 0, 
            Density = 0.3, 
            Glare = 10
        });
        v47:Play();
        v49:Play();
        task.wait(v49.TweenInfo.Time / 2);
        print("rift");
        l_Rift_0:Rift(l_DiscoEvent_0.Discoball.CFrame * CFrame.new(0, 100, 0) * CFrame.Angles(3.141592653589793, 0, 0), 2, false, {
            AutoCloseRift = true, 
            AutoSlowBeams = true
        });
        print("pre discoball");
        local v50 = l_Assets_0.Models.DiscoBall:Clone();
        v50:ScaleTo(0.01);
        v50:PivotTo(l_DiscoEvent_0.Discoball.CFrame);
        print("discoball clooned and scaled");
        v50.Parent = l_Folder_0;
        print("discoball parnted");
        v37(40, TweenInfo.new(1.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(v51) --[[ Line: 173 ]]
            -- upvalues: v50 (copy)
            v50:ScaleTo(0.01 + v51);
        end);
        task.wait(v49.TweenInfo.Time / 4);
        print("premusic clone");
        local v52 = workspace.Sound:Clone();
        v52.SoundId = "rbxassetid://" .. v42;
        v52.Parent = l_Folder_0;
        v52:Play();
        print("music cloned and played");
        print("music sound id is", v52.SoundId);
        print("music loaded:", v52.isLoaded);
        repeat
            task.wait();
        until v52.TimeLength > 0;
        l_SoundService_0.AmbientReverb = Enum.ReverbType.Arena;
        print("preenable disco");
        v25(v50.PrimaryPart.Main, true);
        print("disco enabled");
        for _, v54 in pairs(l_DiscoEvent_0.Center.Rigs:GetChildren()) do
            local v55 = l_Assets_0.Rigs[v54.Name]:Clone();
            v55:ScaleTo(0.01);
            v55.Parent = l_Folder_0;
            v37(50, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(v56) --[[ Line: 204 ]]
                -- upvalues: v55 (copy)
                v55:ScaleTo(0.01 + v56);
            end);
            local v57 = l_Assets_0.Animations:GetChildren()[math.random(1, #l_Assets_0.Animations:GetChildren())];
            v55.AnimationController.Animator:LoadAnimation(v57):Play();
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = l_Folder_0;
            l_Weld_0.Part0 = l_DiscoEvent_0.Rigs;
            l_Weld_0.Part1 = v55.HumanoidRootPart;
            l_Weld_0.C0 = v54.CFrame * CFrame.new(0, 150, 0);
            v55.HumanoidRootPart.Anchored = false;
        end;
        local v59 = nil;
        task.spawn(function() --[[ Line: 224 ]]
            -- upvalues: l_Lighting_0 (ref), v8 (ref), v40 (ref), v59 (ref), l_TweenService_0 (ref)
            l_Lighting_0.Atmosphere.Color = v8[6];
            l_Lighting_0.Atmosphere.Decay = v8[6];
            while true do
                if v40 then
                    for _, v61 in ipairs(v8) do
                        v59 = l_TweenService_0:Create(l_Lighting_0.Atmosphere, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Color = v61, 
                            Decay = v61
                        });
                        v59:Play();
                        task.wait(v59.TweenInfo.Time);
                        v59:Destroy();
                        if not v40 then
                            return;
                        end;
                    end;
                else
                    return;
                end;
            end;
        end);
        local v62 = l_Assets_0.Models.DiscoSky:Clone();
        v62:PivotTo(l_DiscoEvent_0.Center.CFrame);
        v62.Parent = l_Folder_0;
        v25(v62, true);
        local v64 = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 252 ]]
            -- upvalues: l_CurrentCamera_0 (copy), v52 (copy), l_DiscoEvent_0 (copy), v50 (copy), v62 (copy), l_Lighting_0 (ref)
            l_CurrentCamera_0.FieldOfView = 70 + v52.PlaybackLoudness / 40;
            l_DiscoEvent_0.Rigs.CFrame = l_DiscoEvent_0.Rigs.CFrame * CFrame.Angles(0, 0.008726646259971648, 0);
            v50:PivotTo(v50:GetPivot() * CFrame.Angles(0, 0.008726646259971648, 0));
            v62:PivotTo(v62:GetPivot() * CFrame.Angles(0, 0.003490658503988659, 0));
            l_Lighting_0.Atmosphere.Haze = math.clamp(v52.PlaybackLoudness / 450, 0.1, 0.75) + 1.24;
        end);
        task.wait(v52.TimeLength - 1);
        local v65 = l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
            ExposureCompensation = 10
        });
        v65:Play();
        local v66 = l_Assets_0.Sounds.End:Clone();
        v66.Parent = l_LocalPlayer_0;
        v66.Volume = 0.5;
        v66:Play();
        task.spawn(function() --[[ Line: 74 ]]
            -- upvalues: v66 (copy)
            repeat
                task.wait();
            until v66.TimeLength > 0;
            task.delay(v66.TimeLength, function() --[[ Line: 77 ]]
                -- upvalues: v66 (ref)
                v66:Destroy();
            end);
        end);
        task.wait(1);
        v64:Disconnect();
        l_CurrentCamera_0.FieldOfView = 70;
        l_SoundService_0.AmbientReverb = Enum.ReverbType.NoReverb;
        v40 = false;
        if v59 then
            v59:Cancel();
        end;
        for v67, v68 in pairs(v48) do
            l_Lighting_0[v67] = v68;
        end;
        for v69, v70 in pairs(v39) do
            l_Lighting_0.Atmosphere[v69] = v70;
        end;
        v47:Destroy();
        v49:Destroy();
        local v71 = l_TweenService_0:Create(v52, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Volume = 0
        });
        v71:Play();
        v71.Completed:Once(function() --[[ Line: 300 ]]
            -- upvalues: v71 (copy), v52 (copy)
            v71:Destroy();
            v52:Destroy();
        end);
        l_Folder_0:Destroy();
        v40 = false;
        task.wait(1);
        v65:Destroy();
        return;
    end;
end;
return v38;