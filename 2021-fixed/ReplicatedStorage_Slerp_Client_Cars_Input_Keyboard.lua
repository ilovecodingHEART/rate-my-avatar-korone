-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Shared);
local v4 = {
    new = function() --[[ Line: 4 ]] --[[ Name: new ]]
        return {
            throttleUp = 0, 
            throttleDown = 0, 
            steerLeft = 0, 
            steerRight = 0
        };
    end, 
    is = function(v2, _) --[[ Line: 12 ]] --[[ Name: is ]]
        if v2.UserInputType == Enum.UserInputType.Keyboard then
            return true;
        else
            return false;
        end;
    end
};
local function _(v5) --[[ Line: 20 ]] --[[ Name: _ ]]
    if v5 then
        return 0;
    else
        return 1;
    end;
end;
local function _(v7) --[[ Line: 27 ]] --[[ Name: _ ]]
    return v7.throttleUp + v7.throttleDown;
end;
local function _(v9) --[[ Line: 30 ]] --[[ Name: _ ]]
    return v9.steerLeft + v9.steerRight;
end;
local function v17(v11, v12, _, v14) --[[ Line: 33 ]] --[[ Name: v17 ]]
    -- upvalues: v1 (copy)
    local v15 = v14 and 0 or 1;
    local l__handlerData_0 = v11._handlerData;
    if v12.KeyCode == Enum.KeyCode.W then
        l__handlerData_0.throttleUp = v15 * v1.THROTTLE_FORWARD;
        v1.setThrottle(v11, l__handlerData_0.throttleUp + l__handlerData_0.throttleDown);
        return;
    elseif v12.KeyCode == Enum.KeyCode.S then
        l__handlerData_0.throttleDown = v15 * v1.THROTTLE_BACKWARD;
        v1.setThrottle(v11, l__handlerData_0.throttleUp + l__handlerData_0.throttleDown);
        return;
    elseif v12.KeyCode == Enum.KeyCode.A then
        l__handlerData_0.steerLeft = v15 * v1.STEER_LEFT;
        v1.setSteer(v11, l__handlerData_0.steerLeft + l__handlerData_0.steerRight);
        return;
    elseif v12.KeyCode == Enum.KeyCode.D then
        l__handlerData_0.steerRight = v15 * v1.STEER_RIGHT;
        v1.setSteer(v11, l__handlerData_0.steerLeft + l__handlerData_0.steerRight);
        return;
    else
        if v12.KeyCode == Enum.KeyCode.LeftShift then
            v1.setHandbrakeIsEngaged(v11, not v14);
        end;
        return;
    end;
end;
v4.inputBeganCallback = function(v18, v19, v20) --[[ Line: 60 ]]
    -- upvalues: v1 (copy), v17 (copy)
    if v20 then

    end;
    if v19.KeyCode == Enum.KeyCode.L then
        v1.toggleLights(v18);
        return;
    elseif v19.KeyCode == Enum.KeyCode.F then
        v1.flip(v18);
        return;
    else
        v17(v18, v19, v20, false);
        return;
    end;
end;
v4.inputEndedCallback = function(v21, v22, v23) --[[ Line: 76 ]]
    -- upvalues: v17 (copy)
    if v23 then

    end;
    v17(v21, v22, v23, true);
end;
v4.inputChangedCallback = function(_, _, _) --[[ Line: 83 ]]

end;
__2021_freeze(v4);
return v4;