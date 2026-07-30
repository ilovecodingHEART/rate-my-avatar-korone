-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
local v1 = require(script.Parent.Parent.Controller);
return {
    setThrottle = function(v2, v3) --[[ Line: 38 ]] --[[ Name: setThrottle ]]
        v2._throttle = v3;
        if v2._jetpack then
            v1.safeSetThrottle(v2._jetpack, v3);
        end;
    end
};