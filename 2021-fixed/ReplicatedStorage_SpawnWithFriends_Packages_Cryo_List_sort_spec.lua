-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.sort);
    it("should return a new table", function() --[[ Line: 4 ]]
        local v1 = {};
        expect(v0(v1)).never.to.equal(v1);
    end);
    it("should not mutate the given table", function() --[[ Line: 10 ]]
        local v2 = {
            77, 
            "foo", 
            2
        };
        v0(v2, function(v3, v4) --[[ Line: 12 ]] --[[ Name: order ]]
            return tostring(v3) < tostring(v4);
        end);
        expect(#v2).to.equal(3);
        expect(v2[1]).to.equal(77);
        expect(v2[2]).to.equal("foo");
        expect(v2[3]).to.equal(2);
    end);
    it("should contain the same elements from the given table", function() --[[ Line: 23 ]]
        local v5 = {
            "Foo", 
            "Bar", 
            "Test"
        };
        local v6 = {
            Foo = true, 
            Bar = true, 
            Test = true
        };
        local v7 = v0(v5);
        expect(#v7).to.equal(3);
        for _, v9 in ipairs(v7) do
            expect(v6[v9]).to.equal(true);
        end;
    end);
    it("should sort with the default table.sort when no callback is given", function() --[[ Line: 42 ]]
        local v10 = {
            4, 
            2, 
            5, 
            3, 
            1
        };
        local v11 = v0(v10);
        table.sort(v10);
        expect(#v11).to.equal(#v10);
        for v12 = 1, #v10 do
            expect(v11[v12]).to.equal(v10[v12]);
        end;
    end);
    it("should sort with the given callback", function() --[[ Line: 54 ]]
        local v13 = {
            1, 
            2, 
            5, 
            3, 
            4
        };
        local function v16(v14, v15) --[[ Line: 56 ]] --[[ Name: order ]]
            return v15 < v14;
        end;
        local v17 = v0(v13, v16);
        table.sort(v13, v16);
        expect(#v17).to.equal(#v13);
        for v18 = 1, #v13 do
            expect(v17[v18]).to.equal(v13[v18]);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 69 ]]
        local v19 = v0({});
        expect(#v19).to.equal(0);
    end);
end;