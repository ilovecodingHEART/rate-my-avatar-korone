-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Shared);
local v2 = {};
local l_ButtonR2_0 = Enum.KeyCode.ButtonR2;
local l_ButtonL2_0 = Enum.KeyCode.ButtonL2;
local v5 = {
    Enum.UserInputType.Gamepad1
};
local _ = function(v6) --[[ Line: 9 ]]
    local v7 = {};
    for _, v9 in pairs(v6) --[[ 2021 ]] do
        v7[v9] = true;
    end;
    return v7;
end;
local v11 = {};
for _, v13 in pairs(v5) --[[ 2021 ]] do
    v11[v13] = true;
end;
local l_v11_0 = v11;
v2.is = function(v15, _) --[[ Line: 21 ]]
    -- upvalues: l_v11_0 (copy)
    if l_v11_0[v15.UserInputType] then
        return true;
    else
        return false;
    end;
end;
v2.new = function() --[[ Line: 29 ]]
    return {
        throttleUp = 0, 
        throttleDown = 0
    };
end;
v11 = function(v17) --[[ Line: 35 ]]
    if v17 then
        return 0;
    else
        return 1;
    end;
end;
local function _(v18) --[[ Line: 42 ]] --[[ Name: _ ]]
    return v18.throttleUp + v18.throttleDown;
end;
local _ = function(v20, v21, _, v23) --[[ Line: 45 ]]
    -- upvalues: v1 (copy)
    local _ = v23 and 0 or 1;
    local l_KeyCode_0 = v21.KeyCode;
    if l_KeyCode_0 == Enum.KeyCode.ButtonX or l_KeyCode_0 == Enum.KeyCode.ButtonL1 then
        v1.setHandbrakeIsEngaged(v20, not v23);
    end;
end;
v2.inputBeganCallback = function(v27, v28, v29) --[[ Line: 53 ]]
    -- upvalues: v1 (copy)
    if v29 then

    end;
    if v28.KeyCode == Enum.KeyCode.ButtonB then
        v1.toggleLights(v27);
        return;
    elseif v28.KeyCode == Enum.KeyCode.ButtonY or v28.KeyCode == Enum.KeyCode.ButtonR1 then
        v1.flip(v27);
        return;
    else
        local l_KeyCode_1 = v28.KeyCode;
        if l_KeyCode_1 == Enum.KeyCode.ButtonX or l_KeyCode_1 == Enum.KeyCode.ButtonL1 then
            v1.setHandbrakeIsEngaged(v27, true);
        end;
        return;
    end;
end;
v2.inputEndedCallback = function(v31, v32, v33) --[[ Line: 73 ]]
    -- upvalues: l_ButtonR2_0 (copy), v1 (copy), l_ButtonL2_0 (copy)
    if v33 then

    end;
    local l__handlerData_0 = v31._handlerData;
    local l_KeyCode_2 = v32.KeyCode;
    if l_KeyCode_2 == l_ButtonR2_0 then
        l__handlerData_0.throttleUp = 0;
        v1.setThrottle(v31, l__handlerData_0.throttleUp + l__handlerData_0.throttleDown);
    elseif l_KeyCode_2 == l_ButtonL2_0 then
        l__handlerData_0.throttleDown = 0;
        v1.setThrottle(v31, l__handlerData_0.throttleUp + l__handlerData_0.throttleDown);
    end;
    local l_KeyCode_3 = v32.KeyCode;
    if l_KeyCode_3 == Enum.KeyCode.ButtonX or l_KeyCode_3 == Enum.KeyCode.ButtonL1 then
        v1.setHandbrakeIsEngaged(v31, false);
    end;
end;
v2.inputChangedCallback = function(v37, v38, v39) --[[ Line: 93 ]]
    -- upvalues: l_ButtonR2_0 (copy), v1 (copy), l_ButtonL2_0 (copy)
    if v39 then

    end;
    local l_KeyCode_4 = v38.KeyCode;
    local l__handlerData_1 = v37._handlerData;
    if l_KeyCode_4 == l_ButtonR2_0 then
        l__handlerData_1.throttleUp = v38.Position.Z;
        v1.setThrottle(v37, l__handlerData_1.throttleUp + l__handlerData_1.throttleDown);
        return;
    elseif l_KeyCode_4 == l_ButtonL2_0 then
        l__handlerData_1.throttleDown = -v38.Position.Z;
        v1.setThrottle(v37, l__handlerData_1.throttleUp + l__handlerData_1.throttleDown);
        return;
    else
        if l_KeyCode_4 == Enum.KeyCode.Thumbstick1 then
            v1.setSteer(v37, -v38.Position.X);
        end;
        return;
    end;
end;
__2021_freeze(v2);
return v2;