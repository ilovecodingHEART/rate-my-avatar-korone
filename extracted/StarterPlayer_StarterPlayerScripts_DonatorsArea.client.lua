-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("RunService");
local _ = game:GetService("ContentProvider");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Templates_0 = l_ReplicatedStorage_0.Templates;
local v8 = require(l_ReplicatedStorage_0.Remotes);
local _ = require(l_ReplicatedStorage_0.NumberHelpers);
local v10 = require(l_ReplicatedStorage_0.FeaturePlaces);
local function _(v11, v12, v13) --[[ Line: 17 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v11, TweenInfo.new(v12, Enum.EasingStyle.Quint), v13):Play();
end;
local function _(v15, v16) --[[ Line: 22 ]] --[[ Name: popup ]]
    spawn(function() --[[ Line: 23 ]]
        local v17 = l_Templates_0.PopupTemplate:Clone();
        v17.Text = v15;
        v17.TextColor3 = v16;
        v17.Parent = script.Parent;
        local v18 = {
            Position = UDim2.new(0, 0, 0.8, 0)
        };
        l_TweenService_0:Create(v17, TweenInfo.new(0.9, Enum.EasingStyle.Quint), v18):Play();
        wait(0.75);
        v18 = {
            TextTransparency = 1
        };
        l_TweenService_0:Create(v17, TweenInfo.new(3, Enum.EasingStyle.Quint), v18):Play();
        wait(2);
        v17:Destroy();
    end);
end;
local _ = v8.Function("GetDonated"):InvokeServer() >= 10000;
if v10.IsLegacyMap then
    workspace:WaitForChild("TPART1");
    workspace:WaitForChild("TPART2");
    workspace.TPART1.ProximityPrompt.Triggered:Connect(function() --[[ Line: 41 ]]
        if v8.Function("GetDonated"):InvokeServer() >= 1 then
            task.spawn(function() --[[ Line: 43 ]]
                local v21 = Color3.fromRGB(255, 255, 255);
                local l_spawn_0 = spawn;
                local v23 = "teleporting..";
                local l_v21_0 = v21 --[[ copy: 0 -> 4 ]];
                l_spawn_0(function() --[[ Line: 23 ]]
                    local v25 = l_Templates_0.PopupTemplate:Clone();
                    v25.Text = v23;
                    v25.TextColor3 = l_v21_0;
                    v25.Parent = script.Parent;
                    local v26 = {
                        Position = UDim2.new(0, 0, 0.8, 0)
                    };
                    l_TweenService_0:Create(v25, TweenInfo.new(0.9, Enum.EasingStyle.Quint), v26):Play();
                    wait(0.75);
                    v26 = {
                        TextTransparency = 1
                    };
                    l_TweenService_0:Create(v25, TweenInfo.new(3, Enum.EasingStyle.Quint), v26):Play();
                    wait(2);
                    v25:Destroy();
                end);
                v21 = workspace.Camera;
                l_spawn_0 = {
                    FieldOfView = 0
                };
                l_TweenService_0:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_0):Play();
                v21 = l_Lighting_0.Blur;
                l_spawn_0 = {
                    Size = 56
                };
                l_TweenService_0:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_0):Play();
                wait(0.5);
                l_LocalPlayer_0.Character.HumanoidRootPart.CFrame = workspace.TPART2.CFrame;
                v21 = workspace.Camera;
                l_spawn_0 = {
                    FieldOfView = 70
                };
                l_TweenService_0:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_0):Play();
                v21 = l_Lighting_0.Blur;
                l_spawn_0 = {
                    Size = 0
                };
                l_TweenService_0:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_0):Play();
            end);
            return;
        else
            local v27 = Color3.fromRGB(255, 100, 100);
            local l_spawn_1 = spawn;
            local v29 = "donate atleast $1 to access";
            l_spawn_1(function() --[[ Line: 23 ]]
                local v30 = l_Templates_0.PopupTemplate:Clone();
                v30.Text = v29;
                v30.TextColor3 = v27;
                v30.Parent = script.Parent;
                local v31 = {
                    Position = UDim2.new(0, 0, 0.8, 0)
                };
                l_TweenService_0:Create(v30, TweenInfo.new(0.9, Enum.EasingStyle.Quint), v31):Play();
                wait(0.75);
                v31 = {
                    TextTransparency = 1
                };
                l_TweenService_0:Create(v30, TweenInfo.new(3, Enum.EasingStyle.Quint), v31):Play();
                wait(2);
                v30:Destroy();
            end);
            return;
        end;
    end);
    workspace.TPART2.ProximityPrompt.Triggered:Connect(function() --[[ Line: 57 ]]
        task.spawn(function() --[[ Line: 58 ]]
            local v32 = Color3.fromRGB(255, 255, 255);
            local l_spawn_2 = spawn;
            local v34 = "teleporting..";
            local l_v32_0 = v32 --[[ copy: 0 -> 4 ]];
            l_spawn_2(function() --[[ Line: 23 ]]
                local v36 = l_Templates_0.PopupTemplate:Clone();
                v36.Text = v34;
                v36.TextColor3 = l_v32_0;
                v36.Parent = script.Parent;
                local v37 = {
                    Position = UDim2.new(0, 0, 0.8, 0)
                };
                l_TweenService_0:Create(v36, TweenInfo.new(0.9, Enum.EasingStyle.Quint), v37):Play();
                wait(0.75);
                v37 = {
                    TextTransparency = 1
                };
                l_TweenService_0:Create(v36, TweenInfo.new(3, Enum.EasingStyle.Quint), v37):Play();
                wait(2);
                v36:Destroy();
            end);
            v32 = workspace.Camera;
            l_spawn_2 = {
                FieldOfView = 0
            };
            l_TweenService_0:Create(v32, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_2):Play();
            v32 = l_Lighting_0.Blur;
            l_spawn_2 = {
                Size = 56
            };
            l_TweenService_0:Create(v32, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_2):Play();
            wait(0.5);
            l_LocalPlayer_0.Character.HumanoidRootPart.CFrame = workspace.TPART1.CFrame;
            v32 = workspace.Camera;
            l_spawn_2 = {
                FieldOfView = 70
            };
            l_TweenService_0:Create(v32, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_2):Play();
            v32 = l_Lighting_0.Blur;
            l_spawn_2 = {
                Size = 0
            };
            l_TweenService_0:Create(v32, TweenInfo.new(0.5, Enum.EasingStyle.Quint), l_spawn_2):Play();
        end);
    end);
end;