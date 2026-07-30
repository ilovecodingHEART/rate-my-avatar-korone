-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.join);
    local v1 = require(script.Parent.Parent.None);
    it("should return a new table", function() --[[ Line: 5 ]]
        local v2 = {};
        expect(v0(v2)).never.to.equal(v2);
    end);
    it("should merge tables, overwriting previous values", function() --[[ Line: 11 ]]
        local v3 = {
            foo = "foo-a", 
            bar = "bar-a"
        };
        local v4 = {
            foo = "foo-b", 
            baz = "baz-b"
        };
        local v5 = v0(v3, v4);
        expect(v5.foo).to.equal(v4.foo);
        expect(v5.bar).to.equal(v3.bar);
        expect(v5.baz).to.equal(v4.baz);
    end);
    it("should remove values set to None", function() --[[ Line: 29 ]]
        local v6 = {
            foo = "foo-a"
        };
        local v7 = {
            foo = v1
        };
        local v8 = v0(v6, v7);
        expect(v8.foo).to.equal(nil);
    end);
    it("should not mutate passed in tables", function() --[[ Line: 43 ]]
        local v9 = 0;
        local v10 = 0;
        local v11 = {};
        local v12 = {
            foo = "foo-b"
        };
        setmetatable(v11, {
            __newindex = function() --[[ Line: 53 ]] --[[ Name: __newindex ]]
                v9 = v9 + 1;
            end
        });
        setmetatable(v12, {
            __newindex = function() --[[ Line: 59 ]] --[[ Name: __newindex ]]
                v10 = v10 + 1;
            end
        });
        v0(v11, v12);
        expect(v9).to.equal(0);
        expect(v10).to.equal(0);
        expect(v12.foo).to.equal("foo-b");
    end);
    it("should accept arbitrary numbers of tables", function() --[[ Line: 71 ]]
        local v13 = {
            foo = "foo-a"
        };
        local v14 = {
            bar = "bar-b"
        };
        local v15 = {
            baz = "baz-c"
        };
        local v16 = v0(v13, v14, v15);
        expect(v16.foo).to.equal(v13.foo);
        expect(v16.bar).to.equal(v14.bar);
        expect(v16.baz).to.equal(v15.baz);
    end);
    it("should accept zero tables", function() --[[ Line: 91 ]]
        expect(v0()).to.be.a("table");
    end);
end;