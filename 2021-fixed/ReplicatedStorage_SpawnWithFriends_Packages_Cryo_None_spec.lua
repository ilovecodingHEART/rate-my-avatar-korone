-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.None);
    it("should be a userdata", function() --[[ Line: 4 ]]
        expect(v0).to.be.a("userdata");
    end);
    it("should have a nice string name", function() --[[ Line: 8 ]]
        local v1 = tostring(v0);
        expect(v1:find("^userdata: ")).never.to.be.ok();
        expect(v1:find("None")).to.be.ok();
    end);
end;