-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(game.ReplicatedStorage.popup);
tween = function(v5, v6, v7, v8) --[[ Line: 8 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 9 ]]
        -- upvalues: l_TweenService_0 (ref), v5 (copy), v6 (copy), v8 (copy), v7 (copy)
        l_TweenService_0:Create(v5, TweenInfo.new(v6, v8 or Enum.EasingStyle.Quint), v7):Play();
    end);
end;
local l_ProximityPrompt_0 = workspace:WaitForChild("Adidas", 1e999).InfoCoach:WaitForChild("HumanoidRootPart").ProximityPrompt;
local l_Parent_0 = script.Parent;
l_ProximityPrompt_0.Triggered:Connect(function() --[[ Line: 25 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Parent_0 (copy), l_ProximityPrompt_0 (copy)
    if l_LocalPlayer_0:GetAttribute("SelectedClubTeam") then
        l_Parent_0.BackgroundTransparency = 1;
        tween(l_Parent_0, 1, {
            BackgroundTransparency = 0
        });
        l_Parent_0.Frame.Speech.MaxVisibleGraphemes = -1;
        l_Parent_0.Frame.Speech.TextTransparency = 0;
        l_Parent_0.Frame.Speech.Text = ("Hey %s! Ready to see where you stand?"):format(l_LocalPlayer_0.DisplayName);
        tween(l_Parent_0.Frame.Speech, 2, {
            MaxVisibleGraphemes = #l_Parent_0.Frame.Speech.Text
        });
        task.wait(2);
        l_Parent_0.Frame.Buttons.UIScale.Scale = 0;
        tween(l_Parent_0.Frame.Buttons.UIScale, 0.5, {
            Scale = 1
        });
    else
        l_Parent_0.BackgroundTransparency = 1;
        tween(l_Parent_0, 1, {
            BackgroundTransparency = 0
        });
        l_Parent_0.Frame.Speech.MaxVisibleGraphemes = -1;
        l_Parent_0.Frame.Speech.TextTransparency = 0;
        l_Parent_0.Frame.Speech.Text = ("Hey %s. Looks like you\226\128\153re still without a team. Go to the Stadium Entrance and select the club you want to support!"):format(l_LocalPlayer_0.DisplayName);
        tween(l_Parent_0.Frame.Speech, 2, {
            MaxVisibleGraphemes = #l_Parent_0.Frame.Speech.Text
        });
        task.wait(5);
        tween(l_Parent_0, 0.5, {
            BackgroundTransparency = 1
        });
        tween(l_Parent_0.Frame.Speech, 0.5, {
            TextTransparency = 1
        });
        tween(l_Parent_0.Frame.Buttons.UIScale, 0.5, {
            Scale = 0
        });
    end;
    l_ProximityPrompt_0.Enabled = false;
    task.wait(5);
    l_ProximityPrompt_0.Enabled = true;
end);
l_Parent_0.Frame.Buttons.Yes.Activated:Connect(function() --[[ Line: 69 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Parent_0 (copy)
    l_LocalPlayer_0.PlayerGui.ScreenGui.Adidas.Visible = true;
    tween(l_Parent_0, 0.5, {
        BackgroundTransparency = 1
    });
    tween(l_Parent_0.Frame.Speech, 0.5, {
        TextTransparency = 1
    });
    tween(l_Parent_0.Frame.Buttons.UIScale, 0.5, {
        Scale = 0
    });
end);
l_Parent_0.Frame.Buttons.No.Activated:Connect(function() --[[ Line: 76 ]]
    -- upvalues: l_Parent_0 (copy)
    tween(l_Parent_0, 0.5, {
        BackgroundTransparency = 1
    });
    tween(l_Parent_0.Frame.Speech, 0.5, {
        TextTransparency = 1
    });
    tween(l_Parent_0.Frame.Buttons.UIScale, 0.5, {
        Scale = 0
    });
end);
l_Parent_0.Frame.Speech:GetPropertyChangedSignal("MaxVisibleGraphemes"):Connect(function() --[[ Line: 82 ]]
    script.Speech:Play();
end);