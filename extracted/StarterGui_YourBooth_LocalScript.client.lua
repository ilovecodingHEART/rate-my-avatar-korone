-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local function _(v1, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: tween ]]
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Quint);
    local v6 = game:GetService("TweenService"):Create(v1, v5, v3);
    v6:Play();
    return v6;
end;
local v8 = nil;
local function v11(v9, v10) --[[ Line: 16 ]] --[[ Name: animation ]]
    if v8 then
        if v8.id == v9 then
            return;
        else
            task.cancel(v8.thread);
        end;
    end;
    v8 = {
        id = v9, 
        thread = task.spawn(v10)
    };
end;
local l_Parent_0 = script.Parent;
l_Parent_0.CanvasGroup.TextButton.Activated:Connect(function() --[[ Line: 28 ]]
    if l_Parent_0.Adornee ~= nil then
        l_LocalPlayer_0.Character:MoveTo(l_Parent_0.Adornee.Position);
    end;
end);
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 34 ]]
    if l_Parent_0.Adornee == nil then
        l_Parent_0.Enabled = false;
        return;
    elseif (workspace.Camera.CFrame.Position - l_Parent_0.Adornee.Position).Magnitude < 50 then
        v11("FadeOut", function() --[[ Line: 38 ]]
            print("YourBooth is fading out");
            local l_CanvasGroup_0 = l_Parent_0.CanvasGroup;
            local v14 = {
                GroupTransparency = 1
            };
            local v15 = TweenInfo.new(0.3, Enum.EasingStyle.Quint);
            game:GetService("TweenService"):Create(l_CanvasGroup_0, v15, v14):Play();
            l_CanvasGroup_0 = l_Parent_0.CanvasGroup.UIScale;
            v14 = {
                Scale = -0.1
            };
            v15 = Enum.EasingStyle.Back;
            local v16 = TweenInfo.new(0.3, v15 or Enum.EasingStyle.Quint);
            game:GetService("TweenService"):Create(l_CanvasGroup_0, v16, v14):Play();
            task.wait(0.3);
            l_Parent_0.Enabled = false;
        end);
        return;
    else
        v11("FadeIn", function() --[[ Line: 46 ]]
            print("YourBooth is fading in");
            l_Parent_0.Enabled = true;
            local l_CanvasGroup_1 = l_Parent_0.CanvasGroup;
            local v18 = {
                GroupTransparency = 0
            };
            local v19 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            game:GetService("TweenService"):Create(l_CanvasGroup_1, v19, v18):Play();
            l_CanvasGroup_1 = l_Parent_0.CanvasGroup.UIScale;
            v18 = {
                Scale = 1
            };
            v19 = Enum.EasingStyle.Back;
            local v20 = TweenInfo.new(0.3, v19 or Enum.EasingStyle.Quint);
            game:GetService("TweenService"):Create(l_CanvasGroup_1, v20, v18):Play();
        end);
        return;
    end;
end);