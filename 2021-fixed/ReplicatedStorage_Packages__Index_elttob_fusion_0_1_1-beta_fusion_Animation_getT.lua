-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
return function(v1, v2) --[[ Line: 8 ]] --[[ Name: getTweenRatio ]]
    local l_DelayTime_0 = v1.DelayTime;
    local l_Time_0 = v1.Time;
    local l_Reverses_0 = v1.Reverses;
    local l_RepeatCount_0 = v1.RepeatCount;
    local l_EasingStyle_0 = v1.EasingStyle;
    local l_EasingDirection_0 = v1.EasingDirection;
    local v9 = l_DelayTime_0 + l_Time_0;
    if l_Reverses_0 then
        v9 = v9 + l_Time_0;
    end;
    if v9 * l_RepeatCount_0 <= v2 then
        return 1;
    else
        local v10 = v2 % v9;
        if v10 <= l_DelayTime_0 then
            return 0;
        else
            local v11 = (v10 - l_DelayTime_0) / l_Time_0;
            if v11 > 1 then
                v11 = 2 - v11;
            end;
            return (l_TweenService_0:GetValue(v11, l_EasingStyle_0, l_EasingDirection_0));
        end;
    end;
end;