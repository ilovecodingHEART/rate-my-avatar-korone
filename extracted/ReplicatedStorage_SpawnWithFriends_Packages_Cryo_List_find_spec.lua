-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.find);
    it("should return the correct index", function() --[[ Line: 4 ]]
        local v1 = {
            5, 
            4, 
            3, 
            2, 
            1
        };
        expect(v0(v1, 1)).to.equal(5);
        expect(v0(v1, 2)).to.equal(4);
        expect(v0(v1, 3)).to.equal(3);
        expect(v0(v1, 4)).to.equal(2);
        expect(v0(v1, 5)).to.equal(1);
    end);
    it("should work with an empty table", function() --[[ Line: 14 ]]
        expect(v0({}, 1)).to.equal(nil);
    end);
    it("should return nil when the given value is not found", function() --[[ Line: 18 ]]
        local v2 = {
            1, 
            2, 
            3
        };
        expect(v0(v2, 4)).to.equal(nil);
        expect((type(v0(v2, 4)))).to.equal("nil");
    end);
    it("should return the index of the first value found", function() --[[ Line: 25 ]]
        expect(v0({
            1, 
            2, 
            2
        }, 2)).to.equal(2);
    end);
end;