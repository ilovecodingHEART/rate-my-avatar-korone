-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.EventName = "";
    v1.PlayClient = false;
    v1.PlayServer = false;
    v1.IsServerInit = false;
    v1.IsClientInit = {};
    v1.IsPlaying = false;
    v1.Finished = true;
    v1.DidPrePlay = false;
    v1.FinishedBinds = {};
    v1.MapPositions = nil;
    return v1;
end;
return v0;