-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.removeRange);
    local v1 = require(script.Parent.Parent.None);
    it("should remove elements properly", function() --[[ Line: 5 ]]
        local v2 = v0({
            1, 
            2, 
            3
        }, 2, 2);
        expect(#v2).to.equal(2);
        expect(v2[1]).to.equal(1);
        expect(v2[2]).to.equal(3);
        local v3 = {
            1, 
            2, 
            3, 
            4, 
            5, 
            6
        };
        local v4 = v0(v3, 1, 4);
        expect(#v4).to.equal(2);
        expect(v4[1]).to.equal(5);
        expect(v4[2]).to.equal(6);
        local v5 = v0(v3, 2, 5);
        expect(#v5).to.equal(2);
        expect(v5[1]).to.equal(1);
        expect(v5[2]).to.equal(6);
    end);
    it("should throw when the start index is higher than the end index", function() --[[ Line: 27 ]]
        local v6 = {
            1, 
            2, 
            3
        };
        expect(function() --[[ Line: 30 ]]
            v0(v6, 2, 0);
        end).to.throw();
        expect(function() --[[ Line: 34 ]]
            v0(v6, 1, -1);
        end).to.throw();
    end);
    it("should copy the table when then indexes are higher than the list length", function() --[[ Line: 39 ]]
        local v7 = v0({
            1, 
            2, 
            3
        }, 4, 7);
        expect(#v7).to.equal(3);
        expect(v7[1]).to.equal(1);
        expect(v7[2]).to.equal(2);
        expect(v7[3]).to.equal(3);
    end);
    it("should work when the start index is smaller than 1", function() --[[ Line: 49 ]]
        local v8 = v0({
            1, 
            2, 
            3, 
            4
        }, -5, 2);
        expect(#v8).to.equal(2);
        expect(v8[1]).to.equal(3);
        expect(v8[2]).to.equal(4);
    end);
    it("should work when the end index is greater than the list length", function() --[[ Line: 58 ]]
        local v9 = v0({
            1, 
            2, 
            3, 
            4
        }, 3, 8);
        expect(#v9).to.equal(2);
        expect(v9[1]).to.equal(1);
        expect(v9[2]).to.equal(2);
    end);
    it("should work with a None element", function() --[[ Line: 67 ]]
        local v10 = v0({
            1, 
            v1, 
            3
        }, 1, 1);
        expect(#v10).to.equal(2);
        expect(v10[1]).to.equal(v1);
        expect(v10[2]).to.equal(3);
    end);
end;