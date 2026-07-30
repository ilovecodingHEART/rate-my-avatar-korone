-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
if not l_Parent_0 then
    return;
else
    local l_TweenService_0 = game:GetService("TweenService");
    local v2 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut);
    local v3 = {
        Color = Color3.fromRGB(255, 87, 87)
    };
    local v4 = {
        Color = Color3.fromRGB(0, 195, 255)
    };
    while l_Parent_0 and l_Parent_0.Parent do
        l_TweenService_0:Create(l_Parent_0, v2, v3):Play();
        task.wait(0.3);
        if l_Parent_0 and l_Parent_0.Parent then
            l_TweenService_0:Create(l_Parent_0, v2, v4):Play();
            task.wait(0.3);
        else
            break;
        end;
    end;
    return;
end;