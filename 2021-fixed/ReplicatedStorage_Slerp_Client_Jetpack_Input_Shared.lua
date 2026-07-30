-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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