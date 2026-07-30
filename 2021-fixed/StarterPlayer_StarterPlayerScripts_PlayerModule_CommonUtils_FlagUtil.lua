-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    getUserFlag = function(v0) --[[ Line: 11 ]] --[[ Name: getUserFlag ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
            return UserSettings():IsUserFeatureEnabled(v0);
        end);
        return l_status_0 and l_result_0;
    end
};