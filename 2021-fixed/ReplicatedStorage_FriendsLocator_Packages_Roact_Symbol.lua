-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    named = function(v0) --[[ Line: 17 ]] --[[ Name: named ]]
        assert(type(v0) == "string", "Symbols must be created using a string name!");
        local v1 = newproxy(true);
        local v2 = ("Symbol(%s)"):format(v0);
        getmetatable(v1).__tostring = function() --[[ Line: 24 ]]
            return v2;
        end;
        return v1;
    end
};