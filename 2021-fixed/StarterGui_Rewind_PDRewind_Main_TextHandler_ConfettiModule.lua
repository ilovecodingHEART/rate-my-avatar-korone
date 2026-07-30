-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Size = UDim2.new(0, 10, 0, 20);
l_Frame_0.BorderSizePixel = 0;
l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
l_Frame_0.BackgroundColor3 = Color3.new(1, 0, 0);
local v2 = {
    Color3.fromRGB(255, 85, 85), 
    Color3.fromRGB(85, 255, 85), 
    Color3.fromRGB(85, 85, 255), 
    Color3.fromRGB(255, 255, 85), 
    Color3.fromRGB(255, 85, 255), 
    Color3.fromRGB(85, 255, 255)
};
local l_TweenService_0 = game:GetService("TweenService");
local function _(v4, v5, v6) --[[ Line: 20 ]] --[[ Name: tween ]]
    local v7 = TweenInfo.new(v5, Enum.EasingStyle.Linear);
    local v8 = l_TweenService_0:Create(v4, v7, v6);
    v8:Play();
    return v8;
end;
v0.create = function(v10, v11, v12, v13, v14) --[[ Line: 27 ]] --[[ Name: create ]]
    v14 = v14 or false;
    v11 = v11 or l_Frame_0;
    spawn(function() --[[ Line: 31 ]]
        for _ = 1, v13 do
            for _ = 1, v12 do
                local v17 = v11:Clone();
                v17.Parent = v10;
                v17.Position = UDim2.new(math.random(), 0, -0.1, 0);
                v17.Rotation = math.random(0, 360);
                if not v14 then
                    v17.BackgroundColor3 = v2[math.random(1, #v2)];
                end;
                local v18 = {
                    Position = UDim2.new(v17.Position.X.Scale, 0, 1.1, 0), 
                    Rotation = math.random(0, 360)
                };
                local v19 = TweenInfo.new(3, Enum.EasingStyle.Linear);
                local v20 = l_TweenService_0:Create(v17, v19, v18);
                v20:Play();
                v20.Completed:Connect(function() --[[ Line: 48 ]]
                    local l_v17_0 = v17;
                    local v22 = {
                        BackgroundTransparency = 1
                    };
                    local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Linear);
                    local v24 = l_TweenService_0:Create(l_v17_0, v23, v22);
                    v24:Play();
                    v24.Completed:Connect(function() --[[ Line: 50 ]]
                        v17:Destroy();
                    end);
                end);
            end;
            task.wait(math.random(1, 2) / 10);
        end;
    end);
end;
return v0;