local l_Services_0 = require(script:WaitForChild("Services"));
local l_Assets_0 = script:WaitForChild("Assets");
local v2 = require(game.ReplicatedStorage.Settings);
local l_LocalPlayer_0 = l_Services_0.Players.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local function v27() --[[ Line: 7 ]] --[[ Name: Run ]]
    -- upvalues: v2 (copy), l_Services_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_CurrentCamera_0 (copy)
    local v5 = 10;
    local v6 = true;
    v6 = false;
    local function v12() --[[ Line: 19 ]] --[[ Name: LightingIn ]]
        -- upvalues: l_Services_0 (ref)
        local v7 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
        local v8 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        local v9 = {
            ClockTime = 1, 
            Ambient = Color3.fromRGB(160, 234, 255), 
            OutdoorAmbient = Color3.fromRGB(44, 209, 255), 
            ColorShift_Bottom = Color3.fromRGB(255, 121, 121), 
            ColorShift_Top = Color3.fromRGB(0, 195, 255), 
            EnvironmentDiffuseScale = 1, 
            EnvironmentSpecularScale = 0, 
            Brightness = 3, 
            ExposureCompensation = 0.4
        };
        local v10 = {
            Density = 0.2, 
            Offset = 0.25, 
            Color = Color3.fromRGB(84, 171, 209), 
            Decay = Color3.fromRGB(136, 192, 216), 
            Glare = 2, 
            Haze = 1.1
        };
        local v11 = {
            Volume = 0
        };
        l_Services_0.TweenService:Create(l_Services_0.Lighting, v7, v9):Play();
        l_Services_0.TweenService:Create(l_Services_0.Lighting.Atmosphere, v7, v10):Play();
        l_Services_0.TweenService:Create(game.SoundService.Music.DaytimeTrack, v8, v11):Play();
    end;
    local function v17() --[[ Line: 62 ]] --[[ Name: LightingOut ]]
        -- upvalues: v5 (ref), l_Services_0 (ref), v6 (ref)
        local v13 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        local v14 = {
            ClockTime = v5, 
            Ambient = Color3.fromRGB(226, 176, 225), 
            OutdoorAmbient = Color3.fromRGB(48, 28, 71), 
            ColorShift_Bottom = Color3.fromRGB(255, 121, 121), 
            ColorShift_Top = Color3.fromRGB(255, 227, 180), 
            EnvironmentDiffuseScale = 0.688, 
            EnvironmentSpecularScale = 0, 
            Brightness = 2.66, 
            ExposureCompensation = 0
        };
        local v15 = {
            Density = 0.15, 
            Offset = 0.25, 
            Color = Color3.fromRGB(255, 255, 255), 
            Decay = Color3.fromRGB(255, 255, 255), 
            Glare = 2, 
            Haze = 0
        };
        local v16 = {
            Volume = 1
        };
        l_Services_0.TweenService:Create(l_Services_0.Lighting, v13, v14):Play();
        l_Services_0.TweenService:Create(l_Services_0.Lighting.Atmosphere, v13, v15):Play();
        if v6 then
            l_Services_0.TweenService:Create(game.SoundService.Music.DaytimeTrack, v13, v16):Play();
        end;
    end;
    v12();
    l_Assets_0.Sounds.Space:Play();
    task.wait(1.5);
    l_Assets_0.Sounds.Drop_Sting1:Play();
    local v18 = l_Assets_0.SmallUFO:Clone();
    local v19 = CFrame.new(Random.new():NextNumber(3000, 4000), 500, Random.new():NextNumber(3000, 4000));
    local v20 = l_LocalPlayer_0.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-25, 25), math.random(0, 25), math.random(-25, 25)) * CFrame.Angles(0, math.rad((math.random(-360, 360))), 0);
    local v21 = v20 * v19;
    local v22 = v21 * CFrame.new(-v19.X * 2, 0, -v19.Z * 2);
    v18:PivotTo(v21);
    v18.Parent = workspace;
    local v23 = l_Services_0.TweenService:Create(v18.Root, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = v22
    });
    v23:Play();
    local _ = l_Services_0.RunService.RenderStepped:Connect(function() --[[ Line: 121 ]]
        -- upvalues: v18 (copy), l_CurrentCamera_0 (ref)
        if v18:FindFirstChild("Root") then
            l_CurrentCamera_0.CFrame = CFrame.lookAt(l_CurrentCamera_0.CFrame.Position, v18.Root.Position);
            v18.Root.CFrame = v18.Root.CFrame * CFrame.Angles(0, 10, 0);
        end;
    end);
    v18.TractorOrigin.Main.UFOAmbience:Play();
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_Services_0.TweenService:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        FieldOfView = 30
    }):Play();
    l_CurrentCamera_0.CFrame = v20 * CFrame.new(0, 0, 150);
    local v26 = l_Services_0.RunService.RenderStepped:Connect(function() --[[ Line: 135 ]]
        -- upvalues: v18 (copy), l_CurrentCamera_0 (ref)
        if v18:FindFirstChild("Root") then
            l_CurrentCamera_0.CFrame = CFrame.lookAt(l_CurrentCamera_0.CFrame.Position, v18.Root.Position);
        end;
    end);
    v23.Completed:Connect(function() --[[ Line: 141 ]]
        -- upvalues: v26 (copy), l_Services_0 (ref), l_CurrentCamera_0 (ref), l_CFrame_0 (copy), v18 (copy), v17 (copy)
        v26:Disconnect();
        l_Services_0.TweenService:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            CFrame = l_CFrame_0, 
            FieldOfView = 70
        }):Play();
        l_Services_0.TweenService:Create(v18.TractorOrigin.Main.UFOAmbience, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Volume = 0
        }):Play();
        task.wait(0.5);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        v17();
        v18:Destroy();
    end);
end;
v27();
