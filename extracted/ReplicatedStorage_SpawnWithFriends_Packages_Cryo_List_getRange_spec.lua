-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.getRange);
    it("should return the correct range", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3, 
            4
        };
        local v2 = v0(v1, 2, 3);
        expect(v2[1]).to.equal(2);
        expect(v2[2]).to.equal(3);
        expect(#v2).to.equal(2);
        local v3 = v0(v1, 4, 4);
        expect(#v3).to.equal(1);
        expect(v3[1]).to.equal(4);
    end);
    it("should throw when the start index is higher than the end index", function() --[[ Line: 17 ]]
        local v4 = {
            5, 
            8, 
            7, 
            2, 
            3, 
            7
        };
        expect(function() --[[ Line: 20 ]]
            v0(v4, 4, 1);
        end).to.throw();
    end);
    it("should copy the table", function() --[[ Line: 25 ]]
        local v5 = {
            6, 
            8, 
            1, 
            3, 
            7, 
            2
        };
        local v6 = v0(v5, 1, #v5);
        for v7, v8 in pairs(v5) do
            expect(v6[v7]).to.equal(v8);
        end;
        for v9, v10 in pairs(v6) do
            expect(v10).to.equal(v5[v9]);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 38 ]]
        local v11 = v0({}, 1, 5);
        expect(v11).to.be.a("table");
        expect(#v11).to.equal(0);
    end);
    it("should work when the start index is smaller that 1", function() --[[ Line: 45 ]]
        local v12 = v0({
            1, 
            2, 
            3, 
            4
        }, -2, 2);
        expect(#v12).to.equal(2);
        expect(v12[1]).to.equal(1);
        expect(v12[2]).to.equal(2);
    end);
    it("should work when the end index is larger that the list length", function() --[[ Line: 54 ]]
        local v13 = v0({
            1, 
            2, 
            3, 
            4
        }, 3, 18);
        expect(#v13).to.equal(2);
        expect(v13[1]).to.equal(3);
        expect(v13[2]).to.equal(4);
    end);
end;