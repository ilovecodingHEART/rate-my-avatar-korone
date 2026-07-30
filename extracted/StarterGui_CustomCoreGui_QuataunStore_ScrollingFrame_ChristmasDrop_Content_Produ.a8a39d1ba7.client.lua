-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UIGradient_0 = script.Parent:WaitForChild("UIGradient");
local l_TweenService_0 = game:GetService("TweenService");
l_UIGradient_0.Color = (function(v2) --[[ Line: 5 ]] --[[ Name: generateCyclicRainbow ]]
    v2 = math.clamp(v2 or 12, 3, 12);
    local v3 = {};
    table.insert(v3, ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0.55, 1)));
    for v4 = 1, v2 - 2 do
        local v5 = v4 / (v2 - 1);
        local v6 = v4 / (v2 - 1);
        local v7 = Color3.fromHSV(v6, 0.55, 1);
        table.insert(v3, ColorSequenceKeypoint.new(v5, v7));
    end;
    table.insert(v3, ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 0.55, 1)));
    return ColorSequence.new(v3);
end)(12);
l_UIGradient_0.Offset = Vector2.new(-0.5, 0);
task.spawn(function() --[[ Line: 28 ]] --[[ Name: animateGradientPingPong ]]
    -- upvalues: l_TweenService_0 (copy), l_UIGradient_0 (copy)
    local v8 = l_TweenService_0:Create(l_UIGradient_0, TweenInfo.new(5, Enum.EasingStyle.Linear), {
        Offset = Vector2.new(0.5, 0)
    });
    local v9 = l_TweenService_0:Create(l_UIGradient_0, TweenInfo.new(5, Enum.EasingStyle.Linear), {
        Offset = Vector2.new(-0.5, 0)
    });
    while true do
        v8:Play();
        v8.Completed:Wait();
        v9:Play();
        v9.Completed:Wait();
    end;
end);