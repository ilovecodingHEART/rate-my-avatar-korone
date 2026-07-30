-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_EventManager_0 = require(l_ReplicatedStorage_0:WaitForChild("EventManager"));
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_SoundService_0 = game:GetService("SoundService");
local l_Assets_0 = script.Parent:WaitForChild("Assets");
local _ = Random.new();
local v9 = {
    Color3.fromRGB(255, 0, 4), 
    Color3.fromRGB(255, 94, 20), 
    Color3.fromRGB(255, 237, 34), 
    Color3.fromRGB(67, 255, 25), 
    Color3.fromRGB(0, 166, 255), 
    Color3.fromRGB(255, 0, 255)
};
local _ = function(v10, v11, v12) --[[ Line: 30 ]] --[[ Name: LoadAnimations ]]
    local v13 = tick();
    local v14 = {};
    for _, v16 in pairs(v11:GetChildren()) do
        v14[v16.Name] = v10.Animator:LoadAnimation(v16);
        if v12 then
            repeat
                task.wait();
            until v14[v16.Name].Length > 0;
        end;
    end;
    warn("Rig animations loaded in " .. tick() - v13 .. " seconds");
    return v14;
end;
local _ = function(v18) --[[ Line: 46 ]] --[[ Name: Emit ]]
    for _, v20 in pairs(v18:GetChildren()) do
        if v20:IsA("ParticleEmitter") then
            v20:Emit(v20:GetAttribute("EmitCount"));
        elseif v20:IsA("Sound") then
            v20:Play();
        end;
    end;
end;
local function v26(v22, v23) --[[ Line: 56 ]] --[[ Name: Enable ]]
    for _, v25 in pairs(v22:GetChildren()) do
        if v25:IsA("ParticleEmitter") or v25:IsA("Trail") or v25:IsA("Beam") then
            v25.Enabled = v23;
        elseif v25:IsA("Sound") then
            if v23 then
                v25:Play();
            else
                v25:Stop();
            end;
        end;
    end;
end;
local function _(v27, v28, v29) --[[ Line: 70 ]] --[[ Name: EmitSound ]]
    local v30 = v28:Clone();
    v30.Parent = v27;
    v30.Volume = v29;
    v30:Play();
    task.spawn(function() --[[ Line: 77 ]]
        -- upvalues: v30 (copy)
        repeat
            task.wait();
        until v30.TimeLength > 0;
        task.delay(v30.TimeLength, function() --[[ Line: 80 ]]
            -- upvalues: v30 (ref)
            v30:Destroy();
        end);
    end);
end;
local function v38(v32, v33, v34) --[[ Line: 87 ]] --[[ Name: ScaleModel ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_NumberValue_0 = Instance.new("NumberValue");
    local v36 = l_TweenService_0:Create(l_NumberValue_0, v33, {
        Value = v32
    });
    v36:Play();
    local v37 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 96 ]]
        -- upvalues: v34 (copy), l_NumberValue_0 (copy)
        v34(l_NumberValue_0.Value);
    end);
    v36.Completed:Once(function() --[[ Line: 100 ]]
        -- upvalues: v37 (copy), v36 (copy), l_NumberValue_0 (copy)
        v37:Disconnect();
        v36:Destroy();
        l_NumberValue_0:Destroy();
    end);
end;
return {
	PlayEffect = function(_, v40, v41) --[[ Line: 110 ]] --[[ Name: PlayEffect ]]
        if not l_Assets_0.Sounds.Music:FindFirstChild(v41.MusicName) then
            return;
        else
            local l_Rift_0 = l_EventManager_0.Utils.Rift;
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = workspace;
            l_Folder_0.Name = "Debris";
            local v46 = workspace:WaitForChild("EventMarker"):WaitForChild(v40.EventName);
            local v47 = l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ClockTime = 23.5, 
                GeographicLatitude = 237
            });
            local v48 = l_TweenService_0:Create(l_Lighting_0.Atmosphere, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Offset = 0, 
                Density = 0.3, 
                Glare = 10
            });
            v47:Play();
            v48:Play();
            l_Rift_0:Rift(v46.Discoball.WorldCFrame * CFrame.new(0, 100, 0) * CFrame.Angles(3.141592653589793, 0, 0), 2, false, {
                AutoCloseRift = true, 
                AutoSlowBeams = true
            });
            local v49 = l_Assets_0.Models.DiscoBall:Clone();
            v49:ScaleTo(0.01);
            v49:PivotTo(v46.Discoball.WorldCFrame);
            v49.Parent = l_Folder_0;
            v38(40, TweenInfo.new(1.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(v50) --[[ Line: 150 ]]
                -- upvalues: v49 (copy)
                v49:ScaleTo(0.01 + v50);
            end);
            local v51 = l_Assets_0.Sounds.Music[v41.MusicName]:Clone();
            v51.Parent = l_LocalPlayer_0;
            v51:Play();
            v51.Looped = true;
            l_SoundService_0.AmbientReverb = Enum.ReverbType.Arena;
            v26(v49.PrimaryPart.Main, true);
            for _, v53 in pairs(v46.Rigs:GetChildren()) do
                local v54 = l_Assets_0.Rigs[v53.Name]:Clone();
                v54:ScaleTo(0.01);
                v54.Parent = l_Folder_0;
                v38(50, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), function(v55) --[[ Line: 169 ]]
                    -- upvalues: v54 (copy)
                    v54:ScaleTo(0.01 + v55);
                end);
                local v56 = l_Assets_0.Animations:GetChildren()[math.random(1, #l_Assets_0.Animations:GetChildren())];
                v54.AnimationController.Animator:LoadAnimation(v56):Play();
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = l_Folder_0;
                l_Weld_0.Part0 = v46.Rigs;
                l_Weld_0.Part1 = v54.HumanoidRootPart;
                l_Weld_0.C0 = v53.CFrame * CFrame.new(0, 150, 0);
                v54.HumanoidRootPart.Anchored = false;
            end;
            local v58 = true;
            local v59 = nil;
            task.spawn(function() --[[ Line: 190 ]]
                -- upvalues: l_Lighting_0 (ref), v9 (ref), v58 (ref), v59 (ref), l_TweenService_0 (ref)
                l_Lighting_0.Atmosphere.Color = v9[6];
                l_Lighting_0.Atmosphere.Decay = v9[6];
                while true do
                    if v58 then
                        for _, v61 in ipairs(v9) do
                            v59 = l_TweenService_0:Create(l_Lighting_0.Atmosphere, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                Color = v61, 
                                Decay = v61
                            });
                            v59:Play();
                            task.wait(v59.TweenInfo.Time);
                            v59:Destroy();
                            if not v58 then
                                return;
                            end;
                        end;
                    else
                        return;
                    end;
                end;
            end);
            local v62 = l_Assets_0.Models.DiscoSky:Clone();
            v62:PivotTo(v46.Rigs.CFrame);
            v62.Parent = l_Folder_0;
            v26(v62, true);
            local v64 = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 218 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v51 (copy), v46 (copy), v49 (copy), v62 (copy), l_Lighting_0 (ref)
                l_CurrentCamera_0.FieldOfView = 70 + v51.PlaybackLoudness / 40;
                v46.Rigs.CFrame = v46.Rigs.CFrame * CFrame.Angles(0, 0.008726646259971648, 0);
                v49:PivotTo(v49:GetPivot() * CFrame.Angles(0, 0.008726646259971648, 0));
                v62:PivotTo(v62:GetPivot() * CFrame.Angles(0, 0.003490658503988659, 0));
                l_Lighting_0.Atmosphere.Haze = math.clamp(v51.PlaybackLoudness / 450, 0.1, 0.75) + 1.24;
            end);
            if v41.CanHighJump then
                local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0.JumpHeight = 50;
				end;
				task.delay(v41.RunTime, function()
					if l_Humanoid_0 then
						l_Humanoid_0.JumpHeight = 10.8;
					end;
				end)
            end;
            task.delay(v41.RunTime, function() --[[ Line: 236 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), l_LocalPlayer_0 (copy), l_Assets_0 (ref), v64 (copy), l_CurrentCamera_0 (copy), l_SoundService_0 (ref), v58 (ref), v59 (ref), l_EventManager_0 (ref), v47 (copy), v48 (copy), v51 (copy), l_Folder_0 (copy)
                local v66 = l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
                    ExposureCompensation = 10
                });
                v66:Play();
                local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
                local v68 = l_Assets_0.Sounds.End:Clone();
                v68.Parent = l_l_LocalPlayer_0_0;
                v68.Volume = 0.5;
                v68:Play();
                task.spawn(function() --[[ Line: 77 ]]
                    -- upvalues: v68 (copy)
                    repeat
                        task.wait();
                    until v68.TimeLength > 0;
                    task.delay(v68.TimeLength, function() --[[ Line: 80 ]]
                        -- upvalues: v68 (ref)
                        v68:Destroy();
                    end);
                end);
                task.wait(1);
                v64:Disconnect();
                l_CurrentCamera_0.FieldOfView = 70;
                l_SoundService_0.AmbientReverb = Enum.ReverbType.NoReverb;
                v58 = false;
                if v59 then
                    v59:Cancel();
                end;
                for v69, v70 in pairs(l_EventManager_0.DefaultLighting.lighting) do
                    l_Lighting_0[v69] = v70;
                end;
                for v71, v72 in pairs(l_EventManager_0.DefaultLighting.atmosphere) do
                    l_Lighting_0.Atmosphere[v71] = v72;
                end;
                v47:Destroy();
                v48:Destroy();
                l_l_LocalPlayer_0_0 = l_TweenService_0:Create(v51, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Volume = 0
                });
                l_l_LocalPlayer_0_0:Play();
                l_l_LocalPlayer_0_0.Completed:Once(function() --[[ Line: 273 ]]
                    -- upvalues: l_l_LocalPlayer_0_0 (copy), v51 (ref)
                    l_l_LocalPlayer_0_0:Destroy();
                    v51:Destroy();
                end);
                l_Folder_0:Destroy();
                task.wait(1);
                v66:Destroy();
            end);
            return;
        end;
    end
};