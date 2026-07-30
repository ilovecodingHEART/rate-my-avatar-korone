-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Type);
    describe("of", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return nil if the value is not a table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0.of(1)).to.equal(nil);
            expect(v0.of(true)).to.equal(nil);
            expect(v0.of("test")).to.equal(nil);
            expect(v0.of(print)).to.equal(nil);
        end);
        it("should return nil if the table has no type", function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref)
            expect(v0.of({})).to.equal(nil);
        end);
        it("should return the assigned type", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                [v0] = v0.Element
            };
            expect(v0.of(v1)).to.equal(v0.Element);
        end);
    end);
end;