-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.values);
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
    it("should return the correct values", function() --[[ Line: 25 ]]
        local v8 = {
            Foo = "FooValue", 
            Bar = "BarValue", 
            Test = "TestValue"
        };
        local v9 = {
            FooValue = 1, 
            BarValue = 1, 
            TestValue = 1
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
    it("should return duplicates if two values are the same", function() --[[ Line: 48 ]]
        local v15 = {
            Foo = "FooValue", 
            Bar = "BarValue", 
            Test = "FooValue"
        };
        local v16 = {
            FooValue = 2, 
            BarValue = 1
        };
        local v17 = v0(v15);
        expect(#v17).to.equal(3);
        for _, v19 in ipairs(v17) do
            expect(v16[v19]).never.to.equal(nil);
            v16[v19] = v16[v19] - 1;
        end;
        for _, v21 in pairs(v16) do
            expect(v21).to.equal(0);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 70 ]]
        local v22 = v0({});
        expect(next(v22)).to.equal(nil);
    end);
    it("should contain a None element if there is a None value in the dictionary", function() --[[ Line: 76 ]]
        local v23 = {
            Foo = v1, 
            Bar = "BarValue"
        };
        local v24 = {
            [v1] = 1, 
            BarValue = 1
        };
        local v25 = v0(v23);
        expect(#v25).to.equal(2);
        for _, v27 in ipairs(v25) do
            expect(v24[v27]).never.to.equal(nil);
            v24[v27] = v24[v27] - 1;
        end;
        for _, v29 in pairs(v24) do
            expect(v29).to.equal(0);
        end;
    end);
end;