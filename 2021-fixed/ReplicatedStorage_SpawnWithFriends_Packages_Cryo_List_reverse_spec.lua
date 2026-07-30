-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.reverse);
    it("should return a new table", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3
        };
        expect(v0(v1)).never.to.equal(v1);
    end);
    it("should not mutate the given table", function() --[[ Line: 10 ]]
        local v2 = {
            1, 
            2, 
            3
        };
        v0(v2);
        expect(#v2).to.equal(3);
        expect(v2[1]).to.equal(1);
        expect(v2[2]).to.equal(2);
        expect(v2[3]).to.equal(3);
    end);
    it("should contain the same elements", function() --[[ Line: 20 ]]
        local v3 = {
            "Foo", 
            "Bar"
        };
        local v4 = {
            Foo = true, 
            Bar = true
        };
        local v5 = v0(v3);
        expect(#v5).to.equal(2);
        for _, v7 in ipairs(v5) do
            expect(v4[v7]).to.equal(true);
        end;
    end);
    it("should reverse the list", function() --[[ Line: 37 ]]
        local v8 = v0({
            1, 
            2, 
            3, 
            4
        });
        expect(v8[1]).to.equal(4);
        expect(v8[2]).to.equal(3);
        expect(v8[3]).to.equal(2);
        expect(v8[4]).to.equal(1);
    end);
end;