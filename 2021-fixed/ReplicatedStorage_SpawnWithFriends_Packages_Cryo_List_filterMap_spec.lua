-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.filterMap);
    it("should return a new table", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3
        };
        local v2 = v0(v1, function() --[[ Line: 6 ]] --[[ Name: callback ]]
            return 1;
        end);
        expect(v2).never.to.equal(v1);
    end);
    it("should call the callback for each element", function() --[[ Line: 14 ]]
        local v3 = {
            "foo1", 
            "foo2", 
            "foo3"
        };
        local v4 = {};
        v0(v3, function(v5, v6) --[[ Line: 21 ]] --[[ Name: callback ]]
            v4[v6] = v5;
            return v5;
        end);
        for v7, v8 in pairs(v3) do
            expect(v4[v7]).to.equal(v8);
        end;
        for v9, v10 in pairs(v4) do
            expect(v10).to.equal(v3[v9]);
        end;
    end);
    it("should correctly use the filter callback", function() --[[ Line: 36 ]]
        local v12 = v0({
            1, 
            2, 
            3, 
            4, 
            5
        }, function(v11) --[[ Line: 38 ]] --[[ Name: doubleOddOnly ]]
            if v11 % 2 == 0 then
                return nil;
            else
                return v11 * 2;
            end;
        end);
        expect(#v12).to.equal(3);
        expect(v12[1]).to.equal(2);
        expect(v12[2]).to.equal(6);
        expect(v12[3]).to.equal(10);
    end);
    it("should copy the list correctly", function() --[[ Line: 53 ]]
        local v13 = {
            1, 
            2, 
            3
        };
        local v15 = v0(v13, function(v14) --[[ Line: 55 ]] --[[ Name: copyCallback ]]
            return v14;
        end);
        expect(v15).never.to.equal(v13);
        for v16, v17 in pairs(v13) do
            expect(v15[v16]).to.equal(v17);
        end;
        for v18, v19 in pairs(v15) do
            expect(v19).to.equal(v13[v18]);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 71 ]]
        local v20 = false;
        local v21 = v0({}, function() --[[ Line: 73 ]] --[[ Name: callback ]]
            v20 = true;
            return true;
        end);
        expect(#v21).to.equal(0);
        expect(v20).to.equal(false);
    end);
    it("should remove all elements from a list when callback return always nil", function() --[[ Line: 83 ]]
        local v22 = v0({
            6, 
            2, 
            8, 
            6, 
            7
        }, function() --[[ Line: 85 ]] --[[ Name: removeAll ]]
            return nil;
        end);
        expect(#v22).to.equal(0);
    end);
end;