-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.GlobalConfig);
    it("should have the correct methods", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        expect(v0).to.be.ok();
        expect(v0.set).to.be.ok();
        expect(v0.get).to.be.ok();
    end);
end;