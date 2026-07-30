-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Symbol);
    describe("named", function() --[[ Line: 4 ]]
        it("should give an opaque object", function() --[[ Line: 5 ]]
            local v1 = v0.named("foo");
            expect(v1).to.be.a("userdata");
        end);
        it("should coerce to the given name", function() --[[ Line: 11 ]]
            local v2 = v0.named("foo");
            expect(tostring(v2):find("foo")).to.be.ok();
        end);
        it("should be unique when constructed", function() --[[ Line: 17 ]]
            local v3 = v0.named("abc");
            local v4 = v0.named("abc");
            expect(v3).never.to.equal(v4);
        end);
    end);
end;