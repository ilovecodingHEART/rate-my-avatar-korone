-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Connected = true, 
        ParentEvent = v1, 
        ConnectionFunction = v2
    }, v0));
end;
v0.Fire = function(v3, ...) --[[ Line: 34 ]] --[[ Name: Fire ]]
    if not v3.Connected then
        return;
    else
        v3.ConnectionFunction(...);
        return;
    end;
end;
v0.Disconnect = function(v4) --[[ Line: 42 ]] --[[ Name: Disconnect ]]
    if not v4.Connected then
        return;
    else
        v4.Connected = false;
        v4.ParentEvent:Disconnected(v4);
        return;
    end;
end;
v0.Destroy = function(v5) --[[ Line: 54 ]] --[[ Name: Destroy ]]
    v5:Disconnect();
end;
return v0;