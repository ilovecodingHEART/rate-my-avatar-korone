-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_CollectionService_0 = game:GetService("CollectionService");
local _ = l_Players_0.LocalPlayer.PlayerGui;
local _ = game:GetService("StarterGui"):WaitForChild("UITemplates");
local _ = require(l_ReplicatedStorage_0.Remotes);
local function _(v8, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: tween ]]
    local v12 = TweenInfo.new(v9, v11 or Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
    l_TweenService_0:Create(v8, v12, v10):Play();
end;
local v14 = {};
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 92 ]]
    for _, v16 in pairs(l_CollectionService_0:GetTagged("HeadTag")) do
        print("headtag found");
        if v16.Name == "Head" then
            local l_Magnitude_0 = (v16.Parent.Position - workspace.CurrentCamera.CFrame.Position).Magnitude;
            print("Distance: " .. l_Magnitude_0);
            if not v14[v16] then
                v14[v16] = false;
            end;
            if l_Magnitude_0 <= 5 and not v14[v16] then
                print("<5");
                local l_UIScale_0 = v16.DisplayName.UIScale;
                local v19 = {
                    Scale = 1
                };
                local l_Back_0 = Enum.EasingStyle.Back;
                local v21 = TweenInfo.new(0.5, l_Back_0 or Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_UIScale_0, v21, v19):Play();
                l_UIScale_0 = v16.Rank.UIScale;
                v19 = {
                    Scale = 1
                };
                l_Back_0 = Enum.EasingStyle.Back;
                v21 = TweenInfo.new(0.5, l_Back_0 or Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_UIScale_0, v21, v19):Play();
                v14[v16] = true;
            elseif l_Magnitude_0 > 5 and v14[v16] then
                print(">5");
                local l_UIScale_1 = v16.DisplayName.UIScale;
                local v23 = {
                    Scale = 0.1
                };
                local l_Back_1 = Enum.EasingStyle.Back;
                local v25 = TweenInfo.new(0.5, l_Back_1 or Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_UIScale_1, v25, v23):Play();
                l_UIScale_1 = v16.Rank.UIScale;
                v23 = {
                    Scale = 0.1
                };
                l_Back_1 = Enum.EasingStyle.Back;
                v25 = TweenInfo.new(0.5, l_Back_1 or Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_UIScale_1, v25, v23):Play();
                v14[v16] = false;
            end;
        else
            print("headTag.Adornee is nil or does not have a Position");
        end;
    end;
end);