-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_SoundService_0 = game:GetService("SoundService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
local l_StarterGui_0 = game:GetService("StarterGui");
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local l_UITemplates_0 = l_StarterGui_0:WaitForChild("UITemplates");
local function _(v7, v8, v9)
    l_TweenService_0:Create(v7, TweenInfo.new(v8, Enum.EasingStyle.Quint), v9):Play();
end;
-- changed spawn to task.spawn and changed
return function(v11, v12)
    task.spawn(function()
        if l_ScreenGui_0.Popups:GetAttribute("Enabled") then
            l_SoundService_0.SFX.BellRing:Play();
            local v13 = l_UITemplates_0[v11 .. "Popup"];
            if not v13 then
                print("NOPE");
                return;
            else
                local v14 = v13:Clone();
                v14.Message.Text = v12;
                v14.Transparency = 1;
                v14.UIScale.Scale = 0;
                v14.Parent = l_ScreenGui_0.Popups;
                local v15 = {
                    Transparency = 0
                };
                l_TweenService_0:Create(v14, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v15):Play();
                v15 = v14.UIScale;
                local v16 = {
                    Scale = 1
                };
                local l_Back_0 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v15, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v16):Play();
                v15 = v14.Message;
                v16 = {
                    MaxVisibleGraphemes = #v12
                };
                l_TweenService_0:Create(v15, TweenInfo.new(1, Enum.EasingStyle.Quint), v16):Play();
                task.wait(4);
                v15 = {
                    Transparency = 1
                };
                l_TweenService_0:Create(v14, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v15):Play();
                v15 = v14.UIScale;
                v16 = {
                    Scale = 0
                };
                l_Back_0 = Enum.EasingStyle.Back;
                l_TweenService_0:Create(v15, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v16):Play();
                task.wait(0.1);
                v14:Destroy();
            end;
        end;
    end);
end;