-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_RunService_0 = game:GetService("RunService");
v0.Round = function(_, v3, v4) --[[ Line: 9 ]] --[[ Name: Round ]]
    local v5 = 10 ^ (v4 or 0);
    return math.floor(v3 * v5 + 0.5) / v5;
end;
v0.RoundNearestInterval = function(_, v7, v8) --[[ Line: 14 ]] --[[ Name: RoundNearestInterval ]]
    return v0:Round(v7 / v8) * v8;
end;
v0.StepTowards = function(_, v10, v11, v12) --[[ Line: 18 ]] --[[ Name: StepTowards ]]
    if math.abs(v10 - v11) < v12 then
        return v11;
    elseif v11 < v10 then
        return v10 - v12;
    elseif v10 < v11 then
        return v10 + v12;
    else
        return;
    end;
end;
v0.PromiseChild = function(_, v14, v15, v16, ...) --[[ Line: 28 ]] --[[ Name: PromiseChild ]]
    coroutine.wrap(function(...) --[[ Line: 29 ]]
        local v17 = v14:WaitForChild(v15, 10);
        if v17 then
            v16(v17, ...);
        end;
    end)(...);
end;
v0.PromiseValue = function(_, v19, v20, v21, ...) --[[ Line: 40 ]] --[[ Name: PromiseValue ]]
    local _ = {
        ...
    };
    coroutine.wrap(function(...) --[[ Line: 43 ]]
        local v23 = tick() + 10;
        while true do
            if not v19[v20] then
                if v23 - tick() < 0 then
                    return;
                else
                    l_RunService_0.Heartbeat:Wait();
                end;
            else
                v21(v19[v20], ...);
                return;
            end;
        end;
    end)(...);
end;
return v0;