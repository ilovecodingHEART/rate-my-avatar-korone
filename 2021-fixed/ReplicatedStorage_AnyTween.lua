-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local v12 = {
    alpha = function(v4, v5) --[[ Line: 9 ]] --[[ Name: alpha ]]
        return (v3.delay(v4.DelayTime):andThen(function() --[[ Line: 12 ]]
            return (v3.new(function(v6, _, v8) --[[ Line: 13 ]]
                local v9 = 0;
                repeat
                    local v10 = v9 / v4.Time;
                    local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v10, v4.EasingStyle, v4.EasingDirection);
                    v5(l_l_TweenService_0_Value_0);
                    v9 = v9 + task.wait();
                until v4.Time <= v9 or v8();
                if not v8() then
                    v5(1);
                    v6();
                end;
            end));
        end));
    end
};
v12.range = function(v13, v14, v15, v16) --[[ Line: 32 ]] --[[ Name: range ]]
    if v14 == v15 then
        v16(v15);
        return v3.resolve();
    else
        return v12.alpha(v13, function(v17) --[[ Line: 37 ]]
            v16(v14 + (v15 - v14) * v17);
        end);
    end;
end;
return v12;