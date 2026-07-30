-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.findWhere);
    it("should return the correct index", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            5, 
            10, 
            7
        };
        local function v3(v2) --[[ Line: 6 ]]
            return v2 % 2 == 0;
        end;
        local function v5(v4) --[[ Line: 10 ]]
            return v4 % 2 == 1;
        end;
        expect(v0(v1, v3)).to.equal(3);
        expect(v0(v1, v5)).to.equal(1);
    end);
    it("should work with an empty table", function() --[[ Line: 18 ]]
        expect(v0({}, function() --[[ Line: 19 ]]
            return true;
        end)).to.equal(nil);
    end);
    it("should return nil when the when no value satisfies the predicate", function() --[[ Line: 25 ]]
        expect(v0({
            1, 
            2, 
            3
        }, function(v6) --[[ Line: 27 ]]
            return v6 == 4;
        end)).to.equal(nil);
    end);
    it("should return the index of the first value for which the predicate is true", function() --[[ Line: 34 ]]
        expect(v0({
            1, 
            1, 
            1, 
            2, 
            2
        }, function(v7) --[[ Line: 37 ]]
            return v7 == 2;
        end)).to.equal(4);
    end);
    it("should allow access to table index in the predicate function", function() --[[ Line: 44 ]]
        expect(v0({
            5, 
            4, 
            3, 
            2, 
            1
        }, function(_, v9) --[[ Line: 47 ]]
            return v9 == 4;
        end)).to.equal(4);
    end);
    it("should allow access to both value and index in the predicate function", function() --[[ Line: 54 ]]
        expect(v0({
            1, 
            1, 
            2, 
            2, 
            1
        }, function(v10, v11) --[[ Line: 57 ]]
            return v10 + v11 == 5;
        end)).to.equal(3);
    end);
end;