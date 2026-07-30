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
        task.delay(v12.TimeLength, function() --[[ Line: 28 ]]
            -- upvalues: v12 (ref)
            v12:Destroy();
        end);
    end);
end;
return {
    Rift = function(_, v15, v16, v17, v18) --[[ Line: 36 ]] --[[ Name: Rift ]]
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
        local v23 = l_Assets_0.Sound.RiftSFX1:Clone();
        v23.Parent = l_LocalPlayer_0;
        v23.Volume = 0.2;
        v23:Play();
        local l_v23_0 = v23 --[[ copy: 10 -> 21 ]];
        task.spawn(function() --[[ Line: 25 ]]
            -- upvalues: l_v23_0 (copy)
            repeat
                task.wait();
            until l_v23_0.TimeLength > 0;
            task.delay(l_v23_0.TimeLength, function() --[[ Line: 28 ]]
                -- upvalues: l_v23_0 (ref)
                l_v23_0:Destroy();
            end);
        end);
        l_LocalPlayer_0 = l_Assets_0.Rift1:Clone();
        l_LocalPlayer_0:PivotTo(v15 * CFrame.Angles(0, math.rad((v3:NextNumber(-180, 180))), 0));
        l_LocalPlayer_0:ScaleTo(v16);
        l_LocalPlayer_0.Parent = l_Folder_0;
        local l_l_LocalPlayer_0_Children_0 = l_LocalPlayer_0:GetChildren();
        table.sort(l_l_LocalPlayer_0_Children_0, function(v26, v27) --[[ Line: 59 ]]
            return tonumber(v26.Name) < tonumber(v27.Name);
        end);
        v23 = {};
        for v28 = 1, #l_l_LocalPlayer_0_Children_0 do
            local v29 = {};
            table.insert(v23, v29);
            for _, v31 in pairs(l_l_LocalPlayer_0_Children_0[v28]:GetChildren()) do
                v29[v31] = v31.Size;
                v31.Size = Vector3.new(0, 0, 0, 0);
                v31.Color = v17 or Color3.fromRGB(112, 145, 255);
            end;
        end;
        local v32 = l_Assets_0.Rift1_Distortion:Clone();
        v32:PivotTo(v15 * CFrame.Angles(0, math.rad((v3:NextNumber(-180, 180))), 0));
        v32:ScaleTo(v16);
        v32.Parent = l_Model_0;
        local l_Size_0 = v32.PrimaryPart.Size;
        v32.PrimaryPart.Size = Vector3.new(0, 0, 0, 0);
        v32.PrimaryPart.Transparency = 1;
        l_TweenService_0:Create(v32.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Size = l_Size_0, 
            Transparency = 5
        }):Play();
        task.spawn(function() --[[ Line: 91 ]]
            -- upvalues: l_l_LocalPlayer_0_Children_0 (copy), v23 (copy), l_TweenService_0 (ref)
            for v34 = 1, #l_l_LocalPlayer_0_Children_0 do
                for v35, v36 in pairs(v23[v34]) do
                    v35.CFrame = v35.CFrame * CFrame.new(0, 0, v36.Z / 2);
                    l_TweenService_0:Create(v35, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Size = v36, 
                        CFrame = v35.CFrame * CFrame.new(0, 0, -v36.Z / 2)
                    }):Play();
                end;
                task.wait(0.02);
            end;
        end);
        local function v38() --[[ Line: 107 ]] --[[ Name: GetFrag ]]
            -- upvalues: l_Assets_0 (ref)
            local l_Children_0 = l_Assets_0.Frags:GetChildren();
            if #l_Children_0 >= 1 then
                return l_Children_0[math.random(1, #l_Children_0)];
            else
                return l_Assets_0.Rift_Cells:GetChildren()[math.random(1, #l_Assets_0.Rift_Cells:GetChildren())]:Clone();
            end;
        end;
        local function v45(v39, v40) --[[ Line: 117 ]] --[[ Name: LaunchFrags ]]
            -- upvalues: v38 (copy), v3 (ref), v16 (copy), v17 (copy), l_Folder_0 (copy), l_Model_0 (copy), v15 (copy), l_TweenService_0 (ref), l_Assets_0 (ref)
            for _ = 1, v40 do
                local v42 = v38();
                v42.Size = v42:GetAttribute("OriginalSize") or v42.Size;
                local l_Size_1 = v42.Size;
                if not v39 then
                    v42.Material = Enum.Material.Neon;
                    v42.Size = v42.Size * v3:NextNumber(1.25, 1.75) * v16;
                    v42.Color = v17 or Color3.fromRGB(112, 145, 255);
                    v42.Parent = l_Folder_0;
                else
                    v42.Material = Enum.Material.Glass;
                    v42.Size = v42.Size * v3:NextNumber(1.65, 2.15) * v16;
                    v42.Transparency = 15;
                    v42.Parent = l_Model_0;
                end;
                v42.CFrame = v15 * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360)))));
                local v44 = v15 * CFrame.new(v3:NextNumber(-100, 100) * v16, v3:NextNumber(15, 90) * v16, v3:NextNumber(-100, 100) * v16) * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360)))));
                l_TweenService_0:Create(v42, TweenInfo.new(v3:NextNumber(0.4, 1), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    CFrame = v44
                }):Play();
                task.delay(v3:NextNumber(0.7, 1.2), function() --[[ Line: 146 ]]
                    -- upvalues: l_TweenService_0 (ref), v42 (copy), v3 (ref), l_Size_1 (copy), l_Assets_0 (ref)
                    l_TweenService_0:Create(v42, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        CFrame = v42.CFrame * CFrame.Angles(math.rad((v3:NextNumber(-360, 360))), math.rad((v3:NextNumber(-360, 360))), (math.rad((v3:NextNumber(-360, 360))))), 
                        Size = Vector3.new(0, 0, 0, 0)
                    }):Play();
                    task.delay(2, function() --[[ Line: 152 ]]
                        -- upvalues: v42 (ref), l_Size_1 (ref), l_Assets_0 (ref)
                        v42.Size = l_Size_1;
                        v42.Transparency = 0;
                        v42.Parent = l_Assets_0.Frags;
                    end);
                end);
            end;
        end;
        v45(false, 25);
        v45(true, 37.5);
        local v46 = l_Assets_0.Particles:Clone();
        v46:PivotTo(v15);
        v46:ScaleTo(v16);
        v46.Parent = l_Folder_0;
        for _, v48 in pairs(v46.Particles.Particles.Beams:GetChildren()) do
            v48.Beam.Width0 = 0;
            v48.Beam.Width1 = 0;
            if v17 then
                v48.Beam.Color = ColorSequence.new(v17);
            end;
            l_TweenService_0:Create(v48.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Width0 = 165 * v16, 
                Width1 = 125 * v16
            }):Play();
            task.delay(1.25, function() --[[ Line: 184 ]]
                -- upvalues: l_TweenService_0 (ref), v48 (copy)
                l_TweenService_0:Create(v48.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Brightness = 0
                }):Play();
            end);
        end;
        for _, v50 in pairs(v46.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
            if v50:IsA("Beam") then
                v50.Width0 = 0;
                v50.Width1 = 0;
                if v17 then
                    v50.Color = ColorSequence.new(v17);
                end;
                l_TweenService_0:Create(v50, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Width0 = 185 * v16, 
                    Width1 = 650 * v16
                }):Play();
                if v18 and v18.AutoSlowBeams then
                    l_TweenService_0:Create(v50, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        TextureSpeed = 0, 
                        Brightness = 0
                    }):Play();
                end;
            end;
        end;
        if v17 then
            for _, v52 in pairs(v46.Particles.Particles.Main:GetChildren()) do
                if v52:IsA("ParticleEmitter") then
                    v52.Color = ColorSequence.new(v17);
                end;
            end;
        end;
        v8(v46.Particles.Particles.Main);
        local function v58() --[[ Line: 227 ]] --[[ Name: CloseRift ]]
            -- upvalues: l_l_LocalPlayer_0_Children_0 (copy), v23 (copy), l_TweenService_0 (ref), v32 (copy), v18 (copy), v46 (copy), l_LocalPlayer_0 (copy), l_Model_0 (copy), l_Folder_0 (copy)
            task.spawn(function() --[[ Line: 228 ]]
                -- upvalues: l_l_LocalPlayer_0_Children_0 (ref), v23 (ref), l_TweenService_0 (ref)
                for v53 = 1, #l_l_LocalPlayer_0_Children_0 do
                    for v54, _ in pairs(v23[v53]) do
                        l_TweenService_0:Create(v54, TweenInfo.new(2.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            Size = Vector3.new(0, 0, v54.Size.Z)
                        }):Play();
                    end;
                end;
            end);
            l_TweenService_0:Create(v32.PrimaryPart, TweenInfo.new(2.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Transparency = 1
            }):Play();
            if v18 and not v18.AutoSlowBeams then
                for _, v57 in pairs(v46.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
                    if v57:IsA("Beam") then
                        l_TweenService_0:Create(v57, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            TextureSpeed = 0, 
                            Brightness = 0
                        }):Play();
                    end;
                end;
            end;
            task.wait(3);
            l_LocalPlayer_0:Destroy();
            v32:Destroy();
            v46:Destroy();
            task.wait(2);
            l_Model_0:Destroy();
            l_Folder_0:Destroy();
        end;
        if v18 and v18.AutoCloseRift then
            task.delay(2, v58);
        end;
        return v58;
    end
};