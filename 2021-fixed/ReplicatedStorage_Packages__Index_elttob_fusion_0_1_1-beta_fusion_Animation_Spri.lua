-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Animation.packType);
local v3 = require(l_Parent_0.Animation.springCoefficients);
local v4 = require(l_Parent_0.Dependencies.updateAll);
local v5 = {};
local v6 = {
    __mode = "k"
};
local v7 = {};
v5.add = function(v8) --[[ Line: 35 ]] --[[ Name: add ]]
    local l__damping_0 = v8._damping;
    local l__speed_0 = v8._speed;
    local v11 = v7[l__damping_0];
    if v11 == nil then
        v7[l__damping_0] = {
            [l__speed_0] = setmetatable({
                [v8] = true
            }, v6)
        };
        return;
    else
        local v12 = v11[l__speed_0];
        if v12 == nil then
            v11[l__speed_0] = setmetatable({
                [v8] = true
            }, v6);
            return;
        else
            v12[v8] = true;
            return;
        end;
    end;
end;
v5.remove = function(v13) --[[ Line: 61 ]] --[[ Name: remove ]]
    local l__damping_1 = v13._damping;
    local l__speed_1 = v13._speed;
    local v16 = v7[l__damping_1];
    if v16 == nil then
        return;
    else
        local v17 = v16[l__speed_1];
        if v17 == nil then
            return;
        else
            v17[v13] = nil;
            return;
        end;
    end;
end;
l_RunService_0:BindToRenderStep("__FusionSpringScheduler", Enum.RenderPriority.First.Value, function(v18) --[[ Line: 83 ]] --[[ Name: updateAllSprings ]]
    for v19, v20 in pairs(v7) do
        for v21, v22 in pairs(v20) do
            local v23, v24, v25, v26 = v3(v18, v19, v21);
            for v27 in pairs(v22) do
                local l__springGoals_0 = v27._springGoals;
                local l__springPositions_0 = v27._springPositions;
                local l__springVelocities_0 = v27._springVelocities;
                local v31 = false;
                for v32, v33 in ipairs(l__springGoals_0) do
                    local v34 = l__springPositions_0[v32];
                    local v35 = l__springVelocities_0[v32];
                    local v36 = v34 - v33;
                    local v37 = v36 * v23 + v35 * v24;
                    local v38 = v36 * v25 + v35 * v26;
                    if math.abs(v37) > 1.0E-4 or math.abs(v38) > 1.0E-4 then
                        v31 = true;
                    end;
                    l__springPositions_0[v32] = v37 + v33;
                    l__springVelocities_0[v32] = v38;
                end;
                if v31 then
                    v27._currentValue = v2(l__springPositions_0, v27._currentType);
                    v4(v27);
                else
                    v5.remove(v27);
                end;
            end;
        end;
    end;
end);
return v5;