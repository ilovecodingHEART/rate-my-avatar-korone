-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: tween ]]
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v1, v5, v3):Play();
end;
local l_Counter_0 = script.Parent.Counter;
local function v22(v8) --[[ Line: 11 ]] --[[ Name: updateCounter ]]
    local l_l_Counter_0_0 = l_Counter_0;
    local v10 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    };
    local v11 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
    l_TweenService_0:Create(l_l_Counter_0_0, v11, v10):Play();
    for v12 = 1, 14 do
        local l_l_Counter_0_FirstChild_0 = l_Counter_0:FindFirstChild((tostring(v12 - 1)));
        if l_l_Counter_0_FirstChild_0 then
            if v12 <= #v8 then
                if v8 == "1S" then
                    script.Parent.Enabled = false;
                else
                    script.Parent.Enabled = true;
                    l_l_Counter_0_FirstChild_0.Visible = true;
                end;
                if l_l_Counter_0_FirstChild_0.Text == string.sub(v8, v12, v12) then
                    l_l_Counter_0_FirstChild_0.UIScale.Scale = 1;
                else
                    l_l_Counter_0_FirstChild_0.UIScale.Scale = 0;
                end;
                l_l_Counter_0_FirstChild_0.Text = string.sub(v8, v12, v12);
                local l_UIScale_0 = l_l_Counter_0_FirstChild_0.UIScale;
                local v15 = {
                    Scale = 1
                };
                local l_Back_0 = Enum.EasingStyle.Back;
                local v17 = TweenInfo.new(0.3, l_Back_0 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_UIScale_0, v17, v15):Play();
            else
                local l_UIScale_1 = l_l_Counter_0_FirstChild_0.UIScale;
                local v19 = {
                    Scale = 0
                };
                local l_Back_1 = Enum.EasingStyle.Back;
                local v21 = TweenInfo.new(0.1, l_Back_1 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_UIScale_1, v21, v19):Play();
                l_l_Counter_0_FirstChild_0.Visible = false;
            end;
        end;
        task.wait();
    end;
    l_l_Counter_0_0 = l_Counter_0.UIScale;
    v10 = {
        Scale = 1
    };
    v11 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
    l_TweenService_0:Create(l_l_Counter_0_0, v11, v10):Play();
end;
require(game.ReplicatedStorage.Remotes).OnClientEvent("UpdateCounter"):Connect(function(v23) --[[ Line: 46 ]]
    v22(v23);
end);