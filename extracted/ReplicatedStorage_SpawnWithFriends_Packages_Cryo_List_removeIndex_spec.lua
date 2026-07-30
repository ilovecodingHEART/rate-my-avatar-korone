-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.removeIndex);
    local v1 = require(script.Parent.Parent.None);
    it("should remove the element at the given index", function() --[[ Line: 5 ]]
        local v2 = v0({
            "first", 
            "second", 
            "third"
        }, 2);
        expect(#v2).to.equal(2);
        expect(v2[1]).to.equal("first");
        expect(v2[2]).to.equal("third");
    end);
    it("should not remove any element if index is out of bound", function() --[[ Line: 19 ]]
        local v3 = {
            "first", 
            "second", 
            "third"
        };
        local v4 = v0(v3, 4);
        expect(#v4).to.equal(#v3);
        for v5 = 1, #v3 do
            expect(v4[v5]).to.equal(v3[v5]);
        end;
        local v6 = v0(v3, -2);
        expect(#v6).to.equal(#v3);
        for v7 = 1, #v3 do
            expect(v6[v7]).to.equal(v3[v7]);
        end;
    end);
    it("should work with a None element", function() --[[ Line: 40 ]]
        local v8 = v0({
            "first", 
            v1, 
            "third"
        }, 1);
        expect(#v8).to.equal(2);
        expect(v8[1]).to.equal(v1);
        expect(v8[2]).to.equal("third");
    end);
end;