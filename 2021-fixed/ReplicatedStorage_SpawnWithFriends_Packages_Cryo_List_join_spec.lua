-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.join);
    local v1 = require(script.Parent.Parent.None);
    it("should return a new table", function() --[[ Line: 5 ]]
        local v2 = {};
        expect(v0(v2)).never.to.equal(v2);
    end);
    it("should remove elements equal to None", function() --[[ Line: 11 ]]
        local v3 = v0({
            "foo-a"
        }, {
            v1, 
            "foo-b"
        });
        expect(v3[1]).to.equal("foo-a");
        expect(v3[2]).to.equal("foo-b");
        expect(v3[3]).to.equal(nil);
    end);
    it("should accept arbitrary numbers of tables", function() --[[ Line: 28 ]]
        local v4 = v0({
            1
        }, {
            2
        }, {
            3
        });
        expect(#v4).to.equal(3);
        expect(v4[1]).to.equal(1);
        expect(v4[2]).to.equal(2);
        expect(v4[3]).to.equal(3);
    end);
    it("should accept zero tables", function() --[[ Line: 41 ]]
        expect(v0()).to.be.a("table");
    end);
end;