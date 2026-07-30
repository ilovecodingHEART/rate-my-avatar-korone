-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Controller);
return {
    setThrottle = function(v4, v5) --[[ Line: 6 ]] --[[ Name: setThrottle ]]
        local v6 = v4._car and v4._car.initialized;
        if not v6 then
            return;
        else
            v6.throttle = v5;
            return;
        end;
    end, 
    setSteer = function(v7, v8) --[[ Line: 15 ]] --[[ Name: setSteer ]]
        local v9 = v7._car and v7._car.initialized;
        if not v9 then
            return;
        else
            v9.steer = v8;
            return;
        end;
    end, 
    setHandbrakeIsEngaged = function(v10, v11) --[[ Line: 24 ]] --[[ Name: setHandbrakeIsEngaged ]]
        local v12 = v10._car and v10._car.initialized;
        if not v12 then
            return;
        else
            v12.isHandbrakeEngaged = v11;
            return;
        end;
    end, 
    flip = function(v13) --[[ Line: 33 ]] --[[ Name: flip ]]
        -- upvalues: v3 (copy)
        if v13._car then
            v3.makeUpright(v13._car);
        end;
    end, 
    toggleLights = function(v14) --[[ Line: 39 ]] --[[ Name: toggleLights ]]
        -- upvalues: v1 (copy)
        if v14._car then
            v1.setOwnedCarLightsAreEnabled(not v14._car.shared.lightsAreEnabled);
        end;
    end, 
    THROTTLE_FORWARD = 1, 
    THROTTLE_BACKWARD = -1, 
    STEER_LEFT = 1, 
    STEER_RIGHT = -1
};