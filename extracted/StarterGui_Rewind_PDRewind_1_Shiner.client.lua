-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UIGradient_0 = script.Parent.UIGradient;
local v1 = game:GetService("TweenService"):Create(l_UIGradient_0, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
    Offset = Vector2.new(1, 0)
});
local v2 = Vector2.new(-1, 0);
l_UIGradient_0.Offset = v2;
local function v3() --[[ Line: 12 ]] --[[ Name: animate ]]
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    wait(2.5);
    v3();
end;
v3();