-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 1 ]] --[[ Name: isMotor ]]
    local v1 = tostring(v0):match("^Motor%((.+)%)$");
    if v1 then
        return true, v1;
    else
        return false;
    end;
end;