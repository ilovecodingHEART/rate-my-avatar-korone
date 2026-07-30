-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UIGradient_0 = script.Parent.UIGradient;
local v1 = game:GetService("TweenService"):Create(l_UIGradient_0, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
    Offset = Vector2.new(1, 0)
});
local v2 = Vector2.new(-1, 0);
local v3 = {};
local l_new_0 = ColorSequence.new;
local l_new_1 = ColorSequenceKeypoint.new;
local v6 = 0;
local v7 = "down";
l_UIGradient_0.Offset = v2;
(function() --[[ Line: 15 ]] --[[ Name: rainbowColors ]]
    for v8 = 1, 15 do
        local v9 = v8 * 17;
        table.insert(v3, Color3.fromHSV(v9 / 255, 1, 1));
    end;
end)();
l_UIGradient_0.Color = l_new_0({
    l_new_1(0, v3[#v3]), 
    l_new_1(0.5, v3[#v3 - 1]), 
    l_new_1(1, v3[#v3 - 2])
});
v6 = #v3;
local function v10() --[[ Line: 40 ]] --[[ Name: animate ]]
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    l_UIGradient_0.Rotation = 180;
    if v6 == #v3 - 1 and v7 == "down" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, l_UIGradient_0.Color.Keypoints[1].Value), 
            l_new_1(0.5, v3[#v3]), 
            l_new_1(1, v3[1])
        });
        v6 = 1;
        v7 = "up";
    elseif v6 == #v3 and v7 == "down" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, l_UIGradient_0.Color.Keypoints[1].Value), 
            l_new_1(0.5, v3[1]), 
            l_new_1(1, v3[2])
        });
        v6 = 2;
        v7 = "up";
    elseif v6 <= #v3 - 2 and v7 == "down" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, l_UIGradient_0.Color.Keypoints[1].Value), 
            l_new_1(0.5, v3[v6 + 1]), 
            l_new_1(1, v3[v6 + 2])
        });
        v6 = v6 + 2;
        v7 = "up";
    end;
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    l_UIGradient_0.Rotation = 0;
    if v6 == #v3 - 1 and v7 == "up" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, v3[1]), 
            l_new_1(0.5, v3[#v3]), 
            l_new_1(1, l_UIGradient_0.Color.Keypoints[3].Value)
        });
        v6 = 1;
        v7 = "down";
    elseif v6 == #v3 and v7 == "up" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, v3[2]), 
            l_new_1(0.5, v3[1]), 
            l_new_1(1, l_UIGradient_0.Color.Keypoints[3].Value)
        });
        v6 = 2;
        v7 = "down";
    elseif v6 <= #v3 - 2 and v7 == "up" then
        l_UIGradient_0.Color = l_new_0({
            l_new_1(0, v3[v6 + 2]), 
            l_new_1(0.5, v3[v6 + 1]), 
            l_new_1(1, l_UIGradient_0.Color.Keypoints[3].Value)
        });
        v6 = v6 + 2;
        v7 = "down";
    end;
    v10();
end;
v10();