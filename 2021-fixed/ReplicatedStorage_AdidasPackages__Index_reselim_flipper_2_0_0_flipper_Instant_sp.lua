-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Instant);
    it("should return a completed state with the provided value", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(1.23):step(0.1, {
            value = 0, 
            complete = false
        });
        expect(v1.complete).to.equal(true);
        expect(v1.value).to.equal(1.23);
    end);
end;