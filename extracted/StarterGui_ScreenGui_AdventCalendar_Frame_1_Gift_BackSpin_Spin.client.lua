-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
(function() --[[ Line: 7 ]] --[[ Name: spinImageLabel ]]
    local v2 = TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0);
    local v3 = {
        Rotation = 360
    };
    l_TweenService_0:Create(l_Parent_0, v2, v3):Play();
end)();