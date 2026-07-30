-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local v1 = {
    ExpandTime = 0.6, 
    ShrinkTime = 0.6, 
    EasingStyle = Enum.EasingStyle.Quint, 
    EasingDirection = Enum.EasingDirection.Out
};
local function _(v2, v3, v4) --[[ Line: 10 ]] --[[ Name: tween ]]
    -- upvalues: v1 (copy), l_TweenService_0 (copy)
    local v5 = TweenInfo.new(v3, v1.EasingStyle, v1.EasingDirection);
    local v6 = l_TweenService_0:Create(v2, v5, v4);
    v6:Play();
    return v6;
end;
v1.Play = function(v8) --[[ Line: 22 ]] --[[ Name: Play ]]
    -- upvalues: v1 (copy), l_TweenService_0 (copy)
    assert(v8 and v8:IsA("Frame"), "Transition.Play requires a Frame");
    v8.Visible = true;
    v8.ZIndex = 1000;
    v8.AnchorPoint = Vector2.new(0.5, 0);
    v8.Position = UDim2.fromScale(0.5, 0);
    v8.Size = UDim2.fromScale(1, 0);
    local l_ExpandTime_0 = v1.ExpandTime;
    local v10 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v11 = TweenInfo.new(l_ExpandTime_0, v1.EasingStyle, v1.EasingDirection);
    local v12 = l_TweenService_0:Create(v8, v11, v10);
    v12:Play();
    v12.Completed:Wait();
    v8.AnchorPoint = Vector2.new(0.5, 1);
    v8.Position = UDim2.fromScale(0.5, 1);
    task.spawn(function() --[[ Line: 43 ]]
        -- upvalues: v8 (copy), v1 (ref), l_TweenService_0 (ref)
        local l_v8_0 = v8;
        local l_ShrinkTime_0 = v1.ShrinkTime;
        local v15 = {
            Size = UDim2.fromScale(1, 0)
        };
        local v16 = TweenInfo.new(l_ShrinkTime_0, v1.EasingStyle, v1.EasingDirection);
        local v17 = l_TweenService_0:Create(l_v8_0, v16, v15);
        v17:Play();
        v17.Completed:Wait();
        v8.Visible = false;
    end);
end;
return v1;