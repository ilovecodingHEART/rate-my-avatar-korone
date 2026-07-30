-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_SoundService_0 = game:GetService("SoundService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local l_GlassAnimals_0 = l_PlayerGui_0:WaitForChild("GlassAnimals");
local l_GlassAnimals_1 = workspace.GlassAnimals;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Children_0 = l_SoundService_0.GlassAnimals:GetChildren();
local v10 = require(l_ReplicatedStorage_0.Remotes);
local l_AnalyticsEvent_0 = l_ReplicatedStorage_0:WaitForChild("AnalyticsEvent");
local l_RequestAsset_0 = l_ReplicatedStorage_0:WaitForChild("RequestAsset");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local function _(v14, v15, v16) --[[ Line: 21 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v14, TweenInfo.new(v15, Enum.EasingStyle.Linear), v16):Play();
end;
formatTime = function(v18) --[[ Line: 26 ]] --[[ Name: formatTime ]]
    local v19 = math.floor(v18 / 60);
    local v20 = v18 % 60;
    return string.format("%02d:%02d", v19, v20);
end;
local function _(v21) --[[ Line: 32 ]] --[[ Name: playNextSong ]]
    local v22 = v21 + 1;
    if #l_Children_0 < v22 then
        v22 = 1;
    end;
    l_Children_0[v22]:Play();
end;
local v24 = l_RequestAsset_0:InvokeServer();
print("songs client", v24);
for _, v26 in ipairs(v24) do
    print(v26.name);
    l_ContentProvider_0:RegisterSessionEncryptedAsset(v26.assetId, v26.key);
    if l_SoundService_0.GlassAnimals:FindFirstChild(v26.name) then
        l_SoundService_0.GlassAnimals:FindFirstChild(v26.name).SoundId = v26.assetId;
    end;
end;
local _ = string.format("hey <b>%s.</b> we r glass animals. a band from earth. listen to our new album \226\128\156I LOVE YOU SO MUCH\226\128\157 to earn Giftbux and UGC!", l_LocalPlayer_0.DisplayName);
GATalk = function() --[[ Line: 57 ]] --[[ Name: GATalk ]]
    if l_ScreenGui_0.GATalk.Visible then
        local l_TransitionScreen_0 = l_GlassAnimals_0.TransitionScreen;
        local v29 = {
            GroupTransparency = 0
        };
        l_TweenService_0:Create(l_TransitionScreen_0, TweenInfo.new(0.35, Enum.EasingStyle.Linear), v29):Play();
        task.wait(1);
        l_TransitionScreen_0 = l_GlassAnimals_0.TransitionScreen;
        v29 = {
            GroupTransparency = 1
        };
        l_TweenService_0:Create(l_TransitionScreen_0, TweenInfo.new(0.35, Enum.EasingStyle.Linear), v29):Play();
        l_ScreenGui_0.GATalk.Visible = false;
        l_CurrentCamera_0.FieldOfView = 70;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        return;
    else
        l_AnalyticsEvent_0:FireServer("interaction", {
            "npc"
        });
        local l_TransitionScreen_1 = l_GlassAnimals_0.TransitionScreen;
        local v31 = {
            GroupTransparency = 0
        };
        l_TweenService_0:Create(l_TransitionScreen_1, TweenInfo.new(0.35, Enum.EasingStyle.Linear), v31):Play();
        task.wait(1);
        l_TransitionScreen_1 = l_GlassAnimals_0.TransitionScreen;
        v31 = {
            GroupTransparency = 1
        };
        l_TweenService_0:Create(l_TransitionScreen_1, TweenInfo.new(0.35, Enum.EasingStyle.Linear), v31):Play();
        l_CurrentCamera_0.FieldOfView = 50;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = l_GlassAnimals_1.Cam.CFrame;
        l_ScreenGui_0.GATalk.Message.Text = string.format("hey <b>%s.</b> we r glass animals. a band from earth. listen to our new album \226\128\156I LOVE YOU SO MUCH\226\128\157 to earn Giftbux and UGC!", l_LocalPlayer_0.DisplayName);
        l_ScreenGui_0.GATalk.Message.MaxVisibleGraphemes = -1;
        l_TransitionScreen_1 = l_ScreenGui_0.GATalk.Message;
        v31 = {
            MaxVisibleGraphemes = #l_ScreenGui_0.GATalk.Message.Text
        };
        l_TweenService_0:Create(l_TransitionScreen_1, TweenInfo.new(5, Enum.EasingStyle.Linear), v31):Play();
        l_ScreenGui_0.GATalk.Visible = true;
        return;
    end;
end;
l_ScreenGui_0.GABoombox:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 80 ]]
    if l_ScreenGui_0.GABoombox.Visible then
        l_AnalyticsEvent_0:FireServer("interaction", {
            "boombox"
        });
    end;
end);
workspace.GABoomboxDisplay.GABoombox.ProximityPrompt.Triggered:Connect(function() --[[ Line: 85 ]]
    l_ScreenGui_0.GABoombox.Visible = true;
end);
for _, v33 in workspace.NPCS:GetChildren() do
    if v33:IsA("Model") and v33:FindFirstChild("ProximityPrompt") then
        v33.ProximityPrompt.Triggered:Connect(function() --[[ Line: 92 ]]
            GATalk();
        end);
    end;
end;
l_ScreenGui_0.GATalk.Later.Activated:Connect(function() --[[ Line: 99 ]]
    GATalk();
    l_ScreenGui_0.GATalk.Visible = false;
end);
l_ScreenGui_0.GATalk.Listen.Activated:Connect(function() --[[ Line: 104 ]]
    GATalk();
    l_ScreenGui_0.GABoombox.Visible = true;
end);
local v34 = v10.Function("GetGlassAnimalsAwards"):InvokeServer(l_LocalPlayer_0);
for v35, v36 in l_SoundService_0.GlassAnimals:GetChildren() do
    local v37 = script.SongTemplate:Clone();
    v37.Name = v36.Name;
    v37.Info.Title.Text = v36.Name;
    v37.SoundProgress.Text = "0:00 / " .. formatTime(v36.TimeLength);
    v37.Parent = script.Parent;
    if v34[v36.Name] then
        v37.Info.Title.Giftbux.Visible = false;
    end;
    v37.Play.Activated:Connect(function() --[[ Line: 122 ]]
        for _, v39 in l_SoundService_0.GlassAnimals:GetChildren() do
            if v39.Name ~= v36.Name then
                v39:Pause();
            end;
        end;
        if v36.Playing then
            v36:Pause();
            return;
        else
            v36:Resume();
            return;
        end;
    end);
    local function _() --[[ Line: 136 ]] --[[ Name: updateProgress ]]
        v37.SoundProgress.Text = formatTime(v36.TimePosition) .. " / " .. formatTime(v36.TimeLength);
        v37.Progress.Size = UDim2.new(v36.TimePosition / v36.TimeLength, 0, 0, 3);
    end;
    local v41 = false;
    local v42 = 0;
    do
        local l_v41_0, l_v42_0 = v41, v42;
        v36.Changed:Connect(function(v45) --[[ Line: 145 ]]
            if v45 == "Playing" then
                if v36.Playing then
                    spawn(function() --[[ Line: 149 ]]
                        while v36.Playing and l_v42_0 < 3 do
                            wait(0.1);
                            l_v42_0 = l_v42_0 + 0.1;
                        end;
                        if l_v42_0 >= 3 and not l_v41_0 then
                            l_v41_0 = true;
                            print("listen added");
                            l_AnalyticsEvent_0:FireServer("listen", {
                                v36.Name
                            });
                        end;
                    end);
                    return;
                else
                    l_v42_0 = 0;
                    l_v41_0 = false;
                end;
            end;
        end);
        v36.Ended:Connect(function() --[[ Line: 168 ]]
            v37.Play.Image = "rbxassetid://18398990826";
            local l_ProgressBack_0 = v37.ProgressBack;
            local v47 = {
                BackgroundTransparency = 1
            };
            l_TweenService_0:Create(l_ProgressBack_0, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v47):Play();
            l_ProgressBack_0 = v37.Progress;
            v47 = {
                BackgroundTransparency = 1
            };
            l_TweenService_0:Create(l_ProgressBack_0, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v47):Play();
            v37.Info.Title.TextColor3 = Color3.fromRGB(255, 28, 138);
            v37.Info.Artist.TextColor3 = Color3.fromRGB(255, 28, 138);
            v37.UIStroke.Color = Color3.fromRGB(255, 28, 138);
            l_ProgressBack_0 = v37.Info.Title;
            v47 = {
                TextColor3 = Color3.fromRGB(121, 166, 75)
            };
            l_TweenService_0:Create(l_ProgressBack_0, TweenInfo.new(2, Enum.EasingStyle.Linear), v47):Play();
            l_ProgressBack_0 = v37.Info.Artist;
            v47 = {
                TextColor3 = Color3.fromRGB(121, 166, 75)
            };
            l_TweenService_0:Create(l_ProgressBack_0, TweenInfo.new(2, Enum.EasingStyle.Linear), v47):Play();
            l_ProgressBack_0 = v37.UIStroke;
            v47 = {
                Color = Color3.fromRGB(104, 142, 66)
            };
            l_TweenService_0:Create(l_ProgressBack_0, TweenInfo.new(2, Enum.EasingStyle.Linear), v47):Play();
            v10.Event("GASongCompleted"):FireServer(v36.Name);
            if v37.Info.Title.Giftbux.Visible then
                l_SoundService_0.SFX.Redeem:Play();
                v37.Info.Title.Giftbux.Visible = false;
            end;
            v47 = v35 + 1;
            if #l_Children_0 < v47 then
                v47 = 1;
            end;
            l_Children_0[v47]:Play();
            l_AnalyticsEvent_0:FireServer("fullListen", {
                v36.Name
            });
            l_v42_0 = 0;
            l_v41_0 = false;
        end);
        v36.Paused:Connect(function() --[[ Line: 193 ]]
            v37.Play.Image = "rbxassetid://18398990826";
            local l_ProgressBack_1 = v37.ProgressBack;
            local v49 = {
                BackgroundTransparency = 1
            };
            l_TweenService_0:Create(l_ProgressBack_1, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v49):Play();
            l_ProgressBack_1 = v37.Progress;
            v49 = {
                BackgroundTransparency = 1
            };
            l_TweenService_0:Create(l_ProgressBack_1, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v49):Play();
        end);
        v36.Resumed:Connect(function() --[[ Line: 199 ]]
            v37.Play.Image = "rbxassetid://18399007902";
            local l_ProgressBack_2 = v37.ProgressBack;
            local v51 = {
                BackgroundTransparency = 0
            };
            l_TweenService_0:Create(l_ProgressBack_2, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v51):Play();
            l_ProgressBack_2 = v37.Progress;
            v51 = {
                BackgroundTransparency = 0
            };
            l_TweenService_0:Create(l_ProgressBack_2, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v51):Play();
        end);
        v36.Played:Connect(function() --[[ Line: 205 ]]
            v37.Play.Image = "rbxassetid://18399007902";
            local l_ProgressBack_3 = v37.ProgressBack;
            local v53 = {
                BackgroundTransparency = 0
            };
            l_TweenService_0:Create(l_ProgressBack_3, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v53):Play();
            l_ProgressBack_3 = v37.Progress;
            v53 = {
                BackgroundTransparency = 0
            };
            l_TweenService_0:Create(l_ProgressBack_3, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v53):Play();
        end);
        spawn(function() --[[ Line: 211 ]]
            while task.wait() do
                v37.SoundProgress.Text = formatTime(v36.TimePosition) .. " / " .. formatTime(v36.TimeLength);
                v37.Progress.Size = UDim2.new(v36.TimePosition / v36.TimeLength, 0, 0, 3);
            end;
        end);
    end;
end;