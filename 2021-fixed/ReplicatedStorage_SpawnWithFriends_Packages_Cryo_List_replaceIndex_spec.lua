-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.replaceIndex);
    it("should return a new table", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3
        };
        expect(v0(v1, 2, 0)).never.to.equal(v1);
    end);
    it("should not mutate the original list", function() --[[ Line: 10 ]]
        local v2 = {
            false, 
            "foo", 
            3
        };
        v0(v2, 2, {});
        expect(#v2).to.equal(3);
        expect(v2[1]).to.equal(false);
        expect(v2[2]).to.equal("foo");
        expect(v2[3]).to.equal(3);
    end);
    it("should replace the value at the given index", function() --[[ Line: 21 ]]
        local v3 = {
            1, 
            2, 
            3
        };
        local v4 = {};
        local v5 = v0(v3, 2, v4);
        expect(v5[1]).to.equal(1);
        expect(v5[2]).to.equal(v4);
        expect(v5[3]).to.equal(3);
        expect(next(v5[2])).to.equal(nil);
    end);
    it("should throw if the given index is higher than the list length", function() --[[ Line: 32 ]]
        local v6 = {
            1
        };
        expect(function() --[[ Line: 35 ]]
            v0(v6, #v6 + 1, {});
        end).to.throw();
    end);
    it("should be able to replace to a falsy value", function() --[[ Line: 40 ]]
        local v7 = {};
        local v8 = v0({
            v7, 
            false, 
            "value", 
            true
        }, 3, false);
        expect(v8[1]).to.equal(v7);
        expect(v8[2]).to.equal(false);
        expect(v8[3]).to.equal(false);
        expect(v8[4]).to.equal(true);
    end);
end;