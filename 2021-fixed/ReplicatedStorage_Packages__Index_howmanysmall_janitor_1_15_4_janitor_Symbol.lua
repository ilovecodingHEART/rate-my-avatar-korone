-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 2 ]] --[[ Name: Symbol ]]
    local v1 = newproxy(true);
    getmetatable(v1).__tostring = function() --[[ Line: 5 ]] --[[ Name: __tostring ]]
        return v0;
    end;
    return v1;
end;