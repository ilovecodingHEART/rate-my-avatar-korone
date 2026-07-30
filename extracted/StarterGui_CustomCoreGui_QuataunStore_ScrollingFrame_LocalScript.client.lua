-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
local l_ImageLabel_0 = script.Parent.Parent.ImageLabel;
local l_TweenService_0 = game:GetService("TweenService");
l_Parent_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 5 ]]
    -- upvalues: l_Parent_0 (copy), l_ImageLabel_0 (copy), l_TweenService_0 (copy)
    local l_Y_0 = l_Parent_0.CanvasPosition.Y;
    local l_Y_1 = l_Parent_0.AbsoluteWindowSize.Y;
    l_ImageLabel_0.ImageTransparency = math.floor(l_Y_0) / 500;
    l_Parent_0.StoreInfo.Info.Owner.TextTransparency = math.floor(l_Y_0) / 50;
    l_Parent_0.StoreInfo.Info.Group.TextTransparency = math.floor(l_Y_0) / 50;
    l_Parent_0.StoreInfo.Icon.ImageTransparency = math.floor(l_Y_0) / 50;
    script.Parent.Parent.TopBar.GroupTransparency = 1 - math.clamp(math.floor(l_Y_0) / 500, 0, 1);
    for _, v6 in ipairs(l_Parent_0:GetChildren()) do
        if v6:FindFirstChildOfClass("UIScale") then
            local v7 = v6.AbsolutePosition.Y - l_Parent_0.AbsolutePosition.Y;
            local v8 = false;
            if v7 + v6.AbsoluteSize.Y > 0 then
                v8 = v7 < l_Y_1;
            end;
            local v9 = v8 and 1 or 0.5;
            local l_UIScale_0 = v6:FindFirstChildOfClass("UIScale");
            if math.abs(l_UIScale_0.Scale - v9) > 0.01 then
                l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Scale = v9
                }):Play();
            end;
        end;
    end;
end);