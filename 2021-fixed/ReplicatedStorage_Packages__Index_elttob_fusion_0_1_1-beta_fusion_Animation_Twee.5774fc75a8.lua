-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Animation.lerpType);
local v3 = require(l_Parent_0.Animation.getTweenRatio);
local v4 = require(l_Parent_0.Dependencies.updateAll);
local v5 = {};
local v6 = setmetatable({}, {
    __mode = "k"
});
v5.add = function(v7) --[[ Line: 32 ]] --[[ Name: add ]]
    v6[v7] = true;
end;
v5.remove = function(v8) --[[ Line: 39 ]] --[[ Name: remove ]]
    v6[v8] = nil;
end;
l_RunService_0:BindToRenderStep("__FusionTweenScheduler", Enum.RenderPriority.First.Value, function() --[[ Line: 46 ]] --[[ Name: updateAllTweens ]]
    local v9 = os.clock();
    for v10 in pairs(v6) do
        local v11 = v9 - v10._currentTweenStartTime;
        if v10._currentTweenDuration < v11 then
            if v10._currentTweenInfo.Reverses then
                v10._currentValue = v10._prevValue;
            else
                v10._currentValue = v10._nextValue;
            end;
            v4(v10);
            v5.remove(v10);
        else
            local v12 = v3(v10._currentTweenInfo, v11);
            v10._currentValue = v2(v10._prevValue, v10._nextValue, v12);
            v4(v10);
        end;
    end;
end);
return v5;