-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Assets_0 = script:WaitForChild("Assets");
local v3 = Random.new();
local function v8(v4, v5) --[[ Line: 7 ]] --[[ Name: Emit ]]
    for _, v7 in pairs(v4:GetChildren()) do
        if v7:IsA("ParticleEmitter") then
            if v5 then
                v7.Color = ColorSequence.new(v5);
            end;
            v7:Emit(v7:GetAttribute("EmitCount"));
        end;
    end;
end;
local function _(v9, v10, v11) --[[ Line: 19 ]] --[[ Name: EmitSound ]]
    local v12 = v10:Clone();
    v12.Parent = v9;
    v12.Volume = v11;
    v12:Play();
    task.spawn(function() --[[ Line: 25 ]]
        -- upvalues: v12 (copy)
        repeat
            task.wait();
        until v12.TimeLength > 0;
        task.delay(v12.TimeLength + 5, function() --[[ Line: 28 ]]
            -- upvalues: v12 (ref)
            v12:Destroy();
        end);
    end);
end;
return {
    Rift = function(_, v15, v16, v17, v18, v19) --[[ Line: 36 ]] --[[ Name: Rift ]]
        -- upvalues: l_Players_0 (copy), l_Assets_0 (copy), v3 (copy), l_TweenService_0 (copy), v8 (copy)
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = tick() .. " Rift Debris";
        l_Folder_0.Parent = workspace;
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = tick() .. " Rift Distortion Debris";
        l_Model_0.Parent = workspace;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.FillTransparency = 1;
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.Parent = l_Model_0;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local l_RiftSFX1_0 = l_Assets_0.Sound.RiftSFX1;
        local v25 = v19 or 0.5;
        local v26 = l_RiftSFX1_0:Clone();
        v26.Parent = l_LocalPlayer_0;
        v26.Volume = v25;
        v26:Play();
        local l_v26_0 = v26 --[[ copy: 12 -> 22 ]];
        task.spawn(function() --[[ Line: 25 ]]
            -- upvalues: l_v26_0 (copy)
            repeat
                task.wait();
            until l_v26_0.TimeLength > 0;
            task.delay(l_v26_0.TimeLength + 5, function() --[[ Line: 28 ]]
                -- upvalues: l_v26_0 (ref)
                l_v26_0:Destroy();
            end);
        end);
        l_LocalPlayer_0 = l_Assets_0.Rift1:Clone();
        l_LocalPlayer_0:PivotTo(v15 * CFrame.Angles(0, math.rad((v3:NextNumber(-180, 180))), 0));
        l_LocalPlayer_0:ScaleTo(v16);
        l_LocalPlayer_0.Parent = l_Folder_0;
        l_RiftSFX1_0 = l_LocalPlayer_0:GetChildren();
        table.sort(l_RiftSFX1_0, function(v28, v29) --[[ Line: 59 ]]
            return tonumber(v28.Name) < tonumber(v29.Name);
        end);
        v25 = {};
        for v30 = 1, #l_RiftSFX1_0 do
            local v31 = {};
            table.insert(v25, v31);
            for _, v33 in pairs(l_RiftSFX1_0[v30]:GetChildren()) do
                v31[v33] = v33.Size;
                v33.Size = Vector3.new(0, 0, 0, 0);
                v33.Color = v17 or Color3.fromRGB(112, 145, 255);
            end;
        end;
        v26 = l_Assets_0.Rift1_Distortion:Clone();
        v26:PivotTo(v15 * CFrame.Angles(0, math.rad((v3:NextNumber(-180, 180))), 0));
        v26:ScaleTo(v16);
        v26.Parent = l_Model_0;
        local l_Size_0 = v26.PrimaryPart.Size;
        v26.PrimaryPart.Size = Vector3.new(0, 0, 0, 0);
        v26.PrimaryPart.Transparency = 1;
        l_TweenService_0:Create(v26.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Size = l_Size_0, 
            Transparency = 5
        }):Play();
        task.spawn(function() --[[ Line: 91 ]]
            -- upvalues: l_RiftSFX1_0 (copy), v25 (copy), l_TweenService_0 (ref)
            for v35 = 1, #l_RiftSFX1_0 do
                for v36, v37 in pairs(v25[v35]) do
                    v36.CFrame = v36.CFrame * CFrame.new(0, 0, v37.Z / 2);
                    l_TweenService_0:Create(v36, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Size = v37, 
                        CFrame = v36.CFrame * CFrame.new(0, 0, -v37.Z / 2)
                    }):Play();
                end;
                task.wait(0.02);
            end;
        end);
        local function v39() --[[ Line: 107 ]] --[[ Name: GetFrag ]]
            -- upvalues: l_Assets_0 (ref)
            local l_Children_0 = l_Assets_0.Frags:GetChildren();
            if #l_Children_0 >= 1 then
                return l_Children_0[math.random(1, #l_Children_0)];
            else
                return l_Assets_0.Rift_Cells:GetChildren()[math.random(1, #l_Assets_0.Rift_Cells:GetChildren())]:Clone();
            end;
        end;
        local function v46(v40, v41) --[[ Line: 117 ]] --[[ Name: LaunchFrags ]]
            -- upvalues: v39 (copy), v3 (ref), v16 (copy), v17 (copy), l_Folder_0 (copy), l_Model_0 (copy), v15 (copy), l_TweenService_0 (ref), l_Assets_0 (ref)
            for _ = 1, v41 do
                local v43 = v39();
                v43.Size = v43:GetAttribute("OriginalSize") or v43.Size;
                local l_Size_1 = v43.Size;
                if not v40 then
                    v43.Material = Enum.Material.Neon;
                    v43.Size = v43.Size * v3:NextNumber(1.25, 1.75) * v16;
                    v43.Color = v17 or Color3.fromRGB(112, 145, 255);
                    v43.Parent = l_Folder_0;
                else
                    v43.Material = Enum.Material.Glass;
                    v43.Size = v43.Size * v3:NextNumber(1.65, 2.15) * v16;
                    v43.Transparency = 15;
                    v43.Parent = l_Model_0;
                end;
                v43.CFrame = v15 * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360)))));
                local v45 = v15 * CFrame.new(v3:NextNumber(-100, 100) * v16, v3:NextNumber(15, 90) * v16, v3:NextNumber(-100, 100) * v16) * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360)))));
                l_TweenService_0:Create(v43, TweenInfo.new(v3:NextNumber(0.4, 0.7), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    CFrame = v45
                }):Play();
                task.delay(v3:NextNumber(1, 1.25), function() --[[ Line: 146 ]]
                    -- upvalues: l_TweenService_0 (ref), v43 (copy), v3 (ref), l_Size_1 (copy), l_Assets_0 (ref)
                    l_TweenService_0:Create(v43, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        CFrame = v43.CFrame * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360))))), 
                        Size = Vector3.new(0, 0, 0, 0)
                    }):Play();
                    task.delay(2, function() --[[ Line: 152 ]]
                        -- upvalues: v43 (ref), l_Size_1 (ref), l_Assets_0 (ref)
                        v43.Size = l_Size_1;
                        v43.Transparency = 0;
                        v43.Parent = l_Assets_0.Frags;
                    end);
                end);
            end;
        end;
        v46(false, 25);
        v46(true, 37.5);
        local v47 = l_Assets_0.Particles:Clone();
        v47:PivotTo(v15);
        v47:ScaleTo(v16);
        v47.Parent = l_Folder_0;
        for _, v49 in pairs(v47.Particles.Particles.Beams:GetChildren()) do
            v49.Beam.Width0 = 0;
            v49.Beam.Width1 = 0;
            if v17 then
                v49.Beam.Color = ColorSequence.new(v17);
            end;
            l_TweenService_0:Create(v49.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Width0 = 165 * v16, 
                Width1 = 125 * v16
            }):Play();
            task.delay(1.25, function() --[[ Line: 184 ]]
                -- upvalues: l_TweenService_0 (ref), v49 (copy)
                l_TweenService_0:Create(v49.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Brightness = 0
                }):Play();
            end);
        end;
        for _, v51 in pairs(v47.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
            if v51:IsA("Beam") then
                v51.Width0 = 0;
                v51.Width1 = 0;
                if v17 then
                    v51.Color = ColorSequence.new(v17);
                end;
                l_TweenService_0:Create(v51, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Width0 = 185 * v16, 
                    Width1 = 650 * v16
                }):Play();
                if v18 and v18.AutoSlowBeams then
                    l_TweenService_0:Create(v51, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        TextureSpeed = 0, 
                        Brightness = 0
                    }):Play();
                end;
            end;
        end;
        if v17 then
            for _, v53 in pairs(v47.Particles.Particles.Main:GetChildren()) do
                if v53:IsA("ParticleEmitter") then
                    v53.Color = ColorSequence.new(v17);
                end;
            end;
        end;
        v8(v47.Particles.Particles.Main);
        local function v59() --[[ Line: 227 ]] --[[ Name: CloseRift ]]
            -- upvalues: l_RiftSFX1_0 (copy), v25 (copy), l_TweenService_0 (ref), v26 (copy), v18 (copy), v47 (copy), l_LocalPlayer_0 (copy), l_Model_0 (copy), l_Folder_0 (copy)
            task.spawn(function() --[[ Line: 228 ]]
                -- upvalues: l_RiftSFX1_0 (ref), v25 (ref), l_TweenService_0 (ref)
                for v54 = 1, #l_RiftSFX1_0 do
                    for v55, _ in pairs(v25[v54]) do
                        l_TweenService_0:Create(v55, TweenInfo.new(2.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            Size = Vector3.new(0, 0, v55.Size.Z)
                        }):Play();
                    end;
                end;
            end);
            l_TweenService_0:Create(v26.PrimaryPart, TweenInfo.new(2.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Transparency = 1
            }):Play();
            if v18 and not v18.AutoSlowBeams then
                for _, v58 in pairs(v47.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
                    if v58:IsA("Beam") then
                        l_TweenService_0:Create(v58, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            TextureSpeed = 0, 
                            Brightness = 0
                        }):Play();
                    end;
                end;
            end;
            task.wait(3);
            l_LocalPlayer_0:Destroy();
            v26:Destroy();
            v47:Destroy();
            task.wait(2);
            l_Model_0:Destroy();
            l_Folder_0:Destroy();
        end;
        if v18 and v18.AutoCloseRift then
            task.delay(2, v59);
        end;
        return v59;
    end
};