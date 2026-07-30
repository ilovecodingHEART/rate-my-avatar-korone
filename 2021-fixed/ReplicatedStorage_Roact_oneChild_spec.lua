-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createElement);
    local v1 = require(script.Parent.oneChild);
    it("should get zero children from a table", function() --[[ Line: 6 ]]
        expect(v1({})).to.equal(nil);
    end);
    it("should get exactly one child", function() --[[ Line: 12 ]]
        local v2 = v0("Frame");
        local v3 = {
            foo = v2
        };
        expect(v1(v3)).to.equal(v2);
    end);
    it("should error with more than one child", function() --[[ Line: 21 ]]
        local v4 = {
            a = v0("Frame"), 
            b = v0("Frame")
        };
        expect(function() --[[ Line: 27 ]]
            v1(v4);
        end).to.throw();
    end);
    it("should handle being passed nil", function() --[[ Line: 32 ]]
        expect(v1(nil)).to.equal(nil);
    end);
end;