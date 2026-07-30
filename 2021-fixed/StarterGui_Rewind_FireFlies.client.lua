-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: tween ]]
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Linear);
    local v6 = l_TweenService_0:Create(v1, v5, v3);
    v6:Play();
    return v6;
end;
while true do
    local v8 = script.Glow:Clone();
    local v9 = math.random(0, 100) / 100;
    v8.Position = UDim2.new(v9, 0, 1.2, 0);
    v8.Parent = script.Parent.Particles;
    local v10 = math.random(9, 14);
    local v11 = {
        Position = UDim2.new(v9, 0, -0.2, 0)
    };
    local v12 = l_TweenService_0:Create(v8, TweenInfo.new(v10, Enum.EasingStyle.Linear), v11);
    v12:Play();
    local l_v12_0 = v12;
    v10 = TweenInfo.new(math.random(100, 250) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
    v8.ImageTransparency = math.random(30, 100) / 100;
    v8.UIScale.Scale = math.random(10, 100) / 100;
    v11 = l_TweenService_0:Create(v8, v10, {
        ImageTransparency = 1
    });
    if math.random(1, 20) == 1 then
        local v14 = math.random(1, 3);
        v8.Image = "rbxassetid://77568449712751";
        if math.random(1, 10) == 1 then
            v8.Image = "rbxassetid://85638422284685";
        end;
        v8.Rotation = math.random(30, 330);
        v8.ZIndex = math.random(1, 3);
        v8.UIScale.Scale = 2.5 * v14;
        v8.ImageTransparency = 0.1;
        v8.Position = UDim2.new(v9, 0, -0.2, 0);
        v12 = math.random(5, 8);
        local v15 = {
            ImageTransparency = 1
        };
        l_TweenService_0:Create(v8, TweenInfo.new(v12, Enum.EasingStyle.Linear), v15):Play();
        v15 = math.random(6, 10);
        local v16 = {
            Position = UDim2.new(v9, 0, 1.2, 0)
        };
        local v17 = l_TweenService_0:Create(v8, TweenInfo.new(v15, Enum.EasingStyle.Linear), v16);
        v17:Play();
        v12 = v17;
        spawn(function() --[[ Line: 53 ]]
            v12.Completed:Wait();
            v8:Destroy();
        end);
    else
        v11:Play();
        l_TweenService_0:Create(v8.UIScale, v10, {
            Scale = v8.UIScale.Scale + 0.25
        }):Play();
        spawn(function() --[[ Line: 64 ]]
            l_v12_0.Completed:Wait();
            v8:Destroy();
        end);
    end;
    task.wait(math.random(10, 40) / 100);
end;