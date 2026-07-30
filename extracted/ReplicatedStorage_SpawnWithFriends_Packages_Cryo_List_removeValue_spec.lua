-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.removeValue);
    local v1 = require(script.Parent.Parent.None);
    it("should remove the given value", function() --[[ Line: 5 ]]
        local v2 = v0({
            1, 
            4, 
            3
        }, 4);
        expect(v2[1]).to.equal(1);
        expect(v2[2]).to.equal(3);
    end);
    it("should remove all occurences of the same given value", function() --[[ Line: 13 ]]
        local v3 = v0({
            1, 
            2, 
            2, 
            3
        }, 2);
        expect(#v3).to.equal(2);
        expect(v3[1]).to.equal(1);
        expect(v3[2]).to.equal(3);
    end);
    it("should work with an empty list", function() --[[ Line: 22 ]]
        local v4 = v0({}, 1);
        expect(v4).to.be.a("table");
        expect(#v4).to.equal(0);
    end);
    it("should work with a None element", function() --[[ Line: 29 ]]
        local v5 = {
            1, 
            2, 
            v1, 
            3
        };
        local v6 = v0(v5, 2);
        expect(#v6).to.equal(3);
        expect(v6[1]).to.equal(1);
        expect(v6[2]).to.equal(v1);
        expect(v6[3]).to.equal(3);
        local v7 = v0(v5, v1);
        expect(v7[3]).to.equal(3);
        expect(#v7).to.equal(3);
    end);
end;