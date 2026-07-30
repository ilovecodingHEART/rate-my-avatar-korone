-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.keys);
    local v1 = require(script.Parent.Parent.None);
    it("should not mutate the given table", function() --[[ Line: 5 ]]
        local v2 = {
            Foo = "FooValue", 
            Bar = "BarValue"
        };
        local v3 = {
            Foo = "FooValue", 
            Bar = "BarValue"
        };
        v0(v2);
        for v4, v5 in pairs(v2) do
            expect(v3[v4]).to.equal(v5);
        end;
        for v6, v7 in pairs(v3) do
            expect(v2[v6]).to.equal(v7);
        end;
    end);
    it("should return the correct keys", function() --[[ Line: 25 ]]
        local v8 = {
            Foo = "FooValue", 
            Bar = "BarValue", 
            Test = "TestValue"
        };
        local v9 = {
            Foo = 1, 
            Bar = 1, 
            Test = 1
        };
        local v10 = v0(v8);
        expect(#v10).to.equal(3);
        for _, v12 in ipairs(v10) do
            expect(v9[v12]).never.to.equal(nil);
            v9[v12] = v9[v12] - 1;
        end;
        for _, v14 in pairs(v9) do
            expect(v14).to.equal(0);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 48 ]]
        local v15 = v0({});
        expect(next(v15)).to.equal(nil);
    end);
    it("should contain a None element if there is a None key in the dictionary", function() --[[ Line: 54 ]]
        local v16 = {
            [v1] = "Foo", 
            Bar = "BarValue"
        };
        local v17 = {
            [v1] = 1, 
            Bar = 1
        };
        local v18 = v0(v16);
        expect(#v18).to.equal(2);
        for _, v20 in ipairs(v18) do
            expect(v17[v20]).never.to.equal(nil);
            v17[v20] = v17[v20] - 1;
        end;
        for _, v22 in pairs(v17) do
            expect(v22).to.equal(0);
        end;
    end);
end;