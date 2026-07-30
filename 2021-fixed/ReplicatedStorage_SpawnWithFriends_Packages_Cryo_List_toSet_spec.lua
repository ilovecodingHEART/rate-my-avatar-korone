-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.toSet);
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
            "a", 
            "b", 
            "c"
        };
        v0(v2);
        for v3, v4 in pairs(v2) do
            if v3 == 1 then
                expect(v4).to.equal("a");
            elseif v3 == 2 then
                expect(v4).to.equal("b");
            elseif v3 == 3 then
                expect(v4).to.equal("c");
            else
                error("Extra key was added to table a");
            end;
        end;
    end);
    it("should have every value in a as a key mapped to true in b", function() --[[ Line: 27 ]]
        local v5 = v0({
            1, 
            2, 
            3, 
            "a", 
            "b", 
            "c"
        });
        expect(#v5).to.equal(3);
        expect(v5[1]).to.equal(true);
        expect(v5[2]).to.equal(true);
        expect(v5[3]).to.equal(true);
        expect(v5[4]).to.equal(nil);
        expect(v5.a).to.equal(true);
        expect(v5.b).to.equal(true);
        expect(v5.c).to.equal(true);
    end);
end;